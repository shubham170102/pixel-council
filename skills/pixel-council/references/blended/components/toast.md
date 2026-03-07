---
name: toast
description: Blended toast notification with optional action, auto-dismiss, and slide-in animation
metadata:
  tags: toast, snackbar, notification, message, feedback, alert
---

# Toast / Notification -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Min width | 288px |
| Max width | 560px |
| Padding | 12px 16px |
| Corner radius | 8px |
| Font | System/Roboto, 14px/20px, weight 400 |
| Position | top-right or bottom-center |
| Auto-dismiss | 4-8 seconds |
| Z-index | 1100 |

## Design Tokens

```css
:root {
  --toast-bg: #322F35;
  --toast-text: #F5EFF7;
  --toast-radius: 8px;
  --toast-shadow: 0 4px 12px rgba(0,0,0,0.15);
  --toast-info-accent: #6750A4;
  --toast-success-accent: #34C759;
  --toast-warning-accent: #FF9500;
  --toast-error-accent: #B3261E;
  --toast-action-color: #D0BCFF;
}

@media (prefers-color-scheme: dark) {
  :root {
    --toast-bg: #2B2930;
    --toast-text: #E6E0E9;
    --toast-info-accent: #D0BCFF;
    --toast-success-accent: #30D158;
    --toast-warning-accent: #FF9F0A;
    --toast-error-accent: #F2B8B5;
    --toast-action-color: #D0BCFF;
  }
}

.dark {
  --toast-bg: #2B2930;
  --toast-text: #E6E0E9;
  --toast-info-accent: #D0BCFF;
  --toast-success-accent: #30D158;
  --toast-warning-accent: #FF9F0A;
  --toast-error-accent: #F2B8B5;
  --toast-action-color: #D0BCFF;
}
```

## Variants

| Variant | Accent Color (light) | Icon | Auto-dismiss |
|---------|---------------------|------|-------------|
| Info | #6750A4 | Info circle | Yes |
| Success | #34C759 | Checkmark | Yes |
| Warning | #FF9500 | Triangle | Yes (longer) |
| Error | #B3261E | X circle | No (manual) |

## HTML Structure

```html
<!-- Toast container (stacks multiple toasts) -->
<div class="toast-container toast-container--top-right" aria-live="polite" aria-atomic="false">

  <!-- Info toast -->
  <div class="toast toast--info" role="status">
    <span class="toast__icon" aria-hidden="true">
      <svg width="20" height="20" viewBox="0 0 20 20"><circle cx="10" cy="10" r="9" fill="none" stroke="currentColor" stroke-width="1.5"/><path d="M10 9v4M10 7h.01" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
    </span>
    <span class="toast__message">Settings have been updated.</span>
    <button class="toast__action">Undo</button>
    <button class="toast__dismiss" aria-label="Dismiss">
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M12 4L4 12M4 4l8 8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
    </button>
    <div class="toast__progress"></div>
  </div>

  <!-- Success toast -->
  <div class="toast toast--success" role="status">
    <span class="toast__icon" aria-hidden="true">
      <svg width="20" height="20" viewBox="0 0 20 20"><circle cx="10" cy="10" r="9" fill="none" stroke="currentColor" stroke-width="1.5"/><path d="M6 10l3 3 5-5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </span>
    <span class="toast__message">File uploaded successfully.</span>
    <button class="toast__dismiss" aria-label="Dismiss">
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M12 4L4 12M4 4l8 8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
    </button>
    <div class="toast__progress"></div>
  </div>

  <!-- Error toast (no auto-dismiss) -->
  <div class="toast toast--error" role="alert">
    <span class="toast__icon" aria-hidden="true">
      <svg width="20" height="20" viewBox="0 0 20 20"><circle cx="10" cy="10" r="9" fill="none" stroke="currentColor" stroke-width="1.5"/><path d="M7 7l6 6M13 7l-6 6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
    </span>
    <span class="toast__message">Upload failed. Please try again.</span>
    <button class="toast__action">Retry</button>
    <button class="toast__dismiss" aria-label="Dismiss">
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M12 4L4 12M4 4l8 8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
    </button>
  </div>

</div>
```

## Complete CSS

