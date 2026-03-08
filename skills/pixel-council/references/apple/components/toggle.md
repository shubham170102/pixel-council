---
name: toggle
description: Apple toggle switch with green/gray track and slide animation
metadata:
  tags: toggle, switch, on off, boolean, setting
---

# Toggle / Switch -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Track size | 51x31px |
| Handle | 27px circle, white |
| Corner radius | 9999px (fully rounded) |
| Off color | rgba(120,120,128,0.16) |
| On color (light) | #34C759 |
| On color (dark) | #30D158 |
| Animation | 300ms spring |
| CSS prefix | `.apple-toggle` |

## Design Tokens

```css
:root {
  --apple-toggle-track-off: rgba(120, 120, 128, 0.16);
  --apple-toggle-track-on: #34C759;
  --apple-toggle-handle: #FFFFFF;
  --apple-toggle-handle-shadow: 0 3px 8px rgba(0, 0, 0, 0.15), 0 1px 1px rgba(0, 0, 0, 0.16);
  --apple-toggle-label: #000000;
  --apple-toggle-secondary-label: rgba(60, 60, 67, 0.6);
  --apple-toggle-focus-ring: rgba(0, 122, 255, 0.6);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-toggle-track-off: rgba(120, 120, 128, 0.36);
    --apple-toggle-track-on: #30D158;
    --apple-toggle-handle: #FFFFFF;
    --apple-toggle-handle-shadow: 0 3px 8px rgba(0, 0, 0, 0.3), 0 1px 1px rgba(0, 0, 0, 0.3);
    --apple-toggle-label: #FFFFFF;
    --apple-toggle-secondary-label: rgba(235, 235, 245, 0.6);
    --apple-toggle-focus-ring: rgba(10, 132, 255, 0.6);
  }
}

.dark {
  --apple-toggle-track-off: rgba(120, 120, 128, 0.36);
  --apple-toggle-track-on: #30D158;
  --apple-toggle-handle: #FFFFFF;
  --apple-toggle-handle-shadow: 0 3px 8px rgba(0, 0, 0, 0.3), 0 1px 1px rgba(0, 0, 0, 0.3);
  --apple-toggle-label: #FFFFFF;
  --apple-toggle-secondary-label: rgba(235, 235, 245, 0.6);
  --apple-toggle-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Default | Toggle with label to the right |
| Label-left | Settings-style with label on left, toggle on right |
| With description | Label + secondary description text, toggle on right |
| Disabled | Reduced opacity (0.4), non-interactive |

## HTML Structure

```html
<!-- Toggle with label -->
<label class="apple-toggle">
  <input type="checkbox" role="switch" aria-checked="false"
         class="apple-toggle__input" />
  <span class="apple-toggle__track">
    <span class="apple-toggle__handle"></span>
  </span>
  <span class="apple-toggle__label">Airplane Mode</span>
</label>

<!-- Toggle with label on left (settings style) -->
<label class="apple-toggle apple-toggle--label-left">
  <span class="apple-toggle__label">Wi-Fi</span>
  <input type="checkbox" role="switch" aria-checked="true" checked
         class="apple-toggle__input" />
  <span class="apple-toggle__track">
    <span class="apple-toggle__handle"></span>
  </span>
</label>

<!-- Toggle with description -->
<label class="apple-toggle apple-toggle--label-left">
  <span class="apple-toggle__text">
    <span class="apple-toggle__label">Notifications</span>
    <span class="apple-toggle__description">Allow push notifications</span>
  </span>
  <input type="checkbox" role="switch" aria-checked="false"
         class="apple-toggle__input" />
  <span class="apple-toggle__track">
    <span class="apple-toggle__handle"></span>
  </span>
