# Pixel Council

A Claude Code plugin that produces production-grade UI — not AI-generated boilerplate. It encodes the real design specifications from Google Material Design 3, Apple Human Interface Guidelines, and IBM Carbon Design System into 129 reference files that Claude reads before writing any code.

## The Problem

AI-generated UIs look AI-generated. Excessive gradients, inconsistent spacing, random colors, missing interaction states, and generic layouts that scream "vibe-coded."

## The Solution

Pixel Council gives Claude the actual design system specs — resolved hex values, exact dimensions, complete CSS with every state, dark mode, animations, accessibility. Claude reads the spec, then implements. No guessing.

- **Semantic color tokens** with resolved hex values (light + dark)
- **Consistent spacing** from a 4px/8px grid system
- **Proper typography hierarchy** with exact font sizes, weights, line-heights
- **All interaction states** (hover, focus-visible, active, disabled, loading)
- **Dark mode** from the start (both `@media` and `.dark` class)
- **Accessibility** (WCAG AA contrast, ARIA attributes, keyboard nav, 44px touch targets)
- **Responsive layouts** with breakpoint-specific behavior

## Design Systems Included

| Company | Coverage |
|---------|----------|
| **Google Material Design 3** | 32 components + 3 page-level refs (icons, editorial type, page patterns), 34 color roles, elevation, typescale, Material Symbols, motion easing |
| **Apple HIG** | 33 components + 3 page-level refs (SF Symbols, editorial type, page patterns), 15 system colors, SF Pro, Liquid Glass, shadow system |
| **IBM Carbon** | 38 components + 4 page-level refs (icons, **pictograms**, editorial type, page patterns), **4 themes** (White/G10/G90/G100), IBM Plex, sharp corners, Layer tier system, **AI surface tokens**, Apache 2.0 — every component embeds **verbatim Storybook source code** (React + Web Components) |
| **Blended** (default) | 12 components combining Google's systematic tokens with Apple's refinement |

## Plugin Components

| Type | Name | What It Does |
|------|------|-------------|
| **Skill** | `pixel-council` | Builds UI from reference specs. Auto-triggers on UI requests or via `/pixel-council:pixel-council` |
| **Agent** | `ui-reviewer` | Reviews existing UI code against reference specs for design system compliance |

## Installation

### Option A: Add marketplace and Install (Recommended)

```bash
/plugin marketplace add blinkz-ai/pixel-council
/plugin install pixel-council
```

Restart Claude Code (or open a new session), then run:

```
/plugin
```

You should see pixel-council listed.

### Option B: Local Plugin Install

Clone the repo and load it directly as a plugin:

```bash
git clone https://github.com/blinkz-ai/pixel-council.git
claude --plugin-dir ./pixel-council
```

To load it every session, add to your shell profile:

```bash
alias claude-ui="claude --plugin-dir /path/to/pixel-council"
```

### Option C: Manual Skill Install

If you prefer the traditional skill approach without the plugin system:

```bash
git clone https://github.com/blinkz-ai/pixel-council.git
cd pixel-council

# Copy skill + references
mkdir -p ~/.agents/skills/pixel-council
cp skills/pixel-council/SKILL.md ~/.agents/skills/pixel-council/
cp -r skills/pixel-council/references ~/.agents/skills/pixel-council/

# Copy agent
mkdir -p ~/.claude/agents
cp agents/ui-reviewer.md ~/.claude/agents/

# Create symlink
mkdir -p ~/.claude/skills
ln -sf ../../.agents/skills/pixel-council ~/.claude/skills/pixel-council
```

### Verify Installation

Restart Claude Code (or open a new session), then:

```
/skills
```

You should see `pixel-council` listed. If installed as a plugin, skills are namespaced: `/pixel-council:pixel-council`.

---

## Usage

### Building UI (Skill)

The skill auto-triggers when you ask Claude to build any UI:

```
build a login screen
create a pricing page with cards
make this look more polished
design a dashboard with sidebar navigation
```

Or invoke explicitly:

```
/pixel-council:pixel-council build a settings page with profile info and notification toggles
/pixel-council:pixel-council create a card component, Apple style
```

### Reviewing UI (Agent)

The `ui-reviewer` agent audits your existing UI code against the reference specs:

```
Review my Button component against the M3 spec
Audit this settings page for design system compliance
Check if my dark mode implementation matches the spec
```

### Choosing a Design System

| What you say | What Claude uses |
|---|---|
| Just describe the UI (default) | **Blended** — best of Google + Apple |
| "Google style" / "Material style" / "M3" | Google Material Design 3 specs |
| "Apple style" / "iOS style" / "HIG" | Apple Human Interface Guidelines specs |
| "IBM" / "Carbon" / "enterprise dashboard" / "data table" / "AI app" | IBM Carbon Design System specs (verbatim Storybook source) |

### What Happens Behind the Scenes

