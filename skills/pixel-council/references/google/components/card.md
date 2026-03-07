---
name: card
description: M3 elevated, filled, outlined card containers with complete states
metadata:
  tags: card, container, surface, content, panel
---

# Card -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Corner radius | 12px |
| Padding | 16px |
| Height | Content-determined |
| Title font | Roboto, 16px/24px, weight 500, spacing 0.15px |
| Body font | Roboto, 14px/20px, weight 400, spacing 0.25px |
| Surface color (light) | #FEF7FF |
| Surface color (dark) | #141218 |

## Design Tokens

```css
:root {
  --md-card-surface: #FEF7FF;
  --md-card-on-surface: #1D1B20;
  --md-card-on-surface-variant: #49454F;
  --md-card-surface-container-highest: #E6E0E9;
  --md-card-outline-variant: #CAC4D0;
  --md-card-primary: #6750A4;
  --md-card-radius: 12px;
  --md-card-padding: 16px;
  --md-card-shadow-1: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
  --md-card-shadow-2: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  --md-card-transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1),
    transform 200ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-card-surface: #141218;
    --md-card-on-surface: #E6E0E9;
    --md-card-on-surface-variant: #CAC4D0;
    --md-card-surface-container-highest: #36343B;
    --md-card-outline-variant: #49454F;
    --md-card-primary: #D0BCFF;
  }
}
.dark {
  --md-card-surface: #141218;
  --md-card-on-surface: #E6E0E9;
  --md-card-on-surface-variant: #CAC4D0;
  --md-card-surface-container-highest: #36343B;
  --md-card-outline-variant: #49454F;
  --md-card-primary: #D0BCFF;
}
```

## Variants

| Variant | Background (L) | Background (D) | Shadow | Border |
|---------|----------------|----------------|--------|--------|
| Elevated | #FEF7FF | #141218 | level 1 | none |
| Filled | #E6E0E9 | #36343B | none | none |
| Outlined | #FEF7FF | #141218 | none | 1px #CAC4D0 / #49454F |

## HTML Structure

```html
<!-- Elevated card -->
<article class="md-card md-card--elevated" tabindex="0">
  <div class="md-card__media">
    <img src="image.jpg" alt="Description" class="md-card__image" />
  </div>
  <div class="md-card__header">
    <h3 class="md-card__title">Title</h3>
    <p class="md-card__subtitle">Subtitle</p>
  </div>
  <div class="md-card__content">
    <p class="md-card__body">Supporting text for the card content goes here.</p>
  </div>
  <div class="md-card__actions">
    <button class="md-button md-button--text" type="button">Action 1</button>
    <button class="md-button md-button--text" type="button">Action 2</button>
  </div>
</article>

<!-- Filled card -->
<article class="md-card md-card--filled">
  <div class="md-card__header">
    <h3 class="md-card__title">Title</h3>
  </div>
  <div class="md-card__content">
    <p class="md-card__body">Content text.</p>
  </div>
</article>

<!-- Outlined card -->
<article class="md-card md-card--outlined">
  <div class="md-card__header">
    <h3 class="md-card__title">Title</h3>
  </div>
  <div class="md-card__content">
    <p class="md-card__body">Content text.</p>
  </div>
</article>

<!-- Interactive card (clickable) -->
<a href="/detail" class="md-card md-card--elevated md-card--interactive" role="article" aria-label="Card title">
  <span class="md-card__ripple"></span>
  <div class="md-card__header">
    <h3 class="md-card__title">Clickable Card</h3>
  </div>
  <div class="md-card__content">
    <p class="md-card__body">Entire surface is interactive.</p>
  </div>
</a>

<!-- Draggable card -->
<article class="md-card md-card--elevated" draggable="true" aria-grabbed="false">
  <div class="md-card__header">
    <h3 class="md-card__title">Draggable</h3>
  </div>
</article>
```

## Complete CSS

