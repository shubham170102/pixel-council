---
name: blended-design-principles
description: Universal spacing scale, breakpoints, easing curves, accessibility rules from Google M3 and Apple HIG combined
metadata:
  tags: design principles, spacing, breakpoints, easing, accessibility, grid, responsive, layout
---

# Cross-Company Design Principles

> Universal patterns extracted from Google Material Design 3 and Apple HIG, with resolved token values.

---

## Complete Blended CSS Design Token Foundation

```css
:root {
  /* ===== BLENDED COLOR TOKENS (Light) ===== */
  /* Primary: Google's purple as default, Apple blue as accent */
  --color-primary: #6750A4;
  --color-on-primary: #FFFFFF;
  --color-primary-container: #EADDFF;
  --color-on-primary-container: #21005D;
  --color-accent: #007AFF;
  --color-on-accent: #FFFFFF;

  /* Secondary & Tertiary */
  --color-secondary: #625B71;
  --color-on-secondary: #FFFFFF;
  --color-secondary-container: #E8DEF8;
  --color-tertiary: #7D5260;

  /* Semantic */
  --color-error: #B3261E;
  --color-on-error: #FFFFFF;
  --color-error-container: #F9DEDC;
  --color-success: #34C759;
  --color-on-success: #FFFFFF;
  --color-warning: #FF9500;
  --color-on-warning: #FFFFFF;

  /* Surfaces -- blends Google's tonal approach with Apple's clean whites */
  --color-background: #FFFFFF;
  --color-on-background: #1D1B20;
  --color-surface: #FFFFFF;
  --color-on-surface: #1D1B20;
  --color-surface-secondary: #F2F2F7;
  --color-surface-tertiary: #F3EDF7;
  --color-surface-elevated: #FFFFFF;
  --color-on-surface-secondary: #49454F;

  /* Borders */
  --color-outline: #79747E;
  --color-outline-variant: #CAC4D0;
  --color-separator: rgba(60, 60, 67, 0.29);

  /* Fills (Apple-style opacity fills) */
  --color-fill: rgba(120, 120, 128, 0.2);
  --color-fill-secondary: rgba(120, 120, 128, 0.16);

  /* Labels */
  --color-label: #000000;
  --color-label-secondary: rgba(60, 60, 67, 0.6);
  --color-label-tertiary: rgba(60, 60, 67, 0.3);
  --color-label-quaternary: rgba(60, 60, 67, 0.18);
  --color-placeholder: rgba(60, 60, 67, 0.3);

  /* Scrim */
  --color-scrim: rgba(0, 0, 0, 0.32);

  /* ===== TYPOGRAPHY ===== */
  /* Blend: Apple font stack primary, Roboto as web fallback */
  --font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display',
    'SF Pro Text', Roboto, 'Helvetica Neue', Arial, sans-serif;
  --font-mono: 'SF Mono', SFMono-Regular, 'Roboto Mono', Consolas, monospace;

  /* ===== SPACING (4px base grid) ===== */
  --space-2xs: 2px;
  --space-xs: 4px;
  --space-sm: 8px;
  --space-md: 12px;
  --space-base: 16px;
  --space-lg: 24px;
  --space-xl: 32px;
  --space-2xl: 48px;
  --space-3xl: 64px;

  /* ===== CORNER RADII (Apple's continuous corners) ===== */
  --radius-none: 0px;
  --radius-xs: 4px;
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 28px;
  --radius-full: 9999px;

  /* ===== SHADOWS (5-level, Apple-style lighter shadows) ===== */
  --shadow-0: none;
  --shadow-1: 0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06);
  --shadow-2: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
  --shadow-3: 0 10px 15px rgba(0,0,0,0.08), 0 4px 6px rgba(0,0,0,0.05);
  --shadow-4: 0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04);
  --shadow-5: 0 25px 50px rgba(0,0,0,0.15);

  /* ===== EASING (M3 system, universally good) ===== */
  --ease-emphasized: cubic-bezier(0.2, 0.0, 0, 1.0);
  --ease-emphasized-decelerate: cubic-bezier(0.05, 0.7, 0.1, 1.0);
  --ease-emphasized-accelerate: cubic-bezier(0.3, 0.0, 0.8, 0.15);
  --ease-standard: cubic-bezier(0.2, 0.0, 0, 1.0);
  --ease-standard-decelerate: cubic-bezier(0, 0, 0, 1);
  --ease-standard-accelerate: cubic-bezier(0.3, 0, 1, 1);
  --ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275);

  /* ===== DURATIONS ===== */
  --duration-instant: 50ms;
  --duration-fast: 100ms;
  --duration-normal: 200ms;
  --duration-moderate: 300ms;
  --duration-slow: 400ms;
  --duration-slower: 500ms;

  /* ===== STATE LAYERS (M3 system) ===== */
  --state-hover: 0.08;
  --state-focus: 0.10;
  --state-pressed: 0.10;
  --state-dragged: 0.16;
  --state-disabled-container: 0.12;
  --state-disabled-content: 0.38;

  /* ===== FOCUS ===== */
  --focus-ring: 4px solid rgba(0, 122, 255, 0.6);
  --focus-ring-offset: 1px;
}

/* ===== DARK THEME ===== */
@media (prefers-color-scheme: dark) {
  :root {
    --color-primary: #D0BCFF;
    --color-on-primary: #381E72;
    --color-primary-container: #4F378B;
    --color-on-primary-container: #EADDFF;
    --color-accent: #0A84FF;
    --color-on-accent: #FFFFFF;

    --color-secondary: #CCC2DC;
    --color-on-secondary: #332D41;
    --color-secondary-container: #4A4458;
    --color-tertiary: #EFB8C8;

    --color-error: #F2B8B5;
    --color-on-error: #601410;
    --color-error-container: #8C1D18;
    --color-success: #30D158;
    --color-on-success: #FFFFFF;
    --color-warning: #FF9F0A;
    --color-on-warning: #FFFFFF;

    --color-background: #000000;
    --color-on-background: #E6E0E9;
    --color-surface: #141218;
    --color-on-surface: #E6E0E9;
    --color-surface-secondary: #1C1C1E;
    --color-surface-tertiary: #211F26;
    --color-surface-elevated: #2C2C2E;
    --color-on-surface-secondary: #CAC4D0;

    --color-outline: #938F99;
    --color-outline-variant: #49454F;
    --color-separator: rgba(84, 84, 88, 0.6);

    --color-fill: rgba(120, 120, 128, 0.36);
    --color-fill-secondary: rgba(120, 120, 128, 0.32);

    --color-label: #FFFFFF;
    --color-label-secondary: rgba(235, 235, 245, 0.6);
    --color-label-tertiary: rgba(235, 235, 245, 0.3);
    --color-label-quaternary: rgba(235, 235, 245, 0.16);
    --color-placeholder: rgba(235, 235, 245, 0.3);

    --color-scrim: rgba(0, 0, 0, 0.56);
  }
}

/* Class-based dark mode */
.dark {
  --color-primary: #D0BCFF;
  --color-on-primary: #381E72;
  --color-primary-container: #4F378B;
  --color-on-primary-container: #EADDFF;
  --color-accent: #0A84FF;
  --color-on-accent: #FFFFFF;
  --color-secondary: #CCC2DC;
  --color-on-secondary: #332D41;
  --color-secondary-container: #4A4458;
  --color-tertiary: #EFB8C8;
  --color-error: #F2B8B5;
  --color-on-error: #601410;
  --color-error-container: #8C1D18;
  --color-success: #30D158;
  --color-warning: #FF9F0A;
  --color-background: #000000;
  --color-on-background: #E6E0E9;
  --color-surface: #141218;
  --color-on-surface: #E6E0E9;
  --color-surface-secondary: #1C1C1E;
  --color-surface-tertiary: #211F26;
  --color-surface-elevated: #2C2C2E;
  --color-on-surface-secondary: #CAC4D0;
  --color-outline: #938F99;
  --color-outline-variant: #49454F;
  --color-separator: rgba(84, 84, 88, 0.6);
  --color-fill: rgba(120, 120, 128, 0.36);
  --color-fill-secondary: rgba(120, 120, 128, 0.32);
  --color-label: #FFFFFF;
  --color-label-secondary: rgba(235, 235, 245, 0.6);
  --color-label-tertiary: rgba(235, 235, 245, 0.3);
  --color-label-quaternary: rgba(235, 235, 245, 0.16);
  --color-placeholder: rgba(235, 235, 245, 0.3);
  --color-scrim: rgba(0, 0, 0, 0.56);
}
```

