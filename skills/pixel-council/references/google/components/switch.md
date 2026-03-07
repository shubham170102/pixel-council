---
name: switch
description: M3 toggle switch with on/off states, icons, and handle animation
metadata:
  tags: switch, toggle, on off, boolean, setting
---

# Switch -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Track size | 52x32px |
| Handle (off) | 16px diameter |
| Handle (on) | 24px diameter |
| Handle (pressed) | 28px diameter |
| Corner radius | 9999px (track + handle) |
| Touch target | 48px |
| CSS prefix | `.md-switch` |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  /* Track */
  --md-switch-track-bg-off: #E6E0E9;
  --md-switch-track-bg-on: #6750A4;
  --md-switch-track-border: #79747E;
  /* Handle */
  --md-switch-handle-off: #79747E;
  --md-switch-handle-on: #FFFFFF;
  --md-switch-handle-hover-off: #49454F;
  /* State layers */
  --md-switch-state-hover: rgba(73, 69, 79, 0.08);
  --md-switch-state-focus: rgba(73, 69, 79, 0.10);
  --md-switch-state-pressed: rgba(73, 69, 79, 0.10);
  /* Icon */
  --md-switch-icon-off: #79747E;
  --md-switch-icon-on: #6750A4;
  /* Disabled */
  --md-switch-disabled-track-off: rgba(29, 27, 32, 0.12);
  --md-switch-disabled-track-on: rgba(29, 27, 32, 0.12);
  --md-switch-disabled-handle-off: rgba(29, 27, 32, 0.38);
  --md-switch-disabled-handle-on: #FEF7FF;
  --md-switch-disabled-border: rgba(29, 27, 32, 0.12);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-switch-track-bg-off: #36343B;
    --md-switch-track-bg-on: #D0BCFF;
    --md-switch-track-border: #938F99;
    --md-switch-handle-off: #938F99;
    --md-switch-handle-on: #381E72;
    --md-switch-handle-hover-off: #CAC4D0;
    --md-switch-state-hover: rgba(202, 196, 208, 0.08);
    --md-switch-state-focus: rgba(202, 196, 208, 0.10);
    --md-switch-state-pressed: rgba(202, 196, 208, 0.10);
    --md-switch-icon-off: #938F99;
    --md-switch-icon-on: #D0BCFF;
    --md-switch-disabled-track-off: rgba(230, 224, 233, 0.12);
    --md-switch-disabled-track-on: rgba(230, 224, 233, 0.12);
    --md-switch-disabled-handle-off: rgba(230, 224, 233, 0.38);
    --md-switch-disabled-handle-on: #141218;
    --md-switch-disabled-border: rgba(230, 224, 233, 0.12);
  }
}

