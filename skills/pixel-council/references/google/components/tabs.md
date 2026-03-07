---
name: tabs
description: M3 primary and secondary tabs with active indicator animation
metadata:
  tags: tabs, tab bar, navigation, sections, segments
---

# Tabs -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height (text only) | 48px |
| Height (text + icon) | 64px |
| Min tab width | 90px |
| Icon size | 24px |
| Active indicator | 3px bottom bar |
| Label font | Roboto, 14px/20px, weight 500 |
| Active indicator color (light) | #6750A4 |
| Active indicator color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-tabs-bg: #FEF7FF;
  --md-tabs-indicator: #6750A4;
  --md-tabs-active-label: #1D1B20;
  --md-tabs-inactive-label: #49454F;
  --md-tabs-active-icon: #1D1B20;
  --md-tabs-inactive-icon: #49454F;
  --md-tabs-divider: #CAC4D0;
  --md-tabs-ripple: #6750A4;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-tabs-bg: #141218;
    --md-tabs-indicator: #D0BCFF;
    --md-tabs-active-label: #E6E0E9;
    --md-tabs-inactive-label: #CAC4D0;
    --md-tabs-active-icon: #E6E0E9;
    --md-tabs-inactive-icon: #CAC4D0;
    --md-tabs-divider: #49454F;
    --md-tabs-ripple: #D0BCFF;
  }
}

.dark {
  --md-tabs-bg: #141218;
  --md-tabs-indicator: #D0BCFF;
  --md-tabs-active-label: #E6E0E9;
  --md-tabs-inactive-label: #CAC4D0;
  --md-tabs-active-icon: #E6E0E9;
  --md-tabs-inactive-icon: #CAC4D0;
  --md-tabs-divider: #49454F;
  --md-tabs-ripple: #D0BCFF;
}
```

## Variants

| Variant | Indicator Width | Use Case |
|---------|----------------|----------|
| Primary | Label-width | Main content destinations under app bar |
| Secondary | Full tab-width | Related content within a section |
| Scrollable | Same as above | More tabs than visible space allows |
| Icon + Label | Label-width | Stacked icon above label, 64px height |

## HTML Structure

```html
<!-- Primary Tabs -->
<div class="md-tabs" role="tablist" aria-label="Content tabs">
  <button class="md-tabs__tab md-tabs__tab--active"
          role="tab" aria-selected="true" aria-controls="panel-1" id="tab-1">
    <span class="md-tabs__label">Tab One</span>
    <span class="md-tabs__indicator"></span>
  </button>
  <button class="md-tabs__tab"
          role="tab" aria-selected="false" aria-controls="panel-2" id="tab-2" tabindex="-1">
    <span class="md-tabs__label">Tab Two</span>
    <span class="md-tabs__indicator"></span>
  </button>
</div>

<div class="md-tabs__panel" role="tabpanel" id="panel-1" aria-labelledby="tab-1">
  <!-- Content -->
</div>
<div class="md-tabs__panel" role="tabpanel" id="panel-2" aria-labelledby="tab-2" hidden>
  <!-- Content -->
</div>

<!-- Icon + Label variant -->
<button class="md-tabs__tab md-tabs__tab--icon" role="tab" aria-selected="false">
  <span class="md-tabs__icon" aria-hidden="true">
    <svg width="24" height="24"><!-- icon --></svg>
  </span>
  <span class="md-tabs__label">Label</span>
  <span class="md-tabs__indicator"></span>
</button>
```

## Complete CSS

```css
.md-tabs {
  display: flex;
  align-items: stretch;
  width: 100%;
  height: 48px;
  background: var(--md-tabs-bg);
  border-bottom: 1px solid var(--md-tabs-divider);
  overflow-x: auto;
  scrollbar-width: none;
  position: relative;
}

.md-tabs::-webkit-scrollbar { display: none; }

