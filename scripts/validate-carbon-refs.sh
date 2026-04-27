#!/bin/bash
# validate-carbon-refs.sh — validates Carbon reference files match required structure
# Usage: ./scripts/validate-carbon-refs.sh [path-to-ibm-folder]
# Exit 0 = all checks pass, exit 1 = any check fails

set -u

IBM_DIR="${1:-skills/pixel-council/references/ibm}"
FAIL=0
CHECKED=0

if [ ! -d "$IBM_DIR" ]; then
  echo "ERROR: IBM directory not found: $IBM_DIR"
  exit 1
fi

check_file() {
  local file="$1"
  local kind="$2" # "overview" | "page-level" | "component"
  local errors=""

  # Required: YAML frontmatter at top
  if ! head -1 "$file" | grep -q '^---$'; then
    errors+="  - missing YAML frontmatter opener\n"
  fi
  if ! awk '/^---$/{c++} c==2{print; exit}' "$file" | grep -q '^---$'; then
    errors+="  - missing YAML frontmatter closer\n"
  fi

  # Required: name + description in frontmatter
  if ! sed -n '/^---$/,/^---$/p' "$file" | grep -q '^name:'; then
    errors+="  - missing 'name:' in frontmatter\n"
  fi
  if ! sed -n '/^---$/,/^---$/p' "$file" | grep -q '^description:'; then
    errors+="  - missing 'description:' in frontmatter\n"
  fi

  # Required: H1 with "IBM Carbon" attribution
  if ! grep -q '^# .* -- IBM Carbon' "$file"; then
    errors+="  - missing H1 with '-- IBM Carbon' attribution\n"
  fi

  # Required: Source link to carbondesignsystem.com or carbon-design-system github
  if ! grep -qE 'carbondesignsystem\.com|carbon-design-system' "$file"; then
    errors+="  - missing carbondesignsystem.com or carbon-design-system source link\n"
  fi

  # Forbidden: placeholders (TODO excluded — Carbon's verbatim source contains legit TODO comments)
  for word in "TBD" "FIXME" "XXX" "PLACEHOLDER"; do
    if grep -q "$word" "$file"; then
      errors+="  - contains forbidden placeholder: $word\n"
    fi
  done

  # Component-specific checks
  if [ "$kind" = "component" ]; then
    if ! grep -q '^## Quick Reference' "$file"; then
      errors+="  - missing '## Quick Reference' section\n"
    fi
    if ! grep -q '^## Variants' "$file"; then
      errors+="  - missing '## Variants' section\n"
    fi
    # Required: Storybook React source section (revision 2026-04-26)
    if ! grep -qE '^## React' "$file"; then
      errors+="  - missing '## React (verbatim from Storybook)' section\n"
    fi
    # Required: Storybook WC source section
    if ! grep -qE '^## Web Components' "$file"; then
      errors+="  - missing '## Web Components (verbatim from Storybook)' section\n"
    fi
    # Required: Plain HTML section (derived from WC)
    if ! grep -qE '^## Plain HTML' "$file"; then
      errors+="  - missing '## Plain HTML' section\n"
    fi
    if ! grep -q '^## Design Tokens' "$file"; then
      errors+="  - missing '## Design Tokens' section\n"
    fi
    if ! grep -qE '^## States' "$file"; then
      errors+="  - missing '## States' section\n"
    fi
    if ! grep -q '^## Accessibility' "$file"; then
      errors+="  - missing '## Accessibility' section\n"
    fi
    # Carbon shape rule: every component should mention border-radius
    if ! grep -q 'border-radius' "$file"; then
      errors+="  - no border-radius reference (Carbon's sharp-corner rule must be explicit)\n"
    fi
    # Required: at least one CSS hex value (token block must have literals)
    if ! grep -qE '#[0-9a-fA-F]{6}' "$file"; then
      errors+="  - no hex color values found (tokens must be literal hex)\n"
    fi
    # Required: at least one Carbon class name (cds--*) or custom element (<cds-*>)
    if ! grep -qE 'cds--|<cds-' "$file"; then
      errors+="  - no Carbon class names (cds--*) or elements (<cds-*>) found — Storybook source likely missing\n"
    fi
    # Required: at least one verbatim story export name
    if ! grep -qE '(Default|Primary|Secondary|Tertiary|Skeleton|Inline|Toast)' "$file"; then
      errors+="  - no story variant names (Default/Primary/Secondary/etc.) found\n"
    fi
    # Line length range — Carbon files are larger because of verbatim source
    local lines
    lines=$(wc -l < "$file")
    if [ "$lines" -lt 250 ]; then
      errors+="  - file is $lines lines (under 250 = Storybook source likely missing)\n"
    fi
    if [ "$lines" -gt 3500 ]; then
      errors+="  - file is $lines lines (over 3500 = consider splitting)\n"
    fi
  fi

  CHECKED=$((CHECKED + 1))
  if [ -n "$errors" ]; then
    echo "FAIL: $file"
    printf '%b' "$errors"
    FAIL=$((FAIL + 1))
  fi
}

# Top-level reference files
for f in overview.md icons.md pictograms.md editorial-type.md page-patterns.md; do
  if [ -f "$IBM_DIR/$f" ]; then
    if [ "$f" = "overview.md" ]; then
      check_file "$IBM_DIR/$f" "overview"
    else
      check_file "$IBM_DIR/$f" "page-level"
    fi
  else
    echo "MISSING: $IBM_DIR/$f"
    FAIL=$((FAIL + 1))
  fi
done

# Component files
if [ -d "$IBM_DIR/components" ]; then
  for f in "$IBM_DIR/components"/*.md; do
    [ -f "$f" ] && check_file "$f" "component"
  done
fi

echo ""
echo "Checked: $CHECKED files | Failed: $FAIL"
[ "$FAIL" -eq 0 ] && exit 0 || exit 1
