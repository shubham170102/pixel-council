---
name: picker
description: Apple picker — wheel style, menu style, inline segmented, multi-column value selection
metadata:
  tags: picker, select, dropdown, wheel, selection, value, option, menu, inline
---

# Picker -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Wheel row height | 44px |
| Visible rows | 3-5 (typically 5) |
| Wheel item font | SF Pro, 22px/28px, weight 400 |
| Menu trigger height | 34px |
| Tint color (light) | #007AFF |
| Tint color (dark) | #0A84FF |
| Selection indicator | rounded rect, secondary fill |
| Corner radius | 8px (menu), 10px (inline) |
| CSS prefix | `.apple-picker` |

## Design Tokens

```css
:root {
  --apple-picker-bg: #FFFFFF;
  --apple-picker-text: #000000;
  --apple-picker-secondary: rgba(60, 60, 67, 0.6);
  --apple-picker-tint: #007AFF;
  --apple-picker-selection: rgba(120, 120, 128, 0.16);
  --apple-picker-separator: rgba(60, 60, 67, 0.29);
  --apple-picker-fill: rgba(120, 120, 128, 0.12);
  --apple-picker-overlay-top: linear-gradient(to bottom, rgba(255,255,255,0.8), transparent);
  --apple-picker-overlay-bottom: linear-gradient(to top, rgba(255,255,255,0.8), transparent);
  --apple-picker-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-picker-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-picker-bg: #1C1C1E;
    --apple-picker-text: #FFFFFF;
    --apple-picker-secondary: rgba(235, 235, 245, 0.6);
    --apple-picker-tint: #0A84FF;
    --apple-picker-selection: rgba(120, 120, 128, 0.36);
    --apple-picker-separator: rgba(84, 84, 88, 0.6);
    --apple-picker-fill: rgba(120, 120, 128, 0.24);
    --apple-picker-overlay-top: linear-gradient(to bottom, rgba(0,0,0,0.8), transparent);
    --apple-picker-overlay-bottom: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
    --apple-picker-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-picker-bg: #1C1C1E;
  --apple-picker-text: #FFFFFF;
  --apple-picker-secondary: rgba(235, 235, 245, 0.6);
  --apple-picker-tint: #0A84FF;
  --apple-picker-selection: rgba(120, 120, 128, 0.36);
  --apple-picker-separator: rgba(84, 84, 88, 0.6);
  --apple-picker-fill: rgba(120, 120, 128, 0.24);
  --apple-picker-overlay-top: linear-gradient(to bottom, rgba(0,0,0,0.8), transparent);
  --apple-picker-overlay-bottom: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
  --apple-picker-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Trigger | Selection Display |
|-------|-------------|---------|------------------|
| Wheel | Scrolling drum/barrel selector | Inline | Highlighted center row |
| Menu | Drop-down menu of options | Tappable button | Checkmark on selected |
| Inline (Segmented) | Horizontal segments | None (always visible) | Highlighted segment |
| Compact | Inline tint-colored label | Tappable label | Menu opens |
| Multi-column wheel | Side-by-side wheels (e.g., date parts) | Inline | Highlighted center per column |

## HTML Structure

```html
<!-- Menu-style Picker (most common on web) -->
<div class="apple-picker apple-picker--menu">
  <label class="apple-picker__label" id="sort-label">Sort By</label>
  <button class="apple-picker__trigger" aria-haspopup="listbox" aria-expanded="false"
          aria-labelledby="sort-label">
    <span class="apple-picker__value">Most Recent</span>
    <svg class="apple-picker__chevron" width="12" height="8" viewBox="0 0 12 8" aria-hidden="true">
      <path d="M1 1.5L6 6.5L11 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  </button>
  <ul class="apple-picker__options" role="listbox" aria-labelledby="sort-label" hidden>
    <li class="apple-picker__option apple-picker__option--selected" role="option" aria-selected="true">
      <span>Most Recent</span>
      <svg class="apple-picker__check" width="14" height="10" viewBox="0 0 14 10" aria-hidden="true">
        <path d="M1 5L5 9L13 1" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </li>
    <li class="apple-picker__option" role="option" aria-selected="false">
      <span>Name</span>
    </li>
    <li class="apple-picker__option" role="option" aria-selected="false">
      <span>Date Added</span>
    </li>
    <li class="apple-picker__option" role="option" aria-selected="false">
      <span>Size</span>
    </li>
  </ul>
</div>

