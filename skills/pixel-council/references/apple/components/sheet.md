---
name: sheet
description: Apple modal sheets with detents (medium/large), drag indicator, and dismiss gesture
metadata:
  tags: sheet, bottom sheet, modal, drawer, panel, popover
---

# Sheet -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Corner radius (top) | 10px |
| Grabber size | 36x5px |
| Grabber radius | 2.5px |
| Grabber color | rgba(60, 60, 67, 0.3) |
| Background (light) | #FFFFFF with blur |
| Background (dark) | #1C1C1E with blur |
| Scrim | rgba(0, 0, 0, 0.4) |
| Animation | 400ms spring |

## Design Tokens

```css
:root {
  --apple-sheet-bg: rgba(255, 255, 255, 0.92);
  --apple-sheet-surface: #FFFFFF;
  --apple-sheet-grabber: rgba(60, 60, 67, 0.3);
  --apple-sheet-scrim: rgba(0, 0, 0, 0.4);
  --apple-sheet-separator: rgba(60, 60, 67, 0.29);
  --apple-sheet-title: #000000;
  --apple-sheet-radius: 10px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-sheet-bg: rgba(28, 28, 30, 0.92);
    --apple-sheet-surface: #1C1C1E;
    --apple-sheet-grabber: rgba(235, 235, 245, 0.3);
    --apple-sheet-separator: rgba(84, 84, 88, 0.6);
    --apple-sheet-title: #FFFFFF;
  }
}

.dark {
  --apple-sheet-bg: rgba(28, 28, 30, 0.92);
  --apple-sheet-surface: #1C1C1E;
  --apple-sheet-grabber: rgba(235, 235, 245, 0.3);
  --apple-sheet-separator: rgba(84, 84, 88, 0.6);
  --apple-sheet-title: #FFFFFF;
}
```

## Variants

| Variant | Description |
|---------|-------------|
| Large detent | Fully expanded, near full-screen |
| Medium detent | Approximately half screen height |
| Custom detent | Developer-specified height |
| Modal | Blocks parent interaction, scrim visible |
| Non-modal | Parent remains interactive, no scrim |

## HTML Structure

```html
<!-- Scrim -->
<div class="apple-sheet-scrim" aria-hidden="true"></div>

<!-- Sheet -->
<div class="apple-sheet" role="dialog" aria-modal="true" aria-labelledby="sheet-title">
  <div class="apple-sheet__grabber" aria-hidden="true"></div>
  <header class="apple-sheet__header">
    <button class="apple-sheet__cancel">Cancel</button>
    <h2 class="apple-sheet__title" id="sheet-title">Sheet Title</h2>
    <button class="apple-sheet__done">Done</button>
  </header>
  <div class="apple-sheet__content">
    <!-- Scrollable sheet content -->
  </div>
</div>
```

## Complete CSS

