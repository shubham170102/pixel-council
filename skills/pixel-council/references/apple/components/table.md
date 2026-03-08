---
name: table
description: Apple data table — sortable columns, swipe actions, editing mode, section headers
metadata:
  tags: table, data table, grid, columns, rows, sort, swipe, editing, section
---

# Table -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Row height | 44px (standard), 60px (subtitle) |
| Header height | 28px |
| Column header font | SF Pro, 12px/16px, weight 600 |
| Cell font | SF Pro, 17px/22px, weight 400 |
| Separator inset | 16px left (or from leading content) |
| Selected row (light) | rgba(0,122,255,0.12) |
| Selected row (dark) | rgba(10,132,255,0.2) |
| Swipe action height | full row height |
| CSS prefix | `.apple-table` |

## Design Tokens

```css
:root {
  --apple-table-bg: #FFFFFF;
  --apple-table-grouped-bg: #F2F2F7;
  --apple-table-text: #000000;
  --apple-table-secondary: rgba(60, 60, 67, 0.6);
  --apple-table-tertiary: rgba(60, 60, 67, 0.3);
  --apple-table-tint: #007AFF;
  --apple-table-destructive: #FF3B30;
  --apple-table-green: #34C759;
  --apple-table-separator: rgba(60, 60, 67, 0.29);
  --apple-table-selected: rgba(0, 122, 255, 0.12);
  --apple-table-header-bg: #F2F2F7;
  --apple-table-fill: rgba(120, 120, 128, 0.12);
  --apple-table-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-table-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-table-bg: #1C1C1E;
    --apple-table-grouped-bg: #000000;
    --apple-table-text: #FFFFFF;
    --apple-table-secondary: rgba(235, 235, 245, 0.6);
    --apple-table-tertiary: rgba(235, 235, 245, 0.3);
    --apple-table-tint: #0A84FF;
    --apple-table-destructive: #FF453A;
    --apple-table-green: #30D158;
    --apple-table-separator: rgba(84, 84, 88, 0.6);
    --apple-table-selected: rgba(10, 132, 255, 0.2);
    --apple-table-header-bg: #1C1C1E;
    --apple-table-fill: rgba(120, 120, 128, 0.24);
    --apple-table-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-table-bg: #1C1C1E;
  --apple-table-grouped-bg: #000000;
  --apple-table-text: #FFFFFF;
  --apple-table-secondary: rgba(235, 235, 245, 0.6);
  --apple-table-tertiary: rgba(235, 235, 245, 0.3);
  --apple-table-tint: #0A84FF;
  --apple-table-destructive: #FF453A;
  --apple-table-green: #30D158;
  --apple-table-separator: rgba(84, 84, 88, 0.6);
  --apple-table-selected: rgba(10, 132, 255, 0.2);
  --apple-table-header-bg: #1C1C1E;
  --apple-table-fill: rgba(120, 120, 128, 0.24);
  --apple-table-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Columns | Row Content |
|-------|-------------|---------|-------------|
| Plain | Simple rows, full-width separators | Optional headers | Text, subtitle, detail |
| Inset Grouped | Rounded card sections | Optional headers | Same as plain |
| Data Table | Multi-column with sortable headers | Column headers | Cell data, aligned |
| Editable | Delete/reorder controls visible | Same | Same + editing controls |

## HTML Structure

```html
<!-- Data Table with Sortable Columns -->
<div class="apple-table" role="table" aria-label="Files">
  <div class="apple-table__header" role="row">
    <button class="apple-table__column-header apple-table__column-header--sorted" role="columnheader"
            aria-sort="ascending" style="flex: 2">
      <span>Name</span>
      <svg class="apple-table__sort-icon" width="8" height="12" viewBox="0 0 8 12" aria-hidden="true">
        <path d="M4 0L8 5H0z" fill="currentColor"/>
      </svg>
    </button>
    <button class="apple-table__column-header" role="columnheader" aria-sort="none" style="flex: 1">
      <span>Date Modified</span>
    </button>
    <button class="apple-table__column-header" role="columnheader" aria-sort="none" style="flex: 0.5">
      <span>Size</span>
    </button>
  </div>

  <div class="apple-table__body">
    <div class="apple-table__row" role="row" tabindex="0">
      <span class="apple-table__cell" role="cell" style="flex: 2">
        <svg class="apple-table__cell-icon" aria-hidden="true" width="20" height="20"><!-- file icon --></svg>
        <span>Project Report.pdf</span>
      </span>
      <span class="apple-table__cell apple-table__cell--secondary" role="cell" style="flex: 1">Mar 7, 2026</span>
      <span class="apple-table__cell apple-table__cell--secondary" role="cell" style="flex: 0.5">2.4 MB</span>
    </div>

    <div class="apple-table__row apple-table__row--selected" role="row" tabindex="0" aria-selected="true">
      <span class="apple-table__cell" role="cell" style="flex: 2">
        <svg class="apple-table__cell-icon" aria-hidden="true" width="20" height="20"><!-- file icon --></svg>
        <span>Budget.xlsx</span>
      </span>
      <span class="apple-table__cell apple-table__cell--secondary" role="cell" style="flex: 1">Mar 5, 2026</span>
      <span class="apple-table__cell apple-table__cell--secondary" role="cell" style="flex: 0.5">890 KB</span>
    </div>
  </div>