<!-- Compact Picker (inline tint label) -->
<div class="apple-picker apple-picker--compact">
  <span class="apple-picker__context">Repeat:</span>
  <button class="apple-picker__compact-trigger" aria-haspopup="listbox" aria-expanded="false">
    Never
  </button>
</div>

<!-- Wheel-style Picker (web approximation) -->
<div class="apple-picker apple-picker--wheel" role="listbox" aria-label="Select hour"
     tabindex="0">
  <div class="apple-picker__wheel-viewport">
    <div class="apple-picker__wheel-scroll">
      <div class="apple-picker__wheel-item" role="option">1</div>
      <div class="apple-picker__wheel-item" role="option">2</div>
      <div class="apple-picker__wheel-item apple-picker__wheel-item--selected" role="option" aria-selected="true">3</div>
      <div class="apple-picker__wheel-item" role="option">4</div>
      <div class="apple-picker__wheel-item" role="option">5</div>
    </div>
    <div class="apple-picker__wheel-selection" aria-hidden="true"></div>
    <div class="apple-picker__wheel-overlay-top" aria-hidden="true"></div>
    <div class="apple-picker__wheel-overlay-bottom" aria-hidden="true"></div>
  </div>
</div>

<!-- Disabled Picker -->
<div class="apple-picker apple-picker--menu apple-picker--disabled">
  <label class="apple-picker__label">Category</label>
  <button class="apple-picker__trigger" aria-haspopup="listbox" disabled aria-disabled="true">
    <span class="apple-picker__value">None</span>
    <svg class="apple-picker__chevron" width="12" height="8" viewBox="0 0 12 8" aria-hidden="true">
      <path d="M1 1.5L6 6.5L11 1.5" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
  </button>
</div>
```

## Complete CSS

```css
.apple-picker {
  font-family: var(--apple-picker-font);
  -webkit-font-smoothing: antialiased;
  position: relative;
}

/* ---- Menu Style ---- */
.apple-picker--menu {
  display: flex;
  align-items: center;
  justify-content: space-between;
  min-height: 44px;
}

.apple-picker__label {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-picker-text);
}

.apple-picker__trigger {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 6px 12px;
  background: var(--apple-picker-fill);
  border: none;
  border-radius: 8px;
  font-family: var(--apple-picker-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-picker-tint);
  cursor: pointer;
  transition: background-color 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-picker__trigger:active { opacity: 0.7; }

.apple-picker__chevron {
  color: var(--apple-picker-secondary);
  flex-shrink: 0;
  transition: transform 200ms ease-out;
}
.apple-picker__trigger[aria-expanded="true"] .apple-picker__chevron {
  transform: rotate(180deg);
}

/* Options dropdown */
.apple-picker__options {
  position: absolute;
  top: calc(100% + 4px);
  right: 0;
  min-width: 200px;
  background: var(--apple-picker-bg);
  border-radius: 13px;
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.08), 0 4px 6px rgba(0, 0, 0, 0.05);
  border: 0.5px solid var(--apple-picker-separator);
  padding: 4px;
  list-style: none;
  margin: 0;
  z-index: 50;
  overflow: hidden;
}

.apple-picker__option {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 11px 16px;
  font-size: 17px;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-picker-text);
  border-radius: 10px;
  cursor: pointer;
}
.apple-picker__option--selected { font-weight: 500; }

.apple-picker__check {
  color: var(--apple-picker-tint);
  flex-shrink: 0;
}

/* ---- Compact Style ---- */
.apple-picker--compact {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  min-height: 44px;
}

.apple-picker__context {
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  color: var(--apple-picker-text);
}