```css
.md-card {
  position: relative;
  display: flex;
  flex-direction: column;
  border-radius: var(--md-card-radius);
  overflow: hidden;
  transition: var(--md-card-transition);
  color: var(--md-card-on-surface);
  font-family: Roboto, 'Noto Sans', sans-serif;
}

/* -- Elevated -- */
.md-card--elevated {
  background: var(--md-card-surface);
  box-shadow: var(--md-card-shadow-1);
}

/* -- Filled -- */
.md-card--filled {
  background: var(--md-card-surface-container-highest);
  box-shadow: none;
}

/* -- Outlined -- */
.md-card--outlined {
  background: var(--md-card-surface);
  border: 1px solid var(--md-card-outline-variant);
  box-shadow: none;
}

/* -- Content areas -- */
.md-card__media { position: relative; overflow: hidden; }
.md-card__image { display: block; width: 100%; height: auto; object-fit: cover; }
.md-card__header { padding: var(--md-card-padding) var(--md-card-padding) 0; }
.md-card__content { padding: 8px var(--md-card-padding); }
.md-card__actions {
  display: flex; gap: 8px; padding: 8px var(--md-card-padding) var(--md-card-padding);
  justify-content: flex-end;
}
.md-card__media + .md-card__header { padding-top: var(--md-card-padding); }

/* -- Typography -- */
.md-card__title {
  font-size: 16px; font-weight: 500; line-height: 24px;
  letter-spacing: 0.15px; margin: 0;
  color: var(--md-card-on-surface);
}
.md-card__subtitle {
  font-size: 14px; font-weight: 400; line-height: 20px;
  letter-spacing: 0.25px; margin: 4px 0 0;
  color: var(--md-card-on-surface-variant);
}
.md-card__body {
  font-size: 14px; font-weight: 400; line-height: 20px;
  letter-spacing: 0.25px; margin: 0;
  color: var(--md-card-on-surface-variant);
}

/* -- Interactive card -- */
.md-card--interactive {
  cursor: pointer;
  text-decoration: none;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}
.md-card__ripple {
  position: absolute; inset: 0;
  pointer-events: none; overflow: hidden;
  border-radius: inherit;
}

/* -- Hover (elevated gains more shadow) -- */
.md-card--interactive.md-card--elevated:hover { box-shadow: var(--md-card-shadow-2); }
.md-card--interactive.md-card--filled:hover { box-shadow: var(--md-card-shadow-1); }
.md-card--interactive.md-card--outlined:hover { box-shadow: var(--md-card-shadow-1); }
.md-card--interactive:hover::before {
  content: ''; position: absolute; inset: 0;
  background: var(--md-card-on-surface); opacity: 0.08;
  pointer-events: none; border-radius: inherit;
}

/* -- Focus -- */
.md-card--interactive:focus-visible {
  outline: 2px solid var(--md-card-primary);
  outline-offset: 2px;
}
.md-card--interactive:focus-visible::before {
  content: ''; position: absolute; inset: 0;
  background: var(--md-card-on-surface); opacity: 0.10;
  pointer-events: none; border-radius: inherit;
}

/* -- Active / Pressed -- */
.md-card--interactive:active::before {
  content: ''; position: absolute; inset: 0;
  background: var(--md-card-on-surface); opacity: 0.10;
  pointer-events: none; border-radius: inherit;
}

/* -- Dragged -- */
.md-card[aria-grabbed="true"] {
  box-shadow: 0 4px 4px rgba(0,0,0,0.3), 0 8px 12px 6px rgba(0,0,0,0.15);
}
.md-card[aria-grabbed="true"]::before {
  content: ''; position: absolute; inset: 0;
  background: var(--md-card-on-surface); opacity: 0.16;
  pointer-events: none; border-radius: inherit;
}

/* -- Disabled -- */
.md-card--disabled {
  opacity: 0.38;
  pointer-events: none;
}

/* -- Ripple -- */
.md-card--interactive:active .md-card__ripple::after {
  content: ''; position: absolute;
  width: 100%; padding-top: 100%;
  border-radius: 50%;
  background: var(--md-card-on-surface);
  transform: scale(0); opacity: 0;
  animation: md-card-ripple 400ms cubic-bezier(0.2, 0, 0, 1) forwards;
}

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .md-card--elevated { box-shadow: var(--md-card-shadow-1); }
}
.dark .md-card--elevated { box-shadow: var(--md-card-shadow-1); }
```

## States Reference

| State | Elevated Shadow | Filled Shadow | Outlined Border | Overlay | Cursor |
|-------|----------------|---------------|-----------------|---------|--------|
| Default | level 1 | none | 1px #CAC4D0 | 0% | default |
| Hover | level 2 | level 1 | + level 1 | 8% on-surface | pointer |
| Focus | level 1 | none | 1px | 10% on-surface | pointer |
| Active | level 1 | none | 1px | 10% on-surface | pointer |
| Dragged | level 5 | level 5 | level 5 | 16% on-surface | grabbing |
| Disabled | level 1 | none | 1px | 0%, 38% opacity | not-allowed |

## Animation & Motion

```css
@keyframes md-card-ripple {
  from { transform: scale(0); opacity: 0.10; }
  to { transform: scale(2.5); opacity: 0; }
}
.md-card { transition: box-shadow 200ms cubic-bezier(0.2, 0, 0, 1), transform 200ms cubic-bezier(0.2, 0, 0, 1); }

@media (prefers-reduced-motion: reduce) {
  .md-card { transition: none; }
  .md-card--interactive:active .md-card__ripple::after { animation: none; }
}
```

## Accessibility

- **ARIA**: `role="article"` on interactive cards, `aria-label` for clickable cards, `aria-grabbed` for draggable
- **Keyboard**: Tab to focus interactive cards, Enter/Space to activate
- **Focus ring**: 2px solid primary, 2px offset
- **Touch target**: entire card surface is tappable
- **Screen reader**: card title and actions announced, action buttons individually focusable

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Single column, full-width cards, stacked vertically |
| 600-1024px | 2-column grid, 8-16px gap |
| > 1024px | 3-4 column grid, 16-24px gap, max-width per card |

## Do / Don't

| Do | Don't |
|----|-------|
| Use Elevated for default card on surface | Combine shadow AND border on the same card |
| Use Filled on dimmer backgrounds for contrast | Use Elevated on patterned/noisy backgrounds |
| Use Outlined when clear boundary is needed | Nest interactive cards inside other cards |
| Keep actions at card bottom | Place unrelated content in a single card |
| Use consistent variant within a card group | Mix Elevated/Filled/Outlined in the same list |
