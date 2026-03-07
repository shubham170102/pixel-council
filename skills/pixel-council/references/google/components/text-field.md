---
name: text-field
description: M3 filled and outlined text inputs with labels, helpers, icons, error states
metadata:
  tags: text field, input, form, text input, search, email, password
---

# Text Field -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 56px |
| Padding | 0 16px |
| Corner radius (filled) | 4px top, 0 bottom |
| Corner radius (outlined) | 4px all |
| Input font | Roboto, 16px/24px, weight 400, spacing 0.5px |
| Label (resting) | 16px, weight 400 |
| Label (floating) | 12px, weight 400 |
| Active indicator | 2px bottom border on focus |
| Primary color (light) | #6750A4 |
| Primary color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --md-tf-primary: #6750A4;
  --md-tf-error: #B3261E;
  --md-tf-on-surface: #1D1B20;
  --md-tf-on-surface-variant: #49454F;
  --md-tf-outline: #79747E;
  --md-tf-surface-container-highest: #E6E0E9;
  --md-tf-label-floating: #6750A4;
  --md-tf-indicator: #49454F;
  --md-tf-indicator-focus: #6750A4;
  --md-tf-indicator-error: #B3261E;
  --md-tf-disabled-opacity: 0.38;
  --md-tf-radius-filled: 4px 4px 0 0;
  --md-tf-radius-outlined: 4px;
  --md-tf-transition: all 150ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-tf-primary: #D0BCFF;
    --md-tf-error: #F2B8B5;
    --md-tf-on-surface: #E6E0E9;
    --md-tf-on-surface-variant: #CAC4D0;
    --md-tf-outline: #938F99;
    --md-tf-surface-container-highest: #36343B;
    --md-tf-label-floating: #D0BCFF;
    --md-tf-indicator: #CAC4D0;
    --md-tf-indicator-focus: #D0BCFF;
    --md-tf-indicator-error: #F2B8B5;
  }
}
.dark {
  --md-tf-primary: #D0BCFF;
  --md-tf-error: #F2B8B5;
  --md-tf-on-surface: #E6E0E9;
  --md-tf-on-surface-variant: #CAC4D0;
  --md-tf-outline: #938F99;
  --md-tf-surface-container-highest: #36343B;
  --md-tf-label-floating: #D0BCFF;
  --md-tf-indicator: #CAC4D0;
  --md-tf-indicator-focus: #D0BCFF;
  --md-tf-indicator-error: #F2B8B5;
}
```

## Variants

| Variant | Background (L) | Background (D) | Border | Use Case |
|---------|----------------|----------------|--------|----------|
| Filled | #E6E0E9 | #36343B | bottom 1px #49454F | Default for most forms |
| Outlined | transparent | transparent | 1px #79747E all sides | Denser layouts, tables |

## HTML Structure

```html
<!-- Filled -->
<div class="md-text-field md-text-field--filled">
  <label class="md-text-field__label" for="input1">Label</label>
  <div class="md-text-field__container">
    <input class="md-text-field__input" id="input1" type="text"
      placeholder=" " aria-describedby="support1" />
    <span class="md-text-field__indicator"></span>
  </div>
  <span class="md-text-field__supporting" id="support1">Supporting text</span>
</div>

<!-- Outlined -->
<div class="md-text-field md-text-field--outlined">
  <div class="md-text-field__container">
    <input class="md-text-field__input" id="input2" type="text" placeholder=" " />
    <label class="md-text-field__label" for="input2">Label</label>
    <fieldset class="md-text-field__outline" aria-hidden="true">
      <legend class="md-text-field__notch"><span>Label</span></legend>
    </fieldset>
  </div>
</div>

<!-- With icons -->
<div class="md-text-field md-text-field--filled md-text-field--has-leading">
  <div class="md-text-field__container">
    <span class="md-text-field__icon md-text-field__icon--leading" aria-hidden="true"><!-- svg --></span>
    <input class="md-text-field__input" id="input3" type="text" placeholder=" " />
    <label class="md-text-field__label" for="input3">Label</label>
    <span class="md-text-field__icon md-text-field__icon--trailing" aria-hidden="true"><!-- svg --></span>
    <span class="md-text-field__indicator"></span>
  </div>
