---
name: pixel-council
description: Use this skill for ANY UI work. It gives you access to 50 design specification files you cannot access otherwise — containing the exact hex colors, pixel dimensions, complete CSS, dark mode tokens, and interaction states from Google Material Design 3 and Apple HIG. Without these files, you will guess colors and miss states. With them, you produce pixel-perfect, production-grade UI. ALWAYS consult this skill when the user asks to build, create, design, improve, fix, or polish any UI — pages, components, layouts, dashboards, forms, settings screens, cards, buttons, navigation, modals, login screens, sidebars, or any visual interface element. This includes requests like "build a page", "make this look better", "create a component", "design a dashboard", "fix the UI", or any mention of Material Design, Apple HIG, or professional-looking interfaces.
user_invocable: true
---

# Pixel Council

You build interfaces by reading design system specification files — not from memory, not from training data, not by guessing. You have 50 component reference files containing exact hex values, pixel dimensions, complete CSS with every interaction state, dark mode tokens, animation keyframes, and accessibility patterns.

**Your job is to read those files and replicate their specifications precisely in the user's framework.**

Here's why this matters: without the reference files, you'll produce generic output. You might guess `#3B82F6` for a blue button — but Google M3 specifies `#6750A4` with a `#E8DEF8` tonal variant, `rgba(103,80,164,0.08)` hover state layer, and `200ms cubic-bezier(0.2, 0, 0, 1.0)` transitions. Apple specifies `#007AFF` with `opacity: 0.75` on press and `12px` continuous corner radius. These precise details are the difference between "AI-generated" and "production-grade" — and they're all in your reference files.

---

## Step 1: Locate Reference Files

Reference files exist at ONE of these paths (check in order):

1. `{project_root}/.claude/skills/pixel-council/references/`
2. `~/.agents/skills/pixel-council/references/`

If unsure, glob for `**/pixel-council/references/google/overview.md`.

```
references/
├── google/overview.md              # M3 colors, elevation, typography, motion
├── google/components/*.md           # 22 component specs
├── apple/overview.md                # System colors, SF Pro, Liquid Glass, shadows
├── apple/components/*.md            # 13 component specs
├── blended/design-principles.md     # Spacing, breakpoints, easing, accessibility
└── blended/components/*.md          # 12 blended component specs
```

### Component File Mapping

| Component | Google | Apple | Blended |
|-----------|--------|-------|---------|
| Button | `button.md` | `button.md` | `button.md` |
| Text Input | `text-field.md` | `text-field.md` | `text-field.md` |
| Card | `card.md` | `card.md` | `card.md` |
| Dialog/Modal | `dialog.md` | `alert.md` | `dialog.md` |
| Nav (bottom) | `navigation-bar.md` | `tab-bar.md` | `navigation.md` |
| Nav (side) | `navigation-drawer.md` | `sidebar.md` | `navigation.md` |
| Toggle/Switch | `switch.md` | `toggle.md` | `switch.md` |
| List | `list.md` | `list.md` | `list.md` |
| Chip/Tag | `chip.md` | — | `chip.md` |
| Progress | `progress.md` | `progress-indicator.md` | `progress.md` |
| Toast/Snackbar | `snackbar.md` | — | `toast.md` |
| Tabs | `tabs.md` | — | `navigation.md` |
| Menu | `menu.md` | `context-menu.md` | — |
| Checkbox | `checkbox.md` | — | `form-controls.md` |
| Radio | `radio.md` | — | `form-controls.md` |
| Select | `select.md` | — | `form-controls.md` |
| Slider | `slider.md` | — | `form-controls.md` |
| FAB | `fab.md` | — | `misc.md` |
| Badge | `badge.md` | — | `misc.md` |
| Tooltip | `tooltip.md` | — | `misc.md` |
| Sheet | — | `sheet.md` | — |
| Segmented | — | `segmented-control.md` | `misc.md` |
| Toolbar | — | `toolbar.md` | — |

---

## Step 2: Determine What to Build

Figure out the design system and scope from the user's prompt and the project's codebase. Most of the time, the prompt tells you everything you need:

- **Design system**: "Google" / "Material" / "M3" → Google. "Apple" / "iOS" / "HIG" → Apple. Nothing specified → Blended (default).
- **Scope**: What the prompt describes — a page, a component, a fix, a redesign.
- **Tech stack**: Check `package.json`, `tailwind.config.*`, `tsconfig.json` in the project.

Only ask questions if something critical is genuinely ambiguous. Don't interrogate the user with a checklist — if they said "build me a settings page, Apple style", you know the design system, the scope, and can detect the tech stack from the codebase. Just proceed.

---

## Step 3: Read References FIRST, Then Present Your Plan

This is the critical step. Read the reference files BEFORE presenting any plan or writing any code. This ensures the specs are fresh in your context when you start building.

### The sequence:

