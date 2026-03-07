---
name: badge
description: M3 small dot and large numbered badge overlays for notifications
metadata:
  tags: badge, notification, count, indicator, dot, unread
---

# Badge -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Small (dot) size | 6px circle |
| Large height | 16px min-height |
| Large min-width | 16px |
| Large padding | 0 4px |
| Corner radius | 9999px (full) |
| Background (light) | #B3261E |
| Background (dark) | #F2B8B5 |
| Text color (light) | #FFFFFF |
| Text color (dark) | #601410 |
| Font | Roboto, 11px/16px, weight 500 |

## Design Tokens

```css
:root {
  --md-badge-bg: #B3261E;
  --md-badge-text: #FFFFFF;
  --md-badge-dot-size: 6px;
  --md-badge-large-height: 16px;
  --md-badge-large-min-width: 16px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-badge-bg: #F2B8B5;
    --md-badge-text: #601410;
  }
}

.dark {
  --md-badge-bg: #F2B8B5;
  --md-badge-text: #601410;
}
```

## Variants

| Variant | Size | Content | Use Case |
|---------|------|---------|----------|
| Small (dot) | 6x6px | None | Boolean status (new/unread) |
| Large (count) | 16px height, 16px+ width | Number text | Numeric count |

## HTML Structure

```html
<!-- Parent must be position: relative -->
<div class="md-badge-wrapper" style="position: relative; display: inline-flex;">
  <button class="md-icon-button" aria-label="Notifications, 3 unread">
    <svg width="24" height="24" aria-hidden="true"><!-- bell icon --></svg>
  </button>
  <!-- Large badge with count -->
  <span class="md-badge" aria-hidden="true">3</span>
</div>

<!-- Small dot badge -->
<div class="md-badge-wrapper" style="position: relative; display: inline-flex;">
  <button class="md-icon-button" aria-label="Messages, new available">
    <svg width="24" height="24" aria-hidden="true"><!-- mail icon --></svg>
  </button>
  <span class="md-badge md-badge--dot" aria-hidden="true"></span>
</div>
```

## Complete CSS

```css
.md-badge-wrapper {
  position: relative;
  display: inline-flex;
}

/* Large badge (count) */
.md-badge {
  position: absolute;
  top: 2px;
  right: 2px;
  min-width: var(--md-badge-large-min-width);
  height: var(--md-badge-large-height);
  padding: 0 4px;
  border-radius: 9999px;
  background: var(--md-badge-bg);
  color: var(--md-badge-text);
  font-family: Roboto, sans-serif;
  font-size: 11px;
  font-weight: 500;
  line-height: 16px;
  letter-spacing: 0.5px;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
  pointer-events: none;
  z-index: 1;
  box-sizing: border-box;
}

/* Small dot badge */
.md-badge--dot {
  min-width: var(--md-badge-dot-size);
  width: var(--md-badge-dot-size);
  height: var(--md-badge-dot-size);
  padding: 0;
  top: 6px;
  right: 6px;
  font-size: 0;
}
```

## States Reference

Badges are decorative/informational -- no interactive states.

| Property | Value |
|----------|-------|
| Opacity | 1 (always visible) |
| Cursor | none (inherits parent) |
| Pointer-events | none |
| Interaction | Parent element handles all interaction |

## Animation & Motion

```css
/* Entry animation */
@keyframes md-badge-enter {
  from { transform: scale(0); }
  to { transform: scale(1); }
}

.md-badge[data-animate] {
  animation: md-badge-enter 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-badge[data-animate] {
    animation: none;
  }
}
```

## Accessibility

- ARIA: Badge element uses `aria-hidden="true"` (decorative)
- Screen reader: Count communicated via parent's `aria-label` (e.g., "Notifications, 3 unread")
- Not interactive: No focus, no keyboard, no touch target
- High contrast: Error color on white/dark backgrounds ensures sufficient contrast

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Same sizing; positioned relative to parent icon |
| Dense layouts | Badge may shift slightly with smaller parent icon containers |

## Do / Don't

| Do | Don't |
|----|-------|
| Use dot for boolean new/unread status | Use badge on non-interactive decorative icons |
| Cap numbers at "999+" | Display raw large numbers |
| Communicate count via parent `aria-label` | Rely on badge alone for screen reader info |
| Position on top-right of icon | Place badge far from its associated element |
