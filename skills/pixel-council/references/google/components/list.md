---
name: list
description: M3 one-line, two-line, three-line list items with leading/trailing elements
metadata:
  tags: list, list item, menu list, settings list, options
---

# List -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| One-line height | 56px |
| Two-line height | 72px |
| Three-line height | 88px |
| Padding (list) | 8px vertical |
| Padding (item) | 0px vertical, 16px horizontal |
| Corner radius | 0px |
| Font (headline) | Roboto, 16px/24px, weight 400 |
| Font (supporting) | Roboto, 14px/20px, weight 400 |
| Background (light) | #FEF7FF |
| Background (dark) | #141218 |

## Design Tokens

```css
:root {
  --md-list-bg: #FEF7FF;
  --md-list-text: #1D1B20;
  --md-list-text-secondary: #49454F;
  --md-list-divider: #CAC4D0;
  --md-list-hover: rgba(29, 27, 32, 0.08);
  --md-list-focus: rgba(29, 27, 32, 0.10);
  --md-list-pressed: rgba(29, 27, 32, 0.10);
  --md-list-avatar-bg: #EADDFF;
  --md-list-avatar-text: #21005D;
  --md-list-icon-color: #49454F;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-list-bg: #141218;
    --md-list-text: #E6E0E9;
    --md-list-text-secondary: #CAC4D0;
    --md-list-divider: #49454F;
    --md-list-hover: rgba(230, 224, 233, 0.08);
    --md-list-focus: rgba(230, 224, 233, 0.10);
    --md-list-pressed: rgba(230, 224, 233, 0.10);
    --md-list-avatar-bg: #4F378B;
    --md-list-avatar-text: #EADDFF;
    --md-list-icon-color: #CAC4D0;
  }
}

.dark {
  --md-list-bg: #141218;
  --md-list-text: #E6E0E9;
  --md-list-text-secondary: #CAC4D0;
  --md-list-divider: #49454F;
  --md-list-hover: rgba(230, 224, 233, 0.08);
  --md-list-focus: rgba(230, 224, 233, 0.10);
  --md-list-pressed: rgba(230, 224, 233, 0.10);
  --md-list-avatar-bg: #4F378B;
  --md-list-avatar-text: #EADDFF;
  --md-list-icon-color: #CAC4D0;
}
```

## Variants

| Variant | Height | Description |
|---------|--------|-------------|
| One-line | 56px | Headline text only |
| Two-line | 72px | Headline + supporting text |
| Three-line | 88px | Headline + two-line supporting text |
| Interactive | varies | Clickable item with state layer |
| With avatar | varies | 40px circular leading image |
| With icon | varies | 24px leading/trailing icon |
| With image | varies | 56px leading image |

## HTML Structure

```html
<!-- Basic list -->
<ul class="md-list" role="list">
  <li class="md-list__item">
    <span class="md-list__headline">Headline</span>
  </li>
  <li class="md-list__item md-list__item--two-line">
    <span class="md-list__headline">Headline</span>
    <span class="md-list__supporting">Supporting text</span>
  </li>
</ul>

<!-- Interactive list -->
<ul class="md-list" role="list">
  <li class="md-list__item md-list__item--interactive" tabindex="0" role="listitem">
    <span class="md-list__start">
      <span class="md-list__avatar" aria-hidden="true">A</span>
    </span>
    <span class="md-list__body">
      <span class="md-list__headline">Headline</span>
      <span class="md-list__supporting">Supporting text</span>
    </span>
    <span class="md-list__end">
      <span class="md-list__trailing-text">100+</span>
    </span>
  </li>
  <li class="md-list__divider" role="separator"></li>
  <li class="md-list__item md-list__item--interactive" tabindex="0" role="listitem">
    <span class="md-list__start">
      <svg class="md-list__icon" aria-hidden="true" width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="md-list__body">
      <span class="md-list__headline">With icon</span>
    </span>
    <span class="md-list__end">
      <svg class="md-list__icon" aria-hidden="true" width="24" height="24"><!-- chevron --></svg>
    </span>
  </li>
</ul>

<!-- Three-line with image -->
<ul class="md-list" role="list">
  <li class="md-list__item md-list__item--three-line">
    <img class="md-list__image" src="photo.jpg" alt="" width="56" height="56" />
    <span class="md-list__body">
      <span class="md-list__headline">Headline</span>
      <span class="md-list__supporting">First line of supporting text<br>Second line</span>
    </span>
  </li>
</ul>
```

## Complete CSS

