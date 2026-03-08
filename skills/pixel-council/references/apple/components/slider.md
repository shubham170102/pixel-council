---
name: slider
description: Apple slider — continuous/discrete track with draggable thumb, min/max labels, custom tint
metadata:
  tags: slider, range, input, track, thumb, volume, brightness, continuous, discrete
---

# Slider -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Track height | 4px |
| Thumb diameter | 28px |
| Touch target | 44px minimum |
| Corner radius (track) | 9999px (fully rounded) |
| Tint color (light) | #007AFF |
| Tint color (dark) | #0A84FF |
| Track min (light) | #007AFF |
| Track max (light) | rgba(120,120,128,0.16) |
| Thumb | white with shadow |
| CSS prefix | `.apple-slider` |

## Design Tokens

```css
:root {
  --apple-slider-min-track: #007AFF;
  --apple-slider-max-track: rgba(120, 120, 128, 0.16);
  --apple-slider-thumb: #FFFFFF;
  --apple-slider-thumb-shadow: 0 3px 8px rgba(0, 0, 0, 0.15), 0 1px 1px rgba(0, 0, 0, 0.16);
  --apple-slider-label: #000000;
  --apple-slider-secondary-label: rgba(60, 60, 67, 0.6);
  --apple-slider-icon: rgba(60, 60, 67, 0.6);
  --apple-slider-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-slider-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-slider-min-track: #0A84FF;
    --apple-slider-max-track: rgba(120, 120, 128, 0.36);
    --apple-slider-thumb: #FFFFFF;
    --apple-slider-thumb-shadow: 0 3px 8px rgba(0, 0, 0, 0.3), 0 1px 1px rgba(0, 0, 0, 0.3);
    --apple-slider-label: #FFFFFF;
    --apple-slider-secondary-label: rgba(235, 235, 245, 0.6);
    --apple-slider-icon: rgba(235, 235, 245, 0.6);
    --apple-slider-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-slider-min-track: #0A84FF;
  --apple-slider-max-track: rgba(120, 120, 128, 0.36);
  --apple-slider-thumb: #FFFFFF;
  --apple-slider-thumb-shadow: 0 3px 8px rgba(0, 0, 0, 0.3), 0 1px 1px rgba(0, 0, 0, 0.3);
  --apple-slider-label: #FFFFFF;
  --apple-slider-secondary-label: rgba(235, 235, 245, 0.6);
  --apple-slider-icon: rgba(235, 235, 245, 0.6);
  --apple-slider-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Min Image | Max Image |
|-------|-------------|-----------|-----------|
| Continuous | Smooth value selection across range | None | None |
| Continuous with labels | Shows min/max text labels | Optional | Optional |
| Continuous with icons | Shows min/max icons (e.g., speaker) | Icon | Icon |
| Discrete | Snaps to specific step values | None | None |
| Custom tint | Uses custom color instead of system blue | None | None |

## HTML Structure

```html
<!-- Continuous Slider -->
<div class="apple-slider">
  <input type="range" class="apple-slider__input" min="0" max="100" value="50"
         aria-label="Volume" aria-valuemin="0" aria-valuemax="100" aria-valuenow="50" />
</div>

<!-- Slider with Min/Max Labels -->
<div class="apple-slider apple-slider--labeled">
  <span class="apple-slider__min-label">0</span>
  <input type="range" class="apple-slider__input" min="0" max="100" value="50"
         aria-label="Brightness" />
  <span class="apple-slider__max-label">100</span>
</div>

<!-- Slider with Min/Max Icons -->
<div class="apple-slider apple-slider--icons">
  <span class="apple-slider__min-icon" aria-hidden="true">
    <svg width="20" height="20" viewBox="0 0 20 20"><!-- speaker quiet icon --></svg>
  </span>
  <input type="range" class="apple-slider__input" min="0" max="100" value="50"
         aria-label="Volume" />
  <span class="apple-slider__max-icon" aria-hidden="true">
    <svg width="24" height="24" viewBox="0 0 24 24"><!-- speaker loud icon --></svg>
  </span>
</div>

<!-- Slider with Value Display -->
<div class="apple-slider apple-slider--with-value">
  <label class="apple-slider__label">Font Size</label>
  <div class="apple-slider__row">
    <input type="range" class="apple-slider__input" min="12" max="48" value="17" step="1"
           aria-label="Font Size" />
    <output class="apple-slider__value">17</output>
  </div>
</div>

<!-- Disabled Slider -->
<div class="apple-slider">
  <input type="range" class="apple-slider__input" min="0" max="100" value="30"
         aria-label="Disabled slider" disabled aria-disabled="true" />
</div>
```

## Complete CSS

```css
.apple-slider {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 4px 0;
  min-height: 44px;
  font-family: var(--apple-slider-font);
  -webkit-font-smoothing: antialiased;
}
.apple-slider--labeled,
.apple-slider--icons {
  gap: 12px;
}

.apple-slider__input {
  flex: 1;
  -webkit-appearance: none;
  appearance: none;
  height: 4px;
  background: var(--apple-slider-max-track);
  border-radius: 9999px;
  outline: none;
  cursor: pointer;
  margin: 0;
}

/* Track (WebKit) */
.apple-slider__input::-webkit-slider-runnable-track {
  height: 4px;
  border-radius: 9999px;
  background: linear-gradient(
    to right,
    var(--apple-slider-min-track) 0%,
    var(--apple-slider-min-track) var(--value-percent, 50%),
    var(--apple-slider-max-track) var(--value-percent, 50%),
    var(--apple-slider-max-track) 100%
  );
}

