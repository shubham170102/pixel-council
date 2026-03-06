# Pixel Council

A Claude Code skill that produces production-grade UI — not AI-generated boilerplate. It encodes the real design specifications from Google Material Design 3 and Apple Human Interface Guidelines into 50 component reference files that Claude reads before writing any code.

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
| **Google Material Design 3** | 22 components, 34 color roles (light+dark hex), elevation box-shadows, typescale, motion easing |
| **Apple HIG** | 13 components, 15 system colors (light+dark hex), SF Pro font stack, Liquid Glass CSS, shadow system |
| **Blended** (default) | 12 components combining Google's systematic tokens with Apple's refinement |

## Installation

### Option A: Global Install (recommended)

Installs the skill system-wide. Available in **every project** you open with Claude Code.

```bash
git clone https://github.com/shubham170102/pixel-council.git
cd pixel-council
./install.sh
```

This copies the skill and references to `~/.agents/skills/pixel-council/` and creates a symlink at `~/.claude/skills/pixel-council`.

<details>
<summary>Manual global install (no script)</summary>

```bash
git clone https://github.com/shubham170102/pixel-council.git
cd pixel-council
mkdir -p ~/.agents/skills/pixel-council
cp skill/SKILL.md ~/.agents/skills/pixel-council/
cp -r references ~/.agents/skills/pixel-council/
mkdir -p ~/.claude/skills
ln -sf ../../.agents/skills/pixel-council ~/.claude/skills/pixel-council
```

</details>

### Option B: Project-Level Install

Installs into a single project. Only available when working in that project.

```bash
git clone https://github.com/shubham170102/pixel-council.git

# From your project directory:
mkdir -p .claude/skills/pixel-council
cp pixel-council/skill/SKILL.md .claude/skills/pixel-council/
cp -r pixel-council/references .claude/skills/pixel-council/
```

This creates:
```
your-project/
└── .claude/
    └── skills/
        └── pixel-council/
            ├── SKILL.md
            └── references/
```

### Verify Installation

Restart Claude Code (or open a new session), then:

```
> /skills
```

You should see `pixel-council` in the list.

## Usage

### Explicit Invocation

```
/pixel-council build a settings page with profile info and notification toggles
/pixel-council create a card component, Apple style
/pixel-council design a dashboard with sidebar, Google Material style
```

### Auto-Trigger

The skill also activates automatically when you ask Claude to build UI:

```
build a login screen
create a pricing page
make this look more polished
design a dashboard with sidebar navigation
```

Keywords like "build", "create", "design", "implement" combined with "page", "component", "UI", "screen" trigger the skill.

### Choosing a Design System

| What you say | What Claude uses |
|---|---|
| Just describe the UI (default) | **Blended** — best of Google + Apple |
| "Google style" / "Material style" / "M3" | Google Material Design 3 specs |
| "Apple style" / "iOS style" / "HIG" | Apple Human Interface Guidelines specs |
| "Combine Google and Apple" | Reads both, synthesizes |

### What Happens Behind the Scenes

1. Skill triggers → SKILL.md instructions load into Claude's context
2. Claude identifies which components are needed (button, card, list, etc.)
3. Claude **reads the actual reference files** for each component
4. Each file provides: design tokens, HTML structure, complete CSS, all states, dark mode, animations
5. Claude translates the reference HTML+CSS into your project's framework (React, Tailwind, Vue, etc.)
6. Result: pixel-perfect UI with proper tokens, states, and accessibility — not generic AI output

## What's Inside (50 files, 15,000+ lines)

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
references/
├── google/                    # 22 components + design system overview
│   ├── overview.md            # 34 color roles, elevation shadows, typescale, motion easing
│   └── components/
│       ├── button.md          # 5 variants, ripple keyframes, state layers
│       ├── text-field.md      # Filled/outlined, floating label animation
│       ├── card.md            # Elevated/filled/outlined, hover elevation
│       ├── dialog.md, tabs.md, navigation-bar.md, navigation-drawer.md
│       ├── switch.md, chip.md, list.md, menu.md, fab.md
│       ├── checkbox.md, radio.md, progress.md, slider.md
│       └── icon-button.md, select.md, snackbar.md, divider.md, badge.md, tooltip.md
│
├── apple/                     # 13 components + design system overview
│   ├── overview.md            # System colors, Liquid Glass CSS, SF Pro stack, shadows
│   └── components/
│       ├── button.md          # 4 styles, pressed opacity, continuous corners, focus ring
│       ├── text-field.md, card.md, tab-bar.md, sidebar.md, toolbar.md
│       ├── list.md, toggle.md, sheet.md, segmented-control.md
│       └── progress-indicator.md, context-menu.md, alert.md
│
└── blended/                   # 12 components + universal design principles
    ├── design-principles.md   # Spacing scale, easing functions, dark mode tokens
    └── components/
        ├── button.md          # 5 emphasis levels, loading spinner, all states
        ├── text-field.md, card.md, navigation.md, dialog.md
        ├── switch.md, list.md, chip.md, progress.md, toast.md
        └── form-controls.md, misc.md
```

## Updating

If you installed globally and want to pull the latest references:

```bash
cd pixel-council
git pull
./install.sh
```

For project-level installs, re-copy the files from the updated repo.

## Adding More Design Systems

Adding a new company is just a new folder under `references/`. No skill code changes needed.

1. Create `references/{company}/overview.md` with design foundations
2. Create `references/{company}/components/` with per-component spec files

## Contributing

Contributions welcome:

- **New design system references** (Stripe, IBM, Microsoft, Linear, Vercel, Shopify)
- **More component specs** for existing companies
- **Bug fixes** in token values or CSS

## License

MIT
