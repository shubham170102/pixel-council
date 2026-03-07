---
name: fab
description: M3 small, regular, large, and extended floating action buttons
metadata:
  tags: fab, floating action button, primary action, add, create
---

# FAB (Floating Action Button) -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Size (medium) | 56x56px |
| Size (small) | 40x40px |
| Size (large) | 96x96px |
| Icon (medium/small) | 24px |
| Icon (large) | 36px |
| Corner radius (medium) | 16px |
| Corner radius (small) | 12px |
| Corner radius (large) | 28px |
| Container color (light) | #EADDFF |
| Container color (dark) | #4F378B |
| Elevation (resting) | Level 3 |

## Design Tokens

```css
:root {
  --md-fab-bg: #EADDFF;
  --md-fab-icon: #21005D;
  --md-fab-surface-bg: #ECE6F0;
  --md-fab-surface-icon: #6750A4;
  --md-fab-secondary-bg: #E8DEF8;
  --md-fab-secondary-icon: #1D192B;
  --md-fab-tertiary-bg: #FFD8E4;
  --md-fab-tertiary-icon: #31111D;
  --md-fab-label: #21005D;
  --md-fab-shadow-resting: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  --md-fab-shadow-hover: 0 2px 3px rgba(0,0,0,0.3), 0 6px 10px 4px rgba(0,0,0,0.15);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-fab-bg: #4F378B;
    --md-fab-icon: #EADDFF;
    --md-fab-surface-bg: #2B2930;
    --md-fab-surface-icon: #D0BCFF;
    --md-fab-secondary-bg: #4A4458;
    --md-fab-secondary-icon: #E8DEF8;
    --md-fab-tertiary-bg: #633B48;
    --md-fab-tertiary-icon: #FFD8E4;
    --md-fab-label: #EADDFF;
    --md-fab-shadow-resting: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
    --md-fab-shadow-hover: 0 2px 3px rgba(0,0,0,0.3), 0 6px 10px 4px rgba(0,0,0,0.15);
  }
}

.dark {
  --md-fab-bg: #4F378B;
  --md-fab-icon: #EADDFF;
  --md-fab-surface-bg: #2B2930;
  --md-fab-surface-icon: #D0BCFF;
  --md-fab-secondary-bg: #4A4458;
  --md-fab-secondary-icon: #E8DEF8;
  --md-fab-tertiary-bg: #633B48;
  --md-fab-tertiary-icon: #FFD8E4;
  --md-fab-label: #EADDFF;
  --md-fab-shadow-resting: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  --md-fab-shadow-hover: 0 2px 3px rgba(0,0,0,0.3), 0 6px 10px 4px rgba(0,0,0,0.15);
}
```

## Variants

| Variant | Container | Icon Color | Use Case |
|---------|-----------|------------|----------|
| Primary (default) | #EADDFF | #21005D | Most common primary action |
| Surface | #ECE6F0 | #6750A4 | Lower emphasis |
| Secondary | #E8DEF8 | #1D192B | Secondary actions |
| Tertiary | #FFD8E4 | #31111D | Tertiary actions |

## HTML Structure

```html
<!-- Medium FAB (default) -->
<button class="md-fab" aria-label="Create new item">
  <svg class="md-fab__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Small FAB -->
<button class="md-fab md-fab--small" aria-label="Add">
  <svg class="md-fab__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Large FAB -->
<button class="md-fab md-fab--large" aria-label="Compose">
  <svg class="md-fab__icon" width="36" height="36" aria-hidden="true"><!-- icon --></svg>
</button>

<!-- Extended FAB -->
<button class="md-fab md-fab--extended">
  <svg class="md-fab__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
  <span class="md-fab__label">Create</span>
</button>

<!-- Surface variant -->
<button class="md-fab md-fab--surface" aria-label="Edit">
  <svg class="md-fab__icon" width="24" height="24" aria-hidden="true"><!-- icon --></svg>
</button>
```

## Complete CSS

```css
.md-fab {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 56px;
  height: 56px;
  border: none;
  border-radius: 16px;
  background: var(--md-fab-bg);
  color: var(--md-fab-icon);
  box-shadow: var(--md-fab-shadow-resting);
  cursor: pointer;
  position: relative;
  overflow: hidden;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1);
}

/* Fixed positioning */
.md-fab--fixed {
  position: fixed;
  bottom: 16px;
  right: 16px;
  z-index: 40;
}

.md-fab__icon {
  width: 24px;
  height: 24px;
  pointer-events: none;
}

/* Small */
.md-fab--small {
  width: 40px;
  height: 40px;
  border-radius: 12px;
}

/* Large */
.md-fab--large {
  width: 96px;
  height: 96px;
  border-radius: 28px;
}

.md-fab--large .md-fab__icon {
  width: 36px;
  height: 36px;
}

/* Extended */
.md-fab--extended {
  width: auto;
  height: 56px;
  padding: 0 20px;
  gap: 12px;
  border-radius: 16px;
}

.md-fab__label {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-fab-label);
}

/* Color variants */
.md-fab--surface {
  background: var(--md-fab-surface-bg);
  color: var(--md-fab-surface-icon);
}

.md-fab--secondary {
  background: var(--md-fab-secondary-bg);
  color: var(--md-fab-secondary-icon);
}

.md-fab--tertiary {
  background: var(--md-fab-tertiary-bg);
  color: var(--md-fab-tertiary-icon);
}

/* Hover: elevation increase */
.md-fab:hover {
  box-shadow: var(--md-fab-shadow-hover);
}

.md-fab:hover::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: currentColor;
  opacity: 0.08;
}

/* Focus */
.md-fab:focus-visible {
  outline: none;
}

.md-fab:focus-visible::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: currentColor;
  opacity: 0.10;
}

/* Pressed */
.md-fab:active {
  box-shadow: var(--md-fab-shadow-resting);
}

.md-fab:active::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: inherit;
  background: currentColor;
  opacity: 0.10;
}
```

## States Reference

| State | Shadow | Overlay | Cursor |
|-------|--------|---------|--------|
| Default | Level 3 | none | pointer |
| Hover | Level 4 | 0.08 | pointer |
| Focus | Level 3 | 0.10 | pointer |
| Pressed | Level 3 | 0.10 | pointer |

## Animation & Motion

```css
.md-fab {
  transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1);
}

/* Scroll hide/show */
.md-fab--fixed[data-hidden="true"] {
  transform: translateY(calc(100% + 32px));
  transition: transform 250ms cubic-bezier(0.3, 0, 0.8, 0.15);
}

.md-fab--fixed[data-hidden="false"] {
  transform: translateY(0);
  transition: transform 300ms cubic-bezier(0.05, 0.7, 0.1, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-fab,
  .md-fab--fixed {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `aria-label` required for icon-only FABs; extended uses visible label text
- Keyboard: Tab to focus; Enter/Space to activate
- Focus: State layer at 0.10 (no outline ring -- M3 pattern)
- Touch target: 56px (medium), 40px (small), 96px (large) -- all meet 48px minimum except small
- Screen reader: Extended FAB label automatically announced

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Fixed bottom-right, 16px margins; hide on scroll optional |
| 600-1024px | Same position or shift up for bottom nav |
| > 1024px | Can position relative to content area |

## Do / Don't

| Do | Don't |
|----|-------|
| Use one FAB per screen | Place multiple FABs on the same screen |
| Position bottom-right, 16px from edges | Place above bottom navigation bar |
| Use for the most important action | Use for destructive actions |
| Use extended when text adds clarity | Use extended for single-word common actions |
