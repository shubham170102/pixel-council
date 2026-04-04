---
name: icons
description: Material Symbols icon system for web — variable font via Google Fonts CDN, design tokens, SVG fallbacks, state layers, and accessibility
metadata:
  tags: icon, material symbols, svg, font, glyph
---

# Icons -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Format | Google Fonts CDN variable font |
| Default size | 24px |
| Styles | Outlined (default), Rounded, Sharp |
| Variable axes | FILL (0-1), wght (100-700), GRAD (-50 to 200), opsz (20-48) |
| Color method | `currentColor` |
| Min touch target | 48x48px (when interactive) |
| CSS prefix | `--md-icon-*` tokens, `.md-icon` classes |

## Design Tokens

```css
:root {
  --md-icon-color-primary: #6750A4;
  --md-icon-color-on-surface: #1D1B20;
  --md-icon-color-on-surface-variant: #49454F;
  --md-icon-color-error: #B3261E;
  --md-icon-color-success: #34A853;
  --md-icon-color-warning: #F9AB00;
  --md-icon-size-sm: 20px;
  --md-icon-size-md: 24px;
  --md-icon-size-lg: 36px;
  --md-icon-size-xl: 48px;
  --md-icon-transition: color 200ms cubic-bezier(0.2, 0, 0, 1.0),
    font-variation-settings 200ms cubic-bezier(0.2, 0, 0, 1.0),
    opacity 200ms cubic-bezier(0.2, 0, 0, 1.0),
    transform 200ms cubic-bezier(0.2, 0, 0, 1.0);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-icon-color-primary: #D0BCFF;
    --md-icon-color-on-surface: #E6E0E9;
    --md-icon-color-on-surface-variant: #CAC4D0;
    --md-icon-color-error: #F2B8B5;
    --md-icon-color-success: #57BB8A;
    --md-icon-color-warning: #FDD663;
  }
}
.dark {
  --md-icon-color-primary: #D0BCFF;
  --md-icon-color-on-surface: #E6E0E9;
  --md-icon-color-on-surface-variant: #CAC4D0;
  --md-icon-color-error: #F2B8B5;
  --md-icon-color-success: #57BB8A;
  --md-icon-color-warning: #FDD663;
}
```

## CDN Loading

Load Material Symbols from Google Fonts CDN. The variable font includes all axes in a single request.

```html
<!-- Outlined (default) -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" rel="stylesheet">

<!-- Rounded variant -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" rel="stylesheet">

<!-- Sharp variant -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" rel="stylesheet">
```

## Variable Axes

| Axis | Range | Default | CSS Property | Purpose |
|------|-------|---------|-------------|---------|
| FILL | 0 - 1 | 0 | `font-variation-settings: 'FILL' 0` | 0 = outlined, 1 = filled |
| wght | 100 - 700 | 400 | `font-variation-settings: 'wght' 400` | Stroke weight / visual prominence |
| GRAD | -50 to 200 | 0 | `font-variation-settings: 'GRAD' 0` | Granular stroke adjustment without layout shift |
| opsz | 20 - 48 | 24 | `font-variation-settings: 'opsz' 24` | Optical size — match to display size |

## Sizes

| Context | Size | Weight | Optical Size | Example |
|---------|------|--------|-------------|---------|
| Dense UI | 20px | 300 | 20 | Compact lists, dense tables |
| Default | 24px | 400 | 24 | Buttons, navigation, toolbars |
| Prominent | 36px | 400 | 36 | Section headers, feature callouts |
| Feature | 48px | 400 | 48 | Hero areas, empty states, onboarding |

## HTML Structure

```html
<!-- Font-based icon (standard) -->
<span class="material-symbols-outlined" aria-hidden="true">search</span>

<!-- Icon in a button -->
<button class="md-icon-button" type="button" aria-label="Search">
  <span class="material-symbols-outlined" aria-hidden="true">search</span>
</button>

<!-- Icon button with state layer -->
<button class="md-icon-button" type="button" aria-label="Favorite">
  <span class="material-symbols-outlined" aria-hidden="true">favorite</span>
</button>

<!-- Icon with visible text label -->
<button class="md-icon-button md-icon-button--labeled" type="button">
  <span class="material-symbols-outlined" aria-hidden="true">add</span>
  <span>Create</span>
</button>

<!-- Filled toggle state -->
<button class="md-icon-button md-icon-button--filled-toggle" type="button"
  aria-label="Favorite" aria-pressed="true">
  <span class="material-symbols-outlined" aria-hidden="true">favorite</span>
</button>

<!-- SVG fallback (when CDN unavailable) -->
<svg class="md-icon" aria-hidden="true" width="24" height="24" viewBox="0 0 24 24"
  fill="none" stroke="currentColor" stroke-width="2"
  stroke-linecap="round" stroke-linejoin="round">
  <circle cx="10.5" cy="10.5" r="6.5"/><path d="M15.5 15.5l5 5"/>
</svg>
```

