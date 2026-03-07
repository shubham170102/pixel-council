---
name: form-controls
description: Blended checkbox, radio, select, and slider controls for forms
metadata:
  tags: form controls, checkbox, radio, select, slider, form, input
---

# Form Controls -- Blended Design System

Contains: Checkbox, Radio, Select/Dropdown, Slider.

---

## Checkbox

### Quick Reference

| Property | Value |
|----------|-------|
| Size | 18px (visual), 48px (touch target) |
| Border radius | 3px |
| Border | 2px solid |
| CSS prefix | `.checkbox` |

### Design Tokens

```css
:root {
  --checkbox-outline: #79747E;
  --checkbox-fill: #6750A4;
  --checkbox-check: #FFFFFF;
  --checkbox-error: #B3261E;
  --checkbox-label: #1D1B20;
  --checkbox-hover: rgba(29, 27, 32, 0.08);
  --checkbox-focus-ring: rgba(103, 80, 164, 0.4);
  --checkbox-disabled-opacity: 0.38;
}
/* Dark */
@media (prefers-color-scheme: dark) {
  :root {
    --checkbox-outline: #938F99;
    --checkbox-fill: #D0BCFF;
    --checkbox-check: #381E72;
    --checkbox-error: #F2B8B5;
    --checkbox-label: #E6E0E9;
    --checkbox-hover: rgba(230, 224, 233, 0.08);
    --checkbox-focus-ring: rgba(208, 188, 255, 0.4);
  }
}
.dark {
  --checkbox-outline: #938F99;
  --checkbox-fill: #D0BCFF;
  --checkbox-check: #381E72;
  --checkbox-error: #F2B8B5;
  --checkbox-label: #E6E0E9;
  --checkbox-hover: rgba(230, 224, 233, 0.08);
  --checkbox-focus-ring: rgba(208, 188, 255, 0.4);
}
```

### HTML

```html
<label class="checkbox">
  <input type="checkbox" class="checkbox__input" aria-label="Accept terms" />
  <span class="checkbox__box">
    <svg class="checkbox__icon" viewBox="0 0 18 18" aria-hidden="true">
      <path d="M3.5 9.5L7 13L14.5 5.5" fill="none" stroke="currentColor"
            stroke-width="2" stroke-linecap="round" />
    </svg>
  </span>
  <span class="checkbox__label">Accept terms</span>
</label>
```

### CSS

```css
.checkbox__input {
  position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
  overflow: hidden; clip: rect(0,0,0,0); white-space: nowrap; border: 0;
}
.checkbox {
  display: inline-flex; align-items: center; gap: 10px;
  cursor: pointer; user-select: none; -webkit-tap-highlight-color: transparent;
}
.checkbox__box {
  position: relative; width: 18px; height: 18px;
  border: 2px solid var(--checkbox-outline); border-radius: 3px;
  display: flex; align-items: center; justify-content: center;
  transition: background 200ms, border-color 200ms; flex-shrink: 0;
}
.checkbox__icon {
  width: 14px; height: 14px; color: var(--checkbox-check);
  opacity: 0; transform: scale(0.5);
  transition: opacity 150ms, transform 150ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.checkbox__input:checked ~ .checkbox__box {
  background: var(--checkbox-fill); border-color: var(--checkbox-fill);
}
.checkbox__input:checked ~ .checkbox__box .checkbox__icon {
  opacity: 1; transform: scale(1);
}
.checkbox:hover .checkbox__box { border-color: var(--checkbox-label); }
.checkbox__input:focus-visible ~ .checkbox__box {
  outline: 3px solid var(--checkbox-focus-ring); outline-offset: 2px;
}
.checkbox:has(.checkbox__input:disabled) { opacity: var(--checkbox-disabled-opacity); cursor: not-allowed; }
.checkbox__label {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 16px; line-height: 24px; color: var(--checkbox-label);
}
@media (prefers-reduced-motion: reduce) {
  .checkbox__box, .checkbox__icon { transition-duration: 0ms; }
}
```

### States

| State | Border | Fill | Opacity | Cursor |
|-------|--------|------|---------|--------|
| Unchecked | #79747E | transparent | 1 | pointer |
| Checked | #6750A4 | #6750A4 | 1 | pointer |
| Hover | #1D1B20 | -- | 1 | pointer |
| Focus | +3px ring | -- | 1 | pointer |
| Disabled | -- | -- | 0.38 | not-allowed |

---

## Radio Button

### Quick Reference

| Property | Value |
|----------|-------|
| Outer circle | 20px, 2px border |
| Inner dot | 10px (selected) |
| Touch target | 48px |
| CSS prefix | `.radio` |

