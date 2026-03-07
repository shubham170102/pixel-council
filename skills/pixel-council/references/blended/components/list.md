---
name: list
description: Blended list items with leading/trailing elements, dividers, and swipe actions
metadata:
  tags: list, list item, settings list, options, rows, menu
---

# List -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Height (compact) | 48px |
| Height (standard) | 56px |
| Height (rich) | 72px |
| Padding | 16px horizontal |
| Leading avatar | 40px circular |
| Leading icon | 24px |
| Divider inset | 56px from start |
| Font (primary) | 16px/24px, weight 400 |
| Font (secondary) | 14px/20px, weight 400 |
| Corner radius (grouped) | 10px |

## Design Tokens

```css
:root {
  --list-bg: #FFFFFF;
  --list-grouped-bg: #F2F2F7;
  --list-cell-bg: #FFFFFF;
  --list-text: #1D1B20;
  --list-text-secondary: #49454F;
  --list-divider: #CAC4D0;
  --list-hover: rgba(29, 27, 32, 0.06);
  --list-active: rgba(29, 27, 32, 0.10);
  --list-selected: rgba(103, 80, 164, 0.08);
  --list-avatar-bg: #EADDFF;
  --list-avatar-text: #21005D;
  --list-icon: #49454F;
  --list-badge-bg: #B3261E;
  --list-badge-text: #FFFFFF;
  --list-section-radius: 10px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --list-bg: #141218;
    --list-grouped-bg: #000000;
    --list-cell-bg: #1C1C1E;
    --list-text: #E6E0E9;
    --list-text-secondary: #CAC4D0;
    --list-divider: #49454F;
    --list-hover: rgba(230, 224, 233, 0.06);
    --list-active: rgba(230, 224, 233, 0.10);
    --list-selected: rgba(208, 188, 255, 0.08);
    --list-avatar-bg: #4F378B;
    --list-avatar-text: #EADDFF;
    --list-icon: #CAC4D0;
    --list-badge-bg: #F2B8B5;
    --list-badge-text: #601410;
  }
}

.dark {
  --list-bg: #141218;
  --list-grouped-bg: #000000;
  --list-cell-bg: #1C1C1E;
  --list-text: #E6E0E9;
  --list-text-secondary: #CAC4D0;
  --list-divider: #49454F;
  --list-hover: rgba(230, 224, 233, 0.06);
  --list-active: rgba(230, 224, 233, 0.10);
  --list-selected: rgba(208, 188, 255, 0.08);
  --list-avatar-bg: #4F378B;
  --list-avatar-text: #EADDFF;
  --list-icon: #CAC4D0;
  --list-badge-bg: #F2B8B5;
  --list-badge-text: #601410;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Plain | Full-width rows, no visual grouping |
| Grouped | Rounded sections on tinted background |
| Interactive | Clickable rows with state layers |
| With swipe | Leading/trailing swipe actions |
| Empty state | Placeholder when list has no items |

## HTML Structure

```html
<!-- Plain list -->
<ul class="list" role="list">
  <li class="list__item" role="listitem">
    <span class="list__leading">
      <span class="list__avatar" aria-hidden="true">JD</span>
    </span>
    <span class="list__body">
      <span class="list__title">Jane Doe</span>
      <span class="list__subtitle">Last seen recently</span>
    </span>
    <span class="list__trailing">
      <span class="list__badge" aria-label="3 unread">3</span>
    </span>
  </li>
  <li class="list__divider" role="separator"></li>
  <li class="list__item list__item--interactive" tabindex="0" role="listitem">
    <span class="list__leading">
      <svg class="list__icon" aria-hidden="true" width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="list__body">
      <span class="list__title">Settings</span>
    </span>
    <span class="list__trailing">
      <svg class="list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron --></svg>
    </span>
  </li>
</ul>

