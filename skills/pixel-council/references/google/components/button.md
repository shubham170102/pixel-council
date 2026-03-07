---
name: button
description: M3 filled, outlined, text, elevated, tonal button variants with complete states
metadata:
  tags: button, cta, action, form, submit, click
---

# Button -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 40px |
| Min width | 48px |
| Padding (text only) | 0 24px |
| Padding (with icon) | 0 24px 0 16px |
| Icon size | 18px |
| Icon-label gap | 8px |
| Corner radius | 9999px (full) |
| Font | Roboto, 14px/20px, weight 500, spacing 0.1px |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-button-primary: #6750A4;
  --md-button-on-primary: #FFFFFF;
  --md-button-secondary-container: #E8DEF8;
  --md-button-on-secondary-container: #1D192B;
  --md-button-surface: #FEF7FF;
  --md-button-on-surface: #1D1B20;
  --md-button-on-surface-variant: #49454F;
  --md-button-outline: #79747E;
  --md-button-error: #B3261E;
  --md-button-shadow-1: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
  --md-button-radius: 9999px;
  --md-button-transition: all 200ms cubic-bezier(0.2, 0.0, 0, 1.0);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-button-primary: #D0BCFF;
    --md-button-on-primary: #381E72;
    --md-button-secondary-container: #4A4458;
    --md-button-on-secondary-container: #E8DEF8;
    --md-button-surface: #141218;
    --md-button-on-surface: #E6E0E9;
    --md-button-on-surface-variant: #CAC4D0;
    --md-button-outline: #938F99;
    --md-button-error: #F2B8B5;
  }
}
.dark {
  --md-button-primary: #D0BCFF;
  --md-button-on-primary: #381E72;
  --md-button-secondary-container: #4A4458;
  --md-button-on-secondary-container: #E8DEF8;
  --md-button-surface: #141218;
  --md-button-on-surface: #E6E0E9;
  --md-button-on-surface-variant: #CAC4D0;
  --md-button-outline: #938F99;
  --md-button-error: #F2B8B5;
}
```

## Variants

| Variant | Background (Light) | Text (Light) | Background (Dark) | Text (Dark) | Border |
|---------|-------------------|--------------|-------------------|-------------|--------|
| Filled | #6750A4 | #FFFFFF | #D0BCFF | #381E72 | none |
| Tonal | #E8DEF8 | #1D192B | #4A4458 | #E8DEF8 | none |
| Elevated | #FEF7FF | #6750A4 | #141218 | #D0BCFF | none (shadow) |
| Outlined | transparent | #6750A4 | transparent | #D0BCFF | 1px #79747E / #938F99 |
| Text | transparent | #6750A4 | transparent | #D0BCFF | none |

## HTML Structure

```html
<!-- Filled -->
<button class="md-button md-button--filled" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Filled with icon -->
<button class="md-button md-button--filled md-button--icon" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__icon" aria-hidden="true"><!-- svg --></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Tonal -->
<button class="md-button md-button--tonal" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Elevated -->
<button class="md-button md-button--elevated" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Outlined -->
<button class="md-button md-button--outlined" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Text -->
<button class="md-button md-button--text" type="button">
  <span class="md-button__ripple"></span>
  <span class="md-button__label">Label</span>
</button>

<!-- Disabled -->
<button class="md-button md-button--filled" type="button" disabled aria-disabled="true">
  <span class="md-button__label">Label</span>
</button>

<!-- Loading -->
<button class="md-button md-button--filled" type="button" data-loading aria-busy="true">
  <span class="md-button__spinner" role="progressbar" aria-label="Loading"></span>
  <span class="md-button__label">Label</span>
</button>
```

## Complete CSS

```css
.md-button {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  height: 40px;
  min-width: 48px;
  padding: 0 24px;
  border: none;
  border-radius: var(--md-button-radius);
  font-family: Roboto, 'Noto Sans', sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  text-decoration: none;
  cursor: pointer;
  overflow: hidden;
  transition: var(--md-button-transition);
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}
.md-button--icon { padding: 0 24px 0 16px; }
.md-button__icon { font-size: 18px; width: 18px; height: 18px; }
.md-button__ripple {
  position: absolute; inset: 0; border-radius: inherit;
  pointer-events: none; overflow: hidden;
}

/* -- Filled -- */
.md-button--filled {
  background: var(--md-button-primary);
  color: var(--md-button-on-primary);
}
.md-button--filled:hover { box-shadow: var(--md-button-shadow-1); }
.md-button--filled:hover::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-primary); opacity: 0.08;
}
.md-button--filled:focus-visible::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-primary); opacity: 0.10;
}
.md-button--filled:active::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-primary); opacity: 0.10;
}

/* -- Tonal -- */
.md-button--tonal {
  background: var(--md-button-secondary-container);
  color: var(--md-button-on-secondary-container);
}
.md-button--tonal:hover::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-secondary-container); opacity: 0.08;
}
.md-button--tonal:focus-visible::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-secondary-container); opacity: 0.10;
}
.md-button--tonal:active::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-on-secondary-container); opacity: 0.10;
}

