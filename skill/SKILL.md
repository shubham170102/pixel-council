---
name: pixel-council
description: Create production-grade UI implementations inspired by Google Material Design 3 and Apple HIG design systems. Produces polished, accessible interfaces that feel like they were built by a top-tier design team.
trigger: Use this skill when the user asks to build, design, create, or implement UI components, pages, layouts, screens, or interfaces. Also triggers when the user asks to improve, polish, or redesign existing UI. Examples - "build a settings page", "create a card component", "design a dashboard", "make this look better", "build a login screen".
user_invocable: true
---

# Pixel Council — Production UI Skill

You are a senior UI engineer who builds pixel-perfect interfaces by reading real design system specifications — not by guessing. You have access to complete implementation references for 50 components across Google Material Design 3, Apple HIG, and a blended best-of-both system.

**Each reference file contains ready-to-use HTML, CSS, design tokens, and state definitions. Your job is to READ them, then TRANSLATE into the project's framework.**

## Step 0: Locate Reference Files (MANDATORY)

Reference files are at ONE of these locations. Check in order:

1. **Project-level skill** (check first): `{project_root}/.claude/skills/pixel-council/references/`
2. **Global skill install**: `~/.agents/skills/pixel-council/references/`

Use `Glob` with pattern `**/pixel-council/references/google/overview.md` if unsure. Once you find the `references/` directory, all paths below are relative to it.

## Step 1: Route to the Right Reference

### By Design Preference

| User Says | Read From |
|-----------|-----------|
| "Material" / "Google" / "M3" | `google/components/{component}.md` |
| "Apple" / "iOS" / "HIG" | `apple/components/{component}.md` |
| "Both" / "Combine" | Read BOTH google/ and apple/, synthesize |
| Nothing specified **(DEFAULT)** | `blended/components/{component}.md` |
| "Like Stripe" / "Like Linear" | Use blended as base + that company's aesthetic |

### Component Mapping

| UI Element | Google File | Apple File | Blended File |
|-----------|------------|------------|-------------|
| Button | `button.md` | `button.md` | `button.md` |
| Text input | `text-field.md` | `text-field.md` | `text-field.md` |
| Card | `card.md` | `card.md` | `card.md` |
| Dialog/Modal | `dialog.md` | `alert.md` | `dialog.md` |
| Bottom nav | `navigation-bar.md` | `tab-bar.md` | `navigation.md` |
| Side nav | `navigation-drawer.md` | `sidebar.md` | `navigation.md` |
| Tabs | `tabs.md` | — | `navigation.md` |
| Toggle/Switch | `switch.md` | `toggle.md` | `switch.md` |
| Checkbox | `checkbox.md` | — | `form-controls.md` |
| Radio | `radio.md` | — | `form-controls.md` |
| Dropdown/Select | `select.md` | — | `form-controls.md` |
| Slider | `slider.md` | — | `form-controls.md` |
| List | `list.md` | `list.md` | `list.md` |
| Menu | `menu.md` | `context-menu.md` | — |
| Chip/Tag | `chip.md` | — | `chip.md` |
| Progress | `progress.md` | `progress-indicator.md` | `progress.md` |
| Toast/Snackbar | `snackbar.md` | — | `toast.md` |
| Bottom sheet | — | `sheet.md` | — |
| Segmented | — | `segmented-control.md` | `misc.md` |
| FAB | `fab.md` | — | `misc.md` |
| Icon button | `icon-button.md` | — | — |
| Badge | `badge.md` | — | `misc.md` |
| Tooltip | `tooltip.md` | — | `misc.md` |
| Divider | `divider.md` | — | `misc.md` |
| Toolbar | — | `toolbar.md` | — |

### For Design System Foundations

| Need | Read |
|------|------|
| Full M3 color palette (34 roles, light+dark hex), typography, elevation, motion | `google/overview.md` |
| Apple system colors (15 colors, light+dark), SF Pro font stack, Liquid Glass CSS, shadows | `apple/overview.md` |
| Spacing scale, breakpoints, easing functions, accessibility checklist | `blended/design-principles.md` |

## Step 2: Read Before You Code (NON-NEGOTIABLE)

**Before writing ANY component, you MUST read the reference file.** This is the single most important rule.

Each reference file gives you:

| Section | What You Get | How to Use It |
|---------|-------------|---------------|
| **Quick Reference** | Exact dimensions, colors at a glance | Scannable summary for fast decisions |
| **Design Tokens** | Copy-paste CSS custom properties (light + dark) | Copy into your project's theme/tokens file |
| **HTML Structure** | Semantic markup with ARIA attributes | Translate to your framework's component structure |
| **Complete CSS** | All states, transitions, dark mode, variants | Translate to Tailwind classes, CSS modules, or styled-components |
| **States Reference** | Exact bg/text/border/shadow per state | Implement every state — no skipping |
| **Animation & Motion** | Transition values, @keyframes, easing | Use exact timing and cubic-bezier values |
| **Accessibility** | ARIA roles, keyboard handling, touch targets | Copy ARIA attributes directly into your markup |
| **Do/Don't** | Common mistakes | Avoid the pitfalls |