---

## 1. Visual Hierarchy

### The 60-30-10 Rule
- **60%** -- Dominant surface: `--color-background` (`#FFFFFF` light / `#000000` dark)
- **30%** -- Secondary surface: `--color-surface-secondary` (`#F2F2F7` light / `#1C1C1E` dark)
- **10%** -- Accent color: `--color-primary` (`#6750A4` light / `#D0BCFF` dark)

### Establishing Hierarchy
- **Size** communicates importance: larger = more important
- **Weight** creates emphasis: bold for headlines, regular for body
- **Color** directs attention: `--color-primary` (`#6750A4`) for actions, `--color-on-surface-secondary` (`#49454F`) for supporting
- **Space** groups related items: `--space-sm` (`8px`) within groups, `--space-lg` (`24px`) between groups
- **Depth** layers information: `--shadow-1` through `--shadow-5` for interactivity

---

## 2. Spacing System

### Scale (4px base grid)

| Token | Value | Use |
|-------|-------|-----|
| `--space-2xs` | `2px` | Hairline borders |
| `--space-xs` | `4px` | Tight padding, icon gaps |
| `--space-sm` | `8px` | Component internal padding |
| `--space-md` | `12px` | Card padding, form gaps |
| `--space-base` | `16px` | Section padding, standard gap |
| `--space-lg` | `24px` | Section separation |
| `--space-xl` | `32px` | Major section gaps |
| `--space-2xl` | `48px` | Page-level spacing |
| `--space-3xl` | `64px` | Hero sections |

