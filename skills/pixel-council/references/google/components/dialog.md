---
name: dialog
description: M3 basic and full-screen dialogs with actions, scrim, and transition
metadata:
  tags: dialog, modal, popup, confirm, alert, overlay
---

# Dialog -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Min width | 280px |
| Max width | 560px |
| Padding | 24px |
| Corner radius | 28px |
| Title font | Roboto, 24px/32px, weight 400 |
| Body font | Roboto, 14px/20px, weight 400 |
| Background (light) | #ECE6F0 |
| Background (dark) | #2B2930 |
| Elevation | Level 3 |

## Design Tokens

```css
:root {
  --md-dialog-bg: #ECE6F0;
  --md-dialog-title-color: #1D1B20;
  --md-dialog-body-color: #49454F;
  --md-dialog-scrim: rgba(0, 0, 0, 0.32);
  --md-dialog-shadow: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  --md-dialog-radius: 28px;
  --md-dialog-action-color: #6750A4;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-dialog-bg: #2B2930;
    --md-dialog-title-color: #E6E0E9;
    --md-dialog-body-color: #CAC4D0;
    --md-dialog-action-color: #D0BCFF;
  }
}

.dark {
  --md-dialog-bg: #2B2930;
  --md-dialog-title-color: #E6E0E9;
  --md-dialog-body-color: #CAC4D0;
  --md-dialog-action-color: #D0BCFF;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Basic | Title, body, action buttons |
| Alert | `type="alert"`, requires acknowledgment, `role="alertdialog"` |
| Full-screen | Fills viewport, top app bar with close, 0px corner radius |
| Scrollable | Long content with scrollable body region |

## HTML Structure

```html
<!-- Basic dialog -->
<div class="md-dialog-scrim" aria-hidden="true"></div>
<dialog class="md-dialog" role="dialog" aria-modal="true" aria-labelledby="dialog-title">
  <h2 class="md-dialog__title" id="dialog-title">Dialog Title</h2>
  <div class="md-dialog__body">
    <p>Supporting text that describes the dialog purpose.</p>
  </div>
  <div class="md-dialog__actions">
    <button class="md-dialog__action" value="cancel">Cancel</button>
    <button class="md-dialog__action md-dialog__action--confirm" value="confirm">Confirm</button>
  </div>
</dialog>

<!-- Alert dialog -->
<dialog class="md-dialog md-dialog--alert" role="alertdialog" aria-modal="true"
  aria-labelledby="alert-title" aria-describedby="alert-body">
  <h2 class="md-dialog__title" id="alert-title">Discard draft?</h2>
  <div class="md-dialog__body" id="alert-body"><p>Changes will be lost.</p></div>
  <div class="md-dialog__actions">
    <button class="md-dialog__action" value="cancel">Cancel</button>
    <button class="md-dialog__action md-dialog__action--confirm" value="discard">Discard</button>
  </div>
</dialog>

<!-- Full-screen dialog -->
<dialog class="md-dialog md-dialog--fullscreen" role="dialog" aria-modal="true"
  aria-labelledby="fs-title">
  <header class="md-dialog__header">
    <button class="md-dialog__close" aria-label="Close">X</button>
    <h2 class="md-dialog__title" id="fs-title">Full Screen</h2>
    <button class="md-dialog__action md-dialog__action--confirm">Save</button>
  </header>
  <div class="md-dialog__body"><!-- content --></div>