### Design Tokens

```css
:root {
  --radio-outline: #79747E;
  --radio-selected: #6750A4;
  --radio-label: #1D1B20;
  --radio-hover: rgba(29, 27, 32, 0.08);
  --radio-focus-ring: rgba(103, 80, 164, 0.4);
  --radio-disabled-opacity: 0.38;
}
@media (prefers-color-scheme: dark) {
  :root {
    --radio-outline: #938F99; --radio-selected: #D0BCFF;
    --radio-label: #E6E0E9; --radio-hover: rgba(230, 224, 233, 0.08);
    --radio-focus-ring: rgba(208, 188, 255, 0.4);
  }
}
.dark {
  --radio-outline: #938F99; --radio-selected: #D0BCFF;
  --radio-label: #E6E0E9; --radio-hover: rgba(230, 224, 233, 0.08);
  --radio-focus-ring: rgba(208, 188, 255, 0.4);
}
```

### HTML

```html
<fieldset class="radio-group" role="radiogroup" aria-labelledby="radio-label">
  <legend id="radio-label" class="radio-group__legend">Priority</legend>
  <label class="radio">
    <input type="radio" name="priority" value="high" class="radio__input"
           aria-label="High" checked />
    <span class="radio__circle"><span class="radio__dot"></span></span>
    <span class="radio__label">High</span>
  </label>
  <label class="radio">
    <input type="radio" name="priority" value="low" class="radio__input"
           aria-label="Low" />
    <span class="radio__circle"><span class="radio__dot"></span></span>
    <span class="radio__label">Low</span>
  </label>
</fieldset>
```

### CSS

```css
.radio__input {
  position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
  overflow: hidden; clip: rect(0,0,0,0); white-space: nowrap; border: 0;
}
.radio-group {
  border: none; padding: 0; margin: 0; display: flex; flex-direction: column; gap: 8px;
}
.radio-group__legend {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px; font-weight: 500; color: var(--radio-label); margin-bottom: 8px;
}
.radio {
  display: inline-flex; align-items: center; gap: 10px;
  cursor: pointer; user-select: none; -webkit-tap-highlight-color: transparent;
}
.radio__circle {
  width: 20px; height: 20px; border: 2px solid var(--radio-outline);
  border-radius: 50%; display: flex; align-items: center; justify-content: center;
  flex-shrink: 0; transition: border-color 200ms;
}
.radio__dot {
  width: 10px; height: 10px; border-radius: 50%;
  background: var(--radio-selected); transform: scale(0);
  transition: transform 200ms cubic-bezier(0.05, 0.7, 0.1, 1);
}
.radio__input:checked ~ .radio__circle { border-color: var(--radio-selected); }
.radio__input:checked ~ .radio__circle .radio__dot { transform: scale(1); }
.radio:hover .radio__circle { border-color: var(--radio-label); }
.radio__input:focus-visible ~ .radio__circle {
  outline: 3px solid var(--radio-focus-ring); outline-offset: 2px;
}
.radio:has(.radio__input:disabled) { opacity: var(--radio-disabled-opacity); cursor: not-allowed; }
.radio__label {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 16px; line-height: 24px; color: var(--radio-label);
}
@media (prefers-reduced-motion: reduce) {
  .radio__circle, .radio__dot { transition-duration: 0ms; }
}
```

### States

| State | Border | Dot | Cursor |
|-------|--------|-----|--------|
| Unselected | #79747E | hidden | pointer |
| Selected | #6750A4 | #6750A4 | pointer |
| Hover | #1D1B20 | -- | pointer |
| Focus | +3px ring | -- | pointer |
| Disabled | -- | -- | not-allowed (0.38) |

---

## Select / Dropdown

### Quick Reference

| Property | Value |
|----------|-------|
| Height | 48px (mobile), 40px (desktop) |
| Border radius | 8px |
| Menu shadow | 0 4px 16px rgba(0,0,0,0.12) |
| CSS prefix | `.select` |

### Design Tokens

