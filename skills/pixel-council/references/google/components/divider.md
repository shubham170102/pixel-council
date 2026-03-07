---
name: divider
description: M3 full-width and inset horizontal/vertical dividers
metadata:
  tags: divider, separator, line, hr, section break
---

# Divider -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 1px |
| Color (light) | #CAC4D0 |
| Color (dark) | #49454F |
| Inset margin | 16px start |
| Role | Decorative separator |

## Design Tokens

```css
:root {
  --md-divider-color: #CAC4D0;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-divider-color: #49454F;
  }
}

.dark {
  --md-divider-color: #49454F;
}
```

## Variants

| Variant | Description | Margin |
|---------|-------------|--------|
| Full-width | Spans entire container | 0 |
| Inset | Indented from start | 16px left (LTR) |
| Middle inset | Indented both sides | 16px left and right |
| Vertical | Vertical separator | height: auto, width: 1px |

## HTML Structure

```html
<!-- Full-width divider -->
<hr class="md-divider" aria-hidden="true" />

<!-- Inset divider (in a list, after icon column) -->
<hr class="md-divider md-divider--inset" aria-hidden="true" />

<!-- Middle inset -->
<hr class="md-divider md-divider--middle-inset" aria-hidden="true" />

<!-- Vertical divider -->
<div class="md-divider md-divider--vertical" role="separator" aria-hidden="true"></div>

<!-- Semantic section separator -->
<hr class="md-divider" role="separator" />
```

## Complete CSS

```css
.md-divider {
  width: 100%;
  height: 1px;
  border: none;
  margin: 0;
  padding: 0;
  background: var(--md-divider-color);
  flex-shrink: 0;
}

/* Inset: 16px from start */
.md-divider--inset {
  margin-left: 16px;
  width: calc(100% - 16px);
}

[dir="rtl"] .md-divider--inset {
  margin-left: 0;
  margin-right: 16px;
}

/* Middle inset: 16px from both sides */
.md-divider--middle-inset {
  margin-left: 16px;
  margin-right: 16px;
  width: calc(100% - 32px);
}

/* Vertical */
.md-divider--vertical {
  width: 1px;
  height: auto;
  align-self: stretch;
  display: inline-block;
}
```

## States Reference

No interactive states. Dividers are purely visual.

| Property | Value |
|----------|-------|
| Opacity | 1 |
| Pointer-events | none |
| Interaction | None |

## Animation & Motion

No animations. Dividers are static elements.

## Accessibility

- ARIA: `aria-hidden="true"` for decorative dividers; `role="separator"` for semantic boundaries
- Not focusable, not interactive
- Screen reader: Ignored when `aria-hidden="true"`; announced as "separator" when `role="separator"`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Same 1px height; inset margins remain constant |

## Do / Don't

| Do | Don't |
|----|-------|
| Use to separate list items or content sections | Overuse dividers when spacing suffices |
| Use inset to align with text past icons | Use as a decorative border |
| Keep as `aria-hidden` when purely visual | Make dividers interactive |
| Use vertical variant in toolbars/button groups | Use thick or colored dividers |