1. **Read the overview/principles file** for the chosen design system
2. **List every component the task needs** — for pages, think beyond what the user explicitly mentioned:
   - A settings page needs: toolbar/nav bar, search bar, list, toggles, profile card
   - A login page needs: card, text fields, buttons, typography, background surface
   - A dashboard needs: sidebar nav, toolbar, cards, data display components
3. **Read the component reference file** for each component you identified
4. **Then present your plan**, informed by what you just read:

> **Plan:** [design system] | [reference files I read] | [what I'll build] | [framework]
> Ready to proceed?

### What to read per design system

| User chose | Read first | Then for each component |
|------------|-----------|----------------------|
| Google / M3 | `google/overview.md` | `google/components/{component}.md` |
| Apple / HIG | `apple/overview.md` | `apple/components/{component}.md` |
| Blend (default) | `blended/design-principles.md` | `blended/components/{component}.md` |

### What each reference file gives you

- **Quick Reference** — exact height, padding, border-radius, font size/weight
- **Design Tokens** — CSS custom properties with resolved hex values for light AND dark mode
- **HTML Structure** — semantic markup with ARIA attributes for every variant
- **Complete CSS** — all states (hover, focus-visible, active, disabled, loading), transitions with exact easing
- **States Reference** — exact background/text/border/shadow values per state
- **Animation & Motion** — keyframes, easing curves, `prefers-reduced-motion`
- **Accessibility** — ARIA roles, keyboard handling, focus management, touch targets
- **Do/Don't** — common mistakes to avoid

### How to use what you read

1. **Design tokens** — Copy the CSS custom properties. These are your source of truth for colors.
2. **Exact dimensions** — Use the height, padding, border-radius, font values from Quick Reference. Do not approximate.
3. **HTML structure** — Follow the semantic markup and ARIA patterns for each variant.
4. **Every interaction state** — Implement hover, focus-visible, active, disabled from the States Reference table. Each state has specific opacity/color/shadow values — use them.
5. **Dark mode** — Use the dark-mode token values from the file (both `@media (prefers-color-scheme: dark)` and `.dark` class).
6. **Transitions** — Use the exact easing function and duration from the reference (e.g., `200ms cubic-bezier(0.2, 0, 0, 1.0)` for M3, `150ms ease-out` for Apple).
7. **Platform polish from the overview file** — Apply platform-level refinements: Apple's Liquid Glass (`backdrop-filter`) for nav bars, `-webkit-font-smoothing: antialiased`, `position: sticky` for toolbars. Google's tonal elevation, surface container hierarchy. These details make the UI feel native rather than generic.

---

## Step 4: Implement

Translate the reference file's HTML + CSS into the project's framework.

**Tailwind CSS:**
```
height: 40px          → h-10
padding: 0 24px       → px-6
border-radius: 9999px → rounded-full
font-size: 14px       → text-sm
:hover { ... }        → hover:...
:focus-visible { ... } → focus-visible:ring-2
:disabled { ... }     → disabled:opacity-[0.38]
dark mode             → dark:...
```

Put design tokens in `tailwind.config.js` under `theme.extend.colors` so the whole project shares them.

**React/Next.js:** Reference HTML → JSX with `forwardRef`, `className` props, ARIA as JSX props.

**React Native:** Reference CSS → `StyleSheet.create`, `Pressable` for touch states, platform fonts.

**Vue/Svelte:** Reference HTML → `<template>`, Reference CSS → `<style scoped>`.

### Design System Blending

When using "blend" or "custom inspiration":
- Take Google's systematic token architecture (semantic color roles with `on-` counterparts, state layer opacities)
- Take Apple's refinement (continuous corner radius, purposeful motion, clean surfaces)
- The result should feel like a polished custom design system — not recognizably Material or Apple

---

## Step 5: Verify Against the Reference

Before delivering, check your output against the reference files you read:

- [ ] **Dimensions** — height, padding, border-radius match Quick Reference values
- [ ] **Colors** — using design tokens (CSS variables), not hardcoded hex in components
- [ ] **All states** — hover, focus-visible, active, disabled, loading all implemented with correct values
- [ ] **Dark mode** — tokens switch via `@media` or `.dark` class
- [ ] **Transitions** — exact easing and duration from the reference file
- [ ] **ARIA** — attributes from the Accessibility section included
- [ ] **Touch targets** — 44px minimum on mobile
- [ ] **Focus ring** — visible on keyboard navigation
- [ ] **`prefers-reduced-motion`** — respected

### Common "AI-generated" mistakes to avoid

| Mistake | What to do instead |
|---------|-------------------|
| Random hex colors | Use the design tokens from the reference file |
| Missing hover/focus states | Implement every state from the States Reference table |
| Inconsistent border-radius | Use the exact radius from the component's Quick Reference |
| Wrong shadows | Use the exact `box-shadow` from reference elevation tokens |
| Gradient hero + centered cards | Follow layout patterns from the reference files |
| Everything centered, no hierarchy | Left-align content, establish visual hierarchy |
| Eyeballed spacing | Use 4px/8px grid from `blended/design-principles.md` |