### Touch Target Standards

| Context | Minimum Size |
|---------|-------------|
| Mobile (Apple) | 44x44pt |
| Mobile (Material) | 48x48dp |
| Desktop | 24x24px (with 8px padding) |
| Watch | 38x38pt |

---

## 3. Color Patterns

### Semantic Color Mapping (Resolved Values)

| Role | Purpose | Blended Token | Light | Dark |
|------|---------|--------------|-------|------|
| Primary | Key actions, brand | `--color-primary` | `#6750A4` | `#D0BCFF` |
| Accent | Links, interactive | `--color-accent` | `#007AFF` | `#0A84FF` |
| Destructive | Delete, remove | `--color-error` | `#B3261E` | `#F2B8B5` |
| Success | Confirm, complete | `--color-success` | `#34C759` | `#30D158` |
| Warning | Caution | `--color-warning` | `#FF9500` | `#FF9F0A` |
| Surface | Backgrounds | `--color-surface` | `#FFFFFF` | `#141218` |
| On-Surface | Text on backgrounds | `--color-on-surface` | `#1D1B20` | `#E6E0E9` |
| Outline | Borders, dividers | `--color-outline` | `#79747E` | `#938F99` |

### Cross-System Color Comparison

| Role | Google M3 Light | Apple Light | Blended Light |
|------|----------------|-------------|---------------|
| Primary | `#6750A4` | `#007AFF` | `#6750A4` (M3 default) |
| Error/Red | `#B3261E` | `#FF3B30` | `#B3261E` (deeper) |
| Success/Green | -- | `#34C759` | `#34C759` (Apple green) |
| Warning/Orange | -- | `#FF9500` | `#FF9500` (Apple orange) |
| Background | `#FEF7FF` | `#FFFFFF` | `#FFFFFF` (clean white) |
| Surface container | `#F3EDF7` | `#F2F2F7` | `#F2F2F7` (neutral gray) |
| Text primary | `#1D1B20` | `#000000` | `#1D1B20` (softer black) |
| Outline | `#79747E` | `rgba(60,60,67,0.29)` | `#79747E` (solid) |

### Dark Mode Strategy
1. Don't just invert colors -- redesign for dark context
2. Background goes to `#000000` (Apple OLED) or `#141218` (M3 tinted)
3. Primary brightens: `#6750A4` becomes `#D0BCFF`
4. Maintain/increase contrast ratios
5. Reduce shadow intensity, increase tonal separation

---

## 4. Typography Patterns

### Blended Type Scale Recommendation

Use Apple's font stack with M3-style semantic roles:

| Role | Size | Weight | Line-Height | Letter-Spacing | Use Case |
|------|------|--------|-------------|----------------|----------|
| Display | 34px | 400 | 41px | 0.37px | Hero sections (Apple Large Title) |
| Heading 1 | 28px | 400 | 34px | 0.36px | Page titles (Apple Title 1) |
| Heading 2 | 22px | 400 | 28px | 0.35px | Section titles |
| Heading 3 | 20px | 400 | 25px | 0.38px | Subsection headers |
| Headline | 17px | 600 | 22px | -0.41px | Card titles, emphasis |
| Body | 17px | 400 | 22px | -0.41px | Main reading text |
| Callout | 16px | 400 | 21px | -0.32px | Supporting body text |
| Label | 14px | 500 | 20px | 0.1px | Buttons, tabs (M3 Label Large) |
| Caption | 12px | 400 | 16px | 0px | Supporting info, timestamps |
| Small | 11px | 400 | 13px | 0.07px | Fine print, badges |

### Line Height Standards

| Content Type | Ratio |
|-------------|-------|
| Headings | 1.1-1.3x font size |
| Body text | 1.4-1.6x font size |
| UI labels | 1.0-1.2x font size |