</label>
```

## Complete CSS

```css
.apple-toggle__input {
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

.apple-toggle {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

.apple-toggle--label-left {
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
}

/* Track */
.apple-toggle__track {
  position: relative;
  width: 51px;
  height: 31px;
  border-radius: 9999px;
  background: var(--apple-toggle-track-off);
  flex-shrink: 0;
  transition: background-color 300ms cubic-bezier(0.4, 0.0, 0.2, 1);
}

/* Handle */
.apple-toggle__handle {
  position: absolute;
  top: 2px;
  left: 2px;
  width: 27px;
  height: 27px;
  border-radius: 9999px;
  background: var(--apple-toggle-handle);
  box-shadow: var(--apple-toggle-handle-shadow);
  transition: left 300ms cubic-bezier(0.4, 0.0, 0.2, 1),
              width 300ms cubic-bezier(0.4, 0.0, 0.2, 1);
}

/* Selected state */
.apple-toggle__input:checked ~ .apple-toggle__track {
  background: var(--apple-toggle-track-on);
}

.apple-toggle__input:checked ~ .apple-toggle__track .apple-toggle__handle {
  left: calc(100% - 27px - 2px);
}

/* Pressed: handle grows to 33px pill */
.apple-toggle:active .apple-toggle__handle {
  width: 33px;
}

.apple-toggle:active .apple-toggle__input:checked ~ .apple-toggle__track .apple-toggle__handle {
  left: calc(100% - 33px - 2px);
}

/* Hover */
.apple-toggle:hover .apple-toggle__track {
  filter: brightness(0.95);
}

/* Focus */
.apple-toggle__input:focus-visible ~ .apple-toggle__track {
  outline: 4px solid var(--apple-toggle-focus-ring);
  outline-offset: 1px;
}

/* Disabled */
.apple-toggle:has(.apple-toggle__input:disabled) {
  cursor: not-allowed;
  opacity: 0.4;
}

/* Labels */
.apple-toggle__label {
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Helvetica Neue",
    Helvetica, Arial, sans-serif;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-toggle-label);
}

.apple-toggle__text {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.apple-toggle__description {
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Helvetica Neue",
    Helvetica, Arial, sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-toggle-secondary-label);
}

/* Dark mode label overrides */
@media (prefers-color-scheme: dark) {
  .apple-toggle__label { color: #FFFFFF; }
  .apple-toggle__description { color: rgba(235, 235, 245, 0.6); }
}

.dark .apple-toggle__label { color: #FFFFFF; }
.dark .apple-toggle__description { color: rgba(235, 235, 245, 0.6); }
```

## States Reference

| State | Track | Handle | Opacity | Cursor |
|-------|-------|--------|---------|--------|
| Off | rgba(120,120,128,0.16) | white 27px at left | 1 | pointer |
| On | #34C759 | white 27px at right | 1 | pointer |
| Hover | brightness(0.95) | -- | 1 | pointer |
| Focus | +4px blue ring | -- | 1 | pointer |
| Pressed (off) | -- | 33px pill, stays left | 1 | pointer |
| Pressed (on) | -- | 33px pill, stays right | 1 | pointer |
| Disabled | same color | same position | 0.4 | not-allowed |

## Animation & Motion

```css
/* Spring-like animation for handle slide */
.apple-toggle__handle {
  transition: left 300ms cubic-bezier(0.4, 0.0, 0.2, 1),
              width 300ms cubic-bezier(0.4, 0.0, 0.2, 1);
}

/* Track color change */
.apple-toggle__track {
  transition: background-color 300ms cubic-bezier(0.4, 0.0, 0.2, 1);
}

@media (prefers-reduced-motion: reduce) {
  .apple-toggle__handle,
  .apple-toggle__track {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="switch"`, `aria-checked="true|false"` on hidden input
- **Keyboard**: Tab to focus, Space to toggle
- **Focus**: 4px solid blue outline ring with 1px offset
- **Touch target**: 51x31px track (meets 44px height guidance with padding)
- **Screen reader**: Announces label + on/off state
- **Color independence**: State is communicated by handle position, not color alone

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed 51x31px track |
| Settings list | Label-left layout, toggle right-aligned |
| Compact | 44px minimum touch target maintained |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for immediate on/off settings | Use for form submissions that need a save action |
| Place in settings lists with label on left | Stack toggles without labels |
| Use green for on-state (system default) | Use custom colors without sufficient contrast |
| Ensure state is clear beyond color (position) | Rely solely on color to indicate state |