```css
:root {
  --select-border: #79747E;
  --select-border-focus: #6750A4;
  --select-text: #1D1B20;
  --select-label: #49454F;
  --select-bg: #FFFFFF;
  --select-menu-bg: #FFFFFF;
  --select-menu-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  --select-selected: #E8DEF8;
  --select-icon: #49454F;
  --select-disabled-opacity: 0.38;
  --select-error: #B3261E;
  --select-focus-ring: rgba(103, 80, 164, 0.4);
}
@media (prefers-color-scheme: dark) {
  :root {
    --select-border: #938F99; --select-border-focus: #D0BCFF;
    --select-text: #E6E0E9; --select-label: #CAC4D0;
    --select-bg: #1D1B20; --select-menu-bg: #211F26;
    --select-menu-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
    --select-selected: #4A4458; --select-icon: #CAC4D0;
    --select-error: #F2B8B5; --select-focus-ring: rgba(208, 188, 255, 0.4);
  }
}
.dark {
  --select-border: #938F99; --select-border-focus: #D0BCFF;
  --select-text: #E6E0E9; --select-label: #CAC4D0;
  --select-bg: #1D1B20; --select-menu-bg: #211F26;
  --select-menu-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
  --select-selected: #4A4458; --select-icon: #CAC4D0;
  --select-error: #F2B8B5; --select-focus-ring: rgba(208, 188, 255, 0.4);
}
```

### HTML

```html
<div class="select" role="group">
  <label class="select__label" id="cat-label">Category</label>
  <button class="select__trigger" role="combobox" aria-expanded="false"
          aria-haspopup="listbox" aria-labelledby="cat-label">
    <span class="select__value">Design</span>
    <span class="select__icon" aria-hidden="true">&#x25BE;</span>
  </button>
  <ul class="select__menu" role="listbox" aria-labelledby="cat-label">
    <li class="select__option" role="option" aria-selected="true">Design</li>
    <li class="select__option" role="option" aria-selected="false">Engineering</li>
    <li class="select__option" role="option" aria-selected="false">Marketing</li>
  </ul>
</div>
```

### CSS

```css
.select { position: relative; display: inline-flex; flex-direction: column; gap: 6px; min-width: 200px; }
.select__label {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px; font-weight: 500; color: var(--select-label);
}
.select__trigger {
  display: flex; align-items: center; justify-content: space-between;
  height: 48px; padding: 0 12px 0 16px;
  border: 1px solid var(--select-border); border-radius: 8px;
  background: var(--select-bg); color: var(--select-text); cursor: pointer;
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 16px; line-height: 24px;
  transition: border-color 200ms;
}
.select__trigger:hover { border-color: var(--select-text); }
.select__trigger:focus-visible {
  border-color: var(--select-border-focus);
  outline: 3px solid var(--select-focus-ring); outline-offset: -1px;
}
.select__icon {
  font-size: 20px; color: var(--select-icon);
  transition: transform 200ms; pointer-events: none;
}
.select__trigger[aria-expanded="true"] + .select__menu { display: block; }
.select__trigger[aria-expanded="true"] .select__icon { transform: rotate(180deg); }
.select__menu {
  display: none; position: absolute; top: calc(100% + 4px); left: 0; right: 0;
  margin: 0; padding: 4px 0; list-style: none;
  background: var(--select-menu-bg); border-radius: 8px;
  box-shadow: var(--select-menu-shadow); z-index: 100; max-height: 300px; overflow-y: auto;
}
.select__option {
  display: flex; align-items: center; height: 40px; padding: 0 16px;
  font-size: 16px; color: var(--select-text); cursor: pointer;
  transition: background 150ms;
}
.select__option:hover { background: rgba(0, 0, 0, 0.04); }
.select__option[aria-selected="true"] { background: var(--select-selected); }
.select--disabled .select__trigger { opacity: var(--select-disabled-opacity); cursor: not-allowed; }
.select--error .select__trigger { border-color: var(--select-error); }
@media (prefers-reduced-motion: reduce) { .select__icon { transition-duration: 0ms; } }
```

### States

| State | Border | Menu | Cursor |
|-------|--------|------|--------|
| Default | #79747E | hidden | pointer |
| Hover | #1D1B20 | -- | pointer |
| Focus | #6750A4 + ring | -- | pointer |
| Open | #6750A4 | visible | pointer |
| Disabled | -- | -- | not-allowed (0.38) |
| Error | #B3261E | -- | pointer |

---

## Slider

### Quick Reference

| Property | Value |
|----------|-------|
| Track height | 4px, border-radius 2px |
| Handle | 22px circle, white + shadow |
| Touch target | 48px |
| CSS prefix | `.slider` |

### Design Tokens

