---
name: list
description: Apple inset-grouped and plain list rows with accessories and swipe actions
metadata:
  tags: list, list item, table view, settings, rows, menu
---

# List -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Row height (compact) | 44px |
| Row height (with subtitle) | 60px |
| Padding (plain) | 16px horizontal |
| Padding (inset grouped) | 20px horizontal |
| Corner radius (grouped) | 10px |
| Separator inset | 60px from leading edge |
| Font (primary) | SF Pro, 17px/22px, weight 400 |
| Font (secondary) | SF Pro, 15px/20px, weight 400 |
| Background (light) | #FFFFFF |
| Background (dark) | #000000 |

## Design Tokens

```css
:root {
  --apple-list-bg: #FFFFFF;
  --apple-list-grouped-bg: #F2F2F7;
  --apple-list-cell-bg: #FFFFFF;
  --apple-list-text: #000000;
  --apple-list-text-secondary: rgba(60, 60, 67, 0.6);
  --apple-list-separator: rgba(60, 60, 67, 0.29);
  --apple-list-blue: #007AFF;
  --apple-list-red: #FF3B30;
  --apple-list-chevron: rgba(60, 60, 67, 0.3);
  --apple-list-section-radius: 10px;
  --apple-list-hover: rgba(0, 0, 0, 0.04);
  --apple-list-active: rgba(0, 0, 0, 0.08);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-list-bg: #000000;
    --apple-list-grouped-bg: #000000;
    --apple-list-cell-bg: #1C1C1E;
    --apple-list-text: #FFFFFF;
    --apple-list-text-secondary: rgba(235, 235, 245, 0.6);
    --apple-list-separator: rgba(84, 84, 88, 0.6);
    --apple-list-blue: #0A84FF;
    --apple-list-red: #FF453A;
    --apple-list-chevron: rgba(235, 235, 245, 0.3);
    --apple-list-hover: rgba(255, 255, 255, 0.06);
    --apple-list-active: rgba(255, 255, 255, 0.1);
  }
}

.dark {
  --apple-list-bg: #000000;
  --apple-list-grouped-bg: #000000;
  --apple-list-cell-bg: #1C1C1E;
  --apple-list-text: #FFFFFF;
  --apple-list-text-secondary: rgba(235, 235, 245, 0.6);
  --apple-list-separator: rgba(84, 84, 88, 0.6);
  --apple-list-blue: #0A84FF;
  --apple-list-red: #FF453A;
  --apple-list-chevron: rgba(235, 235, 245, 0.3);
  --apple-list-hover: rgba(255, 255, 255, 0.06);
  --apple-list-active: rgba(255, 255, 255, 0.1);
}
```

## Variants

| Style | Background | Cell BG | Corners | Description |
|-------|-----------|---------|---------|-------------|
| Plain | systemBackground | transparent | 0px | Full-width rows, no grouping |
| Inset Grouped | groupedBackground | secondaryGroupedBg | 10px | Rounded sections with inset margins |
| Sidebar | secondaryBackground | transparent | 8px (selected) | Navigation sidebar (macOS/iPadOS) |

## HTML Structure

```html
<!-- Plain list -->
<ul class="apple-list" role="list">
  <li class="apple-list__row" role="listitem">
    <span class="apple-list__label">Wi-Fi</span>
    <span class="apple-list__detail">Connected</span>
    <svg class="apple-list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron.right --></svg>
  </li>
  <li class="apple-list__separator" role="separator"></li>
  <li class="apple-list__row" role="listitem">
    <span class="apple-list__label">Bluetooth</span>
    <span class="apple-list__detail">On</span>
    <svg class="apple-list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron.right --></svg>
  </li>
</ul>

<!-- Inset grouped list -->
<div class="apple-list apple-list--grouped">
  <section class="apple-list__section">
    <header class="apple-list__section-header">General</header>
    <ul class="apple-list__section-body" role="list">
      <li class="apple-list__row" role="listitem">
        <span class="apple-list__icon" aria-hidden="true" style="background:#007AFF">
          <svg width="22" height="22"><!-- icon --></svg>
        </span>
        <span class="apple-list__content">
          <span class="apple-list__label">About</span>
        </span>
        <svg class="apple-list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron --></svg>
      </li>
      <li class="apple-list__separator" role="separator"></li>
      <li class="apple-list__row apple-list__row--with-subtitle" role="listitem">
        <span class="apple-list__content">
          <span class="apple-list__label">Software Update</span>
          <span class="apple-list__subtitle">1 Update Available</span>
        </span>
        <svg class="apple-list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron --></svg>
      </li>
    </ul>
    <footer class="apple-list__section-footer">Information about this device.</footer>
  </section>
</div>

<!-- Row with swipe actions -->
<li class="apple-list__row apple-list__row--swipeable" role="listitem">
  <div class="apple-list__swipe-actions apple-list__swipe-actions--leading">
    <button class="apple-list__swipe-action" style="background:#007AFF" aria-label="Pin">Pin</button>
  </div>
  <div class="apple-list__row-content">
    <span class="apple-list__label">Inbox Message</span>
  </div>
  <div class="apple-list__swipe-actions apple-list__swipe-actions--trailing">
    <button class="apple-list__swipe-action" style="background:#FF3B30" aria-label="Delete">Delete</button>
  </div>
</li>
```

## Complete CSS

