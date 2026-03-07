---
name: menu
description: M3 dropdown menu with menu items, dividers, icons, and nested submenus
metadata:
  tags: menu, dropdown, context menu, popup menu, options
---

# Menu -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Min width | 112px |
| Max width | 280px |
| Item height | 48px |
| Item padding | 12px vertical, 16px horizontal |
| Corner radius | 4px |
| Elevation | Level 2 |
| Font | Roboto, 14px/20px, weight 500 |
| Background (light) | #F3EDF7 |
| Background (dark) | #211F26 |

## Design Tokens

```css
:root {
  --md-menu-bg: #F3EDF7;
  --md-menu-text: #1D1B20;
  --md-menu-icon: #49454F;
  --md-menu-divider: #CAC4D0;
  --md-menu-hover: rgba(29, 27, 32, 0.08);
  --md-menu-focus: rgba(29, 27, 32, 0.10);
  --md-menu-pressed: rgba(29, 27, 32, 0.10);
  --md-menu-selected-bg: rgba(103, 80, 164, 0.08);
  --md-menu-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-menu-bg: #211F26;
    --md-menu-text: #E6E0E9;
    --md-menu-icon: #CAC4D0;
    --md-menu-divider: #49454F;
    --md-menu-hover: rgba(230, 224, 233, 0.08);
    --md-menu-focus: rgba(230, 224, 233, 0.10);
    --md-menu-pressed: rgba(230, 224, 233, 0.10);
    --md-menu-selected-bg: rgba(208, 188, 255, 0.08);
    --md-menu-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  }
}

.dark {
  --md-menu-bg: #211F26;
  --md-menu-text: #E6E0E9;
  --md-menu-icon: #CAC4D0;
  --md-menu-divider: #49454F;
  --md-menu-hover: rgba(230, 224, 233, 0.08);
  --md-menu-focus: rgba(230, 224, 233, 0.10);
  --md-menu-pressed: rgba(230, 224, 233, 0.10);
  --md-menu-selected-bg: rgba(208, 188, 255, 0.08);
  --md-menu-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Standard | Basic menu with items |
| With icons | Leading icons on items |
| With trailing | Trailing text (shortcut) or icon |
| With dividers | Grouped sections separated by dividers |
| Submenu | Nested menu with arrow indicator |
| With selection | Check icon on selected item |

## HTML Structure

```html
<!-- Standard menu -->
<div class="md-menu" role="menu" aria-label="Options" tabindex="-1">
  <button class="md-menu__item" role="menuitem" tabindex="0">
    <svg class="md-menu__icon" aria-hidden="true" width="24" height="24"><!-- icon --></svg>
    <span class="md-menu__label">Cut</span>
    <span class="md-menu__trailing">Cmd+X</span>
  </button>
  <button class="md-menu__item" role="menuitem" tabindex="-1">
    <svg class="md-menu__icon" aria-hidden="true" width="24" height="24"><!-- icon --></svg>
    <span class="md-menu__label">Copy</span>
    <span class="md-menu__trailing">Cmd+C</span>
  </button>
  <div class="md-menu__divider" role="separator"></div>
  <button class="md-menu__item" role="menuitem" tabindex="-1">
    <span class="md-menu__label">Paste</span>
  </button>
</div>

<!-- With selection -->
<div class="md-menu" role="menu">
  <button class="md-menu__item md-menu__item--selected" role="menuitemradio" aria-checked="true" tabindex="0">
    <svg class="md-menu__check" aria-hidden="true" width="24" height="24"><!-- check --></svg>
    <span class="md-menu__label">Option A</span>
  </button>
  <button class="md-menu__item" role="menuitemradio" aria-checked="false" tabindex="-1">
    <span class="md-menu__label">Option B</span>
  </button>
</div>

<!-- With submenu -->
<div class="md-menu" role="menu">
  <button class="md-menu__item" role="menuitem" aria-haspopup="menu" aria-expanded="false" tabindex="0">
    <span class="md-menu__label">More options</span>
    <svg class="md-menu__submenu-arrow" aria-hidden="true" width="24" height="24"><!-- arrow_right --></svg>
  </button>
