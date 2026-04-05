#!/bin/bash
# Install Pixel Council for Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MARKETPLACE="$SCRIPT_DIR/.claude-plugin/marketplace.json"

# Auto-bump patch version and update file count in marketplace.json
if [ -f "$MARKETPLACE" ]; then
  REF_COUNT=$(find "$SCRIPT_DIR/skills/pixel-council/references" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

  # Bump patch version (1.1.0 → 1.1.1, etc.)
  OLD_VER=$(grep -o '"version": "[^"]*"' "$MARKETPLACE" | head -1 | grep -o '[0-9]*\.[0-9]*\.[0-9]*')
  if [ -n "$OLD_VER" ]; then
    MAJOR=$(echo "$OLD_VER" | cut -d. -f1)
    MINOR=$(echo "$OLD_VER" | cut -d. -f2)
    PATCH=$(echo "$OLD_VER" | cut -d. -f3)
    NEW_VER="$MAJOR.$MINOR.$((PATCH + 1))"
    sed -i '' "s/\"version\": \"$OLD_VER\"/\"version\": \"$NEW_VER\"/" "$MARKETPLACE"
  fi

  # Update reference file count in description
  sed -i '' "s/[0-9]* reference files/$REF_COUNT reference files/" "$MARKETPLACE"
fi

echo ""
echo "  Pixel Council Installer"
echo "  ─────────────────────────"
echo ""
echo "  How would you like to install?"
echo ""
echo "  1) Plugin  — load via claude --plugin-dir (recommended)"
echo "              Best for: testing, development, full plugin features"
echo ""
echo "  2) Skill   — install to ~/.agents/skills/ with symlink"
echo "              Best for: always-on access without flags"
echo ""
echo "  3) Both    — install skill globally + print plugin-dir path"
echo ""
printf "  Choose [1/2/3]: "
read -r choice

case "$choice" in
  1)
    echo ""
    echo "  Plugin mode selected."
    echo ""
    echo "  To start Claude Code with Pixel Council loaded:"
    echo ""
    echo "    claude --plugin-dir \"$SCRIPT_DIR\""
    echo ""
    echo "  To make it permanent, add an alias to your shell profile:"
    echo ""
    echo "    alias claude-ui='claude --plugin-dir \"$SCRIPT_DIR\"'"
    echo ""
    echo "  Skills will be namespaced as /pixel-council:pixel-council"
    echo ""
    ;;

  2|3)
    SKILL_DIR="$HOME/.agents/skills/pixel-council"
    CLAUDE_SKILLS="$HOME/.claude/skills"
    CLAUDE_AGENTS="$HOME/.claude/agents"

    echo ""
    echo "  Installing skill + agent..."

    # Create directories
    mkdir -p "$SKILL_DIR"
    mkdir -p "$CLAUDE_SKILLS"
    mkdir -p "$CLAUDE_AGENTS"

    # Copy skill file and references
    cp "$SCRIPT_DIR/skills/pixel-council/SKILL.md" "$SKILL_DIR/SKILL.md"
    rm -rf "$SKILL_DIR/references"
    cp -r "$SCRIPT_DIR/skills/pixel-council/references" "$SKILL_DIR/"

    # Copy agent
    cp "$SCRIPT_DIR/agents/ui-reviewer.md" "$CLAUDE_AGENTS/"

    # Create symlink
    rm -f "$CLAUDE_SKILLS/pixel-council"
    ln -s "../../.agents/skills/pixel-council" "$CLAUDE_SKILLS/pixel-council"

    echo ""
    echo "  Installed:"
    echo "    Skill:      $SKILL_DIR/SKILL.md"
    REF_COUNT=$(find "$SKILL_DIR/references" -name "*.md" | wc -l | tr -d ' ')
    echo "    References:  $SKILL_DIR/references/ ($REF_COUNT files)"
    echo "    Agent:       $CLAUDE_AGENTS/ui-reviewer.md"
    echo "    Symlink:     $CLAUDE_SKILLS/pixel-council"
    echo ""

    if [ "$choice" = "3" ]; then
      echo "  Plugin mode also available:"
      echo ""
      echo "    claude --plugin-dir \"$SCRIPT_DIR\""
      echo ""
    fi

    echo "  Restart Claude Code, then type /skills to verify."
    echo "  Use /pixel-council or just ask Claude to build any UI."
    echo ""
    ;;

  *)
    echo ""
    echo "  Invalid choice. Run ./install.sh again."
    echo ""
    exit 1
    ;;
esac
