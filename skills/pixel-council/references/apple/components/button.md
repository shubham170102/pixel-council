---
name: button
description: Apple system buttons — bordered, borderless, bordered-prominent with tint color and press states
metadata:
  tags: button, cta, action, form, submit, click, tint
---

# Button -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Min touch target | 44x44px |
| Corner radius | ~12px continuous |
| Font | SF Pro, 17px/22px, weight 400-600 |
| Primary color (light) | #007AFF |
| Primary color (dark) | #0A84FF |
| Destructive color (light) | #FF3B30 |
| Destructive color (dark) | #FF453A |

## Design Tokens

```css
:root {
  --apple-button-blue: #007AFF;
  --apple-button-red: #FF3B30;
  --apple-button-label: #000000;
  --apple-button-secondary-label: rgba(60,60,67,0.6);
  --apple-button-fill: rgba(120,120,128,0.16);
  --apple-button-bg: #FFFFFF;
  --apple-button-grouped-bg: #F2F2F7;
  --apple-button-separator: rgba(60,60,67,0.29);
  --apple-button-radius: 12px;
  --apple-button-transition: opacity 150ms ease-out, transform 150ms ease-out;
  --apple-button-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-button-blue: #0A84FF;
    --apple-button-red: #FF453A;
    --apple-button-label: #FFFFFF;
    --apple-button-secondary-label: rgba(235,235,245,0.6);
    --apple-button-fill: rgba(120,120,128,0.36);
    --apple-button-bg: #000000;
    --apple-button-grouped-bg: #1C1C1E;
    --apple-button-separator: rgba(84,84,88,0.6);
  }
}
.dark {
  --apple-button-blue: #0A84FF;
  --apple-button-red: #FF453A;
  --apple-button-label: #FFFFFF;
  --apple-button-secondary-label: rgba(235,235,245,0.6);
  --apple-button-fill: rgba(120,120,128,0.36);
  --apple-button-bg: #000000;
  --apple-button-grouped-bg: #1C1C1E;
  --apple-button-separator: rgba(84,84,88,0.6);
}
```

## Variants

| Style | Background (Light) | Text (Light) | Background (Dark) | Text (Dark) |
|-------|-------------------|--------------|-------------------|-------------|
| Bordered Prominent | #007AFF | #FFFFFF | #0A84FF | #FFFFFF |
| Bordered | rgba(120,120,128,0.16) | #007AFF | rgba(120,120,128,0.36) | #0A84FF |
| Borderless | transparent | #007AFF | transparent | #0A84FF |
| Destructive | transparent | #FF3B30 | transparent | #FF453A |

## HTML Structure

```html
<!-- Bordered Prominent -->
<button class="apple-button apple-button--prominent" type="button">
  Label
</button>

<!-- Bordered Prominent with icon -->
<button class="apple-button apple-button--prominent apple-button--icon" type="button">
  <span class="apple-button__icon" aria-hidden="true"><!-- svg --></span>
  Label
</button>

<!-- Bordered -->
<button class="apple-button apple-button--bordered" type="button">
  Label
</button>

<!-- Borderless -->
<button class="apple-button apple-button--borderless" type="button">
  Label
</button>

<!-- Destructive -->
<button class="apple-button apple-button--destructive" type="button">
  Delete
</button>

<!-- Disabled -->
<button class="apple-button apple-button--prominent" type="button" disabled aria-disabled="true">
  Label
</button>

<!-- Loading -->
<button class="apple-button apple-button--prominent" type="button" data-loading aria-busy="true">
  <span class="apple-button__spinner" role="progressbar" aria-label="Loading"></span>
  <span class="apple-button__text">Label</span>
</button>
```

## Complete CSS

