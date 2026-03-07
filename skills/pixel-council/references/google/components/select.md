---
name: select
description: M3 filled and outlined select menus (dropdowns) with option lists
metadata:
  tags: select, dropdown, picker, combo box, form, options
---

# Select (Dropdown) -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 56px |
| Corner radius | 4px (top) |
| Trailing icon | arrow_drop_down 24px |
| Menu corner radius | 4px |
| Menu item height | 48px |
| Font | Roboto, 16px/24px, weight 400 |
| CSS prefix | `.md-select` |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  /* Filled variant */
  --md-select-filled-bg: #E6E0E9;
  --md-select-filled-text: #1D1B20;
  --md-select-filled-label: #49454F;
  --md-select-filled-indicator: #79747E;
  --md-select-filled-indicator-focus: #6750A4;
  /* Outlined variant */
  --md-select-outlined-border: #79747E;
  --md-select-outlined-border-focus: #6750A4;
  --md-select-outlined-text: #1D1B20;
  --md-select-outlined-label: #49454F;
  /* Menu */
  --md-select-menu-bg: #F3EDF7;
  --md-select-menu-text: #1D1B20;
  --md-select-menu-selected: #E8DEF8;
  --md-select-menu-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  /* Trailing icon */
  --md-select-icon: #49454F;
  /* States */
  --md-select-state-hover: rgba(29, 27, 32, 0.08);
  --md-select-state-focus: rgba(29, 27, 32, 0.10);
  --md-select-disabled-bg: rgba(29, 27, 32, 0.04);
  --md-select-disabled-text: rgba(29, 27, 32, 0.38);
  --md-select-error: #B3261E;
  --md-select-error-text: #B3261E;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-select-filled-bg: #36343B;
    --md-select-filled-text: #E6E0E9;
    --md-select-filled-label: #CAC4D0;
    --md-select-filled-indicator: #938F99;
    --md-select-filled-indicator-focus: #D0BCFF;
    --md-select-outlined-border: #938F99;
    --md-select-outlined-border-focus: #D0BCFF;
    --md-select-outlined-text: #E6E0E9;
    --md-select-outlined-label: #CAC4D0;
    --md-select-menu-bg: #211F26;
    --md-select-menu-text: #E6E0E9;
    --md-select-menu-selected: #4A4458;
    --md-select-menu-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
    --md-select-icon: #CAC4D0;
    --md-select-state-hover: rgba(230, 224, 233, 0.08);
    --md-select-state-focus: rgba(230, 224, 233, 0.10);
    --md-select-disabled-bg: rgba(230, 224, 233, 0.04);
    --md-select-disabled-text: rgba(230, 224, 233, 0.38);
    --md-select-error: #F2B8B5;
    --md-select-error-text: #F2B8B5;
  }
}

.dark {
  --md-select-filled-bg: #36343B;
  --md-select-filled-text: #E6E0E9;
  --md-select-filled-label: #CAC4D0;
  --md-select-filled-indicator: #938F99;
  --md-select-filled-indicator-focus: #D0BCFF;
  --md-select-outlined-border: #938F99;
  --md-select-outlined-border-focus: #D0BCFF;
  --md-select-outlined-text: #E6E0E9;
  --md-select-outlined-label: #CAC4D0;
  --md-select-menu-bg: #211F26;
  --md-select-menu-text: #E6E0E9;
  --md-select-menu-selected: #4A4458;
  --md-select-icon: #CAC4D0;
  --md-select-state-hover: rgba(230, 224, 233, 0.08);
  --md-select-state-focus: rgba(230, 224, 233, 0.10);
  --md-select-disabled-bg: rgba(230, 224, 233, 0.04);
  --md-select-disabled-text: rgba(230, 224, 233, 0.38);
  --md-select-error: #F2B8B5;
  --md-select-error-text: #F2B8B5;
}
```

## Variants

| Variant | Container | Indicator |
|---------|-----------|-----------|
| Filled | surface-container-highest bg | Bottom border 1px |
| Outlined | Transparent bg, 1px border | Full outline border |

## HTML Structure

```html
<!-- Filled select -->
<div class="md-select md-select--filled">
  <button class="md-select__trigger" role="combobox" aria-expanded="false"
          aria-haspopup="listbox" aria-labelledby="select-label">
    <span class="md-select__label" id="select-label">Category</span>
    <span class="md-select__value">Design</span>
    <span class="md-select__icon" aria-hidden="true">arrow_drop_down</span>
  </button>
  <ul class="md-select__menu" role="listbox" aria-labelledby="select-label">
    <li class="md-select__option" role="option" aria-selected="true">Design</li>
    <li class="md-select__option" role="option" aria-selected="false">Engineering</li>
    <li class="md-select__option" role="option" aria-selected="false">Marketing</li>
  </ul>
</div>

<!-- Outlined select -->
<div class="md-select md-select--outlined">
  <button class="md-select__trigger" role="combobox" aria-expanded="false"
          aria-haspopup="listbox" aria-labelledby="select-label-2">
    <span class="md-select__label" id="select-label-2">Priority</span>
    <span class="md-select__value"></span>
    <span class="md-select__icon" aria-hidden="true">arrow_drop_down</span>
  </button>
  <ul class="md-select__menu" role="listbox" aria-labelledby="select-label-2">
    <li class="md-select__option" role="option">High</li>
    <li class="md-select__option" role="option">Medium</li>
    <li class="md-select__option" role="option">Low</li>
  </ul>
</div>
```

## Complete CSS

```css
.md-select {
  position: relative;
  display: inline-flex;
  flex-direction: column;
  min-width: 210px;
}

