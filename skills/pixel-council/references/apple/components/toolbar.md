---
name: toolbar
description: Apple toolbar and navigation bar with large title, blur background, and bar buttons
metadata:
  tags: toolbar, navigation bar, header, top bar, app bar, title bar
---

# Toolbar -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 44px |
| Background | Liquid Glass (blur 20px) |
| Item touch target | 44x44px |
| Icon size | 22px |
| Icon color (light) | #007AFF |
| Icon color (dark) | #0A84FF |
| Label font | SF Pro, 17px/22px, weight 400 |

## Design Tokens

```css
:root {
  --apple-toolbar-bg: rgba(255, 255, 255, 0.72);
  --apple-toolbar-border: rgba(60, 60, 67, 0.29);
  --apple-toolbar-action: #007AFF;
  --apple-toolbar-label: #000000;
  --apple-toolbar-secondary: rgba(60, 60, 67, 0.6);
  --apple-toolbar-separator: rgba(60, 60, 67, 0.29);
  --apple-toolbar-disabled: rgba(60, 60, 67, 0.3);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-toolbar-bg: rgba(30, 30, 30, 0.72);
    --apple-toolbar-border: rgba(84, 84, 88, 0.6);
    --apple-toolbar-action: #0A84FF;
    --apple-toolbar-label: #FFFFFF;
    --apple-toolbar-secondary: rgba(235, 235, 245, 0.6);
    --apple-toolbar-separator: rgba(84, 84, 88, 0.6);
    --apple-toolbar-disabled: rgba(235, 235, 245, 0.3);
  }
}

.dark {
  --apple-toolbar-bg: rgba(30, 30, 30, 0.72);
  --apple-toolbar-border: rgba(84, 84, 88, 0.6);
  --apple-toolbar-action: #0A84FF;
  --apple-toolbar-label: #FFFFFF;
  --apple-toolbar-secondary: rgba(235, 235, 245, 0.6);
  --apple-toolbar-separator: rgba(84, 84, 88, 0.6);
  --apple-toolbar-disabled: rgba(235, 235, 245, 0.3);
}
```

## Variants

| Variant | Position | Use Case |
|---------|----------|----------|
| Top toolbar | Top of view | Navigation, title, trailing actions |
| Bottom toolbar | Bottom of view | Contextual actions for content |
| Large title | Top, 96px height | Top-level view with prominent title |

## HTML Structure

```html
<!-- Top toolbar (navigation bar) -->
<header class="apple-toolbar" role="toolbar" aria-label="Page actions">
  <div class="apple-toolbar__leading">
    <button class="apple-toolbar__button" aria-label="Go back">
      <svg width="22" height="22" aria-hidden="true"><!-- chevron.left --></svg>
      <span class="apple-toolbar__back-label">Back</span>
    </button>
  </div>
  <div class="apple-toolbar__center">
    <h1 class="apple-toolbar__title">Page Title</h1>
  </div>
  <div class="apple-toolbar__trailing">
    <button class="apple-toolbar__button" aria-label="Edit">
      <svg width="22" height="22" aria-hidden="true"><!-- pencil icon --></svg>
    </button>
    <button class="apple-toolbar__button" aria-label="Share">
      <svg width="22" height="22" aria-hidden="true"><!-- share icon --></svg>
    </button>
  </div>
</header>

<!-- Bottom toolbar -->
<footer class="apple-toolbar apple-toolbar--bottom" role="toolbar" aria-label="Content actions">
  <button class="apple-toolbar__button" aria-label="Reply">
    <svg width="22" height="22" aria-hidden="true"><!-- reply icon --></svg>
  </button>
  <button class="apple-toolbar__button" aria-label="Archive">
    <svg width="22" height="22" aria-hidden="true"><!-- archive icon --></svg>
  </button>
  <div class="apple-toolbar__spacer"></div>
  <button class="apple-toolbar__button" aria-label="Delete">
    <svg width="22" height="22" aria-hidden="true"><!-- trash icon --></svg>
  </button>
  <!-- Overflow menu -->
  <button class="apple-toolbar__button apple-toolbar__button--more" aria-label="More actions"
          aria-haspopup="menu" aria-expanded="false">
    <svg width="22" height="22" aria-hidden="true"><!-- ellipsis.circle --></svg>
  </button>
</footer>
```

