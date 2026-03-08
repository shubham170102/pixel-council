---
name: sidebar
description: Apple sidebar navigation with disclosure groups, selection state, and SF Symbols
metadata:
  tags: sidebar, side nav, navigation, drawer, menu, source list
---

# Sidebar -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Width | 240-320px (collapsible) |
| Row height (macOS) | 28px |
| Row height (iPad) | 44px |
| Icon size | 18px (macOS) / 22px (iPad) |
| Label font | SF Pro, 13px/18px (macOS), 17px/22px (iPad) |
| Active color (light) | #007AFF |
| Active color (dark) | #0A84FF |
| Background | Liquid Glass |

## Design Tokens

```css
:root {
  --apple-sidebar-bg: rgba(255, 255, 255, 0.72);
  --apple-sidebar-border: rgba(60, 60, 67, 0.29);
  --apple-sidebar-active-bg: #007AFF;
  --apple-sidebar-active-text: #FFFFFF;
  --apple-sidebar-inactive-text: #000000;
  --apple-sidebar-secondary-text: rgba(60, 60, 67, 0.6);
  --apple-sidebar-section-header: rgba(60, 60, 67, 0.6);
  --apple-sidebar-icon: #007AFF;
  --apple-sidebar-separator: rgba(60, 60, 67, 0.29);
  --apple-sidebar-hover-bg: rgba(0, 0, 0, 0.04);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-sidebar-bg: rgba(30, 30, 30, 0.72);
    --apple-sidebar-border: rgba(84, 84, 88, 0.6);
    --apple-sidebar-active-bg: #0A84FF;
    --apple-sidebar-active-text: #FFFFFF;
    --apple-sidebar-inactive-text: #FFFFFF;
    --apple-sidebar-secondary-text: rgba(235, 235, 245, 0.6);
    --apple-sidebar-section-header: rgba(235, 235, 245, 0.6);
    --apple-sidebar-icon: #0A84FF;
    --apple-sidebar-separator: rgba(84, 84, 88, 0.6);
    --apple-sidebar-hover-bg: rgba(255, 255, 255, 0.06);
  }
}

.dark {
  --apple-sidebar-bg: rgba(30, 30, 30, 0.72);
  --apple-sidebar-border: rgba(84, 84, 88, 0.6);
  --apple-sidebar-active-bg: #0A84FF;
  --apple-sidebar-active-text: #FFFFFF;
  --apple-sidebar-inactive-text: #FFFFFF;
  --apple-sidebar-secondary-text: rgba(235, 235, 245, 0.6);
  --apple-sidebar-section-header: rgba(235, 235, 245, 0.6);
  --apple-sidebar-icon: #0A84FF;
  --apple-sidebar-separator: rgba(84, 84, 88, 0.6);
  --apple-sidebar-hover-bg: rgba(255, 255, 255, 0.06);
}
```

## Variants

| Variant | Row Height | Platform |
|---------|-----------|----------|
| macOS (small) | 24px | Desktop |
| macOS (medium) | 28px | Desktop (default) |
| macOS (large) | 32px | Desktop |
| iPad | 44px | Tablet |

## HTML Structure

```html
<aside class="apple-sidebar" role="navigation" aria-label="Sidebar">
  <div class="apple-sidebar__section">
    <div class="apple-sidebar__section-header">Favorites</div>
    <a href="/inbox" class="apple-sidebar__item apple-sidebar__item--active"
       aria-current="page">
      <span class="apple-sidebar__icon" aria-hidden="true">
        <svg width="18" height="18"><!-- SF Symbol --></svg>
      </span>
      <span class="apple-sidebar__label">Inbox</span>
      <span class="apple-sidebar__count" aria-label="12 items">12</span>
    </a>
    <a href="/drafts" class="apple-sidebar__item">
      <span class="apple-sidebar__icon" aria-hidden="true">
        <svg width="18" height="18"><!-- SF Symbol --></svg>
      </span>
      <span class="apple-sidebar__label">Drafts</span>
    </a>
  </div>
  <div class="apple-sidebar__separator" aria-hidden="true"></div>
  <div class="apple-sidebar__section">
    <button class="apple-sidebar__section-header apple-sidebar__section-header--collapsible"
            aria-expanded="true">
      <span class="apple-sidebar__disclosure" aria-hidden="true"></span>
      Tags
    </button>
    <a href="/important" class="apple-sidebar__item">
      <span class="apple-sidebar__icon" aria-hidden="true">
        <svg width="18" height="18"><!-- icon --></svg>
      </span>
      <span class="apple-sidebar__label">Important</span>
    </a>
  </div>
</aside>
```

## Complete CSS

