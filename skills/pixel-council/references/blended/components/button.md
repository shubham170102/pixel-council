---
name: button
description: Blended button combining M3 token architecture with Apple refinement — filled, outlined, text, icon variants
metadata:
  tags: button, cta, action, form, submit, click
---

# Button -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 40-44px |
| Min touch target | 44x44px |
| Padding | 0 20-24px |
| Corner radius | 8-12px (rect) or 9999px (pill) |
| Font | System font, 14-15px/20px, weight 500-600, spacing 0.1px |
| Primary color (light) | #6750A4 (customize per brand) |
| Primary color (dark) | #D0BCFF (customize per brand) |

## Design Tokens

```css
:root {
  --button-primary: #6750A4;
  --button-on-primary: #FFFFFF;
  --button-secondary: #E8DEF8;
  --button-on-secondary: #1D192B;
  --button-surface: #FEF7FF;
  --button-on-surface: #1D1B20;
  --button-outline: #79747E;
  --button-error: #B3261E;
  --button-on-error: #FFFFFF;
  --button-radius: 10px;
  --button-radius-pill: 9999px;
  --button-transition: all 150ms ease-out;
  --button-focus-ring: 2px solid #6750A4;
  --button-font: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto,
    'Helvetica Neue', Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --button-primary: #D0BCFF;
    --button-on-primary: #381E72;
    --button-secondary: #4A4458;
    --button-on-secondary: #E8DEF8;
    --button-surface: #141218;
    --button-on-surface: #E6E0E9;
    --button-outline: #938F99;
    --button-error: #F2B8B5;
    --button-on-error: #601410;
    --button-focus-ring: 2px solid #D0BCFF;
  }
}
.dark {
  --button-primary: #D0BCFF;
  --button-on-primary: #381E72;
  --button-secondary: #4A4458;
  --button-on-secondary: #E8DEF8;
  --button-surface: #141218;
  --button-on-surface: #E6E0E9;
  --button-outline: #938F99;
  --button-error: #F2B8B5;
  --button-on-error: #601410;
  --button-focus-ring: 2px solid #D0BCFF;
}
```

## Variants

| Level | Background (L) | Text (L) | Background (D) | Text (D) | Border |
|-------|----------------|----------|----------------|----------|--------|
| Primary | #6750A4 | #FFFFFF | #D0BCFF | #381E72 | none |
| Secondary | #E8DEF8 | #1D192B | #4A4458 | #E8DEF8 | none |
| Outline | transparent | #6750A4 | transparent | #D0BCFF | 1px #79747E / #938F99 |
| Ghost | transparent | #6750A4 | transparent | #D0BCFF | none |
| Destructive | #B3261E | #FFFFFF | #F2B8B5 | #601410 | none |

## HTML Structure

```html
<!-- Primary -->
<button class="button button--primary" type="button">
  <span class="button__label">Label</span>
</button>

<!-- Primary with icon -->
<button class="button button--primary button--has-icon" type="button">
  <span class="button__icon" aria-hidden="true"><!-- svg --></span>
  <span class="button__label">Label</span>
</button>

<!-- Secondary -->
<button class="button button--secondary" type="button">
  <span class="button__label">Label</span>
</button>

<!-- Outline -->
<button class="button button--outline" type="button">
  <span class="button__label">Label</span>
</button>

<!-- Ghost -->
<button class="button button--ghost" type="button">
  <span class="button__label">Label</span>
</button>

<!-- Destructive -->
<button class="button button--destructive" type="button">
  <span class="button__label">Delete</span>
</button>

<!-- Disabled -->
<button class="button button--primary" type="button" disabled aria-disabled="true">
  <span class="button__label">Label</span>
</button>

<!-- Loading -->
<button class="button button--primary" type="button" data-loading aria-busy="true">
  <span class="button__spinner" role="progressbar" aria-label="Loading"></span>
  <span class="button__label">Label</span>
</button>
```

## Complete CSS

