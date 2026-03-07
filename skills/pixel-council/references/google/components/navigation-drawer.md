---
name: navigation-drawer
description: M3 standard, modal, and dismissible side navigation drawers
metadata:
  tags: navigation drawer, sidebar, side nav, menu, drawer
---

# Navigation Drawer -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Width (standard) | 360px |
| Width (modal) | 360px |
| Item height | 56px |
| Item corner radius | 28px (full) |
| Icon size | 24px |
| Label font | Roboto, 14px/20px, weight 500 |
| Container color (light) | #F7F2FA |
| Container color (dark) | #1D1B20 |
| Active indicator (light) | #E8DEF8 |
| Active indicator (dark) | #4A4458 |

## Design Tokens

```css
:root {
  --md-navigation-drawer-bg: #F7F2FA;
  --md-navigation-drawer-active-bg: #E8DEF8;
  --md-navigation-drawer-active-icon: #1D192B;
  --md-navigation-drawer-active-label: #1D192B;
  --md-navigation-drawer-inactive-icon: #49454F;
  --md-navigation-drawer-inactive-label: #49454F;
  --md-navigation-drawer-section-header: #49454F;
  --md-navigation-drawer-divider: #CAC4D0;
  --md-navigation-drawer-scrim: rgba(0, 0, 0, 0.32);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-navigation-drawer-bg: #1D1B20;
    --md-navigation-drawer-active-bg: #4A4458;
    --md-navigation-drawer-active-icon: #E8DEF8;
    --md-navigation-drawer-active-label: #E8DEF8;
    --md-navigation-drawer-inactive-icon: #CAC4D0;
    --md-navigation-drawer-inactive-label: #CAC4D0;
    --md-navigation-drawer-section-header: #CAC4D0;
    --md-navigation-drawer-divider: #49454F;
    --md-navigation-drawer-scrim: rgba(0, 0, 0, 0.6);
  }
}

.dark {
  --md-navigation-drawer-bg: #1D1B20;
  --md-navigation-drawer-active-bg: #4A4458;
  --md-navigation-drawer-active-icon: #E8DEF8;
  --md-navigation-drawer-active-label: #E8DEF8;
  --md-navigation-drawer-inactive-icon: #CAC4D0;
  --md-navigation-drawer-inactive-label: #CAC4D0;
  --md-navigation-drawer-section-header: #CAC4D0;
  --md-navigation-drawer-divider: #49454F;
  --md-navigation-drawer-scrim: rgba(0, 0, 0, 0.6);
}
```

## Variants

| Variant | Width | Behavior |
|---------|-------|----------|
| Standard | 360px | Side-by-side with content |
| Modal | 360px | Overlays with scrim |
| Rail | 80px | Compact icons only, 3-7 items |

## HTML Structure

```html
<!-- Standard / Modal Drawer -->
<aside class="md-navigation-drawer" role="navigation" aria-label="Main menu">
  <div class="md-navigation-drawer__header">
    <span class="md-navigation-drawer__title">App Name</span>
  </div>
  <div class="md-navigation-drawer__section-header">Section</div>
  <a href="/inbox" class="md-navigation-drawer__item md-navigation-drawer__item--active"
     aria-current="page">
    <span class="md-navigation-drawer__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="md-navigation-drawer__label">Inbox</span>
    <span class="md-navigation-drawer__badge">24</span>
  </a>
  <a href="/sent" class="md-navigation-drawer__item">
    <span class="md-navigation-drawer__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="md-navigation-drawer__label">Sent</span>
  </a>
  <hr class="md-navigation-drawer__divider" aria-hidden="true" />
  <div class="md-navigation-drawer__section-header">Labels</div>
  <a href="/starred" class="md-navigation-drawer__item">
    <span class="md-navigation-drawer__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="md-navigation-drawer__label">Starred</span>
  </a>
</aside>

<!-- Modal scrim -->
<div class="md-navigation-drawer__scrim" aria-hidden="true"></div>
```

## Complete CSS

