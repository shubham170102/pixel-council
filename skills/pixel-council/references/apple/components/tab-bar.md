---
name: tab-bar
description: Apple bottom tab bar with SF Symbols, badges, and Liquid Glass background
metadata:
  tags: tab bar, bottom nav, navigation, tabs, mobile nav
---

# Tab Bar -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 49px + safe area inset |
| Tab count | 3-5 |
| Icon size | 25px |
| Label font | SF Pro, 10px/12px, weight 500 |
| Active color (light) | #007AFF |
| Active color (dark) | #0A84FF |
| Inactive color (light) | #8E8E93 |
| Background | Liquid Glass (blur 20px) |

## Design Tokens

```css
:root {
  --apple-tab-bar-bg: rgba(255, 255, 255, 0.72);
  --apple-tab-bar-border: rgba(60, 60, 67, 0.29);
  --apple-tab-bar-active: #007AFF;
  --apple-tab-bar-inactive: #8E8E93;
  --apple-tab-bar-badge-bg: #FF3B30;
  --apple-tab-bar-badge-text: #FFFFFF;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-tab-bar-bg: rgba(30, 30, 30, 0.72);
    --apple-tab-bar-border: rgba(84, 84, 88, 0.6);
    --apple-tab-bar-active: #0A84FF;
    --apple-tab-bar-inactive: #8E8E93;
    --apple-tab-bar-badge-bg: #FF453A;
    --apple-tab-bar-badge-text: #FFFFFF;
  }
}

.dark {
  --apple-tab-bar-bg: rgba(30, 30, 30, 0.72);
  --apple-tab-bar-border: rgba(84, 84, 88, 0.6);
  --apple-tab-bar-active: #0A84FF;
  --apple-tab-bar-inactive: #8E8E93;
  --apple-tab-bar-badge-bg: #FF453A;
  --apple-tab-bar-badge-text: #FFFFFF;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Standard | 3-5 tabs, icon above label |
| Compact | Icon beside label (regular width iPad) |
| With badge | Red dot or count badge on tab icon |

## HTML Structure

```html
<nav class="apple-tab-bar" role="tablist" aria-label="Main sections">
  <a href="/home" class="apple-tab-bar__tab apple-tab-bar__tab--active"
     role="tab" aria-selected="true" aria-current="page">
    <span class="apple-tab-bar__icon" aria-hidden="true">
      <svg width="25" height="25"><!-- SF Symbol filled --></svg>
    </span>
    <span class="apple-tab-bar__label">Home</span>
  </a>
  <a href="/search" class="apple-tab-bar__tab" role="tab" aria-selected="false">
    <span class="apple-tab-bar__icon" aria-hidden="true">
      <svg width="25" height="25"><!-- SF Symbol --></svg>
    </span>
    <span class="apple-tab-bar__label">Search</span>
  </a>
  <a href="/activity" class="apple-tab-bar__tab" role="tab" aria-selected="false">
    <span class="apple-tab-bar__icon-wrapper">
      <svg width="25" height="25" class="apple-tab-bar__icon" aria-hidden="true"><!-- icon --></svg>
      <span class="apple-tab-bar__badge" aria-label="5 new items">5</span>
    </span>
    <span class="apple-tab-bar__label">Activity</span>
  </a>