```css
:root {
  --slider-active: #6750A4;
  --slider-inactive: #E6E0E9;
  --slider-handle: #FFFFFF;
  --slider-handle-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
  --slider-handle-border: #6750A4;
  --slider-tooltip-bg: #6750A4;
  --slider-tooltip-text: #FFFFFF;
  --slider-focus-ring: rgba(103, 80, 164, 0.4);
  --slider-label: #1D1B20;
  --slider-disabled-opacity: 0.38;
}
@media (prefers-color-scheme: dark) {
  :root {
    --slider-active: #D0BCFF; --slider-inactive: #36343B;
    --slider-handle: #FFFFFF; --slider-handle-border: #D0BCFF;
    --slider-handle-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    --slider-tooltip-bg: #D0BCFF; --slider-tooltip-text: #381E72;
    --slider-focus-ring: rgba(208, 188, 255, 0.4); --slider-label: #E6E0E9;
  }
}
.dark {
  --slider-active: #D0BCFF; --slider-inactive: #36343B;
  --slider-handle: #FFFFFF; --slider-handle-border: #D0BCFF;
  --slider-handle-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
  --slider-tooltip-bg: #D0BCFF; --slider-tooltip-text: #381E72;
  --slider-focus-ring: rgba(208, 188, 255, 0.4); --slider-label: #E6E0E9;
}
```

### HTML

```html
<div class="slider" role="group" aria-labelledby="slider-label">
  <label id="slider-label" class="slider__label">Volume</label>
  <div class="slider__container">
    <div class="slider__track">
      <div class="slider__track-active" style="width: 50%"></div>
    </div>
    <div class="slider__handle" role="slider" tabindex="0"
         aria-valuemin="0" aria-valuemax="100" aria-valuenow="50"
         aria-label="Volume" style="left: 50%">
      <div class="slider__tooltip" aria-hidden="true">50</div>
    </div>
  </div>
</div>
```

### CSS

```css
.slider { display: flex; flex-direction: column; gap: 8px; min-width: 200px; user-select: none; }
.slider__label {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px; font-weight: 500; color: var(--slider-label);
}
.slider__container {
  position: relative; height: 48px; display: flex; align-items: center; touch-action: none;
}
.slider__track {
  width: 100%; height: 4px; border-radius: 2px; background: var(--slider-inactive);
  position: relative;
}
.slider__track-active {
  position: absolute; top: 0; left: 0; height: 100%; border-radius: 2px;
  background: var(--slider-active);
}
.slider__handle {
  position: absolute; top: 50%; width: 22px; height: 22px; border-radius: 50%;
  background: var(--slider-handle); border: 2px solid var(--slider-handle-border);
  box-shadow: var(--slider-handle-shadow);
  transform: translate(-50%, -50%); cursor: grab; outline: none; z-index: 2;
  transition: box-shadow 150ms, transform 150ms;
}
.slider__handle:hover { transform: translate(-50%, -50%) scale(1.1); }
.slider__handle:active { cursor: grabbing; transform: translate(-50%, -50%) scale(1.15); }
.slider__handle:focus-visible {
  outline: 3px solid var(--slider-focus-ring); outline-offset: 2px;
}
.slider__tooltip {
  position: absolute; bottom: calc(100% + 8px); left: 50%;
  transform: translateX(-50%) scale(0); opacity: 0;
  min-width: 32px; padding: 4px 8px; border-radius: 8px;
  background: var(--slider-tooltip-bg); color: var(--slider-tooltip-text);
  font-size: 13px; font-weight: 600; text-align: center; white-space: nowrap;
  pointer-events: none;
  transition: transform 150ms cubic-bezier(0.05, 0.7, 0.1, 1), opacity 150ms;
}
.slider__handle:hover .slider__tooltip,
.slider__handle:active .slider__tooltip,
.slider__handle:focus-visible .slider__tooltip {
  transform: translateX(-50%) scale(1); opacity: 1;
}
.slider--disabled { pointer-events: none; opacity: var(--slider-disabled-opacity); }
@media (prefers-reduced-motion: reduce) {
  .slider__handle, .slider__tooltip { transition-duration: 0ms; }
}
```

### States

| State | Handle | Tooltip | Cursor |
|-------|--------|---------|--------|
| Default | 22px, white + border | hidden | grab |
| Hover | scale(1.1) | visible | grab |
| Active | scale(1.15) | visible | grabbing |
| Focus | +3px ring | visible | grab |
| Disabled | -- | -- | not-allowed (0.38) |

---

## Accessibility (All Controls)

- **Checkbox**: Native `<input type="checkbox">`, Space to toggle, `aria-checked="mixed"` for indeterminate
- **Radio**: Native `<input type="radio">` in `role="radiogroup"`, Arrow keys to navigate, fieldset/legend
- **Select**: `role="combobox"` + `role="listbox"`, Enter/Space to open, Arrow keys to navigate, Escape to close
- **Slider**: `role="slider"`, `aria-valuemin/max/now`, Arrow keys to adjust, Home/End for limits
- **All**: 48px touch targets, `prefers-reduced-motion` support, visible focus indicators
