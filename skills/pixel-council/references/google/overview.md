---
name: google-m3-overview
description: Complete M3 token system — 34 colors (light+dark), typography scale, elevation levels, motion easing curves
metadata:
  tags: material design 3, m3, design tokens, colors, typography, elevation, motion, theme
---

# Google Material Design 3 -- Design System Reference

> Source: [material-components/material-web](https://github.com/material-components/material-web)

## Core Philosophy

Material Design 3 (Material You) emphasizes personalization, accessibility, and adaptive design.
It creates meaning through color, shape, and typography while maintaining consistency across platforms.

### Design Token Architecture

Material uses a three-tier token hierarchy:
1. **Reference Tokens** -- Concrete values (hex colors, font families, pixel sizes)
2. **System Tokens** -- Design decisions defining character (color roles, typescale, shape)
3. **Component Tokens** -- Design attributes applied to specific elements

---

## Complete CSS Design Token Foundation

Copy-paste this block as the starting point for any M3-based project.

```css
:root {
  /* ===== COLOR: Light Theme (M3 Baseline) ===== */
  --md-sys-color-primary: #6750A4;
  --md-sys-color-on-primary: #FFFFFF;
  --md-sys-color-primary-container: #EADDFF;
  --md-sys-color-on-primary-container: #21005D;
  --md-sys-color-secondary: #625B71;
  --md-sys-color-on-secondary: #FFFFFF;
  --md-sys-color-secondary-container: #E8DEF8;
  --md-sys-color-on-secondary-container: #1D192B;
  --md-sys-color-tertiary: #7D5260;
  --md-sys-color-on-tertiary: #FFFFFF;
  --md-sys-color-tertiary-container: #FFD8E4;
  --md-sys-color-on-tertiary-container: #31111D;
  --md-sys-color-error: #B3261E;
  --md-sys-color-on-error: #FFFFFF;
  --md-sys-color-error-container: #F9DEDC;
  --md-sys-color-on-error-container: #410E0B;
  --md-sys-color-background: #FEF7FF;
  --md-sys-color-on-background: #1D1B20;
  --md-sys-color-surface: #FEF7FF;
  --md-sys-color-on-surface: #1D1B20;
  --md-sys-color-surface-variant: #E7E0EC;
  --md-sys-color-on-surface-variant: #49454F;
  --md-sys-color-outline: #79747E;
  --md-sys-color-outline-variant: #CAC4D0;
  --md-sys-color-surface-dim: #DED8E1;
  --md-sys-color-surface-bright: #FEF7FF;
  --md-sys-color-surface-container-lowest: #FFFFFF;
  --md-sys-color-surface-container-low: #F7F2FA;
  --md-sys-color-surface-container: #F3EDF7;
  --md-sys-color-surface-container-high: #ECE6F0;
  --md-sys-color-surface-container-highest: #E6E0E9;
  --md-sys-color-inverse-surface: #322F35;
  --md-sys-color-inverse-on-surface: #F5EFF7;
  --md-sys-color-inverse-primary: #D0BCFF;
  --md-sys-color-scrim: #000000;
  --md-sys-color-shadow: #000000;

  /* ===== ELEVATION (box-shadow) ===== */
  --md-sys-elevation-0: none;
  --md-sys-elevation-1: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
  --md-sys-elevation-2: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  --md-sys-elevation-3: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  --md-sys-elevation-4: 0 2px 3px rgba(0,0,0,0.3), 0 6px 10px 4px rgba(0,0,0,0.15);
  --md-sys-elevation-5: 0 4px 4px rgba(0,0,0,0.3), 0 8px 12px 6px rgba(0,0,0,0.15);

  /* ===== SHAPE (corner radius) ===== */
  --md-sys-shape-corner-none: 0px;
  --md-sys-shape-corner-extra-small: 4px;
  --md-sys-shape-corner-small: 8px;
  --md-sys-shape-corner-medium: 12px;
  --md-sys-shape-corner-large: 16px;
  --md-sys-shape-corner-extra-large: 28px;
  --md-sys-shape-corner-full: 9999px;

  /* ===== MOTION: Easing ===== */
  --md-sys-motion-easing-emphasized: cubic-bezier(0.2, 0.0, 0, 1.0);
  --md-sys-motion-easing-emphasized-decelerate: cubic-bezier(0.05, 0.7, 0.1, 1.0);
  --md-sys-motion-easing-emphasized-accelerate: cubic-bezier(0.3, 0.0, 0.8, 0.15);
  --md-sys-motion-easing-standard: cubic-bezier(0.2, 0.0, 0, 1.0);
  --md-sys-motion-easing-standard-decelerate: cubic-bezier(0, 0, 0, 1);
  --md-sys-motion-easing-standard-accelerate: cubic-bezier(0.3, 0, 1, 1);

  /* ===== MOTION: Durations ===== */
  --md-sys-motion-duration-short1: 50ms;
  --md-sys-motion-duration-short2: 100ms;
  --md-sys-motion-duration-short3: 150ms;
  --md-sys-motion-duration-short4: 200ms;
  --md-sys-motion-duration-medium1: 250ms;
  --md-sys-motion-duration-medium2: 300ms;
  --md-sys-motion-duration-medium3: 350ms;
  --md-sys-motion-duration-medium4: 400ms;
  --md-sys-motion-duration-long1: 450ms;
  --md-sys-motion-duration-long2: 500ms;

  /* ===== STATE LAYER OPACITIES ===== */
  --md-sys-state-hover-opacity: 0.08;
  --md-sys-state-focus-opacity: 0.10;
  --md-sys-state-pressed-opacity: 0.10;
  --md-sys-state-dragged-opacity: 0.16;
  --md-sys-state-disabled-container-opacity: 0.12;
  --md-sys-state-disabled-content-opacity: 0.38;
}

/* ===== DARK THEME ===== */
@media (prefers-color-scheme: dark) {
  :root {
    --md-sys-color-primary: #D0BCFF;
    --md-sys-color-on-primary: #381E72;
    --md-sys-color-primary-container: #4F378B;
    --md-sys-color-on-primary-container: #EADDFF;
    --md-sys-color-secondary: #CCC2DC;
    --md-sys-color-on-secondary: #332D41;
    --md-sys-color-secondary-container: #4A4458;
    --md-sys-color-on-secondary-container: #E8DEF8;
    --md-sys-color-tertiary: #EFB8C8;
    --md-sys-color-on-tertiary: #492532;
    --md-sys-color-tertiary-container: #633B48;
    --md-sys-color-on-tertiary-container: #FFD8E4;
    --md-sys-color-error: #F2B8B5;
    --md-sys-color-on-error: #601410;
    --md-sys-color-error-container: #8C1D18;
    --md-sys-color-on-error-container: #F9DEDC;
    --md-sys-color-background: #141218;
    --md-sys-color-on-background: #E6E0E9;
    --md-sys-color-surface: #141218;
    --md-sys-color-on-surface: #E6E0E9;
    --md-sys-color-surface-variant: #49454F;
    --md-sys-color-on-surface-variant: #CAC4D0;
    --md-sys-color-outline: #938F99;
    --md-sys-color-outline-variant: #49454F;
    --md-sys-color-surface-dim: #141218;
    --md-sys-color-surface-bright: #3B383E;
    --md-sys-color-surface-container-lowest: #0F0D13;
    --md-sys-color-surface-container-low: #1D1B20;
    --md-sys-color-surface-container: #211F26;
    --md-sys-color-surface-container-high: #2B2930;
    --md-sys-color-surface-container-highest: #36343B;
    --md-sys-color-inverse-surface: #E6E0E9;
    --md-sys-color-inverse-on-surface: #322F35;
    --md-sys-color-inverse-primary: #6750A4;
  }
}

/* Class-based dark mode (for manual toggle) */
.dark {
  --md-sys-color-primary: #D0BCFF;
  --md-sys-color-on-primary: #381E72;
  --md-sys-color-primary-container: #4F378B;
  --md-sys-color-on-primary-container: #EADDFF;
  --md-sys-color-secondary: #CCC2DC;
  --md-sys-color-on-secondary: #332D41;
  --md-sys-color-secondary-container: #4A4458;
  --md-sys-color-on-secondary-container: #E8DEF8;
  --md-sys-color-tertiary: #EFB8C8;
  --md-sys-color-on-tertiary: #492532;
  --md-sys-color-tertiary-container: #633B48;
  --md-sys-color-on-tertiary-container: #FFD8E4;
  --md-sys-color-error: #F2B8B5;
  --md-sys-color-on-error: #601410;
  --md-sys-color-error-container: #8C1D18;
  --md-sys-color-on-error-container: #F9DEDC;
  --md-sys-color-background: #141218;
  --md-sys-color-on-background: #E6E0E9;
  --md-sys-color-surface: #141218;
  --md-sys-color-on-surface: #E6E0E9;
  --md-sys-color-surface-variant: #49454F;
  --md-sys-color-on-surface-variant: #CAC4D0;
  --md-sys-color-outline: #938F99;
  --md-sys-color-outline-variant: #49454F;
  --md-sys-color-surface-dim: #141218;
  --md-sys-color-surface-bright: #3B383E;
  --md-sys-color-surface-container-lowest: #0F0D13;
  --md-sys-color-surface-container-low: #1D1B20;
  --md-sys-color-surface-container: #211F26;
  --md-sys-color-surface-container-high: #2B2930;
  --md-sys-color-surface-container-highest: #36343B;
  --md-sys-color-inverse-surface: #E6E0E9;
  --md-sys-color-inverse-on-surface: #322F35;
  --md-sys-color-inverse-primary: #6750A4;
}
```

---

## Color System

### Color Roles Reference (Light / Dark)

Every color role has an `on-` counterpart for accessible content contrast.

| Token | Light | Dark | Purpose |
|-------|-------|------|---------|
| `primary` | `#6750A4` | `#D0BCFF` | Key actions, focal points |
| `on-primary` | `#FFFFFF` | `#381E72` | Content on primary |
| `primary-container` | `#EADDFF` | `#4F378B` | Standout fill for primary elements |
| `on-primary-container` | `#21005D` | `#EADDFF` | Content on primary container |
| `secondary` | `#625B71` | `#CCC2DC` | Less prominent elements |
| `on-secondary` | `#FFFFFF` | `#332D41` | Content on secondary |
| `secondary-container` | `#E8DEF8` | `#4A4458` | Fill for secondary elements |
| `on-secondary-container` | `#1D192B` | `#E8DEF8` | Content on secondary container |
| `tertiary` | `#7D5260` | `#EFB8C8` | Accent, contrast interest |
| `on-tertiary` | `#FFFFFF` | `#492532` | Content on tertiary |
| `tertiary-container` | `#FFD8E4` | `#633B48` | Fill for tertiary elements |
| `on-tertiary-container` | `#31111D` | `#FFD8E4` | Content on tertiary container |
| `error` | `#B3261E` | `#F2B8B5` | Error states |
| `on-error` | `#FFFFFF` | `#601410` | Content on error |
| `error-container` | `#F9DEDC` | `#8C1D18` | Fill for error messages |
| `on-error-container` | `#410E0B` | `#F9DEDC` | Content on error container |
| `background` | `#FEF7FF` | `#141218` | App background |
| `on-background` | `#1D1B20` | `#E6E0E9` | Content on background |
| `surface` | `#FEF7FF` | `#141218` | Surface-level containers |
| `on-surface` | `#1D1B20` | `#E6E0E9` | Content on surface |
| `surface-variant` | `#E7E0EC` | `#49454F` | Alternate surface |
| `on-surface-variant` | `#49454F` | `#CAC4D0` | Secondary content on surface |
| `outline` | `#79747E` | `#938F99` | Borders, dividers |
| `outline-variant` | `#CAC4D0` | `#49454F` | Decorative outlines |
| `surface-dim` | `#DED8E1` | `#141218` | Dimmed surface |
| `surface-bright` | `#FEF7FF` | `#3B383E` | Bright surface |
| `surface-container-lowest` | `#FFFFFF` | `#0F0D13` | Lowest emphasis container |
| `surface-container-low` | `#F7F2FA` | `#1D1B20` | Low emphasis container |
| `surface-container` | `#F3EDF7` | `#211F26` | Default container surface |
| `surface-container-high` | `#ECE6F0` | `#2B2930` | High emphasis container |
| `surface-container-highest` | `#E6E0E9` | `#36343B` | Highest emphasis container |
| `inverse-surface` | `#322F35` | `#E6E0E9` | Inverse surface (snackbars) |
| `inverse-on-surface` | `#F5EFF7` | `#322F35` | Content on inverse surface |
| `inverse-primary` | `#D0BCFF` | `#6750A4` | Primary on inverse surface |
| `scrim` | `#000000` | `#000000` | Overlay scrim |

### Key Principles
- Use `primary` for key actions and focal points
- Use `secondary` for supporting elements
- Use `tertiary` for accent and visual interest
- Use `surface` variants to create depth hierarchy without shadows
- Use `error` for destructive actions and validation states

---

## Elevation System

M3 uses both tonal elevation (surface tint) and shadow elevation:

| Level | CSS box-shadow | Purpose |
|-------|---------------|---------|
| 0 | `none` | Base surface |
| 1 | `0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15)` | Cards, navigation |
| 2 | `0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15)` | Menus, selected nav |
| 3 | `0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15)` | Search bars, dialogs |
| 4 | `0 2px 3px rgba(0,0,0,0.3), 0 6px 10px 4px rgba(0,0,0,0.15)` | Snackbars |
| 5 | `0 4px 4px rgba(0,0,0,0.3), 0 8px 12px 6px rgba(0,0,0,0.15)` | FABs |

---

## Typography System

Font: `Roboto, 'Noto Sans', Arial, sans-serif`

### Complete Typescale

| Style | Size | Weight | Line-Height | Letter-Spacing |
|-------|------|--------|-------------|----------------|
| Display Large | 57px | 400 | 64px | -0.25px |
| Display Medium | 45px | 400 | 52px | 0px |
| Display Small | 36px | 400 | 44px | 0px |
| Headline Large | 32px | 400 | 40px | 0px |
| Headline Medium | 28px | 400 | 36px | 0px |
| Headline Small | 24px | 400 | 32px | 0px |
| Title Large | 22px | 400 | 28px | 0px |
| Title Medium | 16px | 500 | 24px | 0.15px |
| Title Small | 14px | 500 | 20px | 0.1px |
| Body Large | 16px | 400 | 24px | 0.5px |
| Body Medium | 14px | 400 | 20px | 0.25px |
| Body Small | 12px | 400 | 16px | 0.4px |
| Label Large | 14px | 500 | 20px | 0.1px |
| Label Medium | 12px | 500 | 16px | 0.5px |
| Label Small | 11px | 500 | 16px | 0.5px |

### Typeface Tokens
| Token | Default | Purpose |
|-------|---------|---------|
| `--md-ref-typeface-brand` | Roboto | Headlines, titles |
| `--md-ref-typeface-plain` | Roboto | Body text, labels |

---

## Shape System

| Token | Value | Use Case |
|-------|-------|----------|
| `corner-none` | `0px` | Sharp edges, full-bleed |
| `corner-extra-small` | `4px` | Subtle rounding (checkboxes) |
| `corner-small` | `8px` | Chips, small containers |
| `corner-medium` | `12px` | Cards, dialogs |
| `corner-large` | `16px` | FABs, large containers |
| `corner-extra-large` | `28px` | Bottom sheets |
| `corner-full` | `9999px` | Pills, circular buttons |

---

## Motion System

### Easing Functions

| Token | CSS Value | Use |
|-------|-----------|-----|
| `easing-emphasized` | `cubic-bezier(0.2, 0.0, 0, 1.0)` | Default for most transitions |
| `easing-emphasized-decelerate` | `cubic-bezier(0.05, 0.7, 0.1, 1.0)` | Elements entering screen |
| `easing-emphasized-accelerate` | `cubic-bezier(0.3, 0.0, 0.8, 0.15)` | Elements leaving screen |
| `easing-standard` | `cubic-bezier(0.2, 0.0, 0, 1.0)` | Simple property changes |
| `easing-standard-decelerate` | `cubic-bezier(0, 0, 0, 1)` | Elements fading in |
| `easing-standard-accelerate` | `cubic-bezier(0.3, 0, 1, 1)` | Elements fading out |

### Duration Tokens

| Token | Value | Use |
|-------|-------|-----|
| `duration-short1` | `50ms` | Micro state changes |
| `duration-short2` | `100ms` | Hover/focus feedback |
| `duration-short3` | `150ms` | Press feedback |
| `duration-short4` | `200ms` | Small element transitions |
| `duration-medium1` | `250ms` | Standard transitions |
| `duration-medium2` | `300ms` | Page element transitions |
| `duration-medium3` | `350ms` | Complex element transitions |
| `duration-medium4` | `400ms` | Large surface transitions |
| `duration-long1` | `450ms` | Full-screen transitions |
| `duration-long2` | `500ms` | Complex choreography |

---

## State Layer System

Interactive components use semi-transparent overlays on the `on-*` color:

| State | Opacity | Cursor | Notes |
|-------|---------|--------|-------|
| Enabled | `0.00` | `pointer` | No overlay |
| Hover | `0.08` | `pointer` | Subtle highlight |
| Focus | `0.10` | -- | Focus ring also shown |
| Pressed | `0.10` | `pointer` | Brief flash |
| Dragged | `0.16` | `grabbing` | During drag |
| Disabled (container) | `0.12` | `not-allowed` | Reduced contrast |
| Disabled (content) | `0.38` | `not-allowed` | Faded content |

### State Layer CSS Pattern
```css
.md-component {
  position: relative;
}
.md-component::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: var(--md-sys-color-on-surface);
  opacity: 0;
  transition: opacity 150ms var(--md-sys-motion-easing-standard);
  pointer-events: none;
}
.md-component:hover::before { opacity: 0.08; }
.md-component:focus-visible::before { opacity: 0.10; }
.md-component:active::before { opacity: 0.10; }
```

---

## Component Categories

### Input & Actions
- **Button** -- filled, outlined, text, tonal, elevated
- **FAB** -- small, medium, large, extended
- **Icon Button** -- standard, filled, tonal, outlined
- **Checkbox**, **Radio**, **Switch**
- **Text Field** -- filled, outlined
- **Select** -- filled, outlined
- **Slider**

### Navigation
- **Tabs** -- primary, secondary
- **Navigation Bar** -- bottom navigation
- **Navigation Drawer** / **Navigation Rail**
- **Menu** -- submenu support

### Communication
- **Dialog** -- basic, full-screen
- **Snackbar**, **Badge**
- **Progress** -- linear, circular

### Containment
- **Card** -- elevated, filled, outlined
- **Chip** -- assist, filter, input, suggestion
- **Divider**, **List**, **Bottom Sheet**

---

## Key Design Principles

1. **Accessible by default** -- 4.5:1 contrast ratios, semantic color roles
2. **Adaptive** -- Responsive to screen size, orientation, density
3. **Consistent** -- Unified token system across all components
4. **Customizable** -- Three-tier token architecture for brand adaptation
5. **Hierarchical** -- Visual weight guides user attention
6. **Purposeful motion** -- Transitions communicate spatial relationships
