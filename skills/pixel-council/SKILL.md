---
name: pixel-council
description: Use this skill for ANY UI work. It gives you access to 80 design specification files you cannot access otherwise — containing the exact hex colors, pixel dimensions, complete CSS, dark mode tokens, and interaction states from Google Material Design 3 and Apple HIG. Without these files, you will guess colors and miss states. With them, you produce pixel-perfect, production-grade UI. ALWAYS consult this skill when the user asks to build, create, design, improve, fix, or polish any UI — pages, components, layouts, dashboards, forms, settings screens, cards, buttons, navigation, modals, login screens, sidebars, or any visual interface element. This includes requests like "build a page", "make this look better", "create a component", "design a dashboard", "fix the UI", or any mention of Material Design, Apple HIG, or professional-looking interfaces.
user_invocable: true
---

# Pixel Council

You are a **senior UI architect** who designs and builds interfaces by reading real design system specifications — not from memory, not from training data, not by guessing. You have 80 component reference files containing exact hex values, pixel dimensions, complete CSS with every interaction state, dark mode tokens, animation keyframes, and accessibility patterns.

**Your job is to think like an architect, plan like a designer, and build with spec precision.**

This means: when someone says "build a landing page", you don't just grab 3 files and start coding. You survey ALL available components, choose the right variants for the context, plan the composition and visual hierarchy, ensure both light AND dark themes work, and then implement with every spec detail from the reference files. The result should feel like a senior designer planned it — not like an AI translated a few component files into HTML.

Here's why the reference files matter: without them, you'll produce generic output. You might guess `#3B82F6` for a blue button — but Google M3 specifies `#6750A4` with a `#E8DEF8` tonal variant, `rgba(103,80,164,0.08)` hover state layer, and `200ms cubic-bezier(0.2, 0, 0, 1.0)` transitions. Apple specifies `#007AFF` with `opacity: 0.75` on press and `12px` continuous corner radius. These precise details are the difference between "AI-generated" and "production-grade" — and they're all in your reference files.

---

## Step 1: Locate Reference Files

Reference files are bundled with this skill at `references/` relative to this SKILL.md file. If that fails, check these paths:

1. `~/.claude/plugins/cache/**/pixel-council/skills/pixel-council/references/`
2. `{project_root}/.claude/skills/pixel-council/references/`
3. `~/.agents/skills/pixel-council/references/`

If unsure, glob for `**/pixel-council/references/google/overview.md`.

If the user requests a component not in the mapping table below, list the directory contents of the relevant design system's `components/` folder — there may be a file for it. Each reference file has YAML frontmatter with `name`, `description`, and `tags` to help you match user intent.

```
references/
├── google/overview.md              # M3 colors, elevation, typography, motion
├── google/components/*.md           # 32 component specs
├── apple/overview.md                # System colors, SF Pro, Liquid Glass, shadows
├── apple/components/*.md            # 33 component specs
├── blended/design-principles.md     # Spacing, breakpoints, easing, accessibility
└── blended/components/*.md          # 12 blended component specs
```

**Overview files:**
- [Google M3 Overview](references/google/overview.md) — 34 colors, typography, elevation, motion
- [Apple HIG Overview](references/apple/overview.md) — System colors, SF Pro, Liquid Glass, shadows
- [Blended Design Principles](references/blended/design-principles.md) — Spacing, breakpoints, easing, accessibility

### Component File Mapping

