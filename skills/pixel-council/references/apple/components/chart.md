---
name: chart
description: Apple chart — bar, line, area, rule marks with Apple chart styling, Swift Charts conventions
metadata:
  tags: chart, graph, bar, line, area, data visualization, plot, series, axis, swift charts
---

# Chart -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Bar corner radius | 3px (top corners) |
| Line stroke width | 2px |
| Area fill opacity | 0.15-0.3 gradient |
| Grid line color | rgba(60,60,67,0.12) |
| Axis label font | SF Pro, 11px/13px, weight 400 |
| Value label font | SF Pro, 13px/18px, weight 600 |
| Tint colors | System blue, green, orange, purple, pink |
| Point size | 6px diameter |
| Interaction highlight | 0.5px rule mark |
| CSS prefix | `.apple-chart` |

## Design Tokens

```css
:root {
  --apple-chart-bg: #FFFFFF;
  --apple-chart-text: #000000;
  --apple-chart-secondary: rgba(60, 60, 67, 0.6);
  --apple-chart-tertiary: rgba(60, 60, 67, 0.3);
  --apple-chart-grid: rgba(60, 60, 67, 0.12);
  --apple-chart-axis: rgba(60, 60, 67, 0.29);
  --apple-chart-series1: #007AFF;
  --apple-chart-series2: #34C759;
  --apple-chart-series3: #FF9500;
  --apple-chart-series4: #AF52DE;
  --apple-chart-series5: #FF2D55;
  --apple-chart-selection: rgba(0, 0, 0, 0.12);
  --apple-chart-rule: rgba(60, 60, 67, 0.6);
  --apple-chart-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-chart-bg: #1C1C1E;
    --apple-chart-text: #FFFFFF;
    --apple-chart-secondary: rgba(235, 235, 245, 0.6);
    --apple-chart-tertiary: rgba(235, 235, 245, 0.3);
    --apple-chart-grid: rgba(235, 235, 245, 0.1);
    --apple-chart-axis: rgba(84, 84, 88, 0.6);
    --apple-chart-series1: #0A84FF;
    --apple-chart-series2: #30D158;
    --apple-chart-series3: #FF9F0A;
    --apple-chart-series4: #BF5AF2;
    --apple-chart-series5: #FF375F;
    --apple-chart-selection: rgba(255, 255, 255, 0.12);
    --apple-chart-rule: rgba(235, 235, 245, 0.6);
  }
}
.dark {
  --apple-chart-bg: #1C1C1E;
  --apple-chart-text: #FFFFFF;
  --apple-chart-secondary: rgba(235, 235, 245, 0.6);
  --apple-chart-tertiary: rgba(235, 235, 245, 0.3);
  --apple-chart-grid: rgba(235, 235, 245, 0.1);
  --apple-chart-axis: rgba(84, 84, 88, 0.6);
  --apple-chart-series1: #0A84FF;
  --apple-chart-series2: #30D158;
  --apple-chart-series3: #FF9F0A;
  --apple-chart-series4: #BF5AF2;
  --apple-chart-series5: #FF375F;
  --apple-chart-selection: rgba(255, 255, 255, 0.12);
  --apple-chart-rule: rgba(235, 235, 245, 0.6);
}
```

## Variants

| Style | Description | Mark Type | Use Case |
|-------|-------------|-----------|----------|
| Bar | Vertical/horizontal bars | BarMark | Category comparisons |
| Line | Connected data points | LineMark | Trends over time |
| Area | Filled region under line | AreaMark | Volume/cumulative data |
| Point | Scatter plot dots | PointMark | Data distribution |
| Rule | Horizontal/vertical lines | RuleMark | Thresholds, annotations |
| Stacked Bar | Bars divided by category | BarMark (stacked) | Part-to-whole |

## HTML Structure

