---
name: checkbox
description: M3 checkbox with checked, unchecked, indeterminate states and checkmark animation
metadata:
  tags: checkbox, check, select, multi-select, form, boolean
---

# Checkbox -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Container size | 18x18px |
| Touch target | 48px |
| Border radius | 2px |
| Border width | 2px (unchecked) |
| State layer | 40px circular |
| CSS prefix | `.md-checkbox` |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-checkbox-outline: #79747E;
  --md-checkbox-fill: #6750A4;
  --md-checkbox-checkmark: #FFFFFF;
  --md-checkbox-error: #B3261E;
  --md-checkbox-error-hover: #B3261E;
  --md-checkbox-on-error: #FFFFFF;
  --md-checkbox-state-hover: rgba(29, 27, 32, 0.08);
  --md-checkbox-state-focus: rgba(29, 27, 32, 0.10);
  --md-checkbox-state-pressed: rgba(29, 27, 32, 0.10);
  --md-checkbox-selected-hover: rgba(103, 80, 164, 0.08);
  --md-checkbox-selected-focus: rgba(103, 80, 164, 0.10);
  --md-checkbox-disabled-outline: rgba(29, 27, 32, 0.38);
  --md-checkbox-disabled-fill: rgba(29, 27, 32, 0.38);
  --md-checkbox-label: #1D1B20;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-checkbox-outline: #938F99;
    --md-checkbox-fill: #D0BCFF;
    --md-checkbox-checkmark: #381E72;
    --md-checkbox-error: #F2B8B5;
    --md-checkbox-on-error: #601410;
    --md-checkbox-state-hover: rgba(230, 224, 233, 0.08);
    --md-checkbox-state-focus: rgba(230, 224, 233, 0.10);
    --md-checkbox-state-pressed: rgba(230, 224, 233, 0.10);
    --md-checkbox-selected-hover: rgba(208, 188, 255, 0.08);
    --md-checkbox-selected-focus: rgba(208, 188, 255, 0.10);
    --md-checkbox-disabled-outline: rgba(230, 224, 233, 0.38);
    --md-checkbox-disabled-fill: rgba(230, 224, 233, 0.38);
    --md-checkbox-label: #E6E0E9;
  }
}

.dark {
  --md-checkbox-outline: #938F99;
  --md-checkbox-fill: #D0BCFF;
  --md-checkbox-checkmark: #381E72;
  --md-checkbox-error: #F2B8B5;
  --md-checkbox-on-error: #601410;
  --md-checkbox-state-hover: rgba(230, 224, 233, 0.08);
  --md-checkbox-state-focus: rgba(230, 224, 233, 0.10);
  --md-checkbox-state-pressed: rgba(230, 224, 233, 0.10);
  --md-checkbox-selected-hover: rgba(208, 188, 255, 0.08);
  --md-checkbox-selected-focus: rgba(208, 188, 255, 0.10);
  --md-checkbox-disabled-outline: rgba(230, 224, 233, 0.38);
  --md-checkbox-disabled-fill: rgba(230, 224, 233, 0.38);
  --md-checkbox-label: #E6E0E9;
}
```

## Variants

| Variant | Visual |
|---------|--------|
| Unchecked | 2px outline border, empty |
| Checked | Primary fill, white checkmark |
| Indeterminate | Primary fill, white horizontal dash |
| Error | Error-colored border/fill |

## HTML Structure

```html
<!-- Single checkbox -->
<label class="md-checkbox">
  <input type="checkbox" class="md-checkbox__input" aria-label="Accept terms" />
  <span class="md-checkbox__box">
    <svg class="md-checkbox__checkmark" viewBox="0 0 18 18" aria-hidden="true">
      <path d="M3.5 9.5L7 13L14.5 5.5" fill="none" stroke="currentColor"
            stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
    </svg>
  </span>
  <span class="md-checkbox__label">Accept terms</span>
</label>

<!-- Indeterminate -->
<label class="md-checkbox">
  <input type="checkbox" class="md-checkbox__input" aria-label="Select all"
         aria-checked="mixed" />
  <span class="md-checkbox__box">
    <svg class="md-checkbox__dash" viewBox="0 0 18 18" aria-hidden="true">
      <line x1="4" y1="9" x2="14" y2="9" stroke="currentColor"
            stroke-width="2" stroke-linecap="round" />
    </svg>
  </span>
  <span class="md-checkbox__label">Select all</span>
</label>

<!-- Error state -->
<label class="md-checkbox md-checkbox--error">
  <input type="checkbox" class="md-checkbox__input" aria-invalid="true"
         aria-label="Required field" required />
  <span class="md-checkbox__box"></span>
  <span class="md-checkbox__label">Required field</span>