```css
.button {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 42px;
  min-width: 44px;
  padding: 0 22px;
  border: none;
  border-radius: var(--button-radius);
  font-family: var(--button-font);
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  text-decoration: none;
  cursor: pointer;
  transition: var(--button-transition);
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}
.button--has-icon { padding: 0 22px 0 16px; }
.button--pill { border-radius: var(--button-radius-pill); }
.button__icon { width: 18px; height: 18px; flex-shrink: 0; }

/* -- Primary -- */
.button--primary {
  background: var(--button-primary);
  color: var(--button-on-primary);
}
.button--primary:hover { filter: brightness(1.08); box-shadow: 0 1px 3px rgba(0,0,0,0.12); }
.button--primary:active { filter: brightness(0.92); transform: scale(0.98); }

/* -- Secondary -- */
.button--secondary {
  background: var(--button-secondary);
  color: var(--button-on-secondary);
}
.button--secondary:hover { filter: brightness(0.96); }
.button--secondary:active { filter: brightness(0.92); transform: scale(0.98); }

/* -- Outline -- */
.button--outline {
  background: transparent;
  color: var(--button-primary);
  border: 1px solid var(--button-outline);
}
.button--outline:hover { background: rgba(103,80,164,0.08); }
.button--outline:active { background: rgba(103,80,164,0.12); transform: scale(0.98); }

/* -- Ghost -- */
.button--ghost {
  background: transparent;
  color: var(--button-primary);
  padding: 0 12px;
}
.button--ghost:hover { background: rgba(103,80,164,0.08); }
.button--ghost:active { background: rgba(103,80,164,0.12); transform: scale(0.98); }

/* -- Destructive -- */
.button--destructive {
  background: var(--button-error);
  color: var(--button-on-error);
}
.button--destructive:hover { filter: brightness(1.08); }
.button--destructive:active { filter: brightness(0.92); transform: scale(0.98); }

/* -- Focus (all) -- */
.button:focus-visible {
  outline: var(--button-focus-ring);
  outline-offset: 2px;
}

/* -- Disabled -- */
.button:disabled,
.button[aria-disabled="true"] {
  opacity: 0.4;
  cursor: not-allowed;
  pointer-events: none;
  filter: none;
  box-shadow: none;
  transform: none;
}

/* -- Loading -- */
.button[data-loading] { pointer-events: none; cursor: wait; }
.button__spinner {
  width: 16px; height: 16px;
  border: 2px solid currentColor;
  border-right-color: transparent;
  border-radius: 50%;
  animation: button-spin 650ms linear infinite;
}
.button[data-loading] .button__label { visibility: hidden; }

/* -- Dark mode (hover adjustments) -- */
@media (prefers-color-scheme: dark) {
  .button--outline:hover { background: rgba(208,188,255,0.08); }
  .button--ghost:hover { background: rgba(208,188,255,0.08); }
}
.dark .button--outline:hover { background: rgba(208,188,255,0.08); }
.dark .button--ghost:hover { background: rgba(208,188,255,0.08); }
```

## States Reference

| State | Primary | Outline | Ghost | Destructive | Cursor |
|-------|---------|---------|-------|-------------|--------|
| Default | solid bg | transparent+border | transparent | solid red | pointer |
| Hover | brightness +8% | 8% tint fill | 8% tint fill | brightness +8% | pointer |
| Focus | 2px ring, 2px offset | 2px ring | 2px ring | 2px ring | pointer |
| Active | brightness -8%, scale 0.98 | 12% tint fill | 12% tint fill | brightness -8% | pointer |
| Disabled | opacity 0.4 | opacity 0.4 | opacity 0.4 | opacity 0.4 | not-allowed |
| Loading | spinner replaces label | spinner | spinner | spinner | wait |

## Animation & Motion

```css
@keyframes button-spin {
  to { transform: rotate(360deg); }
}
@media (prefers-reduced-motion: reduce) {
  .button { transition: none; }
  .button__spinner { animation: none; }
  .button:active { transform: none; }
}
```

## Accessibility

- **ARIA**: implicit `role="button"`, `aria-disabled="true"` for disabled, `aria-busy="true"` for loading
- **Keyboard**: Tab to focus, Enter/Space to activate
- **Focus ring**: 2px solid primary color, 2px offset
- **Touch target**: minimum 44x44px (meets both Apple HIG and WCAG 2.5.8)
- **Screen reader**: loading announced via `aria-busy`, destructive context via label text

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width via `.button--block { width: 100% }`, min-height 44px |
| 600-1024px | Auto width, vertical stacking recommended for action groups |
| > 1024px | Auto width, inline groups, 40px height acceptable |

## Do / Don't

| Do | Don't |
|----|-------|
| One Primary per screen section | Multiple Primary buttons competing |
| Use title-case action verbs ("Save Changes") | Vague labels ("OK", "Submit") |
| Use Destructive style for delete/remove actions | Make Destructive the default/primary action |
| 150ms ease-out transitions for snappy feel | Transitions over 300ms (feels sluggish) |
| Consistent corner radius across all buttons | Mix pill and rectangular in the same group |
