---
name: activity-ring
description: Apple activity ring — circular progress, multi-ring, gradient stroke, fitness-style indicator
metadata:
  tags: activity ring, circular progress, ring, fitness, move, exercise, stand, donut, progress
---

# Activity Ring -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Ring diameter | 80-200px |
| Stroke width | 12-16px (proportional) |
| Ring gap | 4px between rings |
| End cap | round (stroke-linecap) |
| Move color | #FF2D55 (pink) |
| Exercise color | #34C759 (green) |
| Stand color | #5AC8FA (teal) |
| Track opacity | 30% of ring color |
| CSS prefix | `.apple-ring` |

## Design Tokens

```css
:root {
  --apple-ring-move: #FF2D55;
  --apple-ring-exercise: #34C759;
  --apple-ring-stand: #5AC8FA;
  --apple-ring-move-track: rgba(255, 45, 85, 0.3);
  --apple-ring-exercise-track: rgba(52, 199, 89, 0.3);
  --apple-ring-stand-track: rgba(90, 200, 250, 0.3);
  --apple-ring-text: #000000;
  --apple-ring-secondary: rgba(60, 60, 67, 0.6);
  --apple-ring-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-ring-move: #FF375F;
    --apple-ring-exercise: #30D158;
    --apple-ring-stand: #64D2FF;
    --apple-ring-move-track: rgba(255, 55, 95, 0.3);
    --apple-ring-exercise-track: rgba(48, 209, 88, 0.3);
    --apple-ring-stand-track: rgba(100, 210, 255, 0.3);
    --apple-ring-text: #FFFFFF;
    --apple-ring-secondary: rgba(235, 235, 245, 0.6);
  }
}
.dark {
  --apple-ring-move: #FF375F;
  --apple-ring-exercise: #30D158;
  --apple-ring-stand: #64D2FF;
  --apple-ring-move-track: rgba(255, 55, 95, 0.3);
  --apple-ring-exercise-track: rgba(48, 209, 88, 0.3);
  --apple-ring-stand-track: rgba(100, 210, 255, 0.3);
  --apple-ring-text: #FFFFFF;
  --apple-ring-secondary: rgba(235, 235, 245, 0.6);
}
```

## Variants

| Style | Rings | Description | Use Case |
|-------|-------|-------------|----------|
| Triple Ring | 3 | Move (outer), Exercise (middle), Stand (inner) | Fitness/activity |
| Single Ring | 1 | One metric, any color | Simple completion |
| Double Ring | 2 | Two metrics | Dual goals |
| With Legend | 3 | Rings + labeled stats below | Dashboard display |
| Compact | 3 | Smaller size, no labels | Widget/inline |

## HTML Structure