</div>

<!-- Inset Grouped Table (Settings-style) -->
<div class="apple-table apple-table--grouped">
  <div class="apple-table__section">
    <div class="apple-table__section-header">General</div>
    <div class="apple-table__section-body">
      <div class="apple-table__row" role="row">
        <span class="apple-table__cell">About</span>
        <span class="apple-table__cell apple-table__cell--detail">
          <span>iPhone 15 Pro</span>
          <svg class="apple-table__disclosure-chevron" width="8" height="13" viewBox="0 0 8 13" aria-hidden="true">
            <path d="M1 1l5.5 5.5L1 12" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          </svg>
        </span>
      </div>
      <div class="apple-table__row" role="row">
        <span class="apple-table__cell">Software Update</span>
        <span class="apple-table__cell apple-table__cell--detail">
          <span class="apple-table__badge">1</span>
          <svg class="apple-table__disclosure-chevron" width="8" height="13" viewBox="0 0 8 13" aria-hidden="true">
            <path d="M1 1l5.5 5.5L1 12" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          </svg>
        </span>
      </div>
    </div>
  </div>
</div>

<!-- Swipe Actions (revealed on swipe) -->
<div class="apple-table__row apple-table__row--swiped" role="row">
  <div class="apple-table__swipe-actions apple-table__swipe-actions--trailing">
    <button class="apple-table__swipe-action apple-table__swipe-action--destructive" aria-label="Delete">
      Delete
    </button>
    <button class="apple-table__swipe-action apple-table__swipe-action--archive" aria-label="Archive">
      Archive
    </button>
  </div>
  <div class="apple-table__row-content">
    <span class="apple-table__cell">Inbox message</span>
  </div>
</div>
```

## Complete CSS

```css
.apple-table {
  font-family: var(--apple-table-font);
  -webkit-font-smoothing: antialiased;
  width: 100%;
}

/* ---- Column Headers ---- */
.apple-table__header {
  display: flex;
  align-items: center;
  background: var(--apple-table-header-bg);
  border-bottom: 0.5px solid var(--apple-table-separator);
  padding: 0 16px;
}

.apple-table__column-header {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 6px 8px;
  background: none;
  border: none;
  font-family: var(--apple-table-font);
  font-size: 12px;
  font-weight: 600;
  line-height: 16px;
  letter-spacing: 0px;
  color: var(--apple-table-secondary);
  text-transform: uppercase;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
}
.apple-table__column-header--sorted {
  color: var(--apple-table-text);
}

.apple-table__sort-icon {
  flex-shrink: 0;
  transition: transform 200ms ease-out;
}
.apple-table__column-header[aria-sort="descending"] .apple-table__sort-icon {
  transform: rotate(180deg);
}

/* ---- Rows ---- */
.apple-table__row {
  display: flex;
  align-items: center;
  min-height: 44px;
  padding: 0 16px;
  border-bottom: 0.5px solid var(--apple-table-separator);
  background: var(--apple-table-bg);
  transition: background-color 150ms ease-out;
}

.apple-table__row--selected {
  background: var(--apple-table-selected);
}

/* ---- Cells ---- */
.apple-table__cell {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-table-text);
  padding: 11px 8px;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.apple-table__cell--secondary {
  color: var(--apple-table-secondary);
  font-size: 15px;
}

.apple-table__cell--detail {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  margin-left: auto;
  color: var(--apple-table-secondary);
}

.apple-table__cell-icon {
  flex-shrink: 0;
  width: 20px;
  height: 20px;
}

/* Disclosure chevron */
.apple-table__disclosure-chevron {
  color: var(--apple-table-tertiary);
  flex-shrink: 0;
}

