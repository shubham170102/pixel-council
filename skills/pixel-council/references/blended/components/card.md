---
name: card
description: Blended card with M3 surface tokens and Apple continuous corner radius
metadata:
  tags: card, container, surface, content, panel
---

# Card -- Blended Recommendation

## Quick Reference

| Property | Value |
|----------|-------|
| Corner radius | 12px |
| Padding | 16px |
| Height | Content-determined |
| Title font | System font, 16-17px/22-24px, weight 600 |
| Body font | System font, 14-15px/20-22px, weight 400 |
| Surface (light) | #FFFFFF |
| Surface (dark) | #1C1C1E |

## Design Tokens

```css
:root {
  --card-bg: #FFFFFF;
  --card-bg-filled: #E6E0E9;
  --card-on-surface: #1D1B20;
  --card-on-surface-variant: #49454F;
  --card-outline: #CAC4D0;
  --card-primary: #6750A4;
  --card-radius: 12px;
  --card-padding: 16px;
  --card-shadow-1: 0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06);
  --card-shadow-2: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
  --card-shadow-3: 0 10px 15px rgba(0,0,0,0.08), 0 4px 6px rgba(0,0,0,0.05);
  --card-transition: transform 200ms ease-out, box-shadow 200ms ease-out;
  --card-font: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto,
    'Helvetica Neue', Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --card-bg: #1C1C1E;
    --card-bg-filled: #36343B;
    --card-on-surface: #E6E0E9;
    --card-on-surface-variant: #CAC4D0;
    --card-outline: #49454F;
    --card-primary: #D0BCFF;
    --card-shadow-1: 0 1px 3px rgba(0,0,0,0.3), 0 1px 2px rgba(0,0,0,0.2);
    --card-shadow-2: 0 4px 6px rgba(0,0,0,0.3), 0 2px 4px rgba(0,0,0,0.2);
    --card-shadow-3: 0 10px 15px rgba(0,0,0,0.3), 0 4px 6px rgba(0,0,0,0.2);
  }
}
.dark {
  --card-bg: #1C1C1E;
  --card-bg-filled: #36343B;
  --card-on-surface: #E6E0E9;
  --card-on-surface-variant: #CAC4D0;
  --card-outline: #49454F;
  --card-primary: #D0BCFF;
  --card-shadow-1: 0 1px 3px rgba(0,0,0,0.3), 0 1px 2px rgba(0,0,0,0.2);
  --card-shadow-2: 0 4px 6px rgba(0,0,0,0.3), 0 2px 4px rgba(0,0,0,0.2);
  --card-shadow-3: 0 10px 15px rgba(0,0,0,0.3), 0 4px 6px rgba(0,0,0,0.2);
}
```

## Variants

| Variant | Background (L) | Background (D) | Shadow | Border |
|---------|----------------|----------------|--------|--------|
| Elevated | #FFFFFF | #1C1C1E | level 1 | none |
| Filled | #E6E0E9 | #36343B | none | none |
| Outlined | #FFFFFF | #1C1C1E | none | 1px #CAC4D0 / #49454F |

## HTML Structure

```html
<!-- Elevated card -->
<article class="card card--elevated">
  <div class="card__media">
    <img src="image.jpg" alt="Description" class="card__image" />
  </div>
  <div class="card__header">
    <h3 class="card__title">Title</h3>
    <p class="card__subtitle">Subtitle or metadata</p>
  </div>
  <div class="card__content">
    <p class="card__body">Supporting text for the card content area.</p>
  </div>
  <div class="card__actions">
    <button class="button button--ghost" type="button">Action 1</button>
    <button class="button button--ghost" type="button">Action 2</button>
  </div>
</article>

<!-- Filled card -->
<article class="card card--filled">
  <div class="card__header">
    <h3 class="card__title">Title</h3>
  </div>
  <div class="card__content">
    <p class="card__body">Content on filled background.</p>
  </div>
</article>

<!-- Outlined card -->
<article class="card card--outlined">
  <div class="card__header">
    <h3 class="card__title">Title</h3>
  </div>
  <div class="card__content">
    <p class="card__body">Content with border boundary.</p>
  </div>
</article>

<!-- Interactive (clickable) card -->
<a href="/detail" class="card card--elevated card--interactive" role="article" aria-label="Card title">
  <div class="card__media">
    <img src="image.jpg" alt="" class="card__image" />
  </div>
  <div class="card__header">
    <h3 class="card__title">Clickable Card</h3>
    <p class="card__subtitle">Entire surface is interactive.</p>
  </div>
</a>

<!-- Media card (image-heavy) -->
<article class="card card--elevated card--media">
  <div class="card__media card__media--aspect">
    <img src="hero.jpg" alt="Description" class="card__image" />
  </div>
  <div class="card__header">
    <h3 class="card__title">Media Card</h3>
  </div>
</article>
```