---

## 5. Component Patterns

### Buttons -- Hierarchy of Emphasis

| Level | Google | Apple | Blended CSS |
|-------|--------|-------|-------------|
| Highest | Filled/FAB | Prominent | `background: var(--color-primary); color: var(--color-on-primary);` |
| High | Tonal | Bordered | `background: var(--color-primary-container); color: var(--color-on-primary-container);` |
| Medium | Outlined | Bordered (gray) | `border: 1px solid var(--color-outline); background: transparent;` |
| Low | Text | Borderless | `background: transparent; color: var(--color-primary);` |

### Cards -- Content Containers
- **Corner radius**: `--radius-md` (`12px`) -- M3 medium shape, Apple ~13px continuous
- **Padding**: `--space-base` (`16px`) internal
- **Elevation**: `--shadow-1` for subtle lift
- **Background**: `--color-surface` (`#FFFFFF` light / `#141218` dark)

### Input Fields
- **Height**: 48-56px (mobile), 36-40px (desktop)
- **Border**: `1px solid var(--color-outline)` (`#79747E`)
- **Focus**: `border-color: var(--color-primary)` (`#6750A4`) + focus ring
- **Error**: `border-color: var(--color-error)` (`#B3261E`) + helper text
- **Border radius**: `--radius-sm` (`8px`)
- **Placeholder**: `color: var(--color-placeholder)` (`rgba(60,60,67,0.3)`)

---

## 6. Animation & Motion

### Principles (Both Systems Agree)
1. **Purposeful** -- every animation communicates something
2. **Quick** -- under 300ms for UI transitions
3. **Natural** -- spring-based physics, not linear
4. **Consistent** -- same element = same animation
5. **Interruptible** -- users can act during animations
6. **Accessible** -- respect `prefers-reduced-motion`

### Timing Guidelines (Resolved Values)

| Action | Duration | Easing |
|--------|----------|--------|
| Hover/focus feedback | `100ms` | `cubic-bezier(0.2, 0.0, 0, 1.0)` (standard) |
| Press feedback | `150ms` | `cubic-bezier(0.2, 0.0, 0, 1.0)` |
| Element transition | `200-300ms` | `cubic-bezier(0.2, 0.0, 0, 1.0)` (emphasized) |
| Enter screen | `250ms` | `cubic-bezier(0.05, 0.7, 0.1, 1.0)` (decelerate) |
| Leave screen | `200ms` | `cubic-bezier(0.3, 0.0, 0.8, 0.15)` (accelerate) |
| Page transition | `300-400ms` | `cubic-bezier(0.2, 0.0, 0, 1.0)` |
| Spring overshoot | `300ms` | `cubic-bezier(0.175, 0.885, 0.32, 1.275)` |

### Reduce Motion
```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## 7. Responsive Design

### Breakpoint Strategy

| Name | Width | Layout |
|------|-------|--------|
| Mobile | <600px | Single column, bottom nav |
| Tablet | 600-1024px | Two column, sidebar option |
| Desktop | 1024-1440px | Multi-column, top/side nav |
| Large | >1440px | Max-width container, centered |

### Adaptation Rules
1. Navigation moves from bottom (mobile) to side (tablet) to top (desktop)
2. Touch targets shrink on desktop (pointer precision is higher)
3. Typography base stays 16-17px across all sizes
4. Spacing scales: `--space-base` (`16px`) mobile, increases with screen size

---

## 8. Accessibility Checklist

### Color & Contrast
- 4.5:1 contrast for normal text (WCAG AA)
- 3:1 contrast for large text (18px+) and UI elements
- Information never conveyed by color alone
- Dark mode maintains readability

### Interaction
- Touch targets >= 44x44pt (mobile)
- All interactive elements keyboard accessible
- Focus visible via `outline: 4px solid rgba(0, 122, 255, 0.6); outline-offset: 1px;`
- Destructive actions require confirmation

### Motion
- All animations respect `prefers-reduced-motion`
- No content conveyed only through animation
- No rapidly flashing content

---

## 9. Anti-Patterns to Avoid

### The "AI-Generated UI" Look
- Excessive gradients without purpose
- Too many colors competing (stick to 60-30-10)
- Shadows that don't match light source
- Inconsistent spacing (use `--space-*` tokens)
- Inconsistent border-radius (use `--radius-*` tokens)

### Common Mistakes
- Using raw hex colors instead of semantic `var(--color-*)` tokens
- Missing hover/focus/active states
- No loading/empty/error states
- Ignoring system dark mode
- Different border-radius values on related elements