</nav>
```

## Complete CSS

```css
.apple-tab-bar {
  display: flex;
  align-items: stretch;
  justify-content: space-around;
  width: 100%;
  height: calc(49px + env(safe-area-inset-bottom, 0px));
  padding-bottom: env(safe-area-inset-bottom, 0px);
  background: var(--apple-tab-bar-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-top: 0.5px solid var(--apple-tab-bar-border);
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 50;
}

.apple-tab-bar__tab {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex: 1;
  min-width: 44px;
  gap: 2px;
  padding: 6px 0 2px;
  text-decoration: none;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  position: relative;
  transition: opacity 150ms ease;
}

/* Compact: icon beside label */
.apple-tab-bar--compact .apple-tab-bar__tab {
  flex-direction: row;
  gap: 5px;
  justify-content: center;
}

.apple-tab-bar__icon-wrapper {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}

.apple-tab-bar__icon {
  width: 25px;
  height: 25px;
  color: var(--apple-tab-bar-inactive);
  transition: color 150ms ease;
}

.apple-tab-bar__tab--active .apple-tab-bar__icon {
  color: var(--apple-tab-bar-active);
}

.apple-tab-bar__label {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 10px;
  font-weight: 500;
  line-height: 12px;
  letter-spacing: 0px;
  color: var(--apple-tab-bar-inactive);
  transition: color 150ms ease;
}

.apple-tab-bar__tab--active .apple-tab-bar__label {
  color: var(--apple-tab-bar-active);
}

/* Badge */
.apple-tab-bar__badge {
  position: absolute;
  top: -3px;
  right: -8px;
  min-width: 16px;
  height: 16px;
  padding: 0 4px;
  border-radius: 9999px;
  background: var(--apple-tab-bar-badge-bg);
  color: var(--apple-tab-bar-badge-text);
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif;
  font-size: 11px;
  font-weight: 600;
  line-height: 16px;
  text-align: center;
}

/* Dot badge */
.apple-tab-bar__badge--dot {
  min-width: 6px;
  width: 6px;
  height: 6px;
  padding: 0;
  top: -1px;
  right: -3px;
}

/* Hover (desktop / pointer devices) */
@media (hover: hover) {
  .apple-tab-bar__tab:hover {
    opacity: 0.7;
  }
}

/* Focus */
.apple-tab-bar__tab:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
  border-radius: 4px;
}
@media (prefers-color-scheme: dark) {
  .apple-tab-bar__tab:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-tab-bar__tab:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

/* Active / pressed */
.apple-tab-bar__tab:active {
  opacity: 0.5;
}

/* Disabled */
.apple-tab-bar__tab[aria-disabled="true"] {
  opacity: 0.38;
  cursor: not-allowed;
  pointer-events: none;
}
```

## States Reference

| State | Icon Color | Label Color | Opacity | Cursor |
|-------|-----------|-------------|---------|--------|
| Inactive | #8E8E93 | #8E8E93 | 1 | pointer |
| Active | #007AFF | #007AFF | 1 | pointer |
| Hover | -- | -- | 0.7 | pointer |
| Focus | -- | -- | 1 | pointer |
| Pressed | -- | -- | 0.5 | pointer |
| Disabled | -- | -- | 0.38 | not-allowed |

## Animation & Motion

```css
.apple-tab-bar__icon,
.apple-tab-bar__label {
  transition: color 150ms ease;
}

@media (prefers-reduced-motion: reduce) {
  .apple-tab-bar__icon,
  .apple-tab-bar__label,
  .apple-tab-bar__tab {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="tablist"`, `role="tab"`, `aria-selected`, `aria-current="page"` on active
- Keyboard: Tab to enter bar; Arrow Left/Right between tabs; Enter/Space to activate
- Focus: 4px solid `rgba(0,122,255,0.6)` outline, 1px offset
- Touch target: Min 44x49px per tab
- Screen reader: Badge counts via `aria-label` on badge element
- Tab bar always visible -- never hidden during navigation

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Standard layout (icon above label), 49px height |
| 600-1024px | Compact layout (icon beside label) or convert to sidebar |
| > 1024px | Typically replaced by sidebar navigation |

## Do / Don't

| Do | Don't |
|----|-------|
| Use 3-5 tabs for top-level sections | Use tab bar for content filtering |
| Show filled icon for active tab | Disable or hide individual tabs |
| Keep labels to single words | Use tab bar for sequential workflows |
| Preserve state within each tab | Change tab count dynamically |
| Use badge sparingly for critical info | Use badges for decorative or non-urgent info |
