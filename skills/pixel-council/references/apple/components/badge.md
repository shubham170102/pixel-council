---
name: badge
description: Apple badge — notification dot, count badge, tab bar badge, inline indicator
metadata:
  tags: badge, notification, count, dot, indicator, alert, unread, tab bar
---

# Badge -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Dot diameter | 10px |
| Count badge min width | 18px |
| Count badge height | 18px |
| Count badge padding | 0 5px |
| Corner radius | 9999px (fully rounded) |
| Font | SF Pro, 13px/18px, weight 500 |
| Background (light) | #FF3B30 |
| Background (dark) | #FF453A |
| Text color | #FFFFFF |
| CSS prefix | `.apple-badge` |

## Design Tokens

```css
:root {
  --apple-badge-bg: #FF3B30;
  --apple-badge-text: #FFFFFF;
  --apple-badge-blue: #007AFF;
  --apple-badge-green: #34C759;
  --apple-badge-orange: #FF9500;
  --apple-badge-purple: #AF52DE;
  --apple-badge-gray: #8E8E93;
  --apple-badge-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-badge-bg: #FF453A;
    --apple-badge-text: #FFFFFF;
    --apple-badge-blue: #0A84FF;
    --apple-badge-green: #30D158;
    --apple-badge-orange: #FF9F0A;
    --apple-badge-purple: #BF5AF2;
    --apple-badge-gray: #8E8E93;
  }
}
.dark {
  --apple-badge-bg: #FF453A;
  --apple-badge-text: #FFFFFF;
  --apple-badge-blue: #0A84FF;
  --apple-badge-green: #30D158;
  --apple-badge-orange: #FF9F0A;
  --apple-badge-purple: #BF5AF2;
  --apple-badge-gray: #8E8E93;
}
```

## Variants

| Style | Size | Content | Use Case |
|-------|------|---------|----------|
| Dot | 10px circle | None | Unread indicator, new content |
| Count | 18px+ pill | Number | Notification count, tab bar |
| Large count | 22px pill | Number | App icon badge |
| Text | 18px+ pill | Short text | Status label (e.g., "NEW") |
| Inline | 18px pill | Number or text | In-list row detail |

## HTML Structure

```html
<!-- Notification Dot -->
<span class="apple-badge apple-badge--dot" aria-label="New notification"></span>

<!-- Count Badge -->
<span class="apple-badge" aria-label="3 notifications">3</span>

<!-- Large Count Badge -->
<span class="apple-badge apple-badge--large" aria-label="42 notifications">42</span>

<!-- Badge on Tab Bar Item -->
<div class="apple-badge-container">
  <svg class="apple-badge-container__icon" width="24" height="24"><!-- icon --></svg>
  <span class="apple-badge apple-badge--tab" aria-label="5 unread">5</span>
</div>

<!-- Badge on Icon/Avatar -->
<div class="apple-badge-container">
  <img class="apple-badge-container__avatar" src="avatar.jpg" alt="User" width="40" height="40" />
  <span class="apple-badge apple-badge--dot apple-badge--positioned" aria-label="Online"></span>
</div>

<!-- Text Badge -->
<span class="apple-badge apple-badge--text">NEW</span>

<!-- Color variants -->
<span class="apple-badge apple-badge--blue" aria-label="Info">i</span>
<span class="apple-badge apple-badge--green" aria-label="Success">✓</span>
<span class="apple-badge apple-badge--orange" aria-label="Warning">!</span>

<!-- Inline Badge (in a list row) -->
<div class="apple-badge-inline">
  <span>Updates Available</span>
  <span class="apple-badge">12</span>
</div>
```

## Complete CSS

