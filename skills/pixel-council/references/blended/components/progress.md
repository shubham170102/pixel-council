---
name: progress
description: Blended linear and circular progress with determinate and indeterminate states
metadata:
  tags: progress, loading, spinner, progress bar, indeterminate
---

# Progress Indicators -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Bar height | 4px |
| Bar border-radius | 2px |
| Spinner default | 24px |
| Spinner small | 16px |
| Spinner large | 40px |
| Track color (light) | rgba(118, 118, 128, 0.12) |
| Active color (light) | #6750A4 |
| Active color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --progress-track: rgba(118, 118, 128, 0.12);
  --progress-active: #6750A4;
  --progress-radius: 2px;
  --progress-skeleton-bg: #F3EDF7;
  --progress-skeleton-shine: rgba(255, 255, 255, 0.6);
}

@media (prefers-color-scheme: dark) {
  :root {
    --progress-track: rgba(118, 118, 128, 0.24);
    --progress-active: #D0BCFF;
    --progress-skeleton-bg: #211F26;
    --progress-skeleton-shine: rgba(255, 255, 255, 0.08);
  }
}

.dark {
  --progress-track: rgba(118, 118, 128, 0.24);
  --progress-active: #D0BCFF;
  --progress-skeleton-bg: #211F26;
  --progress-skeleton-shine: rgba(255, 255, 255, 0.08);
}
```

## Variants

| Variant | Type | Description |
|---------|------|-------------|
| Bar determinate | Linear | Fills left-to-right based on value |
| Bar indeterminate | Linear | Animated sliding segment |
| Spinner | Circular | Rotating indicator, 3 sizes |
| Skeleton | Placeholder | Shimmer loading placeholder |

## HTML Structure

```html
<!-- Linear determinate -->
<div class="progress progress--bar" role="progressbar"
  aria-label="Uploading" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
  <div class="progress__track">
    <div class="progress__fill" style="width: 45%"></div>
  </div>
</div>

<!-- Linear indeterminate -->
<div class="progress progress--bar progress--indeterminate" role="progressbar"
  aria-label="Loading">
  <div class="progress__track">
    <div class="progress__fill"></div>
  </div>
</div>

<!-- Spinner (default 24px) -->
<div class="progress progress--spinner" role="progressbar" aria-label="Loading">
  <svg viewBox="0 0 24 24">
    <circle class="progress__spinner-track" cx="12" cy="12" r="10" />
    <circle class="progress__spinner-arc" cx="12" cy="12" r="10" />
  </svg>
</div>

<!-- Spinner small -->
<div class="progress progress--spinner progress--sm" role="progressbar" aria-label="Loading">
  <svg viewBox="0 0 16 16">
    <circle class="progress__spinner-track" cx="8" cy="8" r="6" />
    <circle class="progress__spinner-arc" cx="8" cy="8" r="6" />
  </svg>
</div>

<!-- Spinner large -->
<div class="progress progress--spinner progress--lg" role="progressbar" aria-label="Loading">
  <svg viewBox="0 0 40 40">
    <circle class="progress__spinner-track" cx="20" cy="20" r="18" />
    <circle class="progress__spinner-arc" cx="20" cy="20" r="18" />
  </svg>
</div>

<!-- Skeleton -->
<div class="progress progress--skeleton" aria-hidden="true">
  <div class="progress__skeleton-line" style="width: 100%"></div>
  <div class="progress__skeleton-line" style="width: 80%"></div>
  <div class="progress__skeleton-line" style="width: 60%"></div>
</div>
```

## Complete CSS

```css
/* Linear bar */
.progress--bar {
  width: 100%;
  height: 4px;
}
.progress__track {
  width: 100%;
  height: 100%;
  background: var(--progress-track);
  border-radius: var(--progress-radius);
  overflow: hidden;
  position: relative;
}
.progress__fill {
  height: 100%;
  background: var(--progress-active);
  border-radius: var(--progress-radius);
  transition: width 250ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}