```css
.apple-sidebar {
  display: flex;
  flex-direction: column;
  width: 260px;
  min-width: 240px;
  max-width: 320px;
  height: 100%;
  background: var(--apple-sidebar-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-right: 0.5px solid var(--apple-sidebar-border);
  padding: 8px;
  overflow-y: auto;
  position: relative;
  transition: width 250ms ease;
}

/* Collapsed state */
.apple-sidebar--collapsed {
  width: 0;
  min-width: 0;
  padding: 0;
  overflow: hidden;
}

.apple-sidebar__section {
  display: flex;
  flex-direction: column;
  gap: 1px;
}

.apple-sidebar__section-header {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 11px;
  font-weight: 600;
  line-height: 13px;
  letter-spacing: 0.07px;
  text-transform: uppercase;
  color: var(--apple-sidebar-section-header);
  padding: 16px 8px 4px;
  background: none;
  border: none;
  cursor: default;
  user-select: none;
}

.apple-sidebar__section-header--collapsible {
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 4px;
}

.apple-sidebar__disclosure {
  width: 0;
  height: 0;
  border-left: 4px solid currentColor;
  border-top: 3px solid transparent;
  border-bottom: 3px solid transparent;
  transition: transform 150ms ease;
}

.apple-sidebar__section-header--collapsible[aria-expanded="true"] .apple-sidebar__disclosure {
  transform: rotate(90deg);
}

.apple-sidebar__item {
  display: flex;
  align-items: center;
  height: 28px;
  padding: 0 8px;
  gap: 6px;
  border-radius: 6px;
  text-decoration: none;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 100ms ease;
}

/* iPad variant */
.apple-sidebar--ipad .apple-sidebar__item {
  height: 44px;
  padding: 0 12px;
  gap: 10px;
  border-radius: 10px;
}

.apple-sidebar__item--active {
  background: var(--apple-sidebar-active-bg);
}

.apple-sidebar__icon {
  width: 18px;
  height: 18px;
  flex-shrink: 0;
  color: var(--apple-sidebar-icon);
}

.apple-sidebar__item--active .apple-sidebar__icon {
  color: var(--apple-sidebar-active-text);
}

.apple-sidebar--ipad .apple-sidebar__icon {
  width: 22px;
  height: 22px;
}

.apple-sidebar__label {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-sidebar-inactive-text);
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.apple-sidebar__item--active .apple-sidebar__label {
  color: var(--apple-sidebar-active-text);
  font-weight: 500;
}

.apple-sidebar--ipad .apple-sidebar__label {
  font-size: 17px;
  line-height: 22px;
  letter-spacing: -0.41px;
}

.apple-sidebar__count {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif;
  font-size: 13px;
  font-weight: 400;
  color: var(--apple-sidebar-secondary-text);
}

.apple-sidebar__item--active .apple-sidebar__count {
  color: var(--apple-sidebar-active-text);
  opacity: 0.8;
}

.apple-sidebar__separator {
  height: 0.5px;
  background: var(--apple-sidebar-separator);
  margin: 8px 0;
}

/* Hover */
@media (hover: hover) {
  .apple-sidebar__item:hover:not(.apple-sidebar__item--active) {
    background: var(--apple-sidebar-hover-bg);
  }
}

/* Focus */
.apple-sidebar__item:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}
@media (prefers-color-scheme: dark) {
  .apple-sidebar__item:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-sidebar__item:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

/* Active / pressed */
.apple-sidebar__item:active:not(.apple-sidebar__item--active) {
  background: var(--apple-sidebar-hover-bg);
  opacity: 0.8;
}
```

## States Reference

| State | Background | Label Color | Icon Color | Cursor |
|-------|-----------|-------------|------------|--------|
| Inactive | transparent | #000000 | #007AFF | pointer |
| Hover | rgba(0,0,0,0.04) | #000000 | #007AFF | pointer |
| Active | #007AFF | #FFFFFF | #FFFFFF | pointer |
| Pressed | rgba(0,0,0,0.04) | #000000 | #007AFF | pointer |
| Focus | -- | -- | -- | pointer |

## Animation & Motion

```css
.apple-sidebar {
  transition: width 250ms ease;
}

.apple-sidebar__disclosure {
  transition: transform 150ms ease;
}

@media (prefers-reduced-motion: reduce) {
  .apple-sidebar,
  .apple-sidebar__item,
  .apple-sidebar__disclosure {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="navigation"`, `aria-label="Sidebar"`, `aria-current="page"` on active
- Collapsible sections: `aria-expanded` on section header buttons
- Keyboard: Tab to navigate items; Enter/Space to activate; Arrow keys within sections
- Focus: 4px solid `rgba(0,122,255,0.6)` outline, 1px offset
- Touch target: 28px (macOS) / 44px (iPad) height, full sidebar width
- Screen reader: Count badges announced via `aria-label`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Hidden (use bottom tab bar instead) |
| 600-1024px | Collapsible, overlay on content |
| > 1024px | Persistent, side-by-side with content |

## Do / Don't

| Do | Don't |
|----|-------|
| Limit to 2 levels of hierarchy | Nest more than 2 levels deep |
| Use succinct, descriptive labels | Place critical info at bottom of long lists |
| Let users customize sidebar contents | Use fixed icon colors (respect accent) |
| Use disclosure indicators for groups | Hide sidebar by default |
| Show count badges for numeric status | Overcrowd with too many items |
