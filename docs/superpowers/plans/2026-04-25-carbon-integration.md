# Carbon Design System Integration — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add IBM Carbon Design System as a third selectable design system in pixel-council (alongside Google M3 and Apple HIG), with depth/quality matching the existing systems.

**Architecture:** Author content-only reference files following the existing `references/{system}/` pattern. Each component file is a self-contained spec (12 sections, 350-600 lines) the agent reads directly. **Critical revision (2026-04-26):** every component file embeds the **verbatim Storybook source code** for both React (`{Component}.stories.js`) and Web Components (`{component}.stories.ts`) — NOT paraphrased recreations. The agent must output Carbon's actual code, not approximations.

**Tech Stack:** Markdown content authoring. Bash for verification scripts. No application code. Existing project layout under `skills/pixel-council/references/`.

**Source spec:** `docs/superpowers/specs/2026-04-25-carbon-integration-design.md` — read this first if you lack context. The 2026-04-26 revision section at the top is mandatory reading.

**Storybook source URLs** (per component, replace `{Name}` PascalCase / `{name}` kebab-case):
- React stories (verbatim source): `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/{Name}/{Name}.stories.js`
- WC stories (verbatim source): `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.stories.ts`
- WC SCSS (for state values): `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.scss`
- Storybook live (visual reference, not for scraping): `https://react.carbondesignsystem.com/?path=/story/components-{name}--default` and `https://web-components.carbondesignsystem.com/?path=/story/components-{name}--default`

---

## File Structure

**New files (43 total):**

```
skills/pixel-council/references/ibm/
├── overview.md                        # Phase 1
├── icons.md                           # Phase 2
├── pictograms.md                      # Phase 2
├── editorial-type.md                  # Phase 2
├── page-patterns.md                   # Phase 2
└── components/                        # Phases 3-5
    ├── button.md                      # Phase 3
    ├── checkbox.md
    ├── radio-button.md
    ├── toggle.md
    ├── text-input.md
    ├── text-area.md
    ├── number-input.md
    ├── search.md
    ├── select.md
    ├── dropdown.md
    ├── multi-select.md
    ├── combo-box.md
    ├── date-picker.md
    ├── time-picker.md
    ├── slider.md
    ├── link.md
    ├── accordion.md
    ├── breadcrumb.md
    ├── tabs.md
    ├── modal.md                       # end Phase 3 (20 files)
    ├── data-table.md                  # Phase 4
    ├── tile.md
    ├── tree-view.md
    ├── structured-list.md
    ├── contained-list.md
    ├── content-switcher.md
    ├── fluid-form.md
    ├── progress-indicator.md
    ├── code-snippet.md
    ├── file-uploader.md
    ├── notification.md
    ├── overflow-menu.md
    ├── popover.md
    ├── pagination.md
    ├── tag.md                         # end Phase 4 (15 files)
    ├── ai-label.md                    # Phase 5
    ├── ui-shell.md
    └── page-header.md                 # end Phase 5 (3 files)

scripts/
└── validate-carbon-refs.sh           # Phase 0 — validation tooling
```

**Modified files (4 total):**

```
skills/pixel-council/SKILL.md          # Phase 6 — detection, mapping, polish, page rules
.claude-plugin/plugin.json             # Phase 7 — description mentions Carbon
README.md                              # Phase 7 — Carbon in supported systems list
CLAUDE.md                              # Phase 7 — project structure diagram + counts
```

**File responsibility split:**

