---
name: split-view
description: Apple split view — two/three column layout, sidebar+detail, responsive collapse, adaptive width
metadata:
  tags: split view, multi-pane, sidebar, detail, master detail, columns, responsive, layout
---

# Split View -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Sidebar width | 320px (default), 240-400px range |
| Supplementary width | 300-400px |
| Sidebar collapse | < 1024px |
| Column separator | 0.5px, separator color |
| Background sidebar (light) | #F2F2F7 |
| Background sidebar (dark) | #1C1C1E |
| Background detail (light) | #FFFFFF |
| Background detail (dark) | #000000 |
| CSS prefix | `.apple-splitview` |

## Design Tokens

```css
:root {
  --apple-splitview-sidebar-bg: #F2F2F7;
  --apple-splitview-detail-bg: #FFFFFF;
  --apple-splitview-supplementary-bg: #FFFFFF;
  --apple-splitview-separator: rgba(60, 60, 67, 0.29);
  --apple-splitview-text: #000000;
  --apple-splitview-secondary: rgba(60, 60, 67, 0.6);
  --apple-splitview-tint: #007AFF;
  --apple-splitview-selected: rgba(0, 122, 255, 0.12);
  --apple-splitview-fill: rgba(120, 120, 128, 0.12);
  --apple-splitview-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-splitview-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-splitview-sidebar-bg: #1C1C1E;
    --apple-splitview-detail-bg: #000000;
    --apple-splitview-supplementary-bg: #1C1C1E;
    --apple-splitview-separator: rgba(84, 84, 88, 0.6);
    --apple-splitview-text: #FFFFFF;
    --apple-splitview-secondary: rgba(235, 235, 245, 0.6);
    --apple-splitview-tint: #0A84FF;
    --apple-splitview-selected: rgba(10, 132, 255, 0.2);
    --apple-splitview-fill: rgba(120, 120, 128, 0.24);
    --apple-splitview-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-splitview-sidebar-bg: #1C1C1E;
  --apple-splitview-detail-bg: #000000;
  --apple-splitview-supplementary-bg: #1C1C1E;
  --apple-splitview-separator: rgba(84, 84, 88, 0.6);
  --apple-splitview-text: #FFFFFF;
  --apple-splitview-secondary: rgba(235, 235, 245, 0.6);
  --apple-splitview-tint: #0A84FF;
  --apple-splitview-selected: rgba(10, 132, 255, 0.2);
  --apple-splitview-fill: rgba(120, 120, 128, 0.24);
  --apple-splitview-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Columns | Collapse Behavior | Use Case |
|-------|---------|------------------|----------|
| Two Column | Sidebar + Detail | Sidebar overlays or hides | Mail, Notes |
| Three Column | Sidebar + Supplementary + Detail | Progressive collapse | Mail with preview |
| Double Column | Content + Inspector | Inspector slides in | Settings |

## HTML Structure

```html
<!-- Two Column Split View -->
<div class="apple-splitview" data-columns="2">
  <aside class="apple-splitview__sidebar" role="navigation" aria-label="Sidebar">
    <div class="apple-splitview__sidebar-header">
      <h2 class="apple-splitview__sidebar-title">Mailboxes</h2>
    </div>
    <nav class="apple-splitview__sidebar-nav">
      <a class="apple-splitview__nav-item apple-splitview__nav-item--selected" href="#" aria-current="true">
        <svg class="apple-splitview__nav-icon" aria-hidden="true" width="20" height="20"><!-- inbox --></svg>
        <span>Inbox</span>
        <span class="apple-splitview__nav-badge">3</span>
      </a>
      <a class="apple-splitview__nav-item" href="#">
        <svg class="apple-splitview__nav-icon" aria-hidden="true" width="20" height="20"><!-- sent --></svg>
        <span>Sent</span>
      </a>
      <a class="apple-splitview__nav-item" href="#">
        <svg class="apple-splitview__nav-icon" aria-hidden="true" width="20" height="20"><!-- drafts --></svg>
        <span>Drafts</span>
      </a>
    </nav>
  </aside>

  <main class="apple-splitview__detail" role="main">
    <div class="apple-splitview__detail-header">
      <button class="apple-splitview__toggle" aria-label="Toggle sidebar" aria-expanded="true">
        <svg width="20" height="18" viewBox="0 0 20 18" aria-hidden="true">
          <rect x="0" y="0" width="6" height="18" rx="2" fill="currentColor" opacity="0.3"/>
          <rect x="8" y="0" width="12" height="18" rx="2" fill="none" stroke="currentColor" stroke-width="1.5"/>
        </svg>
      </button>
      <h1 class="apple-splitview__detail-title">Inbox</h1>
    </div>
    <div class="apple-splitview__detail-content">
      <!-- Detail content -->
    </div>
  </main>