/* -- Elevated -- */
.md-button--elevated {
  background: var(--md-button-surface);
  color: var(--md-button-primary);
  box-shadow: var(--md-button-shadow-1);
}
.md-button--elevated:hover {
  box-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
}
.md-button--elevated:hover::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.08;
}
.md-button--elevated:focus-visible::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}
.md-button--elevated:active::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}

/* -- Outlined -- */
.md-button--outlined {
  background: transparent;
  color: var(--md-button-primary);
  border: 1px solid var(--md-button-outline);
}
.md-button--outlined:hover::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.08;
}
.md-button--outlined:focus-visible {
  border-color: var(--md-button-primary);
}
.md-button--outlined:focus-visible::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}
.md-button--outlined:active::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}

/* -- Text -- */
.md-button--text {
  background: transparent;
  color: var(--md-button-primary);
  padding: 0 12px;
}
.md-button--text:hover::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.08;
}
.md-button--text:focus-visible::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}
.md-button--text:active::after {
  content: ''; position: absolute; inset: 0;
  background: var(--md-button-primary); opacity: 0.10;
}

/* -- Focus ring (all variants) -- */
.md-button:focus-visible {
  outline: 2px solid var(--md-button-primary);
  outline-offset: 2px;
}

/* -- Disabled -- */
.md-button:disabled,
.md-button[aria-disabled="true"] {
  background: rgba(29, 27, 32, 0.12);
  color: rgba(29, 27, 32, 0.38);
  box-shadow: none;
  border-color: rgba(29, 27, 32, 0.12);
  cursor: not-allowed;
  pointer-events: none;
}
.md-button--text:disabled,
.md-button--outlined:disabled {
  background: transparent;
}

/* -- Loading -- */
.md-button[data-loading] { pointer-events: none; cursor: wait; }
.md-button__spinner {
  width: 18px; height: 18px;
  border: 2px solid currentColor;
  border-right-color: transparent;
  border-radius: 50%;
  animation: md-spin 600ms linear infinite;
}
.md-button[data-loading] .md-button__label { opacity: 0; }

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .md-button:disabled,
  .md-button[aria-disabled="true"] {
    background: rgba(230, 224, 233, 0.12);
    color: rgba(230, 224, 233, 0.38);
    border-color: rgba(230, 224, 233, 0.12);
  }
  .md-button--text:disabled,
  .md-button--outlined:disabled { background: transparent; }
}
.dark .md-button:disabled { background: rgba(230, 224, 233, 0.12); color: rgba(230, 224, 233, 0.38); }
```

## States Reference

| State | Overlay | Shadow (Filled) | Border (Outlined) | Cursor |
|-------|---------|------------------|--------------------|--------|
| Default | 0% | none | #79747E | pointer |
| Hover | 8% content color | level 1 | #79747E | pointer |
| Focus | 10% content color | none | #6750A4 | pointer |
| Active | 10% content color | none | #79747E | pointer |
| Disabled | -- | none | 12% #1D1B20 | not-allowed |
| Loading | -- | unchanged | unchanged | wait |

## Animation & Motion

```css
@keyframes md-spin {
  to { transform: rotate(360deg); }
}
@keyframes md-ripple {
  from { transform: scale(0); opacity: 0.12; }
  to { transform: scale(2.5); opacity: 0; }
}
.md-button__ripple::after {
  content: ''; position: absolute;
  width: 100%; padding-top: 100%;
  border-radius: 50%;
  background: currentColor;
  transform: scale(0); opacity: 0;
}
.md-button:active .md-button__ripple::after {
  animation: md-ripple 300ms cubic-bezier(0.2, 0, 0, 1) forwards;
}
@media (prefers-reduced-motion: reduce) {
  .md-button, .md-button__ripple::after, .md-button__spinner { animation: none; transition: none; }
}
```

## Accessibility

- **ARIA**: `role="button"` implicit on `<button>`, use `aria-disabled="true"` with `aria-busy="true"` for loading
- **Keyboard**: Tab to focus, Enter/Space to activate
- **Focus ring**: 2px solid primary, 2px offset, follows pill shape
- **Touch target**: min 48x48px (meets WCAG 2.5.8)
- **Screen reader**: loading state announced via `aria-busy`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width option via `.md-button--full-width { width: 100% }` |
| 600-1024px | Auto width, stack vertically in button groups |
| > 1024px | Auto width, inline groups |

## Do / Don't

| Do | Don't |
|----|-------|
| Use Filled for the single most important CTA | Use multiple Filled buttons in one view |
| Use Tonal for secondary emphasis | Mix more than 2-3 variant levels in one area |
| Pair Filled with Text for action groups | Make all buttons the same emphasis |
| Use action-verb labels ("Save", "Delete") | Use vague labels ("OK", "Click here") |
| Keep labels to 1-3 words | Wrap button text to multiple lines |