.apple-picker__compact-trigger {
  background: none;
  border: none;
  font-family: var(--apple-picker-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-picker-tint);
  cursor: pointer;
  padding: 4px;
  transition: opacity 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-picker__compact-trigger:active { opacity: 0.5; }

/* ---- Wheel Style ---- */
.apple-picker--wheel {
  width: 100%;
  overflow: hidden;
}

.apple-picker__wheel-viewport {
  position: relative;
  height: calc(44px * 5);
  overflow: hidden;
}

.apple-picker__wheel-scroll {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: calc(44px * 2) 0;
  scroll-snap-type: y mandatory;
  overflow-y: auto;
  height: 100%;
  scrollbar-width: none;
  -ms-overflow-style: none;
}
.apple-picker__wheel-scroll::-webkit-scrollbar { display: none; }

.apple-picker__wheel-item {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 44px;
  min-height: 44px;
  font-size: 22px;
  font-weight: 400;
  line-height: 28px;
  color: var(--apple-picker-text);
  scroll-snap-align: center;
  user-select: none;
}
.apple-picker__wheel-item--selected {
  font-weight: 500;
}

/* Selection indicator (centered band) */
.apple-picker__wheel-selection {
  position: absolute;
  top: 50%;
  left: 8px;
  right: 8px;
  height: 44px;
  transform: translateY(-50%);
  background: var(--apple-picker-selection);
  border-radius: 10px;
  pointer-events: none;
}

/* Fade overlays */
.apple-picker__wheel-overlay-top,
.apple-picker__wheel-overlay-bottom {
  position: absolute;
  left: 0;
  right: 0;
  height: calc(44px * 2);
  pointer-events: none;
  z-index: 1;
}
.apple-picker__wheel-overlay-top {
  top: 0;
  background: var(--apple-picker-overlay-top);
}
.apple-picker__wheel-overlay-bottom {
  bottom: 0;
  background: var(--apple-picker-overlay-bottom);
}

/* Focus */
.apple-picker__trigger:focus-visible,
.apple-picker__compact-trigger:focus-visible,
.apple-picker--wheel:focus-visible {
  outline: 4px solid var(--apple-picker-focus-ring);
  outline-offset: 1px;
  border-radius: 8px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-picker__trigger:hover {
    background: rgba(120, 120, 128, 0.2);
  }
  .apple-picker__option:hover {
    background: var(--apple-picker-fill);
  }
  .apple-picker__compact-trigger:hover {
    text-decoration: underline;
  }
}

/* Disabled */
.apple-picker--disabled { opacity: 0.4; }
.apple-picker--disabled .apple-picker__trigger { cursor: not-allowed; pointer-events: none; }

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-picker__options {
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
  }
  .apple-picker__trigger:focus-visible,
  .apple-picker__compact-trigger:focus-visible,
  .apple-picker--wheel:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-picker__options {
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3), 0 4px 6px rgba(0, 0, 0, 0.2);
}
.dark .apple-picker__trigger:focus-visible,
.dark .apple-picker__compact-trigger:focus-visible,
.dark .apple-picker--wheel:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Menu Trigger | Option | Wheel Item | Cursor |
|-------|-------------|--------|------------|--------|
| Default | fill bg, tint text | plain text | normal size | pointer |
| Hover | darker fill | highlight bg | — | pointer |
| Focus | 4px blue ring | — | 4px blue ring (viewport) | pointer |
| Active | opacity 0.7 | — | — | pointer |
| Selected | — | checkmark, 500 weight | 500 weight, centered | — |
| Disabled | opacity 0.4 | — | — | not-allowed |

## Animation & Motion

```css
/* Chevron rotation */
.apple-picker__chevron {
  transition: transform 200ms ease-out;
}

/* Options appear */
.apple-picker__options {
  animation: apple-picker-show 200ms ease-out;
}
@keyframes apple-picker-show {
  from { opacity: 0; transform: scale(0.95) translateY(-4px); }
  to { opacity: 1; transform: scale(1) translateY(0); }
}

/* Wheel snap */
.apple-picker__wheel-scroll {
  scroll-behavior: smooth;
}

@media (prefers-reduced-motion: reduce) {
  .apple-picker__chevron,
  .apple-picker__trigger,
  .apple-picker__compact-trigger {
    transition: none;
  }
  .apple-picker__options { animation: none; }
  .apple-picker__wheel-scroll { scroll-behavior: auto; }
}
```

## Accessibility

- **ARIA**: `aria-haspopup="listbox"` on trigger, `aria-expanded` toggled, `role="listbox"` on options, `role="option"` on each item, `aria-selected` on selected
- **Keyboard**: Tab to focus trigger, Enter/Space to open, Up/Down to navigate options, Enter to select, Escape to close
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: 44px minimum height for all interactive elements
- **Screen reader**: Announces label, current value, expanded/collapsed state
- **Wheel variant**: Arrow keys to scroll, treated as listbox for screen readers

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Menu style preferred over wheel, full-width options dropdown |
| 600-1024px | Options can be positioned contextually (right-aligned or left) |
| > 1024px | Compact inline style, smaller dropdown width |

## Do / Don't

| Do | Don't |
|----|-------|
| Use menu style for 3-12 options | Use wheel for fewer than 5 options (use segmented control) |
| Use compact style in inline contexts (list rows) | Use full menu style when space is tight |
| Show currently selected value in trigger | Leave trigger showing placeholder after selection |
| Group related options with separators | Mix action items and selection in one picker |
| Use wheel only when the barrel metaphor adds value | Default to wheel — menu is more accessible on web |