```css
/* Toast container */
.toast-container {
  position: fixed;
  z-index: 1100;
  display: flex;
  flex-direction: column;
  gap: 8px;
  pointer-events: none;
  max-width: 100vw;
}
.toast-container--top-right {
  top: 16px;
  right: 16px;
}
.toast-container--bottom-center {
  bottom: 16px;
  left: 50%;
  translate: -50% 0;
  align-items: center;
}

/* Toast base */
.toast {
  display: flex;
  align-items: center;
  gap: 10px;
  min-width: 288px;
  max-width: 560px;
  padding: 12px 16px;
  background: var(--toast-bg);
  color: var(--toast-text);
  border-radius: var(--toast-radius);
  box-shadow: var(--toast-shadow);
  pointer-events: auto;
  position: relative;
  overflow: hidden;
  opacity: 0;
  translate: 100% 0;
  transition: opacity 250ms cubic-bezier(0.05, 0.7, 0.1, 1.0),
              translate 250ms cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
.toast-container--bottom-center .toast {
  translate: 0 100%;
}
.toast--visible {
  opacity: 1;
  translate: 0 0;
}

/* Icon */
.toast__icon {
  flex-shrink: 0;
  width: 20px;
  height: 20px;
  display: flex;
  align-items: center;
}

/* Variant accent colors (icon + left border) */
.toast--info  { border-left: 3px solid var(--toast-info-accent); }
.toast--info .toast__icon  { color: var(--toast-info-accent); }

.toast--success { border-left: 3px solid var(--toast-success-accent); }
.toast--success .toast__icon { color: var(--toast-success-accent); }

.toast--warning { border-left: 3px solid var(--toast-warning-accent); }
.toast--warning .toast__icon { color: var(--toast-warning-accent); }

.toast--error { border-left: 3px solid var(--toast-error-accent); }
.toast--error .toast__icon { color: var(--toast-error-accent); }

/* Message */
.toast__message {
  flex: 1;
  font-family: -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
}

/* Action button */
.toast__action {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  color: var(--toast-action-color);
  background: transparent;
  border: none;
  padding: 4px 8px;
  border-radius: 4px;
  cursor: pointer;
  white-space: nowrap;
  transition: background 150ms;
}
.toast__action:hover { background: rgba(208, 188, 255, 0.12); }
.toast__action:focus-visible {
  outline: 2px solid var(--toast-action-color);
  outline-offset: 1px;
}

/* Dismiss button */
.toast__dismiss {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  background: transparent;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  color: var(--toast-text);
  opacity: 0.7;
  transition: opacity 150ms, background 150ms;
}
.toast__dismiss:hover { opacity: 1; background: rgba(255, 255, 255, 0.08); }
.toast__dismiss:focus-visible {
  outline: 2px solid var(--toast-action-color);
  outline-offset: 1px;
  opacity: 1;
}

/* Auto-dismiss progress bar */
.toast__progress {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 3px;
  background: var(--toast-action-color);
  opacity: 0.4;
  border-radius: 0 0 0 var(--toast-radius);
  animation: toast-progress 5s linear forwards;
}
.toast--error .toast__progress { display: none; }
.toast:hover .toast__progress { animation-play-state: paused; }
```

## Animation & Motion

```css
@keyframes toast-enter-right {
  from { opacity: 0; translate: 100% 0; }
  to   { opacity: 1; translate: 0 0; }
}
@keyframes toast-enter-bottom {
  from { opacity: 0; translate: 0 100%; }
  to   { opacity: 1; translate: 0 0; }
}
@keyframes toast-exit-right {
  from { opacity: 1; translate: 0 0; }
  to   { opacity: 0; translate: 100% 0; }
}
@keyframes toast-exit-bottom {
  from { opacity: 1; translate: 0 0; }
  to   { opacity: 0; translate: 0 100%; }
}
@keyframes toast-progress {
  from { width: 100%; }
  to   { width: 0%; }
}

.toast--entering { animation: toast-enter-right 250ms cubic-bezier(0.05, 0.7, 0.1, 1.0) forwards; }
.toast--exiting  { animation: toast-exit-right 200ms cubic-bezier(0.3, 0, 0.8, 0.15) forwards; }

.toast-container--bottom-center .toast--entering {
  animation-name: toast-enter-bottom;
}
.toast-container--bottom-center .toast--exiting {
  animation-name: toast-exit-bottom;
}

@media (prefers-reduced-motion: reduce) {
  .toast, .toast--entering, .toast--exiting, .toast__progress {
    animation: none;
    transition: none;
  }
  .toast--visible { opacity: 1; translate: 0 0; }
}
```

## Accessibility

- Container: `aria-live="polite"`, `aria-atomic="false"` on toast container
- Info/Success/Warning: `role="status"` (polite announcement)
- Error: `role="alert"` (assertive announcement)
- Keyboard: action and dismiss buttons reachable via **Tab**
- Focus: do not steal focus from current task
- Auto-dismiss: pause timer on hover and focus for motor-impaired users
- Error toasts: do not auto-dismiss; require manual dismissal
- Touch target: dismiss button minimum 44x44px tap area

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Full width minus 32px margins, bottom-center position |
| 600-1024px | Auto-width (288-560px), top-right or bottom-center |
| >1024px | Auto-width, top-right position preferred |

## Do / Don't

| Do | Don't |
|----|-------|
| Keep messages short (1-2 lines) | Use for critical decisions (use dialog) |
| Use appropriate type (info/success/warning/error) | Show more than 3 toasts at once |
| Pause auto-dismiss on hover | Auto-dismiss error toasts |
| Provide undo action for destructive operations | Use "Dismiss" as an action label |
| Stack toasts with consistent spacing | Block critical UI elements |
| Use progress bar to show remaining time | Show identical duplicate toasts |
