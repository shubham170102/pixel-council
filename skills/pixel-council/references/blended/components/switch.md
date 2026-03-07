---
name: switch
description: Blended toggle switch with M3 tokens and Apple handle animation
metadata:
  tags: switch, toggle, on off, boolean, setting
---

# Switch -- Blended Design System

## Quick Reference

| Property | Value |
|----------|-------|
| Track size | 48-52px x 28-32px |
| Handle | 20-24px circle |
| Corner radius | 9999px |
| Animation | 250ms spring (Apple) + state layers (Google) |
| Touch target | 48px minimum |
| CSS prefix | `.switch` |

## Design Tokens

```css
:root {
  --switch-track-off: #E6E0E9;
  --switch-track-on: #6750A4;
  --switch-handle: #FFFFFF;
  --switch-handle-off: #79747E;
  --switch-border-off: #79747E;
  --switch-label: #1D1B20;
  --switch-secondary-label: #49454F;
  --switch-state-hover: rgba(73, 69, 79, 0.08);
  --switch-state-focus: rgba(73, 69, 79, 0.10);
  --switch-focus-ring: rgba(103, 80, 164, 0.4);
  --switch-disabled-opacity: 0.38;
}

@media (prefers-color-scheme: dark) {
  :root {
    --switch-track-off: #36343B;
    --switch-track-on: #D0BCFF;
    --switch-handle: #FFFFFF;
    --switch-handle-off: #938F99;
    --switch-border-off: #938F99;
    --switch-label: #E6E0E9;
    --switch-secondary-label: #CAC4D0;
    --switch-state-hover: rgba(202, 196, 208, 0.08);
    --switch-state-focus: rgba(202, 196, 208, 0.10);
    --switch-focus-ring: rgba(208, 188, 255, 0.4);
  }
}

.dark {
  --switch-track-off: #36343B;
  --switch-track-on: #D0BCFF;
  --switch-handle: #FFFFFF;
  --switch-handle-off: #938F99;
  --switch-border-off: #938F99;
  --switch-label: #E6E0E9;
  --switch-secondary-label: #CAC4D0;
  --switch-state-hover: rgba(202, 196, 208, 0.08);
  --switch-state-focus: rgba(202, 196, 208, 0.10);
  --switch-focus-ring: rgba(208, 188, 255, 0.4);
}
```

## HTML Structure

```html
<!-- Basic switch -->
<label class="switch">
  <input type="checkbox" role="switch" aria-checked="false" class="switch__input" />
  <span class="switch__track">
    <span class="switch__handle"></span>
  </span>
  <span class="switch__label">Dark mode</span>
</label>

<!-- Label on left (settings style) -->
<label class="switch switch--label-left">
  <span class="switch__text">
    <span class="switch__label">Notifications</span>
    <span class="switch__description">Receive push alerts</span>
  </span>
  <input type="checkbox" role="switch" aria-checked="true" checked class="switch__input" />
  <span class="switch__track">
    <span class="switch__handle"></span>
  </span>
</label>

<!-- Label on right (default) -->
<label class="switch switch--label-right">
  <input type="checkbox" role="switch" aria-checked="false" class="switch__input" />
  <span class="switch__track">
    <span class="switch__handle"></span>
  </span>
  <span class="switch__label">Autoplay</span>
</label>
```

## Complete CSS

```css
.switch__input {
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

.switch {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

.switch--label-left {
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
}

.switch--label-right {
  flex-direction: row;
}

/* Track */
.switch__track {
  position: relative;
  width: 50px;
  height: 30px;
  border-radius: 9999px;
  background: var(--switch-track-off);
  border: 2px solid var(--switch-border-off);
  flex-shrink: 0;
  transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1),
              border-color 250ms cubic-bezier(0.4, 0, 0.2, 1);
}

/* Handle */
.switch__handle {
  position: absolute;
  top: 50%;
  left: 4px;
  width: 22px;
  height: 22px;
  border-radius: 9999px;
  background: var(--switch-handle-off);
  transform: translateY(-50%);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: left 250ms cubic-bezier(0.4, 0, 0.2, 1),
              background-color 250ms cubic-bezier(0.4, 0, 0.2, 1),
              box-shadow 150ms;
}

/* Selected state */
.switch__input:checked ~ .switch__track {
  background: var(--switch-track-on);
  border-color: var(--switch-track-on);
}

.switch__input:checked ~ .switch__track .switch__handle {
  left: calc(100% - 22px - 4px);
  background: var(--switch-handle);
}

/* Hover -- state layer (Google) */
.switch:hover .switch__handle {
  box-shadow: 0 0 0 8px var(--switch-state-hover), 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* Focus -- ring (Apple style) */
.switch__input:focus-visible ~ .switch__track {
  outline: 3px solid var(--switch-focus-ring);
  outline-offset: 2px;
}

/* Pressed -- handle grows slightly (Google pattern) */
.switch:active .switch__handle {
  width: 26px;
}

.switch:active .switch__input:checked ~ .switch__track .switch__handle {
  left: calc(100% - 26px - 4px);
}

/* Disabled */
.switch:has(.switch__input:disabled) {
  cursor: not-allowed;
  opacity: var(--switch-disabled-opacity);
}

/* Labels */
.switch__label {
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", Roboto,
    "Helvetica Neue", Arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  color: var(--switch-label);
}

.switch__text {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.switch__description {
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", Roboto,
    "Helvetica Neue", Arial, sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  color: var(--switch-secondary-label);
}
```

## States Reference

| State | Track | Handle | Ring/Shadow | Opacity | Cursor |
|-------|-------|--------|-------------|---------|--------|
| Off | #E6E0E9 | #79747E 22px left | none | 1 | pointer |
| On | #6750A4 | #FFFFFF 22px right | none | 1 | pointer |
| Hover | -- | +8px state layer | 8% overlay | 1 | pointer |
| Focus | -- | -- | 3px primary ring | 1 | pointer |
| Pressed | -- | 26px width | -- | 1 | pointer |
| Disabled | same | same | -- | 0.38 | not-allowed |

## Animation & Motion

```css
/* Combines Apple's spring feel with Google's state layers */
.switch__handle {
  transition: left 250ms cubic-bezier(0.4, 0, 0.2, 1),
              background-color 250ms cubic-bezier(0.4, 0, 0.2, 1),
              width 250ms cubic-bezier(0.4, 0, 0.2, 1);
}

.switch__track {
  transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1),
              border-color 250ms cubic-bezier(0.4, 0, 0.2, 1);
}

@media (prefers-reduced-motion: reduce) {
  .switch__handle,
  .switch__track {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="switch"`, `aria-checked="true|false"` on hidden input
- **Keyboard**: Tab to focus, Space to toggle
- **Focus**: 3px colored outline ring with 2px offset
- **Touch target**: 48px minimum (track is 50x30, padded within label)
- **Screen reader**: Announces label + on/off state
- **Color independence**: Handle position communicates state, not just color

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed track size; label wraps if needed |
| Settings list | Use `--label-left` for full-width rows |
| Touch devices | 48px touch target maintained |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for binary on/off settings | Use for multiple choices |
| Place label left or right consistently | Mix label positions in the same form |
| Show immediate effect (no save needed) | Use for changes requiring confirmation |
| Include descriptive label text | Use without any text label |
