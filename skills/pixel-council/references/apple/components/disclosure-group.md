---
name: disclosure-group
description: Apple disclosure group — expand/collapse content sections with chevron animation, nested groups
metadata:
  tags: disclosure, accordion, collapsible, expand, collapse, chevron, details, section, group
---

# Disclosure Group -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Row height | 44px minimum |
| Chevron size | 13x8px |
| Corner radius | 10px (grouped) |
| Font | SF Pro, 17px/22px, weight 400 |
| Chevron color (light) | rgba(60,60,67,0.3) |
| Chevron color (dark) | rgba(235,235,245,0.3) |
| Animation | 250ms ease-in-out |
| CSS prefix | `.apple-disclosure` |

## Design Tokens

```css
:root {
  --apple-disclosure-bg: #FFFFFF;
  --apple-disclosure-grouped-bg: #F2F2F7;
  --apple-disclosure-text: #000000;
  --apple-disclosure-secondary: rgba(60, 60, 67, 0.6);
  --apple-disclosure-chevron: rgba(60, 60, 67, 0.3);
  --apple-disclosure-tint: #007AFF;
  --apple-disclosure-separator: rgba(60, 60, 67, 0.29);
  --apple-disclosure-fill: rgba(120, 120, 128, 0.12);
  --apple-disclosure-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-disclosure-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-disclosure-bg: #1C1C1E;
    --apple-disclosure-grouped-bg: #000000;
    --apple-disclosure-text: #FFFFFF;
    --apple-disclosure-secondary: rgba(235, 235, 245, 0.6);
    --apple-disclosure-chevron: rgba(235, 235, 245, 0.3);
    --apple-disclosure-tint: #0A84FF;
    --apple-disclosure-separator: rgba(84, 84, 88, 0.6);
    --apple-disclosure-fill: rgba(120, 120, 128, 0.24);
    --apple-disclosure-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-disclosure-bg: #1C1C1E;
  --apple-disclosure-grouped-bg: #000000;
  --apple-disclosure-text: #FFFFFF;
  --apple-disclosure-secondary: rgba(235, 235, 245, 0.6);
  --apple-disclosure-chevron: rgba(235, 235, 245, 0.3);
  --apple-disclosure-tint: #0A84FF;
  --apple-disclosure-separator: rgba(84, 84, 88, 0.6);
  --apple-disclosure-fill: rgba(120, 120, 128, 0.24);
  --apple-disclosure-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Chevron Position | Container |
|-------|-------------|-----------------|-----------|
| Standalone | Single collapsible section | Leading (left) | No container |
| Inset Grouped | Within a grouped list/card | Leading (left) | Rounded card |
| Sidebar | In sidebar navigation | Trailing (right) | Sidebar |
| Nested | Disclosure inside disclosure | Leading (left) | Indented |

## HTML Structure

```html
<!-- Standalone Disclosure Group -->
<details class="apple-disclosure" open>
  <summary class="apple-disclosure__header">
    <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
      <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <span class="apple-disclosure__title">Advanced Settings</span>
  </summary>
  <div class="apple-disclosure__content">
    <!-- Collapsed content here -->
    <p>Content that is revealed when expanded.</p>
  </div>
</details>

<!-- Inset Grouped Disclosure (in a list) -->
<div class="apple-disclosure-list">
  <details class="apple-disclosure apple-disclosure--grouped">
    <summary class="apple-disclosure__header">
      <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
        <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      <span class="apple-disclosure__title">Privacy</span>
      <span class="apple-disclosure__badge">3</span>
    </summary>
    <div class="apple-disclosure__content">
      <div class="apple-disclosure__item">
        <span>Location Services</span>
        <span class="apple-disclosure__detail">On</span>
      </div>
      <div class="apple-disclosure__item">
        <span>Tracking</span>
        <span class="apple-disclosure__detail">Ask</span>
      </div>
      <div class="apple-disclosure__item">
        <span>Analytics</span>
        <span class="apple-disclosure__detail">Off</span>
      </div>
    </div>
  </details>

  <details class="apple-disclosure apple-disclosure--grouped">
    <summary class="apple-disclosure__header">
      <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
        <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      <span class="apple-disclosure__title">Notifications</span>
    </summary>
    <div class="apple-disclosure__content">
      <div class="apple-disclosure__item">
        <span>Allow Notifications</span>
      </div>
    </div>
  </details>
</div>

<!-- Sidebar Disclosure (trailing chevron) -->
<details class="apple-disclosure apple-disclosure--sidebar" open>
  <summary class="apple-disclosure__header">
    <span class="apple-disclosure__title">Favorites</span>
    <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
      <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  </summary>
  <div class="apple-disclosure__content">
    <a class="apple-disclosure__nav-item" href="#">Desktop</a>
    <a class="apple-disclosure__nav-item" href="#">Documents</a>
    <a class="apple-disclosure__nav-item" href="#">Downloads</a>
  </div>
</details>

<!-- Nested Disclosure -->
<details class="apple-disclosure" open>
  <summary class="apple-disclosure__header">
    <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
      <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <span class="apple-disclosure__title">Section A</span>
  </summary>
  <div class="apple-disclosure__content">
    <details class="apple-disclosure apple-disclosure--nested">
      <summary class="apple-disclosure__header">
        <svg class="apple-disclosure__chevron" width="13" height="8" viewBox="0 0 13 8" aria-hidden="true">
          <path d="M1.5 1.5L6.5 6.5L11.5 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="apple-disclosure__title">Sub-section</span>
      </summary>
      <div class="apple-disclosure__content">
        <p>Nested content here.</p>
      </div>
    </details>
  </div>