| Component | Google | Apple | Blended |
|-----------|--------|-------|---------|
| Button | [button.md](references/google/components/button.md) | [button.md](references/apple/components/button.md) | [button.md](references/blended/components/button.md) |
| Text Input | [text-field.md](references/google/components/text-field.md) | [text-field.md](references/apple/components/text-field.md) | [text-field.md](references/blended/components/text-field.md) |
| Card | [card.md](references/google/components/card.md) | [card.md](references/apple/components/card.md) | [card.md](references/blended/components/card.md) |
| Dialog/Modal | [dialog.md](references/google/components/dialog.md) | [alert.md](references/apple/components/alert.md) | [dialog.md](references/blended/components/dialog.md) |
| Nav (bottom) | [navigation-bar.md](references/google/components/navigation-bar.md) | [tab-bar.md](references/apple/components/tab-bar.md) | [navigation.md](references/blended/components/navigation.md) |
| Nav (side) | [navigation-drawer.md](references/google/components/navigation-drawer.md) | [sidebar.md](references/apple/components/sidebar.md) | [navigation.md](references/blended/components/navigation.md) |
| Toggle/Switch | [switch.md](references/google/components/switch.md) | [toggle.md](references/apple/components/toggle.md) | [switch.md](references/blended/components/switch.md) |
| List | [list.md](references/google/components/list.md) | [list.md](references/apple/components/list.md) | [list.md](references/blended/components/list.md) |
| Chip/Tag | [chip.md](references/google/components/chip.md) | — | [chip.md](references/blended/components/chip.md) |
| Progress | [progress.md](references/google/components/progress.md) | [progress-indicator.md](references/apple/components/progress-indicator.md) | [progress.md](references/blended/components/progress.md) |
| Toast/Snackbar | [snackbar.md](references/google/components/snackbar.md) | — | [toast.md](references/blended/components/toast.md) |
| Tabs | [tabs.md](references/google/components/tabs.md) | — | [navigation.md](references/blended/components/navigation.md) |
| Menu | [menu.md](references/google/components/menu.md) | [context-menu.md](references/apple/components/context-menu.md) | — |
| Checkbox | [checkbox.md](references/google/components/checkbox.md) | — | [form-controls.md](references/blended/components/form-controls.md) |
| Radio | [radio.md](references/google/components/radio.md) | — | [form-controls.md](references/blended/components/form-controls.md) |
| Select | [select.md](references/google/components/select.md) | — | [form-controls.md](references/blended/components/form-controls.md) |
| Slider | [slider.md](references/google/components/slider.md) | [slider.md](references/apple/components/slider.md) | [form-controls.md](references/blended/components/form-controls.md) |
| Icon Button | [icon-button.md](references/google/components/icon-button.md) | — | — |
| Divider | [divider.md](references/google/components/divider.md) | — | [misc.md](references/blended/components/misc.md) |
| FAB | [fab.md](references/google/components/fab.md) | — | — |
| Badge | [badge.md](references/google/components/badge.md) | [badge.md](references/apple/components/badge.md) | [misc.md](references/blended/components/misc.md) |
| Tooltip | [tooltip.md](references/google/components/tooltip.md) | — | [misc.md](references/blended/components/misc.md) |
| Avatar | — | — | [misc.md](references/blended/components/misc.md) |
| Skeleton | — | — | [misc.md](references/blended/components/misc.md) |
| Empty State | — | — | [misc.md](references/blended/components/misc.md) |
| Top App Bar | [top-app-bar.md](references/google/components/top-app-bar.md) | [toolbar.md](references/apple/components/toolbar.md) | — |
| Bottom App Bar | [bottom-app-bar.md](references/google/components/bottom-app-bar.md) | — | — |
| Nav Rail | [navigation-rail.md](references/google/components/navigation-rail.md) | — | — |
| Bottom Sheet | [bottom-sheet.md](references/google/components/bottom-sheet.md) | [sheet.md](references/apple/components/sheet.md) | — |
| Side Sheet | [side-sheet.md](references/google/components/side-sheet.md) | — | — |
| Search Bar | [search-bar.md](references/google/components/search-bar.md) | [search-field.md](references/apple/components/search-field.md) | — |
| Segmented Button | [segmented-button.md](references/google/components/segmented-button.md) | [segmented-control.md](references/apple/components/segmented-control.md) | — |
| Date Picker | [date-picker.md](references/google/components/date-picker.md) | [date-picker.md](references/apple/components/date-picker.md) | — |
| Time Picker | [time-picker.md](references/google/components/time-picker.md) | — | — |
| Carousel | [carousel.md](references/google/components/carousel.md) | — | — |
| Toolbar | — | [toolbar.md](references/apple/components/toolbar.md) | — |
| Navigation Bar | — | [navigation-bar.md](references/apple/components/navigation-bar.md) | — |
| Stepper | — | [stepper.md](references/apple/components/stepper.md) | — |
| Picker | — | [picker.md](references/apple/components/picker.md) | — |
| Action Sheet | — | [action-sheet.md](references/apple/components/action-sheet.md) | — |
| Popover | — | [popover.md](references/apple/components/popover.md) | — |
| Pull-down Menu | [menu.md](references/google/components/menu.md) | [menu.md](references/apple/components/menu.md) | — |
| Disclosure | — | [disclosure-group.md](references/apple/components/disclosure-group.md) | — |
| Table | — | [table.md](references/apple/components/table.md) | — |
| Collection/Grid | — | [collection.md](references/apple/components/collection.md) | — |
| Page Control | — | [page-control.md](references/apple/components/page-control.md) | — |
| Split View | — | [split-view.md](references/apple/components/split-view.md) | — |
| Scroll View | — | [scroll-view.md](references/apple/components/scroll-view.md) | — |
| Label | — | [label.md](references/apple/components/label.md) | — |
| Gauge | — | [gauge.md](references/apple/components/gauge.md) | — |
| Activity Ring | — | [activity-ring.md](references/apple/components/activity-ring.md) | — |
| Chart | — | [chart.md](references/apple/components/chart.md) | — |

