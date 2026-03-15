# Pixel Council

A Claude Code plugin that produces production-grade UI — not AI-generated boilerplate. It encodes the real design specifications from Google Material Design 3 and Apple Human Interface Guidelines into 80 component reference files that Claude reads before writing any code.

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

| Company                      | Coverage                                                                                             |
| ---------------------------- | ---------------------------------------------------------------------------------------------------- |
| **Google Material Design 3** | 32 components, 34 color roles (light+dark hex), elevation box-shadows, typescale, motion easing      |
| **Apple HIG**                | 33 components, 15 system colors (light+dark hex), SF Pro font stack, Liquid Glass CSS, shadow system |
| **Blended** (default)        | 12 components combining Google's systematic tokens with Apple's refinement                           |

## Plugin Components

| Type      | Name            | What It Does                                                                                       |
| --------- | --------------- | -------------------------------------------------------------------------------------------------- |
| **Skill** | `pixel-council` | Builds UI from reference specs. Auto-triggers on UI requests or via `/pixel-council:pixel-council` |
| **Agent** | `ui-reviewer`   | Reviews existing UI code against reference specs for design system compliance                      |

## Installation

### Option A: Add marketplace and Install (Recommended)

```bash
/plugin marketplace add shubham170102/pixel-council
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
git clone https://github.com/shubham170102/pixel-council.git
claude --plugin-dir ./pixel-council
```

To load it every session, add to your shell profile:

```bash
alias claude-ui="claude --plugin-dir /path/to/pixel-council"
```

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

| What you say                             | What Claude uses                       |
| ---------------------------------------- | -------------------------------------- |
| Just describe the UI (default)           | **Blended** — best of Google + Apple   |
| "Google style" / "Material style" / "M3" | Google Material Design 3 specs         |
| "Apple style" / "iOS style" / "HIG"      | Apple Human Interface Guidelines specs |

### What Happens Behind the Scenes

1. Skill triggers → SKILL.md instructions load into Claude's context
2. Claude identifies which components are needed (button, card, list, etc.)
3. Claude **reads the actual reference files** for each component
4. Each file provides: design tokens, HTML structure, complete CSS, all states, dark mode, animations
5. Claude translates the reference HTML+CSS into your project's framework (React, Tailwind, Vue, etc.)
6. Result: pixel-perfect UI with proper tokens, states, and accessibility — not generic AI output

## What's Inside (80 files, 30,000+ lines)

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
├── google/                    # 32 components + design system overview
│   ├── overview.md            # 34 color roles, elevation shadows, typescale, motion easing
│   └── components/
│       ├── button.md          # 5 variants, ripple keyframes, state layers
│       ├── text-field.md      # Filled/outlined, floating label animation
│       ├── card.md            # Elevated/filled/outlined, hover elevation
│       └── ... (29 more)
│
├── apple/                     # 33 components + design system overview
│   ├── overview.md            # System colors, Liquid Glass CSS, SF Pro stack, shadows
│   └── components/
│       ├── button.md          # 4 styles, pressed opacity, continuous corners
│       └── ... (32 more)
│
└── blended/                   # 12 components + universal design principles
    ├── design-principles.md   # Spacing scale, easing functions, dark mode tokens
    └── components/
        ├── button.md          # 5 emphasis levels, loading spinner, all states
        └── ... (11 more)
```

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
│       └── references/           # 80 component reference files
│           ├── google/           # Material Design 3
│           ├── apple/            # Human Interface Guidelines
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

- **New design system references** (Stripe, IBM, Microsoft, Linear, Vercel, Shopify)
- **More component specs** for existing companies
- **Bug fixes** in token values or CSS

## License

MIT