/* Indeterminate bar */
.progress--indeterminate .progress__fill {
  width: 40%;
  position: absolute;
  animation: progress-bar-slide 1.8s cubic-bezier(0.65, 0, 0.35, 1) infinite;
}

/* Spinner */
.progress--spinner {
  width: 24px;
  height: 24px;
  display: inline-block;
}
.progress--sm { width: 16px; height: 16px; }
.progress--lg { width: 40px; height: 40px; }

.progress--spinner svg {
  width: 100%;
  height: 100%;
  animation: progress-spinner-rotate 1.2s linear infinite;
}
.progress__spinner-track {
  fill: none;
  stroke: var(--progress-track);
  stroke-width: 2.5;
}
.progress__spinner-arc {
  fill: none;
  stroke: var(--progress-active);
  stroke-width: 2.5;
  stroke-linecap: round;
  stroke-dasharray: 20, 60;
  animation: progress-spinner-dash 1.2s ease-in-out infinite;
}

/* Skeleton */
.progress--skeleton {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.progress__skeleton-line {
  height: 14px;
  background: var(--progress-skeleton-bg);
  border-radius: 4px;
  position: relative;
  overflow: hidden;
}
.progress__skeleton-line::after {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(
    90deg, transparent 0%, var(--progress-skeleton-shine) 50%, transparent 100%
  );
  animation: progress-shimmer 1.5s ease-in-out infinite;
  background-size: 200% 100%;
}

/* Skeleton shapes */
.progress__skeleton-circle {
  border-radius: 50%;
  aspect-ratio: 1;
}
.progress__skeleton-rect {
  border-radius: 4px;
  aspect-ratio: 16/9;
}
```

## Animation & Motion

```css
@keyframes progress-bar-slide {
  0%   { left: -40%; width: 40%; }
  50%  { left: 30%; width: 30%; }
  100% { left: 100%; width: 10%; }
}

@keyframes progress-spinner-rotate {
  from { transform: rotate(0deg); }
  to   { transform: rotate(360deg); }
}

@keyframes progress-spinner-dash {
  0%   { stroke-dasharray: 1, 60; stroke-dashoffset: 0; }
  50%  { stroke-dasharray: 30, 60; stroke-dashoffset: -10; }
  100% { stroke-dasharray: 1, 60; stroke-dashoffset: -50; }
}

@keyframes progress-shimmer {
  0%   { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}

@media (prefers-reduced-motion: reduce) {
  .progress--indeterminate .progress__fill,
  .progress--spinner svg,
  .progress__spinner-arc,
  .progress__skeleton-line::after {
    animation: none;
  }
  .progress--indeterminate .progress__fill {
    width: 100%;
    opacity: 0.5;
  }
  .progress__skeleton-line::after {
    display: none;
  }
}
```

## Accessibility

- ARIA: `role="progressbar"`, `aria-valuemin="0"`, `aria-valuemax="100"`
- Determinate: set `aria-valuenow` to current percentage
- Indeterminate: omit `aria-valuenow`; screen reader announces "busy"
- Spinner: `aria-label` describing the operation
- Skeleton: `aria-hidden="true"` (decorative placeholder, not interactive)
- Do not rely on color alone; bar vs. spinner shape conveys type
- Announce completion to screen reader when task finishes

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Bar: full width. Spinner: 16px (small) for inline use |
| 600-1024px | Default sizes |
| >1024px | Default sizes |

## Do / Don't

| Do | Don't |
|----|-------|
| Use determinate when duration is knowable | Show a static/frozen indicator |
| Use skeleton for initial page loads | Mix bar and spinner mid-operation |
| Provide cancel for long operations | Use progress for sub-second operations |
| Switch from indeterminate to determinate when possible | Use spinners without aria-label |
| Match skeleton shapes to the content they replace | Animate skeleton without prefers-reduced-motion check |