</div>

<!-- Three Column Split View -->
<div class="apple-splitview" data-columns="3">
  <aside class="apple-splitview__sidebar" role="navigation" aria-label="Sidebar">
    <!-- Same sidebar nav -->
  </aside>
  <div class="apple-splitview__supplementary" role="complementary">
    <div class="apple-splitview__supplementary-header">
      <h2>Messages</h2>
    </div>
    <div class="apple-splitview__supplementary-list">
      <!-- Message list items -->
    </div>
  </div>
  <main class="apple-splitview__detail" role="main">
    <!-- Message detail -->
  </main>
</div>
```

## Complete CSS

```css
.apple-splitview {
  display: flex;
  width: 100%;
  height: 100vh;
  font-family: var(--apple-splitview-font);
  -webkit-font-smoothing: antialiased;
  overflow: hidden;
}

/* ---- Sidebar ---- */
.apple-splitview__sidebar {
  width: 320px;
  min-width: 240px;
  max-width: 400px;
  background: var(--apple-splitview-sidebar-bg);
  border-right: 0.5px solid var(--apple-splitview-separator);
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  flex-shrink: 0;
  transition: width 300ms ease-in-out, margin-left 300ms ease-in-out;
}

.apple-splitview__sidebar-header {
  padding: 12px 16px 8px;
  position: sticky;
  top: 0;
  background: var(--apple-splitview-sidebar-bg);
  z-index: 1;
}

.apple-splitview__sidebar-title {
  font-size: 28px;
  font-weight: 700;
  line-height: 34px;
  letter-spacing: 0.36px;
  color: var(--apple-splitview-text);
  margin: 0;
}

/* Navigation items */
.apple-splitview__nav-item {
  display: flex;
  align-items: center;
  gap: 10px;
  min-height: 44px;
  padding: 8px 16px;
  border-radius: 10px;
  margin: 1px 8px;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-splitview-text);
  text-decoration: none;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}

.apple-splitview__nav-item--selected {
  background: var(--apple-splitview-selected);
  color: var(--apple-splitview-tint);
  font-weight: 500;
}

.apple-splitview__nav-icon {
  flex-shrink: 0;
  width: 20px;
  height: 20px;
}
.apple-splitview__nav-item--selected .apple-splitview__nav-icon {
  color: var(--apple-splitview-tint);
}

.apple-splitview__nav-badge {
  margin-left: auto;
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  color: var(--apple-splitview-secondary);
}

/* ---- Supplementary (middle column) ---- */
.apple-splitview__supplementary {
  width: 340px;
  min-width: 300px;
  max-width: 400px;
  background: var(--apple-splitview-supplementary-bg);
  border-right: 0.5px solid var(--apple-splitview-separator);
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  flex-shrink: 0;
}

.apple-splitview__supplementary-header {
  padding: 12px 16px;
  border-bottom: 0.5px solid var(--apple-splitview-separator);
  position: sticky;
  top: 0;
  background: var(--apple-splitview-supplementary-bg);
  z-index: 1;
}
.apple-splitview__supplementary-header h2 {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  color: var(--apple-splitview-text);
  margin: 0;
}

/* ---- Detail ---- */
.apple-splitview__detail {
  flex: 1;
  background: var(--apple-splitview-detail-bg);
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  min-width: 0;
}

