---
name: context-menu
description: Apple context menus with SF Symbols, destructive actions, and submenus
metadata:
  tags: context menu, right click, long press, menu, dropdown, actions
---

# Context Menu -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Width | 250px |
| Corner radius | 14px |
| Item height | 44px |
| Padding (menu) | 6px vertical |
| Font | SF Pro, 17px/22px, weight 400 |
| Icon size | 22px |
| Background (light) | #FFFFFF with blur |
| Background (dark) | #1C1C1E with blur |
| Destructive color (light) | #FF3B30 |
| Destructive color (dark) | #FF453A |

## Design Tokens

```css
:root {
  --apple-ctx-bg: rgba(255, 255, 255, 0.72);
  --apple-ctx-bg-solid: #FFFFFF;
  --apple-ctx-text: #000000;
  --apple-ctx-text-secondary: rgba(60, 60, 67, 0.6);
  --apple-ctx-icon: #000000;
  --apple-ctx-separator: rgba(60, 60, 67, 0.29);
  --apple-ctx-destructive: #FF3B30;
  --apple-ctx-hover: rgba(0, 0, 0, 0.06);
  --apple-ctx-active: rgba(0, 122, 255, 1);
  --apple-ctx-active-text: #FFFFFF;
  --apple-ctx-backdrop: rgba(0, 0, 0, 0.2);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-ctx-bg: rgba(30, 30, 30, 0.72);
    --apple-ctx-bg-solid: #1C1C1E;
    --apple-ctx-text: #FFFFFF;
    --apple-ctx-text-secondary: rgba(235, 235, 245, 0.6);
    --apple-ctx-icon: #FFFFFF;
    --apple-ctx-separator: rgba(84, 84, 88, 0.6);
    --apple-ctx-destructive: #FF453A;
    --apple-ctx-hover: rgba(255, 255, 255, 0.08);
    --apple-ctx-active: rgba(10, 132, 255, 1);
    --apple-ctx-active-text: #FFFFFF;
    --apple-ctx-backdrop: rgba(0, 0, 0, 0.5);
  }
}

.dark {
  --apple-ctx-bg: rgba(30, 30, 30, 0.72);
  --apple-ctx-bg-solid: #1C1C1E;
  --apple-ctx-text: #FFFFFF;
  --apple-ctx-text-secondary: rgba(235, 235, 245, 0.6);
  --apple-ctx-icon: #FFFFFF;
  --apple-ctx-separator: rgba(84, 84, 88, 0.6);
  --apple-ctx-destructive: #FF453A;
  --apple-ctx-hover: rgba(255, 255, 255, 0.08);
  --apple-ctx-active: rgba(10, 132, 255, 1);
  --apple-ctx-active-text: #FFFFFF;
  --apple-ctx-backdrop: rgba(0, 0, 0, 0.5);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Standard | Basic action items |
| With icons | Leading SF Symbol icons |
| With submenu | Nested menu via disclosure arrow |
| With preview | Content preview above the menu (long-press) |
| Destructive | Red-colored items for delete/remove |
| With dividers | Logical groups separated by lines |

## HTML Structure

```html
<!-- Backdrop overlay -->
<div class="apple-context-menu__backdrop" aria-hidden="true"></div>

<!-- Context menu -->
<div class="apple-context-menu" role="menu" aria-label="Actions">
  <!-- Preview (optional, for long-press) -->
  <div class="apple-context-menu__preview">
    <img src="preview.jpg" alt="Preview of item" />
  </div>

  <!-- Menu body -->
  <div class="apple-context-menu__body">
    <button class="apple-context-menu__item" role="menuitem" tabindex="0">
      <span class="apple-context-menu__label">Copy</span>
      <svg class="apple-context-menu__icon" aria-hidden="true" width="22" height="22"><!-- doc.on.doc --></svg>
    </button>
    <button class="apple-context-menu__item" role="menuitem" tabindex="-1">
      <span class="apple-context-menu__label">Share</span>
      <svg class="apple-context-menu__icon" aria-hidden="true" width="22" height="22"><!-- square.and.arrow.up --></svg>
    </button>

    <div class="apple-context-menu__separator" role="separator"></div>

    <!-- Submenu trigger -->
    <button class="apple-context-menu__item" role="menuitem" aria-haspopup="menu" aria-expanded="false" tabindex="-1">
      <span class="apple-context-menu__label">Move to</span>
      <svg class="apple-context-menu__submenu-arrow" aria-hidden="true" width="7" height="12"><!-- chevron.right --></svg>
    </button>

    <div class="apple-context-menu__separator" role="separator"></div>

    <!-- Destructive item -->
    <button class="apple-context-menu__item apple-context-menu__item--destructive" role="menuitem" tabindex="-1">
      <span class="apple-context-menu__label">Delete</span>
      <svg class="apple-context-menu__icon" aria-hidden="true" width="22" height="22"><!-- trash --></svg>
    </button>
  </div>
</div>
```

## Complete CSS

```css
.apple-context-menu__backdrop {
  position: fixed;
  inset: 0;
  background: var(--apple-ctx-backdrop);
  z-index: 999;
  opacity: 0;
  transition: opacity 200ms ease;
}
.apple-context-menu__backdrop--visible { opacity: 1; }

.apple-context-menu {
  position: fixed;
  z-index: 1000;
  width: 250px;
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  outline: none;
  opacity: 0;
  transform: scale(0.9);
  transition: opacity 200ms cubic-bezier(0.23, 1, 0.32, 1),
              transform 200ms cubic-bezier(0.23, 1, 0.32, 1);
}
.apple-context-menu--open {
  opacity: 1;
  transform: scale(1);
}

