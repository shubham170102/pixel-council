---
name: popover
description: Apple popover — arrow-anchored content bubble, menu popover, rich content popover
metadata:
  tags: popover, popup, tooltip, bubble, arrow, dropdown, overlay, floating
---

# Popover -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Corner radius | 13px continuous |
| Arrow size | 16px wide, 8px tall |
| Min width | 200px |
| Max width | 375px |
| Padding | 16px |
| Background (light) | #FFFFFF |
| Background (dark) | #2C2C2E |
| Shadow | level 3-4 |
| CSS prefix | `.apple-popover` |

## Design Tokens

```css
:root {
  --apple-popover-bg: #FFFFFF;
  --apple-popover-text: #000000;
  --apple-popover-secondary: rgba(60, 60, 67, 0.6);
  --apple-popover-tint: #007AFF;
  --apple-popover-separator: rgba(60, 60, 67, 0.29);
  --apple-popover-fill: rgba(120, 120, 128, 0.12);
  --apple-popover-shadow: 0 10px 15px rgba(0, 0, 0, 0.08), 0 4px 6px rgba(0, 0, 0, 0.05);
  --apple-popover-arrow-shadow: 0 2px 4px rgba(0, 0, 0, 0.06);
  --apple-popover-overlay: rgba(0, 0, 0, 0.15);
  --apple-popover-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-popover-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-popover-bg: #2C2C2E;
    --apple-popover-text: #FFFFFF;
    --apple-popover-secondary: rgba(235, 235, 245, 0.6);
    --apple-popover-tint: #0A84FF;
    --apple-popover-separator: rgba(84, 84, 88, 0.6);
    --apple-popover-fill: rgba(120, 120, 128, 0.24);
    --apple-popover-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
    --apple-popover-arrow-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    --apple-popover-overlay: rgba(0, 0, 0, 0.4);
    --apple-popover-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-popover-bg: #2C2C2E;
  --apple-popover-text: #FFFFFF;
  --apple-popover-secondary: rgba(235, 235, 245, 0.6);
  --apple-popover-tint: #0A84FF;
  --apple-popover-separator: rgba(84, 84, 88, 0.6);
  --apple-popover-fill: rgba(120, 120, 128, 0.24);
  --apple-popover-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
  --apple-popover-arrow-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  --apple-popover-overlay: rgba(0, 0, 0, 0.4);
  --apple-popover-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Arrow | Content |
|-------|-------------|-------|---------|
| Content Popover | Rich content in floating bubble | Yes | Any HTML content |
| Menu Popover | List of actions in floating bubble | Optional | Menu items |
| Tip/Guidance | Short instructional text | Yes | Text + optional image |
| No Arrow | Floating panel without arrow | No | Any content |

## HTML Structure

```html
<!-- Content Popover (arrow on top) -->
<div class="apple-popover apple-popover--top" role="dialog" aria-label="Filter options">
  <div class="apple-popover__arrow apple-popover__arrow--top" aria-hidden="true"></div>
  <div class="apple-popover__content">
    <h3 class="apple-popover__title">Filter</h3>
    <p class="apple-popover__description">Choose which items to display.</p>
    <div class="apple-popover__body">
      <!-- Any content: forms, lists, etc. -->
    </div>
  </div>
</div>

<!-- Menu Popover -->
<div class="apple-popover apple-popover--bottom" role="menu" aria-label="More options">
  <div class="apple-popover__arrow apple-popover__arrow--bottom" aria-hidden="true"></div>
  <div class="apple-popover__menu">
    <button class="apple-popover__menu-item" role="menuitem">
      <svg class="apple-popover__menu-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
      <span>Edit</span>
    </button>
    <button class="apple-popover__menu-item" role="menuitem">
      <svg class="apple-popover__menu-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
      <span>Duplicate</span>
    </button>
    <div class="apple-popover__separator" role="separator"></div>
    <button class="apple-popover__menu-item apple-popover__menu-item--destructive" role="menuitem">
      <svg class="apple-popover__menu-icon" aria-hidden="true" width="20" height="20"><!-- icon --></svg>
      <span>Delete</span>
    </button>
  </div>
</div>

<!-- Popover with Navigation Bar -->
<div class="apple-popover apple-popover--top" role="dialog" aria-label="Details">
  <div class="apple-popover__arrow apple-popover__arrow--top" aria-hidden="true"></div>
  <div class="apple-popover__nav">
    <button class="apple-popover__nav-action">Cancel</button>
    <span class="apple-popover__nav-title">New Event</span>
    <button class="apple-popover__nav-action apple-popover__nav-action--primary">Add</button>
  </div>
  <div class="apple-popover__content">
    <!-- Form content -->
  </div>
</div>
```

## Complete CSS

```css
.apple-popover {
  position: absolute;
  z-index: 100;
  min-width: 200px;
  max-width: 375px;
  background: var(--apple-popover-bg);
  border-radius: 13px;
  box-shadow: var(--apple-popover-shadow);
  font-family: var(--apple-popover-font);
  -webkit-font-smoothing: antialiased;
  animation: apple-popover-show 200ms ease-out;
}

/* Arrow */
.apple-popover__arrow {
  position: absolute;
  width: 16px;
  height: 8px;
  overflow: hidden;
}
.apple-popover__arrow::before {
  content: '';
  position: absolute;
  width: 12px;
  height: 12px;
  background: var(--apple-popover-bg);
  transform: rotate(45deg);
  box-shadow: var(--apple-popover-arrow-shadow);
}

