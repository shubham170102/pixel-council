---
name: alert
description: Apple alert dialogs with title, message, and 1-3 action buttons
metadata:
  tags: alert, dialog, modal, confirm, popup, warning, error
---

# Alert -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Width | 270px |
| Corner radius | 14px (continuous) |
| Padding (top) | 20px |
| Background (light) | #FFFFFF with blur |
| Background (dark) | #1C1C1E with blur |
| Title font | SF Pro, 17px/22px, weight 600 |
| Message font | SF Pro, 13px/18px, weight 400 |
| Scrim | rgba(0, 0, 0, 0.4) |

## Design Tokens

```css
:root {
  --apple-alert-bg: rgba(255, 255, 255, 0.72);
  --apple-alert-title: #000000;
  --apple-alert-message: rgba(60, 60, 67, 0.6);
  --apple-alert-separator: rgba(60, 60, 67, 0.29);
  --apple-alert-action-default: #007AFF;
  --apple-alert-action-destructive: #FF3B30;
  --apple-alert-scrim: rgba(0, 0, 0, 0.4);
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-alert-bg: rgba(30, 30, 30, 0.72);
    --apple-alert-title: #FFFFFF;
    --apple-alert-message: rgba(235, 235, 245, 0.6);
    --apple-alert-separator: rgba(84, 84, 88, 0.6);
    --apple-alert-action-default: #0A84FF;
    --apple-alert-action-destructive: #FF453A;
  }
}

.dark {
  --apple-alert-bg: rgba(30, 30, 30, 0.72);
  --apple-alert-title: #FFFFFF;
  --apple-alert-message: rgba(235, 235, 245, 0.6);
  --apple-alert-separator: rgba(84, 84, 88, 0.6);
  --apple-alert-action-default: #0A84FF;
  --apple-alert-action-destructive: #FF453A;
}
```

## Variants

| Variant | Layout | Description |
|---------|--------|-------------|
| Two actions (side-by-side) | Horizontal | Cancel left, default right, separator between |
| Two actions (stacked) | Vertical | When labels are long |
| Three+ actions | Vertical | All stacked, cancel at bottom |
| Destructive | Vertical/Horizontal | Red text for destructive action |

## HTML Structure

```html
<!-- Scrim -->
<div class="apple-alert-scrim" aria-hidden="true"></div>

<!-- Side-by-side alert -->
<dialog class="apple-alert" role="alertdialog" aria-modal="true"
  aria-labelledby="alert-title" aria-describedby="alert-msg">
  <div class="apple-alert__content">
    <h2 class="apple-alert__title" id="alert-title">Delete Photo?</h2>
    <p class="apple-alert__message" id="alert-msg">This action cannot be undone.</p>
  </div>
  <div class="apple-alert__actions apple-alert__actions--horizontal">
    <button class="apple-alert__action">Cancel</button>
    <button class="apple-alert__action apple-alert__action--destructive">Delete</button>
  </div>
</dialog>

<!-- Stacked alert -->
<dialog class="apple-alert" role="alertdialog" aria-modal="true"
  aria-labelledby="alert-title2" aria-describedby="alert-msg2">
  <div class="apple-alert__content">
    <h2 class="apple-alert__title" id="alert-title2">Save Changes?</h2>
    <p class="apple-alert__message" id="alert-msg2">You have unsaved changes.</p>
  </div>
  <div class="apple-alert__actions apple-alert__actions--vertical">
    <button class="apple-alert__action apple-alert__action--default">Save</button>
    <button class="apple-alert__action apple-alert__action--destructive">Don't Save</button>
    <button class="apple-alert__action">Cancel</button>
  </div>
</dialog>
```

## Complete CSS

