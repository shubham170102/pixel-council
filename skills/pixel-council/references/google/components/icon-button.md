---
name: icon-button
description: M3 standard, filled, filled-tonal, outlined icon buttons with toggle states
metadata:
  tags: icon button, icon, action, toolbar button, like, favorite
---

# Icon Button -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Touch target | 48x48px |
| Visual container | 40x40px |
| Icon size | 24px |
| Corner radius | 9999px (full circle) |
| Variants | Standard, Filled, Tonal, Outlined |
| Font | n/a (icon only) |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  /* Standard */
  --md-icon-button-icon: #49454F;
  /* Filled */
  --md-icon-button-filled-bg: #6750A4;
  --md-icon-button-filled-icon: #FFFFFF;
  --md-icon-button-filled-selected-bg: #6750A4;
  /* Tonal */
  --md-icon-button-tonal-bg: #E8DEF8;
  --md-icon-button-tonal-icon: #1D192B;
  /* Outlined */
  --md-icon-button-outlined-border: #79747E;
  --md-icon-button-outlined-icon: #49454F;
  /* Disabled */
  --md-icon-button-disabled-bg: rgba(29, 27, 32, 0.12);
  --md-icon-button-disabled-icon: rgba(29, 27, 32, 0.38);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-icon-button-icon: #CAC4D0;
    --md-icon-button-filled-bg: #D0BCFF;
    --md-icon-button-filled-icon: #381E72;
    --md-icon-button-filled-selected-bg: #D0BCFF;
    --md-icon-button-tonal-bg: #4A4458;
    --md-icon-button-tonal-icon: #E8DEF8;
    --md-icon-button-outlined-border: #938F99;
    --md-icon-button-outlined-icon: #CAC4D0;
    --md-icon-button-disabled-bg: rgba(230, 224, 233, 0.12);
    --md-icon-button-disabled-icon: rgba(230, 224, 233, 0.38);
  }
}

.dark {
  --md-icon-button-icon: #CAC4D0;
  --md-icon-button-filled-bg: #D0BCFF;
  --md-icon-button-filled-icon: #381E72;
  --md-icon-button-filled-selected-bg: #D0BCFF;
  --md-icon-button-tonal-bg: #4A4458;
  --md-icon-button-tonal-icon: #E8DEF8;
  --md-icon-button-outlined-border: #938F99;
  --md-icon-button-outlined-icon: #CAC4D0;
  --md-icon-button-disabled-bg: rgba(230, 224, 233, 0.12);
  --md-icon-button-disabled-icon: rgba(230, 224, 233, 0.38);
}
```

## Variants

| Variant | Background | Icon Color | Border |
|---------|-----------|------------|--------|
| Standard | transparent | #49454F | none |
| Filled | #6750A4 | #FFFFFF | none |
| Tonal | #E8DEF8 | #1D192B | none |
| Outlined | transparent | #49454F | 1px #79747E |

## HTML Structure

```html
<!-- Standard -->
<button class="md-icon-button" aria-label="Favorite">
  <svg class="md-icon-button__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Filled -->
<button class="md-icon-button md-icon-button--filled" aria-label="Add">
  <svg class="md-icon-button__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Tonal -->
<button class="md-icon-button md-icon-button--tonal" aria-label="Settings">
  <svg class="md-icon-button__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Outlined -->
<button class="md-icon-button md-icon-button--outlined" aria-label="Bookmark">
  <svg class="md-icon-button__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Toggle -->
<button class="md-icon-button md-icon-button--toggle" aria-label="Favorite" aria-pressed="false">
  <svg class="md-icon-button__icon md-icon-button__icon--off" width="24" height="24" aria-hidden="true"><!-- outlined heart --></svg>
  <svg class="md-icon-button__icon md-icon-button__icon--on" width="24" height="24" aria-hidden="true"><!-- filled heart --></svg>
