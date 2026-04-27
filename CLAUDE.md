# Pixel Council

A Claude Code plugin that produces production-grade UI by reading real design system specifications from Google Material Design 3, Apple HIG, and IBM Carbon Design System.

## Project Structure

```
pixel-council/
├── .claude-plugin/
│   └── plugin.json                    # Plugin manifest
├── agents/
│   └── ui-reviewer.md                 # Reviews UI code against reference specs
├── scripts/
│   └── validate-carbon-refs.sh        # Validates ibm/ reference files (frontmatter, sections, hex, line counts)
├── docs/superpowers/
│   ├── specs/2026-04-25-carbon-integration-design.md      # Design spec for the Carbon integration
│   └── plans/2026-04-25-carbon-integration.md             # Implementation plan (8 phases)
├── skills/
│   └── pixel-council/
│       ├── SKILL.md                   # The skill prompt (builds UI from specs)
│       └── references/                # 129 reference files
│           ├── google/                # Google Material Design 3
│           │   ├── overview.md        # Full M3 token system (34 colors, typography, elevation, motion)
│           │   ├── icons.md           # Material Symbols CDN, variable axes, 20 SVG fallbacks
│           │   ├── editorial-type.md  # Marketing type scale 88px→11px
│           │   ├── page-patterns.md   # Section patterns, 12-col grid, tonal elevation
│           │   └── components/        # 32 per-component specs with complete HTML+CSS
│           ├── apple/                 # Apple HIG
│           │   ├── overview.md        # System colors, SF Pro, Liquid Glass, shadows
│           │   ├── icons.md           # SF Symbols SVGs, stroke specs, 20-icon library
│           │   ├── editorial-type.md  # Marketing type scale 96px→12px
│           │   ├── page-patterns.md   # apple.com section patterns, hero layouts
│           │   └── components/        # 33 per-component specs with complete HTML+CSS
│           ├── ibm/                   # IBM Carbon Design System (Apache 2.0)
│           │   ├── overview.md        # 4 themes (White/G10/G90/G100), 122 hex tokens, IBM Plex, motion, 2x grid, AI tokens, Shape rules (border-radius: 0)
│           │   ├── icons.md           # @carbon/icons (web-redistributable), 24 inlined SVGs, 4 sizes (16/20/24/32)
│           │   ├── pictograms.md      # @carbon/pictograms (Carbon-only) — 12 inlined editorial illustrations
│           │   ├── editorial-type.md  # Expressive + Fluid + Display scale (42-92px responsive)
│           │   ├── page-patterns.md   # IBM.com marketing + UIShell dashboards + AI surface + chat shell patterns
│           │   └── components/        # 38 component specs — each embeds verbatim React + WC Storybook source code
│           └── blended/               # Best-of-both defaults (DEFAULT)
│               ├── design-principles.md
│               └── components/        # 12 blended specs with complete HTML+CSS
├── LICENSE
├── README.md
└── CLAUDE.md                          # This file
```

## Carbon Integration — Key Differences

The IBM Carbon integration follows a different model than Apple/Google:

- **Verbatim Storybook source** — every component file embeds the actual `{Component}.stories.js` (React) and `{component}.stories.ts` (Web Components) code from `https://github.com/carbon-design-system/carbon`. The agent outputs Carbon's actual code, not paraphrased recreations. This is the deliverable.
- **4 themes** vs Apple/Google's light + dark only — Carbon ships White (light primary), G10 (light alt), G90 (dark alt), G100 (dark primary). The skill defaults to White + G100 for the toggle, but G10/G90 are documented for swap.
- **Pictograms** — separate reference type that Apple/Google don't have. Editorial illustrations (64-128px) for marketing pages. NEVER use custom SVGs or emoji on Carbon pages.
- **AI surface tokens** — Carbon's 2024+ `--cds-ai-aura-*`, `--cds-ai-border-*`, `--cds-chat-*` tokens for AI/chat interfaces. Documented in `overview.md` and used by `ai-label.md`.
- **Sharp corners by default** — every component is `border-radius: 0` except Tag/Tooltip/Popover at `2px`. The #1 visual identifier.

The validator script at `scripts/validate-carbon-refs.sh` enforces these rules per-file (frontmatter, required sections, `cds-` class names, hex literals, line range 250-3500).

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