</dialog>
```

## Complete CSS

```css
/* Scrim */
.md-dialog-scrim {
  position: fixed;
  inset: 0;
  background: var(--md-dialog-scrim);
  z-index: 999;
  opacity: 0;
  pointer-events: none;
  transition: opacity 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
.md-dialog-scrim--open {
  opacity: 1;
  pointer-events: auto;
}

/* Dialog */
.md-dialog {
  position: fixed;
  top: 50%;
  left: 50%;
  translate: -50% -50%;
  min-width: 280px;
  max-width: 560px;
  width: calc(100% - 48px);
  padding: 24px;
  margin: 0;
  background: var(--md-dialog-bg);
  color: var(--md-dialog-body-color);
  border: none;
  border-radius: var(--md-dialog-radius);
  box-shadow: var(--md-dialog-shadow);
  z-index: 1000;
  opacity: 0;
  scale: 0.9;
  transition: opacity 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0),
              scale 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
.md-dialog[open] {
  opacity: 1;
  scale: 1;
}

/* Title */
.md-dialog__title {
  margin: 0 0 16px;
  font-family: Roboto, sans-serif;
  font-size: 24px;
  font-weight: 400;
  line-height: 32px;
  letter-spacing: 0px;
  color: var(--md-dialog-title-color);
}

/* Body */
.md-dialog__body {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0.25px;
  color: var(--md-dialog-body-color);
  max-height: 60vh;
  overflow-y: auto;
}

/* Actions */
.md-dialog__actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  margin-top: 24px;
}
.md-dialog__action {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-dialog-action-color);
  background: transparent;
  border: none;
  border-radius: 20px;
  padding: 10px 12px;
  cursor: pointer;
  min-height: 40px;
  transition: background 200ms;
}
.md-dialog__action:hover {
  background: rgba(103, 80, 164, 0.08);
}
.md-dialog__action:focus-visible {
  outline: 2px solid var(--md-dialog-action-color);
  outline-offset: 2px;
  background: rgba(103, 80, 164, 0.1);
}
.md-dialog__action:active {
  background: rgba(103, 80, 164, 0.1);
}

/* Full-screen variant */
.md-dialog--fullscreen {
  min-width: 100%;
  min-height: 100%;
  border-radius: 0;
  padding: 0;
  top: 0;
  left: 0;
  translate: none;
}
.md-dialog--fullscreen .md-dialog__header {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 8px 16px;
  height: 56px;
}
.md-dialog--fullscreen .md-dialog__close {
  background: none;
  border: none;
  padding: 8px;
  cursor: pointer;
  color: var(--md-dialog-title-color);
}
.md-dialog--fullscreen .md-dialog__title {
  flex: 1;
  margin: 0;
  font-size: 22px;
  line-height: 28px;
}
.md-dialog--fullscreen .md-dialog__body {
  padding: 0 24px 24px;
  max-height: calc(100vh - 56px);
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .md-dialog__action:hover { background: rgba(208, 188, 255, 0.08); }
  .md-dialog__action:focus-visible { background: rgba(208, 188, 255, 0.1); }
  .md-dialog__action:active { background: rgba(208, 188, 255, 0.1); }
}
.dark .md-dialog__action:hover { background: rgba(208, 188, 255, 0.08); }
.dark .md-dialog__action:focus-visible { background: rgba(208, 188, 255, 0.1); }
.dark .md-dialog__action:active { background: rgba(208, 188, 255, 0.1); }
```

## Animation & Motion

```css
@keyframes md-dialog-open {
  from { opacity: 0; scale: 0.9; }
  to   { opacity: 1; scale: 1; }
}
@keyframes md-dialog-close {
  from { opacity: 1; scale: 1; }
  to   { opacity: 0; scale: 0.9; }
}
@keyframes md-scrim-open {
  from { opacity: 0; }
  to   { opacity: 1; }
}

.md-dialog--opening { animation: md-dialog-open 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0) forwards; }
.md-dialog--closing { animation: md-dialog-close 150ms cubic-bezier(0.3, 0.0, 0.8, 0.15) forwards; }

@media (prefers-reduced-motion: reduce) {
  .md-dialog,
  .md-dialog-scrim,
  .md-dialog--opening,
  .md-dialog--closing {
    animation: none;
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="dialog"` (basic) or `role="alertdialog"` (alert), `aria-modal="true"`
- Label: `aria-labelledby` pointing to title element; use `aria-label` if no visible title
- Keyboard: **Escape** closes dialog; **Tab** cycles focus within dialog (focus trap)
- Focus: move focus to first focusable element on open; return focus to trigger on close
- Touch target: action buttons minimum 48x48px
- Screen reader: dialog title announced on open; alert dialogs interrupt reading

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Width: calc(100% - 48px), consider full-screen variant |
| 600-1024px | Max-width 560px, centered |
| >1024px | Max-width 560px, centered |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for critical decisions requiring confirmation | Use for simple notifications (use snackbar) |
| Keep title concise (2-3 words) | Stack multiple dialogs |
| Right-align action buttons | Put more than 3 action buttons |
| Trap focus inside the dialog | Allow interaction with content behind dialog |
| Use alertdialog role for destructive actions | Dismiss destructive dialogs on scrim click |