</details>
```

## Complete CSS

```css
.apple-disclosure {
  font-family: var(--apple-disclosure-font);
  -webkit-font-smoothing: antialiased;
}

/* Reset details marker */
.apple-disclosure summary {
  list-style: none;
}
.apple-disclosure summary::-webkit-details-marker {
  display: none;
}

/* Header / trigger */
.apple-disclosure__header {
  display: flex;
  align-items: center;
  gap: 8px;
  min-height: 44px;
  padding: 11px 16px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms ease-out;
}

/* Chevron */
.apple-disclosure__chevron {
  color: var(--apple-disclosure-chevron);
  flex-shrink: 0;
  width: 13px;
  height: 8px;
  transform: rotate(-90deg);
  transition: transform 250ms ease-in-out;
}
.apple-disclosure[open] > .apple-disclosure__header .apple-disclosure__chevron {
  transform: rotate(0deg);
}

/* Title */
.apple-disclosure__title {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-disclosure-text);
  flex: 1;
}

/* Badge */
.apple-disclosure__badge {
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  color: var(--apple-disclosure-secondary);
}

/* Content area */
.apple-disclosure__content {
  overflow: hidden;
  animation: apple-disclosure-expand 250ms ease-in-out;
}

/* Items within content */
.apple-disclosure__item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  min-height: 44px;
  padding: 11px 16px 11px 40px;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-disclosure-text);
  border-top: 0.5px solid var(--apple-disclosure-separator);
}
.apple-disclosure__detail {
  color: var(--apple-disclosure-secondary);
}

/* ---- Grouped variant ---- */
.apple-disclosure-list {
  background: var(--apple-disclosure-bg);
  border-radius: 10px;
  overflow: hidden;
}
.apple-disclosure--grouped {
  border-bottom: 0.5px solid var(--apple-disclosure-separator);
}
.apple-disclosure--grouped:last-child { border-bottom: none; }

/* ---- Sidebar variant ---- */
.apple-disclosure--sidebar .apple-disclosure__header {
  padding: 8px 12px;
  min-height: 32px;
}
.apple-disclosure--sidebar .apple-disclosure__title {
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-disclosure-secondary);
  text-transform: uppercase;
}
.apple-disclosure--sidebar .apple-disclosure__chevron {
  order: 1;
}

.apple-disclosure__nav-item {
  display: flex;
  align-items: center;
  min-height: 32px;
  padding: 6px 12px 6px 24px;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  color: var(--apple-disclosure-text);
  text-decoration: none;
  border-radius: 6px;
  transition: background-color 150ms ease-out;
}

/* ---- Nested variant ---- */
.apple-disclosure--nested .apple-disclosure__header {
  padding-left: 40px;
}
.apple-disclosure--nested .apple-disclosure__item {
  padding-left: 64px;
}

/* Focus */
.apple-disclosure__header:focus-visible {
  outline: 4px solid var(--apple-disclosure-focus-ring);
  outline-offset: -4px;
  border-radius: 6px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-disclosure__header:hover {
    background: var(--apple-disclosure-fill);
  }
  .apple-disclosure__nav-item:hover {
    background: var(--apple-disclosure-fill);
  }
}

/* Active */
.apple-disclosure__header:active {
  background: var(--apple-disclosure-fill);
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-disclosure__header:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-disclosure__header:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Header Bg | Chevron | Content | Cursor |
|-------|-----------|---------|---------|--------|
| Collapsed | transparent | rotated -90deg | hidden | pointer |
| Expanded | transparent | rotated 0deg | visible, animated | pointer |
| Hover | fill bg | — | — | pointer |
| Focus | 4px blue ring (inset) | — | — | pointer |
| Active | fill bg | — | — | pointer |

## Animation & Motion

```css
/* Chevron rotation */
.apple-disclosure__chevron {
  transition: transform 250ms ease-in-out;
}

/* Content expand */
@keyframes apple-disclosure-expand {
  from { opacity: 0; max-height: 0; }
  to { opacity: 1; max-height: 1000px; }
}

/* Content collapse (triggered via JS when closing) */
@keyframes apple-disclosure-collapse {
  from { opacity: 1; max-height: 1000px; }
  to { opacity: 0; max-height: 0; }
}

@media (prefers-reduced-motion: reduce) {
  .apple-disclosure__chevron {
    transition: none;
  }
  .apple-disclosure__content {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: `<details>` and `<summary>` provide built-in expand/collapse semantics; no additional ARIA needed. If using custom elements, use `aria-expanded` on trigger and `aria-controls` pointing to content
- **Keyboard**: Tab to focus summary, Enter/Space to toggle, focus moves naturally into revealed content
- **Focus ring**: 4px solid blue at 60% opacity, inset to match container shape
- **Touch target**: 44px minimum height for header
- **Screen reader**: Announces "disclosure triangle, [title], collapsed/expanded"
- **Nesting**: Each nested disclosure has its own summary/content pair, independently operable

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width, standard 44px rows, 16px horizontal padding |
| 600-1024px | Can be placed in grouped list cards, inset margins |
| > 1024px | Sidebar variant with 32px rows, tighter spacing |

## Do / Don't

| Do | Don't |
|----|-------|
| Use `<details>/<summary>` for native semantics | Use div+JS without ARIA attributes |
| Animate chevron rotation smoothly | Snap the chevron without transition |
| Indent nested disclosure content | Place nested groups at the same indent level |
| Use in settings screens for optional sections | Use for content that should always be visible |
| Keep headers concise (1 line) | Put paragraphs of text in the header |
