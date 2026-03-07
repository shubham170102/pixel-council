---
name: progress
description: M3 linear and circular progress indicators with determinate and indeterminate states
metadata:
  tags: progress, loading, spinner, progress bar, indeterminate, determinate
---

# Progress Indicators -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Linear height | 4px |
| Linear border-radius | 0px |
| Circular diameter | 48px |
| Circular stroke-width | 4px |
| Track color (light) | #E6E0E9 |
| Track color (dark) | #36343B |
| Active color (light) | #6750A4 |
| Active color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-progress-track: #E6E0E9;
  --md-progress-active: #6750A4;
  --md-progress-four-1: #6750A4;
  --md-progress-four-2: #EADDFF;
  --md-progress-four-3: #7D5260;
  --md-progress-four-4: #FFD8E4;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-progress-track: #36343B;
    --md-progress-active: #D0BCFF;
    --md-progress-four-1: #D0BCFF;
    --md-progress-four-2: #4F378B;
    --md-progress-four-3: #EFB8C8;
    --md-progress-four-4: #633B48;
  }
}

.dark {
  --md-progress-track: #36343B;
  --md-progress-active: #D0BCFF;
  --md-progress-four-1: #D0BCFF;
  --md-progress-four-2: #4F378B;
  --md-progress-four-3: #EFB8C8;
  --md-progress-four-4: #633B48;
}
```

## Variants

| Variant | Type | Description |
|---------|------|-------------|
| Linear determinate | Linear | Fills left-to-right based on value/max |
| Linear indeterminate | Linear | Animated sliding segment |
| Linear buffer | Linear | Determinate fill + buffered dots |
| Circular determinate | Circular | Arc fills clockwise |
| Circular indeterminate | Circular | Rotating + growing/shrinking arc |
| Four-color indeterminate | Both | Cycles through 4 brand colors |

## HTML Structure

```html
<!-- Linear determinate -->
<div class="md-progress md-progress--linear" role="progressbar"
  aria-label="Loading content" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
  <div class="md-progress__track">
    <div class="md-progress__bar" style="width: 40%"></div>
  </div>
</div>

<!-- Linear indeterminate -->
<div class="md-progress md-progress--linear md-progress--indeterminate" role="progressbar"
  aria-label="Loading">
  <div class="md-progress__track">
    <div class="md-progress__bar"></div>
  </div>
</div>

<!-- Circular determinate -->
<div class="md-progress md-progress--circular" role="progressbar"
  aria-label="Uploading" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
  <svg viewBox="0 0 48 48">
    <circle class="md-progress__track-circle" cx="24" cy="24" r="22" />
    <circle class="md-progress__bar-circle" cx="24" cy="24" r="22"
      stroke-dasharray="138.2" stroke-dashoffset="48.4" />
  </svg>
</div>

<!-- Circular indeterminate -->
<div class="md-progress md-progress--circular md-progress--indeterminate" role="progressbar"
  aria-label="Loading">
  <svg viewBox="0 0 48 48">
    <circle class="md-progress__bar-circle" cx="24" cy="24" r="22" />
  </svg>
</div>
```

## Complete CSS

```css
/* Linear */
.md-progress--linear {
  width: 100%;
  height: 4px;
  overflow: hidden;
}
.md-progress__track {
  width: 100%;
  height: 100%;
  background: var(--md-progress-track);
  position: relative;
}
.md-progress__bar {
  height: 100%;
  background: var(--md-progress-active);
  border-radius: 0;
  transition: width 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}

/* Linear indeterminate */
.md-progress--indeterminate .md-progress__bar {
  width: 50%;
  position: absolute;
  animation: md-linear-indeterminate 2s cubic-bezier(0.65, 0, 0.35, 1) infinite;
}