```css
.apple-list {
  list-style: none;
  margin: 0;
  padding: 0;
  background: var(--apple-list-bg);
  color: var(--apple-list-text);
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
}

/* Grouped variant */
.apple-list--grouped {
  background: var(--apple-list-grouped-bg);
  padding: 0 20px;
}
.apple-list__section { margin-bottom: 20px; }
.apple-list__section-body {
  list-style: none; margin: 0; padding: 0;
  background: var(--apple-list-cell-bg);
  border-radius: var(--apple-list-section-radius);
  overflow: hidden;
}
.apple-list__section-header {
  font-size: 13px; font-weight: 400; line-height: 18px; letter-spacing: -0.08px;
  color: var(--apple-list-text-secondary);
  padding: 8px 16px 6px;
  text-transform: uppercase;
}
.apple-list__section-footer {
  font-size: 13px; font-weight: 400; line-height: 18px; letter-spacing: -0.08px;
  color: var(--apple-list-text-secondary);
  padding: 6px 16px 0;
}

/* Row */
.apple-list__row {
  display: flex;
  align-items: center;
  gap: 12px;
  min-height: 44px;
  padding: 10px 16px;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 100ms ease;
}
.apple-list__row--with-subtitle { min-height: 60px; }
.apple-list__row:hover { background: var(--apple-list-hover); }
.apple-list__row:active { background: var(--apple-list-active); }
.apple-list__row:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: -4px;
}

/* Content */
.apple-list__content { flex: 1; min-width: 0; }
.apple-list__label {
  display: block;
  font-size: 17px; line-height: 22px; font-weight: 400; letter-spacing: -0.41px;
  color: var(--apple-list-text);
  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}
.apple-list__subtitle {
  display: block;
  font-size: 15px; line-height: 20px; font-weight: 400; letter-spacing: -0.24px;
  color: var(--apple-list-text-secondary);
}
.apple-list__detail {
  font-size: 17px; line-height: 22px; font-weight: 400; letter-spacing: -0.41px;
  color: var(--apple-list-text-secondary);
  flex-shrink: 0;
}
.apple-list__icon {
  width: 29px; height: 29px; border-radius: 6px;
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0; color: #FFFFFF;
}
.apple-list__chevron {
  width: 7px; height: 12px; flex-shrink: 0;
  color: var(--apple-list-chevron); fill: none; stroke: currentColor; stroke-width: 2;
}

/* Separator */
.apple-list__separator {
  height: 0.5px;
  background: var(--apple-list-separator);
  margin-left: 60px;
  list-style: none;
}

/* Swipe actions */
.apple-list__row--swipeable { position: relative; overflow: hidden; }
.apple-list__swipe-actions {
  position: absolute; top: 0; bottom: 0;
  display: flex;
}
.apple-list__swipe-actions--leading { left: 0; transform: translateX(-100%); }
.apple-list__swipe-actions--trailing { right: 0; transform: translateX(100%); }
.apple-list__swipe-action {
  display: flex; align-items: center; justify-content: center;
  padding: 0 20px; border: none; color: #FFFFFF;
  font-size: 15px; font-weight: 500; cursor: pointer;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-list { background: var(--apple-list-bg); color: var(--apple-list-text); }
  .apple-list--grouped { background: var(--apple-list-grouped-bg); }
  .apple-list__section-body { background: var(--apple-list-cell-bg); }
}
.dark .apple-list { background: var(--apple-list-bg); color: var(--apple-list-text); }
.dark .apple-list--grouped { background: var(--apple-list-grouped-bg); }
.dark .apple-list__section-body { background: var(--apple-list-cell-bg); }

@media (prefers-reduced-motion: reduce) {
  .apple-list__row { transition: none; }
}
```

## States Reference

| State | Background | Text | Cursor |
|-------|-----------|------|--------|
| Default | transparent | #000000 | pointer |
| Hover | rgba(0,0,0,0.04) | #000000 | pointer |
| Active/Pressed | rgba(0,0,0,0.08) | #000000 | pointer |
| Focus | focus ring | #000000 | pointer |
| Selected (sidebar) | rgba(0,122,255,0.1) | #007AFF | pointer |

## Animation & Motion

```css
.apple-list__row {
  transition: background-color 100ms ease;
}
/* Swipe reveal */
.apple-list__swipe-actions {
  transition: transform 250ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
@media (prefers-reduced-motion: reduce) {
  .apple-list__row, .apple-list__swipe-actions { transition: none; }
}
```

## Accessibility

- List container: `<ul>` with `role="list"`
- Rows: `<li>` with `role="listitem"`, interactive rows are focusable
- Disclosure: chevron is decorative (`aria-hidden="true"`)
- Swipe actions: must also be accessible via long-press or edit mode
- Keyboard: Tab to focus rows, Enter/Space to activate, Arrow Up/Down to navigate
- Focus: 4px solid rgba(0,122,255,0.6) outline
- Touch target: 44px min height per row
- Section headers: use `<header>` for semantic grouping, `aria-label` on section if needed
- Screen reader: announce label, subtitle, and detail text

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width plain list; grouped with 16px side margin |
| 600-1024px | Inset grouped with 20px side margin; split view possible |
| > 1024px | Sidebar + detail layout; max-width on list panel |

## Do / Don't

| Do | Don't |
|----|-------|
| Use grouped style for settings-like forms | Use plain list for settings (lacks visual grouping) |
| Inset separators aligned to text start (60px) | Full-width separators on every row |
| Use chevron only for drill-down navigation | Use chevron for toggles or actions |
| Keep row labels concise and scannable | Use multi-line primary labels |
| Place destructive swipe action (delete) trailing | Put delete as a leading swipe action |
