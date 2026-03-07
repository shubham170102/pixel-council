---
name: radio
description: M3 radio button with single-select group behavior
metadata:
  tags: radio, radio button, single select, option, form
---

# Radio Button -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Outer circle | 20px, 2px border |
| Inner circle (selected) | 10px |
| Touch target | 48px |
| State layer | 40px circular |
| Transition | 200ms standard |
| CSS prefix | `.md-radio` |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-radio-outline: #79747E;
  --md-radio-selected: #6750A4;
  --md-radio-selected-dot: #6750A4;
  --md-radio-state-hover: rgba(29, 27, 32, 0.08);
  --md-radio-state-focus: rgba(29, 27, 32, 0.10);
  --md-radio-state-pressed: rgba(29, 27, 32, 0.10);
  --md-radio-selected-hover: rgba(103, 80, 164, 0.08);
  --md-radio-selected-focus: rgba(103, 80, 164, 0.10);
  --md-radio-disabled: rgba(29, 27, 32, 0.38);
  --md-radio-label: #1D1B20;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-radio-outline: #938F99;
    --md-radio-selected: #D0BCFF;
    --md-radio-selected-dot: #D0BCFF;
    --md-radio-state-hover: rgba(230, 224, 233, 0.08);
    --md-radio-state-focus: rgba(230, 224, 233, 0.10);
    --md-radio-state-pressed: rgba(230, 224, 233, 0.10);
    --md-radio-selected-hover: rgba(208, 188, 255, 0.08);
    --md-radio-selected-focus: rgba(208, 188, 255, 0.10);
    --md-radio-disabled: rgba(230, 224, 233, 0.38);
    --md-radio-label: #E6E0E9;
  }
}

.dark {
  --md-radio-outline: #938F99;
  --md-radio-selected: #D0BCFF;
  --md-radio-selected-dot: #D0BCFF;
  --md-radio-state-hover: rgba(230, 224, 233, 0.08);
  --md-radio-state-focus: rgba(230, 224, 233, 0.10);
  --md-radio-state-pressed: rgba(230, 224, 233, 0.10);
  --md-radio-selected-hover: rgba(208, 188, 255, 0.08);
  --md-radio-selected-focus: rgba(208, 188, 255, 0.10);
  --md-radio-disabled: rgba(230, 224, 233, 0.38);
  --md-radio-label: #E6E0E9;
}
```

## HTML Structure

```html
<!-- Radio group with fieldset -->
<fieldset class="md-radio-group" role="radiogroup" aria-labelledby="group-label">
  <legend id="group-label" class="md-radio-group__legend">Notification preference</legend>

  <label class="md-radio">
    <input type="radio" name="notify" value="all" class="md-radio__input"
           aria-label="All notifications" checked />
    <span class="md-radio__circle">
      <span class="md-radio__dot"></span>
    </span>
    <span class="md-radio__label">All notifications</span>
  </label>

  <label class="md-radio">
    <input type="radio" name="notify" value="important" class="md-radio__input"
           aria-label="Important only" />
    <span class="md-radio__circle">
      <span class="md-radio__dot"></span>
    </span>
    <span class="md-radio__label">Important only</span>
  </label>

  <label class="md-radio">
    <input type="radio" name="notify" value="none" class="md-radio__input"
           aria-label="None" />
    <span class="md-radio__circle">
      <span class="md-radio__dot"></span>
    </span>
    <span class="md-radio__label">None</span>
  </label>
</fieldset>
```

## Complete CSS

```css
.md-radio__input {
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

.md-radio-group {
  border: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.md-radio-group__legend {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-radio-label);
  margin-bottom: 8px;
}

.md-radio {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

/* Outer circle */
.md-radio__circle {
  position: relative;
  width: 20px;
  height: 20px;
  border: 2px solid var(--md-radio-outline);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: border-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

/* State layer */
.md-radio__circle::before {
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

/* Inner dot */
.md-radio__dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: var(--md-radio-selected);
  transform: scale(0);
  transition: transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

/* Selected */
.md-radio__input:checked ~ .md-radio__circle {
  border-color: var(--md-radio-selected);
}

.md-radio__input:checked ~ .md-radio__circle .md-radio__dot {
  transform: scale(1);
}

/* Hover -- unselected */
.md-radio:hover .md-radio__input:not(:checked) ~ .md-radio__circle::before {
  background: var(--md-radio-state-hover);
}

/* Hover -- selected */
.md-radio:hover .md-radio__input:checked ~ .md-radio__circle::before {
  background: var(--md-radio-selected-hover);
}

/* Focus */
.md-radio__input:focus-visible ~ .md-radio__circle::before {
  background: var(--md-radio-state-focus);
}

.md-radio__input:checked:focus-visible ~ .md-radio__circle::before {
  background: var(--md-radio-selected-focus);
}

/* Pressed */
.md-radio:active .md-radio__circle::before {
  background: var(--md-radio-state-pressed);
}

/* Disabled */
.md-radio:has(.md-radio__input:disabled) {
  cursor: not-allowed;
  opacity: 0.38;
}

.md-radio__input:disabled ~ .md-radio__circle {
  border-color: var(--md-radio-disabled);
}

.md-radio__input:disabled:checked ~ .md-radio__circle .md-radio__dot {
  background: var(--md-radio-disabled);
}

/* Label */
.md-radio__label {
  font-family: Roboto, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  letter-spacing: 0.5px;
  color: var(--md-radio-label);
}
```

## States Reference

| State | Border | Dot | Layer | Opacity | Cursor |
|-------|--------|-----|-------|---------|--------|
| Unselected | #79747E | hidden | none | 1 | pointer |
| Selected | #6750A4 | #6750A4 10px | none | 1 | pointer |
| Hover (off) | -- | -- | 8% on-surface | 1 | pointer |
| Hover (on) | -- | -- | 8% primary | 1 | pointer |
| Focus (off) | -- | -- | 10% on-surface | 1 | pointer |
| Focus (on) | -- | -- | 10% primary | 1 | pointer |
| Pressed | -- | -- | 10% on-surface | 1 | pointer |
| Disabled | 38% on-surface | 38% on-surface | none | 0.38 | not-allowed |

## Animation & Motion

```css
/* Inner dot scale animation */
.md-radio__dot {
  transition: transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

/* Border color transition */
.md-radio__circle {
  transition: border-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-radio__dot,
  .md-radio__circle,
  .md-radio__circle::before {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: Native `<input type="radio">` inside `role="radiogroup"` fieldset
- **Keyboard**: Tab to group, Arrow keys to navigate between options, Space to select
- **Focus**: 40px circular state layer with 10% opacity
- **Touch target**: 48px minimum
- **Screen reader**: Announces "option X of Y, selected/not selected"
- **Group label**: `<legend>` or `aria-labelledby` on radiogroup

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed 20px circle; vertical stacking default |
| <600px | Full-width labels, increased spacing (12px gap) |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for mutually exclusive choices | Use for multiple selections (use checkboxes) |
| Always provide a default selection | Leave radio group with no selection |
| Group with fieldset and legend | Use radio buttons outside a named group |
| Use 2-5 options in a group | Use for binary on/off (use switch) |