</div>

<!-- Error state -->
<div class="md-text-field md-text-field--filled md-text-field--error">
  <div class="md-text-field__container">
    <input class="md-text-field__input" id="input4" type="email"
      placeholder=" " aria-invalid="true" aria-describedby="err1" />
    <label class="md-text-field__label" for="input4">Email</label>
    <span class="md-text-field__indicator"></span>
  </div>
  <span class="md-text-field__supporting md-text-field__supporting--error"
    id="err1" role="alert">Enter a valid email</span>
</div>

<!-- Disabled -->
<div class="md-text-field md-text-field--filled md-text-field--disabled">
  <div class="md-text-field__container">
    <input class="md-text-field__input" id="input5" type="text"
      placeholder=" " disabled aria-disabled="true" />
    <label class="md-text-field__label" for="input5">Label</label>
    <span class="md-text-field__indicator"></span>
  </div>
</div>
```

## Complete CSS

```css
.md-text-field { position: relative; display: flex; flex-direction: column; width: 100%; }
.md-text-field__container {
  position: relative; display: flex; align-items: center;
  height: 56px; transition: var(--md-tf-transition);
}

/* -- Filled variant -- */
.md-text-field--filled .md-text-field__container {
  background: var(--md-tf-surface-container-highest);
  border-radius: 4px 4px 0 0;
  padding: 0 16px;
}
.md-text-field--filled .md-text-field__indicator {
  position: absolute; bottom: 0; left: 0; right: 0;
  height: 1px;
  background: var(--md-tf-indicator);
  transition: var(--md-tf-transition);
}

/* -- Outlined variant -- */
.md-text-field--outlined .md-text-field__container {
  background: transparent;
  border: 1px solid var(--md-tf-outline);
  border-radius: 4px;
  padding: 0 16px;
}

/* -- Input -- */
.md-text-field__input {
  flex: 1; width: 100%;
  border: none; outline: none; background: transparent;
  font-family: Roboto, 'Noto Sans', sans-serif;
  font-size: 16px; font-weight: 400;
  line-height: 24px; letter-spacing: 0.5px;
  color: var(--md-tf-on-surface);
  padding: 24px 0 8px;
  caret-color: var(--md-tf-primary);
}

/* -- Label (floating animation) -- */
.md-text-field__label {
  position: absolute; left: 16px;
  font-family: Roboto, 'Noto Sans', sans-serif;
  font-size: 16px; line-height: 24px;
  color: var(--md-tf-on-surface-variant);
  pointer-events: none;
  transition: all 150ms cubic-bezier(0.2, 0, 0, 1);
  transform-origin: left top;
}
.md-text-field__input:focus ~ .md-text-field__label,
.md-text-field__input:not(:placeholder-shown) ~ .md-text-field__label {
  transform: translateY(-12px) scale(0.75);
  color: var(--md-tf-label-floating);
  font-size: 12px;
}

/* -- Icons -- */
.md-text-field__icon { width: 24px; height: 24px; color: var(--md-tf-on-surface-variant); flex-shrink: 0; }
.md-text-field__icon--leading { margin-right: 12px; }
.md-text-field__icon--trailing { margin-left: 12px; }
.md-text-field--has-leading .md-text-field__label { left: 52px; }
.md-text-field--has-leading .md-text-field__input { padding-left: 0; }

/* -- Supporting text -- */
.md-text-field__supporting {
  font-family: Roboto, 'Noto Sans', sans-serif;
  font-size: 12px; line-height: 16px; letter-spacing: 0.4px;
  color: var(--md-tf-on-surface-variant);
  padding: 4px 16px 0;
}

