---
name: slider
description: M3 continuous and discrete sliders with value label and range support
metadata:
  tags: slider, range, input, volume, brightness, form
---

# Slider -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Track height | 4px |
| Track border-radius | 2px |
| Handle | 20px circle |
| Value indicator | 44x28px tooltip |
| Touch target | 48px |
| CSS prefix | `.md-slider` |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-slider-active-track: #6750A4;
  --md-slider-inactive-track: #E6E0E9;
  --md-slider-handle: #6750A4;
  --md-slider-handle-hover: #6750A4;
  --md-slider-state-hover: rgba(103, 80, 164, 0.08);
  --md-slider-state-focus: rgba(103, 80, 164, 0.10);
  --md-slider-state-pressed: rgba(103, 80, 164, 0.10);
  --md-slider-indicator-bg: #6750A4;
  --md-slider-indicator-text: #FFFFFF;
  --md-slider-tick-active: #FFFFFF;
  --md-slider-tick-inactive: #79747E;
  --md-slider-disabled-track: rgba(29, 27, 32, 0.12);
  --md-slider-disabled-handle: rgba(29, 27, 32, 0.38);
  --md-slider-label: #1D1B20;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-slider-active-track: #D0BCFF;
    --md-slider-inactive-track: #36343B;
    --md-slider-handle: #D0BCFF;
    --md-slider-handle-hover: #D0BCFF;
    --md-slider-state-hover: rgba(208, 188, 255, 0.08);
    --md-slider-state-focus: rgba(208, 188, 255, 0.10);
    --md-slider-state-pressed: rgba(208, 188, 255, 0.10);
    --md-slider-indicator-bg: #D0BCFF;
    --md-slider-indicator-text: #381E72;
    --md-slider-tick-active: #381E72;
    --md-slider-tick-inactive: #938F99;
    --md-slider-disabled-track: rgba(230, 224, 233, 0.12);
    --md-slider-disabled-handle: rgba(230, 224, 233, 0.38);
    --md-slider-label: #E6E0E9;
  }
}

