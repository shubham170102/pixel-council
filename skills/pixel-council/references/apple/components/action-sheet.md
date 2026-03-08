---
name: action-sheet
description: Apple action sheet — bottom sheet actions, destructive style, cancel button, grouped actions
metadata:
  tags: action sheet, bottom sheet, actions, destructive, cancel, confirm, share, delete
---

# Action Sheet -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Action height | 57px |
| Corner radius | 13px continuous |
| Action font | SF Pro, 20px/25px, weight 400 |
| Cancel font | SF Pro, 20px/25px, weight 600 |
| Destructive color (light) | #FF3B30 |
| Destructive color (dark) | #FF453A |
| Background (light) | rgba(255,255,255,0.94) |
| Background (dark) | rgba(44,44,46,0.94) |
| Gap between groups | 8px |
| CSS prefix | `.apple-actionsheet` |

## Design Tokens

```css
:root {
  --apple-actionsheet-bg: rgba(255, 255, 255, 0.94);
  --apple-actionsheet-text: #007AFF;
  --apple-actionsheet-destructive: #FF3B30;
  --apple-actionsheet-cancel-text: #007AFF;
  --apple-actionsheet-label: #000000;
  --apple-actionsheet-secondary: rgba(60, 60, 67, 0.6);
  --apple-actionsheet-separator: rgba(60, 60, 67, 0.29);
  --apple-actionsheet-pressed: rgba(120, 120, 128, 0.16);
  --apple-actionsheet-overlay: rgba(0, 0, 0, 0.4);
  --apple-actionsheet-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-actionsheet-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-actionsheet-bg: rgba(44, 44, 46, 0.94);
    --apple-actionsheet-text: #0A84FF;
    --apple-actionsheet-destructive: #FF453A;
    --apple-actionsheet-cancel-text: #0A84FF;
    --apple-actionsheet-label: #FFFFFF;
    --apple-actionsheet-secondary: rgba(235, 235, 245, 0.6);
    --apple-actionsheet-separator: rgba(84, 84, 88, 0.6);
    --apple-actionsheet-pressed: rgba(120, 120, 128, 0.36);
    --apple-actionsheet-overlay: rgba(0, 0, 0, 0.6);
    --apple-actionsheet-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-actionsheet-bg: rgba(44, 44, 46, 0.94);
  --apple-actionsheet-text: #0A84FF;
  --apple-actionsheet-destructive: #FF453A;
  --apple-actionsheet-cancel-text: #0A84FF;
  --apple-actionsheet-label: #FFFFFF;
  --apple-actionsheet-secondary: rgba(235, 235, 245, 0.6);
  --apple-actionsheet-separator: rgba(84, 84, 88, 0.6);
  --apple-actionsheet-pressed: rgba(120, 120, 128, 0.36);
  --apple-actionsheet-overlay: rgba(0, 0, 0, 0.6);
  --apple-actionsheet-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Actions | Cancel |
|-------|-------------|---------|--------|
| Standard | List of actions with cancel | 2-6 actions | Separate cancel button |
| With message | Title + message above actions | 2-6 actions | Separate cancel button |
| Destructive | Includes a red destructive action | 1+ destructive | Separate cancel button |
| iPad/Desktop popover | Renders as popover instead of bottom sheet | Same | No cancel (tap outside) |

## HTML Structure

```html
<!-- Action Sheet with Overlay -->
<div class="apple-actionsheet-overlay" aria-hidden="true"></div>
<div class="apple-actionsheet" role="dialog" aria-modal="true" aria-label="Actions">
  <!-- Action Group -->
  <div class="apple-actionsheet__group">
    <div class="apple-actionsheet__header">
      <p class="apple-actionsheet__title">Delete Photo</p>
      <p class="apple-actionsheet__message">This photo will be deleted from all your devices.</p>
    </div>
    <button class="apple-actionsheet__action apple-actionsheet__action--destructive">
      Delete Photo
    </button>
    <button class="apple-actionsheet__action">
      Save to Files
    </button>
  </div>
  <!-- Cancel Group (separate) -->
  <div class="apple-actionsheet__group">
    <button class="apple-actionsheet__action apple-actionsheet__action--cancel">
      Cancel
    </button>
  </div>
</div>

<!-- Simple Action Sheet (no header) -->
<div class="apple-actionsheet-overlay" aria-hidden="true"></div>
<div class="apple-actionsheet" role="dialog" aria-modal="true" aria-label="Share options">
  <div class="apple-actionsheet__group">
    <button class="apple-actionsheet__action">
      <svg class="apple-actionsheet__icon" aria-hidden="true" width="24" height="24"><!-- copy icon --></svg>
      Copy Link
    </button>
    <button class="apple-actionsheet__action">
      <svg class="apple-actionsheet__icon" aria-hidden="true" width="24" height="24"><!-- share icon --></svg>
      Share via Messages
    </button>
    <button class="apple-actionsheet__action">
      <svg class="apple-actionsheet__icon" aria-hidden="true" width="24" height="24"><!-- mail icon --></svg>
      Share via Email
    </button>
  </div>
  <div class="apple-actionsheet__group">
    <button class="apple-actionsheet__action apple-actionsheet__action--cancel">
      Cancel
    </button>
  </div>
</div>
```

## Complete CSS

```css
/* Overlay */
.apple-actionsheet-overlay {
  position: fixed;
  inset: 0;
  background: var(--apple-actionsheet-overlay);
  z-index: 999;
  animation: apple-actionsheet-overlay-in 300ms ease-out;
}