/* Track (Firefox) */
.apple-slider__input::-moz-range-track {
  height: 4px;
  border-radius: 9999px;
  background: var(--apple-slider-max-track);
  border: none;
}
.apple-slider__input::-moz-range-progress {
  height: 4px;
  border-radius: 9999px;
  background: var(--apple-slider-min-track);
}

/* Thumb (WebKit) */
.apple-slider__input::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 28px;
  height: 28px;
  border-radius: 9999px;
  background: var(--apple-slider-thumb);
  box-shadow: var(--apple-slider-thumb-shadow);
  border: none;
  margin-top: -12px;
  cursor: grab;
  transition: transform 150ms ease-out;
}

/* Thumb (Firefox) */
.apple-slider__input::-moz-range-thumb {
  width: 28px;
  height: 28px;
  border-radius: 9999px;
  background: var(--apple-slider-thumb);
  box-shadow: var(--apple-slider-thumb-shadow);
  border: none;
  cursor: grab;
  transition: transform 150ms ease-out;
}

/* Active (dragging) */
.apple-slider__input:active::-webkit-slider-thumb {
  transform: scale(1.1);
  cursor: grabbing;
}
.apple-slider__input:active::-moz-range-thumb {
  transform: scale(1.1);
  cursor: grabbing;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-slider__input:hover::-webkit-slider-thumb {
    transform: scale(1.05);
  }
  .apple-slider__input:hover::-moz-range-thumb {
    transform: scale(1.05);
  }
}

/* Focus */
.apple-slider__input:focus-visible::-webkit-slider-thumb {
  outline: 4px solid var(--apple-slider-focus-ring);
  outline-offset: 1px;
}
.apple-slider__input:focus-visible::-moz-range-thumb {
  outline: 4px solid var(--apple-slider-focus-ring);
  outline-offset: 1px;
}

/* Disabled */
.apple-slider__input:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}
.apple-slider__input:disabled::-webkit-slider-thumb { cursor: not-allowed; }
.apple-slider__input:disabled::-moz-range-thumb { cursor: not-allowed; }

/* Labels */
.apple-slider__min-label,
.apple-slider__max-label {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-slider-secondary-label);
  flex-shrink: 0;
}

/* Icons */
.apple-slider__min-icon,
.apple-slider__max-icon {
  color: var(--apple-slider-icon);
  flex-shrink: 0;
  display: flex;
  align-items: center;
}

/* Value display */
.apple-slider__label {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-slider-label);
  display: block;
  margin-bottom: 4px;
}
.apple-slider__row {
  display: flex;
  align-items: center;
  gap: 12px;
}
.apple-slider__value {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  color: var(--apple-slider-secondary-label);
  min-width: 32px;
  text-align: right;
  font-variant-numeric: tabular-nums;
}
.apple-slider--with-value {
  flex-direction: column;
  align-items: stretch;
}

/* Dark mode focus ring override */
@media (prefers-color-scheme: dark) {
  .apple-slider__input:focus-visible::-webkit-slider-thumb {
    outline-color: rgba(10, 132, 255, 0.6);
  }
  .apple-slider__input:focus-visible::-moz-range-thumb {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-slider__input:focus-visible::-webkit-slider-thumb {
  outline-color: rgba(10, 132, 255, 0.6);
}
.dark .apple-slider__input:focus-visible::-moz-range-thumb {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Track | Thumb | Opacity | Cursor |
|-------|-------|-------|---------|--------|
| Default | blue min / gray max | white 28px, shadow | 1 | pointer |
| Hover | — | scale(1.05) | 1 | pointer |
| Focus | — | +4px blue ring | 1 | pointer |
| Active (dragging) | updates live | scale(1.1) | 1 | grabbing |
| Disabled | same colors | same | 0.4 | not-allowed |

## Animation & Motion

```css
/* Thumb scale transition */
.apple-slider__input::-webkit-slider-thumb {
  transition: transform 150ms ease-out;
}
.apple-slider__input::-moz-range-thumb {
  transition: transform 150ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-slider__input::-webkit-slider-thumb,
  .apple-slider__input::-moz-range-thumb {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `aria-label` on input, `aria-valuemin`, `aria-valuemax`, `aria-valuenow` for screen readers, `aria-disabled="true"` when disabled
- **Keyboard**: Tab to focus, Left/Down to decrease, Right/Up to increase, Home for min, End for max
- **Focus ring**: 4px solid blue at 60% opacity around thumb
- **Touch target**: 28px thumb with minimum 44px hit area (browser handles enlarged touch area)
- **Screen reader**: Announces label + current value + range
- **Min/max icons**: `aria-hidden="true"`, context provided by `aria-label`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width, 44px touch target, icons sized 20-24px |
| 600-1024px | Full-width within container, optional value display |
| > 1024px | Can be fixed width, macOS-style thinner track |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for continuous ranges (volume, brightness) | Use for exact value entry (use stepper or text field) |
| Provide min/max icons for contextual clarity | Leave slider unlabeled |
| Use custom tint sparingly (e.g., brightness = yellow) | Use custom tints that don't match system colors |
| Show current value when precision matters | Rely on thumb position alone for precise values |
| Use discrete steps when options are limited | Use a slider when there are fewer than 5 options |