```css
.md-list {
  list-style: none;
  margin: 0;
  padding: 8px 0;
  background: var(--md-list-bg);
  color: var(--md-list-text);
}

.md-list__item {
  display: flex;
  align-items: center;
  gap: 16px;
  min-height: 56px;
  padding: 8px 16px;
  font-family: Roboto, sans-serif;
  position: relative;
}

.md-list__item--two-line { min-height: 72px; align-items: flex-start; padding: 8px 16px; }
.md-list__item--three-line { min-height: 88px; align-items: flex-start; padding: 12px 16px; }

/* Interactive */
.md-list__item--interactive {
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms cubic-bezier(0.2, 0, 0, 1);
}
.md-list__item--interactive:hover { background: var(--md-list-hover); }
.md-list__item--interactive:focus-visible {
  background: var(--md-list-focus);
  outline: none;
}
.md-list__item--interactive:active { background: var(--md-list-pressed); }
.md-list__item--interactive[aria-disabled="true"] {
  opacity: 0.38;
  pointer-events: none;
  cursor: default;
}

/* Body */
.md-list__body { flex: 1; min-width: 0; }
.md-list__headline {
  display: block;
  font-size: 16px;
  line-height: 24px;
  font-weight: 400;
  letter-spacing: 0.5px;
  color: var(--md-list-text);
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.md-list__supporting {
  display: block;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 0.25px;
  color: var(--md-list-text-secondary);
}
.md-list__item--three-line .md-list__supporting {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  white-space: normal;
}

/* Leading / Trailing */
.md-list__start, .md-list__end { display: flex; align-items: center; flex-shrink: 0; }
.md-list__avatar {
  width: 40px; height: 40px; border-radius: 9999px;
  background: var(--md-list-avatar-bg); color: var(--md-list-avatar-text);
  display: flex; align-items: center; justify-content: center;
  font-size: 16px; font-weight: 500; line-height: 24px; letter-spacing: 0.15px;
}
.md-list__icon { width: 24px; height: 24px; color: var(--md-list-icon-color); fill: currentColor; }
.md-list__image { width: 56px; height: 56px; object-fit: cover; border-radius: 0; flex-shrink: 0; }
.md-list__trailing-text {
  font-size: 11px; font-weight: 500; line-height: 16px; letter-spacing: 0.5px;
  color: var(--md-list-text-secondary);
}

/* Divider */
.md-list__divider {
  height: 1px;
  background: var(--md-list-divider);
  margin: 0 0 0 16px;
  list-style: none;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .md-list { background: var(--md-list-bg); color: var(--md-list-text); }
}
.dark .md-list { background: var(--md-list-bg); color: var(--md-list-text); }

@media (prefers-reduced-motion: reduce) {
  .md-list__item--interactive { transition: none; }
}
```

## States Reference

| State | Background | Text | Opacity | Cursor |
|-------|-----------|------|---------|--------|
| Default | transparent | #1D1B20 | 1 | default |
| Hover | on-surface 8% | #1D1B20 | 1 | pointer |
| Focus | on-surface 10% | #1D1B20 | 1 | pointer |
| Active | on-surface 10% | #1D1B20 | 1 | pointer |
| Disabled | transparent | #1D1B20 | 0.38 | default |

## Animation & Motion

```css
.md-list__item--interactive {
  transition: background-color 150ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-list__item--interactive { transition: none; }
}
```

## Accessibility

- List container: `role="list"` on `<ul>`
- Items: `role="listitem"` on interactive `<li>`, `tabindex="0"`
- Keyboard: Tab to focus list, Arrow Up/Down between items, Enter/Space to activate
- Focus: visible background change (state layer), no outline override
- Touch target: min 48px height (satisfied by 56px min-height)
- Screen reader: headline announced as item label; supporting text as description
- Disabled items: `aria-disabled="true"`, opacity 0.38

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width list, 16px padding |
| 600-1024px | Max-width 560px centered or side-panel |
| > 1024px | Max-width 360px in navigation rail, full in main content |

## Do / Don't

| Do | Don't |
|----|-------|
| Use semantic `<ul>/<li>` markup | Use `<div>` soup for lists |
| Truncate long headlines with ellipsis | Wrap headline to multiple lines (use supporting text) |
| Inset dividers aligned to text start | Full-bleed dividers between every item |
| Use avatars for people, icons for actions | Mix avatar and icon styles in the same list |
| Keep three-line supporting text to 2 lines max | Allow unlimited text in supporting slot |