```html
<!-- Triple Activity Ring -->
<div class="apple-ring" role="img" aria-label="Activity: Move 75%, Exercise 50%, Stand 83%">
  <svg class="apple-ring__svg" viewBox="0 0 200 200">
    <!-- Move Ring (outer) -->
    <circle class="apple-ring__track" cx="100" cy="100" r="88"
            stroke="var(--apple-ring-move-track)" />
    <circle class="apple-ring__progress apple-ring__progress--move" cx="100" cy="100" r="88"
            stroke="var(--apple-ring-move)"
            stroke-dasharray="553" stroke-dashoffset="138"
            stroke-linecap="round" />

    <!-- Exercise Ring (middle) -->
    <circle class="apple-ring__track" cx="100" cy="100" r="72"
            stroke="var(--apple-ring-exercise-track)" />
    <circle class="apple-ring__progress apple-ring__progress--exercise" cx="100" cy="100" r="72"
            stroke="var(--apple-ring-exercise)"
            stroke-dasharray="452" stroke-dashoffset="226"
            stroke-linecap="round" />

    <!-- Stand Ring (inner) -->
    <circle class="apple-ring__track" cx="100" cy="100" r="56"
            stroke="var(--apple-ring-stand-track)" />
    <circle class="apple-ring__progress apple-ring__progress--stand" cx="100" cy="100" r="56"
            stroke="var(--apple-ring-stand)"
            stroke-dasharray="352" stroke-dashoffset="60"
            stroke-linecap="round" />
  </svg>
</div>

<!-- Activity Ring with Legend -->
<div class="apple-ring apple-ring--with-legend">
  <svg class="apple-ring__svg" viewBox="0 0 200 200">
    <!-- Same SVG rings as above -->
    <circle class="apple-ring__track" cx="100" cy="100" r="88" stroke="var(--apple-ring-move-track)" />
    <circle class="apple-ring__progress apple-ring__progress--move" cx="100" cy="100" r="88"
            stroke="var(--apple-ring-move)" stroke-dasharray="553" stroke-dashoffset="138" stroke-linecap="round" />
    <circle class="apple-ring__track" cx="100" cy="100" r="72" stroke="var(--apple-ring-exercise-track)" />
    <circle class="apple-ring__progress apple-ring__progress--exercise" cx="100" cy="100" r="72"
            stroke="var(--apple-ring-exercise)" stroke-dasharray="452" stroke-dashoffset="226" stroke-linecap="round" />
    <circle class="apple-ring__track" cx="100" cy="100" r="56" stroke="var(--apple-ring-stand-track)" />
    <circle class="apple-ring__progress apple-ring__progress--stand" cx="100" cy="100" r="56"
            stroke="var(--apple-ring-stand)" stroke-dasharray="352" stroke-dashoffset="60" stroke-linecap="round" />
  </svg>
  <div class="apple-ring__legend">
    <div class="apple-ring__stat">
      <span class="apple-ring__stat-dot" style="background: var(--apple-ring-move)"></span>
      <span class="apple-ring__stat-label">Move</span>
      <span class="apple-ring__stat-value">420/560 CAL</span>
    </div>
    <div class="apple-ring__stat">
      <span class="apple-ring__stat-dot" style="background: var(--apple-ring-exercise)"></span>
      <span class="apple-ring__stat-label">Exercise</span>
      <span class="apple-ring__stat-value">15/30 MIN</span>
    </div>
    <div class="apple-ring__stat">
      <span class="apple-ring__stat-dot" style="background: var(--apple-ring-stand)"></span>
      <span class="apple-ring__stat-label">Stand</span>
      <span class="apple-ring__stat-value">10/12 HRS</span>
    </div>
  </div>
</div>

<!-- Single Ring -->
<div class="apple-ring apple-ring--single" role="img" aria-label="Completion: 72%">
  <svg class="apple-ring__svg" viewBox="0 0 120 120">
    <circle class="apple-ring__track" cx="60" cy="60" r="52"
            stroke="var(--apple-ring-move-track)" />
    <circle class="apple-ring__progress" cx="60" cy="60" r="52"
            stroke="var(--apple-ring-move)"
            stroke-dasharray="326.7" stroke-dashoffset="91.5"
            stroke-linecap="round" />
  </svg>
  <span class="apple-ring__center-label">72%</span>
</div>
```

## Complete CSS

