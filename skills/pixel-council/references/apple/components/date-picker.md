---
name: date-picker
description: Apple date picker — calendar grid, compact, wheels, date range selection
metadata:
  tags: date, picker, calendar, time, datetime, schedule, range, compact, wheels
---

# Date Picker -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Compact trigger height | 34px |
| Calendar cell size | 44x44px |
| Calendar grid width | 328px (7 columns × ~47px) |
| Header font | SF Pro, 17px/22px, weight 600 |
| Day font | SF Pro, 17px/22px, weight 400 |
| Selected day font | SF Pro, 17px/22px, weight 600 |
| Tint color (light) | #007AFF |
| Tint color (dark) | #0A84FF |
| Today indicator | tint circle outline |
| CSS prefix | `.apple-datepicker` |

## Design Tokens

```css
:root {
  --apple-datepicker-bg: #FFFFFF;
  --apple-datepicker-surface: #F2F2F7;
  --apple-datepicker-text: #000000;
  --apple-datepicker-secondary: rgba(60, 60, 67, 0.6);
  --apple-datepicker-tertiary: rgba(60, 60, 67, 0.3);
  --apple-datepicker-tint: #007AFF;
  --apple-datepicker-selected-bg: #007AFF;
  --apple-datepicker-selected-text: #FFFFFF;
  --apple-datepicker-today-ring: #007AFF;
  --apple-datepicker-separator: rgba(60, 60, 67, 0.29);
  --apple-datepicker-fill: rgba(120, 120, 128, 0.12);
  --apple-datepicker-weekend: rgba(60, 60, 67, 0.6);
  --apple-datepicker-outside: rgba(60, 60, 67, 0.3);
  --apple-datepicker-range-bg: rgba(0, 122, 255, 0.12);
  --apple-datepicker-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-datepicker-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-datepicker-bg: #1C1C1E;
    --apple-datepicker-surface: #2C2C2E;
    --apple-datepicker-text: #FFFFFF;
    --apple-datepicker-secondary: rgba(235, 235, 245, 0.6);
    --apple-datepicker-tertiary: rgba(235, 235, 245, 0.3);
    --apple-datepicker-tint: #0A84FF;
    --apple-datepicker-selected-bg: #0A84FF;
    --apple-datepicker-selected-text: #FFFFFF;
    --apple-datepicker-today-ring: #0A84FF;
    --apple-datepicker-separator: rgba(84, 84, 88, 0.6);
    --apple-datepicker-fill: rgba(120, 120, 128, 0.24);
    --apple-datepicker-weekend: rgba(235, 235, 245, 0.6);
    --apple-datepicker-outside: rgba(235, 235, 245, 0.18);
    --apple-datepicker-range-bg: rgba(10, 132, 255, 0.2);
    --apple-datepicker-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-datepicker-bg: #1C1C1E;
  --apple-datepicker-surface: #2C2C2E;
  --apple-datepicker-text: #FFFFFF;
  --apple-datepicker-secondary: rgba(235, 235, 245, 0.6);
  --apple-datepicker-tertiary: rgba(235, 235, 245, 0.3);
  --apple-datepicker-tint: #0A84FF;
  --apple-datepicker-selected-bg: #0A84FF;
  --apple-datepicker-selected-text: #FFFFFF;
  --apple-datepicker-today-ring: #0A84FF;
  --apple-datepicker-separator: rgba(84, 84, 88, 0.6);
  --apple-datepicker-fill: rgba(120, 120, 128, 0.24);
  --apple-datepicker-weekend: rgba(235, 235, 245, 0.6);
  --apple-datepicker-outside: rgba(235, 235, 245, 0.18);
  --apple-datepicker-range-bg: rgba(10, 132, 255, 0.2);
  --apple-datepicker-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Trigger | Content |
|-------|-------------|---------|---------|
| Compact | Inline tint label, opens calendar popup | Date label button | Calendar popover |
| Inline (Graphical) | Full calendar always visible | None | Calendar grid |
| Wheels | Spinning drum selectors for date/time | None | 2-3 wheel columns |
| Date and Time | Compact with both date and time | Two labeled buttons | Calendar + time wheels |
| Range | Select start and end dates | Date range labels | Calendar with range highlight |

## HTML Structure

```html
<!-- Compact Date Picker -->
<div class="apple-datepicker apple-datepicker--compact">
  <label class="apple-datepicker__label">Date</label>
  <button class="apple-datepicker__trigger" aria-haspopup="dialog" aria-expanded="false">
    <span class="apple-datepicker__date-value">Mar 8, 2026</span>
  </button>
</div>

