---
name: text-field
description: Apple rounded-rect text fields with placeholder, clear button, and inline validation
metadata:
  tags: text field, input, form, text input, search, email, password
---

# Text Field -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 36-44px |
| Padding | 8-12px horizontal |
| Corner radius | 8px (rounded) |
| Input font | SF Pro Body, 17px/22px, weight 400, spacing -0.41px |
| Label font | SF Pro Subheadline, 15px/20px |
| Border (light) | 1px #C7C7CC |
| Border (dark) | 1px #48484A |
| Focus color (light) | #007AFF |
| Focus color (dark) | #0A84FF |

## Design Tokens

```css
:root {
  --apple-tf-bg: #FFFFFF;
  --apple-tf-border: #C7C7CC;
  --apple-tf-label: #000000;
  --apple-tf-input-color: #000000;
  --apple-tf-placeholder: rgba(60,60,67,0.3);
  --apple-tf-focus: #007AFF;
  --apple-tf-error: #FF3B30;
  --apple-tf-disabled-bg: #F2F2F7;
  --apple-tf-disabled-opacity: 0.3;
  --apple-tf-radius: 8px;
  --apple-tf-transition: border-color 150ms ease-out, box-shadow 150ms ease-out;
  --apple-tf-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-tf-bg: #1C1C1E;
    --apple-tf-border: #48484A;
    --apple-tf-label: #FFFFFF;
    --apple-tf-input-color: #FFFFFF;
    --apple-tf-placeholder: rgba(235,235,245,0.3);
    --apple-tf-focus: #0A84FF;
    --apple-tf-error: #FF453A;
    --apple-tf-disabled-bg: #2C2C2E;
  }
}
.dark {
  --apple-tf-bg: #1C1C1E;
  --apple-tf-border: #48484A;
  --apple-tf-label: #FFFFFF;
  --apple-tf-input-color: #FFFFFF;
  --apple-tf-placeholder: rgba(235,235,245,0.3);
  --apple-tf-focus: #0A84FF;
  --apple-tf-error: #FF453A;
  --apple-tf-disabled-bg: #2C2C2E;
}
```

## Variants

| Style | Background (L) | Background (D) | Border | Use Case |
|-------|----------------|----------------|--------|----------|
| Rounded | #FFFFFF | #1C1C1E | 1px #C7C7CC / #48484A | Default, most contexts |
| Plain | transparent | transparent | none (bottom line optional) | Inline, minimal forms |

## HTML Structure

```html
<!-- Rounded (default) -->
<div class="apple-text-field">
  <label class="apple-text-field__label" for="tf1">Label</label>
  <div class="apple-text-field__container">
    <input class="apple-text-field__input" id="tf1" type="text"
      placeholder="Placeholder" aria-describedby="help1" />
  </div>
  <span class="apple-text-field__helper" id="help1">Helper text</span>
</div>

<!-- With leading/trailing icons -->
<div class="apple-text-field apple-text-field--has-icons">
  <label class="apple-text-field__label" for="tf2">Search</label>
  <div class="apple-text-field__container">
    <span class="apple-text-field__icon apple-text-field__icon--leading" aria-hidden="true"><!-- svg --></span>
    <input class="apple-text-field__input" id="tf2" type="search" placeholder="Search" />
    <button class="apple-text-field__clear" type="button" aria-label="Clear text"><!-- x icon --></button>
  </div>
</div>

<!-- Plain style -->
<div class="apple-text-field apple-text-field--plain">
  <label class="apple-text-field__label" for="tf3">Name</label>
  <div class="apple-text-field__container">
    <input class="apple-text-field__input" id="tf3" type="text" placeholder="Full name" />
  </div>
</div>

<!-- Error state -->
<div class="apple-text-field apple-text-field--error">
  <label class="apple-text-field__label" for="tf4">Email</label>
  <div class="apple-text-field__container">
    <input class="apple-text-field__input" id="tf4" type="email"
      placeholder="you@example.com" aria-invalid="true" aria-describedby="err1" />
  </div>
  <span class="apple-text-field__helper apple-text-field__helper--error"
    id="err1" role="alert">Enter a valid email address</span>
</div>

<!-- Disabled -->
<div class="apple-text-field apple-text-field--disabled">
  <label class="apple-text-field__label" for="tf5">Label</label>
  <div class="apple-text-field__container">
    <input class="apple-text-field__input" id="tf5" type="text"
      disabled aria-disabled="true" placeholder="Disabled" />
  </div>
</div>
```

## Complete CSS