.md-select__trigger {
  display: flex;
  align-items: center;
  height: 56px;
  padding: 8px 12px 8px 16px;
  border: none;
  background: none;
  cursor: pointer;
  font-family: Roboto, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  letter-spacing: 0.5px;
  color: var(--md-select-filled-text);
  -webkit-tap-highlight-color: transparent;
  gap: 8px;
}

/* Filled variant */
.md-select--filled .md-select__trigger {
  background: var(--md-select-filled-bg);
  border-radius: 4px 4px 0 0;
  border-bottom: 1px solid var(--md-select-filled-indicator);
}

.md-select--filled .md-select__trigger:hover {
  background: color-mix(in srgb, var(--md-select-filled-bg), var(--md-select-state-hover));
}

.md-select--filled .md-select__trigger:focus-visible {
  border-bottom: 2px solid var(--md-select-filled-indicator-focus);
  outline: none;
}

/* Outlined variant */
.md-select--outlined .md-select__trigger {
  background: transparent;
  border: 1px solid var(--md-select-outlined-border);
  border-radius: 4px;
  color: var(--md-select-outlined-text);
}

.md-select--outlined .md-select__trigger:hover {
  border-color: var(--md-select-outlined-text);
}

.md-select--outlined .md-select__trigger:focus-visible {
  border: 2px solid var(--md-select-outlined-border-focus);
  padding: 7px 11px 7px 15px;
  outline: none;
}

/* Label (floating) */
.md-select__label {
  position: absolute;
  top: 8px;
  left: 16px;
  font-family: Roboto, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  letter-spacing: 0.4px;
  color: var(--md-select-filled-label);
  pointer-events: none;
}

/* Value text */
.md-select__value {
  flex: 1;
  text-align: left;
  margin-top: 12px;
}

/* Trailing icon */
.md-select__icon {
  font-family: "Material Symbols Outlined", sans-serif;
  font-size: 24px;
  color: var(--md-select-icon);
  transition: transform 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-select[aria-expanded="true"] .md-select__icon,
.md-select__trigger[aria-expanded="true"] ~ .md-select__icon {
  transform: rotate(180deg);
}

/* Dropdown menu */
.md-select__menu {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  margin: 0;
  padding: 8px 0;
  list-style: none;
  background: var(--md-select-menu-bg);
  border-radius: 4px;
  box-shadow: var(--md-select-menu-shadow);
  z-index: 100;
  max-height: 0;
  overflow: hidden;
  opacity: 0;
  transform: scaleY(0.8);
  transform-origin: top;
  transition: max-height 200ms cubic-bezier(0.05, 0.7, 0.1, 1),
              opacity 150ms cubic-bezier(0.2, 0, 0, 1),
              transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

.md-select__trigger[aria-expanded="true"] + .md-select__menu {
  max-height: 300px;
  overflow-y: auto;
  opacity: 1;
  transform: scaleY(1);
}

/* Menu item */
.md-select__option {
  display: flex;
  align-items: center;
  height: 48px;
  padding: 0 16px;
  font-family: Roboto, sans-serif;
  font-size: 16px;
  font-weight: 400;
  line-height: 24px;
  letter-spacing: 0.5px;
  color: var(--md-select-menu-text);
  cursor: pointer;
  transition: background-color 150ms;
}

.md-select__option:hover {
  background: var(--md-select-state-hover);
}

.md-select__option[aria-selected="true"] {
  background: var(--md-select-menu-selected);
}

/* Disabled */
.md-select--disabled .md-select__trigger {
  background: var(--md-select-disabled-bg);
  color: var(--md-select-disabled-text);
  cursor: not-allowed;
  pointer-events: none;
}

.md-select--disabled .md-select__icon {
  color: var(--md-select-disabled-text);
}

/* Error */
.md-select--error .md-select__trigger {
  border-bottom-color: var(--md-select-error);
}

.md-select--error .md-select__label {
  color: var(--md-select-error-text);
}

.md-select--outlined.md-select--error .md-select__trigger {
  border-color: var(--md-select-error);
}
```

## States Reference

| State | Container | Indicator | Icon | Cursor |
|-------|-----------|-----------|------|--------|
| Default | #E6E0E9 | #79747E 1px | #49454F | pointer |
| Hover | +8% state layer | #1D1B20 1px | -- | pointer |
| Focus | -- | #6750A4 2px | -- | pointer |
| Open | -- | #6750A4 2px | rotated 180deg | pointer |
| Disabled | 4% on-surface | 38% opacity | 38% opacity | not-allowed |
| Error | -- | #B3261E | -- | pointer |

## Animation & Motion

```css
/* Menu open/close */
.md-select__menu {
  transition: max-height 200ms cubic-bezier(0.05, 0.7, 0.1, 1),
              opacity 150ms cubic-bezier(0.2, 0, 0, 1),
              transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

/* Icon rotation */
.md-select__icon {
  transition: transform 200ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-select__menu,
  .md-select__icon {
    transition-duration: 0ms;
  }
}
```

## Accessibility

- **ARIA**: `role="combobox"` on trigger, `aria-expanded`, `aria-haspopup="listbox"`, `role="listbox"` on menu, `role="option"` + `aria-selected` on items
- **Keyboard**: Tab to focus, Enter/Space to open, Arrow keys to navigate options, Enter to select, Escape to close
- **Focus**: Visible indicator change (2px border)
- **Touch target**: 56px height meets minimum
- **Screen reader**: Announces selected value, expanded/collapsed state, option count

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Full-width select, menu overlays content |
| >=600px | Intrinsic width based on content or min-width |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for 4+ options | Use for 2-3 options (use radio buttons) |
| Show a default selection or placeholder | Leave the select empty with no indication |
| Use supporting text for guidance | Rely only on label for validation errors |
| Group related options logically | Mix unrelated options in one dropdown |