/* Badge */
.apple-table__badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 20px;
  height: 20px;
  padding: 0 6px;
  background: var(--apple-table-destructive);
  color: #FFFFFF;
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  border-radius: 9999px;
}

/* ---- Grouped variant ---- */
.apple-table--grouped {
  padding: 0 16px;
}

.apple-table__section {
  margin-bottom: 24px;
}

.apple-table__section-header {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-table-secondary);
  text-transform: uppercase;
  padding: 8px 16px 6px;
}

.apple-table__section-body {
  background: var(--apple-table-bg);
  border-radius: 10px;
  overflow: hidden;
}
.apple-table__section-body .apple-table__row {
  padding: 0 16px;
  border-bottom: 0.5px solid var(--apple-table-separator);
}
.apple-table__section-body .apple-table__row:last-child {
  border-bottom: none;
}

/* ---- Swipe Actions ---- */
.apple-table__row--swiped {
  position: relative;
  overflow: hidden;
}

.apple-table__swipe-actions {
  position: absolute;
  top: 0;
  bottom: 0;
  display: flex;
}
.apple-table__swipe-actions--trailing { right: 0; }
.apple-table__swipe-actions--leading { left: 0; }

.apple-table__swipe-action {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 24px;
  border: none;
  font-family: var(--apple-table-font);
  font-size: 15px;
  font-weight: 500;
  color: #FFFFFF;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
}
.apple-table__swipe-action--destructive { background: var(--apple-table-destructive); }
.apple-table__swipe-action--archive { background: var(--apple-table-tint); }

/* Focus */
.apple-table__row:focus-visible {
  outline: 4px solid var(--apple-table-focus-ring);
  outline-offset: -4px;
  z-index: 1;
}
.apple-table__column-header:focus-visible {
  outline: 4px solid var(--apple-table-focus-ring);
  outline-offset: 1px;
  border-radius: 4px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-table__row:hover:not(.apple-table__row--selected) {
    background: var(--apple-table-fill);
  }
  .apple-table__column-header:hover {
    color: var(--apple-table-text);
  }
}

/* Active */
.apple-table__row:active {
  background: var(--apple-table-fill);
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-table__row:focus-visible,
  .apple-table__column-header:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-table__row:focus-visible,
.dark .apple-table__column-header:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Row Bg | Text | Sort Icon | Cursor |
|-------|--------|------|-----------|--------|
| Default | bg color | text | none or arrow | pointer |
| Hover | fill bg | — | — | pointer |
| Focus | 4px blue ring (inset) | — | — | pointer |
| Active | fill bg | — | — | pointer |
| Selected | tint 12% bg | — | — | pointer |
| Sorted column | — | bold text | visible arrow | pointer |

## Animation & Motion

```css
/* Row selection */
.apple-table__row {
  transition: background-color 150ms ease-out;
}

/* Sort icon flip */
.apple-table__sort-icon {
  transition: transform 200ms ease-out;
}

/* Swipe reveal */
.apple-table__row-content {
  transition: transform 300ms cubic-bezier(0.2, 0.8, 0.2, 1);
}

@media (prefers-reduced-motion: reduce) {
  .apple-table__row,
  .apple-table__sort-icon,
  .apple-table__row-content {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="table"` on container, `role="row"` on rows, `role="cell"` on cells, `role="columnheader"` with `aria-sort` on sortable columns, `aria-selected` on selected rows
- **Keyboard**: Tab to focus rows, Enter/Space to select, arrow keys to navigate cells in data table mode
- **Focus ring**: 4px solid blue at 60% opacity, inset for rows, standard for column headers
- **Touch target**: 44px minimum row height
- **Screen reader**: Announces column header + cell content for each row, sort direction
- **Swipe actions**: Must have keyboard-accessible alternatives (context menu or visible buttons)

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Inset grouped style, single-column layout, swipe actions |
| 600-1024px | Data table with 2-3 columns, horizontal scroll if needed |
| > 1024px | Full data table, all columns visible, sortable headers |

## Do / Don't

| Do | Don't |
|----|-------|
| Use inset grouped style on mobile (settings pattern) | Force wide data tables on narrow screens |
| Show sort direction with an arrow icon | Change sort without visual indicator |
| Provide swipe action alternatives via context menu | Make swipe the only way to access actions |
| Use section headers for logical grouping | Mix unrelated data in one section |
| Zebra-stripe only if it aids readability | Always apply zebra stripes by default |