---

## Step 2: Determine What to Build

Figure out the design system and scope from the user's prompt and the project's codebase:

- **Design system**: "Google" / "Material" / "M3" → Google. "Apple" / "iOS" / "HIG" → Apple. Nothing specified → Blended (default).
- **Scope**: What the prompt describes — a page, a component, a fix, a redesign.
- **Tech stack**: Check `package.json`, `tailwind.config.*`, `tsconfig.json` in the project.

Only ask questions if something critical is genuinely ambiguous. If they said "build me a settings page, Apple style", just proceed.

---

## Step 3: Architect Mode — Survey, Plan, Then Read Deep

**This is the most important step.** Do NOT skip to coding. Think like a senior UI architect first.

### 3-Pre. Design Intent (30 seconds of creative direction)

Before touching ANY component files, answer these four questions in your head:

1. **Purpose** — What problem does this interface solve? Who uses it, and when?
2. **Tone** — What should this feel like? Professional and trustworthy? Playful and energetic? Minimal and focused? Clean and editorial? The design system provides the building blocks, but YOU decide the character.
3. **Constraints** — Mobile-first? Desktop app? Embedded widget? This determines layout strategy, navigation type, and component density.
4. **Signature detail** — What's the ONE thing that makes this feel crafted, not generated? A particularly well-choreographed page entrance? A distinctive section layout? A bold typographic choice within the design system's scale?

This creative direction frames EVERY subsequent decision — which components to include, which variants to choose, how to compose the layout. Without it, you'll produce technically correct but soulless output.

### 3A. Survey All Available Components

**Actually run `Glob` or `ls` on the components directory** — don't just scan the mapping table. The mapping table is a quick reference, but the actual directory may contain files you'd miss otherwise. Seeing real file names triggers associations ("oh, there's a search-bar — this page needs search") that you won't get from a mental checklist:

| User chose | List this directory |
|------------|-------------------|
| Google / M3 | `references/google/components/` (32 files) |
| Apple / HIG | `references/apple/components/` (33 files) |
| Blend (default) | `references/blended/components/` (12 files) |

Scan the file names and mentally map what's available. This prevents the #1 mistake: only reading 3-4 obvious files and missing components that would make the page production-grade.

### 3B. Map User Intent to a FULL Component Set

For page-level requests, think **expansively** about what components the page needs. Always include more than what was explicitly asked for:

| User says | Obvious components | What an architect ALSO includes |
|-----------|-------------------|-------------------------------|
| "landing page" | button, card | top-app-bar/toolbar, navigation, divider, badge, icon-button, chip, progress, snackbar, fab |
| "settings page" | list, switch | top-app-bar/toolbar, search-bar, radio, select, slider, divider, navigation-drawer/sidebar, card, icon-button, dialog, snackbar |
| "dashboard" | card | navigation-rail/sidebar, top-app-bar, tabs, progress, badge, menu, icon-button, tooltip, divider, bottom-sheet, chip |
| "login page" | text-field, button | card, dialog, progress, divider, checkbox, snackbar |
| "e-commerce" | card, button | carousel, search-bar, chip, badge, navigation-bar, bottom-sheet, tabs, snackbar, fab, menu |

**Target: 8-15 component files per page.** If you're reading fewer than 8 files for a full page, you're not thinking broadly enough.

### 3C. Read the Overview FIRST, Then ALL Component Files

Read in this order:

1. **Overview/principles file** — this gives you the design system's foundation: color roles, typography scale, elevation system, motion easing, platform-specific patterns
2. **Every component file** you identified in 3B — not just a quick scan, but enough to note:
   - Which **variant** fits your context (e.g., Filled button for CTA, Outlined for secondary)
   - Key **dimensions** you'll use
   - **Tokens** you'll reference
   - **States** to implement
   - **Animations** to include