## Complete CSS

```css
/* ---- Base Font Icon ---- */
.material-symbols-outlined {
  font-family: 'Material Symbols Outlined';
  font-weight: normal;
  font-style: normal;
  font-size: var(--md-icon-size-md);
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
  font-feature-settings: 'liga';
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
  color: var(--md-icon-color-on-surface);
  transition: var(--md-icon-transition);
}

/* ---- SVG Fallback Base ---- */
.md-icon {
  display: inline-block;
  width: var(--md-icon-size-md);
  height: var(--md-icon-size-md);
  color: var(--md-icon-color-on-surface);
  flex-shrink: 0;
  vertical-align: middle;
  transition: var(--md-icon-transition);
}

/* ---- Size Classes ---- */
.md-icon--sm,
.md-icon--sm.material-symbols-outlined {
  font-size: var(--md-icon-size-sm);
  width: var(--md-icon-size-sm);
  height: var(--md-icon-size-sm);
  font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 20;
}
.md-icon--md,
.md-icon--md.material-symbols-outlined {
  font-size: var(--md-icon-size-md);
  width: var(--md-icon-size-md);
  height: var(--md-icon-size-md);
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
.md-icon--lg,
.md-icon--lg.material-symbols-outlined {
  font-size: var(--md-icon-size-lg);
  width: var(--md-icon-size-lg);
  height: var(--md-icon-size-lg);
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 36;
}
.md-icon--xl,
.md-icon--xl.material-symbols-outlined {
  font-size: var(--md-icon-size-xl);
  width: var(--md-icon-size-xl);
  height: var(--md-icon-size-xl);
  font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48;
}

/* ---- Color Classes ---- */
.md-icon--primary { color: var(--md-icon-color-primary); }
.md-icon--on-surface { color: var(--md-icon-color-on-surface); }
.md-icon--on-surface-variant { color: var(--md-icon-color-on-surface-variant); }
.md-icon--error { color: var(--md-icon-color-error); }
.md-icon--success { color: var(--md-icon-color-success); }
.md-icon--warning { color: var(--md-icon-color-warning); }

/* ---- Filled Variant Toggle ---- */
.md-icon--filled,
.md-icon-button--filled-toggle[aria-pressed="true"] .material-symbols-outlined {
  font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}

/* ---- Icon Button with M3 State Layer ---- */
.md-icon-button {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 48px;
  min-height: 48px;
  padding: 8px;
  border: none;
  border-radius: 9999px;
  background: transparent;
  color: var(--md-icon-color-on-surface-variant);
  cursor: pointer;
  overflow: hidden;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: var(--md-icon-transition);
}
.md-icon-button .material-symbols-outlined,
.md-icon-button .md-icon {
  color: inherit;
  position: relative;
  z-index: 1;
}

/* State layer via ::before */
.md-icon-button::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: currentColor;
  opacity: 0;
  transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1.0);
}

/* Labeled icon button */
.md-icon-button--labeled {
  gap: 8px;
  padding: 8px 16px 8px 12px;
  border-radius: 9999px;
  font-family: Roboto, 'Noto Sans', 'Helvetica Neue', sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
}

/* ---- Hover ---- */
@media (hover: hover) {
  .md-icon-button:hover::before {
    opacity: 0.08;
  }
}

/* ---- Focus ---- */
.md-icon-button:focus-visible {
  outline: 3px solid var(--md-icon-color-primary);
  outline-offset: 2px;
}
.md-icon-button:focus-visible::before {
  opacity: 0.10;
}

/* ---- Pressed ---- */
.md-icon-button:active::before {
  opacity: 0.10;
}

/* ---- Disabled ---- */
.md-icon-button:disabled,
.md-icon-button[aria-disabled="true"] {
  color: var(--md-icon-color-on-surface);
  opacity: 0.38;
  cursor: not-allowed;
  pointer-events: none;
}

/* ---- Dark Mode Overrides ---- */
@media (prefers-color-scheme: dark) {
  .md-icon-button:focus-visible {
    outline-color: var(--md-icon-color-primary);
  }
}
.dark .md-icon-button:focus-visible {
  outline-color: var(--md-icon-color-primary);
}
```

## State Layers

| State | Overlay Opacity | Transform | Cursor |
|-------|----------------|-----------|--------|
| Default | 0 | none | pointer |
| Hover | 0.08 | none | pointer |
| Focus | 0.10 | none | pointer |
| Pressed | 0.10 | none | pointer |
| Disabled | content at 0.38 | none | not-allowed |

## SVG Fallback Library

20 commonly-needed icons drawn in Material style. Each uses `viewBox="0 0 24 24"`, `fill="none"`, `stroke="currentColor"`, `stroke-width="2"`, `stroke-linecap="round"`, `stroke-linejoin="round"`.

### chevron_right
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 6l6 6-6 6"/></svg>
```

### chevron_left
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 6l-6 6 6 6"/></svg>
```

