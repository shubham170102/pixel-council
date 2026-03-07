---
name: segmented-control
description: Apple segmented control with sliding selection indicator and equal-width segments
metadata:
  tags: segmented control, segments, tabs, toggle group, picker
---

# Segmented Control -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 32px |
| Segments | 2-5 |
| Corner radius (outer) | 8px |
| Corner radius (segment) | 6px |
| Font | SF Pro, 13px, weight 600 |
| Background (light) | rgba(118,118,128,0.12) |
| Background (dark) | rgba(118,118,128,0.24) |
| CSS prefix | `.apple-segmented-control` |

## Design Tokens

```css
:root {
  --apple-seg-bg: rgba(118, 118, 128, 0.12);
  --apple-seg-selected-bg: #FFFFFF;
  --apple-seg-selected-shadow: 0 1px 3px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.06);
  --apple-seg-text: rgba(60, 60, 67, 0.6);
  --apple-seg-selected-text: #000000;
  --apple-seg-separator: rgba(60, 60, 67, 0.12);
  --apple-seg-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-seg-hover-bg: rgba(0, 0, 0, 0.03);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-seg-bg: rgba(118, 118, 128, 0.24);
    --apple-seg-selected-bg: rgba(99, 99, 102, 0.55);
    --apple-seg-selected-shadow: 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.15);
    --apple-seg-text: rgba(235, 235, 245, 0.6);
    --apple-seg-selected-text: #FFFFFF;
    --apple-seg-separator: rgba(84, 84, 88, 0.3);
    --apple-seg-focus-ring: rgba(10, 132, 255, 0.6);
    --apple-seg-hover-bg: rgba(255, 255, 255, 0.05);
  }
}

.dark {
  --apple-seg-bg: rgba(118, 118, 128, 0.24);
  --apple-seg-selected-bg: rgba(99, 99, 102, 0.55);
  --apple-seg-selected-shadow: 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.15);
  --apple-seg-text: rgba(235, 235, 245, 0.6);
  --apple-seg-selected-text: #FFFFFF;
  --apple-seg-separator: rgba(84, 84, 88, 0.3);
  --apple-seg-focus-ring: rgba(10, 132, 255, 0.6);
  --apple-seg-hover-bg: rgba(255, 255, 255, 0.05);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Text labels | 2-5 text segments (most common) |
| Icon only | SF Symbols or icon images |
| Equal width | All segments same width (default) |

## HTML Structure

```html
<!-- Segmented control with radio inputs -->
<div class="apple-segmented-control" role="radiogroup" aria-label="View options">
  <label class="apple-segmented-control__segment">
    <input type="radio" name="view" value="list" class="apple-segmented-control__input"
           aria-label="List" checked />
    <span class="apple-segmented-control__label">List</span>
  </label>
  <label class="apple-segmented-control__segment">
    <input type="radio" name="view" value="grid" class="apple-segmented-control__input"
           aria-label="Grid" />
    <span class="apple-segmented-control__label">Grid</span>
  </label>
  <label class="apple-segmented-control__segment">
    <input type="radio" name="view" value="board" class="apple-segmented-control__input"
           aria-label="Board" />
    <span class="apple-segmented-control__label">Board</span>
  </label>
  <!-- Sliding indicator (positioned via JS) -->
  <span class="apple-segmented-control__indicator" aria-hidden="true"></span>
</div>

<!-- 2-segment control -->
<div class="apple-segmented-control" role="radiogroup" aria-label="Period">
  <label class="apple-segmented-control__segment">
    <input type="radio" name="period" value="am" class="apple-segmented-control__input"
           aria-label="AM" checked />
    <span class="apple-segmented-control__label">AM</span>
  </label>
  <label class="apple-segmented-control__segment">
    <input type="radio" name="period" value="pm" class="apple-segmented-control__input"
           aria-label="PM" />
    <span class="apple-segmented-control__label">PM</span>
  </label>
  <span class="apple-segmented-control__indicator" aria-hidden="true"></span>