## Complete CSS

```css
.card {
  position: relative;
  display: flex;
  flex-direction: column;
  border-radius: var(--card-radius);
  overflow: hidden;
  transition: var(--card-transition);
  font-family: var(--card-font);
  color: var(--card-on-surface);
}

/* -- Elevated -- */
.card--elevated {
  background: var(--card-bg);
  box-shadow: var(--card-shadow-1);
}

/* -- Filled -- */
.card--filled {
  background: var(--card-bg-filled);
  box-shadow: none;
}

/* -- Outlined -- */
.card--outlined {
  background: var(--card-bg);
  border: 1px solid var(--card-outline);
  box-shadow: none;
}

/* -- Content areas -- */
.card__media { position: relative; overflow: hidden; }
.card__media--aspect { aspect-ratio: 16 / 9; }
.card__image { display: block; width: 100%; height: 100%; object-fit: cover; }
.card__header { padding: var(--card-padding) var(--card-padding) 0; }
.card__content { padding: 8px var(--card-padding); }
.card__actions {
  display: flex; gap: 8px;
  padding: 8px var(--card-padding) var(--card-padding);
  justify-content: flex-end;
}
.card__media + .card__header { padding-top: var(--card-padding); }

/* -- Typography -- */
.card__title {
  font-size: 16px; font-weight: 600; line-height: 22px;
  margin: 0; color: var(--card-on-surface);
}
.card__subtitle {
  font-size: 14px; font-weight: 400; line-height: 20px;
  margin: 4px 0 0; color: var(--card-on-surface-variant);
}
.card__body {
  font-size: 14px; font-weight: 400; line-height: 20px;
  margin: 0; color: var(--card-on-surface-variant);
}

/* -- Interactive -- */
.card--interactive {
  cursor: pointer;
  text-decoration: none;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

/* -- Hover -- */
@media (hover: hover) {
  .card--interactive.card--elevated:hover {
    box-shadow: var(--card-shadow-2);
    transform: translateY(-1px);
  }
  .card--interactive.card--filled:hover {
    box-shadow: var(--card-shadow-1);
    transform: translateY(-1px);
  }
  .card--interactive.card--outlined:hover {
    box-shadow: var(--card-shadow-1);
    transform: translateY(-1px);
  }
}

/* -- Focus -- */
.card--interactive:focus-visible {
  outline: 2px solid var(--card-primary);
  outline-offset: 2px;
}

/* -- Active / Pressed -- */
.card--interactive:active {
  transform: scale(0.99);
  box-shadow: var(--card-shadow-1);
}

/* -- Disabled -- */
.card--disabled {
  opacity: 0.4;
  pointer-events: none;
}

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .card--elevated { box-shadow: var(--card-shadow-1); }
}
.dark .card--elevated { box-shadow: var(--card-shadow-1); }
```

## States Reference

| State | Elevated Shadow | Transform | Outline | Cursor |
|-------|----------------|-----------|---------|--------|
| Default | level 1 | none | 1px #CAC4D0 | default |
| Hover | level 2 | translateY(-1px) | + level 1 shadow | pointer |
| Focus | level 1 | none | 2px primary ring | pointer |
| Active | level 1 | scale(0.99) | level 1 shadow | pointer |
| Disabled | level 1 | none | 1px, 40% opacity | not-allowed |

## Animation & Motion

```css
.card { transition: transform 200ms ease-out, box-shadow 200ms ease-out; }
@media (prefers-reduced-motion: reduce) {
  .card { transition: none; }
  .card--interactive:hover { transform: none; }
  .card--interactive:active { transform: none; }
}
```

## Accessibility

- **ARIA**: `role="article"` on interactive cards, `aria-label` for linked cards
- **Keyboard**: Tab to focus, Enter/Space to activate interactive cards
- **Focus ring**: 2px solid primary, 2px offset
- **Touch target**: entire card surface tappable, action buttons individually focusable
- **Screen reader**: card title announced, structure conveyed via heading hierarchy

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Single column, full-width cards, 8px vertical gap |
| 600-1024px | 2-column grid, 12px gap |
| > 1024px | 3-4 column grid, 16px gap, max-width per card |

## Do / Don't

| Do | Don't |
|----|-------|
| Use shadow OR border, not both | Combine box-shadow and border on the same card |
| Keep consistent variant within a card group | Mix Elevated/Filled/Outlined in one grid |
| Full-bleed images at top, text below | Place images inline with text content |
| Use Elevated as the default card style | Default to Outlined (less modern feel) |
| Consistent 12px radius across all cards | Mix corner radius values in a card group |
