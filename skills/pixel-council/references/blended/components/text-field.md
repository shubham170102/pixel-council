---
name: text-field
description: Blended text input with floating label, helper text, validation, and clear button
metadata:
  tags: text field, input, form, text input, search, email, password
---

# Text Field -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Height (mobile) | 48-56px |
| Height (desktop) | 40px |
| Padding | 12-16px horizontal |
| Corner radius | 8px |
| Input font | System font, 16px/24px, weight 400 |
| Label font | System font, 14px/20px, weight 500 |
| Border (rest) | 1px #79747E (light) / #938F99 (dark) |
| Focus color (light) | #6750A4 |
| Focus color (dark) | #D0BCFF |

## Design Tokens

```css
:root {
  --tf-primary: #6750A4;
  --tf-error: #B3261E;
  --tf-on-surface: #1D1B20;
  --tf-on-surface-variant: #49454F;
  --tf-outline: #79747E;
  --tf-surface-fill: #E6E0E9;
  --tf-bg: #FFFFFF;
  --tf-placeholder: rgba(60,60,67,0.3);
  --tf-radius: 8px;
  --tf-transition: border-color 150ms ease-out, box-shadow 150ms ease-out;
  --tf-font: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto,
    'Helvetica Neue', Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --tf-primary: #D0BCFF;
    --tf-error: #F2B8B5;
    --tf-on-surface: #E6E0E9;
    --tf-on-surface-variant: #CAC4D0;
    --tf-outline: #938F99;
    --tf-surface-fill: #36343B;
    --tf-bg: #1C1C1E;
    --tf-placeholder: rgba(235,235,245,0.3);
  }
}
.dark {
  --tf-primary: #D0BCFF;
  --tf-error: #F2B8B5;
  --tf-on-surface: #E6E0E9;
  --tf-on-surface-variant: #CAC4D0;
  --tf-outline: #938F99;
  --tf-surface-fill: #36343B;
  --tf-bg: #1C1C1E;
  --tf-placeholder: rgba(235,235,245,0.3);
}
```

## Variants

| Variant | Background (L) | Background (D) | Border | Use Case |
|---------|----------------|----------------|--------|----------|
| Outlined | transparent | transparent | 1px #79747E / #938F99 | Default, most forms |
| Filled | #E6E0E9 | #36343B | none (bottom 1px optional) | Alternative, denser forms |

## HTML Structure

```html
<!-- Outlined (default) -->
<div class="text-field">
  <label class="text-field__label" for="f1">Label</label>
  <div class="text-field__container">
    <input class="text-field__input" id="f1" type="text"
      placeholder="Placeholder" aria-describedby="h1" />
  </div>
  <span class="text-field__helper" id="h1">Helper text</span>
</div>

<!-- Outlined with floating label -->
<div class="text-field text-field--floating">
  <div class="text-field__container">
    <input class="text-field__input" id="f2" type="text" placeholder=" " />
    <label class="text-field__label" for="f2">Floating Label</label>
  </div>
</div>

<!-- Filled -->
<div class="text-field text-field--filled">
  <label class="text-field__label" for="f3">Label</label>
  <div class="text-field__container">
    <input class="text-field__input" id="f3" type="text" placeholder="Placeholder" />
  </div>
</div>

<!-- With icons -->
<div class="text-field text-field--has-leading">
  <label class="text-field__label" for="f4">Search</label>
  <div class="text-field__container">
    <span class="text-field__icon text-field__icon--leading" aria-hidden="true"><!-- svg --></span>
    <input class="text-field__input" id="f4" type="search" placeholder="Search..." />
    <span class="text-field__icon text-field__icon--trailing" aria-hidden="true"><!-- svg --></span>
  </div>
</div>

<!-- Error -->
<div class="text-field text-field--error">
  <label class="text-field__label" for="f5">Email</label>
  <div class="text-field__container">
    <input class="text-field__input" id="f5" type="email"
      aria-invalid="true" aria-describedby="e1" placeholder="you@example.com" />
  </div>
  <span class="text-field__helper text-field__helper--error"
    id="e1" role="alert">Enter a valid email</span>
</div>

<!-- With character counter -->
<div class="text-field">
  <label class="text-field__label" for="f6">Bio</label>
  <div class="text-field__container">
    <textarea class="text-field__input text-field__input--textarea"
      id="f6" maxlength="200" rows="3" aria-describedby="c1"></textarea>
  </div>
  <div class="text-field__footer">
    <span class="text-field__helper" id="c1">Brief description</span>
    <span class="text-field__counter" aria-live="polite">0 / 200</span>
  </div>
</div>

<!-- Disabled -->
<div class="text-field text-field--disabled">
  <label class="text-field__label" for="f7">Label</label>
  <div class="text-field__container">
    <input class="text-field__input" id="f7" type="text"
      disabled aria-disabled="true" placeholder="Disabled" />
  </div>
</div>
```

## Complete CSS