<!-- Grouped list -->
<div class="list list--grouped">
  <section class="list__section">
    <header class="list__section-header">Account</header>
    <ul class="list__section-body" role="list">
      <li class="list__item list__item--interactive" tabindex="0" role="listitem">
        <span class="list__body"><span class="list__title">Profile</span></span>
        <span class="list__trailing">
          <svg class="list__chevron" aria-hidden="true" width="7" height="12"><!-- chevron --></svg>
        </span>
      </li>
      <li class="list__divider" role="separator"></li>
      <li class="list__item" role="listitem">
        <span class="list__body"><span class="list__title">Notifications</span></span>
        <span class="list__trailing">
          <label class="list__switch"><input type="checkbox" checked /><span></span></label>
        </span>
      </li>
    </ul>
  </section>
</div>

<!-- Empty state -->
<div class="list__empty" role="status">
  <svg class="list__empty-icon" aria-hidden="true" width="48" height="48"><!-- inbox --></svg>
  <p class="list__empty-title">No items</p>
  <p class="list__empty-subtitle">Items you add will appear here.</p>
</div>

<!-- Row with swipe actions -->
<li class="list__item list__item--swipeable" role="listitem">
  <div class="list__swipe list__swipe--leading">
    <button class="list__swipe-action list__swipe-action--pin" aria-label="Pin">Pin</button>
  </div>
  <div class="list__item-content">
    <span class="list__body"><span class="list__title">Message</span></span>
  </div>
  <div class="list__swipe list__swipe--trailing">
    <button class="list__swipe-action list__swipe-action--delete" aria-label="Delete">Delete</button>
  </div>
</li>
```

## Complete CSS

```css
.list {
  list-style: none;
  margin: 0;
  padding: 0;
  background: var(--list-bg);
  color: var(--list-text);
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto, sans-serif;
}