.dark {
  --md-slider-active-track: #D0BCFF;
  --md-slider-inactive-track: #36343B;
  --md-slider-handle: #D0BCFF;
  --md-slider-handle-hover: #D0BCFF;
  --md-slider-state-hover: rgba(208, 188, 255, 0.08);
  --md-slider-state-focus: rgba(208, 188, 255, 0.10);
  --md-slider-state-pressed: rgba(208, 188, 255, 0.10);
  --md-slider-indicator-bg: #D0BCFF;
  --md-slider-indicator-text: #381E72;
  --md-slider-tick-active: #381E72;
  --md-slider-tick-inactive: #938F99;
  --md-slider-disabled-track: rgba(230, 224, 233, 0.12);
  --md-slider-disabled-handle: rgba(230, 224, 233, 0.38);
  --md-slider-label: #E6E0E9;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Continuous | Any value within range, no tick marks |
| Discrete | Step values with optional tick marks |
| Range | Two handles for min/max selection |

## HTML Structure

```html
<!-- Continuous slider -->
<div class="md-slider" role="group" aria-labelledby="vol-label">
  <label id="vol-label" class="md-slider__label">Volume</label>
  <div class="md-slider__container">
    <div class="md-slider__track">
      <div class="md-slider__track-active" style="width: 40%"></div>
    </div>
    <div class="md-slider__handle" role="slider" tabindex="0"
         aria-valuemin="0" aria-valuemax="100" aria-valuenow="40"
         aria-label="Volume" style="left: 40%">
      <div class="md-slider__indicator" aria-hidden="true">40</div>
    </div>
  </div>
</div>

<!-- Discrete slider with ticks -->
<div class="md-slider md-slider--discrete" role="group" aria-labelledby="step-label">
  <label id="step-label" class="md-slider__label">Steps</label>
  <div class="md-slider__container">
    <div class="md-slider__track">
      <div class="md-slider__track-active" style="width: 60%"></div>
      <div class="md-slider__ticks"></div>
    </div>
    <div class="md-slider__handle" role="slider" tabindex="0"
         aria-valuemin="0" aria-valuemax="10" aria-valuenow="6"
         aria-label="Steps" style="left: 60%">
      <div class="md-slider__indicator" aria-hidden="true">6</div>
    </div>
  </div>
</div>

<!-- Range slider -->
<div class="md-slider md-slider--range" role="group" aria-labelledby="price-label">
  <label id="price-label" class="md-slider__label">Price range</label>
  <div class="md-slider__container">
    <div class="md-slider__track">
      <div class="md-slider__track-active" style="left: 20%; width: 50%"></div>
    </div>
    <div class="md-slider__handle md-slider__handle--start" role="slider" tabindex="0"
         aria-valuemin="0" aria-valuemax="100" aria-valuenow="20"
         aria-label="Minimum price" style="left: 20%">
      <div class="md-slider__indicator" aria-hidden="true">$20</div>
    </div>
    <div class="md-slider__handle md-slider__handle--end" role="slider" tabindex="0"
         aria-valuemin="0" aria-valuemax="100" aria-valuenow="70"
         aria-label="Maximum price" style="left: 70%">
      <div class="md-slider__indicator" aria-hidden="true">$70</div>
    </div>
  </div>
</div>
```

## Complete CSS

```css
.md-slider {
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-width: 200px;
  user-select: none;
  -webkit-tap-highlight-color: transparent;
}

.md-slider__label {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-slider-label);
}

.md-slider__container {
  position: relative;
  height: 48px;
  display: flex;
  align-items: center;
  touch-action: none;
}

/* Track */
.md-slider__track {
  position: relative;
  width: 100%;
  height: 4px;
  border-radius: 2px;
  background: var(--md-slider-inactive-track);
}

.md-slider__track-active {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  border-radius: 2px;
  background: var(--md-slider-active-track);
}

/* Tick marks (discrete) */
.md-slider__ticks {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2px;
}

.md-slider__ticks::before,
.md-slider__ticks::after {
  content: "";
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background: var(--md-slider-tick-inactive);
}

/* Handle */
.md-slider__handle {
  position: absolute;
  top: 50%;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: var(--md-slider-handle);
  transform: translate(-50%, -50%);
  cursor: grab;
  z-index: 2;
  outline: none;
}

/* State layer on handle */
.md-slider__handle::before {
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

.md-slider__handle:hover::before {
  background: var(--md-slider-state-hover);
}

.md-slider__handle:focus-visible::before {
  background: var(--md-slider-state-focus);
}

.md-slider__handle:active {
  cursor: grabbing;
}

.md-slider__handle:active::before {
  background: var(--md-slider-state-pressed);
}

/* Value indicator (tooltip) */
.md-slider__indicator {
  position: absolute;
  bottom: calc(100% + 8px);
  left: 50%;
  transform: translateX(-50%) scale(0);
  width: 44px;
  height: 28px;
  border-radius: 14px;
  background: var(--md-slider-indicator-bg);
  color: var(--md-slider-indicator-text);
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 28px;
  text-align: center;
  opacity: 0;
  transition: transform 150ms cubic-bezier(0.05, 0.7, 0.1, 1),
              opacity 150ms;
  pointer-events: none;
}

.md-slider__handle:hover .md-slider__indicator,
.md-slider__handle:focus-visible .md-slider__indicator,
.md-slider__handle:active .md-slider__indicator {
  transform: translateX(-50%) scale(1);
  opacity: 1;
}

/* Disabled */
.md-slider--disabled {
  pointer-events: none;
  opacity: 0.38;
}

.md-slider--disabled .md-slider__track-active {
  background: var(--md-slider-disabled-handle);
}

.md-slider--disabled .md-slider__handle {
  background: var(--md-slider-disabled-handle);
  cursor: not-allowed;
}

.md-slider--disabled .md-slider__track {
  background: var(--md-slider-disabled-track);
}
```

## States Reference

| State | Active Track | Handle | Indicator | Cursor |
|-------|-------------|--------|-----------|--------|
| Default | #6750A4 | #6750A4 | hidden | grab |
| Hover | -- | +8% primary layer | visible | grab |
| Focus | -- | +10% primary layer | visible | grab |
| Active/Dragging | -- | +10% primary layer | visible | grabbing |
| Disabled | 38% on-surface | 38% on-surface | hidden | not-allowed |

## Animation & Motion

```css
/* Handle state layer */
.md-slider__handle::before {
  transition: background-color 150ms;
}

/* Value indicator appearance */
.md-slider__indicator {
  transition: transform 150ms cubic-bezier(0.05, 0.7, 0.1, 1),
              opacity 150ms;
}

@media (prefers-reduced-motion: reduce) {
  .md-slider__handle::before,
  .md-slider__indicator {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="slider"`, `aria-valuemin`, `aria-valuemax`, `aria-valuenow`, `aria-label`
- **Keyboard**: Tab to focus, Arrow Left/Right to adjust, Home/End for min/max, Page Up/Down for larger steps
- **Focus**: Visible 40px state layer
- **Touch target**: 48px via container height
- **Screen reader**: Announces current value, range, and label
- **Range slider**: Each handle has independent ARIA attributes

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Full-width within container; minimum 200px |
| Touch devices | 48px touch target ensured by container |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for numeric ranges (volume, brightness) | Use for precise values (use text field) |
| Show value indicator on interaction | Hide all value feedback from users |
| Use discrete mode with ticks for stepped values | Use continuous when only specific values are valid |
| Provide accessible label for each handle | Forget aria-label on range slider handles |