/* Container */
.apple-actionsheet {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  padding: 0 8px 8px;
  padding-bottom: calc(8px + env(safe-area-inset-bottom, 0px));
  font-family: var(--apple-actionsheet-font);
  -webkit-font-smoothing: antialiased;
  display: flex;
  flex-direction: column;
  gap: 8px;
  animation: apple-actionsheet-slide-up 300ms cubic-bezier(0.2, 0.8, 0.2, 1);
}

/* Groups */
.apple-actionsheet__group {
  background: var(--apple-actionsheet-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-radius: 13px;
  overflow: hidden;
}

/* Header (optional) */
.apple-actionsheet__header {
  padding: 14px 16px;
  text-align: center;
  border-bottom: 0.5px solid var(--apple-actionsheet-separator);
}
.apple-actionsheet__title {
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-actionsheet-secondary);
  margin: 0 0 2px;
}
.apple-actionsheet__message {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-actionsheet-secondary);
  margin: 0;
}

/* Actions */
.apple-actionsheet__action {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  width: 100%;
  height: 57px;
  padding: 0 16px;
  background: none;
  border: none;
  border-top: 0.5px solid var(--apple-actionsheet-separator);
  font-family: var(--apple-actionsheet-font);
  font-size: 20px;
  font-weight: 400;
  line-height: 25px;
  color: var(--apple-actionsheet-text);
  cursor: pointer;
  transition: background-color 100ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-actionsheet__action:first-child,
.apple-actionsheet__header + .apple-actionsheet__action {
  border-top: none;
}

/* Destructive */
.apple-actionsheet__action--destructive {
  color: var(--apple-actionsheet-destructive);
}

/* Cancel */
.apple-actionsheet__action--cancel {
  font-weight: 600;
  color: var(--apple-actionsheet-cancel-text);
  border-top: none;
}

/* Icon in action */
.apple-actionsheet__icon {
  width: 24px;
  height: 24px;
  flex-shrink: 0;
}

/* Pressed */
.apple-actionsheet__action:active {
  background: var(--apple-actionsheet-pressed);
}

/* Focus */
.apple-actionsheet__action:focus-visible {
  outline: 4px solid var(--apple-actionsheet-focus-ring);
  outline-offset: -4px;
  z-index: 1;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-actionsheet__action:hover {
    background: var(--apple-actionsheet-pressed);
  }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-actionsheet__action:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-actionsheet__action:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

/* iPad/Desktop: render as popover instead */
@media (min-width: 768px) {
  .apple-actionsheet-overlay { display: none; }
  .apple-actionsheet {
    position: absolute;
    bottom: auto;
    left: auto;
    right: auto;
    max-width: 320px;
    padding: 0;
    border-radius: 13px;
    box-shadow: 0 20px 25px rgba(0, 0, 0, 0.1), 0 10px 10px rgba(0, 0, 0, 0.04);
    animation: apple-actionsheet-popover-in 200ms ease-out;
  }
  .apple-actionsheet__group:last-child { display: none; } /* hide cancel on iPad */
}
```

## States Reference

| State | Standard Action | Destructive | Cancel | Cursor |
|-------|----------------|-------------|--------|--------|
| Default | tint text, 400 weight | red text, 400 weight | tint text, 600 weight | pointer |
| Hover | pressed fill bg | pressed fill bg | pressed fill bg | pointer |
| Focus | 4px blue ring (inset) | 4px blue ring (inset) | 4px blue ring (inset) | pointer |
| Active | pressed fill bg | pressed fill bg | pressed fill bg | pointer |
| Disabled | opacity 0.3 | opacity 0.3 | — | not-allowed |

## Animation & Motion

```css
@keyframes apple-actionsheet-slide-up {
  from { transform: translateY(100%); }
  to { transform: translateY(0); }
}

@keyframes apple-actionsheet-overlay-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes apple-actionsheet-popover-in {
  from { opacity: 0; transform: scale(0.95); }
  to { opacity: 1; transform: scale(1); }
}

/* Dismiss */
.apple-actionsheet--dismissing {
  animation: apple-actionsheet-slide-down 250ms ease-in forwards;
}
@keyframes apple-actionsheet-slide-down {
  to { transform: translateY(100%); }
}

@media (prefers-reduced-motion: reduce) {
  .apple-actionsheet,
  .apple-actionsheet-overlay,
  .apple-actionsheet--dismissing {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: `role="dialog"`, `aria-modal="true"`, `aria-label` on container, action buttons are standard buttons
- **Keyboard**: Tab to cycle through actions, Enter/Space to activate, Escape to dismiss (activates Cancel)
- **Focus ring**: 4px solid blue at 60% opacity, inset to fit within rounded group
- **Focus trap**: Focus must be trapped within action sheet while open
- **Touch target**: 57px action height exceeds 44px minimum
- **Screen reader**: Announces dialog label, each action text, destructive actions distinguished by color (ensure text also communicates danger)
- **Dismiss**: Tapping overlay or Cancel dismisses; overlay should not be the only dismiss method

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 768px | Bottom sheet with slide-up animation, full-width with 8px margins |
| >= 768px | Popover anchored to source element, no overlay, cancel hidden |
| > 1024px | Popover, max-width 320px, positioned contextually |

## Do / Don't

| Do | Don't |
|----|-------|
| Place destructive action at top of action list | Hide destructive actions at the bottom |
| Use title+message for irreversible actions | Add a title to every action sheet |
| Limit to 6 actions maximum | Use for long lists (use a menu instead) |
| Always include a Cancel button on iPhone | Omit cancel on phone-size layouts |
| Use 600 weight for Cancel to emphasize safe exit | Style Cancel the same as other actions |