```css
.md-navigation-drawer {
  display: flex;
  flex-direction: column;
  width: 360px;
  height: 100%;
  background: var(--md-navigation-drawer-bg);
  padding: 12px;
  overflow-y: auto;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 60;
}

/* Standard: side-by-side */
.md-navigation-drawer--standard {
  position: relative;
  width: 256px;
  box-shadow: none;
}

/* Modal: overlay with shadow */
.md-navigation-drawer--modal {
  box-shadow: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  transform: translateX(0);
  transition: transform 300ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

.md-navigation-drawer--modal[aria-hidden="true"] {
  transform: translateX(-100%);
  transition: transform 250ms cubic-bezier(0.3, 0, 0.8, 0.15);
}

/* Scrim for modal */
.md-navigation-drawer__scrim {
  position: fixed;
  inset: 0;
  background: var(--md-navigation-drawer-scrim);
  z-index: 59;
  opacity: 1;
  transition: opacity 300ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-drawer__scrim[aria-hidden="true"] {
  opacity: 0;
  pointer-events: none;
}

.md-navigation-drawer__header {
  padding: 16px 16px 8px;
}

.md-navigation-drawer__title {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-navigation-drawer-inactive-label);
}

.md-navigation-drawer__section-header {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-navigation-drawer-section-header);
  padding: 18px 16px 8px;
}

.md-navigation-drawer__item {
  display: flex;
  align-items: center;
  height: 56px;
  padding: 0 24px 0 16px;
  border-radius: 28px;
  gap: 12px;
  text-decoration: none;
  cursor: pointer;
  position: relative;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.md-navigation-drawer__item--active {
  background: var(--md-navigation-drawer-active-bg);
}

.md-navigation-drawer__icon {
  width: 24px;
  height: 24px;
  flex-shrink: 0;
  color: var(--md-navigation-drawer-inactive-icon);
}

.md-navigation-drawer__item--active .md-navigation-drawer__icon {
  color: var(--md-navigation-drawer-active-icon);
}

.md-navigation-drawer__label {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-navigation-drawer-inactive-label);
  flex: 1;
}

.md-navigation-drawer__item--active .md-navigation-drawer__label {
  color: var(--md-navigation-drawer-active-label);
  font-weight: 700;
}

.md-navigation-drawer__badge {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  color: var(--md-navigation-drawer-inactive-label);
}

.md-navigation-drawer__divider {
  height: 1px;
  border: none;
  background: var(--md-navigation-drawer-divider);
  margin: 4px 16px;
}

/* Hover */
.md-navigation-drawer__item:hover {
  background: color-mix(in srgb, var(--md-navigation-drawer-inactive-icon) 8%, transparent);
}
.md-navigation-drawer__item--active:hover {
  background: color-mix(in srgb, var(--md-navigation-drawer-active-icon) 8%, var(--md-navigation-drawer-active-bg));
}

/* Focus */
.md-navigation-drawer__item:focus-visible {
  outline: none;
  background: color-mix(in srgb, var(--md-navigation-drawer-inactive-icon) 10%, transparent);
}
.md-navigation-drawer__item--active:focus-visible {
  background: color-mix(in srgb, var(--md-navigation-drawer-active-icon) 10%, var(--md-navigation-drawer-active-bg));
}

/* Pressed */
.md-navigation-drawer__item:active {
  background: color-mix(in srgb, var(--md-navigation-drawer-inactive-icon) 10%, transparent);
}
.md-navigation-drawer__item--active:active {
  background: color-mix(in srgb, var(--md-navigation-drawer-active-icon) 10%, var(--md-navigation-drawer-active-bg));
}
```

## States Reference

| State | Background | Text | Icon | Overlay |
|-------|-----------|------|------|---------|
| Inactive | transparent | #49454F | #49454F | none |
| Inactive hover | transparent | #49454F | #49454F | 0.08 |
| Active | #E8DEF8 | #1D192B | #1D192B | none |
| Active hover | #E8DEF8 | #1D192B | #1D192B | 0.08 |
| Focus-visible | -- | -- | -- | 0.10 |
| Pressed | -- | -- | -- | 0.10 |

## Animation & Motion

```css
/* Modal slide-in */
.md-navigation-drawer--modal {
  transition: transform 300ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.md-navigation-drawer--modal[aria-hidden="true"] {
  transition: transform 250ms cubic-bezier(0.3, 0, 0.8, 0.15);
}

@media (prefers-reduced-motion: reduce) {
  .md-navigation-drawer--modal,
  .md-navigation-drawer__scrim,
  .md-navigation-drawer__item {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="navigation"`, `aria-label="Main menu"`, `aria-current="page"` on active
- Keyboard: Tab through items; Enter/Space to activate; Escape to close modal
- Focus: State layer overlay (no outline ring)
- Touch target: 56px height, full drawer width
- Screen reader: Badge counts via text content; section headers as visual grouping

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Modal drawer with scrim, triggered by hamburger icon |
| 600-1024px | Navigation rail (80px, icons only) |
| > 1024px | Standard drawer (256px) side-by-side |

## Do / Don't

| Do | Don't |
|----|-------|
| Group related items with section headers | Exceed 2 hierarchy levels |
| Use modal drawer on small screens | Show standard drawer on mobile |
| Show active indicator on current item | Nest navigation drawers |
| Include dividers between sections | Use more than 7 items without grouping |
