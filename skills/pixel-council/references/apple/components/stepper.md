---
name: stepper
description: Apple stepper — increment/decrement control with +/- buttons, custom step, min/max bounds
metadata:
  tags: stepper, increment, decrement, plus, minus, counter, quantity, number
---

# Stepper -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Total width | 94px |
| Height | 32px |
| Button width | 47px each |
| Corner radius | 8px continuous |
| Font | SF Pro, 22px/24px, weight 300 (icons) |
| Fill (light) | rgba(120,120,128,0.16) |
| Fill (dark) | rgba(120,120,128,0.36) |
| Tint (light) | #007AFF |
| Tint (dark) | #0A84FF |
| CSS prefix | `.apple-stepper` |

## Design Tokens

```css
:root {
  --apple-stepper-fill: rgba(120, 120, 128, 0.16);
  --apple-stepper-tint: #007AFF;
  --apple-stepper-icon: #007AFF;
  --apple-stepper-separator: rgba(60, 60, 67, 0.29);
  --apple-stepper-label: #000000;
  --apple-stepper-secondary-label: rgba(60, 60, 67, 0.6);
  --apple-stepper-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-stepper-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-stepper-fill: rgba(120, 120, 128, 0.36);
    --apple-stepper-tint: #0A84FF;
    --apple-stepper-icon: #0A84FF;
    --apple-stepper-separator: rgba(84, 84, 88, 0.6);
    --apple-stepper-label: #FFFFFF;
    --apple-stepper-secondary-label: rgba(235, 235, 245, 0.6);
    --apple-stepper-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-stepper-fill: rgba(120, 120, 128, 0.36);
  --apple-stepper-tint: #0A84FF;
  --apple-stepper-icon: #0A84FF;
  --apple-stepper-separator: rgba(84, 84, 88, 0.6);
  --apple-stepper-label: #FFFFFF;
  --apple-stepper-secondary-label: rgba(235, 235, 245, 0.6);
  --apple-stepper-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Value Display |
|-------|-------------|--------------|
| Standard | +/- buttons only, no visible value | External |
| With Label | Label on left, stepper on right | External |
| With Value | Shows current value between buttons or alongside | Inline |

## HTML Structure

```html
<!-- Standard Stepper -->
<div class="apple-stepper" role="group" aria-label="Quantity">
  <button class="apple-stepper__decrement" aria-label="Decrease"
          aria-disabled="false">
    <svg width="16" height="2" viewBox="0 0 16 2" aria-hidden="true">
      <rect width="16" height="2" rx="1" fill="currentColor"/>
    </svg>
  </button>
  <span class="apple-stepper__divider" aria-hidden="true"></span>
  <button class="apple-stepper__increment" aria-label="Increase"
          aria-disabled="false">
    <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <rect x="7" y="0" width="2" height="16" rx="1" fill="currentColor"/>
      <rect x="0" y="7" width="16" height="2" rx="1" fill="currentColor"/>
    </svg>
  </button>
</div>

<!-- Stepper with Label and Value -->
<div class="apple-stepper apple-stepper--labeled">
  <div class="apple-stepper__text">
    <span class="apple-stepper__label">Guests</span>
    <span class="apple-stepper__value" aria-live="polite">3</span>
  </div>
  <div class="apple-stepper__controls" role="group" aria-label="Guests">
    <button class="apple-stepper__decrement" aria-label="Decrease guests">
      <svg width="16" height="2" viewBox="0 0 16 2" aria-hidden="true">
        <rect width="16" height="2" rx="1" fill="currentColor"/>
      </svg>
    </button>
    <span class="apple-stepper__divider" aria-hidden="true"></span>
    <button class="apple-stepper__increment" aria-label="Increase guests">
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <rect x="7" y="0" width="2" height="16" rx="1" fill="currentColor"/>
        <rect x="0" y="7" width="16" height="2" rx="1" fill="currentColor"/>
      </svg>
    </button>
  </div>
</div>

<!-- Disabled Stepper (at minimum) -->
<div class="apple-stepper" role="group" aria-label="Quantity">
  <button class="apple-stepper__decrement" aria-label="Decrease" disabled aria-disabled="true">
    <svg width="16" height="2" viewBox="0 0 16 2" aria-hidden="true">
      <rect width="16" height="2" rx="1" fill="currentColor"/>
    </svg>
  </button>
  <span class="apple-stepper__divider" aria-hidden="true"></span>
  <button class="apple-stepper__increment" aria-label="Increase">
    <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <rect x="7" y="0" width="2" height="16" rx="1" fill="currentColor"/>
      <rect x="0" y="7" width="16" height="2" rx="1" fill="currentColor"/>
    </svg>
  </button>