/* -- Hover -- */
.md-text-field--filled:hover .md-text-field__container { background: #DDD7E0; }
.md-text-field--outlined:hover .md-text-field__container { border-color: var(--md-tf-on-surface); }

/* -- Focus -- */
.md-text-field--filled .md-text-field__input:focus ~ .md-text-field__indicator {
  height: 2px;
  background: var(--md-tf-indicator-focus);
}
.md-text-field--outlined .md-text-field__input:focus ~ .md-text-field__outline,
.md-text-field--outlined:focus-within .md-text-field__container {
  border-color: var(--md-tf-primary);
  border-width: 2px;
}

/* -- Error -- */
.md-text-field--error .md-text-field__indicator { background: var(--md-tf-indicator-error); height: 2px; }
.md-text-field--error .md-text-field__label { color: var(--md-tf-error); }
.md-text-field--error .md-text-field__input { caret-color: var(--md-tf-error); }
.md-text-field--error.md-text-field--outlined .md-text-field__container { border-color: var(--md-tf-error); border-width: 2px; }
.md-text-field__supporting--error { color: var(--md-tf-error); }
.md-text-field--error .md-text-field__icon--trailing { color: var(--md-tf-error); }

/* -- Disabled -- */
.md-text-field--disabled .md-text-field__container {
  background: rgba(29, 27, 32, 0.04);
  pointer-events: none;
}
.md-text-field--disabled .md-text-field__input,
.md-text-field--disabled .md-text-field__label,
.md-text-field--disabled .md-text-field__indicator {
  opacity: 0.38;
}

/* -- Dark mode disabled -- */
@media (prefers-color-scheme: dark) {
  .md-text-field--filled:hover .md-text-field__container { background: #3E3C43; }
  .md-text-field--disabled .md-text-field__container { background: rgba(230, 224, 233, 0.04); }
}
.dark .md-text-field--filled:hover .md-text-field__container { background: #3E3C43; }
.dark .md-text-field--disabled .md-text-field__container { background: rgba(230, 224, 233, 0.04); }
```

## States Reference

| State | Indicator (Filled) | Border (Outlined) | Label Color | Cursor |
|-------|-------------------|-------------------|-------------|--------|
| Rest | 1px #49454F | 1px #79747E | #49454F | text |
| Hover | 1px #1D1B20 | 1px #1D1B20 | #49454F | text |
| Focused | 2px #6750A4 | 2px #6750A4 | #6750A4 | text |
| Error | 2px #B3261E | 2px #B3261E | #B3261E | text |
| Disabled | 1px, 38% opacity | 1px, 38% opacity | 38% opacity | not-allowed |

## Animation & Motion

```css
/* Label float: 150ms emphasized-decelerate */
.md-text-field__label { transition: all 150ms cubic-bezier(0.05, 0.7, 0.1, 1.0); }
/* Indicator expand: 150ms standard */
.md-text-field__indicator { transition: all 150ms cubic-bezier(0.2, 0, 0, 1); }

@media (prefers-reduced-motion: reduce) {
  .md-text-field__label,
  .md-text-field__indicator,
  .md-text-field__container { transition: none; }
}
```

## Accessibility

- **ARIA**: `aria-describedby` links input to supporting/error text, `aria-invalid="true"` for errors, `role="alert"` on error messages
- **Keyboard**: Tab to focus, standard text editing keys
- **Focus**: 2px primary indicator (filled) or 2px primary border (outlined)
- **Touch target**: 56px height exceeds 44px minimum
- **Screen reader**: error text announced immediately via `role="alert"`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full width, 56px height, larger touch target |
| 600-1024px | Max-width as needed, can use in 2-column grids |
| > 1024px | Fixed or flexible width, denser outlined variant preferred |

## Do / Don't

| Do | Don't |
|----|-------|
| Use Filled for most form contexts | Mix Filled and Outlined in the same form |
| Always provide a visible label | Use placeholder as the only label |
| Show error text below the field | Use only color to indicate errors |
| Use `aria-describedby` for helper/error text | Rely on visual proximity alone for context |
| Match keyboard type to input (`email`, `tel`) | Force text keyboard for all input types |
