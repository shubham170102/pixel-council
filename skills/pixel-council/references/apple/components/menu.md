---
name: menu
description: Apple pull-down menu — actions, submenus, selection state, separators, destructive items
metadata:
  tags: menu, pull-down, dropdown, actions, submenu, context, selection, separator
---

# Menu (Pull-Down) -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Item height | 44px |
| Corner radius | 13px continuous |
| Item font | SF Pro, 17px/22px, weight 400 |
| Icon size | 20x20px |
| Keyboard shortcut font | SF Pro, 15px/20px, weight 400 |
| Background (light) | #FFFFFF |
| Background (dark) | #2C2C2E |
| Tint color (light) | #007AFF |
| Tint color (dark) | #0A84FF |
| CSS prefix | `.apple-menu` |

## Design Tokens

```css
:root {
  --apple-menu-bg: #FFFFFF;
  --apple-menu-text: #000000;
  --apple-menu-secondary: rgba(60, 60, 67, 0.6);
  --apple-menu-tint: #007AFF;
  --apple-menu-destructive: #FF3B30;
  --apple-menu-separator: rgba(60, 60, 67, 0.29);
  --apple-menu-highlight: #007AFF;
  --apple-menu-highlight-text: #FFFFFF;
  --apple-menu-fill: rgba(120, 120, 128, 0.12);
  --apple-menu-shadow: 0 10px 15px rgba(0, 0, 0, 0.08), 0 4px 6px rgba(0, 0, 0, 0.05);
  --apple-menu-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-menu-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-menu-bg: #2C2C2E;
    --apple-menu-text: #FFFFFF;
    --apple-menu-secondary: rgba(235, 235, 245, 0.6);
    --apple-menu-tint: #0A84FF;
    --apple-menu-destructive: #FF453A;
    --apple-menu-separator: rgba(84, 84, 88, 0.6);
    --apple-menu-highlight: #0A84FF;
    --apple-menu-highlight-text: #FFFFFF;
    --apple-menu-fill: rgba(120, 120, 128, 0.24);
    --apple-menu-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
    --apple-menu-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-menu-bg: #2C2C2E;
  --apple-menu-text: #FFFFFF;
  --apple-menu-secondary: rgba(235, 235, 245, 0.6);
  --apple-menu-tint: #0A84FF;
  --apple-menu-destructive: #FF453A;
  --apple-menu-separator: rgba(84, 84, 88, 0.6);
  --apple-menu-highlight: #0A84FF;
  --apple-menu-highlight-text: #FFFFFF;
  --apple-menu-fill: rgba(120, 120, 128, 0.24);
  --apple-menu-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
  --apple-menu-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Trigger | Content |
|-------|-------------|---------|---------|
| Pull-Down | Actions from a button | Button with chevron | Action items |
| Selection Menu | Mutually exclusive options | Button showing current | Checkmarked items |
| Submenu | Nested menu within a menu | Item with chevron | Nested action list |
| Inline Section | Grouped items within a menu | Section header | Grouped items |

## HTML Structure

```html
<!-- Pull-Down Menu Trigger -->
<div class="apple-menu-container">
  <button class="apple-menu__trigger" aria-haspopup="menu" aria-expanded="false" aria-controls="actions-menu">
    <span>Sort By</span>
    <svg class="apple-menu__trigger-chevron" width="10" height="6" viewBox="0 0 10 6" aria-hidden="true">
      <path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
    </svg>
  </button>

  <!-- Menu -->
  <div class="apple-menu" id="actions-menu" role="menu" aria-label="Sort options" hidden>
    <!-- Selection group -->
    <div class="apple-menu__group" role="group" aria-label="Sort order">
      <button class="apple-menu__item apple-menu__item--selected" role="menuitemradio" aria-checked="true">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Most Recent</span>
        <svg class="apple-menu__checkmark" width="14" height="10" viewBox="0 0 14 10" aria-hidden="true">
          <path d="M1 5L5 9L13 1" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
      </button>
      <button class="apple-menu__item" role="menuitemradio" aria-checked="false">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Name</span>
      </button>
      <button class="apple-menu__item" role="menuitemradio" aria-checked="false">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Date Created</span>
      </button>
    </div>

    <div class="apple-menu__separator" role="separator"></div>

    <!-- Actions group -->
    <div class="apple-menu__group" role="group">
      <button class="apple-menu__item" role="menuitem">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Select All</span>
        <span class="apple-menu__shortcut" aria-hidden="true">⌘A</span>
      </button>
      <button class="apple-menu__item" role="menuitem" aria-haspopup="menu">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Move To</span>
        <svg class="apple-menu__submenu-chevron" width="8" height="12" viewBox="0 0 8 12" aria-hidden="true">
          <path d="M2 2l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
      </button>
    </div>

    <div class="apple-menu__separator" role="separator"></div>

    <!-- Destructive -->
    <div class="apple-menu__group" role="group">
      <button class="apple-menu__item apple-menu__item--destructive" role="menuitem">
        <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
        <span class="apple-menu__item-label">Delete</span>
        <span class="apple-menu__shortcut" aria-hidden="true">⌫</span>
      </button>
    </div>
  </div>