/* Arrow positions */
.apple-popover__arrow--top {
  top: -8px;
  left: 50%;
  transform: translateX(-50%);
}
.apple-popover__arrow--top::before {
  bottom: -6px;
  left: 2px;
}
.apple-popover__arrow--bottom {
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
}
.apple-popover__arrow--bottom::before {
  top: -6px;
  left: 2px;
}
.apple-popover__arrow--left {
  left: -8px;
  top: 50%;
  transform: translateY(-50%) rotate(90deg);
}
.apple-popover__arrow--right {
  right: -8px;
  top: 50%;
  transform: translateY(-50%) rotate(-90deg);
}

/* Content */
.apple-popover__content {
  padding: 16px;
}

.apple-popover__title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-popover-text);
  margin: 0 0 4px;
}

.apple-popover__description {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-popover-secondary);
  margin: 0 0 12px;
}

/* Menu variant */
.apple-popover__menu {
  padding: 4px;
}

.apple-popover__menu-item {
  display: flex;
  align-items: center;
  gap: 12px;
  width: 100%;
  padding: 11px 12px;
  background: none;
  border: none;
  border-radius: 10px;
  font-family: var(--apple-popover-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-popover-text);
  cursor: pointer;
  transition: background-color 100ms ease-out;
  -webkit-tap-highlight-color: transparent;
  text-align: left;
}
.apple-popover__menu-item--destructive {
  color: #FF3B30;
}

.apple-popover__menu-icon {
  flex-shrink: 0;
  color: inherit;
}

.apple-popover__separator {
  height: 0.5px;
  background: var(--apple-popover-separator);
  margin: 4px 12px;
}

/* Navigation bar in popover */
.apple-popover__nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  border-bottom: 0.5px solid var(--apple-popover-separator);
}
.apple-popover__nav-title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  color: var(--apple-popover-text);
}
.apple-popover__nav-action {
  background: none;
  border: none;
  font-family: var(--apple-popover-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  color: var(--apple-popover-tint);
  cursor: pointer;
  padding: 4px;
  -webkit-tap-highlight-color: transparent;
}
.apple-popover__nav-action--primary { font-weight: 600; }
.apple-popover__nav-action:active { opacity: 0.5; }

/* Focus */
.apple-popover__menu-item:focus-visible,
.apple-popover__nav-action:focus-visible {
  outline: 4px solid var(--apple-popover-focus-ring);
  outline-offset: 1px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-popover__menu-item:hover {
    background: var(--apple-popover-fill);
  }
}

/* Active */
.apple-popover__menu-item:active {
  background: var(--apple-popover-fill);
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-popover__menu-item--destructive { color: #FF453A; }
  .apple-popover__menu-item:focus-visible,
  .apple-popover__nav-action:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-popover__menu-item--destructive { color: #FF453A; }
.dark .apple-popover__menu-item:focus-visible,
.dark .apple-popover__nav-action:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

/* Mobile: full-width bottom sheet fallback */
@media (max-width: 599px) {
  .apple-popover {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    max-width: none;
    border-radius: 13px 13px 0 0;
    animation: apple-popover-slide-up 300ms cubic-bezier(0.2, 0.8, 0.2, 1);
  }
  .apple-popover__arrow { display: none; }
}
```

## States Reference

| State | Menu Item | Nav Action | Overlay | Cursor |
|-------|-----------|------------|---------|--------|
| Default | text color | tint color | 15% black | pointer |
| Hover | fill bg | — | — | pointer |
| Focus | 4px blue ring | 4px blue ring | — | pointer |
| Active | fill bg | opacity 0.5 | — | pointer |
| Destructive | red text | — | — | pointer |

## Animation & Motion

```css
@keyframes apple-popover-show {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}

@keyframes apple-popover-slide-up {
  from { transform: translateY(100%); }
  to { transform: translateY(0); }
}

/* Dismiss */
.apple-popover--dismissing {
  animation: apple-popover-hide 150ms ease-in forwards;
}
@keyframes apple-popover-hide {
  to { opacity: 0; transform: scale(0.95); }
}

@media (prefers-reduced-motion: reduce) {
  .apple-popover,
  .apple-popover--dismissing {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: `role="dialog"` for content popovers, `role="menu"` for menu popovers, `aria-label` on container, `role="menuitem"` on menu items, `role="separator"` on dividers
- **Keyboard**: Tab to cycle through interactive elements, Escape to dismiss, Enter/Space to activate items
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Focus trap**: Focus must be trapped within popover while open
- **Touch target**: Menu items 44px minimum height (11px padding × 2 + 22px line)
- **Screen reader**: Announces popover label on open, items navigable
- **Dismiss**: Escape key, click outside (if not modal), Cancel button if present

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width bottom sheet, no arrow, slide-up animation |
| 600-1024px | Standard popover with arrow, max-width 375px |
| > 1024px | Standard popover, positioned relative to trigger element |

## Do / Don't

| Do | Don't |
|----|-------|
| Anchor to the trigger element with an arrow | Float the popover randomly without anchor |
| Use for focused, contextual content (2-8 items) | Put complex multi-screen flows in a popover |
| Dismiss on tap outside for non-critical content | Require explicit close for simple info popovers |
| Use consistent 13px border-radius | Mix corner radii between popover and contained elements |
| Fall back to bottom sheet on mobile | Show tiny popovers on phone-sized screens |