```html
<!-- Bar Chart -->
<figure class="apple-chart" role="img" aria-label="Weekly steps: Mon 8.2k, Tue 6.5k, Wed 9.1k, Thu 7.3k, Fri 10.2k, Sat 5.8k, Sun 8.7k">
  <div class="apple-chart__header">
    <h3 class="apple-chart__title">Steps</h3>
    <span class="apple-chart__subtitle">This Week</span>
  </div>
  <div class="apple-chart__highlight">
    <span class="apple-chart__highlight-value">55,800</span>
    <span class="apple-chart__highlight-label">total steps</span>
  </div>
  <div class="apple-chart__body">
    <svg class="apple-chart__svg" viewBox="0 0 400 200" role="presentation">
      <!-- Y-axis grid lines -->
      <line class="apple-chart__gridline" x1="40" y1="20" x2="390" y2="20" />
      <line class="apple-chart__gridline" x1="40" y1="65" x2="390" y2="65" />
      <line class="apple-chart__gridline" x1="40" y1="110" x2="390" y2="110" />
      <line class="apple-chart__gridline" x1="40" y1="155" x2="390" y2="155" />

      <!-- Y-axis labels -->
      <text class="apple-chart__axis-label" x="35" y="24" text-anchor="end">10K</text>
      <text class="apple-chart__axis-label" x="35" y="69" text-anchor="end">7.5K</text>
      <text class="apple-chart__axis-label" x="35" y="114" text-anchor="end">5K</text>
      <text class="apple-chart__axis-label" x="35" y="159" text-anchor="end">2.5K</text>

      <!-- Bars -->
      <rect class="apple-chart__bar" x="55" y="43" width="36" height="127" rx="3" />
      <rect class="apple-chart__bar" x="105" y="70" width="36" height="100" rx="3" />
      <rect class="apple-chart__bar" x="155" y="28" width="36" height="142" rx="3" />
      <rect class="apple-chart__bar" x="205" y="56" width="36" height="114" rx="3" />
      <rect class="apple-chart__bar apple-chart__bar--highlight" x="255" y="14" width="36" height="156" rx="3" />
      <rect class="apple-chart__bar" x="305" y="83" width="36" height="87" rx="3" />
      <rect class="apple-chart__bar" x="355" y="38" width="36" height="132" rx="3" />

      <!-- X-axis labels -->
      <text class="apple-chart__axis-label" x="73" y="185" text-anchor="middle">M</text>
      <text class="apple-chart__axis-label" x="123" y="185" text-anchor="middle">T</text>
      <text class="apple-chart__axis-label" x="173" y="185" text-anchor="middle">W</text>
      <text class="apple-chart__axis-label" x="223" y="185" text-anchor="middle">T</text>
      <text class="apple-chart__axis-label" x="273" y="185" text-anchor="middle">F</text>
      <text class="apple-chart__axis-label" x="323" y="185" text-anchor="middle">S</text>
      <text class="apple-chart__axis-label" x="373" y="185" text-anchor="middle">S</text>
    </svg>
  </div>
</figure>

<!-- Line Chart -->
<figure class="apple-chart" role="img" aria-label="Weight trend over 30 days">
  <div class="apple-chart__header">
    <h3 class="apple-chart__title">Weight</h3>
    <span class="apple-chart__subtitle">Last 30 Days</span>
  </div>
  <div class="apple-chart__body">
    <svg class="apple-chart__svg" viewBox="0 0 400 200" role="presentation">
      <!-- Grid lines -->
      <line class="apple-chart__gridline" x1="40" y1="20" x2="390" y2="20" />
      <line class="apple-chart__gridline" x1="40" y1="65" x2="390" y2="65" />
      <line class="apple-chart__gridline" x1="40" y1="110" x2="390" y2="110" />
      <line class="apple-chart__gridline" x1="40" y1="155" x2="390" y2="155" />

      <!-- Area fill -->
      <path class="apple-chart__area" d="M50,80 L100,72 L150,85 L200,65 L250,58 L300,52 L350,48 L380,45 L380,170 L50,170 Z" />

      <!-- Line -->
      <path class="apple-chart__line" d="M50,80 L100,72 L150,85 L200,65 L250,58 L300,52 L350,48 L380,45" />

      <!-- Data points -->
      <circle class="apple-chart__point" cx="200" cy="65" r="3" />

      <!-- Interactive rule mark -->
      <line class="apple-chart__rule" x1="200" y1="20" x2="200" y2="170" />

      <!-- Tooltip -->
      <g class="apple-chart__tooltip" transform="translate(200, 45)">
        <rect x="-30" y="-22" width="60" height="20" rx="6" class="apple-chart__tooltip-bg" />
        <text class="apple-chart__tooltip-text" x="0" y="-8" text-anchor="middle">165 lbs</text>
      </g>
    </svg>
  </div>
</figure>
```