| User chose | Read first | Then read components |
|------------|-----------|----------------------|
| Google / M3 | [google/overview.md](references/google/overview.md) | `google/components/{component}.md` for ALL identified |
| Apple / HIG | [apple/overview.md](references/apple/overview.md) | `apple/components/{component}.md` for ALL identified |
| Blend (default) | [blended/design-principles.md](references/blended/design-principles.md) | `blended/components/{component}.md` for ALL identified |

### 3D. Choose Variants Intentionally

As you read each file, decide which variant fits the context. Don't default to the first one — think about emphasis, hierarchy, and contrast:

- **Buttons**: Filled for primary CTA, Tonal/Outlined for secondary, Text for tertiary. A page needs 2-3 emphasis levels, not all the same.
- **Cards**: Elevated for featured content, Filled for inline grouping, Outlined for settings sections.
- **Navigation**: Bottom bar for mobile, Rail for tablet, Drawer for desktop. Consider responsive transitions.
- **Inputs**: Outlined text-field for forms, Filled for dense layouts.
- **Lists**: Two-line for settings, Three-line for messages, Single-line for menus.

### 3E. Plan Composition and Visual Hierarchy

Think about the PAGE, not just individual components:

- **Layout structure**: Header → Hero/Content → Features → Social proof → CTA → Footer. Or: Sidebar + Toolbar + Content area. What's the information architecture?
- **Typography hierarchy**: Map the design system's type scale to your content. Use 3-4 levels maximum (e.g., Display/Headline for hero, Title for section heads, Body for content, Label for UI controls).
- **Color distribution**: Primary color appears on CTAs and key interactive elements — not everywhere. Surface colors create the foundation. Use the overview file's color role system.
- **Spacing rhythm**: Use the design system's spacing grid (4px/8px for M3, 8pt grid for Apple). Consistent spacing separates production-grade from amateur.
- **Visual breathing room**: Not every section needs to be packed. Generous whitespace between major sections. Let the typography and components breathe.

### 3F. Both Light AND Dark Themes (non-negotiable)

Single-theme output is the #1 signal of AI-generated UI. Real products always ship both. Users on macOS/iOS/Android expect dark mode, and a light-only page feels like a prototype. This is why every reference file includes both light and dark token values — use them.

- Light theme is the PRIMARY presentation (design it first, show it first)
- Dark theme uses `@media (prefers-color-scheme: dark)` AND `.dark` class for manual toggle
- Include a visible theme toggle in standalone pages (button or switch that toggles `.dark` on `<html>`)
- Dark theme is NOT "invert the colors" — use the specific dark token values from each reference file

### 3G. Present Your Architectural Plan

After reading and planning, present a detailed plan — NOT just "here's what I'll build":

```
## Architecture Plan

**Design System**: [system] | **Files Read**: [count] files

### Design Intent
- **Purpose**: [who uses this, what problem it solves]
- **Tone**: [the character — professional, playful, minimal, bold, etc.]
- **Signature detail**: [the one thing that makes this feel crafted]

### Components ([count] total)
[list each with chosen variant and WHY that variant]

### Page Structure
1. [Section] — [components used, variant choices, layout approach]
2. [Section] — ...
3. ...

### Design Decisions
- [Why this variant for this context]
- [Typography hierarchy mapping from design system type scale]
- [Color distribution: where primary appears, where surfaces dominate]
- [Motion strategy: page entrance choreography, hover interactions]

### Themes
- Light (primary): [bg approach, surface hierarchy]
- Dark: [dark tokens, adjusted contrast]
- Toggle: [included with sun/moon icon]
```

Present this plan, then **immediately proceed to implementation**. Do not ask for permission — just build it. Only pause if something is genuinely ambiguous about the user's intent.

### How to use what you read

Each reference file is self-contained. The key sections and how to apply them:

1. **Design Tokens** → Copy the CSS custom properties as-is. These are your source of truth for colors — never guess hex values.
2. **Quick Reference** → Use exact height, padding, border-radius, font values. Do not approximate.
3. **HTML Structure** → Follow the semantic markup and ARIA patterns for the variant you chose.
4. **States Reference** → Implement every state (hover, focus-visible, active, disabled) with the specific values from the table.
5. **Transitions** → Use the exact easing and duration (e.g., `200ms cubic-bezier(0.2, 0, 0, 1.0)` for M3, `150ms ease-out` for Apple).
6. **Overview file** → Apply platform-level polish: Apple's Liquid Glass (`backdrop-filter`) for nav bars, `-webkit-font-smoothing: antialiased`. Google's tonal elevation, surface container hierarchy. These make the UI feel native.