```css
/* ---- Base Badge ---- */
.apple-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 18px;
  height: 18px;
  padding: 0 5px;
  background: var(--apple-badge-bg);
  color: var(--apple-badge-text);
  font-family: var(--apple-badge-font);
  font-size: 13px;
  font-weight: 500;
  line-height: 18px;
  letter-spacing: -0.08px;
  border-radius: 9999px;
  white-space: nowrap;
  font-variant-numeric: tabular-nums;
}

/* ---- Dot ---- */
.apple-badge--dot {
  width: 10px;
  height: 10px;
  min-width: 10px;
  padding: 0;
  font-size: 0;
}

/* ---- Large ---- */
.apple-badge--large {
  min-width: 22px;
  height: 22px;
  padding: 0 6px;
  font-size: 15px;
  line-height: 22px;
}

/* ---- Text ---- */
.apple-badge--text {
  padding: 0 8px;
  font-size: 11px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: 0.07px;
  text-transform: uppercase;
}

/* ---- Color variants ---- */
.apple-badge--blue { background: var(--apple-badge-blue); }
.apple-badge--green { background: var(--apple-badge-green); }
.apple-badge--orange { background: var(--apple-badge-orange); }
.apple-badge--purple { background: var(--apple-badge-purple); }
.apple-badge--gray { background: var(--apple-badge-gray); }

/* ---- Container (for positioning) ---- */
.apple-badge-container {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.apple-badge-container__icon {
  display: block;
}

.apple-badge-container__avatar {
  display: block;
  border-radius: 9999px;
  object-fit: cover;
}

/* ---- Positioned (absolute on parent) ---- */
.apple-badge--positioned {
  position: absolute;
  top: -2px;
  right: -2px;
}

/* Tab bar badge */
.apple-badge--tab {
  position: absolute;
  top: -4px;
  right: -8px;
  min-width: 16px;
  height: 16px;
  padding: 0 4px;
  font-size: 11px;
  font-weight: 600;
  line-height: 16px;
  border: 2px solid var(--apple-badge-text);
}

/* ---- Inline ---- */
.apple-badge-inline {
  display: flex;
  align-items: center;
  gap: 8px;
}

/* ---- Animation (appear) ---- */
.apple-badge--animate {
  animation: apple-badge-pop 300ms cubic-bezier(0.2, 0.8, 0.2, 1);
}

/* ---- 99+ overflow ---- */
.apple-badge--overflow::after {
  content: '+';
}
```

## States Reference

| State | Dot | Count | Tab Badge |
|-------|-----|-------|-----------|
| Default | 10px red circle | 18px red pill with number | 16px on icon, white border |
| Updated | pop animation | pop animation + number change | pop animation |
| Zero count | hidden (don't render) | hidden | hidden |
| Overflow | — | "99+" | "99+" |

## Animation & Motion

```css
@keyframes apple-badge-pop {
  0% { transform: scale(0); opacity: 0; }
  60% { transform: scale(1.2); }
  100% { transform: scale(1); opacity: 1; }
}

/* Number change pulse */
@keyframes apple-badge-pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.15); }
  100% { transform: scale(1); }
}

.apple-badge--pulse {
  animation: apple-badge-pulse 200ms ease-in-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-badge--animate,
  .apple-badge--pulse {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: `aria-label` describing the badge content and context (e.g., "3 notifications", "New notification")
- **Screen reader**: Badge content announced with context; dot badges use `aria-label` since they have no visible text
- **Color independence**: Badge position and shape communicate presence beyond color alone
- **Minimum size**: 10px dot is small but always positioned on a larger interactive element
- **Hidden when zero**: Don't render badge for zero count — avoids "0 notifications" confusion

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| All sizes | Fixed size, positioned relative to parent element |
| Tab bar | Positioned at top-right of tab icon with 2px white border for contrast |
| Dense layouts | Use dot instead of count to save space |

## Do / Don't

| Do | Don't |
|----|-------|
| Use red for notification counts (Apple convention) | Use red badges for non-urgent, non-notification info |
| Show "99+" for counts over 99 | Show exact large numbers like "1,247" |
| Hide badge when count is zero | Show a badge with "0" |
| Use dot variant for presence/new-content indicators | Use a count badge when the number doesn't matter |
| Position at top-right of the element | Position at random locations |