```css
/* Scrim */
.apple-alert-scrim {
  position: fixed;
  inset: 0;
  background: var(--apple-alert-scrim);
  z-index: 999;
  opacity: 0;
  transition: opacity 200ms ease;
}
.apple-alert-scrim--visible { opacity: 1; }

/* Alert container */
.apple-alert {
  position: fixed;
  top: 50%;
  left: 50%;
  translate: -50% -50%;
  width: 270px;
  margin: 0;
  padding: 0;
  border: none;
  border-radius: 14px;
  background: var(--apple-alert-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  overflow: hidden;
  z-index: 1000;
  opacity: 0;
  scale: 1.05;
  transition: opacity 200ms ease, scale 200ms ease;
}
.apple-alert[open] {
  opacity: 1;
  scale: 1;
}

/* Content area */
.apple-alert__content {
  padding: 20px 16px 0;
  text-align: center;
}
.apple-alert__title {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Helvetica Neue', sans-serif;
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-alert-title);
}
.apple-alert__message {
  margin: 4px 0 0;
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-alert-message);
}

/* Actions -- horizontal */
.apple-alert__actions--horizontal {
  display: flex;
  margin-top: 16px;
  border-top: 0.5px solid var(--apple-alert-separator);
}
.apple-alert__actions--horizontal .apple-alert__action {
  flex: 1;
}
.apple-alert__actions--horizontal .apple-alert__action + .apple-alert__action {
  border-left: 0.5px solid var(--apple-alert-separator);
}

/* Actions -- vertical */
.apple-alert__actions--vertical {
  display: flex;
  flex-direction: column;
  margin-top: 16px;
  border-top: 0.5px solid var(--apple-alert-separator);
}
.apple-alert__actions--vertical .apple-alert__action + .apple-alert__action {
  border-top: 0.5px solid var(--apple-alert-separator);
}

/* Action button base */
.apple-alert__action {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 44px;
  padding: 0 8px;
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-alert-action-default);
  background: transparent;
  border: none;
  cursor: pointer;
  transition: background 100ms ease;
  -webkit-tap-highlight-color: transparent;
}
.apple-alert__action:active {
  background: rgba(0, 0, 0, 0.05);
}
.apple-alert__action:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: -4px;
}

/* Default (bold) action */
.apple-alert__action--default {
  font-weight: 600;
}

/* Destructive action */
.apple-alert__action--destructive {
  color: var(--apple-alert-action-destructive);
}

/* Cancel is always regular weight */

/* Dark mode active state */
@media (prefers-color-scheme: dark) {
  .apple-alert__action:active { background: rgba(255, 255, 255, 0.08); }
}
.dark .apple-alert__action:active { background: rgba(255, 255, 255, 0.08); }
```

## States Reference

| State | Default Action | Cancel Action | Destructive | Scrim | Cursor |
|-------|---------------|---------------|-------------|-------|--------|
| Default | tint color, 400 weight | tint color, 400 weight | red, 400 weight | 40% black | pointer |
| Default (bold) | tint color, 600 weight | — | — | — | pointer |
| Hover | subtle bg fill | subtle bg fill | subtle bg fill | — | pointer |
| Focus | 4px blue ring (inset) | 4px blue ring (inset) | 4px blue ring (inset) | — | pointer |
| Active | 5% black bg (light) / 8% white bg (dark) | same | same | — | pointer |
| Disabled | opacity 0.3 | — | opacity 0.3 | — | not-allowed |

## Animation & Motion

```css
@keyframes apple-alert-open {
  from { opacity: 0; scale: 1.05; }
  to   { opacity: 1; scale: 1; }
}
@keyframes apple-alert-close {
  from { opacity: 1; scale: 1; }
  to   { opacity: 0; scale: 1.05; }
}

.apple-alert--opening {
  animation: apple-alert-open 200ms ease forwards;
}
.apple-alert--closing {
  animation: apple-alert-close 150ms ease forwards;
}

@media (prefers-reduced-motion: reduce) {
  .apple-alert,
  .apple-alert-scrim,
  .apple-alert--opening,
  .apple-alert--closing {
    animation: none;
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="alertdialog"`, `aria-modal="true"`, `aria-labelledby`, `aria-describedby`
- Keyboard: **Tab** cycles between action buttons (focus trap); **Enter** activates focused button
- Focus: move focus to preferred action on open; return focus to trigger on dismiss
- Touch target: all action buttons minimum 44x44px
- Screen reader: title and message read on open; VoiceOver announces "Alert" context
- Cancel: always provide a cancel/dismiss option for non-destructive path

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | 270px fixed width (iOS-native style) |
| 600-1024px | 270px centered, or widen to 320px for tablet |
| >1024px | 270px centered in viewport |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for critical decisions requiring acknowledgment | Use for routine information (use banners or toasts) |
| Keep title as question or clear statement | Use vague titles like "Warning" |
| Use descriptive action labels ("Delete", "Save") | Use "Yes" / "No" as button labels |
| Mark destructive actions in red | Stack multiple alerts |
| Always provide a cancel option | Use alerts for non-critical choices (use action sheets) |