.apple-splitview__detail-header {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  border-bottom: 0.5px solid var(--apple-splitview-separator);
  position: sticky;
  top: 0;
  background: var(--apple-splitview-detail-bg);
  z-index: 1;
}

.apple-splitview__detail-title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-splitview-text);
  margin: 0;
}

.apple-splitview__detail-content {
  flex: 1;
  padding: 16px;
}

/* Toggle button */
.apple-splitview__toggle {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  background: none;
  border: none;
  color: var(--apple-splitview-tint);
  cursor: pointer;
  border-radius: 8px;
  padding: 0;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-splitview__toggle:active { opacity: 0.5; }

/* Sidebar collapsed */
.apple-splitview__sidebar--collapsed {
  margin-left: -320px;
}

/* Focus */
.apple-splitview__nav-item:focus-visible,
.apple-splitview__toggle:focus-visible {
  outline: 4px solid var(--apple-splitview-focus-ring);
  outline-offset: 1px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-splitview__nav-item:hover:not(.apple-splitview__nav-item--selected) {
    background: var(--apple-splitview-fill);
  }
  .apple-splitview__toggle:hover {
    background: var(--apple-splitview-fill);
  }
}

/* Responsive collapse */
@media (max-width: 1023px) {
  .apple-splitview__sidebar {
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    z-index: 50;
    box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
    transform: translateX(-100%);
    transition: transform 300ms ease-in-out;
  }
  .apple-splitview__sidebar--open {
    transform: translateX(0);
  }
  .apple-splitview[data-columns="3"] .apple-splitview__supplementary {
    width: 100%;
    max-width: none;
    border-right: none;
  }
}

@media (max-width: 599px) {
  .apple-splitview__supplementary {
    display: none;
  }
  .apple-splitview__detail { width: 100%; }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-splitview__nav-item:focus-visible,
  .apple-splitview__toggle:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-splitview__nav-item:focus-visible,
.dark .apple-splitview__toggle:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Nav Item | Toggle | Sidebar | Cursor |
|-------|---------|--------|---------|--------|
| Default | transparent | transparent | visible | pointer |
| Hover | fill bg | fill bg | — | pointer |
| Focus | 4px blue ring | 4px blue ring | — | pointer |
| Active | — | opacity 0.5 | — | pointer |
| Selected | tint bg, tint text | — | — | default |
| Collapsed | — | icon changes | hidden/overlay | — |

## Animation & Motion

```css
/* Sidebar slide */
.apple-splitview__sidebar {
  transition: width 300ms ease-in-out, margin-left 300ms ease-in-out, transform 300ms ease-in-out;
}

/* Nav item hover */
.apple-splitview__nav-item {
  transition: background-color 150ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-splitview__sidebar,
  .apple-splitview__nav-item,
  .apple-splitview__toggle {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: Sidebar has `role="navigation"` with `aria-label`, detail has `role="main"`, toggle has `aria-expanded`, selected nav item has `aria-current`
- **Keyboard**: Tab to navigate between sidebar items, Enter to select, shortcut to toggle sidebar (e.g., Cmd+Shift+S)
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: 44px minimum for nav items and toggle button
- **Screen reader**: Announces sidebar open/close state, selected navigation item
- **Responsive**: Sidebar becomes overlay on tablet/phone, still keyboard accessible

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Single column (detail only), sidebar as overlay, supplementary hidden |
| 600-1023px | Sidebar as overlay, supplementary takes full width OR split with detail |
| >= 1024px | All columns visible side-by-side, sidebar toggleable |

## Do / Don't

| Do | Don't |
|----|-------|
| Collapse sidebar to overlay on narrow screens | Force 3-column layout on phone |
| Use toggle button to show/hide sidebar | Auto-hide sidebar without a way to bring it back |
| Highlight the selected navigation item | Leave all nav items looking the same when one is active |
| Use sticky headers in each column | Let headers scroll away with content |
| Respect user's sidebar width preference | Lock sidebar to a single width |