<!-- Inline Calendar (Graphical) -->
<div class="apple-datepicker apple-datepicker--inline" role="application" aria-label="Calendar">
  <div class="apple-datepicker__header">
    <button class="apple-datepicker__month-label" aria-live="polite">March 2026</button>
    <div class="apple-datepicker__nav">
      <button class="apple-datepicker__nav-btn" aria-label="Previous month">
        <svg width="12" height="20" viewBox="0 0 12 20" aria-hidden="true">
          <path d="M10 2L2 10l8 8" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
      </button>
      <button class="apple-datepicker__nav-btn" aria-label="Next month">
        <svg width="12" height="20" viewBox="0 0 12 20" aria-hidden="true">
          <path d="M2 2l8 8-8 8" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
      </button>
    </div>
  </div>
  <div class="apple-datepicker__weekdays" role="row">
    <span role="columnheader" aria-label="Sunday">S</span>
    <span role="columnheader" aria-label="Monday">M</span>
    <span role="columnheader" aria-label="Tuesday">T</span>
    <span role="columnheader" aria-label="Wednesday">W</span>
    <span role="columnheader" aria-label="Thursday">T</span>
    <span role="columnheader" aria-label="Friday">F</span>
    <span role="columnheader" aria-label="Saturday">S</span>
  </div>
  <div class="apple-datepicker__grid" role="grid" aria-label="March 2026">
    <div class="apple-datepicker__row" role="row">
      <button class="apple-datepicker__day apple-datepicker__day--outside" role="gridcell" tabindex="-1" aria-label="February 23">23</button>
      <button class="apple-datepicker__day apple-datepicker__day--outside" role="gridcell" tabindex="-1" aria-label="February 24">24</button>
      <!-- ... -->
      <button class="apple-datepicker__day" role="gridcell" tabindex="-1" aria-label="March 1">1</button>
    </div>
    <div class="apple-datepicker__row" role="row">
      <!-- ... normal days ... -->
      <button class="apple-datepicker__day apple-datepicker__day--today" role="gridcell" tabindex="0" aria-label="March 8, today" aria-current="date">8</button>
      <!-- ... -->
    </div>
    <div class="apple-datepicker__row" role="row">
      <!-- ... -->
      <button class="apple-datepicker__day apple-datepicker__day--selected" role="gridcell" aria-selected="true" aria-label="March 15, selected">15</button>
      <!-- ... -->
    </div>
  </div>
</div>

<!-- Compact Date & Time -->
<div class="apple-datepicker apple-datepicker--compact apple-datepicker--datetime">
  <label class="apple-datepicker__label">Starts</label>
  <div class="apple-datepicker__triggers">
    <button class="apple-datepicker__trigger" aria-haspopup="dialog">
      <span class="apple-datepicker__date-value">Mar 8, 2026</span>
    </button>
    <button class="apple-datepicker__trigger" aria-haspopup="dialog">
      <span class="apple-datepicker__time-value">10:00 AM</span>
    </button>
  </div>
</div>
```

## Complete CSS

```css
.apple-datepicker {
  font-family: var(--apple-datepicker-font);
  -webkit-font-smoothing: antialiased;
}

/* ---- Compact ---- */
.apple-datepicker--compact {
  display: flex;
  align-items: center;
  justify-content: space-between;
  min-height: 44px;
}

.apple-datepicker__label {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-datepicker-text);
}

.apple-datepicker__trigger {
  display: inline-flex;
  align-items: center;
  padding: 6px 12px;
  background: var(--apple-datepicker-fill);
  border: none;
  border-radius: 8px;
  font-family: var(--apple-datepicker-font);
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-datepicker-tint);
  cursor: pointer;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-datepicker__trigger:active { opacity: 0.7; }

.apple-datepicker__triggers {
  display: flex;
  gap: 8px;
}

/* ---- Inline Calendar ---- */
.apple-datepicker--inline {
  background: var(--apple-datepicker-bg);
  border-radius: 13px;
  padding: 8px;
  max-width: 350px;
}

.apple-datepicker__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 8px 8px 12px;
}

.apple-datepicker__month-label {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-datepicker-text);
  background: none;
  border: none;
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 6px;
  font-family: var(--apple-datepicker-font);
}
.apple-datepicker__month-label:active { opacity: 0.5; }

.apple-datepicker__nav {
  display: flex;
  gap: 16px;
}

.apple-datepicker__nav-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  background: none;
  border: none;
  color: var(--apple-datepicker-tint);
  cursor: pointer;
  border-radius: 9999px;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
  padding: 0;
}
.apple-datepicker__nav-btn:active { opacity: 0.5; }

/* Weekday headers */
.apple-datepicker__weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  text-align: center;
  padding: 0 4px;
}
.apple-datepicker__weekdays span {
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-datepicker-secondary);
  padding: 4px 0;
}

/* Day grid */
.apple-datepicker__grid {
  padding: 0 4px;
}
.apple-datepicker__row {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
}