### expand_more
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M7 10l5 5 5-5"/></svg>
```

### check
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 13l4 4L19 7"/></svg>
```

### close
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 6l12 12M18 6L6 18"/></svg>
```

### add
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>
```

### remove
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/></svg>
```

### search
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="10.5" cy="10.5" r="6.5"/><path d="M15.5 15.5l5 5"/></svg>
```

### settings
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09a1.65 1.65 0 0 0-1.08-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09a1.65 1.65 0 0 0 1.51-1.08 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1.08 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9c.26.604.852.997 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1.08z"/></svg>
```

### person
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M5 21a9 9 0 0 1 14 0"/></svg>
```

### notifications
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
```

### lock
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V7a4 4 0 1 1 8 0v4"/></svg>
```

### language
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M3.6 9h16.8M3.6 15h16.8"/><path d="M12 3c2.2 2.6 3.4 5.6 3.4 9s-1.2 6.4-3.4 9c-2.2-2.6-3.4-5.6-3.4-9s1.2-6.4 3.4-9z"/></svg>
```

### star
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87L18.18 22 12 18.56 5.82 22 7 14.14l-5-4.87 6.91-1.01z"/></svg>
```

### favorite
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78L12 21.23l8.84-8.84a5.5 5.5 0 0 0 0-7.78z"/></svg>
```

### mail
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3 7l9 6 9-6"/></svg>
```

### schedule
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
```

### bolt
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L4 14h7l-1 8 9-12h-7l1-8z"/></svg>
```

### arrow_forward
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M13 5l7 7-7 7"/></svg>
```

### description
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6"/><path d="M9 13h6M9 17h4"/></svg>
```

## Animation & Motion

```css
/* State layer transition (M3 standard easing) */
.md-icon-button::before {
  transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1.0);
}

/* Fill axis toggle animation */
@keyframes md-icon-fill-toggle {
  0% { transform: scale(1); }
  50% { transform: scale(1.2); }
  100% { transform: scale(1); }
}
.md-icon--fill-animate {
  animation: md-icon-fill-toggle 250ms cubic-bezier(0.2, 0, 0, 1.0);
}

/* Icon entrance */
@keyframes md-icon-enter {
  0% { transform: scale(0); opacity: 0; }
  100% { transform: scale(1); opacity: 1; }
}
.md-icon--enter {
  animation: md-icon-enter 200ms cubic-bezier(0.2, 0, 0, 1.0);
}

/* Continuous spin (loading) */
@keyframes md-icon-spin {
  to { transform: rotate(360deg); }
}
.md-icon--spin {
  animation: md-icon-spin 600ms linear infinite;
}

@media (prefers-reduced-motion: reduce) {
  .material-symbols-outlined,
  .md-icon,
  .md-icon-button,
  .md-icon-button::before {
    transition: none;
  }
  .md-icon--fill-animate,
  .md-icon--enter,
  .md-icon--spin {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: decorative icons use `aria-hidden="true"`; standalone meaningful icons use `role="img"` with `aria-label`
- **Icon buttons**: `<button>` with `aria-label` describing the action, icon element gets `aria-hidden="true"`
- **Toggle buttons**: use `aria-pressed="true|false"` on icon buttons that toggle state (e.g., favorite)
- **Focus ring**: 3px solid primary color, 2px offset on interactive icon containers
- **Touch target**: minimum 48x48px on all interactive icon elements (M3 standard)
- **Keyboard**: Tab to focus icon buttons, Enter or Space to activate
- **Screen reader**: never expose raw icon ligature text or SVG paths; always provide text alternative via `aria-label` or adjacent visible text
- **High contrast**: `currentColor` inheritance ensures icons follow system high-contrast settings

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| Compact (< 600px) | 24px default icons; 48px min touch targets; feature icons at 36px |
| Medium (600-839px) | Same sizing; icon buttons may appear in top app bar with labels hidden |
| Expanded (840px+) | Can use 20px dense icons in data tables; touch target can relax to 40px for pointer devices |

## Do / Don't

| Do | Don't |
|----|-------|
| Use Material Symbols variable font from Google Fonts CDN | Use emoji characters as icon replacements |
| Match icon optical size (opsz) to display size | Use `opsz 48` at 20px display size |
| Use Outlined style by default across the UI | Mix Outlined and Rounded styles in the same interface |
| Use the FILL axis (`'FILL' 1`) for selected/active states | Use color alone to indicate selection state |
| Apply state layers on icon buttons via `::before` pseudo-element | Change the icon color on hover instead of using a state layer |
| Add `aria-hidden="true"` on decorative icons inside buttons | Leave icon-only buttons without an `aria-label` |
| Use the CDN variable font for production apps | Self-host the full font file without subsetting |
| Use `currentColor` so icons inherit theme colors | Hardcode hex color values directly on icon elements |
| Set `font-variation-settings` for all four axes together | Animate individual axes separately causing layout jank |
| Provide SVG fallbacks for offline or restricted environments | Assume the CDN font will always be available |