</label>
```

## Complete CSS

```css
.md-checkbox__input {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

.md-checkbox {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  position: relative;
}

.md-checkbox__box {
  position: relative;
  width: 18px;
  height: 18px;
  border: 2px solid var(--md-checkbox-outline);
  border-radius: 2px;
  background: transparent;
  transition: background-color 200ms cubic-bezier(0.2, 0, 0, 1),
              border-color 200ms cubic-bezier(0.2, 0, 0, 1);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

/* State layer (40px circular) */
.md-checkbox__box::before {
  content: "";
  position: absolute;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: transparent;
  transition: background-color 150ms;
}

/* Checkmark / dash icons */
.md-checkbox__checkmark,
.md-checkbox__dash {
  width: 14px;
  height: 14px;
  color: var(--md-checkbox-checkmark);
  opacity: 0;
  transform: scale(0.5);
  transition: opacity 150ms, transform 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

/* Checkmark animation via stroke-dasharray */
.md-checkbox__checkmark path {
  stroke-dasharray: 24;
  stroke-dashoffset: 24;
  transition: stroke-dashoffset 250ms cubic-bezier(0.05, 0.7, 0.1, 1) 50ms;
}

/* Checked state */
.md-checkbox__input:checked ~ .md-checkbox__box {
  background: var(--md-checkbox-fill);
  border-color: var(--md-checkbox-fill);
}

.md-checkbox__input:checked ~ .md-checkbox__box .md-checkbox__checkmark {
  opacity: 1;
  transform: scale(1);
}

.md-checkbox__input:checked ~ .md-checkbox__box .md-checkbox__checkmark path {
  stroke-dashoffset: 0;
}

/* Indeterminate */
.md-checkbox__input[aria-checked="mixed"] ~ .md-checkbox__box {
  background: var(--md-checkbox-fill);
  border-color: var(--md-checkbox-fill);
}

.md-checkbox__input[aria-checked="mixed"] ~ .md-checkbox__box .md-checkbox__dash {
  opacity: 1;
  transform: scale(1);
}

/* Hover -- unchecked */
.md-checkbox:hover .md-checkbox__input:not(:checked) ~ .md-checkbox__box::before {
  background: var(--md-checkbox-state-hover);
}

/* Hover -- checked */
.md-checkbox:hover .md-checkbox__input:checked ~ .md-checkbox__box::before {
  background: var(--md-checkbox-selected-hover);
}

/* Focus */
.md-checkbox__input:focus-visible ~ .md-checkbox__box::before {
  background: var(--md-checkbox-state-focus);
}

.md-checkbox__input:checked:focus-visible ~ .md-checkbox__box::before {
  background: var(--md-checkbox-selected-focus);
}

/* Pressed */
.md-checkbox:active .md-checkbox__box::before {
  background: var(--md-checkbox-state-pressed);
}

/* Disabled */
.md-checkbox:has(.md-checkbox__input:disabled) {
  cursor: not-allowed;
  opacity: 0.38;
}

.md-checkbox__input:disabled ~ .md-checkbox__box {
  border-color: var(--md-checkbox-disabled-outline);
}

.md-checkbox__input:disabled:checked ~ .md-checkbox__box {
  background: var(--md-checkbox-disabled-fill);
  border-color: var(--md-checkbox-disabled-fill);
}

/* Error state */
.md-checkbox--error .md-checkbox__box {
  border-color: var(--md-checkbox-error);
}

.md-checkbox--error .md-checkbox__input:checked ~ .md-checkbox__box {
  background: var(--md-checkbox-error);
  border-color: var(--md-checkbox-error);
}

.md-checkbox--error .md-checkbox__input:checked ~ .md-checkbox__box .md-checkbox__checkmark {
  color: var(--md-checkbox-on-error);
}

/* Label */
.md-checkbox__label {
  font-family: Roboto, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  letter-spacing: 0.5px;
  color: var(--md-checkbox-label);
}
```

## States Reference

| State | Border | Fill | Icon | Opacity | Cursor |
|-------|--------|------|------|---------|--------|
| Unchecked | #79747E | transparent | hidden | 1 | pointer |
| Checked | #6750A4 | #6750A4 | #FFFFFF check | 1 | pointer |
| Indeterminate | #6750A4 | #6750A4 | #FFFFFF dash | 1 | pointer |
| Hover (off) | -- | +8% state layer | -- | 1 | pointer |
| Hover (on) | -- | +8% primary layer | -- | 1 | pointer |
| Focus | -- | +10% state layer | -- | 1 | pointer |
| Pressed | -- | +10% state layer | -- | 1 | pointer |
| Disabled | 38% on-surface | 38% fill | same | 0.38 | not-allowed |
| Error | #B3261E | #B3261E | #FFFFFF | 1 | pointer |

## Animation & Motion

```css
/* Checkmark stroke animation */
@keyframes md-checkbox-check {
  from { stroke-dashoffset: 24; }
  to { stroke-dashoffset: 0; }
}

/* Container fill */
transition: background-color 200ms cubic-bezier(0.2, 0, 0, 1);

/* State layer */
transition: background-color 150ms;

@media (prefers-reduced-motion: reduce) {
  .md-checkbox__box,
  .md-checkbox__checkmark,
  .md-checkbox__checkmark path,
  .md-checkbox__dash {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: Native `<input type="checkbox">`, `aria-checked="mixed"` for indeterminate
- **Keyboard**: Tab to focus, Space to toggle
- **Focus**: 40px circular state layer with 10% opacity
- **Touch target**: 48px minimum (via padding or wrapper)
- **Screen reader**: Announces checked/unchecked/mixed state
- **Error**: Use `aria-invalid="true"` with `aria-describedby` for error text

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed 18px box; label wraps |
| Touch devices | 48px touch target enforced |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for multiple independent selections | Use for mutually exclusive options (use radio) |
| Group related checkboxes with fieldset/legend | Leave checkbox groups without a group label |
| Use indeterminate for parent "select all" | Use indeterminate as a third value state |
| Show error state with descriptive text | Rely only on color to indicate error |