## Complete CSS

```css
.apple-chart {
  font-family: var(--apple-chart-font);
  -webkit-font-smoothing: antialiased;
  margin: 0;
}

/* Header */
.apple-chart__header {
  display: flex;
  align-items: baseline;
  gap: 8px;
  padding: 0 0 4px;
}

.apple-chart__title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-chart-text);
  margin: 0;
}

.apple-chart__subtitle {
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: -0.24px;
  color: var(--apple-chart-secondary);
}

/* Highlight value */
.apple-chart__highlight {
  padding: 4px 0 12px;
}
.apple-chart__highlight-value {
  font-size: 28px;
  font-weight: 700;
  line-height: 34px;
  letter-spacing: 0.36px;
  color: var(--apple-chart-text);
  font-variant-numeric: tabular-nums;
}
.apple-chart__highlight-label {
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  color: var(--apple-chart-secondary);
  margin-left: 4px;
}

/* Chart body */
.apple-chart__body {
  position: relative;
}

.apple-chart__svg {
  width: 100%;
  height: auto;
  display: block;
}

/* Grid lines */
.apple-chart__gridline {
  stroke: var(--apple-chart-grid);
  stroke-width: 0.5;
}

/* Axis labels */
.apple-chart__axis-label {
  font-family: var(--apple-chart-font);
  font-size: 11px;
  font-weight: 400;
  fill: var(--apple-chart-secondary);
}

/* ---- Bar Chart ---- */
.apple-chart__bar {
  fill: var(--apple-chart-series1);
  rx: 3;
  transition: opacity 150ms ease-out;
}
.apple-chart__bar--highlight {
  fill: var(--apple-chart-series1);
  filter: brightness(1.1);
}

/* ---- Line Chart ---- */
.apple-chart__line {
  fill: none;
  stroke: var(--apple-chart-series1);
  stroke-width: 2;
  stroke-linejoin: round;
  stroke-linecap: round;
}

/* Area fill */
.apple-chart__area {
  fill: url(#apple-chart-gradient);
  opacity: 1;
}

/* Gradient definition (add to SVG defs) */
/* <linearGradient id="apple-chart-gradient" x1="0" x2="0" y1="0" y2="1">
     <stop offset="0%" stop-color="var(--apple-chart-series1)" stop-opacity="0.3"/>
     <stop offset="100%" stop-color="var(--apple-chart-series1)" stop-opacity="0.02"/>
   </linearGradient> */

/* Data points */
.apple-chart__point {
  fill: var(--apple-chart-series1);
  stroke: var(--apple-chart-bg);
  stroke-width: 2;
}

/* Rule mark (interaction line) */
.apple-chart__rule {
  stroke: var(--apple-chart-rule);
  stroke-width: 0.5;
  stroke-dasharray: 4 2;
}

/* Tooltip */
.apple-chart__tooltip-bg {
  fill: var(--apple-chart-text);
}
.apple-chart__tooltip-text {
  font-family: var(--apple-chart-font);
  font-size: 13px;
  font-weight: 600;
  fill: var(--apple-chart-bg);
}

/* Multi-series colors */
.apple-chart__bar--series2,
.apple-chart__line--series2 { fill: var(--apple-chart-series2); stroke: var(--apple-chart-series2); }
.apple-chart__bar--series3,
.apple-chart__line--series3 { fill: var(--apple-chart-series3); stroke: var(--apple-chart-series3); }
.apple-chart__bar--series4,
.apple-chart__line--series4 { fill: var(--apple-chart-series4); stroke: var(--apple-chart-series4); }
.apple-chart__bar--series5,
.apple-chart__line--series5 { fill: var(--apple-chart-series5); stroke: var(--apple-chart-series5); }

/* Hover on bars */
@media (hover: hover) {
  .apple-chart__bar:hover {
    opacity: 0.8;
    cursor: pointer;
  }
}

/* Dark mode tooltip inversion */
@media (prefers-color-scheme: dark) {
  .apple-chart__tooltip-bg { fill: #FFFFFF; }
  .apple-chart__tooltip-text { fill: #000000; }
}
.dark .apple-chart__tooltip-bg { fill: #FFFFFF; }
.dark .apple-chart__tooltip-text { fill: #000000; }
```

