---
name: gauge
description: Apple gauge — linear/circular value indicator, value labels, gradient tint, capacity display
metadata:
  tags: gauge, meter, indicator, linear, circular, capacity, level, battery, signal
---

# Gauge -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Linear track height | 6px |
| Linear corner radius | 9999px |
| Circular diameter | 64-120px |
| Circular stroke width | 6-8px |
| Value font | SF Pro, 17px/22px, weight 600 |
| Label font | SF Pro, 13px/18px, weight 400 |
| Green range | 0-33% → #34C759 / #30D158 |
| Yellow range | 34-66% → #FFCC00 / #FFD60A |
| Red range | 67-100% → #FF3B30 / #FF453A |
| CSS prefix | `.apple-gauge` |

## Design Tokens

```css
:root {
  --apple-gauge-track: rgba(120, 120, 128, 0.16);
  --apple-gauge-tint: #007AFF;
  --apple-gauge-green: #34C759;
  --apple-gauge-yellow: #FFCC00;
  --apple-gauge-orange: #FF9500;
  --apple-gauge-red: #FF3B30;
  --apple-gauge-text: #000000;
  --apple-gauge-secondary: rgba(60, 60, 67, 0.6);
  --apple-gauge-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-gauge-track: rgba(120, 120, 128, 0.36);
    --apple-gauge-tint: #0A84FF;
    --apple-gauge-green: #30D158;
    --apple-gauge-yellow: #FFD60A;
    --apple-gauge-orange: #FF9F0A;
    --apple-gauge-red: #FF453A;
    --apple-gauge-text: #FFFFFF;
    --apple-gauge-secondary: rgba(235, 235, 245, 0.6);
  }
}
.dark {
  --apple-gauge-track: rgba(120, 120, 128, 0.36);
  --apple-gauge-tint: #0A84FF;
  --apple-gauge-green: #30D158;
  --apple-gauge-yellow: #FFD60A;
  --apple-gauge-orange: #FF9F0A;
  --apple-gauge-red: #FF453A;
  --apple-gauge-text: #FFFFFF;
  --apple-gauge-secondary: rgba(235, 235, 245, 0.6);
}
```

## Variants

| Style | Description | Shape | Labels |
|-------|-------------|-------|--------|
| Linear | Horizontal bar fill | Rectangle | Min/max/current |
| Linear Gradient | Color changes with value | Rectangle | Min/max/current |
| Circular | Arc fill around a circle | 270° arc | Center value |
| Circular Gradient | Color gradient along arc | 270° arc | Center value |
| Capacity | Shows used/available | Rectangle | Label + fraction |

## HTML Structure

```html
<!-- Linear Gauge -->
<div class="apple-gauge apple-gauge--linear" role="meter"
     aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" aria-label="Storage used">
  <div class="apple-gauge__labels">
    <span class="apple-gauge__label">0 GB</span>
    <span class="apple-gauge__value-label">65 GB</span>
    <span class="apple-gauge__label">128 GB</span>
  </div>
  <div class="apple-gauge__track">
    <div class="apple-gauge__fill" style="width: 50.8%"></div>
  </div>
</div>

<!-- Linear Gauge with Gradient Tint -->
<div class="apple-gauge apple-gauge--linear apple-gauge--gradient" role="meter"
     aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" aria-label="CPU Temperature">
  <div class="apple-gauge__labels">
    <span class="apple-gauge__label">Cool</span>
    <span class="apple-gauge__value-label">78°</span>
    <span class="apple-gauge__label">Hot</span>
  </div>
  <div class="apple-gauge__track">
    <div class="apple-gauge__fill" style="width: 78%"></div>
  </div>
</div>

<!-- Circular Gauge -->
<div class="apple-gauge apple-gauge--circular" role="meter"
     aria-valuenow="72" aria-valuemin="0" aria-valuemax="100" aria-label="Battery level">
  <svg class="apple-gauge__ring" viewBox="0 0 120 120">
    <circle class="apple-gauge__ring-track" cx="60" cy="60" r="52"
            fill="none" stroke-width="8" />
    <circle class="apple-gauge__ring-fill" cx="60" cy="60" r="52"
            fill="none" stroke-width="8"
            stroke-dasharray="326.7" stroke-dashoffset="91.5"
            stroke-linecap="round" />
  </svg>
  <div class="apple-gauge__center">
    <span class="apple-gauge__center-value">72%</span>
    <span class="apple-gauge__center-label">Battery</span>
  </div>
</div>

<!-- Capacity Gauge -->
<div class="apple-gauge apple-gauge--capacity" role="meter"
     aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" aria-label="Storage">
  <div class="apple-gauge__capacity-header">
    <span class="apple-gauge__capacity-title">iPhone Storage</span>
    <span class="apple-gauge__capacity-detail">45 GB of 128 GB Used</span>
  </div>
  <div class="apple-gauge__track apple-gauge__track--segmented">
    <div class="apple-gauge__segment" style="width: 25%; background: var(--apple-gauge-tint);" aria-label="Apps: 25%"></div>
    <div class="apple-gauge__segment" style="width: 12%; background: var(--apple-gauge-orange);" aria-label="Photos: 12%"></div>
    <div class="apple-gauge__segment" style="width: 8%; background: var(--apple-gauge-green);" aria-label="Messages: 8%"></div>
  </div>
</div>
```