```css
.text-field { display: flex; flex-direction: column; gap: 4px; width: 100%; }

.text-field__label {
  font-family: var(--tf-font);
  font-size: 14px; font-weight: 500; line-height: 20px;
  color: var(--tf-on-surface);
}

.text-field__container {
  position: relative; display: flex; align-items: center;
  border: 1px solid var(--tf-outline);
  border-radius: var(--tf-radius);
  background: transparent;
  min-height: 48px;
  transition: var(--tf-transition);
}

.text-field__input {
  flex: 1; width: 100%;
  border: none; outline: none; background: transparent;
  font-family: var(--tf-font);
  font-size: 16px; font-weight: 400; line-height: 24px;
  color: var(--tf-on-surface);
  padding: 12px 16px;
  caret-color: var(--tf-primary);
}
.text-field__input::placeholder { color: var(--tf-placeholder); }
.text-field__input--textarea { resize: vertical; min-height: 80px; }

/* -- Floating label -- */
.text-field--floating .text-field__label {
  position: absolute; left: 16px;
  font-size: 16px; font-weight: 400;
  color: var(--tf-on-surface-variant);
  pointer-events: none;
  transition: all 150ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
  transform-origin: left top;
}
.text-field--floating .text-field__input:focus ~ .text-field__label,
.text-field--floating .text-field__input:not(:placeholder-shown) ~ .text-field__label {
  transform: translateY(-14px) scale(0.75);
  color: var(--tf-primary);
  background: var(--tf-bg);
  padding: 0 4px;
}

/* -- Filled variant -- */
.text-field--filled .text-field__container {
  background: var(--tf-surface-fill);
  border: none;
  border-bottom: 1px solid var(--tf-outline);
  border-radius: 8px 8px 0 0;
}

/* -- Icons -- */
.text-field__icon { width: 20px; height: 20px; color: var(--tf-on-surface-variant); flex-shrink: 0; }
.text-field__icon--leading { margin-left: 16px; }
.text-field__icon--trailing { margin-right: 16px; }

/* -- Helper & counter -- */
.text-field__helper {
  font-family: var(--tf-font);
  font-size: 12px; line-height: 16px;
  color: var(--tf-on-surface-variant);
  padding: 0 4px;
}
.text-field__footer { display: flex; justify-content: space-between; padding: 0 4px; }
.text-field__counter {
  font-family: var(--tf-font);
  font-size: 12px; line-height: 16px;
  color: var(--tf-on-surface-variant);
}

/* -- Hover -- */
.text-field__container:hover { border-color: var(--tf-on-surface); }
.text-field--filled .text-field__container:hover { border-bottom-color: var(--tf-on-surface); }

/* -- Focus -- */
.text-field:focus-within .text-field__container {
  border-color: var(--tf-primary);
  border-width: 2px;
  box-shadow: 0 0 0 2px rgba(103, 80, 164, 0.15);
}
.text-field--filled:focus-within .text-field__container {
  border-bottom-width: 2px;
  box-shadow: none;
}
.text-field__input:focus-visible { outline: none; }

/* -- Error -- */
.text-field--error .text-field__container { border-color: var(--tf-error); border-width: 2px; }
.text-field--error:focus-within .text-field__container {
  box-shadow: 0 0 0 2px rgba(179, 38, 30, 0.15);
}
.text-field__helper--error { color: var(--tf-error); }
.text-field--error .text-field__label { color: var(--tf-error); }

/* -- Disabled -- */
.text-field--disabled .text-field__container {
  opacity: 0.4;
  pointer-events: none;
  background: rgba(29,27,32,0.04);
}

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .text-field:focus-within .text-field__container {
    box-shadow: 0 0 0 2px rgba(208, 188, 255, 0.15);
  }
  .text-field--error:focus-within .text-field__container {
    box-shadow: 0 0 0 2px rgba(242, 184, 181, 0.15);
  }
  .text-field--disabled .text-field__container { background: rgba(230,224,233,0.04); }
}
.dark .text-field:focus-within .text-field__container {
  box-shadow: 0 0 0 2px rgba(208, 188, 255, 0.15);
}
.dark .text-field--disabled .text-field__container { background: rgba(230,224,233,0.04); }
```

## States Reference

| State | Border | Shadow | Label Color | Helper Color | Cursor |
|-------|--------|--------|-------------|-------------|--------|
| Rest | 1px #79747E | none | #1D1B20 | #49454F | text |
| Hover | 1px #1D1B20 | none | #1D1B20 | #49454F | text |
| Focused | 2px #6750A4 | 2px primary 15% | #1D1B20 | #49454F | text |
| Error | 2px #B3261E | 2px error 15% | #B3261E | #B3261E | text |
| Disabled | 1px, 40% opacity | none | 40% opacity | 40% opacity | not-allowed |

## Animation & Motion

```css
/* Floating label transition */
.text-field--floating .text-field__label {
  transition: all 150ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
/* Border transition */
.text-field__container {
  transition: border-color 150ms ease-out, box-shadow 150ms ease-out, border-width 150ms ease-out;
}
@media (prefers-reduced-motion: reduce) {
  .text-field__container,
  .text-field--floating .text-field__label { transition: none; }
}
```

## Accessibility

- **ARIA**: `aria-describedby` for helper/error text, `aria-invalid="true"` for errors, `role="alert"` on error messages
- **Keyboard**: Tab to focus, standard text editing
- **Focus ring**: 2px primary border + subtle box-shadow glow
- **Touch target**: 48px min-height on mobile (exceeds 44px minimum)
- **Screen reader**: error announced via `role="alert"`, counter via `aria-live="polite"`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full width, 48-56px height, 16px font |
| 600-1024px | Flexible width, 2-column grid capable |
| > 1024px | 40px height, fixed widths, denser layout |

## Do / Don't

| Do | Don't |
|----|-------|
| Use static labels above fields (clearest) | Use placeholder as the only label |
| Show error text below with specific message | Use only color to indicate errors |
| Match keyboard type to data (`email`, `tel`) | Force generic keyboard for all inputs |
| Use character counter for limited fields | Validate on every keystroke (too noisy) |
| Consistent field widths in forms | Mix outlined and filled in the same form |