```css
.apple-text-field { display: flex; flex-direction: column; gap: 4px; width: 100%; }

.apple-text-field__label {
  font-family: var(--apple-tf-font);
  font-size: 15px; font-weight: 400;
  line-height: 20px; letter-spacing: -0.24px;
  color: var(--apple-tf-label);
}

.apple-text-field__container {
  position: relative; display: flex; align-items: center;
  background: var(--apple-tf-bg);
  border: 1px solid var(--apple-tf-border);
  border-radius: var(--apple-tf-radius);
  transition: var(--apple-tf-transition);
  min-height: 44px;
}

.apple-text-field__input {
  flex: 1; width: 100%;
  border: none; outline: none; background: transparent;
  font-family: var(--apple-tf-font);
  font-size: 17px; font-weight: 400;
  line-height: 22px; letter-spacing: -0.41px;
  color: var(--apple-tf-input-color);
  padding: 8px 12px;
}
.apple-text-field__input::placeholder { color: var(--apple-tf-placeholder); }

.apple-text-field__icon { width: 20px; height: 20px; color: rgba(60,60,67,0.6); flex-shrink: 0; }
.apple-text-field__icon--leading { margin-left: 12px; }
.apple-text-field__clear {
  display: flex; align-items: center; justify-content: center;
  width: 20px; height: 20px; margin-right: 12px;
  border: none; background: rgba(60,60,67,0.3); border-radius: 50%;
  color: #FFFFFF; cursor: pointer; padding: 0;
}

.apple-text-field__helper {
  font-family: var(--apple-tf-font);
  font-size: 13px; line-height: 18px; letter-spacing: -0.08px;
  color: rgba(60,60,67,0.6);
  padding: 0 4px;
}

/* -- Plain variant -- */
.apple-text-field--plain .apple-text-field__container {
  background: transparent;
  border: none;
  border-bottom: 1px solid var(--apple-tf-border);
  border-radius: 0;
}

/* -- Hover -- */
@media (hover: hover) {
  .apple-text-field__container:hover { border-color: #8E8E93; }
  .apple-text-field--plain .apple-text-field__container:hover { border-bottom-color: #8E8E93; }
}

/* -- Focus -- */
.apple-text-field:focus-within .apple-text-field__container {
  border-color: var(--apple-tf-focus);
  box-shadow: 0 0 0 3px rgba(0, 122, 255, 0.3);
}
.apple-text-field__input:focus-visible { outline: none; }

/* -- Error -- */
.apple-text-field--error .apple-text-field__container {
  border-color: var(--apple-tf-error);
}
.apple-text-field--error:focus-within .apple-text-field__container {
  box-shadow: 0 0 0 3px rgba(255, 59, 48, 0.3);
}
.apple-text-field__helper--error { color: var(--apple-tf-error); }

/* -- Disabled -- */
.apple-text-field--disabled .apple-text-field__container {
  background: var(--apple-tf-disabled-bg);
  opacity: 0.3;
  pointer-events: none;
}

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .apple-text-field__icon { color: rgba(235,235,245,0.6); }
  .apple-text-field__helper { color: rgba(235,235,245,0.6); }
  .apple-text-field__clear { background: rgba(235,235,245,0.3); }
  .apple-text-field:focus-within .apple-text-field__container {
    box-shadow: 0 0 0 3px rgba(10, 132, 255, 0.3);
  }
  .apple-text-field--error:focus-within .apple-text-field__container {
    box-shadow: 0 0 0 3px rgba(255, 69, 58, 0.3);
  }
}
.dark .apple-text-field__icon { color: rgba(235,235,245,0.6); }
.dark .apple-text-field__helper { color: rgba(235,235,245,0.6); }
.dark .apple-text-field__clear { background: rgba(235,235,245,0.3); }
.dark .apple-text-field:focus-within .apple-text-field__container {
  box-shadow: 0 0 0 3px rgba(10, 132, 255, 0.3);
}
```

## States Reference

| State | Border | Shadow | Label | Cursor |
|-------|--------|--------|-------|--------|
| Rest | 1px #C7C7CC | none | #000000 | text |
| Hover | 1px #8E8E93 | none | #000000 | text |
| Focused | 1px #007AFF | 0 0 0 3px blue 30% | #000000 | text |
| Error | 1px #FF3B30 | 0 0 0 3px red 30% | #000000 | text |
| Disabled | 1px #C7C7CC | none | 30% opacity | not-allowed |

## Animation & Motion

```css
.apple-text-field__container {
  transition: border-color 150ms ease-out, box-shadow 150ms ease-out;
}
@media (prefers-reduced-motion: reduce) {
  .apple-text-field__container { transition: none; }
}
```

## Accessibility

- **ARIA**: `aria-describedby` links input to helper/error text, `aria-invalid="true"` for errors, `role="alert"` on error messages
- **Keyboard**: Tab to focus, standard text editing keys
- **Focus ring**: 3px blue glow ring via box-shadow (plus border color change)
- **Touch target**: 44px min-height (iOS standard)
- **Screen reader**: error text announced via `role="alert"`, clear button has `aria-label`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full width, 44px min-height, 17px body text |
| 600-1024px | Flexible width, can stack in columns |
| > 1024px | Fixed width as needed, 36px height option for desktop density |

## Do / Don't

| Do | Don't |
|----|-------|
| Place label above the field for clarity | Use floating labels (Apple prefers static above) |
| Use placeholder text as hint, not label | Use placeholder as the only label |
| Show clear button when field has content | Hide the clear affordance on search fields |
| Match keyboard type to data (email, tel) | Use generic text keyboard for all inputs |
| Validate on blur or submit contextually | Validate on every keystroke (noisy) |