.dark {
  --md-switch-track-bg-off: #36343B;
  --md-switch-track-bg-on: #D0BCFF;
  --md-switch-track-border: #938F99;
  --md-switch-handle-off: #938F99;
  --md-switch-handle-on: #381E72;
  --md-switch-handle-hover-off: #CAC4D0;
  --md-switch-state-hover: rgba(202, 196, 208, 0.08);
  --md-switch-state-focus: rgba(202, 196, 208, 0.10);
  --md-switch-state-pressed: rgba(202, 196, 208, 0.10);
  --md-switch-icon-off: #938F99;
  --md-switch-icon-on: #D0BCFF;
  --md-switch-disabled-track-off: rgba(230, 224, 233, 0.12);
  --md-switch-disabled-track-on: rgba(230, 224, 233, 0.12);
  --md-switch-disabled-handle-off: rgba(230, 224, 233, 0.38);
  --md-switch-disabled-handle-on: #141218;
  --md-switch-disabled-border: rgba(230, 224, 233, 0.12);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Default | Track + handle, no icon |
| With icons | Checkmark (on) / X (off) inside handle |
| Selected-icon only | Icon visible only when on |

## HTML Structure

```html
<!-- Switch with hidden input -->
<label class="md-switch">
  <input type="checkbox" role="switch" aria-checked="false" class="md-switch__input" />
  <span class="md-switch__track">
    <span class="md-switch__handle">
      <span class="md-switch__icon" aria-hidden="true"></span>
    </span>
  </span>
  <span class="md-switch__label">Wi-Fi</span>
</label>

<!-- Switch with icons -->
<label class="md-switch md-switch--icons">
  <input type="checkbox" role="switch" aria-checked="true" checked class="md-switch__input" />
  <span class="md-switch__track">
    <span class="md-switch__handle">
      <span class="md-switch__icon" aria-hidden="true"></span>
    </span>
  </span>
</label>
```

## Complete CSS

```css
/* Visually hidden input */
.md-switch__input {
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

/* Track */
.md-switch {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

.md-switch__track {
  position: relative;
  width: 52px;
  height: 32px;
  border-radius: 9999px;
  background: var(--md-switch-track-bg-off);
  border: 2px solid var(--md-switch-track-border);
  transition: background-color 300ms cubic-bezier(0.2, 0, 0, 1),
              border-color 300ms cubic-bezier(0.2, 0, 0, 1);
}

/* Handle */
.md-switch__handle {
  position: absolute;
  top: 50%;
  left: 6px;
  width: 16px;
  height: 16px;
  border-radius: 9999px;
  background: var(--md-switch-handle-off);
  transform: translateY(-50%);
  transition: left 300ms cubic-bezier(0.2, 0, 0, 1),
              width 300ms cubic-bezier(0.2, 0, 0, 1),
              height 300ms cubic-bezier(0.2, 0, 0, 1),
              background-color 300ms cubic-bezier(0.2, 0, 0, 1);
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Icon inside handle */
.md-switch__icon {
  font-size: 12px;
  opacity: 0;
  transition: opacity 200ms;
}

.md-switch--icons .md-switch__icon { opacity: 1; }

/* Selected state */
.md-switch__input:checked ~ .md-switch__track {
  background: var(--md-switch-track-bg-on);
  border-color: var(--md-switch-track-bg-on);
}

.md-switch__input:checked ~ .md-switch__track .md-switch__handle {
  left: calc(100% - 6px - 24px);
  width: 24px;
  height: 24px;
  background: var(--md-switch-handle-on);
}

/* Hover -- unselected */
.md-switch:hover .md-switch__input:not(:checked) ~ .md-switch__track .md-switch__handle {
  box-shadow: 0 0 0 8px var(--md-switch-state-hover);
}

/* Hover -- selected */
.md-switch:hover .md-switch__input:checked ~ .md-switch__track .md-switch__handle {
  box-shadow: 0 0 0 8px rgba(103, 80, 164, 0.08);
}

/* Focus */
.md-switch__input:focus-visible ~ .md-switch__track .md-switch__handle {
  box-shadow: 0 0 0 8px var(--md-switch-state-focus);
}

.md-switch__input:checked:focus-visible ~ .md-switch__track .md-switch__handle {
  box-shadow: 0 0 0 8px rgba(103, 80, 164, 0.10);
}

/* Pressed -- handle grows to 28px */
.md-switch:active .md-switch__handle {
  width: 28px !important;
  height: 28px !important;
}

.md-switch:active .md-switch__input:not(:checked) ~ .md-switch__track .md-switch__handle {
  box-shadow: 0 0 0 8px var(--md-switch-state-pressed);
}

/* Disabled */
.md-switch__input:disabled ~ .md-switch__track {
  background: var(--md-switch-disabled-track-off);
  border-color: var(--md-switch-disabled-border);
  cursor: not-allowed;
}

.md-switch__input:disabled:checked ~ .md-switch__track {
  background: var(--md-switch-disabled-track-on);
  border-color: transparent;
}

.md-switch__input:disabled ~ .md-switch__track .md-switch__handle {
  background: var(--md-switch-disabled-handle-off);
}

.md-switch__input:disabled:checked ~ .md-switch__track .md-switch__handle {
  background: var(--md-switch-disabled-handle-on);
}

.md-switch:has(.md-switch__input:disabled) {
  cursor: not-allowed;
  opacity: 0.38;
}

/* Label */
.md-switch__label {
  font-family: Roboto, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  letter-spacing: 0.5px;
  color: #1D1B20;
}

@media (prefers-color-scheme: dark) {
  .md-switch__label { color: #E6E0E9; }
}
.dark .md-switch__label { color: #E6E0E9; }
```

## States Reference

| State | Handle | Track | Border | Cursor |
|-------|--------|-------|--------|--------|
| Off | #79747E 16px | #E6E0E9 | #79747E 2px | pointer |
| On | #FFFFFF 24px | #6750A4 | transparent | pointer |
| Hover (off) | +8% state layer | -- | -- | pointer |
| Hover (on) | +8% primary layer | -- | -- | pointer |
| Focus (off) | +10% state layer | -- | -- | pointer |
| Focus (on) | +10% primary layer | -- | -- | pointer |
| Pressed | 28px handle | -- | -- | pointer |
| Disabled (off) | 38% on-surface | 12% on-surface | 12% on-surface | not-allowed |
| Disabled (on) | surface | 12% on-surface | transparent | not-allowed |

## Animation & Motion

```css
/* All transitions use M3 standard easing */
transition: all 300ms cubic-bezier(0.2, 0, 0, 1);

/* Handle position: left offset + size change */
/* Track: background-color + border-color */

@media (prefers-reduced-motion: reduce) {
  .md-switch__track,
  .md-switch__handle {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="switch"`, `aria-checked="true|false"` on hidden input
- **Keyboard**: Tab to focus, Space to toggle
- **Focus**: Visible ring via state layer (8px spread)
- **Touch target**: 48px minimum (track itself is 52x32)
- **Screen reader**: Announces label + on/off state
- **Label**: Must have associated `<label>` or `aria-label`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed 52x32px track; label wraps if needed |
| Touch devices | 48px minimum touch target met by default |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for binary on/off settings | Use for multiple choices (use radio) |
| Place in settings lists or forms | Use as action buttons |
| Provide visible label text | Rely on switch alone without label |
| Show immediate effect (no save button needed) | Use for changes that need confirmation |
