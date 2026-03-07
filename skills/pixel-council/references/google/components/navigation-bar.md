---
name: navigation-bar
description: M3 bottom navigation bar with 3-5 destinations, badges, active indicator
metadata:
  tags: navigation bar, bottom nav, tab bar, mobile nav
---

# Navigation Bar (Bottom Navigation) -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 80px |
| Destinations | 3-5 |
| Icon size | 24px |
| Label font | Roboto, 12px/16px, weight 500 |
| Active indicator | 64x32px pill, border-radius 16px |
| Container color (light) | #F3EDF7 |
| Container color (dark) | #211F26 |
| Active color (light) | #6750A4 |
| Active color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-navigation-bar-bg: #F3EDF7;
  --md-navigation-bar-active-indicator: #E8DEF8;
  --md-navigation-bar-active-icon: #1D192B;
  --md-navigation-bar-active-label: #1D1B20;
  --md-navigation-bar-inactive-icon: #49454F;
  --md-navigation-bar-inactive-label: #49454F;
  --md-navigation-bar-ripple: #49454F;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-navigation-bar-bg: #211F26;
    --md-navigation-bar-active-indicator: #4A4458;
    --md-navigation-bar-active-icon: #E8DEF8;
    --md-navigation-bar-active-label: #E6E0E9;
    --md-navigation-bar-inactive-icon: #CAC4D0;
    --md-navigation-bar-inactive-label: #CAC4D0;
    --md-navigation-bar-ripple: #CAC4D0;
  }
}