</div>
```

## Complete CSS

```css
.md-menu {
  position: absolute;
  z-index: 1000;
  min-width: 112px;
  max-width: 280px;
  padding: 8px 0;
  background: var(--md-menu-bg);
  color: var(--md-menu-text);
  border-radius: 4px;
  box-shadow: var(--md-menu-shadow);
  font-family: Roboto, sans-serif;
  outline: none;
  transform-origin: top left;
  opacity: 0;
  transform: scaleY(0);
  transition: opacity 200ms cubic-bezier(0.05, 0.7, 0.1, 1),
              transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.md-menu--open {
  opacity: 1;
  transform: scaleY(1);
}

.md-menu__item {
  display: flex;
  align-items: center;
  gap: 12px;
  width: 100%;
  min-height: 48px;
  padding: 0 16px;
  border: none;
  background: none;
  color: var(--md-menu-text);
  font-family: inherit;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  text-align: left;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms cubic-bezier(0.2, 0, 0, 1);
}
.md-menu__item:hover { background: var(--md-menu-hover); }
.md-menu__item:focus-visible { background: var(--md-menu-focus); outline: none; }
.md-menu__item:active { background: var(--md-menu-pressed); }
.md-menu__item[aria-disabled="true"] {
  opacity: 0.38;
  pointer-events: none;
  cursor: default;
}
.md-menu__item--selected { background: var(--md-menu-selected-bg); }

.md-menu__icon, .md-menu__check {
  width: 24px; height: 24px; flex-shrink: 0;
  color: var(--md-menu-icon); fill: currentColor;
}
.md-menu__label { flex: 1; min-width: 0; }
.md-menu__trailing {
  font-size: 14px; font-weight: 500; line-height: 20px;
  color: var(--md-menu-icon); flex-shrink: 0;
}
.md-menu__submenu-arrow {
  width: 24px; height: 24px; flex-shrink: 0;
  color: var(--md-menu-icon); fill: currentColor;
  margin-left: auto;
}
.md-menu__divider {
  height: 1px;
  background: var(--md-menu-divider);
  margin: 8px 0;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .md-menu { background: var(--md-menu-bg); color: var(--md-menu-text); }
}
.dark .md-menu { background: var(--md-menu-bg); color: var(--md-menu-text); }

@media (prefers-reduced-motion: reduce) {
  .md-menu { transition: none; }
  .md-menu__item { transition: none; }
}
```

## States Reference

| State | Background | Text | Opacity | Cursor |
|-------|-----------|------|---------|--------|
| Default | transparent | #1D1B20 | 1 | pointer |
| Hover | on-surface 8% | #1D1B20 | 1 | pointer |
| Focus | on-surface 10% | #1D1B20 | 1 | pointer |
| Active | on-surface 10% | #1D1B20 | 1 | pointer |
| Selected | primary 8% | #1D1B20 | 1 | pointer |
| Disabled | transparent | #1D1B20 | 0.38 | default |

## Animation & Motion

```css
/* Open animation: scale-Y from 0 + fade */
.md-menu {
  transform-origin: top left;
  opacity: 0;
  transform: scaleY(0);
  transition: opacity 200ms cubic-bezier(0.05, 0.7, 0.1, 1),
              transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.md-menu--open {
  opacity: 1;
  transform: scaleY(1);
}

/* Close: accelerate out */
.md-menu--closing {
  opacity: 0;
  transform: scaleY(0.9);
  transition: opacity 100ms cubic-bezier(0.3, 0, 0.8, 0.15),
              transform 100ms cubic-bezier(0.3, 0, 0.8, 0.15);
}

@media (prefers-reduced-motion: reduce) {
  .md-menu, .md-menu--closing { transition: none; }
}
```

## Accessibility

- Container: `role="menu"`, `aria-label` describing menu purpose
- Items: `role="menuitem"`, first focusable item gets `tabindex="0"`, rest `tabindex="-1"`
- Selection: `role="menuitemradio"` with `aria-checked`, or `role="menuitemcheckbox"`
- Submenus: `aria-haspopup="menu"`, `aria-expanded="true/false"` on trigger
- Keyboard: Arrow Up/Down to navigate, Enter/Space to select, Escape to close, Right arrow opens submenu, Left arrow closes submenu
- Typeahead: typing characters jumps to matching item by first letter
- Focus management: focus moves into menu on open, returns to trigger on close
- Touch target: 48px min height per item

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width bottom sheet alternative; or max-width 280px |
| 600-1024px | Standard dropdown positioning |
| > 1024px | Standard dropdown, submenu opens to side |

## Do / Don't

| Do | Don't |
|----|-------|
| Use `role="menu"` and `role="menuitem"` | Use `<ul>/<li>` without menu roles |
| Return focus to trigger on close | Leave focus stranded after menu closes |
| Group related items with dividers | Have more than 10-12 items without grouping |
| Show keyboard shortcuts in trailing slot | Use trailing slot for icons and text simultaneously |
| Use submenus sparingly (1 level deep) | Nest submenus more than 2 levels deep |
