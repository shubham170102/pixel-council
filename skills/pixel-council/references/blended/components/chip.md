---
name: chip
description: Blended chip/tag with filter, input, and suggestion variants
metadata:
  tags: chip, tag, badge, filter, label, pill
---

# Chip -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 32px |
| Padding | 8px 16px (text), 8px (with icon/remove) |
| Corner radius | 8px |
| Border | 1px solid outline |
| Font | 14px/20px, weight 500 |
| Icon size | 18px |
| Remove button | 18px |
| Selected color (light) | #E8DEF8 |
| Selected color (dark) | #4A4458 |

## Design Tokens

```css
:root {
  --chip-bg: transparent;
  --chip-text: #1D1B20;
  --chip-icon: #49454F;
  --chip-border: #79747E;
  --chip-hover: rgba(29, 27, 32, 0.06);
  --chip-focus: rgba(29, 27, 32, 0.10);
  --chip-active: rgba(29, 27, 32, 0.10);
  --chip-selected-bg: #E8DEF8;
  --chip-selected-text: #1D192B;
  --chip-selected-check: #1D192B;
  --chip-choice-bg: #6750A4;
  --chip-choice-text: #FFFFFF;
}

@media (prefers-color-scheme: dark) {
  :root {
    --chip-bg: transparent;
    --chip-text: #E6E0E9;
    --chip-icon: #CAC4D0;
    --chip-border: #938F99;
    --chip-hover: rgba(230, 224, 233, 0.06);
    --chip-focus: rgba(230, 224, 233, 0.10);
    --chip-active: rgba(230, 224, 233, 0.10);
    --chip-selected-bg: #4A4458;
    --chip-selected-text: #E8DEF8;
    --chip-selected-check: #E8DEF8;
    --chip-choice-bg: #D0BCFF;
    --chip-choice-text: #381E72;
  }
}

.dark {
  --chip-bg: transparent;
  --chip-text: #E6E0E9;
  --chip-icon: #CAC4D0;
  --chip-border: #938F99;
  --chip-hover: rgba(230, 224, 233, 0.06);
  --chip-focus: rgba(230, 224, 233, 0.10);
  --chip-active: rgba(230, 224, 233, 0.10);
  --chip-selected-bg: #4A4458;
  --chip-selected-text: #E8DEF8;
  --chip-selected-check: #E8DEF8;
  --chip-choice-bg: #D0BCFF;
  --chip-choice-text: #381E72;
}
```

## Variants

| Type | Selectable | Removable | Behavior |
|------|-----------|-----------|----------|
| Action | No | No | Triggers an action (compact button) |
| Filter | Yes (toggle) | No | Multi-select, check icon when active |
| Input | No | Yes (trailing X) | User-generated data, removable |
| Choice | Yes (single) | No | Single-select group (radio-like) |

## HTML Structure

```html
<!-- Chip group (horizontal scroll) -->
<div class="chip-group" role="listbox" aria-label="Filter by category">
  <!-- Action chip -->
  <button class="chip chip--action" role="option">
    <svg class="chip__icon" aria-hidden="true" width="18" height="18"><!-- icon --></svg>
    <span class="chip__label">Share</span>
  </button>

  <!-- Filter chip (unselected) -->
  <button class="chip chip--filter" role="option" aria-selected="false">
    <span class="chip__check" aria-hidden="true">
      <svg width="18" height="18"><!-- check --></svg>
    </span>
    <span class="chip__label">Photos</span>
  </button>

  <!-- Filter chip (selected) -->
  <button class="chip chip--filter chip--selected" role="option" aria-selected="true">
    <span class="chip__check chip__check--visible" aria-hidden="true">
      <svg width="18" height="18"><!-- check --></svg>
    </span>
    <span class="chip__label">Videos</span>
  </button>

  <!-- Input chip (removable) -->
  <span class="chip chip--input" role="option">
    <img class="chip__avatar" src="user.jpg" alt="" width="24" height="24" />
    <span class="chip__label">Jane Doe</span>
    <button class="chip__remove" aria-label="Remove Jane Doe">
      <svg width="18" height="18" aria-hidden="true"><!-- close --></svg>
    </button>
  </span>
</div>

<!-- Choice chip group (single select) -->
<div class="chip-group chip-group--choice" role="radiogroup" aria-label="Size">
  <button class="chip chip--choice" role="radio" aria-checked="false">
    <span class="chip__label">Small</span>
  </button>
  <button class="chip chip--choice chip--selected" role="radio" aria-checked="true">
    <span class="chip__label">Medium</span>
  </button>
  <button class="chip chip--choice" role="radio" aria-checked="false">
    <span class="chip__label">Large</span>
  </button>
</div>
```

## Complete CSS