.dark {
  --md-navigation-bar-bg: #211F26;
  --md-navigation-bar-active-indicator: #4A4458;
  --md-navigation-bar-active-icon: #E8DEF8;
  --md-navigation-bar-active-label: #E6E0E9;
  --md-navigation-bar-inactive-icon: #CAC4D0;
  --md-navigation-bar-inactive-label: #CAC4D0;
  --md-navigation-bar-ripple: #CAC4D0;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Default | 3-5 destinations with icon + label |
| With badge (dot) | 6px error dot on icon |
| With badge (count) | 16px min-height count badge on icon |

## HTML Structure

```html
<nav class="md-navigation-bar" role="navigation" aria-label="Main navigation">
  <a href="/home" class="md-navigation-bar__item md-navigation-bar__item--active"
     role="link" aria-current="page">
    <span class="md-navigation-bar__indicator"></span>
    <span class="md-navigation-bar__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- filled icon --></svg>
    </span>
    <span class="md-navigation-bar__label">Home</span>
  </a>
  <a href="/search" class="md-navigation-bar__item" role="link">
    <span class="md-navigation-bar__indicator"></span>
    <span class="md-navigation-bar__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- outlined icon --></svg>
    </span>
    <!-- Badge example -->
    <span class="md-navigation-bar__badge md-navigation-bar__badge--dot" aria-label="New items"></span>
    <span class="md-navigation-bar__label">Search</span>
  </a>
  <a href="/notifications" class="md-navigation-bar__item" role="link">
    <span class="md-navigation-bar__indicator"></span>
    <span class="md-navigation-bar__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="md-navigation-bar__badge" aria-label="3 notifications">3</span>
    <span class="md-navigation-bar__label">Alerts</span>
  </a>
</nav>
```

## Complete CSS

```css
.md-navigation-bar {
  display: flex;
  align-items: stretch;
  justify-content: space-around;
  width: 100%;
  height: 80px;
  background: var(--md-navigation-bar-bg);
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 50;
  box-shadow: 0 -1px 2px rgba(0,0,0,0.3), 0 -1px 3px 1px rgba(0,0,0,0.15);
}

.md-navigation-bar__item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex: 1;
  min-width: 48px;
  max-width: 120px;
  gap: 4px;
  padding: 12px 0 16px;
  position: relative;
  text-decoration: none;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-bar__indicator {
  position: absolute;
  top: 12px;
  width: 32px;
  height: 32px;
  border-radius: 16px;
  background: transparent;
  transition: width 250ms cubic-bezier(0.2, 0, 0, 1),
              background-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-bar__item--active .md-navigation-bar__indicator {
  width: 64px;
  background: var(--md-navigation-bar-active-indicator);
}

.md-navigation-bar__icon {
  position: relative;
  z-index: 1;
  width: 24px;
  height: 24px;
  color: var(--md-navigation-bar-inactive-icon);
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-bar__item--active .md-navigation-bar__icon {
  color: var(--md-navigation-bar-active-icon);
}

.md-navigation-bar__label {
  font-family: Roboto, sans-serif;
  font-size: 12px;
  font-weight: 500;
  line-height: 16px;
  letter-spacing: 0.5px;
  color: var(--md-navigation-bar-inactive-label);
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-bar__item--active .md-navigation-bar__label {
  color: var(--md-navigation-bar-active-label);
}

/* Badge: dot */
.md-navigation-bar__badge--dot {
  position: absolute;
  top: 8px;
  left: calc(50% + 6px);
  width: 6px;
  height: 6px;
  border-radius: 3px;
  background: #B3261E;
  z-index: 2;
}

/* Badge: count */
.md-navigation-bar__badge:not(.md-navigation-bar__badge--dot) {
  position: absolute;
  top: 4px;
  left: calc(50% + 4px);
  min-width: 16px;
  height: 16px;
  padding: 0 4px;
  border-radius: 9999px;
  background: #B3261E;
  color: #FFFFFF;
  font-family: Roboto, sans-serif;
  font-size: 11px;
  font-weight: 500;
  line-height: 16px;
  text-align: center;
  z-index: 2;
}

/* Hover state layer */
.md-navigation-bar__item:hover::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-navigation-bar-ripple);
  opacity: 0.08;
  border-radius: 0;
}

/* Focus */
.md-navigation-bar__item:focus-visible {
  outline: none;
}
.md-navigation-bar__item:focus-visible::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-navigation-bar-ripple);
  opacity: 0.10;
}

/* Active / pressed */
.md-navigation-bar__item:active::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-navigation-bar-ripple);
  opacity: 0.10;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .md-navigation-bar__badge--dot { background: #F2B8B5; }
  .md-navigation-bar__badge:not(.md-navigation-bar__badge--dot) {
    background: #F2B8B5;
    color: #601410;
  }
}
.dark .md-navigation-bar__badge--dot { background: #F2B8B5; }
.dark .md-navigation-bar__badge:not(.md-navigation-bar__badge--dot) {
  background: #F2B8B5;
  color: #601410;
}
```

## States Reference

| State | Indicator | Icon Color | Label Color | Overlay |
|-------|-----------|------------|-------------|---------|
| Inactive | transparent | #49454F | #49454F | none |
| Inactive hover | transparent | #49454F | #49454F | 0.08 |
| Active | #E8DEF8 pill | #1D192B | #1D1B20 | none |
| Active hover | #E8DEF8 pill | #1D192B | #1D1B20 | 0.08 |
| Focus-visible | (same) | (same) | (same) | 0.10 |
| Pressed | (same) | (same) | (same) | 0.10 |

## Animation & Motion

```css
/* Indicator expand/collapse */
.md-navigation-bar__indicator {
  transition: width 250ms cubic-bezier(0.2, 0, 0, 1),
              background-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-navigation-bar__indicator,
  .md-navigation-bar__icon,
  .md-navigation-bar__label {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="navigation"`, `aria-label="Main navigation"`, `aria-current="page"` on active
- Keyboard: Tab between destinations; Enter/Space to activate
- Focus: State layer overlay at 0.10 opacity (no outline ring -- M3 uses state layers)
- Touch target: Full item width (min 48px) x 80px height
- Screen reader: Badge count announced via `aria-label` on badge element

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width bottom bar, 3-5 items |
| 600-1024px | Consider navigation rail (80px width) |
| > 1024px | Replace with navigation drawer sidebar |

## Do / Don't

| Do | Don't |
|----|-------|
| Use 3-5 top-level destinations | Use for fewer than 3 or more than 5 |
| Show filled icon for active state | Use same icon style for active/inactive |
| Keep bar visible during in-section nav | Hide the bar on sub-pages |
| Use short, clear labels | Use multi-word or truncated labels |
| Show badge for unread/new content | Use badge for decorative purposes |
