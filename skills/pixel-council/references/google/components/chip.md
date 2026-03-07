---
name: chip
description: M3 assist, filter, input, suggestion chip variants with trailing icons
metadata:
  tags: chip, tag, badge, filter, label, pill
---

# Chip -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 32px |
| Padding (text only) | 8px 16px |
| Padding (with icon) | 8px trailing, 8px leading |
| Corner radius | 8px |
| Border (outlined) | 1px solid #79747E |
| Font | Roboto, 14px/20px, weight 500 |
| Icon size | 18px |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-chip-bg: transparent;
  --md-chip-text: #1D1B20;
  --md-chip-icon: #49454F;
  --md-chip-border: #79747E;
  --md-chip-hover: rgba(29, 27, 32, 0.08);
  --md-chip-focus: rgba(29, 27, 32, 0.10);
  --md-chip-pressed: rgba(29, 27, 32, 0.10);
  --md-chip-selected-bg: #E8DEF8;
  --md-chip-selected-text: #1D192B;
  --md-chip-elevated-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-chip-bg: transparent;
    --md-chip-text: #E6E0E9;
    --md-chip-icon: #CAC4D0;
    --md-chip-border: #938F99;
    --md-chip-hover: rgba(230, 224, 233, 0.08);
    --md-chip-focus: rgba(230, 224, 233, 0.10);
    --md-chip-pressed: rgba(230, 224, 233, 0.10);
    --md-chip-selected-bg: #4A4458;
    --md-chip-selected-text: #E8DEF8;
    --md-chip-elevated-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
  }
}

.dark {
  --md-chip-bg: transparent;
  --md-chip-text: #E6E0E9;
  --md-chip-icon: #CAC4D0;
  --md-chip-border: #938F99;
  --md-chip-hover: rgba(230, 224, 233, 0.08);
  --md-chip-focus: rgba(230, 224, 233, 0.10);
  --md-chip-pressed: rgba(230, 224, 233, 0.10);
  --md-chip-selected-bg: #4A4458;
  --md-chip-selected-text: #E8DEF8;
  --md-chip-elevated-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
}
```

## Variants

| Type | Selectable | Removable | Leading | Description |
|------|-----------|-----------|---------|-------------|
| Assist | No | No | Icon (optional) | Triggers smart actions |
| Filter | Yes (toggle) | No | Check when selected | Filters content |
| Input | No | Yes (trailing X) | Avatar or icon | User-entered data |
| Suggestion | No | No | None | Dynamic suggestions |
| Elevated | -- | -- | -- | Shadow instead of border, any type |

## HTML Structure

```html
<!-- Chip group (scrollable row) -->
<div class="md-chip-group" role="listbox" aria-label="Filter options">
  <!-- Assist chip -->
  <button class="md-chip md-chip--assist" role="option">
    <svg class="md-chip__icon" aria-hidden="true" width="18" height="18"><!-- icon --></svg>
    <span class="md-chip__label">Assist</span>
  </button>

  <!-- Filter chip (unselected) -->
  <button class="md-chip md-chip--filter" role="option" aria-selected="false">
    <span class="md-chip__check" aria-hidden="true">
      <svg width="18" height="18"><!-- check --></svg>
    </span>
    <span class="md-chip__label">Filter</span>
  </button>

  <!-- Filter chip (selected) -->
  <button class="md-chip md-chip--filter md-chip--selected" role="option" aria-selected="true">
    <span class="md-chip__check md-chip__check--visible" aria-hidden="true">
      <svg width="18" height="18"><!-- check --></svg>
    </span>
    <span class="md-chip__label">Selected</span>
  </button>

  <!-- Input chip with avatar -->
  <span class="md-chip md-chip--input" role="option">
    <img class="md-chip__avatar" src="user.jpg" alt="" width="24" height="24" />
    <span class="md-chip__label">Jane Doe</span>
    <button class="md-chip__remove" aria-label="Remove Jane Doe">
      <svg width="18" height="18" aria-hidden="true"><!-- close --></svg>
    </button>
  </span>

  <!-- Suggestion chip -->
  <button class="md-chip md-chip--suggestion" role="option">
    <span class="md-chip__label">Suggestion</span>
  </button>
</div>
```

## Complete CSS

```css
.md-chip-group {
  display: flex;
  flex-wrap: nowrap;
  gap: 8px;
  overflow-x: auto;
  padding: 4px 0;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
}
.md-chip-group::-webkit-scrollbar { display: none; }