- `overview.md` — token foundation only (colors, themes, type, motion, spacing, grid, shape rules). NO component-specific values.
- `icons.md` / `pictograms.md` — asset systems only (CDN, sizing, embedded SVG library).
- `editorial-type.md` — marketing/expressive type scale only (separate from `overview.md`'s productive scale).
- `page-patterns.md` — page-level composition only (heroes, sections, app shell, dashboard layouts). NO component internals.
- `components/*.md` — one file per component, self-contained, follows the 12-section template.
- `validate-carbon-refs.sh` — checks frontmatter, required sections, no placeholder strings, hex value presence. Used in Phase 8 verification.

---

## Authoring conventions (apply to every file)

1. **YAML frontmatter at top:** `name`, `description`, `metadata.tags`. Match existing apple/google file format exactly.
2. **H1 source attribution:** `# {Component} -- IBM Carbon Design System` followed by `> Source: [v11.carbondesignsystem.com/components/{name}](URL)`
3. **CSS prefix for tokens:** `--cds-*` (matches Carbon's official `cds--` Sass prefix, dehyphenated for CSS custom properties).
4. **Hex values are literal:** never write `var(--something)` where a hex belongs. The agent must be able to copy hex values without resolving references.
5. **Sharp corners:** every component Quick Reference table shows `border-radius: 0` unless the component is in the documented exception list (Tag/Tooltip/Popover = 2px).
6. **Both light AND dark tokens:** every component file includes White (light primary) and G100 (dark primary) values. G10 / G90 are mentioned but not duplicated in component files.
7. **Sections in order:** YAML → H1+source → Quick Reference table → Design Tokens (CSS) → Variants table → HTML Structure → Complete CSS → States Reference table → Animation/Motion → Accessibility → Responsive → Do/Don't tables.
8. **Line-length target:** 250-450 lines per component file. Under 250 = thin, over 450 = needs splitting.

---

## Source-of-truth references (use these URLs when authoring)

| Need | URL |
|---|---|
| Component list | `https://v11.carbondesignsystem.com/components/overview/` |
| Component spec | `https://v11.carbondesignsystem.com/components/{Name}/usage/` |
| Component code | `https://v11.carbondesignsystem.com/components/{Name}/code/` |
| Color tokens | `https://unpkg.com/@carbon/colors/lib/index.js` |
| Motion tokens | `https://unpkg.com/@carbon/motion/lib/index.js` |
| Type tokens | `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/type/src/styles.js` |
| Theme tokens | `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/themes/src/{white,g10,g90,g100}.js` |
| Icons inventory | `https://github.com/carbon-design-system/carbon/tree/main/packages/icons/src/svg/{16,20,24,32}` |
| Pictograms | `https://github.com/carbon-design-system/carbon/tree/main/packages/pictograms/src/svg` |
| 2x grid | `https://carbondesignsystem.com/elements/2x-grid/usage/` |

---

## Phase 0: Tooling and verification script

This phase produces the validation script used after each phase. Doing it first lets every later phase verify itself.

### Task 0.1: Create the validation script

**Files:**
- Create: `scripts/validate-carbon-refs.sh`

- [ ] **Step 1: Create the script**

Write this exact content to `scripts/validate-carbon-refs.sh`:

```bash
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

  # Required: Source link to carbondesignsystem.com
  if ! grep -q 'carbondesignsystem.com' "$file"; then
    errors+="  - missing carbondesignsystem.com source link\n"
  fi

  # Forbidden: placeholders
  for word in "TBD" "TODO" "FIXME" "XXX" "PLACEHOLDER"; do
    if grep -q "$word" "$file"; then
      errors+="  - contains forbidden placeholder: $word\n"
    fi
  done

  # Component-specific checks
  if [ "$kind" = "component" ]; then
    if ! grep -q '^## Quick Reference' "$file"; then
      errors+="  - missing '## Quick Reference' section\n"
    fi
    if ! grep -q '^## Design Tokens' "$file"; then
      errors+="  - missing '## Design Tokens' section\n"
    fi
    if ! grep -q '^## HTML Structure' "$file"; then
      errors+="  - missing '## HTML Structure' section\n"
    fi
    if ! grep -q '^## Complete CSS\|^## CSS' "$file"; then
      errors+="  - missing '## Complete CSS' / '## CSS' section\n"
    fi
    if ! grep -q '^## States\|^## State' "$file"; then
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
    # Required: --cds- prefix used at least once
    if ! grep -q '\-\-cds\-' "$file"; then
      errors+="  - no --cds- CSS custom property prefix found\n"
    fi
    # Required: Storybook React source section (revision 2026-04-26)
    if ! grep -q '^## React.*Storybook\|^## React source' "$file"; then
      errors+="  - missing '## React (verbatim from Storybook)' section\n"
    fi
    # Required: Storybook WC source section
    if ! grep -q '^## Web Components.*Storybook\|^## Web Components source' "$file"; then
      errors+="  - missing '## Web Components (verbatim from Storybook)' section\n"
    fi
    # Required: Plain HTML section (derived from WC)
    if ! grep -q '^## Plain HTML\|^## HTML.*derived' "$file"; then
      errors+="  - missing '## Plain HTML' section\n"
    fi
    # Required: at least one Carbon class name (cds-button, cds--button, cds-modal, etc.)
    if ! grep -q 'cds-\|cds--' "$file"; then
      errors+="  - no Carbon class names (cds-* or cds--*) found — Storybook source likely missing\n"
    fi
    # Required: at least one verbatim story export (Default, Secondary, etc.) referenced
    if ! grep -qE '(Default|Primary|Secondary|Tertiary|Skeleton)' "$file"; then
      errors+="  - no story variant names (Default/Primary/Secondary/etc.) found\n"
    fi
    # Line length range — Carbon files are larger because of verbatim source
    local lines
    lines=$(wc -l < "$file")
    if [ "$lines" -lt 250 ]; then
      errors+="  - file is $lines lines (under 250 = Storybook source likely missing)\n"
    fi
    if [ "$lines" -gt 800 ]; then
      errors+="  - file is $lines lines (over 800 = consider splitting)\n"
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
    echo "FAIL: $IBM_DIR/$f does not exist"
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
```

- [ ] **Step 2: Make it executable**

Run: `chmod +x scripts/validate-carbon-refs.sh`
Expected: no output, exit code 0.

- [ ] **Step 3: Verify the script runs (and reports failures because no files exist yet)**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `ERROR: IBM directory not found: skills/pixel-council/references/ibm` and exit 1. This confirms the script works — failure is expected at this point.

- [ ] **Step 4: Commit**

```bash
git add scripts/validate-carbon-refs.sh
git commit -m "feat: add Carbon reference file validation script"
```

---

## Phase 1: Foundation — overview.md

This single file is the largest and most important. Every other file depends on the tokens defined here. Get it right.

### Task 1.1: Create the IBM directory

**Files:**
- Create: `skills/pixel-council/references/ibm/` (directory)

- [ ] **Step 1: Create directory**

Run: `mkdir -p "skills/pixel-council/references/ibm/components"`
Expected: no output, exit code 0.

- [ ] **Step 2: Verify**

Run: `ls -la skills/pixel-council/references/ibm/`
Expected: shows `components/` subdirectory.

### Task 1.2: Author overview.md

**Files:**
- Create: `skills/pixel-council/references/ibm/overview.md`

This file is large (~700-900 lines) because it contains all 4 themes' tokens plus type, motion, spacing, grid, and shape rules. It is the single source of truth for tokens — components reference these values literally rather than redefining them.

- [ ] **Step 1: Write the file with this exact structure and content**

Required sections in order:

1. **YAML frontmatter:**
```markdown
---
name: ibm-carbon-overview
description: Complete Carbon v11 token system — 4 themes (White/G10/G90/G100), IBM Plex type scale (productive + expressive), motion tokens, 2x grid, shape rules
metadata:
  tags: ibm, carbon, design tokens, themes, ibm plex, motion, 2x grid, enterprise, dark mode, ai
---
```

2. **H1 + source:**
```markdown
# IBM Carbon Design System -- Design System Reference

> Source: [v11 Carbon docs](https://v11.carbondesignsystem.com/) — version v11 (Apache 2.0)
> Packages: `@carbon/colors`, `@carbon/themes`, `@carbon/type`, `@carbon/motion`, `@carbon/grid`, `@carbon/icons`, `@carbon/pictograms`
```

3. **Core philosophy section** (~20 lines): Carbon is IBM's open-source design system for products, websites, and AI experiences. Built for enterprise scale: data-dense dashboards, complex workflows, multi-theme deployments. Distinctive principles: SHARP corners (no border-radius), 4-theme architecture (two light + two dark), Productive vs Expressive scales, Layer tier nesting for surface hierarchy, dedicated AI surface tokens.

4. **Shape Rules callout** (mandatory, prominent — this is Carbon's #1 visual identifier):
```markdown
## Shape Rules — READ FIRST

Carbon is **sharp by default**. The vast majority of components use `border-radius: 0`.

| Component | Radius |
|---|---|
| Button (all variants) | `0` |
| Tile | `0` |
| TextInput, Dropdown, Select, etc. | `0` |
| Modal, Notification | `0` |
| Tag | `2px` |
| Tooltip, Popover, Toggletip | `2px` |
| Skeleton placeholder | `0` |

**Never** add `border-radius` to a Carbon component beyond these explicit values. Rounded corners are the single biggest tell that an output is non-Carbon.
```

5. **Color palette block** — write out all 122 hex values from the spec in a single CSS `:root` block prefixed with `--cds-color-`. Include:
   - `--cds-color-black: #000000;` `--cds-color-white: #ffffff;`
   - All 10 grades for: gray, cool-gray, warm-gray, blue, red, magenta, purple, cyan, teal, green, yellow, orange. Use values from the spec section 5.1 (already captured during research).
   - Format: `--cds-color-blue-60: #0f62fe;` (etc.)

6. **Theme: White** — single `[data-theme="white"]` block with all semantic tokens resolved to hex (background = white, layer-01 = gray-10, layer-02 = white, etc.). Include every semantic token category from spec section 5.2. Add a comment for the AI/Chat token group.

7. **Theme: G10** — `[data-theme="g10"]` block. Background = gray-10 (`#f4f4f4`), layer-01 = white, layer-02 = gray-10, layer-03 = white. Same semantic tokens as White, different values.

8. **Theme: G90** — `[data-theme="g90"]` block. Background = gray-90 (`#262626`), layer-01 = gray-80, layer-02 = gray-70, layer-03 = gray-60. Dark text inverted.

9. **Theme: G100** — `[data-theme="g100"]` block AND `.dark` class block (mirror values for dark-mode toggle). Background = gray-100 (`#161616`), layer-01 = gray-90, layer-02 = gray-80, layer-03 = gray-70.

10. **Theme switching pattern** — small JS snippet showing how to swap themes:
```html
<html data-theme="white">
<!-- swap to dark via either: -->
<script>
  // Auto: prefer system color scheme
  if (matchMedia('(prefers-color-scheme: dark)').matches) {
    document.documentElement.setAttribute('data-theme', 'g100');
  }
</script>
```

11. **Typography — IBM Plex** — full token list from spec section 5.3:
```css
:root {
  --cds-font-sans: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  --cds-font-serif: 'IBM Plex Serif', Georgia, serif;
  --cds-font-mono: 'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', monospace;
}
```
Include CDN load link: `<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@300;400;600;700&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">`

12. **Productive type scale** — table of every productive token with px size, line-height, weight, letter-spacing. Include: caption-01/02, label-01/02, helper-text-01/02, code-01/02, body-compact-01/02, body-01/02, legal-01/02, heading-compact-01/02, heading-01..07. Convert rem values from the captured `scale[]` array (12, 14, 16, 18, 20, 24, 28, 32, 36, 42, 54, 60, 76 — Carbon's scale array).

13. **Expressive type scale** — table for expressive-heading-01..06 + expressive-paragraph-01 + quotation-01/02. Note that expressive variants change at breakpoints (mention `lg` 1056px and `max` 1584px adjustments).

14. **Display + Fluid scale** — table for display-01..04 + fluid-display-01..04 + fluid-heading-03..06. Include the responsive ranges for fluid (e.g., `fluid-display-01: 32-92px between sm and max`).

15. **Motion tokens** — exact values from spec section 5.4:
```css
:root {
  --cds-duration-fast-01: 70ms;
  --cds-duration-fast-02: 110ms;
  --cds-duration-moderate-01: 150ms;
  --cds-duration-moderate-02: 240ms;
  --cds-duration-slow-01: 400ms;
  --cds-duration-slow-02: 700ms;

  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-easing-productive-entrance: cubic-bezier(0, 0, 0.38, 0.9);
  --cds-easing-productive-exit: cubic-bezier(0.2, 0, 1, 0.9);
  --cds-easing-expressive-standard: cubic-bezier(0.4, 0.14, 0.3, 1);
  --cds-easing-expressive-entrance: cubic-bezier(0, 0, 0.3, 1);
  --cds-easing-expressive-exit: cubic-bezier(0.4, 0.14, 1, 1);
}
```
Add usage table: Productive = UI feedback (button hover, dropdown open). Expressive = entrances/large surfaces (modal open, page transitions).

16. **Spacing scale** — `--cds-spacing-01: 2px` through `--cds-spacing-13: 160px` with the values from spec section 5.5.

17. **2x Grid** — full grid spec: 16-column, breakpoints (sm 320, md 672, lg 1056, xlg 1312, max 1584), max-width 1584px, gutter modes (wide 32px / narrow 16px / condensed 1px). Include CSS for `.cds--grid`, `.cds--row`, `.cds--col-{bp}-{n}`.

18. **Layer tier system** — explain the Background → Layer-01 → Layer-02 → Layer-03 nesting rule with a code example using `data-layer` attribute. This is Carbon's surface-elevation alternative.

19. **Focus ring spec** — Carbon's distinctive focus style:
```css
:focus-visible {
  outline: 2px solid var(--cds-focus);
  outline-offset: 0; /* Carbon does NOT use offset */
  box-shadow: inset 0 0 0 1px var(--cds-background); /* inner separator */
}
```

20. **Productive vs Expressive philosophy** — short section explaining when to use each set of tokens. Productive = product UI (-01 suffix, fixed sizes). Expressive = marketing/editorial (-02 suffix, fluid/responsive).

- [ ] **Step 2: Run validation**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `overview.md` passes; the other 4 reference files and component files report missing (expected). The script confirms `overview.md` has frontmatter, H1, source link, no placeholders.

- [ ] **Step 3: Spot-check parity with apple/overview.md**

Run: `wc -l skills/pixel-council/references/{apple,google,ibm}/overview.md`
Expected: ibm/overview.md is in range 600-1000 lines (apple is ~600, google is ~700; Carbon is larger because of 4 themes).

Run: `grep -c '#[0-9a-fA-F]\{6\}' skills/pixel-council/references/ibm/overview.md`
Expected: at least 200 hex value matches (122 base palette + ~80 for theme tokens × 4 themes).

- [ ] **Step 4: Commit**

```bash
git add skills/pixel-council/references/ibm/overview.md
git commit -m "feat(ibm): add Carbon overview — 4 themes, tokens, IBM Plex, motion, 2x grid"
```

---

## Phase 2: Page-level reference files

These four files are read alongside `overview.md` for any full-page request. They contain composition-level guidance, NOT component internals.

### Task 2.1: Author icons.md

**Files:**
- Create: `skills/pixel-council/references/ibm/icons.md`

Carbon icons are Apache 2.0 and **directly usable on web** (unlike SF Symbols). This file documents the loading strategies and includes 24 inlined SVGs for offline use.

- [ ] **Step 1: Write the file**

Required sections:

1. YAML frontmatter (`name: icons`, tags: icon, carbon icons, svg, sf alternative)
2. H1 + source: `# Icons -- IBM Carbon Design System` / `> Source: [@carbon/icons](https://github.com/carbon-design-system/carbon/tree/main/packages/icons) — Apache 2.0, web-redistributable`
3. Quick Reference table (sizes 16/20/24/32, default stroke, color tokens)
4. **Web licensing note** — explicit callout: "Unlike SF Symbols, Carbon Icons CAN be redistributed in web projects. Use `@carbon/icons` directly via npm or unpkg CDN."
5. **Design Tokens** block:
```css
:root {
  --cds-icon-primary: var(--cds-text-primary);
  --cds-icon-secondary: var(--cds-text-secondary);
  --cds-icon-on-color: #ffffff;
  --cds-icon-disabled: var(--cds-text-disabled);
  --cds-icon-interactive: var(--cds-link-primary);
  --cds-icon-inverse: var(--cds-text-inverse);
  --cds-icon-transition: fill 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
}
```
6. **Loading strategies** (3 approaches):
   - Approach A — npm with React: `import { Add16, Settings20 } from '@carbon/icons-react';`
   - Approach B — Inline SVG via `@carbon/icons` JSON: `import { Add16 } from '@carbon/icons';` (returns AST that can render)
   - Approach C — CDN script tag for HTML projects: `<script type="module" src="https://unpkg.com/@carbon/icons-react@latest"></script>`
   - Approach D — Plain `<img>` from unpkg static SVG: `<img src="https://unpkg.com/@carbon/icons/svg/32/add.svg" width="24" height="24" alt="">`
7. **Sizing rules table:**

| Size | Use case |
|---|---|
| 16px | Inline with body text, dense UI, table cell icons |
| 20px | Icon button (sm/md), inline notification icons, form field affordances |
| 24px | Standard icon button, navigation, header chrome |
| 32px | Large icon button, feature illustrations, empty states |

8. **24 inlined SVG library** — paste actual SVG paths from `@carbon/icons` for these icons (each in its own ```html``` block with `viewBox="0 0 32 32"` and `currentColor` fill):
   - add, close, checkmark, chevron-right, chevron-down, chevron-left, chevron-up, arrow-right, arrow-left, settings, search, menu, filter, edit, trash-can, copy, download, upload, user, notification, warning, error, information, help, view, view-off

   Source path: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/icons/src/svg/32/{name}.svg`

9. **Accessibility:**
   - Decorative icons: `aria-hidden="true"`
   - Meaningful icons: `<title>{label}</title>` inside `<svg>` + `role="img"` + `aria-label`
   - Icon buttons: `aria-label` on the button, `aria-hidden` on the svg

10. **Color application examples** — show using `currentColor` on stroke/fill, then setting button `color: var(--cds-icon-primary)`.

- [ ] **Step 2: Fetch the actual SVG content for inlined icons**

For each of the 24 icons listed in section 8, fetch the raw SVG from:
`https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/icons/src/svg/32/{name}.svg`

Use the WebFetch tool with prompt "return the complete SVG markup verbatim" and paste the result into the file.

- [ ] **Step 3: Run validation**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `icons.md` passes the page-level checks (frontmatter, H1, source link, no placeholders).

- [ ] **Step 4: Commit**

```bash
git add skills/pixel-council/references/ibm/icons.md
git commit -m "feat(ibm): add Carbon icons reference — Apache 2.0, 24 inlined SVGs, 4 sizes"
```

### Task 2.2: Author pictograms.md

**Files:**
- Create: `skills/pixel-council/references/ibm/pictograms.md`

Pictograms are Carbon's editorial illustrations — larger (32-128px) and more visual than icons. No Apple/Google equivalent. Used in marketing feature sections.

- [ ] **Step 1: Write the file**

Required sections:

1. YAML frontmatter (`name: pictograms`, tags: pictogram, illustration, marketing, editorial, ibm)
2. H1 + source: `# Pictograms -- IBM Carbon Design System` / `> Source: [@carbon/pictograms](https://github.com/carbon-design-system/carbon/tree/main/packages/pictograms) — Apache 2.0`
3. **What pictograms are** — 1-2 sentences distinguishing pictograms from icons. Pictograms are illustrative (multi-stroke, scene-based), used at 64-128px in editorial contexts. Icons are functional (single-purpose, used at 16-32px in UI).
4. **When to use** table:

| Context | Pictogram or Icon? |
|---|---|
| Marketing feature section (3-column grid) | Pictogram, 64-96px |
| Empty state hero | Pictogram, 96-128px |
| Editorial section header | Pictogram, 64px |
| UI button/control | Icon, 16-24px |
| Navigation chrome | Icon, 20-24px |
| Inline with body text | Icon, 16px |

5. **Loading strategies:**
   - npm React: `import { Analytics, Cloud, Security } from '@carbon/pictograms-react';`
   - Plain SVG from unpkg: `<img src="https://unpkg.com/@carbon/pictograms/svg/{name}.svg" width="96" height="96" alt="">`
6. **Color treatment** — pictograms come in single-color (`currentColor` stroke) and duo-tone variants. Most use `currentColor` and inherit from parent text color.
7. **Sizing rules:**

| Size | Use case |
|---|---|
| 32-48px | Inline with heading, sidebar nav |
| 64-80px | Feature card (3-col grid) |
| 96-128px | Hero illustration, empty state |

8. **12 inlined pictogram examples** — fetch and embed the raw SVGs for: analytics, data, security, cloud, ai, automation, sustainability, accessibility, transformation, network, devices, integration

   Source path: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/pictograms/src/svg/{name}.svg`

9. **Accessibility:**
   - Decorative (most cases): `aria-hidden="true"`, descriptive `alt=""` if `<img>`
   - Meaningful: `<title>` + `role="img"` + `aria-label`
10. **Do/Don't:**

| Do | Don't |
|---|---|
| Use pictograms in feature sections | Don't use them in dense UI |
| Pair with expressive headings | Don't use in product chrome |
| Color via currentColor for theme adaptation | Don't hardcode hex on the SVG paths |

- [ ] **Step 2: Fetch the 12 pictogram SVGs**

For each name in section 8, fetch from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/pictograms/src/svg/{name}.svg`. If a name isn't found, search the directory listing at `https://github.com/carbon-design-system/carbon/tree/main/packages/pictograms/src/svg` for the nearest match (Carbon's pictogram names sometimes have variants like `analytics--reference.svg`).

- [ ] **Step 3: Run validation + commit**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `pictograms.md` passes.

```bash
git add skills/pixel-council/references/ibm/pictograms.md
git commit -m "feat(ibm): add Carbon pictograms reference — editorial illustrations for marketing"
```

### Task 2.3: Author editorial-type.md

**Files:**
- Create: `skills/pixel-council/references/ibm/editorial-type.md`

Marketing/editorial type scale — separate from `overview.md`'s productive scale. Used for landing pages and marketing sections.

- [ ] **Step 1: Write the file**

Required sections:

1. YAML frontmatter (`name: editorial-type`, tags: editorial, marketing, expressive, fluid, display, ibm plex)
2. H1 + source: `# Editorial Type -- IBM Carbon Design System` / `> Source: [Carbon Type — Expressive](https://carbondesignsystem.com/elements/typography/style-strategy/)`
3. **When to use this scale** — 1 paragraph. Use expressive/fluid/display for editorial content (marketing pages, blog posts, landing pages). Use the productive scale (in `overview.md`) for product UI.
4. **Marketing scale ladder** — table of editorial scale from largest to smallest with example headlines:

| Token | sm size | max size | Use |
|---|---|---|---|
| `fluid-display-04` | 42px | 92px | Hero headline (largest) |
| `fluid-display-03` | 42px | 76px | Hero headline (alt) |
| `fluid-display-02` | 42px | 76px | Section super-headline |
| `fluid-display-01` | 32px | 76px | Section headline |
| `fluid-heading-06` | 32px | 60px | Sub-hero |
| `fluid-heading-05` | 28px | 36px | Section eyebrow + headline |
| `fluid-heading-04` | 28px | 32px | Card / feature title |
| `fluid-heading-03` | 20px | 24px | Card / feature subtitle |
| `expressive-paragraph-01` | 24px | 32px | Long-form lead paragraph |
| `quotation-01` | 20px | 28px | Pull quote (small) |
| `quotation-02` | 32px | 48px | Pull quote (large) |

   Pull exact `scale[]` array values: 12, 14, 16, 18, 20, 24, 28, 32, 36, 42, 54, 60, 76. Use these to convert the rem-based scale references from spec section 5.3.

5. **Fluid scaling behavior** — explain that fluid tokens use CSS `clamp()` to interpolate between sm and max viewport widths. Example:
```css
.cds--fluid-display-04 {
  font-size: clamp(2.625rem, 2.625rem + (5.75 - 2.625) * ((100vw - 20rem) / (99 - 20)), 5.75rem);
  line-height: 1.19;
  font-weight: 300; /* light */
  letter-spacing: 0;
}
```

6. **Expressive vs Productive contrast table** — side-by-side showing same content at heading-04 (productive 28px) vs expressive-heading-04 (28-32px responsive). Demonstrate why marketing needs the editorial scale.

7. **Editorial composition rules:**
   - Eyebrow → Headline → Body → CTA — per-section hierarchy
   - Eyebrow uses `label-01` semibold uppercase
   - Headline uses fluid-display or fluid-heading
   - Body uses `body-02` (16px) or `expressive-paragraph-01` for long-form
   - Headlines weight 300 (light) for fluid-display, weight 400-600 for fluid-heading
   - Letter-spacing: always 0 for headings ≥28px

8. **IBM.com headline pattern** — code example showing a hero with eyebrow + fluid-display-04 + body + buttons.

9. **Do/Don't:**

| Do | Don't |
|---|---|
| Use fluid-display for marketing heroes | Don't use heading-07 (productive) for marketing — too small |
| Pair eyebrow + headline + body + CTA per section | Don't skip the eyebrow in editorial sections |
| Left-align long-form text | Don't center long paragraphs |
| Use IBM Plex Sans light (300) for display-04 | Don't use bold weights for editorial display |

- [ ] **Step 2: Run validation + commit**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `editorial-type.md` passes.

```bash
git add skills/pixel-council/references/ibm/editorial-type.md
git commit -m "feat(ibm): add Carbon editorial type scale (expressive + fluid + display)"
```

### Task 2.4: Author page-patterns.md

**Files:**
- Create: `skills/pixel-council/references/ibm/page-patterns.md`

Page-level composition patterns. The most important file for page-level requests after `overview.md`.

- [ ] **Step 1: Write the file**

Required sections:

1. YAML frontmatter (`name: page-patterns`, tags: page, layout, dashboard, ui shell, hero, marketing, ibm.com)
2. H1 + source: `# Page Patterns -- IBM Carbon Design System`
3. **Layout primitives** (CSS for `.cds--page`, `.cds--dashboard`, `.cds--grid`, `.cds--row`, `.cds--col-{bp}-{n}`).
   - `.cds--page` = max-width 1584px, margin 0 auto (for marketing pages)
   - `.cds--dashboard` = full-width, no max-width (for app shells, fills detail panel)
4. **Dashboard vs Marketing distinction table** (Carbon-specific):

| Page type | Use class | Width behavior |
|---|---|---|
| Marketing/landing | `.cds--page` | Centered max-width 1584px |
| Product dashboard | `.cds--dashboard` | Fill available space after sidebar |
| Admin / app shell | `.cds--dashboard` | Fill |
| Documentation | `.cds--page` with sidebar | Centered + sidebar |

5. **IBM.com marketing patterns** (4 sub-sections):

   **5a. Hero pattern** — code example: left-aligned eyebrow + fluid-display-04 headline + body + 2 buttons + pictogram on right (8 cols / 8 cols at lg breakpoint).

   **5b. Section rhythm** — 96-160px vertical padding between sections. Alternate White/G10 backgrounds for subtle band variation. NO drop shadows in marketing.

   **5c. Feature section** — 3-column grid: pictogram (64-96px) + expressive-heading-04 + body-02 + Link. Repeat 3 times.

   **5d. Stats section** — 2-4 column grid of large numerics: fluid-display-02 number + label-01 caption underneath.

   **5e. CTA strip** — full-bleed dark band (G100), display-03 headline, body, primary button.

   **5f. Quote section** — quotation-02 + author label, generous whitespace.

6. **Product/dashboard patterns** (3 sub-sections):

   **6a. UIShell layout** — 48px header at top + 256px sidebar (collapsible to 48px rail) on left + main content. Header chrome: hamburger, product name, global actions row (search, switcher, notifications, user menu).

   **6b. Dashboard grid** — `.cds--dashboard` wrapper, 2x grid with Tile components in 4-col → 2-col → 1-col responsive breakdown. Background = layer-01 nested in body's main background.

   **6c. Data-dense view** — DataTable as primary component, batch action bar appears on selection, optional filter sidebar (320px) on left, pagination at bottom.

7. **AI patterns**:

   **7a. AI surface** — Tile or Modal with `aiAura` gradient border, AI popover for explanation, AILabel inline `<span class="cds--ai-label">AI</span>` badge.

   **7b. Chat shell** — full-height layout with chatShell background, message list (scroll area) with chatBubbleUser (right-aligned) / chatBubbleAgent (left-aligned), prompt input at bottom with chatPromptBackground + chatPromptBorder gradient.

8. **Responsive behavior table** (for the layout primitives):

| Breakpoint | sm | md | lg | xlg | max |
|---|---|---|---|---|---|
| Min width | 320px | 672px | 1056px | 1312px | 1584px |
| Columns | 4 | 8 | 16 | 16 | 16 |
| Sidebar | hidden / hamburger | hidden / hamburger | 256px persistent | 256px | 320px |
| Hero pictogram | hidden | full-width below | 8 cols right | 8 cols right | 8 cols right |

9. **Do/Don't tables for marketing:**

| Do | Don't |
|---|---|
| Left-align hero content | Don't center marketing heroes |
| Use pictograms in feature grids | Don't use icons (too small) |
| 96-160px between sections | Don't cram sections together |
| Layer-01 / Layer-02 alternation | Don't add drop shadows |
| Sharp corners everywhere | Don't add border-radius |

10. **Do/Don't for dashboards:**

| Do | Don't |
|---|---|
| Use `.cds--dashboard` (full-width) | Don't use `.cds--page` (max-width) |
| UIShell + DataTable + Tiles | Don't replicate marketing card grids |
| Productive type scale | Don't use expressive/fluid in dashboards |
| Layer-01 for cards on Background | Don't add box-shadow to tiles |

- [ ] **Step 2: Run validation + commit**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `page-patterns.md` passes.

```bash
git add skills/pixel-council/references/ibm/page-patterns.md
git commit -m "feat(ibm): add Carbon page patterns — UIShell, dashboard, IBM.com marketing"
```

---

## Phase 3 setup: Component file template (REVISED 2026-04-26)

Before authoring 38 component files, define the template once. Every component task references this template. **The defining feature of this template is verbatim Storybook source code** — Sections 5 and 6 contain the actual Carbon code, copied as-is from the GitHub stories files. Sections 1-4 and 7-12 frame and contextualize that source.

### Task 3.0: Define the component file template (reference only — no file created)

This task is **content-only** (no file written) — it defines the template that every component task in Phases 3-5 follows. Read this carefully before starting any component task.

**The template (12 sections):**

```markdown
---
name: {component-slug}
description: Carbon {component-name} — {1-line summary listing key variants from Storybook}
metadata:
  tags: {component-name}, {category}, {key features}, ibm, carbon, react, web-components
---

# {Component Name} -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`{Name}.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/{Name}/{Name}.stories.js)
> - **WC story:** [`{name}.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/{name}/{name}.stories.ts)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-{name}--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-{name}--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/{Name}/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm/md/lg/xl) | {exact px values from .scss} |
| Padding | {exact px values from .scss} |
| Corner radius | `0` (Carbon: sharp by default) |
| Font | IBM Plex Sans, {type token name} |
| Default color (White theme) | {hex from overview.md} |
| Default color (G100 theme) | {hex from overview.md} |
| Focus ring | 2px solid var(--cds-focus), inset 0 0 0 1px var(--cds-background) |
| React import | `import { {Name} } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/{name}/index.js';` |

## Variants (from Storybook story exports)

List EVERY story export found in `{Name}.stories.js`. For Button this is: Default, Secondary, Tertiary, Ghost, Danger, DangerTertiary, DangerGhost, IconButton, IconButtonWithBadge, Skeleton.

| Variant | Story export | Purpose |
|---|---|---|
| {Variant 1} | `Default` | {1-line description} |
| {Variant 2} | `Secondary` | {1-line description} |
| ... | ... | ... |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `{Name}.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of the stories file):

```jsx
{verbatim import block from {Name}.stories.js}
```

**Variant: Default**

```jsx
{verbatim render function body from `export const Default = ...` in {Name}.stories.js}
```

**Variant: Secondary**

```jsx
{verbatim render function body for Secondary}
```

{... continue for every variant — one ```jsx``` block per story export ...}

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `{name}.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of the stories file):

```ts
{verbatim import block from {name}.stories.ts}
```

**Variant: Default**

```html
{verbatim lit-html template from `export const Default = ...` in {name}.stories.ts, rendered as HTML markup}
```

**Variant: Secondary**

```html
{verbatim template for Secondary}
```

{... continue for every variant — one ```html``` block per story export ...}

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.disabled}` → `disabled` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework.

**Variant: Default**

```html
{static HTML derived from the WC template — same `<cds-button>` markup with literal attribute values}
```

{... per variant ...}

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  --cds-{component}-background: {hex resolved from White theme in overview.md};
  --cds-{component}-text: {hex};
  --cds-{component}-hover: {hex};
  --cds-{component}-active: {hex};
  --cds-{component}-disabled: {hex};
  /* ... all component-relevant tokens, literal hex ... */
}

[data-theme="g100"],
.dark {
  --cds-{component}-background: {hex from G100 theme};
  --cds-{component}-text: {hex};
  --cds-{component}-hover: {hex};
  /* ... dark values ... */
}
```

## States Reference (from .scss)

> Pull values from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.scss` — the SCSS file is the source of truth for state-specific styling.

| State | Background | Color | Border | Other |
|---|---|---|---|---|
| Rest | {hex from .scss} | {hex} | {value} | — |
| Hover | {hex} | {hex} | {value} | — |
| Active | {hex} | {hex} | {value} | — |
| Focus-visible | (rest) | (rest) | (rest) | outline 2px focus, inset 1px bg |
| Disabled | {hex} | {hex} | {value} | cursor: not-allowed |

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from the SCSS):

```css
.cds--{component} {
  transition:
    background var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    color var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

@media (prefers-reduced-motion: reduce) {
  .cds--{component} { transition: none; }
}
```

## Accessibility (from Carbon's docs + source)

- Semantic element: {actual element used in WC source — e.g., `<button>` for cds-button}
- ARIA: {actual ARIA attributes Carbon's source applies — e.g., `aria-pressed`, `aria-haspopup`}
- Keyboard: {keys handled by Carbon's source}
- Touch target: Carbon defaults to 32-48px desktop heights. For mobile, wrap in a `min-height: 44px` query.
- Focus management: Carbon's CSS provides `:focus-visible` with the signature double-ring — DO NOT remove it.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (border-radius: 0) | Don't add border-radius |
| Use `cds--*` class names from the WC source | Don't invent your own classes |
| Use `<cds-button>` / `<Button>` element name from source | Don't substitute generic `<button>` if Carbon uses the custom element |
| Wrap in `[data-theme="white"]` or `[data-theme="g100"]` | Don't define your own theme classes |
```

**Per-component authoring procedure (every Phase 3-5 task follows this):**

1. **Fetch the React stories file** with WebFetch:
   - URL: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/{Name}/{Name}.stories.js`
   - Prompt: "Return the COMPLETE file content verbatim. I need every line including imports, every story export's render function body, and any helper definitions. Do not summarize."

2. **Fetch the WC stories file** with WebFetch:
   - URL: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.stories.ts`
   - Prompt: "Return the COMPLETE file content verbatim. I need every line including imports, every story export's lit-html template, and helper functions."

3. **Fetch the SCSS file** for state values (only if Quick Reference / States Reference table needs explicit hex/dimension data):
   - URL: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.scss`
   - Prompt: "Show heights, paddings, hover/active/focus/disabled background and color values. Quote the exact SCSS lines."

4. **Cross-reference theme tokens** in `overview.md`:
   - The Storybook code uses semantic Carbon tokens (`$button-primary`, `$layer-01`, etc.). For the Design Tokens section, resolve those to literal hex by looking up the corresponding token in overview.md's `[data-theme="white"]` and `[data-theme="g100"]` blocks.

5. **Author the file** following the 12-section template:
   - Sections 1-4: frame the component (frontmatter, source links, Quick Reference, Variants list)
   - Section 5: paste verbatim React story code, one block per variant
   - Section 6: paste verbatim WC story code, one block per variant
   - Section 7: derive plain HTML from the WC version (resolve lit-html bindings)
   - Sections 8-12: tokens, states, animation, accessibility, do/don't

6. **CRITICAL — paste verbatim, do NOT paraphrase**:
   - Copy the imports block exactly from the stories file
   - Copy each `export const {VariantName} = ...` render function body exactly — keep the `(args) =>` signature, keep the spread operators, keep the prop bindings
   - For WC: keep the lit-html `${expression}` bindings in the WC code block. Resolve them only in the "Plain HTML (derived)" section.
   - Do NOT shorten, do NOT add ellipses (`...`), do NOT rename variables

7. **Verification:**
   - Run `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
   - Confirm: file ≥ 250 lines, contains `cds-` class names, contains story variant names (Default/Secondary/etc.), has all required sections
   - Spot-check: open the file and confirm Section 5 has at least 3 ```jsx``` blocks (most components have 5-10 variants), Section 6 has matching ```html``` blocks

8. **Commit:**
   ```bash
   git add skills/pixel-council/references/ibm/components/{name}.md
   git commit -m "feat(ibm): add Carbon {name} reference (verbatim Storybook source, {N} variants)"
   ```

---

## Phase 3 lookup: master component-to-Storybook mapping

Use this table for every Phase 3-5 task. It maps each ref-file name to its React PascalCase folder, WC kebab-case folder, and known story exports. The PascalCase / kebab-case mismatch between the two libraries is real — Carbon's React folders use PascalCase (`Button/`), Web Components use kebab-case (`button/`).

| Ref file | React folder | WC folder | Story exports (variants to embed) |
|---|---|---|---|
| `button.md` | `Button` | `button` | Default, Secondary, Tertiary, Ghost, Danger, DangerTertiary, DangerGhost, IconButton, IconButtonWithBadge, Skeleton |
| `checkbox.md` | `Checkbox` | `checkbox` | Default, Single, Skeleton |
| `radio-button.md` | `RadioButton` | `radio-button` | Default, Skeleton |
| `toggle.md` | `Toggle` | `toggle` | Default, Small, WithoutLabel, Skeleton |
| `text-input.md` | `TextInput` | `text-input` | Default, Fluid, ReadOnly, TogglePasswordVisibility, Skeleton |
| `text-area.md` | `TextArea` | `text-area` | Default, WithCharacterCounter, Skeleton |
| `number-input.md` | `NumberInput` | `number-input` | Default, Fluid, Skeleton |
| `search.md` | `Search` | `search` | Default, Disabled, Expandable, Skeleton |
| `select.md` | `Select` | `select` | Default, Inline, Fluid, Skeleton |
| `dropdown.md` | `Dropdown` | `dropdown` | Default, Inline, InlineWithLayer, WithLayer, Skeleton |
| `multi-select.md` | `MultiSelect` | `multi-select` | Default, Filterable, WithInitialSelectedItems, Skeleton |
| `combo-box.md` | `ComboBox` | `combo-box` | Default, AllowCustomValue, WithLayer, Disabled, Skeleton |
| `date-picker.md` | `DatePicker` | `date-picker` | Simple, SingleWithCalendar, RangeWithCalendar, Skeleton |
| `time-picker.md` | `TimePicker` | `time-picker` | Default |
| `slider.md` | `Slider` | `slider` | Default, ControlledSlider, TwoHandle, Skeleton |
| `link.md` | `Link` | `link` | Default, Inline, Disabled, PairedWithIcon |
| `accordion.md` | `Accordion` | `accordion` | Default, Skeleton, NoAlign, NoTitle |
| `breadcrumb.md` | `Breadcrumb` | `breadcrumb` | Default, BreadcrumbWithOverflowMenu, Skeleton |
| `tabs.md` | `Tabs` | `tabs` | Default, Container, IconOnly, Vertical, ContainedWithSecondaryLabels, Manual, Dismissable, Skeleton |
| `modal.md` | `Modal` | `modal` | Default, Danger, FullWidth, PassiveModal, WithStateManager, WithScrollingContent |
| `data-table.md` | `DataTable` | `data-table` | Default, WithToolbar, WithSorting, WithExpansion, WithSelection, WithBatchActions, WithOverflowMenu, StickyHeader, FilteringWithMultiSelect, DynamicContent, Skeleton |
| `tile.md` | `Tile` | `tile` | Default, Clickable, Selectable, MultiSelect, Expandable, Radio |
| `tree-view.md` | `TreeView` | `tree-view` | Default, WithIcons, WithControlledExpansion |
| `structured-list.md` | `StructuredList` | `structured-list` | Default, Selection, Skeleton |
| `contained-list.md` | `ContainedList` | `contained-list` | Default, WithActions, WithExpandableSearch, WithIcons, Disclosed |
| `content-switcher.md` | `ContentSwitcher` | `content-switcher` | Default, IconOnly, IconOnlyWithLayer, WithLayer |
| `fluid-form.md` | `FluidForm` | `fluid-form` | Default (covers FluidTextInput, FluidDropdown, FluidNumberInput, FluidSearch, FluidSelect, FluidTextArea, FluidTimePicker, FluidComboBox, FluidMultiSelect, FluidDatePicker variants — embed each Fluid* story too) |
| `progress-indicator.md` | `ProgressIndicator` | `progress-indicator` | Default, Interactive, Skeleton |
| `code-snippet.md` | `CodeSnippet` | `code-snippet` | Inline, SingleLine, MultiLine, Skeleton |
| `file-uploader.md` | `FileUploader` | `file-uploader` | Default, FileUploaderItem, FileUploaderDropContainer, FileUploaderButton, Skeleton |
| `notification.md` | `Notification` | `notification` | Toast, ActionableToast, Inline, ActionableInline, Callout |
| `overflow-menu.md` | `OverflowMenu` | `overflow-menu` | Default, RenderCustomIcon, WithLinks |
| `popover.md` | `Popover` | `popover` | Default, TabTip, Toggletip, ExperimentalAutoAlign |
| `pagination.md` | `Pagination` | `pagination` | Default, MultiplePaginationComponents, PaginationWithCustomPageSizesLabel |
| `tag.md` | `Tag` | `tag` | ReadOnly, DismissibleTag, SelectableTag, Operational, Skeleton |
| `ai-label.md` | `AILabel` | `ai-label` | Default, AILabelInteractive — also embed AISkeleton + ChatButton stories from their respective folders (see ai-label task for details) |
| `ui-shell.md` | `UIShell` | `ui-shell` | HeaderBaseWPersistentSideNav, HeaderBaseWPersistentSideNavAndActions, SideNavRail, SideNavWithIcons, SideNavWithLargeSideNavItems (etc. — UIShell has 15+ stories, embed all primary header + sidenav variants) |
| `page-header.md` | `PageHeader` | `page-header` | Default, WithBreadcrumb, WithTabs, WithActions |

> The "Story exports" column is the agent's checklist — embed every variant listed. If WebFetch returns additional exports not in this table, embed those too. The list above is the floor, not the ceiling.

> **If a stories file or component doesn't exist** at the React or WC location: this is rare for v11 components, but if encountered (e.g., AILabel might only be in `@carbon/react`, not `@carbon/web-components` yet), document the absence in the file's source-link block and embed only the available source. Mark the missing one as "Not yet available in @carbon/web-components — check back at v11.106+".

---

## Phase 3: Standard 20 components (Apple/Google parity)

Each task below produces ONE component file using the template from Task 3.0 and the URL mapping from the table above. Each task follows the **per-component authoring procedure (8 steps)** defined in Task 3.0 — fetch React stories, fetch WC stories, fetch SCSS, cross-ref tokens, author, verify, commit.

The per-component details below are intentionally minimal (variants + Carbon-specific quirks) — the source code itself comes from the Storybook fetch. Do NOT make up code; copy what the fetch returns.

### Task 3.1: button.md

**Files:** Create: `skills/pixel-council/references/ibm/components/button.md`

**Carbon-specific details:**
- Variants: primary, secondary, tertiary, ghost, danger, danger-tertiary, danger-ghost
- Sizes: sm (32px), md (40px), lg (48px), xl (64px), 2xl (80px) — heights only
- Padding: sm/md/lg = `0 16px`, xl/2xl = `16px` (top-padded)
- Font: body-compact-01 = 14px / 18px / 0.16px / weight 400
- Tokens: `--cds-button-primary` = blue-60 (`#0f62fe`), hover = blue-70 (`#0353e9`), active = blue-80 (`#002d9c`). Danger = red-60 (`#da1e28`).
- Icon variant: 16px icon at right side, 16px gap from text
- Focus: 2px solid var(--cds-focus) (blue-60 in light, white in dark) + inset 1px white
- Sources: https://v11.carbondesignsystem.com/components/button/usage/ + /code/

- [ ] Step 1: Author file using template (Task 3.0) with above details
- [ ] Step 2: Run `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm` — expect button.md passes
- [ ] Step 3: `git add ... && git commit -m "feat(ibm): add Carbon button reference"`

### Task 3.2: checkbox.md

**Files:** Create: `skills/pixel-council/references/ibm/components/checkbox.md`

**Carbon-specific details:**
- Variants: default, indeterminate, disabled, read-only, with helper text
- Sizes: 18px box, 32px touch target
- Tokens: border = `--cds-icon-primary`, checked background = `--cds-button-primary` (blue-60), checkmark = `#ffffff`
- States: rest (border 1px), hover (background `--cds-layer-hover-01`), focus (2px outline + inset), checked (filled blue), indeterminate (blue with `–` mark), disabled (gray border, no background)
- Indeterminate: shows `–` (single horizontal line) instead of checkmark
- ARIA: `<input type="checkbox">` + `<label>`. For indeterminate, set `el.indeterminate = true` via JS (NOT an HTML attribute).
- CheckboxGroup: legend + grouped checkboxes with 8px vertical gap
- Source: https://v11.carbondesignsystem.com/components/checkbox/usage/

- [ ] Step 1, 2, 3 as in Task 3.1

### Task 3.3: radio-button.md

**Files:** Create: `skills/pixel-council/references/ibm/components/radio-button.md`

**Carbon-specific details:**
- Variants: default, with helper, disabled, read-only, RadioTile (large card-style radio)
- Size: 18px outer, 6px inner dot when selected
- Tokens: border = `--cds-icon-primary`, selected dot = `--cds-icon-primary`, no fill on the outer circle when selected (just dot)
- Layout: vertical (default) or horizontal (`cds--radio-button-group--horizontal`)
- Legend required for RadioButtonGroup (use `<fieldset><legend>`)
- RadioTile: 96px+ tall card variant — selectable Tile that behaves as radio
- Source: https://v11.carbondesignsystem.com/components/radio-button/usage/

### Task 3.4: toggle.md

**Files:** Create: `skills/pixel-council/references/ibm/components/toggle.md`

**Carbon-specific details:**
- Variants: small (16px tall), default (24px tall)
- Track: 32px wide (sm) or 48px wide (md), `--cds-toggle-off` = gray-50 (`#8d8d8d`), `--cds-support-success` = green-50 (`#24a148`) when on
- Knob: white circle, 12px (sm) or 18px (md), shifts left↔right on toggle
- Labels: "On" / "Off" text appears next to toggle (CDN convention) — 8px gap
- Animation: knob shift = 70ms productive-standard
- ARIA: `<button role="switch" aria-checked="true|false">` (NOT a checkbox)
- Source: https://v11.carbondesignsystem.com/components/toggle/usage/

### Task 3.5: text-input.md

**Files:** Create: `skills/pixel-council/references/ibm/components/text-input.md`

**Carbon-specific details:**
- Variants: default, password (toggle visibility), read-only, with helper text, with error, with warning, fluid (no internal padding)
- Sizes: sm (32px), md (40px), lg (48px) — heights
- Padding: 0 16px (lg), 0 12px (md/sm)
- Background: `--cds-field-01` (gray-10 in White theme), border-bottom 1px solid `--cds-border-strong-01` (gray-50)
- NO border on top/left/right (Carbon's distinctive bottom-border-only input style)
- Label above input (separate `<label>` element), not floating
- Helper text below input (12px helper-text-01)
- Focus: bottom border becomes 2px solid `--cds-focus` (blue-60)
- Error state: bottom border = `--cds-support-error` (red-60), error icon at right
- Source: https://v11.carbondesignsystem.com/components/text-input/usage/

### Task 3.6: text-area.md

**Files:** Create: `skills/pixel-council/references/ibm/components/text-area.md`

**Carbon-specific details:**
- Same border treatment as text-input (bottom border only)
- Resize: vertical only (`resize: vertical`), min-height 40px
- Counter: optional character count at bottom-right (`{used}/{max}`)
- All states inherit text-input behavior (focus, error, warning, disabled)
- Source: https://v11.carbondesignsystem.com/components/text-area/usage/

### Task 3.7: number-input.md

**Files:** Create: `skills/pixel-council/references/ibm/components/number-input.md`

**Carbon-specific details:**
- Same base as text-input + increment/decrement controls on right
- Increment/decrement buttons: 32px wide, separated by 1px vertical divider
- Up arrow = chevron-up icon, down arrow = chevron-down icon (16px)
- Step value configurable
- Sizes: sm/md/lg matching text-input
- Source: https://v11.carbondesignsystem.com/components/number-input/usage/

### Task 3.8: search.md

**Files:** Create: `skills/pixel-council/references/ibm/components/search.md`

**Carbon-specific details:**
- Variants: default, expandable (icon-only that expands on click)
- Sizes: sm (32px), md (40px), lg (48px), xl (64px)
- Background: `--cds-field-01`, no border (just background) — DIFFERENT from text-input
- Search icon (magnifier) on left at 16px, 16px from left edge
- Close icon (X) on right when text entered (clear button)
- ExpandableSearch: collapsed = 32px square icon button, expanded = full-width input
- Source: https://v11.carbondesignsystem.com/components/search/usage/

### Task 3.9: select.md

**Files:** Create: `skills/pixel-council/references/ibm/components/select.md`

**Carbon-specific details:**
- Native `<select>` styled to match Carbon
- Same height/padding as text-input (sm 32 / md 40 / lg 48)
- Caret icon (chevron-down 16px) on right
- Background: `--cds-field-01`, bottom border like text-input
- Inline variant: `cds--select--inline` for use inside a row
- Source: https://v11.carbondesignsystem.com/components/select/usage/

### Task 3.10: dropdown.md

**Files:** Create: `skills/pixel-council/references/ibm/components/dropdown.md`

**Carbon-specific details:**
- Custom (non-native) dropdown — like a select but JS-driven for full styling
- Variants: default, inline, with selected state, with helper text
- Trigger: same styling as text-input (bottom border, field bg)
- Menu: opens below trigger, max-height 304px, scrollable, layer-01 background, 1px border
- Menu items: 40px height, padding 0 16px, hover = layer-hover-01, selected = checkmark-16 icon at right
- Animation: 110ms expressive-entrance for menu open
- ARIA: `<button aria-haspopup="listbox">` + `<ul role="listbox">` + `<li role="option" aria-selected>`
- Source: https://v11.carbondesignsystem.com/components/dropdown/usage/

### Task 3.11: multi-select.md

**Files:** Create: `skills/pixel-council/references/ibm/components/multi-select.md`

**Carbon-specific details:**
- Same trigger style as dropdown
- Selected items shown as Tags inside the trigger field (filterable variant)
- Each selected tag has X to remove
- Menu items have checkboxes (NOT checkmarks) — checked = blue-60 box
- Counter: `{n}` badge showing selected count when collapsed
- "Clear all" button at top of menu
- Source: https://v11.carbondesignsystem.com/components/multiselect/usage/

### Task 3.12: combo-box.md

**Files:** Create: `skills/pixel-council/references/ibm/components/combo-box.md`

**Carbon-specific details:**
- Searchable dropdown — input at top filters the menu items as you type
- Otherwise behaves like dropdown (single-select)
- Caret icon doubles as clear button when text entered
- Empty state: "No matching results" message in menu
- Source: https://v11.carbondesignsystem.com/components/combo-box/usage/

### Task 3.13: date-picker.md

**Files:** Create: `skills/pixel-council/references/ibm/components/date-picker.md`

**Carbon-specific details:**
- Variants: simple (no calendar, MM/DD/YYYY input mask), single (input + calendar), range (two inputs + calendar)
- Calendar popover: 280px wide, opens below input
- Day cells: 40px square, hover = layer-hover-01, selected = button-primary (blue-60), today = underline
- Range selection: highlight between start and end dates with `--cds-layer-selected-01` background
- Month nav: chevron-left/right icons at top, month + year label centered
- Built on Flatpickr in Carbon React; we document the markup pattern
- Source: https://v11.carbondesignsystem.com/components/date-picker/usage/

### Task 3.14: time-picker.md

**Files:** Create: `skills/pixel-council/references/ibm/components/time-picker.md`

**Carbon-specific details:**
- Pair of inputs: time input (HH:MM) + select for AM/PM (or 24h)
- Optional second select for timezone
- Same input styling as text-input (bottom border)
- Source: https://v11.carbondesignsystem.com/components/time-picker/usage/

### Task 3.15: slider.md

**Files:** Create: `skills/pixel-council/references/ibm/components/slider.md`

**Carbon-specific details:**
- Track: 2px tall, full width minus thumb
- Filled portion: `--cds-button-primary` (blue-60) from start to thumb position
- Unfilled portion: `--cds-border-subtle-01` (gray-30)
- Thumb: 14px circle, blue-60 fill, 4px white inner ring on hover
- Number input on right shows current value (optional)
- Tick marks (optional) at intervals
- Range variant: two thumbs for min/max selection
- Source: https://v11.carbondesignsystem.com/components/slider/usage/

### Task 3.16: link.md

**Files:** Create: `skills/pixel-council/references/ibm/components/link.md`

**Carbon-specific details:**
- Variants: inline (underlined within paragraph), standalone (no underline + arrow icon), visited
- Color: `--cds-link-primary` = blue-60 (`#0f62fe`) light / blue-40 (`#78a9ff`) dark
- Hover: `--cds-link-primary-hover` = blue-70 (`#0353e9`)
- Visited: `--cds-link-visited` = purple-60 (`#8a3ffc`)
- Inline: `text-decoration: underline` always
- Standalone: no underline at rest, underline on hover, arrow-right-16 icon at right
- Source: https://v11.carbondesignsystem.com/components/link/usage/

### Task 3.17: accordion.md

**Files:** Create: `skills/pixel-council/references/ibm/components/accordion.md`

**Carbon-specific details:**
- Variants: default (start), end (chevron on right — DEFAULT in v11), flush (no border)
- Sizes: sm (40px header), md (48px), lg (64px)
- Each item: header row with chevron + title, expandable content area below
- Chevron: rotates 180° on expand, 110ms productive-entrance
- Header: hover = layer-hover-01, click = expand, Enter/Space activate
- Border: 1px solid `--cds-border-subtle-01` between items
- Source: https://v11.carbondesignsystem.com/components/accordion/usage/

### Task 3.18: breadcrumb.md

**Files:** Create: `skills/pixel-council/references/ibm/components/breadcrumb.md`

**Carbon-specific details:**
- Items: Link components separated by `/` (slash, not chevron)
- Slash separator: `--cds-text-secondary`, 8px margin on each side
- Last item (current page): `--cds-text-primary`, no link styling, `aria-current="page"`
- Truncation: long breadcrumbs collapse middle items into `...` with overflow menu
- Source: https://v11.carbondesignsystem.com/components/breadcrumb/usage/

### Task 3.19: tabs.md

**Files:** Create: `skills/pixel-council/references/ibm/components/tabs.md`

**Carbon-specific details:**
- Variants: line (default — bottom border indicates active), container (filled), contained (with bg), icon-only, vertical
- Line tabs: 48px tall, 16px horizontal padding per tab, 2px bottom border under active tab in `--cds-border-interactive` (blue-60)
- Container tabs: each tab is a filled button-like surface
- Icon-only tabs: 48px square with 16px icon, tooltip on hover
- Vertical tabs: full-height left rail with right-side border indicator
- Inactive label color: `--cds-text-secondary`, active = `--cds-text-primary`
- Hover: layer-hover-01 background
- Source: https://v11.carbondesignsystem.com/components/tabs/usage/

### Task 3.20: modal.md

**Files:** Create: `skills/pixel-council/references/ibm/components/modal.md`

**Carbon-specific details:**
- Sizes: xs (400px wide), sm (480px), md (672px), lg (832px)
- Anatomy: header (close X + title) + body + footer (secondary + primary buttons)
- Footer buttons: full-width, primary on right, secondary on left, NO gap between (touching) — Carbon distinctive
- Backdrop: `rgba(0, 0, 0, 0.5)` overlay
- Animation: 240ms expressive-entrance for modal slide-in from top, 150ms expressive-exit
- Passive variant: no footer, just title + body + close
- Transactional: with footer + actions
- Danger variant: red-60 primary button
- Source: https://v11.carbondesignsystem.com/components/modal/usage/

---

## Phase 4: Carbon-distinctive 15 components

These are the components that justify Carbon's place alongside Apple/Google. Author each with extra care — they're the differentiators.

### Task 4.1: data-table.md

**Files:** Create: `skills/pixel-council/references/ibm/components/data-table.md`

**Carbon-specific details (Carbon's flagship — author this with depth):**
- Variants: default, with toolbar, sortable, expandable rows, selectable rows, batch actions, with overflow menu, sticky header, zebra stripes
- Sizes: xs (24px row), sm (32px), md (40px), lg (48px), xl (64px) — row heights
- Header: `--cds-layer-accent-01` background, semibold text, sortable shows arrow on hover
- Row hover: `--cds-layer-hover-01`
- Selection: leftmost checkbox column, selected row = `--cds-layer-selected-01` background
- Batch action bar: appears at top when 1+ rows selected, shows "{n} item(s) selected" + action buttons + cancel
- Toolbar: search + filter + overflow menu + primary action button
- Expandable: chevron-right-16 in leftmost cell, rotates on expand, expanded content row spans full width
- Pagination: at bottom, 40px tall, items per page select + page nav
- Sticky header: `position: sticky; top: 0` with z-index above rows
- ARIA: `<table role="grid">` + `<th aria-sort>` + `<tr aria-selected>`
- Required: target 400-500 lines for this file (it's the flagship — depth matters)
- Source: https://v11.carbondesignsystem.com/components/data-table/usage/

### Task 4.2: tile.md

**Files:** Create: `skills/pixel-council/references/ibm/components/tile.md`

**Carbon-specific details:**
- Variants: clickable, expandable, selectable, multi-select, radio
- Background: `--cds-layer-01` (white in White theme, gray-90 in G100)
- Border: 1px solid transparent (rest), 1px solid `--cds-border-tile-01` on hover
- Padding: 16px (sm) or 24px (md) or 32px (lg)
- NO border-radius (sharp corners)
- NO box-shadow (Carbon doesn't use shadows on tiles)
- Selectable: shows checkmark in top-right when selected
- Multi-select: checkbox in top-left corner
- Expandable: chevron + tile expands vertically to reveal more content
- Click target: entire tile (when clickable)
- Source: https://v11.carbondesignsystem.com/components/tile/usage/

### Task 4.3: tree-view.md

**Files:** Create: `skills/pixel-council/references/ibm/components/tree-view.md`

**Carbon-specific details:**
- Hierarchical list with collapsible nodes
- Node: 32px tall (xs) or 40px (sm) row height
- Indent: 24px per level (chevron + label)
- Chevron-right rotates 90° on expand
- Selected node: `--cds-layer-selected-01` background
- Hover: `--cds-layer-hover-01`
- Optional icons: 16px icon between chevron and label
- ARIA: `<ul role="tree">` + `<li role="treeitem" aria-expanded aria-selected>`
- Keyboard: arrow keys for navigation, Enter to select, Right/Left to expand/collapse
- Source: https://v11.carbondesignsystem.com/components/tree-view/usage/

### Task 4.4: structured-list.md

**Files:** Create: `skills/pixel-council/references/ibm/components/structured-list.md`

**Carbon-specific details:**
- Variants: default, condensed, with selection (radio buttons in column 1)
- Header row + data rows, NO column lines (vertical), only horizontal row borders
- Header: 32px tall (default) or 24px (condensed), label-01 text
- Row: 48px tall (default) or 32px (condensed)
- Border: 1px bottom on each row, `--cds-border-subtle-01`
- More minimal than DataTable — used when you don't need DataTable's chrome
- Source: https://v11.carbondesignsystem.com/components/structured-list/usage/

### Task 4.5: contained-list.md

**Files:** Create: `skills/pixel-council/references/ibm/components/contained-list.md`

**Carbon-specific details:**
- Variants: on-page (within layout) or disclosed (in dropdown/popover)
- Sizes: sm (32px row), md (40px), lg (48px), xl (64px)
- Row: padding 0 16px, hover = layer-hover-01
- Optional icon left, optional action button right
- Action: icon button (overflow menu, edit, delete) appears on hover
- Source: https://v11.carbondesignsystem.com/components/contained-list/usage/

### Task 4.6: content-switcher.md

**Files:** Create: `skills/pixel-council/references/ibm/components/content-switcher.md`

**Carbon-specific details:**
- Carbon's segmented-control equivalent
- Sizes: sm (32px tall), md (40px), lg (48px)
- Container: layer-accent-01 background, 1px border
- Each segment: padding 0 16px, body-compact-01 text
- Selected segment: layer-01 background (lighter), 2px outline-style top border in border-interactive
- Hover (unselected): layer-hover-01
- Icon variant: icon-only segments at 32×32 each
- ARIA: `<button role="tab" aria-selected>` within `[role="tablist"]`
- Source: https://v11.carbondesignsystem.com/components/content-switcher/usage/

### Task 4.7: fluid-form.md

**Files:** Create: `skills/pixel-council/references/ibm/components/fluid-form.md`

**Carbon-specific details (Carbon-only pattern):**
- Form pattern where inputs share borders (no spacing between fields)
- Each input: 64px tall, label INSIDE the input (helper above, value below)
- No border on right/left of fields, only top + bottom = 1px solid border-subtle-01
- Stacking: inputs touch each other (no margin), border collapse
- Used in dense forms where space matters (modals, side panels)
- Wraps Fluid* variants of every input: FluidTextInput, FluidDropdown, FluidNumberInput, etc.
- Source: https://v11.carbondesignsystem.com/components/form/usage/ (fluid section)

### Task 4.8: progress-indicator.md

**Files:** Create: `skills/pixel-council/references/ibm/components/progress-indicator.md`

**Carbon-specific details:**
- Multi-step process / wizard stepper (NOT a progress bar — that's separate)
- Variants: horizontal, vertical, with optional step descriptions
- Each step: circle indicator (16px) + label + optional secondary label
- Indicator states: incomplete (empty circle, border-strong-01), current (filled blue-60), complete (filled blue-60 with white checkmark), invalid (red-60 with X), disabled (gray)
- Connector line: 1px solid border-subtle-01 between circles
- Current step: bold label
- Source: https://v11.carbondesignsystem.com/components/progress-indicator/usage/

### Task 4.9: code-snippet.md

**Files:** Create: `skills/pixel-council/references/ibm/components/code-snippet.md`

**Carbon-specific details:**
- Variants: inline (within text), single-line (one line, no expand), multi-line (with copy + expand)
- Background: `--cds-layer-01` for inline/single, `--cds-background` darker for multi
- Font: IBM Plex Mono, code-01 (12px) or code-02 (14px)
- Copy button: 32px square at top-right with copy-16 icon, "Copied!" tooltip on click
- Multi-line: max-height 240px collapsed, "Show more"/"Show less" toggle
- Expandable: button at bottom right toggles full content
- Source: https://v11.carbondesignsystem.com/components/code-snippet/usage/

### Task 4.10: file-uploader.md

**Files:** Create: `skills/pixel-council/references/ibm/components/file-uploader.md`

**Carbon-specific details:**
- Variants: button (simple file select), drop zone (drag area), uploaded files list
- Drop zone: 96px tall dashed border (`border-strong-01`) area, "Drag and drop files here or click to upload" text + button
- Dragover state: `--cds-background-active` background, `--cds-border-interactive` solid border
- File item: row showing filename + size + status icon (uploading spinner / success checkmark / error X) + close button to remove
- Multiple files: list stacks vertically with 1px divider
- Source: https://v11.carbondesignsystem.com/components/file-uploader/usage/

### Task 4.11: notification.md

**Files:** Create: `skills/pixel-council/references/ibm/components/notification.md`

**Carbon-specific details:**
- Variants: inline, toast, actionable (inline or toast with CTA button)
- Status types: error, success, warning, info, info-square
- Anatomy: status icon (left, 20px) + title + body + optional action button + close X
- Border-left: 3px solid status color (`--cds-support-error` etc.)
- Background: `--cds-notification-background-{status}` (very light tint of status color)
- Sizes: low-contrast (subtle bg) or high-contrast (filled bg)
- Toast: positioned bottom-right, max-width 320px, auto-dismisses after 6s
- Inline: full-width, no auto-dismiss
- Source: https://v11.carbondesignsystem.com/components/notification/usage/

### Task 4.12: overflow-menu.md

**Files:** Create: `skills/pixel-council/references/ibm/components/overflow-menu.md`

**Carbon-specific details:**
- Trigger: 32px square icon button with overflow-menu-vertical-16 icon (3 dots vertical)
- Menu: opens below or above trigger (auto-flip), 160px+ wide, layer-01 background
- Menu item: 40px tall, padding 0 16px, body-compact-01 text
- Hover: layer-hover-01
- Item with icon: 16px icon at left, 16px gap to label
- Submenu: chevron-right at item right side, opens menu to the right
- Divider: 1px border-subtle-01 line between item groups
- Danger item: red-60 text color
- Source: https://v11.carbondesignsystem.com/components/overflow-menu/usage/

### Task 4.13: popover.md

**Files:** Create: `skills/pixel-council/references/ibm/components/popover.md`

**Carbon-specific details:**
- Click-triggered surface (vs hover-triggered tooltip)
- Caret pointing to anchor element (top/right/bottom/left, plus -start/-end variants for 12 total positions)
- Background: `--cds-layer-01`, 1px border `--cds-border-subtle-01`
- Border-radius: 2px (one of the few Carbon components with rounding)
- Padding: 16px content
- Auto-flip when near viewport edge
- Toggletip variant: smaller popover for help text triggered by info icon
- ARIA: `<button aria-haspopup="dialog" aria-expanded>` + `<div role="dialog">`
- Source: https://v11.carbondesignsystem.com/components/popover/usage/

### Task 4.14: pagination.md

**Files:** Create: `skills/pixel-council/references/ibm/components/pagination.md`

**Carbon-specific details:**
- Variants: pagination (full — items per page + page nav + count text), pagination-nav (just page numbers)
- Layout: "Items per page: {select}" + "{start}-{end} of {total}" + nav arrows + page select
- Height: 40px (sm) or 48px (md)
- Background: `--cds-layer-01`, top border 1px border-subtle-01
- Page select: dropdown showing current page, opens to choose any page
- Arrows: chevron-left and chevron-right icon buttons, disabled at start/end
- PaginationNav: standalone numbered buttons (1, 2, 3, ..., 10)
- Source: https://v11.carbondesignsystem.com/components/pagination/usage/

### Task 4.15: tag.md

**Files:** Create: `skills/pixel-council/references/ibm/components/tag.md`

**Carbon-specific details:**
- Variants: read-only (informational), filter (with X to remove), operational (clickable), selectable
- Sizes: sm (16px tall), md (24px tall), lg (32px)
- Border-radius: `2px` (Carbon exception — sharp + slight rounding)
- Colors: gray, red, magenta, purple, blue, cyan, teal, green, warm-gray, cool-gray, high-contrast, outline (12 color variants)
- Each color: light bg + dark text in light theme, dark bg + light text in dark
- Filter tag: includes 16px X icon at right (close-16)
- Operational: hover state, click triggers action
- Source: https://v11.carbondesignsystem.com/components/tag/usage/

---

## Phase 5: AI/App-shell 3 components

These distinguish Carbon as the AI-era and enterprise-shell choice.

### Task 5.1: ai-label.md

**Files:** Create: `skills/pixel-council/references/ibm/components/ai-label.md`

**Carbon-specific details (Carbon's 2024+ unique system — author with extra care):**

This file documents three related components: AILabel, AISkeleton, ChatButton, plus the AI token system.

- **AILabel**: small inline badge with "AI" text or sparkle icon
  - Sizes: xs (16px), sm (20px), md (24px), lg (32px)
  - Background: AI Aura gradient (`linear-gradient(135deg, #4870B5, #B58BE2)` style — pull exact from `--cds-ai-aura-start` / `--cds-ai-aura-end`)
  - Border: 1px solid using `--cds-ai-border-strong`
  - When clicked: opens AI popover with explanation
- **AI surface tokens**:
  - `--cds-ai-aura-start` / `--cds-ai-aura-end`: gradient endpoints (purple/blue range)
  - `--cds-ai-aura-hover-start` / `--cds-ai-aura-hover-end`: hover gradient
  - `--cds-ai-border-strong`: strong border for AI elements
  - `--cds-ai-inner-shadow`: inner glow for AI tile/modal
  - `--cds-ai-popover-background`: AI popover background (slightly differentiated from layer-01)
  - `--cds-ai-overlay`: full-page overlay tint when AI processing
  - `--cds-ai-skeleton-background` / `--cds-ai-skeleton-element-background`: skeleton placeholder colors with AI aura
- **AISkeleton**: skeleton loader with subtle aura animation pulsing (instead of gray pulse)
  - Animation: 1.6s cycle, aura gradient shifts left-to-right
- **ChatButton**: chat-specific button with chat-bubble-shaped affordance
  - Variants: user (right-aligned, blue), agent (left-aligned, gray)
  - Used inside chat shell pattern
- **AI Aura on Tile/Modal**: when wrapping a tile or modal in `data-ai="true"`, apply gradient border:
```css
.cds--tile[data-ai="true"] {
  border: 1px solid transparent;
  background:
    linear-gradient(var(--cds-layer-01), var(--cds-layer-01)) padding-box,
    linear-gradient(135deg, var(--cds-ai-border-start), var(--cds-ai-border-end)) border-box;
}
```
- Source: https://carbondesignsystem.com/components/ai-label/usage/ (and related AI docs)

### Task 5.2: ui-shell.md

**Files:** Create: `skills/pixel-council/references/ibm/components/ui-shell.md`

**Carbon-specific details:**

UIShell is Carbon's app-shell pattern (like Material's app bar + drawer combined).

- **Header**: 48px tall horizontal bar across top
  - Background: `--cds-background` (white in White theme, gray-100 in G100)
  - Border-bottom: 1px solid `--cds-border-subtle-00`
  - Anatomy left-to-right: hamburger icon (toggle SideNav) → product name + branding → spacer → global actions row (search, switcher, notifications, user menu, app switcher)
  - Each global action: 48×48 icon button
  - Active action button: layer-selected-01 background
- **SideNav**: 256px (expanded) / 48px (rail) collapsible left navigation
  - Background: `--cds-background`
  - Items: 32px tall (default), padding 0 16px, hover = layer-hover-01
  - Active item: layer-selected-01 + 4px left border in `--cds-border-interactive` (blue-60)
  - Submenu: items indent 16px deeper, chevron-down rotates on expand
  - Rail mode: only icons visible, label appears on hover as tooltip
- **HeaderPanel**: right-aligned drawer that slides in (notifications, user menu)
  - 320px wide, 100vh tall, layer-01 background
- **Switcher**: app switcher dropdown showing other IBM products/apps
- **Layout slots**: header at top + sidenav at left + main content fills the rest
- **Responsive**: at sm/md, sidenav becomes off-canvas (hidden + hamburger toggles overlay)
- This is a 350-450 line file — major component
- Source: https://v11.carbondesignsystem.com/components/UI-shell-header/usage/ + UI-shell-side-nav

### Task 5.3: page-header.md

**Files:** Create: `skills/pixel-council/references/ibm/components/page-header.md`

**Carbon-specific details:**

Product page header (NOT marketing hero — that's in `page-patterns.md`). Sits at the top of a content area inside UIShell.

- Anatomy (top to bottom): breadcrumb row → title row (with optional buttons on right) → tabs (optional) → border-bottom
- Background: `--cds-layer-01`
- Padding: 16px top, 16px sides, 32px bottom
- Title: heading-04 (productive 28px) by default, can be heading-06 (42px) for "hero" variant
- Action buttons: aligned right, secondary + primary
- Tab strip: optional — uses Tabs component below title
- Sticky scroll behavior: title compresses to body-01 size when scrolled past, becomes a smaller persistent header
- Source: https://v11.carbondesignsystem.com/components/page-header/usage/

---

## Phase 6: SKILL.md integration

The skill must detect, route, and apply Carbon. Six surgical edits to `skills/pixel-council/SKILL.md`.

### Task 6.1: Update SKILL.md frontmatter

**Files:** Modify: `skills/pixel-council/SKILL.md:1-5`

- [ ] **Step 1: Edit the description in YAML frontmatter**

The current frontmatter:
```yaml
---
name: pixel-council
description: "Build, design, improve, or fix any UI using production-grade design tokens and specs from Google Material Design 3 and Apple HIG. Access 86 reference files with exact colors, dimensions, CSS, all interaction states (hover/focus/active/disabled), dark mode tokens, animations, page-level composition patterns, editorial typography, and icon systems (Material Symbols + SF Symbols). Trigger when user mentions: building UI, designing pages/components/forms/dashboards, Material Design, Apple HIG, or professional-looking interfaces. The specs prevent guessing colors and missing states — you produce pixel-perfect output with proper theming and composition."
user_invocable: true
---
```

Replace the `description:` line with:
```yaml
description: "Build, design, improve, or fix any UI using production-grade design tokens and specs from Google Material Design 3, Apple HIG, and IBM Carbon Design System. Access 129 reference files with exact colors, dimensions, CSS, all interaction states (hover/focus/active/disabled), 4 themes (Carbon: White/G10/G90/G100), animations, page-level composition patterns, editorial typography, AI surface tokens, and icon systems (Material Symbols + SF Symbols + Carbon Icons). Trigger when user mentions: building UI, designing pages/components/forms/dashboards, Material Design, Apple HIG, IBM Carbon, enterprise dashboards, AI interfaces, or professional-looking interfaces. The specs prevent guessing colors and missing states — you produce pixel-perfect output with proper theming and composition."
```

- [ ] **Step 2: Verify**

Run: `head -5 skills/pixel-council/SKILL.md`
Expected: description mentions IBM Carbon and "129 reference files".

- [ ] **Step 3: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): update frontmatter to include Carbon (129 ref files)"
```

### Task 6.2: Update Step 0 system detection

**Files:** Modify: `skills/pixel-council/SKILL.md` (around line 30, the "Design system" detection rule)

- [ ] **Step 1: Edit the design system detection line**

Find this line:
```
- **Design system**: "Google" / "Material" / "M3" → Google. "Apple" / "iOS" / "HIG" → Apple. Nothing specified → Blended (default).
```

Replace with:
```
- **Design system**: "Google" / "Material" / "M3" → Google. "Apple" / "iOS" / "HIG" → Apple. "IBM" / "Carbon" / "Plex" / "enterprise dashboard" / "data table" / "AI app" / "chat interface" → IBM. Nothing specified → Blended (default).
```

- [ ] **Step 2: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): detect IBM/Carbon/Plex/enterprise/AI keywords in Step 0"
```

### Task 6.3: Update Step 1 reference table and Step 3.4 reading order

**Files:** Modify: `skills/pixel-council/SKILL.md` (Step 1 reference structure block, Page-Level Reference Files table, Step 3.4 table)

- [ ] **Step 1: Add IBM rows to the reference structure block (around line 89-96)**

Find the block:
```
references/
├── google/overview.md              # M3 colors, elevation, typography, motion
├── google/components/*.md           # 32 component specs
├── apple/overview.md                # System colors, SF Pro, Liquid Glass, shadows
├── apple/components/*.md            # 33 component specs
├── blended/design-principles.md     # Spacing, breakpoints, easing, accessibility
└── blended/components/*.md          # 12 blended component specs
```

Replace with:
```
references/
├── google/overview.md              # M3 colors, elevation, typography, motion
├── google/components/*.md           # 32 component specs
├── apple/overview.md                # System colors, SF Pro, Liquid Glass, shadows
├── apple/components/*.md            # 33 component specs
├── ibm/overview.md                  # Carbon 4 themes, IBM Plex, motion, 2x grid, shape rules
├── ibm/components/*.md              # 38 component specs
├── ibm/pictograms.md                # Editorial illustrations (Carbon-only)
├── blended/design-principles.md     # Spacing, breakpoints, easing, accessibility
└── blended/components/*.md          # 12 blended component specs
```

- [ ] **Step 2: Add IBM bullet to Overview files list (around line 100-103)**

Find:
```markdown
- [Google M3 Overview](references/google/overview.md) — 34 colors, typography, elevation, motion
- [Apple HIG Overview](references/apple/overview.md) — System colors, SF Pro, Liquid Glass, shadows
- [Blended Design Principles](references/blended/design-principles.md) — Spacing, breakpoints, easing, accessibility
```

Replace with:
```markdown
- [Google M3 Overview](references/google/overview.md) — 34 colors, typography, elevation, motion
- [Apple HIG Overview](references/apple/overview.md) — System colors, SF Pro, Liquid Glass, shadows
- [IBM Carbon Overview](references/ibm/overview.md) — 4 themes (White/G10/G90/G100), IBM Plex, motion, 2x grid, sharp corners
- [Blended Design Principles](references/blended/design-principles.md) — Spacing, breakpoints, easing, accessibility
```

- [ ] **Step 3: Update Page-Level Reference Files table (around line 106-110)**

Find:
```markdown
| Reference | Google | Apple | Purpose |
|-----------|--------|-------|---------|
| Page Patterns | [page-patterns.md](references/google/page-patterns.md) | [page-patterns.md](references/apple/page-patterns.md) | Hero layouts, section composition, spacing rhythm, feature showcases |
| Editorial Typography | [editorial-type.md](references/google/editorial-type.md) | [editorial-type.md](references/apple/editorial-type.md) | Marketing type scale (48-96px display headlines) extending beyond UI scale |
| Icons | [icons.md](references/google/icons.md) | [icons.md](references/apple/icons.md) | Icon system for web — Material Symbols (Google) / SF Symbols (Apple) |
```

Replace with:
```markdown
| Reference | Google | Apple | IBM | Purpose |
|-----------|--------|-------|-----|---------|
| Page Patterns | [page-patterns.md](references/google/page-patterns.md) | [page-patterns.md](references/apple/page-patterns.md) | [page-patterns.md](references/ibm/page-patterns.md) | Hero layouts, section composition, spacing rhythm, feature showcases, UIShell (IBM only) |
| Editorial Typography | [editorial-type.md](references/google/editorial-type.md) | [editorial-type.md](references/apple/editorial-type.md) | [editorial-type.md](references/ibm/editorial-type.md) | Marketing type scale (48-96px display headlines) extending beyond UI scale |
| Icons | [icons.md](references/google/icons.md) | [icons.md](references/apple/icons.md) | [icons.md](references/ibm/icons.md) | Icon system for web — Material Symbols / SF Symbols / Carbon Icons (Apache 2.0, web-OK) |
| Pictograms | — | — | [pictograms.md](references/ibm/pictograms.md) | Editorial illustrations for marketing (Carbon-only) |
```

- [ ] **Step 4: Update Step 3.4 reading-order table**

Find the table that starts with:
```markdown
| User chose      | Read first                                                              | Then read components                                   |
| --------------- | ----------------------------------------------------------------------- | ------------------------------------------------------ |
| Google / M3     | [google/overview.md](references/google/overview.md) + page-level files  | `google/components/{component}.md` for ALL identified  |
| Apple / HIG     | [apple/overview.md](references/apple/overview.md) + page-level files    | `apple/components/{component}.md` for ALL identified   |
| Blend (default) | [blended/design-principles.md](references/blended/design-principles.md) | `blended/components/{component}.md` for ALL identified |
```

Add IBM row between Apple and Blend:
```markdown
| User chose      | Read first                                                              | Then read components                                   |
| --------------- | ----------------------------------------------------------------------- | ------------------------------------------------------ |
| Google / M3     | [google/overview.md](references/google/overview.md) + page-level files  | `google/components/{component}.md` for ALL identified  |
| Apple / HIG     | [apple/overview.md](references/apple/overview.md) + page-level files    | `apple/components/{component}.md` for ALL identified   |
| IBM / Carbon    | [ibm/overview.md](references/ibm/overview.md) + page-level files (incl. pictograms.md) | `ibm/components/{component}.md` for ALL identified |
| Blend (default) | [blended/design-principles.md](references/blended/design-principles.md) | `blended/components/{component}.md` for ALL identified |
```

- [ ] **Step 5: Also update the Step 3.2 directory survey table (around line 207-211)**

Find:
```markdown
| User chose      | List this directory                         |
| --------------- | ------------------------------------------- |
| Google / M3     | `references/google/components/` (32 files)  |
| Apple / HIG     | `references/apple/components/` (33 files)   |
| Blend (default) | `references/blended/components/` (12 files) |
```

Replace with:
```markdown
| User chose      | List this directory                         |
| --------------- | ------------------------------------------- |
| Google / M3     | `references/google/components/` (32 files)  |
| Apple / HIG     | `references/apple/components/` (33 files)   |
| IBM / Carbon    | `references/ibm/components/` (38 files)     |
| Blend (default) | `references/blended/components/` (12 files) |
```

- [ ] **Step 6: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): add IBM rows to reference table, page-level table, reading order, directory survey"
```

### Task 6.4: Add IBM column to Component File Mapping table

**Files:** Modify: `skills/pixel-council/SKILL.md` (the large Component Mapping table around line 118-170)

- [ ] **Step 1: Add IBM column to the table**

For each existing row in the Component File Mapping table, append a new column with the corresponding IBM file (or `—` if no equivalent). Add new rows at the bottom for Carbon-distinctive components.

Existing standard mappings to add:
- Button → `[button.md](references/ibm/components/button.md)`
- Text Input → `[text-input.md](references/ibm/components/text-input.md)`
- Card → `[tile.md](references/ibm/components/tile.md)` (Carbon's equivalent)
- Dialog/Modal → `[modal.md](references/ibm/components/modal.md)`
- Nav (bottom) → `—` (Carbon doesn't use bottom nav — UIShell instead)
- Nav (side) → `[ui-shell.md](references/ibm/components/ui-shell.md)`
- Toggle/Switch → `[toggle.md](references/ibm/components/toggle.md)`
- List → `[contained-list.md](references/ibm/components/contained-list.md)`
- Chip/Tag → `[tag.md](references/ibm/components/tag.md)`
- Progress → `[progress-indicator.md](references/ibm/components/progress-indicator.md)`
- Toast/Snackbar → `[notification.md](references/ibm/components/notification.md)`
- Tabs → `[tabs.md](references/ibm/components/tabs.md)`
- Menu → `[overflow-menu.md](references/ibm/components/overflow-menu.md)`
- Checkbox → `[checkbox.md](references/ibm/components/checkbox.md)`
- Radio → `[radio-button.md](references/ibm/components/radio-button.md)`
- Select → `[select.md](references/ibm/components/select.md)` and `[dropdown.md](references/ibm/components/dropdown.md)`
- Slider → `[slider.md](references/ibm/components/slider.md)`
- Icon Button → `[button.md](references/ibm/components/button.md)` (icon-only variant documented in button.md)
- Divider → `—` (Carbon uses borders, no divider component)
- FAB → `—` (not in Carbon)
- Badge → `[tag.md](references/ibm/components/tag.md)` (Carbon uses Tags as badges)
- Tooltip → `[popover.md](references/ibm/components/popover.md)` (Toggletip variant)
- Top App Bar → `[ui-shell.md](references/ibm/components/ui-shell.md)`
- Search Bar → `[search.md](references/ibm/components/search.md)`
- Segmented Button → `[content-switcher.md](references/ibm/components/content-switcher.md)`
- Date Picker → `[date-picker.md](references/ibm/components/date-picker.md)`
- Time Picker → `[time-picker.md](references/ibm/components/time-picker.md)`

Append NEW rows for Carbon-distinctive components (with `—` in Google/Apple/Blended columns):
```markdown
| Data Table          | —                                                                         | [table.md](references/apple/components/table.md)                           | [data-table.md](references/ibm/components/data-table.md)         | —                                                                  |
| Tile                | [card.md](references/google/components/card.md)                           | [card.md](references/apple/components/card.md)                             | [tile.md](references/ibm/components/tile.md)                     | [card.md](references/blended/components/card.md)                   |
| Tree View           | —                                                                         | —                                                                          | [tree-view.md](references/ibm/components/tree-view.md)           | —                                                                  |
| Structured List     | —                                                                         | —                                                                          | [structured-list.md](references/ibm/components/structured-list.md) | —                                                                |
| Content Switcher    | [segmented-button.md](references/google/components/segmented-button.md)   | [segmented-control.md](references/apple/components/segmented-control.md)   | [content-switcher.md](references/ibm/components/content-switcher.md) | —                                                              |
| Fluid Form          | —                                                                         | —                                                                          | [fluid-form.md](references/ibm/components/fluid-form.md)         | —                                                                  |
| Stepper             | —                                                                         | [stepper.md](references/apple/components/stepper.md)                       | [progress-indicator.md](references/ibm/components/progress-indicator.md) | —                                                           |
| Code Snippet        | —                                                                         | —                                                                          | [code-snippet.md](references/ibm/components/code-snippet.md)     | —                                                                  |
| File Uploader       | —                                                                         | —                                                                          | [file-uploader.md](references/ibm/components/file-uploader.md)   | —                                                                  |
| Notification        | [snackbar.md](references/google/components/snackbar.md)                   | —                                                                          | [notification.md](references/ibm/components/notification.md)     | [toast.md](references/blended/components/toast.md)                 |
| Pagination          | —                                                                         | —                                                                          | [pagination.md](references/ibm/components/pagination.md)         | —                                                                  |
| AI Label            | —                                                                         | —                                                                          | [ai-label.md](references/ibm/components/ai-label.md)             | —                                                                  |
| UI Shell            | [navigation-drawer.md](references/google/components/navigation-drawer.md) | [sidebar.md](references/apple/components/sidebar.md)                       | [ui-shell.md](references/ibm/components/ui-shell.md)             | —                                                                  |
| Page Header         | [top-app-bar.md](references/google/components/top-app-bar.md)             | [navigation-bar.md](references/apple/components/navigation-bar.md)         | [page-header.md](references/ibm/components/page-header.md)       | —                                                                  |
| MultiSelect         | —                                                                         | —                                                                          | [multi-select.md](references/ibm/components/multi-select.md)     | —                                                                  |
| ComboBox            | —                                                                         | —                                                                          | [combo-box.md](references/ibm/components/combo-box.md)           | —                                                                  |
| Number Input        | —                                                                         | [stepper.md](references/apple/components/stepper.md)                       | [number-input.md](references/ibm/components/number-input.md)     | —                                                                  |
| Text Area           | —                                                                         | —                                                                          | [text-area.md](references/ibm/components/text-area.md)           | —                                                                  |
| Link                | —                                                                         | —                                                                          | [link.md](references/ibm/components/link.md)                     | —                                                                  |
| Accordion           | —                                                                         | [disclosure-group.md](references/apple/components/disclosure-group.md)     | [accordion.md](references/ibm/components/accordion.md)           | —                                                                  |
| Breadcrumb          | —                                                                         | —                                                                          | [breadcrumb.md](references/ibm/components/breadcrumb.md)         | —                                                                  |
| Popover             | —                                                                         | [popover.md](references/apple/components/popover.md)                       | [popover.md](references/ibm/components/popover.md)               | —                                                                  |
```

The exact placement (alphabetized vs grouped) should match the existing table's organization — append new rows in the same style.

- [ ] **Step 2: Verify table renders**

Run: `grep -c '| .* |.* |.* |.* |' skills/pixel-council/SKILL.md`
Expected: at least 60 table row matches (existing + new).

- [ ] **Step 3: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): add IBM column + 22 Carbon-distinctive rows to component mapping"
```

### Task 6.5: Add IBM Carbon platform polish to Step 4C

**Files:** Modify: `skills/pixel-council/SKILL.md` (Step 4C, around line 437-458)

- [ ] **Step 1: Add IBM Carbon subsection between Apple and Blended**

Find the section starting with `### 4C. Platform-Specific Polish` and ending before `### 4D. Theme Implementation Pattern`.

After the `**Apple Human Interface Guidelines:**` block and before `**Blended / Custom:**` block, insert this new block:

```markdown
**IBM Carbon Design System:**

- **Sharp corners by default** (`border-radius: 0`). Only Tag/Tooltip/Popover use `2px`. Adding any other border-radius is the #1 way to make output look non-Carbon.
- **Layer tier nesting**: Background → Layer-01 → Layer-02 → Layer-03 (use `data-layer="01"` attribute or nested `.cds--layer` classes). This is Carbon's surface-elevation alternative — NOT shadows, NOT tonal elevation.
- **IBM Plex font stack**: `'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif` + `-webkit-font-smoothing: antialiased`. Load via Google Fonts CDN.
- **Productive vs Expressive motion**:
  - Productive (70-150ms, productive easing curves) = UI feedback (button hover, dropdown open, focus ring)
  - Expressive (240-700ms, expressive easing curves) = entrances/large surfaces (modal slide-in, page transitions, hero animations)
- **2x grid**: 16-column with 32px gutters (wide). Breakpoints: sm 320 / md 672 / lg 1056 / xlg 1312 / max 1584. Max-width 1584px for marketing pages.
- **Focus ring**: `outline: 2px solid var(--cds-focus); outline-offset: 0; box-shadow: inset 0 0 0 1px var(--cds-background);` — Carbon's signature double-ring focus (NOT outline-offset like Apple, NOT state-layer like M3).
- **Hover on filled buttons** = darker shade of the same color (e.g., blue-60 → blue-70). NOT opacity change (Apple), NOT state layer overlay (M3).
- **AI surfaces**: when an interface deals with AI generation/chat, apply `data-ai="true"` to wrapping element and use the `--cds-ai-aura-*` gradient border + `--cds-ai-inner-shadow` glow + AILabel "AI" badge inline.
- **Spacing on 4px grid** that doubles: 2, 4, 8, 12, 16, 24, 32, 40, 48, 64, 80, 96, 160px. NEVER use values outside this scale.
- **NO drop shadows**, **NO border-radius**, **NO tonal elevation**, **NO Liquid Glass** — Carbon is FLAT and uses Layer tiers + sharp borders for hierarchy.
```

- [ ] **Step 2: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): add IBM Carbon platform polish to Step 4C"
```

### Task 6.5b: Add the verbatim-source rule to Step 4A (Carbon-specific override)

**Files:** Modify: `skills/pixel-council/SKILL.md` (Step 4A — Framework Translation section)

This is the most important Carbon-specific behavior change. The general Step 4A instruction is "translate the spec into your framework" — that works for Apple/Google because their reference files are paraphrased patterns. For Carbon, the reference files contain the actual Carbon source code, so the agent must output that code verbatim, not regenerate it.

- [ ] **Step 1: Add a Carbon-specific override block at the END of Step 4A**

After the existing framework translation guidance (Tailwind/React/RN/Vue), insert:

```markdown
**IBM Carbon — verbatim source override (mandatory for IBM/Carbon system):**

Unlike Apple and Google specs (which are paraphrased patterns you translate), Carbon component reference files embed the **actual Carbon source code from Storybook** — both React (`{Component}.stories.js`) and Web Components (`{component}.stories.ts`). When the locked design system is IBM/Carbon:

1. **Output the embedded code AS-IS.** Do NOT regenerate the markup. Do NOT paraphrase the JSX or HTML. Copy the verbatim ```jsx``` block from the "React (verbatim from Storybook)" section directly into your output.
2. **Keep `cds--*` and `<cds-*>` class/element names exactly.** Don't rename them. Don't substitute generic `<button>` for `<cds-button>` — Carbon's web components ARE the API surface.
3. **For React projects:** copy from Section 5 (React verbatim). Include the imports from `@carbon/react`.
4. **For non-React projects (HTML, Vue, Svelte, Astro, etc.):** copy from Section 6 (WC verbatim) or Section 7 (Plain HTML derived). Use `@carbon/web-components` import.
5. **Allowed swaps:** text content, event handlers, prop values (size="lg", kind="primary"). NOT structure, NOT class names, NOT element names.
6. **The reference file IS the deliverable** for Carbon — your job is composition (which variants, which sizes, what data) and theming (White vs G100), not implementing the components yourself.

This rule is Carbon-specific and overrides the general "translate the spec" guidance above. For Apple and Google, continue translating spec → framework as normal.
```

- [ ] **Step 2: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): add Carbon verbatim-source override to Step 4A"
```

### Task 6.6: Add Carbon page rules to Step 4B

**Files:** Modify: `skills/pixel-council/SKILL.md` (Step 4B section around line 414-433)

- [ ] **Step 1: Add IBM Carbon pages subsection**

Find the section with `**Apple HIG pages:**` and `**Google M3 pages:**` blocks. After the Google M3 block, insert:

```markdown
**IBM Carbon pages:**
- **Marketing/landing**: use `.cds--page` (max-width 1584px centered). Dashboards/apps use `.cds--dashboard` (full-width, no max-width).
- **Pictograms are mandatory for marketing illustrations** — use `@carbon/pictograms` SVGs ONLY (load via `<img src="https://unpkg.com/@carbon/pictograms/svg/{name}.svg">` or `import { Analytics } from '@carbon/pictograms-react'`). NEVER use custom illustrations, NEVER use emoji, NEVER use icons-as-pictograms. The agent must look up the pictogram by name from `pictograms.md` and embed it directly. If the needed pictogram doesn't exist in `@carbon/pictograms`, pick the closest match from the catalog — don't invent one.
- **Pictogram sizing in marketing**: 64-96px (feature cards), 96-128px (hero), 32-48px (sidebar nav). NEVER smaller than 32px (that's icon territory).
- **NO drop shadows** on Tiles in marketing — use Layer-01 / Layer-02 alternation for depth instead.
- **Editorial scale** for marketing: fluid-display-04 (42-92px responsive) for heroes. **Productive scale** for product UI (heading-01..07, body-01/02). Read `editorial-type.md` for marketing.
- **LEFT-aligned heroes** (NOT centered) — IBM.com convention. Eyebrow → fluid-display headline → body-02 → primary + secondary buttons.
- **96-160px between sections** (heavy whitespace). NEVER cram sections together.
- **NO emoji ANYWHERE** — use `@carbon/icons` (UI/inline) or `@carbon/pictograms` (marketing/editorial). Emoji breaks the Carbon look instantly.
- **For dashboards**: UIShell (header + sidenav) + DataTable as primary content + Tile grids on Layer-01 background. Read `ui-shell.md` and `data-table.md`.
- **For AI interfaces**: wrap key surfaces with `data-ai="true"` for AI Aura border, use AILabel inline, follow chat shell pattern from `page-patterns.md`.
- **Sharp corners everywhere** — `border-radius: 0` on every container, button, tile, input. Tags/Tooltips/Popovers are the only exceptions (`2px`).
```

- [ ] **Step 2: Commit**

```bash
git add skills/pixel-council/SKILL.md
git commit -m "feat(skill): add Carbon page-level rules to Step 4B"
```

---

## Phase 7: Plugin metadata + docs

Update the plugin manifest, README, and CLAUDE.md.

### Task 7.1: Update .claude-plugin/plugin.json

**Files:** Modify: `.claude-plugin/plugin.json`

- [ ] **Step 1: Update description**

Replace the current description with:
```json
"description": "Build production-grade UI using real design system specifications from Google Material Design 3, Apple HIG, and IBM Carbon. Includes complete design tokens (4 themes for Carbon), interaction states, page composition patterns, icon systems (Material Symbols + SF Symbols + Carbon Icons), pictograms, AI surface tokens, and editorial typography — so Claude builds like a senior designer, not a prompt guesser."
```

- [ ] **Step 2: Commit**

```bash
git add .claude-plugin/plugin.json
git commit -m "feat: update plugin description to mention IBM Carbon"
```

### Task 7.2: Update README.md

**Files:** Modify: `README.md`

- [ ] **Step 1: Read current README to understand structure**

Run: `cat README.md`
Note the current sections that mention "Google" / "Apple" / file counts.

- [ ] **Step 2: Add IBM Carbon to all relevant sections**

For each section that lists supported design systems, add IBM Carbon:
- Headline / one-liner: include "IBM Carbon"
- Supported systems list: add "IBM Carbon Design System (Apache 2.0)" with brief description
- File count totals: update from 86 to 129
- Component count: update to reflect 38 IBM + existing
- Project structure diagram: add `references/ibm/` block with overview, icons, pictograms, editorial-type, page-patterns, components/

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "docs: add IBM Carbon to README — 129 reference files, 3 design systems"
```

### Task 7.3: Update CLAUDE.md

**Files:** Modify: `CLAUDE.md`

- [ ] **Step 1: Update the project structure diagram**

Find the `## Project Structure` section. Add `ibm/` block to the references tree:
```
│   │           ├── ibm/                # IBM Carbon Design System
│   │           │   ├── overview.md     # 4 themes (White/G10/G90/G100), IBM Plex, motion, 2x grid
│   │           │   ├── icons.md        # @carbon/icons (Apache 2.0), 24 inlined SVGs
│   │           │   ├── pictograms.md   # Editorial illustrations (Carbon-only)
│   │           │   ├── editorial-type.md  # Expressive + Fluid + Display scale
│   │           │   ├── page-patterns.md   # IBM.com sections, UIShell, dashboards
│   │           │   └── components/     # 38 component specs
```

Update line 1 description to mention Carbon.

Update the file count description: "86 reference files" → "129 reference files".

Add note about Carbon's distinctive features (sharp corners, 4 themes, AI tokens, web-redistributable Carbon Icons).

- [ ] **Step 2: Commit**

```bash
git add CLAUDE.md
git commit -m "docs: update CLAUDE.md project structure to include IBM Carbon"
```

---

## Phase 8: Verification

Run the install + acceptance test prompt + final checks.

### Task 8.1: Run validation script on the full ibm/ folder

- [ ] **Step 1: Run validation**

Run: `./scripts/validate-carbon-refs.sh skills/pixel-council/references/ibm`
Expected: `Checked: 43 files | Failed: 0` (5 page-level + 38 components)

If any failures, fix them inline and re-run until clean.

### Task 8.2: Verify file count and structure

- [ ] **Step 1: Count reference files**

Run: `find skills/pixel-council/references -name "*.md" | wc -l`
Expected: 129 (86 previous + 5 ibm top-level + 38 ibm components)

- [ ] **Step 2: Verify ibm/ directory tree**

Run: `find skills/pixel-council/references/ibm -type f | sort`
Expected: 43 files (5 top-level + 38 in components/)

- [ ] **Step 3: Verify all components have unique names matching planned list**

Run: `ls skills/pixel-council/references/ibm/components/ | sort`
Expected: exactly these 38 files (alphabetical):
```
accordion.md ai-label.md breadcrumb.md button.md checkbox.md code-snippet.md combo-box.md contained-list.md content-switcher.md data-table.md date-picker.md dropdown.md file-uploader.md fluid-form.md link.md modal.md multi-select.md notification.md number-input.md overflow-menu.md page-header.md pagination.md popover.md progress-indicator.md radio-button.md search.md select.md slider.md structured-list.md tabs.md tag.md text-area.md text-input.md tile.md time-picker.md toggle.md tree-view.md ui-shell.md
```

### Task 8.3: Run install.sh and verify

- [ ] **Step 1: Run install in skill mode**

Run: `cd "/Users/shubhamshrivastava/coding projects/pixel-council" && ./install.sh`
Type: `2` (Skill install)

Expected output: shows the new file count "Pixel Council Installer (129 reference files)" and reports `Installed: ... References: ~/.agents/skills/pixel-council/references/ (129 files)`.

- [ ] **Step 2: Verify install location has IBM folder**

Run: `ls ~/.agents/skills/pixel-council/references/ibm/`
Expected: shows `overview.md icons.md pictograms.md editorial-type.md page-patterns.md components/`

### Task 8.4: Run the acceptance test prompt

- [ ] **Step 1: Open a fresh Claude Code session** (or use the current one if you can isolate context)

- [ ] **Step 2: Type this exact prompt:**
```
Build a Carbon-styled enterprise dashboard with sidebar and a data table showing 5 sample rows of user data
```

- [ ] **Step 3: Verify the agent's plan + output meets these criteria**

The architectural plan output should include:
- Locked design system: **IBM Carbon**
- Reads `ibm/overview.md`, `ibm/page-patterns.md`, `ibm/icons.md` BEFORE component files
- Reads at least: `ui-shell.md`, `data-table.md`, `tile.md`, `button.md`, `text-input.md` (or similar 6+)
- Mentions both **White and G100** themes with theme toggle

The generated HTML/CSS output should have:
- **Verbatim Carbon class names** — `cds--btn`, `cds--data-table`, `cds--header`, `cds--side-nav`, `cds--tile`, etc. NOT generic `<button class="btn-primary">` or invented class names
- **Verbatim Carbon elements** — for HTML/non-React projects, the output uses `<cds-button>`, `<cds-data-table>`, etc. (Carbon Web Components element names). For React projects, uses `<Button kind="primary">`, `<DataTable>` from `@carbon/react` imports
- **An import statement** at the top — either `@import '@carbon/styles/css/styles.css'` for HTML, or `import { Button, DataTable } from '@carbon/react'` for React
- `border-radius: 0` on every component (or `2px` on Tag/Tooltip/Popover only)
- IBM Plex font stack in CSS
- 2-column UIShell layout (header + sidenav + main content)
- DataTable with sticky header, sortable columns, batch action bar, pagination — using `<cds-table>` / `<DataTable>` source
- `--cds-*` CSS custom properties (NOT `--md-sys-*` or `--apple-*`)
- AI Aura on at least one tile (if user mentions AI)
- Layer-01 nested in Background (NOT box-shadow)
- Both light (White) AND dark (G100) themes with `[data-theme]` attribute swapping
- **If a marketing/landing page is generated**: pictograms loaded from `@carbon/pictograms` (e.g., `<img src="https://unpkg.com/@carbon/pictograms/svg/analytics.svg">`), NOT custom SVGs and NOT emoji
- **Diff check**: pick one component from the output (e.g., the primary button) and grep for its markup in the corresponding `references/ibm/components/{name}.md` Section 5 or 6. The output's markup MUST appear in the reference file (allowing for text/value swaps but not structural changes).

If any criterion fails, identify the gap and either: (a) fix the responsible reference file, or (b) add an explicit instruction to SKILL.md Step 4C/4B that prevents the failure.

- [ ] **Step 4: Document the test result**

Append a row to a new file `docs/superpowers/test-results.md` (create if missing):
```markdown
# Carbon integration test — {YYYY-MM-DD}

**Prompt:** Build a Carbon-styled enterprise dashboard with sidebar and a data table showing 5 sample rows of user data

**Plan output:** {pass/fail with notes}

**Generated output:** {pass/fail per criterion}

**Issues found and fixed:** {list any}
```

### Task 8.5: Final acceptance criteria checklist

- [ ] **Step 1: Walk through the spec's section 13 acceptance criteria**

For each of the 10 acceptance criteria from `docs/superpowers/specs/2026-04-25-carbon-integration-design.md` section 13, verify:

1. ✅ `references/ibm/` exists with 5 top-level files + 38 components — verify with `find`
2. ✅ Each component file follows 12-section template, 250-450 lines — verify with validate script + `wc -l`
3. ✅ All hex values for 4 themes resolve correctly — spot-check 3 random component files for `var(--cds-X)` references that have a corresponding hex in overview.md
4. ✅ `@carbon/icons` CDN URL works — `curl -I https://unpkg.com/@carbon/icons/svg/32/add.svg` returns 200
5. ✅ SKILL.md detects "Carbon"/"IBM"/"Plex" — `grep -c "IBM\|Carbon\|Plex" skills/pixel-council/SKILL.md` returns ≥10
6. ✅ Component File Mapping has full IBM column — `grep -c "ibm/components/" skills/pixel-council/SKILL.md` returns ≥30
7. ✅ Step 4C has IBM Carbon platform polish — `grep -A 1 "IBM Carbon Design System" skills/pixel-council/SKILL.md` returns the polish section
8. ✅ Test prompt produces correct output — verified in Task 8.4
9. ✅ README + CLAUDE.md updated — visual verification
10. ✅ install.sh shows new file count — verified in Task 8.3 step 1

- [ ] **Step 2: Final commit**

If any of the criteria required additional fixes after Phase 7, commit them now:
```bash
git add -A
git commit -m "fix(ibm): final acceptance-criteria adjustments after end-to-end test"
```

- [ ] **Step 3: Bump version + update marketplace**

Run: `./install.sh` and choose option 1 (Plugin) — this auto-bumps the patch version in `.claude-plugin/marketplace.json`.

Run: `git add .claude-plugin/marketplace.json && git commit -m "chore: bump version for Carbon integration release"`

---

## Self-Review

I've checked the plan against the spec. Notes:

**Spec coverage:**
- ✅ Spec section 3 (folder structure) → Phase 1 Task 1.1
- ✅ Spec section 4 (38 components) → Phases 3-5 (38 tasks)
- ✅ Spec section 5 (token strategy) → Phase 1 Task 1.2 + each component file references hex values
- ✅ Spec section 6 (icon strategy) → Phase 2 Task 2.1
- ✅ Spec section 7 (page patterns) → Phase 2 Task 2.4
- ✅ Spec section 8 (SKILL.md updates) → Phase 6 (6 tasks covering 7 changes)
- ✅ Spec section 9 (file template/depth) → Task 3.0 + per-component customization checklist
- ✅ Spec section 10 (file count delta) → Phase 8 Task 8.2
- ✅ Spec section 13 (acceptance criteria) → Phase 8 Task 8.5

**Placeholder scan:**
- No "TBD", "TODO", "FIXME", or "implement later" strings in any task.
- Each component task has explicit Carbon-specific details (variants, sizes, tokens, sources) — not "fill in the blanks".
- Validation script content is complete (no placeholder bash).

**Type/name consistency:**
- CSS prefix `--cds-` used uniformly across all tasks.
- Token names match between `overview.md` (Phase 1) and component files (Phases 3-5): `--cds-button-primary`, `--cds-text-primary`, `--cds-layer-01`, etc.
- File names match between Phase 6's mapping table and Phases 3-5's actual file creation tasks (38 unique files).
- Theme attribute `[data-theme="white|g10|g90|g100"]` used uniformly.

**Gaps fixed:** None — coverage is complete on first pass.

---

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-04-25-carbon-integration.md`. Two execution options:

**1. Subagent-Driven (recommended)** — Dispatch a fresh subagent per task, review between tasks, fast iteration. Especially useful here because Phases 3-5 have 38 independent component-file tasks that can be parallelized.

**2. Inline Execution** — Execute tasks in this session using executing-plans, batch execution with checkpoints.

**Which approach?**

For your `/ralph-loop` setup: ralph-loop will iterate self-paced over the plan. Either execution model works inside ralph-loop, but subagent-driven dispatch is the better fit for the 38 component tasks since each can run in parallel and produce a clean, isolated diff.