/* Circular */
.md-progress--circular {
  width: 48px;
  height: 48px;
  display: inline-block;
}
.md-progress--circular svg {
  width: 100%;
  height: 100%;
  transform: rotate(-90deg);
}
.md-progress__track-circle {
  fill: none;
  stroke: var(--md-progress-track);
  stroke-width: 4px;
}
.md-progress__bar-circle {
  fill: none;
  stroke: var(--md-progress-active);
  stroke-width: 4px;
  stroke-linecap: round;
  transition: stroke-dashoffset 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}

/* Circular indeterminate */
.md-progress--circular.md-progress--indeterminate svg {
  animation: md-circular-rotate 1333ms linear infinite;
}
.md-progress--circular.md-progress--indeterminate .md-progress__bar-circle {
  stroke-dasharray: 100, 200;
  animation: md-circular-dash 1333ms cubic-bezier(0.4, 0, 0.2, 1) infinite;
}

/* Four-color variant */
.md-progress--four-color.md-progress--indeterminate .md-progress__bar {
  animation: md-linear-indeterminate 2s cubic-bezier(0.65, 0, 0.35, 1) infinite,
             md-four-color-linear 8s step-end infinite;
}
.md-progress--four-color.md-progress--circular.md-progress--indeterminate .md-progress__bar-circle {
  animation: md-circular-dash 1333ms cubic-bezier(0.4, 0, 0.2, 1) infinite,
             md-four-color-circular 5332ms step-end infinite;
}

/* Dark mode - handled by tokens */
```

## Animation & Motion

```css
@keyframes md-linear-indeterminate {
  0%   { left: -50%; width: 50%; }
  50%  { left: 30%; width: 30%; }
  100% { left: 100%; width: 10%; }
}

@keyframes md-circular-rotate {
  from { transform: rotate(-90deg); }
  to   { transform: rotate(270deg); }
}

@keyframes md-circular-dash {
  0%   { stroke-dasharray: 1, 200; stroke-dashoffset: 0; }
  50%  { stroke-dasharray: 100, 200; stroke-dashoffset: -15; }
  100% { stroke-dasharray: 1, 200; stroke-dashoffset: -138; }
}

@keyframes md-four-color-linear {
  0%   { background: var(--md-progress-four-1); }
  25%  { background: var(--md-progress-four-2); }
  50%  { background: var(--md-progress-four-3); }
  75%  { background: var(--md-progress-four-4); }
}

@keyframes md-four-color-circular {
  0%   { stroke: var(--md-progress-four-1); }
  25%  { stroke: var(--md-progress-four-2); }
  50%  { stroke: var(--md-progress-four-3); }
  75%  { stroke: var(--md-progress-four-4); }
}

@media (prefers-reduced-motion: reduce) {
  .md-progress--indeterminate .md-progress__bar,
  .md-progress--circular.md-progress--indeterminate svg,
  .md-progress--circular.md-progress--indeterminate .md-progress__bar-circle {
    animation: none;
  }
  .md-progress--indeterminate .md-progress__bar {
    width: 100%;
    opacity: 0.5;
  }
}
```

## Accessibility

- ARIA: `role="progressbar"`, `aria-valuemin="0"`, `aria-valuemax="100"`
- Determinate: set `aria-valuenow` to current percentage
- Indeterminate: omit `aria-valuenow` (screen reader announces "busy")
- Label: `aria-label` describing the operation (e.g., "Uploading photo")
- Screen reader: announces progress changes; use `aria-live="polite"` on container if needed
- Do not rely on color alone -- shape (bar vs. spinner) conveys type

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Linear: full container width. Circular: 36px if space-constrained |
| 600-1024px | Default sizes |
| >1024px | Default sizes |

## Do / Don't

| Do | Don't |
|----|-------|
| Use determinate when duration is knowable | Show a stationary indicator (signals stalled) |
| Add descriptive aria-label | Use vague labels like "Loading..." |
| Switch from indeterminate to determinate when possible | Switch between linear and circular mid-operation |
| Keep indicator animated to show active processing | Remove indicator before task completes |
| Provide cancel option for long operations | Use progress for sub-second operations |