</div>
```

## Complete CSS

```css
.apple-segmented-control__input {
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

.apple-segmented-control {
  display: inline-flex;
  position: relative;
  height: 32px;
  background: var(--apple-seg-bg);
  border-radius: 8px;
  padding: 2px;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

/* Segment */
.apple-segmented-control__segment {
  display: flex;
  align-items: center;
  justify-content: center;
  flex: 1;
  min-width: 64px;
  padding: 0 12px;
  border-radius: 6px;
  cursor: pointer;
  z-index: 1;
  position: relative;
  transition: color 200ms;
}

.apple-segmented-control__segment:hover {
  background: var(--apple-seg-hover-bg);
}

/* Label text */
.apple-segmented-control__label {
  font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Helvetica Neue",
    Helvetica, Arial, sans-serif;
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-seg-text);
  white-space: nowrap;
  transition: color 200ms;
}

/* Selected segment label */
.apple-segmented-control__input:checked ~ .apple-segmented-control__label {
  color: var(--apple-seg-selected-text);
}

/* Sliding indicator */
.apple-segmented-control__indicator {
  position: absolute;
  top: 2px;
  bottom: 2px;
  border-radius: 6px;
  background: var(--apple-seg-selected-bg);
  box-shadow: var(--apple-seg-selected-shadow);
  transition: left 200ms cubic-bezier(0.4, 0, 0.2, 1),
              width 200ms cubic-bezier(0.4, 0, 0.2, 1);
  z-index: 0;
  pointer-events: none;
}

/* CSS-only fallback: selected segment background */
.apple-segmented-control__segment:has(.apple-segmented-control__input:checked) {
  background: var(--apple-seg-selected-bg);
  box-shadow: var(--apple-seg-selected-shadow);
}

/* Focus */
.apple-segmented-control__input:focus-visible ~ .apple-segmented-control__label {
  outline: 4px solid var(--apple-seg-focus-ring);
  outline-offset: -2px;
  border-radius: 4px;
}

/* Pressed */
.apple-segmented-control__segment:active {
  opacity: 0.7;
}

/* Disabled */
.apple-segmented-control--disabled {
  opacity: 0.4;
  pointer-events: none;
}

.apple-segmented-control__segment:has(.apple-segmented-control__input:disabled) {
  opacity: 0.4;
  cursor: not-allowed;
  pointer-events: none;
}

/* Separator between segments (hidden next to selected) */
.apple-segmented-control__segment + .apple-segmented-control__segment::before {
  content: "";
  position: absolute;
  left: 0;
  top: 6px;
  bottom: 6px;
  width: 1px;
  background: var(--apple-seg-separator);
}

.apple-segmented-control__segment:has(.apple-segmented-control__input:checked)::before,
.apple-segmented-control__segment:has(.apple-segmented-control__input:checked) + .apple-segmented-control__segment::before {
  background: transparent;
}
```

## States Reference

| State | Background | Text | Shadow | Opacity | Cursor |
|-------|-----------|------|--------|---------|--------|
| Unselected | transparent | rgba(60,60,67,0.6) | none | 1 | pointer |
| Selected | #FFFFFF | #000000 | level 1 | 1 | default |
| Hover | rgba(0,0,0,0.03) | -- | -- | 1 | pointer |
| Focus | -- | +4px blue ring | -- | 1 | pointer |
| Pressed | -- | -- | -- | 0.7 | pointer |
| Disabled | -- | -- | -- | 0.4 | not-allowed |

## Animation & Motion

```css
/* Sliding indicator animation */
.apple-segmented-control__indicator {
  transition: left 200ms cubic-bezier(0.4, 0, 0.2, 1),
              width 200ms cubic-bezier(0.4, 0, 0.2, 1);
}

/* Text color transition */
.apple-segmented-control__label {
  transition: color 200ms;
}

/* JS for indicator positioning */
/*
  const indicator = el.querySelector('.apple-segmented-control__indicator');
  const checked = el.querySelector('input:checked').closest('.apple-segmented-control__segment');
  indicator.style.left = checked.offsetLeft + 'px';
  indicator.style.width = checked.offsetWidth + 'px';
*/

@media (prefers-reduced-motion: reduce) {
  .apple-segmented-control__indicator,
  .apple-segmented-control__label {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="radiogroup"` on container, native radio inputs for each segment
- **Keyboard**: Tab to control, Arrow Left/Right between segments, Space/Enter to select
- **Focus**: 4px blue ring on focused segment
- **Touch target**: 32px height (supplemented by padding for 44px on mobile)
- **Screen reader**: Announces "option X of Y, selected/not selected"
- **Label**: `aria-label` on container describes the control purpose

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Full-width, equal segments; limit to 2-3 segments |
| 600-1024px | Intrinsic or full-width; up to 5 segments |
| >1024px | Intrinsic width; up to 5 segments |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for switching related content views | Use as navigation tabs (use tab bar) |
| Keep to 2-5 segments | Exceed 5 segments on mobile |
| Use equal-width segments | Mix text and icon segments in one control |
| Use title-case labels | Use long multi-word labels |
| Provide immediate visual feedback on selection | Require a confirm action after selection |