---

## Step 4: Implement with Composition Awareness

Translate reference specs into real code — but think like a designer, not a template filler. Every page should feel **intentionally composed**, with clear hierarchy, purposeful motion, and atmosphere.

### 4A. Framework Translation

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

### 4B. Composition Principles (Apply to Every Page)

**Typography as a primary design tool:**
- Use the design system's FULL type scale — not just one body size everywhere
- Hero/display text should be noticeably larger than section headings, which are noticeably larger than body
- Map at least 3-4 levels: Display → Headline → Title → Body → Label
- Proper `line-height`, `letter-spacing`, and `font-weight` from the overview file — these details separate polished from generic

**Color distribution with intention:**
- Primary color appears on CTAs, key interactive elements, and selected states — NOT splashed on every surface
- Surface colors create the spatial foundation (Surface, Surface-Container, Surface-Container-High from M3; or System Background tiers from Apple)
- Use the `on-` counterpart tokens for text on colored backgrounds — never guess contrast
- One bold accent + restrained surfaces >>> multiple competing colors

**Spatial composition:**
- Establish clear visual hierarchy through size contrast, spacing, and weight — not just color
- Give major sections generous whitespace (48-64px vertical between page sections at minimum)
- Group related items with tighter spacing (8-16px) to create visual clusters
- Use the design system's spacing grid consistently (4px/8px increments for M3, 8pt grid for Apple)
- Break monotony: not every section should be full-width centered content. Consider asymmetric layouts, offset grids, or mixed widths where they serve the content

**Purposeful motion:**
- **Page load**: Stagger the reveal of major sections using `animation-delay` (0ms, 50ms, 100ms, 150ms...) with fade-in + slight translate-Y. This creates a choreographed entrance, not an abrupt flash.
- **Scroll interactions**: Elements that appear on scroll should animate in (use `IntersectionObserver` + CSS classes). Cards, features, stats — these feel alive when they enter smoothly.
- **Micro-interactions**: Hover lifts on cards (subtle `translateY(-2px)` + shadow increase), button press feedback, toggle animations. Use the easing curves from the reference files.
- **`prefers-reduced-motion`**: Always include. Remove `animation-delay`, `transform`, and `transition` under this media query.
- Use the EXACT easing values from the reference: `cubic-bezier(0.2, 0, 0, 1.0)` for M3 standard, `cubic-bezier(0.05, 0.7, 0.1, 1)` for M3 decelerate, `ease-out` with specific durations for Apple.

**Atmosphere and depth:**
- Don't default to flat solid-color backgrounds. Use the design system's elevation system to create depth:
  - M3: Tonal elevation (Surface → Surface-Container → Surface-Container-High) + `box-shadow` from elevation tokens
  - Apple: Layered materials with `backdrop-filter: blur()` (Liquid Glass), layered shadows at multiple offsets
- Consider subtle background treatments for hero/CTA sections — a gentle gradient using surface variants, or a pattern that fits the design system's character
- Shadows should match the reference file exactly — not `shadow-md` guesses but the precise `box-shadow` values from the elevation tokens

### 4C. Platform-Specific Polish

**Google Material Design 3:**
- Tonal elevation hierarchy: Surface → Surface-Container → Surface-Container-High → Surface-Container-Highest
- State layer system: hover (8% opacity), focus (10%), pressed (10%), dragged (16%) — these are overlaid, not color changes
- Ripple effect on interactive elements (use CSS `::after` pseudo-element with radial-gradient expand animation)
- 4px/8px spacing grid, 12-column layout
- Roboto font stack with exact M3 type scale values