1. Skill triggers → SKILL.md instructions load into Claude's context
2. Claude identifies which components are needed (button, card, list, etc.)
3. Claude **reads the actual reference files** for each component
4. Each file provides: design tokens, HTML structure, complete CSS, all states, dark mode, animations
5. Claude translates the reference HTML+CSS into your project's framework (React, Tailwind, Vue, etc.)
6. Result: pixel-perfect UI with proper tokens, states, and accessibility — not generic AI output

## What's Inside (129 files, 70,000+ lines)

Every component file is a **self-contained implementation guide**. Claude reads ONE file and gets everything needed — no guessing.

Each file contains:

- **Quick Reference** — scannable dimensions, colors at a glance
- **Design Tokens** — copy-paste CSS custom properties with resolved hex (light + dark)
- **HTML Structure** — semantic markup with ARIA attributes for every variant
- **Complete CSS** — all states, transitions with cubic-bezier easing, dark mode
- **States Reference** — exact background/text/border/shadow per state
- **Animation & Motion** — keyframes, `prefers-reduced-motion` support
- **Accessibility** — ARIA roles, keyboard interaction, focus management, touch targets
- **Do/Don't** — common mistakes and correct patterns

```
skills/pixel-council/references/
├── google/                    # 35 files (32 components + 3 page-level)
│   ├── overview.md            # 34 color roles, elevation shadows, typescale, motion easing
│   ├── icons.md               # Material Symbols CDN, variable axes, 20 SVG fallbacks
│   ├── editorial-type.md      # Marketing type scale 88px→11px, Overline labels
│   ├── page-patterns.md       # Section patterns, 12-col grid, tonal elevation
│   └── components/
│       ├── button.md          # 5 variants, ripple keyframes, state layers
│       └── ... (31 more)
│
├── apple/                     # 36 files (33 components + 3 page-level)
│   ├── overview.md            # System colors, Liquid Glass CSS, SF Pro stack, shadows
│   ├── icons.md               # SF Symbols SVGs, stroke specs, 20-icon library
│   ├── editorial-type.md      # Marketing type scale 96px→12px, eyebrow labels
│   ├── page-patterns.md       # apple.com section patterns, hero layouts, spacing rhythm
│   └── components/
│       ├── button.md          # 4 styles, pressed opacity, continuous corners
│       └── ... (32 more)
│
├── ibm/                       # 43 files (38 components + 5 page-level — adds pictograms.md)
│   ├── overview.md            # 4 themes (White/G10/G90/G100), 122 hex tokens, IBM Plex, motion, 2x grid, AI tokens, Shape rules
│   ├── icons.md               # @carbon/icons (Apache 2.0, web-redistributable), 24 inlined SVGs, 4 sizes
│   ├── pictograms.md          # @carbon/pictograms (Carbon-only), 12 inlined editorial illustrations
│   ├── editorial-type.md      # Expressive + Fluid + Display scale (42-92px responsive headlines)
│   ├── page-patterns.md       # IBM.com marketing + UIShell dashboards + AI surface patterns
│   └── components/
│       ├── button.md          # 10 variants verbatim from @carbon/react Storybook
│       ├── data-table.md      # Carbon's flagship — sortable/expandable/selectable/batch actions
│       ├── ui-shell.md        # Header + SideNav composite (rail + persistent + actions)
│       ├── ai-label.md        # AI Label + AI Skeleton + Chat Button (2024+ AI surface system)
│       └── ... (34 more)
│
└── blended/                   # 12 components + universal design principles
    ├── design-principles.md   # Spacing scale, easing functions, dark mode tokens
    └── components/
        ├── button.md          # 5 emphasis levels, loading spinner, all states
        └── ... (11 more)
```

**Carbon special case:** Each `references/ibm/components/{name}.md` file embeds the **verbatim Storybook source code** for both React (`{Component}.stories.js`) and Web Components (`{component}.stories.ts`). The agent outputs Carbon's actual code — no paraphrasing, no recreation. This is unique to Carbon because it's an open-source component library where the actual code IS the deliverable.

## Plugin Structure

```
pixel-council/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
├── agents/
│   └── ui-reviewer.md           # Reviews UI against reference specs
├── skills/
│   └── pixel-council/
│       ├── SKILL.md              # Builds UI from reference specs
│       └── references/           # 129 reference files
│           ├── google/           # Material Design 3
│           ├── apple/            # Human Interface Guidelines
│           ├── ibm/              # Carbon Design System (verbatim Storybook source)
│           └── blended/          # Best-of-both (default)
├── LICENSE
├── README.md
└── CLAUDE.md
```

## Adding More Design Systems

Adding a new company is just a new folder under `skills/pixel-council/references/`. No skill code changes needed.

1. Create `references/{company}/overview.md` with design foundations
2. Create `references/{company}/components/` with per-component spec files

## Contributing

Contributions welcome:

- **New design system references** (Stripe, Microsoft, Linear, Vercel, Shopify)
- **More component specs** for existing companies
- **Bug fixes** in token values or CSS

## License

MIT