## States Reference

| State | Bar | Line/Point | Tooltip | Rule Mark |
|-------|-----|-----------|---------|-----------|
| Default | series color, full opacity | 2px line, no points shown | hidden | hidden |
| Hover/Touch | dimmed at 0.8 opacity | point appears at 6px | visible near point | visible vertical line |
| Selected | highlighted (brightness) | larger point (8px) | visible, pinned | solid rule |
| No data | empty area | — | — | — |

## Animation & Motion

```css
/* Bar entrance */
.apple-chart--animate .apple-chart__bar {
  animation: apple-chart-bar-rise 600ms cubic-bezier(0.4, 0, 0.2, 1) forwards;
  transform-origin: bottom;
}
@keyframes apple-chart-bar-rise {
  from { transform: scaleY(0); opacity: 0; }
  to { transform: scaleY(1); opacity: 1; }
}

/* Line draw */
.apple-chart--animate .apple-chart__line {
  stroke-dasharray: 1000;
  stroke-dashoffset: 1000;
  animation: apple-chart-line-draw 1200ms ease-out forwards;
}
@keyframes apple-chart-line-draw {
  to { stroke-dashoffset: 0; }
}

/* Area fade */
.apple-chart--animate .apple-chart__area {
  animation: apple-chart-area-fade 800ms ease-out 400ms forwards;
  opacity: 0;
}
@keyframes apple-chart-area-fade {
  to { opacity: 1; }
}

/* Tooltip appear */
.apple-chart__tooltip {
  opacity: 0;
  transition: opacity 150ms ease-out;
}
.apple-chart__tooltip--visible {
  opacity: 1;
}

@media (prefers-reduced-motion: reduce) {
  .apple-chart--animate .apple-chart__bar,
  .apple-chart--animate .apple-chart__line,
  .apple-chart--animate .apple-chart__area {
    animation: none;
    opacity: 1;
    transform: none;
    stroke-dashoffset: 0;
  }
}
```

## Accessibility

- **ARIA**: `role="img"` on `<figure>` with `aria-label` containing a text description of the data, inner SVG has `role="presentation"`
- **Screen reader**: Full data description in `aria-label` (e.g., "Weekly steps: Mon 8.2k, Tue 6.5k...") — charts are inherently visual, provide text alternative
- **Color independence**: Use shape (bar height, line position) as primary data encoding; color differentiates series but isn't the only signal
- **Interactive**: Tooltip appears on hover/touch showing exact values; keyboard users can Tab to activate
- **Contrast**: Series colors chosen for sufficient contrast against chart background in both themes
- **Data table alternative**: For complex charts, provide an accessible data table below or via toggle

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Simplified chart (fewer gridlines, abbreviated labels), touch-friendly |
| 600-1024px | Standard chart, tooltip on touch |
| > 1024px | Full detail, hover interactions, wider layout |

## Do / Don't

| Do | Don't |
|----|-------|
| Start Y-axis at 0 for bar charts | Truncate Y-axis to exaggerate differences |
| Use 3px top-corner radius on bars (Apple convention) | Use fully rounded bars or sharp corners |
| Show gridlines at regular intervals with low opacity | Use heavy or distracting gridlines |
| Use system colors for series (blue, green, orange, purple, pink) | Use random or non-system colors |
| Provide a text data description via `aria-label` | Render a chart without any accessible alternative |