/* Grouped */
.list--grouped { background: var(--list-grouped-bg); padding: 0 16px; }
.list__section { margin-bottom: 20px; }
.list__section-body {
  list-style: none; margin: 0; padding: 0;
  background: var(--list-cell-bg);
  border-radius: var(--list-section-radius);
  overflow: hidden;
}
.list__section-header {
  font-size: 13px; font-weight: 600; line-height: 18px;
  color: var(--list-text-secondary);
  padding: 8px 16px 6px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

/* Item */
.list__item {
  display: flex;
  align-items: center;
  gap: 12px;
  min-height: 56px;
  padding: 8px 16px;
}
.list__item--compact { min-height: 48px; padding: 4px 16px; }
.list__item--rich { min-height: 72px; }
.list__item--interactive {
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 100ms ease;
}
.list__item--interactive:hover { background: var(--list-hover); }
.list__item--interactive:focus-visible {
  background: var(--list-hover);
  outline: 2px solid #6750A4;
  outline-offset: -2px;
}
.list__item--interactive:active { background: var(--list-active); }
.list__item[aria-selected="true"] { background: var(--list-selected); }
.list__item[aria-disabled="true"] { opacity: 0.38; pointer-events: none; }

/* Body */
.list__body { flex: 1; min-width: 0; }
.list__title {
  display: block;
  font-size: 16px; line-height: 24px; font-weight: 400;
  color: var(--list-text);
  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}
.list__subtitle {
  display: block;
  font-size: 14px; line-height: 20px; font-weight: 400;
  color: var(--list-text-secondary);
}

/* Leading */
.list__leading { display: flex; align-items: center; flex-shrink: 0; }
.list__avatar {
  width: 40px; height: 40px; border-radius: 9999px;
  background: var(--list-avatar-bg); color: var(--list-avatar-text);
  display: flex; align-items: center; justify-content: center;
  font-size: 14px; font-weight: 500;
}
.list__icon { width: 24px; height: 24px; color: var(--list-icon); fill: currentColor; }

/* Trailing */
.list__trailing { display: flex; align-items: center; flex-shrink: 0; gap: 8px; }
.list__chevron {
  width: 7px; height: 12px;
  color: var(--list-text-secondary); fill: none;
  stroke: currentColor; stroke-width: 2; opacity: 0.5;
}
.list__badge {
  min-width: 20px; height: 20px; padding: 0 6px;
  border-radius: 9999px;
  background: var(--list-badge-bg); color: var(--list-badge-text);
  font-size: 12px; font-weight: 600; line-height: 20px; text-align: center;
}

/* Divider */
.list__divider {
  height: 0.5px;
  background: var(--list-divider);
  margin-left: 56px;
  list-style: none;
}

/* Swipe actions */
.list__item--swipeable { position: relative; overflow: hidden; }
.list__swipe { position: absolute; top: 0; bottom: 0; display: flex; }
.list__swipe--leading { left: 0; transform: translateX(-100%); }
.list__swipe--trailing { right: 0; transform: translateX(100%); }
.list__swipe-action {
  display: flex; align-items: center; justify-content: center;
  padding: 0 20px; border: none; color: #FFFFFF;
  font-size: 14px; font-weight: 500; cursor: pointer;
}
.list__swipe-action--delete { background: #B3261E; }
.list__swipe-action--pin { background: #6750A4; }

/* Empty state */
.list__empty {
  display: flex; flex-direction: column; align-items: center;
  padding: 48px 24px; text-align: center;
}
.list__empty-icon { color: var(--list-text-secondary); opacity: 0.5; margin-bottom: 16px; }
.list__empty-title {
  font-size: 16px; font-weight: 500; line-height: 24px;
  color: var(--list-text); margin: 0 0 4px;
}
.list__empty-subtitle {
  font-size: 14px; font-weight: 400; line-height: 20px;
  color: var(--list-text-secondary); margin: 0;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .list { background: var(--list-bg); color: var(--list-text); }
  .list--grouped { background: var(--list-grouped-bg); }
  .list__section-body { background: var(--list-cell-bg); }
}
.dark .list { background: var(--list-bg); color: var(--list-text); }
.dark .list--grouped { background: var(--list-grouped-bg); }
.dark .list__section-body { background: var(--list-cell-bg); }

@media (prefers-reduced-motion: reduce) {
  .list__item--interactive { transition: none; }
}
```

## States Reference

| State | Background | Text | Opacity | Cursor |
|-------|-----------|------|---------|--------|
| Default | transparent | --list-text | 1 | default |
| Hover | on-surface 6% | --list-text | 1 | pointer |
| Focus | on-surface 6% + outline | --list-text | 1 | pointer |
| Active | on-surface 10% | --list-text | 1 | pointer |
| Selected | primary 8% | --list-text | 1 | pointer |
| Disabled | transparent | --list-text | 0.38 | default |

## Animation & Motion

```css
.list__item--interactive {
  transition: background-color 100ms ease;
}
.list__swipe {
  transition: transform 250ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
@media (prefers-reduced-motion: reduce) {
  .list__item--interactive, .list__swipe { transition: none; }
}
```

## Accessibility

- List container: `<ul>` with `role="list"`
- Items: `<li>` with `role="listitem"`, interactive items get `tabindex="0"`
- Selected: `aria-selected="true"` for highlighted items
- Disabled: `aria-disabled="true"`, opacity 0.38
- Keyboard: Tab to focus, Arrow Up/Down between items, Enter/Space to activate
- Focus ring: 2px solid primary on interactive items
- Swipe actions: must be reachable via keyboard (long-press or context menu fallback)
- Badge: `aria-label` with count description
- Empty state: `role="status"` for screen reader announcement
- Touch target: min 48px height

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width, plain or grouped with 16px side margin |
| 600-1024px | Max-width 600px centered; or sidebar + content |
| > 1024px | Sidebar panel (320px) + main content area |

## Do / Don't

| Do | Don't |
|----|-------|
| Use grouped style for settings/forms | Use plain style for structured form content |
| Inset dividers at 56px to align with text | Full-bleed dividers between every row |
| Show empty state when list has no items | Leave a blank white space for empty lists |
| Use badges sparingly for unread counts | Put badges on every item |
| Combine M3 density options with Apple grouping | Apply both M3 and Apple styling simultaneously on same row |
