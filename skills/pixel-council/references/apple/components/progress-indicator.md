---
name: progress-indicator
description: Apple linear and circular progress with determinate and indeterminate spinner states
metadata:
  tags: progress, loading, spinner, activity indicator, progress bar
---

# Progress Indicators -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Bar height | 4px |
| Bar border-radius | 2px |
| Bar track (light) | rgba(118, 118, 128, 0.12) |
| Bar active (light) | #007AFF |
| Bar active (dark) | #0A84FF |
| Spinner size (small) | 20px |
| Spinner size (regular) | 36px |
| Spinner segments | 12 |
| Spinner color (light) | #8E8E93 |

## Design Tokens

```css
:root {
  --apple-progress-track: rgba(118, 118, 128, 0.12);
  --apple-progress-active: #007AFF;
  --apple-progress-spinner: #8E8E93;
  --apple-progress-radius: 2px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-progress-track: rgba(118, 118, 128, 0.24);
    --apple-progress-active: #0A84FF;
    --apple-progress-spinner: #8E8E93;
  }
}

.dark {
  --apple-progress-track: rgba(118, 118, 128, 0.24);
  --apple-progress-active: #0A84FF;
  --apple-progress-spinner: #8E8E93;
}
```

## Variants

| Variant | Type | Description |
|---------|------|-------------|
| Progress bar (determinate) | Bar | Fills left-to-right showing completion |
| Progress bar (indeterminate) | Bar | Animated shimmer on track |
| Spinner (small) | Spinner | 20px, inline loading |
| Spinner (regular) | Spinner | 36px, standalone loading |

## HTML Structure

```html
<!-- Determinate bar -->
<div class="apple-progress apple-progress--bar" role="progressbar"
  aria-label="Downloading" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
  <div class="apple-progress__track">
    <div class="apple-progress__fill" style="width: 60%"></div>
  </div>
</div>

<!-- Indeterminate bar -->
<div class="apple-progress apple-progress--bar apple-progress--indeterminate" role="progressbar"
  aria-label="Loading">
  <div class="apple-progress__track">
    <div class="apple-progress__fill"></div>
  </div>
</div>

<!-- Spinner (regular) -->
<div class="apple-progress apple-progress--spinner" role="progressbar" aria-label="Loading">
  <svg class="apple-progress__spinner-svg" viewBox="0 0 36 36">
    <g class="apple-progress__spinner-segments">
      <!-- 12 segments generated via CSS or JS -->
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(30 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(60 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(90 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(120 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(150 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(180 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(210 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(240 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(270 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(300 18 18)" />
      <line x1="18" y1="4" x2="18" y2="10" stroke-linecap="round" transform="rotate(330 18 18)" />
    </g>
  </svg>
</div>

<!-- Spinner (small) -->
<div class="apple-progress apple-progress--spinner apple-progress--small" role="progressbar"
  aria-label="Loading">
  <!-- Same SVG structure, 20px -->
</div>
```

## Complete CSS

```css
/* Bar base */
.apple-progress--bar {
  width: 100%;
  height: 4px;
}
.apple-progress__track {
  width: 100%;
  height: 100%;
  background: var(--apple-progress-track);
  border-radius: var(--apple-progress-radius);
  overflow: hidden;
  position: relative;
}
.apple-progress__fill {
  height: 100%;
  background: var(--apple-progress-active);
  border-radius: var(--apple-progress-radius);
  transition: width 300ms ease;
}

/* Indeterminate bar */
.apple-progress--indeterminate .apple-progress__fill {
  width: 40%;
  position: absolute;
  animation: apple-bar-indeterminate 1.5s ease-in-out infinite;
}

/* Spinner base */
.apple-progress--spinner {
  width: 36px;
  height: 36px;
  display: inline-block;
}
.apple-progress--small {
  width: 20px;
  height: 20px;
}
.apple-progress__spinner-svg {
  width: 100%;
  height: 100%;
  animation: apple-spinner-rotate 1s steps(12) infinite;
}
.apple-progress__spinner-segments line {
  stroke: var(--apple-progress-spinner);
  stroke-width: 2;
}
/* Opacity gradient for segment fading (12 segments) */
.apple-progress__spinner-segments line:nth-child(1)  { opacity: 1.0; }
.apple-progress__spinner-segments line:nth-child(2)  { opacity: 0.92; }
.apple-progress__spinner-segments line:nth-child(3)  { opacity: 0.83; }
.apple-progress__spinner-segments line:nth-child(4)  { opacity: 0.75; }
.apple-progress__spinner-segments line:nth-child(5)  { opacity: 0.67; }
.apple-progress__spinner-segments line:nth-child(6)  { opacity: 0.58; }
.apple-progress__spinner-segments line:nth-child(7)  { opacity: 0.50; }
.apple-progress__spinner-segments line:nth-child(8)  { opacity: 0.42; }
.apple-progress__spinner-segments line:nth-child(9)  { opacity: 0.33; }
.apple-progress__spinner-segments line:nth-child(10) { opacity: 0.25; }
.apple-progress__spinner-segments line:nth-child(11) { opacity: 0.17; }
.apple-progress__spinner-segments line:nth-child(12) { opacity: 0.08; }
```

## States Reference

| State | Bar Track | Bar Fill | Spinner | Opacity |
|-------|-----------|----------|---------|---------|
| Determinate (0%) | full track visible | no fill | — | 1 |
| Determinate (partial) | visible behind fill | fills left-to-right | — | 1 |
| Determinate (100%) | hidden behind fill | full width | — | 1 |
| Indeterminate | full track | 40% width, animating | — | 1 |
| Spinner (active) | — | — | rotating, 12 segments | 1 |
| Reduced motion | full track | full width, 50% opacity | static, 60% opacity | 0.5-0.6 |

## Animation & Motion

```css
@keyframes apple-bar-indeterminate {
  0%   { left: -40%; }
  100% { left: 100%; }
}

@keyframes apple-spinner-rotate {
  from { transform: rotate(0deg); }
  to   { transform: rotate(360deg); }
}

@media (prefers-reduced-motion: reduce) {
  .apple-progress--indeterminate .apple-progress__fill,
  .apple-progress__spinner-svg {
    animation: none;
  }
  .apple-progress--indeterminate .apple-progress__fill {
    width: 100%;
    opacity: 0.5;
  }
  .apple-progress__spinner-svg {
    opacity: 0.6;
  }
}
```

## Accessibility

- ARIA: `role="progressbar"`, `aria-valuemin="0"`, `aria-valuemax="100"`
- Determinate: set `aria-valuenow` to current percentage value
- Indeterminate: omit `aria-valuenow`; screen reader announces "busy"
- Label: `aria-label` describing the operation (e.g., "Downloading file")
- Screen reader: announcements on progress milestones (25%, 50%, 75%, 100%)
- Do not rely on color alone; shape differentiates bar from spinner

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Bar: full container width. Spinner: 20px (small) preferred inline |
| 600-1024px | Default sizes |
| >1024px | Default sizes |

## Do / Don't

| Do | Don't |
|----|-------|
| Use determinate when duration is knowable | Use a stationary indicator (signals stalling) |
| Keep indicators animated during processing | Switch between bar and spinner mid-operation |
| Switch from indeterminate to determinate when possible | Use vague descriptions like "loading" |
| Provide cancel/pause for long operations | Label spinners unnecessarily |
| Use small spinner inline with text/buttons | Rely only on manual refresh |