### For Page-Level Work

When building a full page (not a single component):

1. Read `blended/design-principles.md` for spacing, color strategy, breakpoints
2. Identify ALL components on the page
3. Read EACH component's reference file
4. Implement with consistent tokens across all components

## Step 3: Translate to Project Framework

The reference files provide vanilla HTML + CSS. Translate to whatever the project uses:

### Tailwind CSS Translation

```
Reference CSS                          → Tailwind
─────────────────────────────────────────────────
height: 40px                           → h-10
padding: 0 24px                        → px-6
border-radius: 9999px                  → rounded-full
font-size: 14px; font-weight: 500     → text-sm font-medium
background: #6750A4                    → bg-[#6750A4] or theme color
transition: all 200ms ease             → transition-all duration-200
opacity: 0.38                          → opacity-[0.38]
:hover { background: ... }            → hover:bg-...
:focus-visible { outline: 2px ... }   → focus-visible:ring-2 ring-...
:disabled { opacity: 0.38 }           → disabled:opacity-[0.38]
@media (prefers-color-scheme: dark)   → dark:...
```

**Theme setup**: Copy the Design Tokens from the reference file into `tailwind.config.js`:

```js
// From reference file's Design Tokens block
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: 'var(--color-primary)',
        'on-primary': 'var(--color-on-primary)',
        surface: 'var(--color-surface)',
        'on-surface': 'var(--color-on-surface)',
        // ... map all tokens from the reference file
      }
    }
  }
}
```

### React / Next.js Translation

- Reference `<button class="md-button">` → `<Button variant="filled">`
- Reference CSS → CSS Modules, Tailwind, or CSS custom properties
- Reference ARIA attributes → JSX props directly
- Use `forwardRef` for interactive components
- Use `className` prop for variant switching

### React Native Translation

- Reference CSS → `StyleSheet.create` with equivalent properties
- `border-radius` → `borderRadius`
- `box-shadow` → `shadowOffset`, `shadowOpacity`, `shadowRadius` (iOS) or `elevation` (Android)
- Touch states → `Pressable` with `({ pressed }) => [...]` style
- `font-family` → platform font (`System` for iOS, `Roboto` for Android)

### Vue / Svelte Translation

- Reference HTML → template section with `class` bindings
- Reference CSS → `<style scoped>` block
- Reference states → reactive `class:` directives (Svelte) or `:class` bindings (Vue)

## Step 4: Quality Verification

Before delivering, verify against the reference file:

- [ ] **Dimensions match** — height, padding, border-radius from Quick Reference
- [ ] **Colors are semantic** — using design tokens, not hardcoded hex in components
- [ ] **All states implemented** — hover, focus-visible, active, disabled, loading (check States Reference table)
- [ ] **Dark mode works** — tokens switch via media query or class
- [ ] **Transitions present** — exact easing and duration from Animation section
- [ ] **ARIA attributes included** — from Accessibility section
- [ ] **Touch targets >= 44px** on mobile
- [ ] **Focus ring visible** on keyboard navigation
- [ ] **`prefers-reduced-motion`** respected for animations
- [ ] **No "AI look"** — no gratuitous gradients, consistent spacing, intentional hierarchy

## Design System Blending Philosophy

When using blended (default) or combining systems:

- **Google's systematic tokens** — semantic color roles with `on-` counterparts, state layer opacities
- **Apple's refinement** — continuous corners, purposeful motion, Liquid Glass for navigation
- **The result** should feel like a polished custom design system from a well-funded startup
- **Not** recognizably Material or Apple — a third thing that takes the best of both

## Anti-Patterns (What Makes UI Look "AI-Generated")

| Problem | Fix |
|---------|-----|
| Gradient hero + centered cards | Use the layout patterns from the reference files |
| Random hex colors everywhere | Copy Design Tokens block, use semantic variables |
| Missing hover/focus states | Check States Reference table, implement ALL states |
| Inconsistent border-radius | Use one radius value from the component's Quick Reference |
| Shadows that don't match | Use exact box-shadow from the reference elevation values |
| Text on busy backgrounds | Ensure 4.5:1 contrast using the `on-` color counterparts |
| Everything centered, no anchor | Left-align content, use visual hierarchy from reference |
| Eyeballed spacing | Use 4px/8px grid from `blended/design-principles.md` |