```css
.apple-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  min-height: 44px;
  padding: 8px 20px;
  border: none;
  border-radius: var(--apple-button-radius);
  font-family: var(--apple-button-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  text-decoration: none;
  cursor: pointer;
  transition: var(--apple-button-transition);
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}
.apple-button__icon { width: 20px; height: 20px; flex-shrink: 0; }

/* -- Bordered Prominent -- */
.apple-button--prominent {
  background: var(--apple-button-blue);
  color: #FFFFFF;
  font-weight: 600;
}

/* -- Bordered -- */
.apple-button--bordered {
  background: var(--apple-button-fill);
  color: var(--apple-button-blue);
}

/* -- Borderless -- */
.apple-button--borderless {
  background: transparent;
  color: var(--apple-button-blue);
}

/* -- Destructive -- */
.apple-button--destructive {
  background: transparent;
  color: var(--apple-button-red);
}
.apple-button--destructive.apple-button--prominent {
  background: var(--apple-button-red);
  color: #FFFFFF;
}

/* -- Pressed state (all) -- */
.apple-button:active {
  opacity: 0.7;
  transform: scale(0.98);
}

/* -- Hover (desktop) -- */
@media (hover: hover) {
  .apple-button--prominent:hover { filter: brightness(1.1); }
  .apple-button--bordered:hover { background: rgba(120,120,128,0.24); }
  .apple-button--borderless:hover { background: rgba(120,120,128,0.08); }
  .apple-button--destructive:hover { background: rgba(255,59,48,0.08); }
}

/* -- Focus -- */
.apple-button:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}

/* -- Disabled -- */
.apple-button:disabled,
.apple-button[aria-disabled="true"] {
  opacity: 0.3;
  cursor: not-allowed;
  pointer-events: none;
}

/* -- Loading -- */
.apple-button[data-loading] { pointer-events: none; cursor: wait; }
.apple-button__spinner {
  width: 16px; height: 16px;
  border: 2px solid currentColor;
  border-right-color: transparent;
  border-radius: 50%;
  animation: apple-spin 700ms linear infinite;
}
.apple-button[data-loading] .apple-button__text { opacity: 0; }

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .apple-button:focus-visible { outline-color: rgba(10, 132, 255, 0.6); }
  .apple-button--destructive:hover { background: rgba(255,69,58,0.08); }
}
.dark .apple-button:focus-visible { outline-color: rgba(10, 132, 255, 0.6); }
```

## States Reference

| State | Prominent | Bordered | Borderless | Destructive | Cursor |
|-------|-----------|----------|------------|-------------|--------|
| Default | bg #007AFF | bg fill | transparent | transparent | pointer |
| Hover | brightness 1.1 | darker fill | subtle fill | red 8% fill | pointer |
| Focus | 4px blue ring | 4px blue ring | 4px blue ring | 4px blue ring | pointer |
| Active | opacity 0.7 | opacity 0.7 | opacity 0.7 | opacity 0.7 | pointer |
| Disabled | opacity 0.3 | opacity 0.3 | opacity 0.3 | opacity 0.3 | not-allowed |
| Loading | spinner | spinner | spinner | spinner | wait |

## Animation & Motion

```css
@keyframes apple-spin {
  to { transform: rotate(360deg); }
}
@media (prefers-reduced-motion: reduce) {
  .apple-button { transition: none; }
  .apple-button__spinner { animation: none; }
}
```

## Accessibility

- **ARIA**: implicit `role="button"` on `<button>`, `aria-disabled="true"` for disabled, `aria-busy="true"` for loading
- **Keyboard**: Tab to focus, Enter/Space to activate, Return key activates primary role
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: minimum 44x44px (iOS standard)
- **Screen reader**: loading state announced via `aria-busy`

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full-width via `.apple-button--full { width: 100% }`, stacked vertically |
| 600-1024px | Auto width, vertical stacking in sheets |
| > 1024px | Auto width, inline groups; macOS uses smaller 28-32px height |

## Do / Don't

| Do | Don't |
|----|-------|
| Limit to 1-2 Prominent buttons per view | Use Prominent for every button |
| Use title-case action verbs ("Add to Cart") | Use all-caps or sentence fragments |
| Use Destructive style for irreversible actions | Assign primary role to destructive buttons |
| Provide press feedback (opacity change) | Use custom hover effects on visionOS |
| Use SF Pro system font stack | Override with custom fonts for system buttons |
