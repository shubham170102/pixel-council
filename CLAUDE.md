# Pixel Council

A Claude Code plugin that produces production-grade UI by reading real design system specifications from Google Material Design 3 and Apple HIG.

## Project Structure

```
pixel-council/
├── .claude-plugin/
│   └── plugin.json                    # Plugin manifest
├── agents/
│   └── ui-reviewer.md                 # Reviews UI code against reference specs
├── skills/
│   └── pixel-council/
│       ├── SKILL.md                   # The skill prompt (builds UI from specs)
│       └── references/                # 80 self-contained component reference files
│           ├── google/                # Google Material Design 3
│           │   ├── overview.md        # Full M3 token system (34 colors, typography, elevation, motion)
│           │   └── components/        # 32 per-component specs with complete HTML+CSS
│           ├── apple/                 # Apple HIG
│           │   ├── overview.md        # System colors, SF Pro, Liquid Glass, shadows
│           │   └── components/        # 33 per-component specs with complete HTML+CSS
│           └── blended/               # Best-of-both defaults (DEFAULT)
│               ├── design-principles.md
│               └── components/        # 12 blended specs with complete HTML+CSS
├── LICENSE
├── README.md
└── CLAUDE.md                          # This file
```

## Plugin Components

### Skill: `pixel-council`
Triggers when user asks to build UI. Reads the correct reference files and translates specs into the project's framework (React, Tailwind, Vue, etc.). Auto-triggers or invocable via `/pixel-council`.

### Agent: `ui-reviewer`
Reviews existing UI code against the reference specs. Checks colors, spacing, states, dark mode, accessibility, and animations for design system compliance. Returns a structured report with compliance percentage.

## How It Works

1. **Skill triggers** when user asks to build UI (auto-trigger or `/pixel-council`)
2. **SKILL.md routes** to the correct design system (Google, Apple, or Blended)
3. **Agent reads the component reference file** which contains EVERYTHING: design tokens with resolved hex values, semantic HTML, complete CSS with all states (hover, focus, active, disabled, loading), dark mode, animations, accessibility, responsive behavior
4. **Agent translates** the reference HTML+CSS into the project's framework

Each reference file is **self-contained** — the agent reads ONE file and gets everything needed. No guessing.

## Reference File Depth (9-10/10)

Every component file includes:
- Quick Reference table (scannable dimensions + colors)
- Design Tokens (CSS custom properties with resolved hex, light + dark)
- HTML Structure (semantic markup with ARIA for every variant)
- Complete CSS (all states, transitions, cubic-bezier easing, dark mode via @media + .dark)
- States Reference table (exact values per state per property)
- Animation & Motion (keyframes, prefers-reduced-motion)
- Accessibility (ARIA, keyboard, focus management, touch targets)
- Responsive behavior and Do/Don't tables

## Adding New Design Systems

Just a new folder under `skills/pixel-council/references/`. No skill code changes needed.
1. Create `references/{company}/overview.md`
2. Create `references/{company}/components/` with per-component files

## Development

This is a Claude Code plugin. To install locally for testing:
```bash
# The plugin system handles installation — just point Claude Code at this repo
```