```css
.chip-group {
  display: flex;
  flex-wrap: nowrap;
  gap: 8px;
  overflow-x: auto;
  padding: 4px 0;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
}
.chip-group::-webkit-scrollbar { display: none; }
.chip-group--wrap { flex-wrap: wrap; overflow-x: visible; }

.chip {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 32px;
  padding: 0 16px;
  border: 1px solid var(--chip-border);
  border-radius: 8px;
  background: var(--chip-bg);
  color: var(--chip-text);
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  cursor: pointer;
  white-space: nowrap;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms ease, border-color 150ms ease;
}

/* Padding with leading/trailing elements */
.chip:has(.chip__icon),
.chip:has(.chip__avatar),
.chip:has(.chip__check) { padding-left: 8px; }
.chip:has(.chip__remove) { padding-right: 8px; }

/* States */
.chip:hover { background: var(--chip-hover); }
.chip:focus-visible {
  background: var(--chip-focus);
  outline: 2px solid #6750A4;
  outline-offset: 1px;
}
.chip:active { background: var(--chip-active); }
.chip:disabled, .chip[aria-disabled="true"] {
  opacity: 0.38; pointer-events: none; cursor: default;
}

/* Selected (filter) */
.chip--selected {
  background: var(--chip-selected-bg);
  color: var(--chip-selected-text);
  border-color: transparent;
}
.chip--selected:hover {
  background: var(--chip-selected-bg);
  box-shadow: inset 0 0 0 100px var(--chip-hover);
}

/* Choice (single-select, filled) */
.chip--choice.chip--selected {
  background: var(--chip-choice-bg);
  color: var(--chip-choice-text);
  border-color: transparent;
}

/* Inner elements */
.chip__label { flex: 1; min-width: 0; }
.chip__icon { width: 18px; height: 18px; flex-shrink: 0; color: var(--chip-icon); fill: currentColor; }
.chip__avatar {
  width: 24px; height: 24px; border-radius: 9999px;
  object-fit: cover; flex-shrink: 0;
}
.chip__check {
  width: 0; height: 18px; overflow: hidden; flex-shrink: 0;
  color: var(--chip-selected-check); fill: currentColor;
  transition: width 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.chip__check--visible { width: 18px; }
.chip__remove {
  display: flex; align-items: center; justify-content: center;
  width: 18px; height: 18px; padding: 0; border: none;
  background: none; color: var(--chip-icon); fill: currentColor;
  cursor: pointer; border-radius: 9999px;
  transition: background-color 100ms ease;
}
.chip__remove:hover { background: var(--chip-hover); }

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .chip { border-color: var(--chip-border); color: var(--chip-text); }
}
.dark .chip { border-color: var(--chip-border); color: var(--chip-text); }

@media (prefers-reduced-motion: reduce) {
  .chip, .chip__check, .chip__remove { transition: none; }
}
```

## States Reference

| State | Background | Border | Text | Opacity |
|-------|-----------|--------|------|---------|
| Default | transparent | #79747E | #1D1B20 | 1 |
| Hover | on-surface 6% | #79747E | #1D1B20 | 1 |
| Focus | on-surface 10% + ring | #79747E | #1D1B20 | 1 |
| Active | on-surface 10% | #79747E | #1D1B20 | 1 |
| Selected (filter) | #E8DEF8 | transparent | #1D192B | 1 |
| Selected (choice) | #6750A4 | transparent | #FFFFFF | 1 |
| Disabled | transparent | #79747E | #1D1B20 | 0.38 |

## Animation & Motion

```css
/* Check icon reveal */
.chip__check {
  width: 0; overflow: hidden;
  transition: width 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.chip__check--visible { width: 18px; }

/* Background transition */
.chip {
  transition: background-color 150ms ease, border-color 150ms ease;
}

@media (prefers-reduced-motion: reduce) {
  .chip, .chip__check { transition: none; }
}
```

## Accessibility

- Filter group: `role="listbox"` with `aria-label`, chips as `role="option"` with `aria-selected`
- Choice group: `role="radiogroup"` with `aria-label`, chips as `role="radio"` with `aria-checked`
- Input chips: remove button has `aria-label="Remove [name]"`
- Keyboard: Tab to enter group, Arrow Left/Right between chips, Enter/Space to toggle, Delete/Backspace to remove input chips
- Focus: 2px solid primary outline
- Screen reader: announce label, selected state, and group context
- Touch target: 32px height; ensure 8px gap between chips for touch accuracy

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Single-row horizontal scroll |
| 600-1024px | Wrap to multiple rows or scroll |
| > 1024px | Wrap to multiple rows (use `.chip-group--wrap`) |

## Do / Don't

| Do | Don't |
|----|-------|
| Use filter chips for multi-select, choice chips for single-select | Use filter chips where radio/choice behavior is needed |
| Keep labels short (1-2 words) | Write sentences as chip labels |
| Show check animation on filter selection | Rely on color alone to show selection |
| Use input chips for user-entered tags | Use input chips for static options |
| Group chips in a dedicated container | Scatter standalone chips across the page |
| Provide keyboard navigation in chip groups | Make chips only mouse-accessible |
