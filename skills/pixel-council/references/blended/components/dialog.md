---
name: dialog
description: Blended modal dialog with scrim, title, content, and action buttons
metadata:
  tags: dialog, modal, popup, confirm, alert, overlay
---

# Dialog -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Width | 320-560px |
| Corner radius | 16px |
| Padding | 24px |
| Background (light) | #FFFFFF with blur |
| Background (dark) | #1C1C1E with blur |
| Title font | System/Roboto, 18px/24px, weight 600 |
| Body font | System/Roboto, 14px/20px, weight 400 |
| Shadow | Level 3 + backdrop blur |
| Scrim | rgba(0, 0, 0, 0.4) with blur(4px) |

## Design Tokens

```css
:root {
  --dialog-bg: #FFFFFF;
  --dialog-blur-bg: rgba(255, 255, 255, 0.88);
  --dialog-title: #1D1B20;
  --dialog-body: #49454F;
  --dialog-action-primary: #6750A4;
  --dialog-action-destructive: #B3261E;
  --dialog-border: rgba(0, 0, 0, 0.08);
  --dialog-scrim: rgba(0, 0, 0, 0.4);
  --dialog-shadow: 0 1px 3px rgba(0,0,0,0.3), 0 4px 8px 3px rgba(0,0,0,0.15);
  --dialog-radius: 16px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --dialog-bg: #1C1C1E;
    --dialog-blur-bg: rgba(28, 28, 30, 0.88);
    --dialog-title: #E6E0E9;
    --dialog-body: #CAC4D0;
    --dialog-action-primary: #D0BCFF;
    --dialog-action-destructive: #F2B8B5;
    --dialog-border: rgba(255, 255, 255, 0.08);
  }
}

.dark {
  --dialog-bg: #1C1C1E;
  --dialog-blur-bg: rgba(28, 28, 30, 0.88);
  --dialog-title: #E6E0E9;
  --dialog-body: #CAC4D0;
  --dialog-action-primary: #D0BCFF;
  --dialog-action-destructive: #F2B8B5;
  --dialog-border: rgba(255, 255, 255, 0.08);
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Default | Title, body text, action buttons |
| Alert | Destructive confirmation, `role="alertdialog"` |
| Form | Contains form inputs, wider, scrollable body |

## HTML Structure

```html
<!-- Scrim -->
<div class="dialog-scrim" aria-hidden="true"></div>

<!-- Default dialog -->
<dialog class="dialog" role="dialog" aria-modal="true" aria-labelledby="dlg-title">
  <h2 class="dialog__title" id="dlg-title">Confirm Action</h2>
  <div class="dialog__body">
    <p>Are you sure you want to proceed?</p>
  </div>
  <div class="dialog__actions">
    <button class="dialog__action dialog__action--secondary">Cancel</button>
    <button class="dialog__action dialog__action--primary">Confirm</button>
  </div>
</dialog>

<!-- Alert dialog (destructive) -->
<dialog class="dialog dialog--alert" role="alertdialog" aria-modal="true"
  aria-labelledby="alert-title" aria-describedby="alert-desc">
  <h2 class="dialog__title" id="alert-title">Delete Account?</h2>
  <div class="dialog__body" id="alert-desc">
    <p>This action is permanent and cannot be undone.</p>
  </div>
  <div class="dialog__actions">
    <button class="dialog__action dialog__action--secondary">Cancel</button>
    <button class="dialog__action dialog__action--destructive">Delete</button>
  </div>
</dialog>

<!-- Form dialog -->
<dialog class="dialog dialog--form" role="dialog" aria-modal="true"
  aria-labelledby="form-title">
  <h2 class="dialog__title" id="form-title">Edit Profile</h2>
  <div class="dialog__body">
    <form id="dialog-form">
      <label for="name">Name</label>
      <input type="text" id="name" />
    </form>
  </div>
  <div class="dialog__actions">
    <button class="dialog__action dialog__action--secondary">Cancel</button>
    <button class="dialog__action dialog__action--primary" form="dialog-form">Save</button>
  </div>
</dialog>
```

## Complete CSS

```css
/* Scrim */
.dialog-scrim {
  position: fixed;
  inset: 0;
  background: var(--dialog-scrim);
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
  z-index: 999;
  opacity: 0;
  pointer-events: none;
  transition: opacity 200ms ease;
}
.dialog-scrim--visible {
  opacity: 1;
  pointer-events: auto;
}