</div>
```

## Complete CSS

```css
.apple-stepper {
  display: inline-flex;
  align-items: center;
  font-family: var(--apple-stepper-font);
  -webkit-font-smoothing: antialiased;
}

.apple-stepper--labeled {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  min-height: 44px;
}

.apple-stepper__controls {
  display: inline-flex;
  align-items: center;
}

/* Buttons */
.apple-stepper__decrement,
.apple-stepper__increment {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 47px;
  height: 32px;
  background: var(--apple-stepper-fill);
  border: none;
  color: var(--apple-stepper-icon);
  cursor: pointer;
  transition: background-color 150ms ease-out, opacity 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
  padding: 0;
}

.apple-stepper__decrement {
  border-radius: 8px 0 0 8px;
}
.apple-stepper__increment {
  border-radius: 0 8px 8px 0;
}

/* Divider */
.apple-stepper__divider {
  width: 0.5px;
  height: 18px;
  background: var(--apple-stepper-separator);
  flex-shrink: 0;
}

/* Pressed */
.apple-stepper__decrement:active,
.apple-stepper__increment:active {
  background: rgba(120, 120, 128, 0.28);
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-stepper__decrement:hover,
  .apple-stepper__increment:hover {
    background: rgba(120, 120, 128, 0.24);
  }
}

/* Focus */
.apple-stepper__decrement:focus-visible,
.apple-stepper__increment:focus-visible {
  outline: 4px solid var(--apple-stepper-focus-ring);
  outline-offset: 1px;
  z-index: 1;
}

/* Disabled */
.apple-stepper__decrement:disabled,
.apple-stepper__increment:disabled {
  opacity: 0.3;
  cursor: not-allowed;
  pointer-events: none;
}

/* Labels */
.apple-stepper__text {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.apple-stepper__label {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-stepper-label);
}

.apple-stepper__value {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-stepper-label);
  font-variant-numeric: tabular-nums;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-stepper__decrement:active,
  .apple-stepper__increment:active {
    background: rgba(120, 120, 128, 0.5);
  }
  .apple-stepper__decrement:focus-visible,
  .apple-stepper__increment:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-stepper__decrement:active,
.dark .apple-stepper__increment:active {
  background: rgba(120, 120, 128, 0.5);
}
.dark .apple-stepper__decrement:focus-visible,
.dark .apple-stepper__increment:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Decrement | Increment | Divider | Opacity | Cursor |
|-------|-----------|-----------|---------|---------|--------|
| Default | fill bg, tint icon | fill bg, tint icon | separator | 1 | pointer |
| Hover | darker fill | darker fill | — | 1 | pointer |
| Focus | 4px blue ring | 4px blue ring | — | 1 | pointer |
| Active | pressed fill | pressed fill | — | 1 | pointer |
| At minimum | opacity 0.3 | normal | — | 0.3/1 | not-allowed/pointer |
| At maximum | normal | opacity 0.3 | — | 1/0.3 | pointer/not-allowed |
| Fully disabled | opacity 0.3 | opacity 0.3 | — | 0.3 | not-allowed |

## Animation & Motion

```css
.apple-stepper__decrement,
.apple-stepper__increment {
  transition: background-color 150ms ease-out, opacity 150ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-stepper__decrement,
  .apple-stepper__increment {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="group"` on container with `aria-label`, each button has `aria-label`, `aria-disabled` on min/max bounds
- **Keyboard**: Tab to focus each button, Enter/Space to activate, long-press not applicable on web
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: 47x32px buttons (meets width, expand height to 44px with padding)
- **Screen reader**: Announces "Decrease [label]" / "Increase [label]", value changes announced via `aria-live="polite"` on value element
- **Haptic feedback**: Not available on web, visual press feedback substitutes

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width labeled layout, stepper right-aligned |
| 600-1024px | Inline with label, standard 94px width |
| > 1024px | Same 94px width, macOS-style placement |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for small, bounded numeric values (1-20 range) | Use for large ranges (use slider instead) |
| Show current value alongside the stepper | Hide the value — users need feedback |
| Disable decrement at minimum, increment at maximum | Allow values beyond min/max bounds |
| Use in list rows with label on left | Stack steppers vertically without labels |
| Pair with a text field for direct numeric entry | Use stepper as the only way to set large values |