.md-tabs__tab {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex: 1;
  min-width: 90px;
  height: 48px;
  padding: 0 16px;
  border: none;
  background: transparent;
  cursor: pointer;
  position: relative;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

/* Icon + Label variant */
.md-tabs__tab--icon {
  height: 64px;
  gap: 4px;
}

.md-tabs__icon {
  width: 24px;
  height: 24px;
  color: var(--md-tabs-inactive-icon);
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-tabs__tab--active .md-tabs__icon {
  color: var(--md-tabs-active-icon);
}

.md-tabs__label {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-tabs-inactive-label);
  white-space: nowrap;
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-tabs__tab--active .md-tabs__label {
  color: var(--md-tabs-active-label);
}

/* Active indicator bar */
.md-tabs__indicator {
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  height: 3px;
  width: 0;
  border-radius: 3px 3px 0 0;
  background: var(--md-tabs-indicator);
  transition: width 250ms cubic-bezier(0.2, 0, 0, 1);
}

/* Primary: label-width indicator */
.md-tabs__tab--active .md-tabs__indicator {
  width: calc(100% - 32px);
}

/* Secondary: full-width indicator */
.md-tabs--secondary .md-tabs__tab--active .md-tabs__indicator {
  width: 100%;
  left: 0;
  transform: none;
}

/* Scrollable */
.md-tabs--scrollable .md-tabs__tab {
  flex: 0 0 auto;
}

/* Hover */
.md-tabs__tab:hover::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-tabs-ripple);
  opacity: 0.08;
}

/* Focus */
.md-tabs__tab:focus-visible {
  outline: none;
}
.md-tabs__tab:focus-visible::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-tabs-ripple);
  opacity: 0.10;
}

/* Pressed */
.md-tabs__tab:active::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--md-tabs-ripple);
  opacity: 0.10;
}

/* Disabled */
.md-tabs__tab:disabled {
  cursor: not-allowed;
  opacity: 0.38;
  pointer-events: none;
}
```

## States Reference

| State | Label Color | Indicator | Overlay |
|-------|------------|-----------|---------|
| Inactive | #49454F | hidden | none |
| Inactive hover | #49454F | hidden | 0.08 |
| Active | #1D1B20 | 3px #6750A4 | none |
| Active hover | #1D1B20 | 3px #6750A4 | 0.08 |
| Focus-visible | -- | -- | 0.10 |
| Pressed | -- | -- | 0.10 |
| Disabled | -- | -- | 0.38 opacity |

## Animation & Motion

```css
/* Indicator slide */
.md-tabs__indicator {
  transition: width 250ms cubic-bezier(0.2, 0, 0, 1);
}

/* For JS-driven indicator position transitions */
.md-tabs__indicator--animated {
  transition: left 250ms cubic-bezier(0.2, 0, 0, 1),
              width 250ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-tabs__indicator,
  .md-tabs__label,
  .md-tabs__icon {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="tablist"` on container, `role="tab"` on each tab, `role="tabpanel"` on panels
- ARIA attributes: `aria-selected`, `aria-controls`, `aria-labelledby`
- Keyboard: Arrow Left/Right to move focus; Enter/Space to activate; Home/End for first/last
- Focus: `tabindex="0"` on active tab, `tabindex="-1"` on inactive tabs
- Touch target: Min 48px height, min 90px width
- Icon-only tabs: Must have `aria-label`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Scrollable tabs if > 3 items |
| 600-1024px | Fixed or scrollable depending on count |
| > 1024px | Fixed tabs, evenly distributed |

## Do / Don't

| Do | Don't |
|----|-------|
| Use primary tabs for top-level content sections | Mix primary and secondary tabs in one bar |
| Use secondary tabs for sub-content filtering | Use more than 7 tabs (consider overflow) |
| Keep labels short (1-2 words) | Use tabs for sequential steps (use stepper) |
| Pair each tab with a tabpanel | Nest tab groups within tab panels |