/* Dialog */
.dialog {
  position: fixed;
  top: 50%;
  left: 50%;
  translate: -50% -50%;
  width: min(90vw, 400px);
  min-width: 320px;
  max-width: 560px;
  padding: 24px;
  margin: 0;
  background: var(--dialog-blur-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border: 0.5px solid var(--dialog-border);
  border-radius: var(--dialog-radius);
  box-shadow: var(--dialog-shadow);
  z-index: 1000;
  opacity: 0;
  translate: -50% calc(-50% + 8px);
  transition: opacity 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0),
              translate 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
.dialog[open] {
  opacity: 1;
  translate: -50% -50%;
}

/* Form dialog: wider */
.dialog--form {
  width: min(90vw, 480px);
}

/* Title */
.dialog__title {
  margin: 0 0 12px;
  font-family: -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;
  font-size: 18px;
  font-weight: 600;
  line-height: 24px;
  color: var(--dialog-title);
}

/* Body */
.dialog__body {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  color: var(--dialog-body);
  max-height: 60vh;
  overflow-y: auto;
}

/* Actions */
.dialog__actions {
  display: flex;
  justify-content: flex-end;
  gap: 8px;
  margin-top: 24px;
}

/* Action base */
.dialog__action {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  padding: 10px 20px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  min-height: 40px;
  transition: background 150ms ease, opacity 150ms ease;
}

/* Primary action */
.dialog__action--primary {
  background: var(--dialog-action-primary);
  color: #FFFFFF;
}
.dialog__action--primary:hover { opacity: 0.9; }
.dialog__action--primary:active { opacity: 0.8; }
.dialog__action--primary:focus-visible {
  outline: 2px solid var(--dialog-action-primary);
  outline-offset: 2px;
}

/* Secondary action */
.dialog__action--secondary {
  background: transparent;
  color: var(--dialog-action-primary);
}
.dialog__action--secondary:hover { background: rgba(103, 80, 164, 0.08); }
.dialog__action--secondary:active { background: rgba(103, 80, 164, 0.12); }
.dialog__action--secondary:focus-visible {
  outline: 2px solid var(--dialog-action-primary);
  outline-offset: 2px;
}

/* Destructive action */
.dialog__action--destructive {
  background: var(--dialog-action-destructive);
  color: #FFFFFF;
}
.dialog__action--destructive:hover { opacity: 0.9; }
.dialog__action--destructive:active { opacity: 0.8; }
.dialog__action--destructive:focus-visible {
  outline: 2px solid var(--dialog-action-destructive);
  outline-offset: 2px;
}

/* Dark mode secondary hover */
@media (prefers-color-scheme: dark) {
  .dialog__action--secondary:hover { background: rgba(208, 188, 255, 0.08); }
  .dialog__action--secondary:active { background: rgba(208, 188, 255, 0.12); }
}
.dark .dialog__action--secondary:hover { background: rgba(208, 188, 255, 0.08); }
.dark .dialog__action--secondary:active { background: rgba(208, 188, 255, 0.12); }
```

## Animation & Motion

```css
@keyframes dialog-open {
  from { opacity: 0; translate: -50% calc(-50% + 8px); }
  to   { opacity: 1; translate: -50% -50%; }
}
@keyframes dialog-close {
  from { opacity: 1; translate: -50% -50%; }
  to   { opacity: 0; translate: -50% calc(-50% + 8px); }
}

.dialog--opening { animation: dialog-open 200ms cubic-bezier(0.05, 0.7, 0.1, 1.0) forwards; }
.dialog--closing { animation: dialog-close 150ms cubic-bezier(0.3, 0.0, 0.8, 0.15) forwards; }

@media (prefers-reduced-motion: reduce) {
  .dialog, .dialog-scrim, .dialog--opening, .dialog--closing {
    animation: none;
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="dialog"` (default/form) or `role="alertdialog"` (alert), `aria-modal="true"`
- Label: `aria-labelledby` pointing to title; `aria-describedby` for alert body
- Keyboard: **Escape** closes (except alert with unsaved data); **Tab** cycles within (focus trap)
- Focus: move to first focusable element on open; return to trigger on close
- Touch target: action buttons minimum 44x48px
- Screen reader: title announced on open; alert variant interrupts reading
- Alert dialogs: do not close on scrim click; require explicit button action

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Width: min(90vw, 400px); consider full-screen for forms |
| 600-1024px | Max 480px centered |
| >1024px | Max 560px centered |

## Do / Don't

| Do | Don't |
|----|-------|
| Use alert variant for destructive confirmations | Use dialog for simple notifications (use toast) |
| Trap focus inside the dialog | Allow background interaction while open |
| Return focus to trigger element on close | Stack multiple dialogs |
| Use descriptive action labels ("Delete", "Save") | Use "Yes" / "No" as actions |
| Close on Escape for non-destructive dialogs | Dismiss alert dialogs on scrim click |