```css
/* Scrim */
.apple-sheet-scrim {
  position: fixed;
  inset: 0;
  background: var(--apple-sheet-scrim);
  z-index: 999;
  opacity: 0;
  pointer-events: none;
  transition: opacity 400ms ease;
}
.apple-sheet-scrim--visible {
  opacity: 1;
  pointer-events: auto;
}

/* Sheet container */
.apple-sheet {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  max-height: 95vh;
  background: var(--apple-sheet-bg);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-radius: var(--apple-sheet-radius) var(--apple-sheet-radius) 0 0;
  z-index: 1000;
  translate: 0 100%;
  transition: translate 400ms cubic-bezier(0.32, 0.72, 0, 1);
  overflow: hidden;
  touch-action: none;
}
.apple-sheet--open {
  translate: 0 0;
}

/* Detent sizes */
.apple-sheet--medium {
  max-height: 50vh;
}
.apple-sheet--large {
  max-height: 95vh;
}

/* Grabber handle */
.apple-sheet__grabber {
  width: 36px;
  height: 5px;
  margin: 6px auto 0;
  background: var(--apple-sheet-grabber);
  border-radius: 2.5px;
  cursor: grab;
}
.apple-sheet__grabber:active {
  cursor: grabbing;
}

/* Header */
.apple-sheet__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 16px;
  border-bottom: 0.5px solid var(--apple-sheet-separator);
}
.apple-sheet__title {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'Helvetica Neue', sans-serif;
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-sheet-title);
  text-align: center;
  flex: 1;
}
.apple-sheet__cancel,
.apple-sheet__done {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', 'Helvetica Neue', sans-serif;
  font-size: 17px;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: #007AFF;
  background: transparent;
  border: none;
  padding: 8px;
  cursor: pointer;
  min-width: 60px;
  min-height: 44px;
  display: flex;
  align-items: center;
}
.apple-sheet__cancel { font-weight: 400; justify-content: flex-start; }
.apple-sheet__done { font-weight: 600; justify-content: flex-end; }
.apple-sheet__cancel:focus-visible,
.apple-sheet__done:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
  border-radius: 4px;
}

/* Content */
.apple-sheet__content {
  padding: 16px;
  overflow-y: auto;
  max-height: calc(95vh - 80px);
  -webkit-overflow-scrolling: touch;
}
.apple-sheet--medium .apple-sheet__content {
  max-height: calc(50vh - 80px);
}

/* Dark mode button color */
@media (prefers-color-scheme: dark) {
  .apple-sheet__cancel,
  .apple-sheet__done { color: #0A84FF; }
}
.dark .apple-sheet__cancel,
.dark .apple-sheet__done { color: #0A84FF; }
```

## States Reference

| State | Sheet Position | Scrim | Grabber | Cancel/Done | Cursor |
|-------|---------------|-------|---------|-------------|--------|
| Closed | offscreen (100% Y) | hidden | — | — | — |
| Medium detent | 50vh | visible, 40% | visible | tint color | pointer |
| Large detent | 95vh | visible, 40% | visible | tint color | pointer |
| Transitioning | animating | fading | visible | tint color | — |
| Grabber hover | — | — | cursor: grab | — | grab |
| Grabber active | dragging | opacity changes | cursor: grabbing | — | grabbing |
| Cancel/Done hover | — | — | — | subtle bg fill | pointer |
| Cancel/Done focus | — | — | — | 4px blue ring | pointer |
| Cancel/Done active | — | — | — | opacity 0.5 | pointer |

## Animation & Motion

```css
@keyframes apple-sheet-slide-up {
  from { translate: 0 100%; }
  to   { translate: 0 0; }
}
@keyframes apple-sheet-slide-down {
  from { translate: 0 0; }
  to   { translate: 0 100%; }
}

.apple-sheet--opening {
  animation: apple-sheet-slide-up 400ms cubic-bezier(0.32, 0.72, 0, 1) forwards;
}
.apple-sheet--closing {
  animation: apple-sheet-slide-down 300ms cubic-bezier(0.32, 0.72, 0, 1) forwards;
}

/* Detent transition (snapping between medium/large) */
.apple-sheet--transitioning {
  transition: max-height 400ms cubic-bezier(0.32, 0.72, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .apple-sheet,
  .apple-sheet-scrim,
  .apple-sheet--opening,
  .apple-sheet--closing,
  .apple-sheet--transitioning {
    animation: none;
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="dialog"`, `aria-modal="true"`, `aria-labelledby` pointing to title
- Keyboard: **Escape** to dismiss; **Tab** cycles within sheet (focus trap for modal)
- Focus: move focus to first interactive element on open; return to trigger on close
- Grabber: `aria-hidden="true"` (decorative); provide explicit close button
- Touch target: all buttons minimum 44x44px
- VoiceOver: grabber tap cycles detents; announces "sheet" context
- Dismiss gesture: swipe down to dismiss; confirm if unsaved changes

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| <600px | Full width, bottom-anchored, medium/large detents |
| 600-1024px | Full width or max 540px centered |
| >1024px | Consider modal dialog instead of bottom sheet |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for simple, scoped tasks | Use for complex multi-step workflows |
| Support swipe-down dismiss gesture | Require button-only dismissal |
| Show grabber to indicate resizability | Stack sheets on top of each other |
| Confirm on dismiss if there are unsaved changes | Display more than one sheet at a time |
| Use medium detent for preview content | Use sheet for critical alerts (use alert dialog) |