.apple-context-menu__preview {
  border-radius: 14px 14px 0 0;
  overflow: hidden;
  margin-bottom: 8px;
}
.apple-context-menu__preview img {
  display: block;
  width: 100%;
  height: auto;
}

.apple-context-menu__body {
  background: var(--apple-ctx-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-radius: 14px;
  padding: 6px 0;
  overflow: hidden;
}

.apple-context-menu__item {
  display: flex;
  align-items: center;
  gap: 8px;
  width: 100%;
  min-height: 44px;
  padding: 0 16px;
  border: none;
  background: none;
  color: var(--apple-ctx-text);
  font-size: 17px;
  line-height: 22px;
  font-weight: 400;
  letter-spacing: -0.41px;
  text-align: left;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 60ms ease;
}
.apple-context-menu__item:hover { background: var(--apple-ctx-hover); }
.apple-context-menu__item:focus-visible {
  background: var(--apple-ctx-active);
  color: var(--apple-ctx-active-text);
  outline: none;
}
.apple-context-menu__item:focus-visible .apple-context-menu__icon {
  color: var(--apple-ctx-active-text);
}
.apple-context-menu__item:active {
  background: var(--apple-ctx-active);
  color: var(--apple-ctx-active-text);
}

/* Destructive */
.apple-context-menu__item--destructive {
  color: var(--apple-ctx-destructive);
}
.apple-context-menu__item--destructive .apple-context-menu__icon {
  color: var(--apple-ctx-destructive);
}
.apple-context-menu__item--destructive:focus-visible,
.apple-context-menu__item--destructive:active {
  background: var(--apple-ctx-destructive);
  color: var(--apple-ctx-active-text);
}

/* Inner elements */
.apple-context-menu__label { flex: 1; min-width: 0; }
.apple-context-menu__icon {
  width: 22px; height: 22px; flex-shrink: 0;
  color: var(--apple-ctx-icon); fill: currentColor;
}
.apple-context-menu__submenu-arrow {
  width: 7px; height: 12px; flex-shrink: 0;
  color: var(--apple-ctx-text-secondary); fill: none;
  stroke: currentColor; stroke-width: 2;
  margin-left: auto;
}

/* Separator */
.apple-context-menu__separator {
  height: 0.5px;
  background: var(--apple-ctx-separator);
  margin: 6px 0;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-context-menu__body { background: var(--apple-ctx-bg); }
}
.dark .apple-context-menu__body { background: var(--apple-ctx-bg); }

@media (prefers-reduced-motion: reduce) {
  .apple-context-menu, .apple-context-menu__backdrop { transition: none; }
  .apple-context-menu__item { transition: none; }
}
```

## States Reference

| State | Background | Text | Icon | Cursor |
|-------|-----------|------|------|--------|
| Default | transparent | #000000 | #000000 | pointer |
| Hover | rgba(0,0,0,0.06) | #000000 | #000000 | pointer |
| Focus/Active | #007AFF | #FFFFFF | #FFFFFF | pointer |
| Destructive | transparent | #FF3B30 | #FF3B30 | pointer |
| Destructive active | #FF3B30 | #FFFFFF | #FFFFFF | pointer |

## Animation & Motion

```css
/* Open animation: spring scale-in */
.apple-context-menu {
  opacity: 0;
  transform: scale(0.9);
  transition: opacity 200ms cubic-bezier(0.23, 1, 0.32, 1),
              transform 200ms cubic-bezier(0.23, 1, 0.32, 1);
}
.apple-context-menu--open {
  opacity: 1;
  transform: scale(1);
}

/* Close */
.apple-context-menu--closing {
  opacity: 0;
  transform: scale(0.95);
  transition: opacity 150ms ease-out, transform 150ms ease-out;
}

/* Backdrop */
.apple-context-menu__backdrop {
  transition: opacity 200ms ease;
}

@media (prefers-reduced-motion: reduce) {
  .apple-context-menu,
  .apple-context-menu--closing,
  .apple-context-menu__backdrop { transition: none; }
}
```

## Accessibility

- Container: `role="menu"`, `aria-label` describing context
- Items: `role="menuitem"`, first item `tabindex="0"`, rest `tabindex="-1"`
- Submenus: `aria-haspopup="menu"`, `aria-expanded` on trigger
- Destructive items: consider `aria-label` with "Delete" verb
- Keyboard: Arrow Up/Down to navigate, Enter/Space to select, Escape to dismiss, Right arrow opens submenu, Left arrow closes submenu
- Focus: blue highlight on focused item (system blue background)
- Trigger: long-press on touch, right-click on desktop
- Screen reader: announce menu label and item count
- Dismiss: click/tap outside menu or press Escape

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Centered on screen, 250px width, with preview above |
| 600-1024px | Positioned near trigger element |
| > 1024px | Positioned at cursor/right-click location |

## Do / Don't

| Do | Don't |
|----|-------|
| Group related actions with separators | Dump all actions in a flat list |
| Place destructive actions at the bottom | Mix destructive items with normal items |
| Use SF Symbol icons consistently | Mix icon styles within same menu |
| Keep menus concise (5-8 items max) | Overload with 15+ items |
| Use submenus sparingly for nested options | Nest submenus more than 1 level deep |
| Provide preview for visual content (images) | Show preview for text-only items |