```css
.apple-ring {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  position: relative;
  font-family: var(--apple-ring-font);
  -webkit-font-smoothing: antialiased;
}

.apple-ring__svg {
  width: 160px;
  height: 160px;
  transform: rotate(-90deg);
}

/* Track */
.apple-ring__track {
  fill: none;
  stroke-width: 14;
}

/* Progress */
.apple-ring__progress {
  fill: none;
  stroke-width: 14;
  stroke-linecap: round;
  transition: stroke-dashoffset 1000ms cubic-bezier(0.4, 0, 0.2, 1);
}

/* Overflow glow (>100%) */
.apple-ring__progress--overflow {
  filter: drop-shadow(0 0 6px currentColor);
}

/* ---- With Legend ---- */
.apple-ring--with-legend {
  display: flex;
  align-items: center;
  gap: 24px;
}

.apple-ring__legend {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.apple-ring__stat {
  display: flex;
  align-items: center;
  gap: 8px;
}

.apple-ring__stat-dot {
  width: 10px;
  height: 10px;
  border-radius: 9999px;
  flex-shrink: 0;
}

.apple-ring__stat-label {
  font-size: 15px;
  font-weight: 600;
  line-height: 20px;
  letter-spacing: -0.24px;
  color: var(--apple-ring-text);
  min-width: 60px;
}

.apple-ring__stat-value {
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: -0.24px;
  color: var(--apple-ring-secondary);
  font-variant-numeric: tabular-nums;
}

/* ---- Single Ring ---- */
.apple-ring--single {
  position: relative;
}
.apple-ring--single .apple-ring__svg {
  width: 120px;
  height: 120px;
}

.apple-ring__center-label {
  position: absolute;
  font-size: 22px;
  font-weight: 700;
  line-height: 28px;
  color: var(--apple-ring-text);
  font-variant-numeric: tabular-nums;
}

/* ---- Compact ---- */
.apple-ring--compact .apple-ring__svg {
  width: 80px;
  height: 80px;
}
.apple-ring--compact .apple-ring__track,
.apple-ring--compact .apple-ring__progress {
  stroke-width: 10;
}

/* ---- Sizes ---- */
.apple-ring--sm .apple-ring__svg { width: 100px; height: 100px; }
.apple-ring--lg .apple-ring__svg { width: 200px; height: 200px; }
```

## States Reference

| State | Ring Fill | Track | Glow | Animation |
|-------|----------|-------|------|-----------|
| 0% | No fill visible | Full track visible | No | — |
| 1-99% | Partial arc, round cap | Visible behind fill | No | Fill animates |
| 100% | Complete circle | Hidden behind fill | No | Completion pulse |
| >100% | Overlapping arc | Hidden | Glow effect | Continues past start |

## Animation & Motion

```css
/* Ring fill animation */
.apple-ring__progress {
  transition: stroke-dashoffset 1000ms cubic-bezier(0.4, 0, 0.2, 1);
}

/* Initial load animation (stagger each ring) */
.apple-ring--animate .apple-ring__progress--move {
  animation: apple-ring-fill 1200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms forwards;
}
.apple-ring--animate .apple-ring__progress--exercise {
  animation: apple-ring-fill 1200ms cubic-bezier(0.4, 0, 0.2, 1) 200ms forwards;
}
.apple-ring--animate .apple-ring__progress--stand {
  animation: apple-ring-fill 1200ms cubic-bezier(0.4, 0, 0.2, 1) 400ms forwards;
}

@keyframes apple-ring-fill {
  from { stroke-dashoffset: var(--ring-circumference); }
  to { stroke-dashoffset: var(--ring-target-offset); }
}

/* Completion pulse */
@keyframes apple-ring-complete {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); }
  100% { transform: scale(1); }
}

@media (prefers-reduced-motion: reduce) {
  .apple-ring__progress {
    transition: none;
  }
  .apple-ring--animate .apple-ring__progress--move,
  .apple-ring--animate .apple-ring__progress--exercise,
  .apple-ring--animate .apple-ring__progress--stand {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: `role="img"` on container with `aria-label` describing all ring values (e.g., "Activity: Move 75%, Exercise 50%, Stand 83%")
- **Screen reader**: Full description of each metric and its progress
- **Color independence**: Legend with labels and numeric values ensures information is accessible without seeing colors
- **Contrast**: Ring colors chosen for sufficient contrast against both light and dark backgrounds
- **Tabular numbers**: `font-variant-numeric: tabular-nums` prevents layout shift during value updates

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Compact size (80-100px), legend below rings |
| 600-1024px | Standard size (160px), legend beside rings |
| > 1024px | Large size available (200px), in dashboard cards |

## Do / Don't

| Do | Don't |
|----|-------|
| Stagger ring animations on load (200ms delay between rings) | Animate all rings simultaneously |
| Show a legend with numeric values for accessibility | Rely on ring colors alone to communicate data |
| Use the canonical Activity colors (pink, green, teal) for fitness | Use random colors that don't map to established meaning |
| Show overflow (>100%) with a glow effect and overlapping arc | Cap the ring at 100% when user exceeded their goal |
| Use round stroke-linecap for Apple's signature ring appearance | Use butt or square stroke-linecap |