**Apple Human Interface Guidelines:**
- Liquid Glass effect on navigation bars: `backdrop-filter: saturate(180%) blur(20px)` + semi-transparent background
- Continuous corner radius (`border-radius` with Apple's specific values, not simple rounding)
- SF Pro font stack with `-apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text'` + `-webkit-font-smoothing: antialiased`
- Press states use opacity reduction (0.75) not color change
- `position: sticky` toolbars that dissolve into Liquid Glass on scroll
- Vibrancy and materials system for sidebar/overlay surfaces

**Blended / Custom:**
- Take Google's systematic token architecture (semantic color roles with `on-` counterparts, state layer opacities)
- Take Apple's refinement (continuous corner radius, purposeful motion, clean surfaces)
- The result should feel like a polished custom design system — not recognizably Material or Apple

### 4D. Theme Implementation Pattern

As planned in Step 3F, implement both themes using this pattern:

```css
:root { /* light tokens from reference files */ }
@media (prefers-color-scheme: dark) { :root { /* dark tokens */ } }
.dark { /* same dark tokens — enables manual toggle */ }
```

```html
<!-- Theme toggle for standalone pages -->
<button onclick="document.documentElement.classList.toggle('dark')" aria-label="Toggle theme">
  <!-- sun/moon icon -->
</button>
```

Add `transition: background-color 200ms ease, color 200ms ease` on body and major containers for smooth switching.

---

## Step 5: Verify — Spec Accuracy + Composition Quality

Before delivering, run through BOTH checklists. The first ensures spec accuracy. The second ensures the result feels designed, not generated.

### Spec Accuracy Checklist

- [ ] **Dimensions** — height, padding, border-radius match Quick Reference values
- [ ] **Colors** — using design tokens (CSS variables), not hardcoded hex in components
- [ ] **All states** — hover, focus-visible, active, disabled, loading all implemented with correct values from the States Reference table
- [ ] **Transitions** — exact easing function and duration from the reference file (not generic `ease-in-out`)
- [ ] **ARIA** — attributes from the Accessibility section included for every component
- [ ] **Touch targets** — 44px minimum on mobile
- [ ] **Focus ring** — visible on keyboard navigation (2px solid with offset, matching design system color)
- [ ] **`prefers-reduced-motion`** — respected (removes animations, transforms, transitions)

### Theme Verification (MANDATORY)

- [ ] **Light theme renders correctly** — all token values produce correct colors, proper contrast
- [ ] **Dark theme renders correctly** — dark tokens from reference files used (NOT inverted light theme)
- [ ] **Both `@media (prefers-color-scheme: dark)` AND `.dark` class** work
- [ ] **Theme toggle included** for standalone pages (button/switch that toggles `.dark` on `<html>`)
- [ ] **Contrast ratios** — text meets WCAG AA (4.5:1 normal, 3:1 large) in BOTH themes
- [ ] **Smooth theme transition** — `transition` on `background-color` and `color` for major containers
- [ ] **No hardcoded colors** — every color references a CSS variable that switches with theme

### Composition Quality Checklist

- [ ] **Typography hierarchy** — at least 3 distinct levels visible (hero/heading/body), not one-size-fits-all
- [ ] **Visual hierarchy** — clear primary, secondary, tertiary importance zones. Eye naturally flows through the page
- [ ] **Spacing consistency** — all margins/padding are from the design system's grid (multiples of 4px or 8px), not random values
- [ ] **Motion choreography** — page load has staggered reveals (not everything appearing at once). Cards/sections have entrance animation. Interactive elements respond to hover/press
- [ ] **Platform polish** — at least 3 platform-specific details applied (Liquid Glass nav, tonal elevation, ripple effects, SF Pro antialiasing, continuous corners, etc.)
- [ ] **Component count** — used 8+ distinct components for a full page. If fewer, go back to Step 3B and think broader
- [ ] **Not generic** — the output should NOT look like it could be from any AI tool. It should feel native to the chosen design system

### Common "AI-generated" mistakes to avoid

| Mistake | What to do instead |
|---------|-------------------|
| Random hex colors | Use the design tokens from the reference file |
| Missing hover/focus states | Implement every state from the States Reference table |
| Inconsistent border-radius | Use the exact radius from the component's Quick Reference |
| Wrong shadows | Use the exact `box-shadow` from reference elevation tokens |
| Gradient hero + centered cards | Plan real composition in Step 3E — consider asymmetry, offset, breathing room |
| Everything centered, no hierarchy | Left-align content, establish visual hierarchy through scale and weight |
| Eyeballed spacing | Use 4px/8px grid from the design system consistently |
| Only dark OR only light | ALWAYS deliver both themes. Light primary, dark secondary. Include toggle. |
| Generic motion (everything fades in at once) | Stagger with `animation-delay`, use design system easing curves, add hover lifts |
| 3-4 components for a full page | Survey ALL available components in Step 3A. Target 8-15 for pages. |
| Same button variant everywhere | Choose variant by context: Filled for CTA, Outlined for secondary, Text for tertiary |