</button>
```

## Complete CSS

```css
.md-icon-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  padding: 8px;
  border: none;
  border-radius: 9999px;
  background: transparent;
  color: var(--md-icon-button-icon);
  cursor: pointer;
  position: relative;
  overflow: hidden;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  /* 48px touch target via ::after */
}

.md-icon-button::after {
  content: "";
  position: absolute;
  width: 48px;
  height: 48px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.md-icon-button__icon {
  width: 24px;
  height: 24px;
  pointer-events: none;
}

/* Filled */
.md-icon-button--filled {
  background: var(--md-icon-button-filled-bg);
  color: var(--md-icon-button-filled-icon);
}

/* Tonal */
.md-icon-button--tonal {
  background: var(--md-icon-button-tonal-bg);
  color: var(--md-icon-button-tonal-icon);
}

/* Outlined */
.md-icon-button--outlined {
  background: transparent;
  border: 1px solid var(--md-icon-button-outlined-border);
  color: var(--md-icon-button-outlined-icon);
}

/* Toggle */
.md-icon-button--toggle .md-icon-button__icon--on { display: none; }
.md-icon-button--toggle[aria-pressed="true"] .md-icon-button__icon--off { display: none; }
.md-icon-button--toggle[aria-pressed="true"] .md-icon-button__icon--on { display: block; }

/* Hover state layer */
.md-icon-button:hover::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 9999px;
  background: currentColor;
  opacity: 0.08;
}

/* Focus */
.md-icon-button:focus-visible {
  outline: none;
}
.md-icon-button:focus-visible::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 9999px;
  background: currentColor;
  opacity: 0.10;
}

/* Pressed */
.md-icon-button:active::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 9999px;
  background: currentColor;
  opacity: 0.10;
}

/* Disabled */
.md-icon-button:disabled,
.md-icon-button[aria-disabled="true"] {
  cursor: not-allowed;
  pointer-events: none;
  background: var(--md-icon-button-disabled-bg);
  color: var(--md-icon-button-disabled-icon);
  border-color: transparent;
}

.md-icon-button:disabled.md-icon-button--outlined {
  background: transparent;
  border-color: rgba(29, 27, 32, 0.12);
}
```

## States Reference

| State | Background | Icon | Border | Overlay | Cursor |
|-------|-----------|------|--------|---------|--------|
| Default | transparent | #49454F | -- | none | pointer |
| Hover | transparent | #49454F | -- | 0.08 | pointer |
| Focus | transparent | #49454F | -- | 0.10 | pointer |
| Pressed | transparent | #49454F | -- | 0.10 | pointer |
| Disabled | rgba(0,0,0,0.12) | opacity 0.38 | -- | none | not-allowed |

## Animation & Motion

```css
/* Ripple effect (JS-driven class) */
@keyframes md-ripple {
  from { transform: scale(0); opacity: 0.10; }
  to { transform: scale(2.5); opacity: 0; }
}

.md-icon-button__ripple {
  position: absolute;
  border-radius: 9999px;
  background: currentColor;
  animation: md-ripple 450ms cubic-bezier(0.2, 0, 0, 1) forwards;
}

@media (prefers-reduced-motion: reduce) {
  .md-icon-button__ripple { animation: none; }
  .md-icon-button::before { transition: none; }
}
```

## Accessibility

- ARIA: `aria-label` required (no visible text); `aria-pressed` for toggles
- Keyboard: Tab to focus; Enter/Space to activate
- Focus: State layer at 0.10 opacity (M3 pattern, no outline ring)
- Touch target: 48x48px (expanded via `::after` pseudo-element)
- Toggle: Distinct `aria-label` for selected/unselected states recommended

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | 40px visual, 48px touch target |
| Dense layouts | Can reduce to 32px visual with 40px touch |

## Do / Don't

| Do | Don't |
|----|-------|
| Always provide `aria-label` | Use without accessible label |
| Use toggle for binary actions (like/unlike) | Use toggle for navigation |
| Match variant emphasis to action importance | Use filled variant for low-emphasis actions |
| Keep icon at 24px | Scale icon beyond 24px in standard size |