.apple-datepicker__day {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  margin: 1px auto;
  border: none;
  border-radius: 9999px;
  background: none;
  font-family: var(--apple-datepicker-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  color: var(--apple-datepicker-text);
  cursor: pointer;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
  padding: 0;
}

/* Today */
.apple-datepicker__day--today {
  font-weight: 600;
  color: var(--apple-datepicker-tint);
}

/* Selected */
.apple-datepicker__day--selected {
  background: var(--apple-datepicker-selected-bg);
  color: var(--apple-datepicker-selected-text);
  font-weight: 600;
}

/* Outside month */
.apple-datepicker__day--outside {
  color: var(--apple-datepicker-outside);
}

/* Range highlight */
.apple-datepicker__day--in-range {
  background: var(--apple-datepicker-range-bg);
  border-radius: 0;
}
.apple-datepicker__day--range-start {
  background: var(--apple-datepicker-selected-bg);
  color: var(--apple-datepicker-selected-text);
  border-radius: 9999px 0 0 9999px;
}
.apple-datepicker__day--range-end {
  background: var(--apple-datepicker-selected-bg);
  color: var(--apple-datepicker-selected-text);
  border-radius: 0 9999px 9999px 0;
}

/* Disabled day */
.apple-datepicker__day:disabled,
.apple-datepicker__day[aria-disabled="true"] {
  color: var(--apple-datepicker-tertiary);
  cursor: not-allowed;
  pointer-events: none;
}

/* Focus */
.apple-datepicker__day:focus-visible,
.apple-datepicker__trigger:focus-visible,
.apple-datepicker__nav-btn:focus-visible {
  outline: 4px solid var(--apple-datepicker-focus-ring);
  outline-offset: 1px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-datepicker__day:hover:not(.apple-datepicker__day--selected):not(:disabled) {
    background: var(--apple-datepicker-fill);
  }
  .apple-datepicker__trigger:hover {
    background: rgba(120, 120, 128, 0.2);
  }
  .apple-datepicker__nav-btn:hover {
    background: var(--apple-datepicker-fill);
  }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-datepicker__day:focus-visible,
  .apple-datepicker__trigger:focus-visible,
  .apple-datepicker__nav-btn:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-datepicker__day:focus-visible,
.dark .apple-datepicker__trigger:focus-visible,
.dark .apple-datepicker__nav-btn:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Day Cell | Trigger | Nav Button | Cursor |
|-------|----------|---------|------------|--------|
| Default | transparent, text | fill bg, tint text | transparent | pointer |
| Hover | fill bg | darker fill | fill bg | pointer |
| Focus | 4px blue ring | 4px blue ring | 4px blue ring | pointer |
| Active | — | opacity 0.7 | opacity 0.5 | pointer |
| Selected | tint bg, white text, 600 weight | — | — | pointer |
| Today | tint color, 600 weight | — | — | pointer |
| Outside month | tertiary color | — | — | pointer |
| In range | tint 12% bg, no radius | — | — | pointer |
| Disabled | tertiary color | opacity 0.4 | — | not-allowed |

## Animation & Motion

```css
/* Month transition */
.apple-datepicker__grid {
  transition: opacity 200ms ease-out;
}
.apple-datepicker__grid--transitioning {
  opacity: 0;
}

/* Day selection */
.apple-datepicker__day {
  transition: background-color 150ms ease-out, color 150ms ease-out;
}

/* Calendar popover appear (for compact variant) */
@keyframes apple-datepicker-show {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}

@media (prefers-reduced-motion: reduce) {
  .apple-datepicker__grid,
  .apple-datepicker__day {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="grid"` on calendar, `role="gridcell"` on days, `role="row"` on rows, `role="columnheader"` on weekday names, `aria-selected` on selected day, `aria-current="date"` on today, `aria-label` with full date on each day
- **Keyboard**: Arrow keys to navigate days, Page Up/Down for months, Home/End for first/last day of week, Enter/Space to select
- **Focus ring**: 4px solid blue at 60% opacity on focused day cell
- **Touch target**: 44x44px day cells meet iOS minimum
- **Screen reader**: Announces "March 8, 2026, today" or "March 15, selected", month changes announced via `aria-live`
- **Compact trigger**: `aria-haspopup="dialog"` indicates popup calendar

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Compact trigger preferred, calendar opens as bottom sheet/popover |
| 600-1024px | Inline calendar fits in form layouts, 350px max width |
| > 1024px | Inline calendar, can sit alongside time picker |

## Do / Don't

| Do | Don't |
|----|-------|
| Use compact variant in forms and list rows | Always show full calendar inline when space is limited |
| Highlight today with tint color ring | Leave today unmarked |
| Gray out dates outside the current month | Hide outside-month dates entirely (breaks grid) |
| Use range selection for booking/scheduling flows | Use two separate pickers for start/end dates |
| Support keyboard navigation through the calendar grid | Make calendar mouse-only |