## Complete CSS

```css
.apple-toolbar {
  display: flex;
  align-items: center;
  width: 100%;
  height: 44px;
  padding: 0 8px;
  background: var(--apple-toolbar-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-bottom: 0.5px solid var(--apple-toolbar-border);
  position: sticky;
  top: 0;
  z-index: 50;
}

.apple-toolbar--bottom {
  position: fixed;
  bottom: 0;
  top: auto;
  border-bottom: none;
  border-top: 0.5px solid var(--apple-toolbar-border);
  padding-bottom: env(safe-area-inset-bottom, 0px);
  justify-content: space-around;
}

.apple-toolbar__leading,
.apple-toolbar__trailing {
  display: flex;
  align-items: center;
  gap: 4px;
  flex-shrink: 0;
}

.apple-toolbar__center {
  flex: 1;
  display: flex;
  justify-content: center;
  overflow: hidden;
}

.apple-toolbar__title {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Helvetica Neue', sans-serif;
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-toolbar-label);
  margin: 0;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Large title variant */
.apple-toolbar--large {
  height: 96px;
  flex-direction: column;
  align-items: flex-start;
  padding: 0 16px;
}

.apple-toolbar--large .apple-toolbar__title {
  font-size: 34px;
  font-weight: 700;
  line-height: 41px;
  letter-spacing: 0.37px;
}

.apple-toolbar__button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 44px;
  min-height: 44px;
  padding: 0 8px;
  gap: 4px;
  background: none;
  border: none;
  color: var(--apple-toolbar-action);
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  border-radius: 8px;
  transition: opacity 100ms ease;
}

.apple-toolbar__back-label {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-toolbar-action);
}

.apple-toolbar__spacer {
  flex: 1;
}

/* Hover */
@media (hover: hover) {
  .apple-toolbar__button:hover {
    opacity: 0.7;
  }
}

/* Focus */
.apple-toolbar__button:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}
@media (prefers-color-scheme: dark) {
  .apple-toolbar__button:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-toolbar__button:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

/* Active / pressed */
.apple-toolbar__button:active {
  opacity: 0.4;
}

/* Disabled */
.apple-toolbar__button:disabled,
.apple-toolbar__button[aria-disabled="true"] {
  color: var(--apple-toolbar-disabled);
  cursor: not-allowed;
  pointer-events: none;
}
```

## States Reference

| State | Color | Opacity | Cursor |
|-------|-------|---------|--------|
| Default | #007AFF | 1 | pointer |
| Hover | #007AFF | 0.7 | pointer |
| Focus | #007AFF | 1 | pointer |
| Pressed | #007AFF | 0.4 | pointer |
| Disabled | tertiary label | 1 | not-allowed |

## Animation & Motion

```css
/* Large title collapse on scroll (JS-driven) */
.apple-toolbar--large[data-collapsed="true"] {
  height: 44px;
}

.apple-toolbar--large[data-collapsed="true"] .apple-toolbar__title {
  font-size: 17px;
  font-weight: 600;
}

.apple-toolbar__button {
  transition: opacity 100ms ease;
}

@media (prefers-reduced-motion: reduce) {
  .apple-toolbar,
  .apple-toolbar__button,
  .apple-toolbar__title {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="toolbar"`, `aria-label` describing toolbar purpose
- Overflow: `aria-haspopup="menu"`, `aria-expanded` on more-actions button
- Keyboard: Tab to enter toolbar; Arrow Left/Right between items; Enter/Space to activate
- Focus: 4px solid `rgba(0,122,255,0.6)` outline, 1px offset
- Touch target: 44x44px minimum for all buttons
- Back button: Announced as "Go back" or "Back, [previous page]"

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width, items collapse to overflow menu |
| 600-1024px | More items visible; toolbar may combine with tab bar |
| > 1024px | All items visible; customizable arrangement |

## Do / Don't

| Do | Don't |
|----|-------|
| Use monochromatic icon appearance | Use bright/colorful toolbar icons |
| Provide overflow menu for excess items | Let items clip or overlap |
| Use large title for top-level views only | Use large title on deep navigation pages |
| Keep 2-3 trailing actions max | Overcrowd with more than 4 actions |
| Mirror toolbar actions in app menu (macOS) | Have toolbar-only actions with no alternative |