.md-chip {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 32px;
  padding: 0 16px;
  border: 1px solid var(--md-chip-border);
  border-radius: 8px;
  background: var(--md-chip-bg);
  color: var(--md-chip-text);
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  cursor: pointer;
  white-space: nowrap;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms cubic-bezier(0.2, 0, 0, 1),
              border-color 150ms cubic-bezier(0.2, 0, 0, 1);
}

/* Icon padding adjustments */
.md-chip:has(.md-chip__icon),
.md-chip:has(.md-chip__avatar),
.md-chip:has(.md-chip__check) { padding-left: 8px; }
.md-chip:has(.md-chip__remove) { padding-right: 8px; }

/* States */
.md-chip:hover { background: var(--md-chip-hover); }
.md-chip:focus-visible { background: var(--md-chip-focus); outline: none; }
.md-chip:active { background: var(--md-chip-pressed); }
.md-chip[aria-disabled="true"],
.md-chip:disabled {
  opacity: 0.38;
  pointer-events: none;
  cursor: default;
}

/* Selected (filter) */
.md-chip--selected {
  background: var(--md-chip-selected-bg);
  color: var(--md-chip-selected-text);
  border-color: transparent;
}
.md-chip--selected:hover {
  background: var(--md-chip-selected-bg);
  box-shadow: inset 0 0 0 100px var(--md-chip-hover);
}

/* Elevated */
.md-chip--elevated {
  border-color: transparent;
  box-shadow: var(--md-chip-elevated-shadow);
}

/* Inner elements */
.md-chip__label { flex: 1; min-width: 0; }
.md-chip__icon { width: 18px; height: 18px; flex-shrink: 0; color: var(--md-chip-icon); fill: currentColor; }
.md-chip__avatar {
  width: 24px; height: 24px; border-radius: 9999px;
  object-fit: cover; flex-shrink: 0;
}
.md-chip__check {
  width: 0; height: 18px; overflow: hidden; flex-shrink: 0;
  color: var(--md-chip-selected-text); fill: currentColor;
  transition: width 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.md-chip__check--visible { width: 18px; }
.md-chip__remove {
  display: flex; align-items: center; justify-content: center;
  width: 18px; height: 18px; padding: 0; border: none;
  background: none; color: var(--md-chip-icon); fill: currentColor;
  cursor: pointer; border-radius: 9999px;
}
.md-chip__remove:hover { background: var(--md-chip-hover); }

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .md-chip { border-color: var(--md-chip-border); color: var(--md-chip-text); }
}
.dark .md-chip { border-color: var(--md-chip-border); color: var(--md-chip-text); }

@media (prefers-reduced-motion: reduce) {
  .md-chip, .md-chip__check { transition: none; }
}
```

## States Reference

| State | Background | Border | Text | Opacity |
|-------|-----------|--------|------|---------|
| Default | transparent | #79747E | #1D1B20 | 1 |
| Hover | on-surface 8% | #79747E | #1D1B20 | 1 |
| Focus | on-surface 10% | #1D1B20 | #1D1B20 | 1 |
| Active | on-surface 10% | #79747E | #1D1B20 | 1 |
| Selected | #E8DEF8 | transparent | #1D192B | 1 |
| Disabled | transparent | #1D1B20 | #1D1B20 | 0.38 |

## Animation & Motion

```css
/* Check icon reveal on filter chip selection */
.md-chip__check {
  width: 0;
  overflow: hidden;
  transition: width 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.md-chip__check--visible { width: 18px; }

/* Background transition */
.md-chip {
  transition: background-color 150ms cubic-bezier(0.2, 0, 0, 1),
              border-color 150ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-chip, .md-chip__check { transition: none; }
}
```

## Accessibility

- Chip group: `role="listbox"` with `aria-label`
- Individual chips: `role="option"`
- Filter chips: `aria-selected="true/false"` to indicate toggle state
- Input chips (removable): remove button has `aria-label="Remove [chip name]"`
- Keyboard: Tab to enter group, Arrow Left/Right between chips, Enter/Space to toggle/activate, Delete/Backspace to remove input chips
- Focus: visible background state layer, no outline override
- Touch target: 32px height (below 48px min); ensure adequate spacing in chip group
- Screen reader: announce chip label and selected state

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Horizontal scroll, single row |
| 600-1024px | Wrap to multiple rows or scroll |
| > 1024px | Wrap to multiple rows |

## Do / Don't

| Do | Don't |
|----|-------|
| Place chips in a chip group container | Use standalone chips outside a group |
| Use filter chips for multi-select filtering | Use filter chips for single-select (use radio or segmented) |
| Keep chip labels short (1-2 words) | Use long sentences as chip labels |
| Show check icon on selected filter chips | Rely on color alone to indicate selection |
| Use input chips for user-generated tags | Use input chips for predefined options |
