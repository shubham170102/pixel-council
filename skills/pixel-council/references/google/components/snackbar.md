---
name: snackbar
description: M3 snackbar notifications with optional action and dismiss
metadata:
  tags: snackbar, toast, notification, message, feedback, alert
---

# Snackbar -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 48px (single-line), up to 68px (two-line) |
| Max width | 672px |
| Padding | 0 8px 0 16px |
| Corner radius | 4px |
| Background (light) | #322F35 |
| Background (dark) | #E6E0E9 |
| Text color (light) | #F5EFF7 |
| Text color (dark) | #322F35 |
| Font | Roboto, 14px/20px, weight 400 |

## Design Tokens

```css
:root {
  --md-snackbar-bg: #322F35;
  --md-snackbar-text: #F5EFF7;
  --md-snackbar-action: #D0BCFF;
  --md-snackbar-radius: 4px;
  --md-snackbar-shadow: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-snackbar-bg: #E6E0E9;
    --md-snackbar-text: #322F35;
    --md-snackbar-action: #6750A4;
  }
}

.dark {
  --md-snackbar-bg: #E6E0E9;
  --md-snackbar-text: #322F35;
  --md-snackbar-action: #6750A4;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Single-line | 48px height, message only or message + action |
| Two-line | Up to 68px, longer messages with wrapping |
| With close icon | Adds dismiss X button on right side |

## HTML Structure

```html
<!-- Single-line snackbar -->
<div class="md-snackbar" role="status" aria-live="polite" aria-atomic="true">
  <span class="md-snackbar__text">File deleted.</span>
  <button class="md-snackbar__action">Undo</button>
</div>

<!-- Two-line with close -->
<div class="md-snackbar md-snackbar--two-line" role="status" aria-live="polite" aria-atomic="true">
  <span class="md-snackbar__text">This item has been removed from your saved collection.</span>
  <div class="md-snackbar__controls">
    <button class="md-snackbar__action">Undo</button>
    <button class="md-snackbar__close" aria-label="Dismiss">
      <svg width="24" height="24" viewBox="0 0 24 24" aria-hidden="true">
        <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
      </svg>
    </button>
  </div>
</div>
```

## Complete CSS

```css
.md-snackbar {
  position: fixed;
  bottom: 8px;
  left: 50%;
  translate: -50% 0;
  display: flex;
  align-items: center;
  min-height: 48px;
  max-width: 672px;
  min-width: 288px;
  padding: 0 8px 0 16px;
  background: var(--md-snackbar-bg);
  color: var(--md-snackbar-text);
  border-radius: var(--md-snackbar-radius);
  box-shadow: var(--md-snackbar-shadow);
  z-index: 1000;
  opacity: 0;
  translate: -50% 100%;
  transition: opacity 150ms cubic-bezier(0, 0, 0, 1),
              translate 150ms cubic-bezier(0, 0, 0, 1);
}
.md-snackbar--visible {
  opacity: 1;
  translate: -50% 0;
}

/* Text */
.md-snackbar__text {
  flex: 1;
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0.25px;
  padding: 14px 0;
}

/* Two-line */
.md-snackbar--two-line {
  min-height: 68px;
}
.md-snackbar--two-line .md-snackbar__text {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* Controls wrapper */
.md-snackbar__controls {
  display: flex;
  align-items: center;
  gap: 4px;
  margin-left: 8px;
}

/* Action button */
.md-snackbar__action {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-snackbar-action);
  background: transparent;
  border: none;
  border-radius: 4px;
  padding: 8px 12px;
  cursor: pointer;
  white-space: nowrap;
  min-height: 36px;
  transition: background 150ms;
}
.md-snackbar__action:hover {
  background: rgba(208, 188, 255, 0.08);
}
.md-snackbar__action:focus-visible {
  outline: 2px solid var(--md-snackbar-action);
  outline-offset: 2px;
}
.md-snackbar__action:active {
  background: rgba(208, 188, 255, 0.1);
}

/* Close button */
.md-snackbar__close {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 36px;
  height: 36px;
  padding: 0;
  background: transparent;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  color: var(--md-snackbar-text);
  transition: background 150ms;
}
.md-snackbar__close:hover {
  background: rgba(245, 239, 247, 0.08);
}
.md-snackbar__close:focus-visible {
  outline: 2px solid var(--md-snackbar-action);
  outline-offset: 2px;
}

/* Dark mode action hover */
@media (prefers-color-scheme: dark) {
  .md-snackbar__action:hover { background: rgba(103, 80, 164, 0.08); }
  .md-snackbar__action:active { background: rgba(103, 80, 164, 0.1); }
  .md-snackbar__close:hover { background: rgba(50, 47, 53, 0.08); }
}
.dark .md-snackbar__action:hover { background: rgba(103, 80, 164, 0.08); }
.dark .md-snackbar__action:active { background: rgba(103, 80, 164, 0.1); }
.dark .md-snackbar__close:hover { background: rgba(50, 47, 53, 0.08); }
```

## Animation & Motion

```css
@keyframes md-snackbar-enter {
  from { opacity: 0; translate: -50% 100%; }
  to   { opacity: 1; translate: -50% 0; }
}
@keyframes md-snackbar-exit {
  from { opacity: 1; translate: -50% 0; }
  to   { opacity: 0; translate: -50% 100%; }
}

.md-snackbar--entering {
  animation: md-snackbar-enter 150ms cubic-bezier(0, 0, 0, 1) forwards;
}
.md-snackbar--exiting {
  animation: md-snackbar-exit 100ms cubic-bezier(0.3, 0, 1, 1) forwards;
}

@media (prefers-reduced-motion: reduce) {
  .md-snackbar,
  .md-snackbar--entering,
  .md-snackbar--exiting {
    animation: none;
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="status"`, `aria-live="polite"`, `aria-atomic="true"`
- Keyboard: action button reachable via **Tab**; **Escape** to dismiss (optional)
- Focus: do not steal focus from current task; snackbar is announced by screen reader
- Touch target: action button and close icon minimum 48x48px tap area
- Auto-dismiss: 4-10 seconds; pause timer on hover/focus for motor-impaired users

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Full width minus 16px margins, bottom-aligned |
| 600-1024px | Auto-width, max 672px, bottom-center |
| >1024px | Auto-width, max 672px, bottom-left (optional) |

## Do / Don't

| Do | Don't |
|----|-------|
| Keep messages short (1-2 lines max) | Use for critical actions (use dialog) |
| Provide an undo action for destructive operations | Show more than one snackbar at a time |
| Auto-dismiss after 4-10 seconds | Use "Dismiss" as an action label (use close icon) |
| Position above FAB and bottom navigation | Block critical UI elements |
| Queue subsequent snackbars | Stack snackbars on screen |
