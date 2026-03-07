---
name: tooltip
description: M3 plain and rich tooltips with positioning and delay behavior
metadata:
  tags: tooltip, hint, help text, hover info, popover
---

# Tooltip -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Plain height | 24px (single line) |
| Plain padding | 4px 8px |
| Plain corner radius | 4px |
| Plain max width | 200px |
| Rich corner radius | 12px |
| Rich max width | 315px |
| Plain bg (light) | #322F35 |
| Plain text (light) | #F5EFF7 |
| Font (plain) | Roboto, 12px/16px, weight 400 |
| Fade-in duration | 200ms |

## Design Tokens

```css
:root {
  /* Plain tooltip */
  --md-tooltip-plain-bg: #322F35;
  --md-tooltip-plain-text: #F5EFF7;
  /* Rich tooltip */
  --md-tooltip-rich-bg: #FEF7FF;
  --md-tooltip-rich-title: #1D1B20;
  --md-tooltip-rich-text: #49454F;
  --md-tooltip-rich-border: #CAC4D0;
  --md-tooltip-rich-action: #6750A4;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-tooltip-plain-bg: #E6E0E9;
    --md-tooltip-plain-text: #322F35;
    --md-tooltip-rich-bg: #141218;
    --md-tooltip-rich-title: #E6E0E9;
    --md-tooltip-rich-text: #CAC4D0;
    --md-tooltip-rich-border: #49454F;
    --md-tooltip-rich-action: #D0BCFF;
  }
}

.dark {
  --md-tooltip-plain-bg: #E6E0E9;
  --md-tooltip-plain-text: #322F35;
  --md-tooltip-rich-bg: #141218;
  --md-tooltip-rich-title: #E6E0E9;
  --md-tooltip-rich-text: #CAC4D0;
  --md-tooltip-rich-border: #49454F;
  --md-tooltip-rich-action: #D0BCFF;
}
```

## Variants

| Variant | Content | Trigger | Persistence |
|---------|---------|---------|-------------|
| Plain | Single line of text | Hover / focus (500ms delay) | Disappears on mouse leave |
| Rich | Title + body + optional actions | Hover / focus | Persists for interaction |

## HTML Structure

```html
<!-- Plain tooltip -->
<div class="md-tooltip-wrapper">
  <button aria-describedby="tooltip-1">Hover me</button>
  <div class="md-tooltip" id="tooltip-1" role="tooltip">
    Brief description text
  </div>
</div>

<!-- Rich tooltip -->
<div class="md-tooltip-wrapper">
  <button aria-describedby="tooltip-2">More info</button>
  <div class="md-tooltip md-tooltip--rich" id="tooltip-2" role="tooltip">
    <div class="md-tooltip__title">Title</div>
    <div class="md-tooltip__body">
      Detailed description with supporting information about this element.
    </div>
    <div class="md-tooltip__actions">
      <button class="md-tooltip__action">Learn more</button>
    </div>
  </div>
</div>
```

## Complete CSS

```css
.md-tooltip-wrapper {
  position: relative;
  display: inline-flex;
}

/* Plain tooltip */
.md-tooltip {
  position: absolute;
  bottom: calc(100% + 8px);
  left: 50%;
  transform: translateX(-50%);
  height: 24px;
  padding: 4px 8px;
  border-radius: 4px;
  background: var(--md-tooltip-plain-bg);
  color: var(--md-tooltip-plain-text);
  font-family: Roboto, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  letter-spacing: 0.4px;
  white-space: nowrap;
  max-width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
  pointer-events: none;
  z-index: 70;
  opacity: 0;
  transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1);
}

/* Show on hover/focus */
.md-tooltip-wrapper:hover .md-tooltip,
.md-tooltip-wrapper:focus-within .md-tooltip {
  opacity: 1;
  transition-delay: 500ms;
}

/* Rich tooltip */
.md-tooltip--rich {
  height: auto;
  padding: 12px 16px;
  border-radius: 12px;
  background: var(--md-tooltip-rich-bg);
  color: var(--md-tooltip-rich-text);
  white-space: normal;
  max-width: 315px;
  min-width: 200px;
  pointer-events: auto;
  box-shadow: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  border: 1px solid var(--md-tooltip-rich-border);
}

.md-tooltip__title {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-tooltip-rich-title);
  margin-bottom: 4px;
}

.md-tooltip__body {
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0.25px;
  color: var(--md-tooltip-rich-text);
}

.md-tooltip__actions {
  display: flex;
  justify-content: flex-end;
  margin-top: 8px;
}

.md-tooltip__action {
  background: none;
  border: none;
  font-family: Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: 0.1px;
  color: var(--md-tooltip-rich-action);
  cursor: pointer;
  padding: 4px 8px;
  border-radius: 4px;
}

.md-tooltip__action:hover {
  background: rgba(103, 80, 164, 0.08);
}

.md-tooltip__action:focus-visible {
  outline: none;
  background: rgba(103, 80, 164, 0.10);
}

/* Rich tooltip: no hover delay */
.md-tooltip-wrapper:hover .md-tooltip--rich,
.md-tooltip-wrapper:focus-within .md-tooltip--rich {
  transition-delay: 0ms;
}

/* Positioning variants */
.md-tooltip--bottom {
  bottom: auto;
  top: calc(100% + 8px);
}

.md-tooltip--left {
  bottom: auto;
  top: 50%;
  left: auto;
  right: calc(100% + 8px);
  transform: translateY(-50%);
}

.md-tooltip--right {
  bottom: auto;
  top: 50%;
  left: calc(100% + 8px);
  transform: translateY(-50%);
}
```

## States Reference

Tooltips are informational -- they have no direct interactive states. The trigger element carries states.

| Tooltip State | Opacity | Delay |
|---------------|---------|-------|
| Hidden | 0 | -- |
| Visible (plain) | 1 | 500ms hover delay |
| Visible (rich) | 1 | 0ms |

## Animation & Motion

```css
.md-tooltip {
  transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  .md-tooltip {
    transition: none;
  }
}
```

## Accessibility

- ARIA: `role="tooltip"`, `aria-describedby` on trigger pointing to tooltip `id`
- Keyboard: Tooltip shows on focus of trigger element
- Not independently focusable (plain); rich tooltip actions are focusable
- Dismiss: Escape key should hide tooltip
- Screen reader: Content announced when trigger receives focus

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Avoid plain tooltips on touch devices; use rich or inline text |
| 600-1024px | Standard behavior |
| > 1024px | Standard behavior with hover support |

## Do / Don't

| Do | Don't |
|----|-------|
| Use plain for brief icon descriptions | Use tooltip for essential information |
| Use rich for supplementary details | Duplicate information visible elsewhere |
| Position to avoid viewport overflow | Let tooltips clip off-screen |
| Keep plain tooltips to one line | Put interactive elements in plain tooltips |