## Complete CSS

```css
.apple-gauge {
  font-family: var(--apple-gauge-font);
  -webkit-font-smoothing: antialiased;
}

/* ---- Linear ---- */
.apple-gauge--linear {
  width: 100%;
}

.apple-gauge__labels {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 6px;
}

.apple-gauge__label {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-gauge-secondary);
}

.apple-gauge__value-label {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-gauge-text);
  font-variant-numeric: tabular-nums;
}

.apple-gauge__track {
  position: relative;
  height: 6px;
  background: var(--apple-gauge-track);
  border-radius: 9999px;
  overflow: hidden;
}

.apple-gauge__fill {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  background: var(--apple-gauge-tint);
  border-radius: 9999px;
  transition: width 500ms ease-out;
}

/* Gradient fill */
.apple-gauge--gradient .apple-gauge__fill {
  background: linear-gradient(to right,
    var(--apple-gauge-green),
    var(--apple-gauge-yellow),
    var(--apple-gauge-orange),
    var(--apple-gauge-red)
  );
}

/* ---- Circular ---- */
.apple-gauge--circular {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 120px;
  height: 120px;
}

.apple-gauge__ring {
  width: 100%;
  height: 100%;
  transform: rotate(-135deg);
}

.apple-gauge__ring-track {
  stroke: var(--apple-gauge-track);
  stroke-dasharray: 245; /* 270° of 326.7 circumference */
  stroke-dashoffset: 0;
  stroke-linecap: round;
}

.apple-gauge__ring-fill {
  stroke: var(--apple-gauge-tint);
  transition: stroke-dashoffset 500ms ease-out;
  stroke-linecap: round;
}

.apple-gauge__center {
  position: absolute;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 2px;
}

.apple-gauge__center-value {
  font-size: 22px;
  font-weight: 700;
  line-height: 28px;
  color: var(--apple-gauge-text);
  font-variant-numeric: tabular-nums;
}

.apple-gauge__center-label {
  font-size: 11px;
  font-weight: 400;
  line-height: 13px;
  letter-spacing: 0.07px;
  color: var(--apple-gauge-secondary);
  text-transform: uppercase;
}

/* ---- Capacity ---- */
.apple-gauge--capacity {
  width: 100%;
}

.apple-gauge__capacity-header {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 8px;
}

.apple-gauge__capacity-title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  color: var(--apple-gauge-text);
}

.apple-gauge__capacity-detail {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  color: var(--apple-gauge-secondary);
}

.apple-gauge__track--segmented {
  display: flex;
  gap: 1px;
}

.apple-gauge__segment {
  height: 100%;
  min-width: 2px;
  transition: width 500ms ease-out;
}
.apple-gauge__segment:first-child { border-radius: 9999px 0 0 9999px; }
.apple-gauge__segment:last-child { border-radius: 0 9999px 9999px 0; }

/* ---- Small sizes ---- */
.apple-gauge--sm .apple-gauge__track { height: 4px; }
.apple-gauge--sm.apple-gauge--circular { width: 64px; height: 64px; }
.apple-gauge--sm .apple-gauge__center-value { font-size: 15px; line-height: 20px; }

/* Dark mode — no additional overrides needed (tokens handle it) */
```

## States Reference

| State | Fill | Label | Track |
|-------|------|-------|-------|
| Default | tint color at current % | value shown | gray track |
| Low (0-33%) | green | green value (optional) | gray track |
| Medium (34-66%) | yellow/orange | — | gray track |
| High (67-100%) | red | red value (optional) | gray track |
| Animated | transitioning width/dashoffset | — | — |

## Animation & Motion

```css
/* Fill transitions */
.apple-gauge__fill {
  transition: width 500ms ease-out;
}
.apple-gauge__ring-fill {
  transition: stroke-dashoffset 500ms ease-out;
}
.apple-gauge__segment {
  transition: width 500ms ease-out;
}

/* Pulse on value change */
@keyframes apple-gauge-pulse {
  0% { opacity: 1; }
  50% { opacity: 0.7; }
  100% { opacity: 1; }
}

@media (prefers-reduced-motion: reduce) {
  .apple-gauge__fill,
  .apple-gauge__ring-fill,
  .apple-gauge__segment {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="meter"` with `aria-valuenow`, `aria-valuemin`, `aria-valuemax`, and `aria-label`
- **Screen reader**: Announces "Storage used: 65 of 128 GB" or "Battery level: 72%"
- **Color independence**: Numeric value always visible alongside color — don't rely on color alone
- **Segments**: Each segment has `aria-label` describing its category and value
- **Font**: Tabular numbers (`font-variant-numeric: tabular-nums`) prevent layout shift during value updates

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width linear, circular 80-100px diameter |
| 600-1024px | Gauges in card/widget contexts, 100-120px circular |
| > 1024px | Dashboard layouts with multiple gauges side-by-side |

## Do / Don't

| Do | Don't |
|----|-------|
| Always show a numeric value alongside the visual fill | Rely on color or fill alone to communicate value |
| Use gradient tint only when value severity matters | Use gradient just for decoration |
| Use `role="meter"` (not `progressbar`) for static values | Use `progressbar` for a non-changing value |
| Use segmented capacity for multi-category breakdowns | Use pie charts when a linear gauge is clearer |
| Animate fill changes smoothly | Jump instantly to new values without transition |