</div>

<!-- Disabled Menu Item -->
<button class="apple-menu__item" role="menuitem" disabled aria-disabled="true">
  <svg class="apple-menu__item-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
  <span class="apple-menu__item-label">Paste</span>
  <span class="apple-menu__shortcut" aria-hidden="true">⌘V</span>
</button>
```

## Complete CSS

```css
.apple-menu-container {
  position: relative;
  display: inline-block;
}

/* Trigger button */
.apple-menu__trigger {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 6px 12px;
  background: var(--apple-menu-fill);
  border: none;
  border-radius: 8px;
  font-family: var(--apple-menu-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-menu-tint);
  cursor: pointer;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-menu__trigger:active { opacity: 0.7; }
.apple-menu__trigger-chevron {
  flex-shrink: 0;
  transition: transform 200ms ease-out;
}
.apple-menu__trigger[aria-expanded="true"] .apple-menu__trigger-chevron {
  transform: rotate(180deg);
}

/* Menu panel */
.apple-menu {
  position: absolute;
  top: calc(100% + 4px);
  left: 0;
  min-width: 220px;
  max-width: 320px;
  background: var(--apple-menu-bg);
  border-radius: 13px;
  box-shadow: var(--apple-menu-shadow);
  border: 0.5px solid var(--apple-menu-separator);
  padding: 4px;
  z-index: 100;
  overflow: hidden;
  animation: apple-menu-show 200ms ease-out;
  font-family: var(--apple-menu-font);
  -webkit-font-smoothing: antialiased;
}

/* Groups */
.apple-menu__group {
  display: flex;
  flex-direction: column;
}

/* Separator */
.apple-menu__separator {
  height: 0.5px;
  background: var(--apple-menu-separator);
  margin: 4px 12px;
}

/* Menu item */
.apple-menu__item {
  display: flex;
  align-items: center;
  gap: 12px;
  width: 100%;
  min-height: 44px;
  padding: 10px 12px;
  background: none;
  border: none;
  border-radius: 10px;
  font-family: var(--apple-menu-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-menu-text);
  cursor: pointer;
  transition: background-color 100ms ease-out;
  -webkit-tap-highlight-color: transparent;
  text-align: left;
}

.apple-menu__item-icon {
  flex-shrink: 0;
  color: var(--apple-menu-text);
  width: 20px;
  height: 20px;
}

.apple-menu__item-label {
  flex: 1;
}

/* Selected item (checkmark) */
.apple-menu__checkmark {
  color: var(--apple-menu-tint);
  flex-shrink: 0;
}

/* Keyboard shortcut */
.apple-menu__shortcut {
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  color: var(--apple-menu-secondary);
  margin-left: auto;
  flex-shrink: 0;
}

/* Submenu chevron */
.apple-menu__submenu-chevron {
  color: var(--apple-menu-secondary);
  flex-shrink: 0;
  margin-left: auto;
}

/* Destructive */
.apple-menu__item--destructive {
  color: var(--apple-menu-destructive);
}
.apple-menu__item--destructive .apple-menu__item-icon {
  color: var(--apple-menu-destructive);
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-menu__item:hover {
    background: var(--apple-menu-highlight);
    color: var(--apple-menu-highlight-text);
  }
  .apple-menu__item:hover .apple-menu__item-icon,
  .apple-menu__item:hover .apple-menu__shortcut,
  .apple-menu__item:hover .apple-menu__submenu-chevron,
  .apple-menu__item:hover .apple-menu__checkmark {
    color: var(--apple-menu-highlight-text);
  }
  .apple-menu__trigger:hover {
    background: rgba(120, 120, 128, 0.2);
  }
}

/* Focus */
.apple-menu__item:focus-visible {
  background: var(--apple-menu-highlight);
  color: var(--apple-menu-highlight-text);
  outline: none;
}
.apple-menu__item:focus-visible .apple-menu__item-icon,
.apple-menu__item:focus-visible .apple-menu__shortcut,
.apple-menu__item:focus-visible .apple-menu__submenu-chevron,
.apple-menu__item:focus-visible .apple-menu__checkmark {
  color: var(--apple-menu-highlight-text);
}
.apple-menu__trigger:focus-visible {
  outline: 4px solid var(--apple-menu-focus-ring);
  outline-offset: 1px;
}

/* Active */
.apple-menu__item:active {
  background: var(--apple-menu-highlight);
  color: var(--apple-menu-highlight-text);
}

/* Disabled */
.apple-menu__item:disabled,
.apple-menu__item[aria-disabled="true"] {
  opacity: 0.3;
  cursor: not-allowed;
  pointer-events: none;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-menu__trigger:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-menu__trigger:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Item Background | Item Text | Icon | Cursor |
|-------|----------------|-----------|------|--------|
| Default | transparent | text color | text color | pointer |
| Hover | highlight (tint) | white | white | pointer |
| Focus | highlight (tint) | white | white | pointer |
| Active | highlight (tint) | white | white | pointer |
| Selected | transparent | text color | text + checkmark in tint | pointer |
| Destructive | transparent | red | red | pointer |
| Disabled | transparent | 0.3 opacity | 0.3 opacity | not-allowed |

## Animation & Motion

```css
@keyframes apple-menu-show {
  from { opacity: 0; transform: scale(0.95) translateY(-4px); }
  to { opacity: 1; transform: scale(1) translateY(0); }
}

.apple-menu--dismissing {
  animation: apple-menu-hide 150ms ease-in forwards;
}
@keyframes apple-menu-hide {
  to { opacity: 0; transform: scale(0.95) translateY(-4px); }
}

.apple-menu__trigger-chevron {
  transition: transform 200ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-menu,
  .apple-menu--dismissing {
    animation: none;
  }
  .apple-menu__trigger-chevron { transition: none; }
}
```

## Accessibility

- **ARIA**: `aria-haspopup="menu"` on trigger, `aria-expanded` toggled, `role="menu"` on menu, `role="menuitem"` for actions, `role="menuitemradio"` for selection items with `aria-checked`, `role="separator"` on dividers, `role="group"` on sections
- **Keyboard**: Enter/Space to open from trigger, Up/Down to navigate items, Right to open submenu, Left to close submenu, Escape to close, Home/End for first/last item, type-ahead for item selection
- **Focus**: Highlight-based focus (filled tint bg + white text), no outline ring on items (Apple convention)
- **Touch target**: 44px minimum height per item
- **Screen reader**: Announces trigger label, menu role, item count, selection state, keyboard shortcuts
- **Submenu**: Opens on hover (desktop) or tap, navigable with arrow keys

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width menu, larger touch targets, no keyboard shortcuts shown |
| 600-1024px | Standard dropdown, positioned below trigger |
| > 1024px | Standard dropdown, shows keyboard shortcuts, supports submenus |

## Do / Don't

| Do | Don't |
|----|-------|
| Group related actions with separators | Mix unrelated actions without grouping |
| Put destructive actions in their own group at the bottom | Place Delete next to harmless actions |
| Show keyboard shortcuts for power users | Invent non-standard keyboard shortcuts |
| Highlight the entire row on hover/focus (Apple convention) | Use only text color change for hover |
| Use checkmarks for the selected item in selection menus | Use a different indicator for selection |
