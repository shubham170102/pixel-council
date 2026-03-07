---
name: card
description: Apple content card with continuous corner radius, subtle shadow, and grouped layout
metadata:
  tags: card, container, surface, content, panel, grouped
---

# Card -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Corner radius | 10-13px (continuous/squircle) |
| Padding | 16px |
| Height | Content-determined |
| Title font | SF Pro Headline, 17px/22px, weight 600 |
| Body font | SF Pro Body, 17px/22px, weight 400 |
| Background (light) | #FFFFFF |
| Background (dark) | #1C1C1E |

## Design Tokens

```css
:root {
  --apple-card-bg: #FFFFFF;
  --apple-card-bg-secondary: #F2F2F7;
  --apple-card-label: #000000;
  --apple-card-secondary-label: rgba(60,60,67,0.6);
  --apple-card-separator: rgba(60,60,67,0.29);
  --apple-card-blue: #007AFF;
  --apple-card-radius: 13px;
  --apple-card-padding: 16px;
  --apple-card-shadow-1: 0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06);
  --apple-card-shadow-2: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
  --apple-card-transition: transform 250ms ease-out, box-shadow 250ms ease-out;
  --apple-card-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-card-bg: #1C1C1E;
    --apple-card-bg-secondary: #2C2C2E;
    --apple-card-label: #FFFFFF;
    --apple-card-secondary-label: rgba(235,235,245,0.6);
    --apple-card-separator: rgba(84,84,88,0.6);
    --apple-card-blue: #0A84FF;
    --apple-card-shadow-1: 0 1px 3px rgba(0,0,0,0.3), 0 1px 2px rgba(0,0,0,0.2);
    --apple-card-shadow-2: 0 4px 6px rgba(0,0,0,0.3), 0 2px 4px rgba(0,0,0,0.2);
  }
}
.dark {
  --apple-card-bg: #1C1C1E;
  --apple-card-bg-secondary: #2C2C2E;
  --apple-card-label: #FFFFFF;
  --apple-card-secondary-label: rgba(235,235,245,0.6);
  --apple-card-separator: rgba(84,84,88,0.6);
  --apple-card-blue: #0A84FF;
  --apple-card-shadow-1: 0 1px 3px rgba(0,0,0,0.3), 0 1px 2px rgba(0,0,0,0.2);
  --apple-card-shadow-2: 0 4px 6px rgba(0,0,0,0.3), 0 2px 4px rgba(0,0,0,0.2);
}
```

## Variants

| Style | Background (L) | Background (D) | Shadow | Use Case |
|-------|----------------|----------------|--------|----------|
| Standard | #FFFFFF | #1C1C1E | level 1 subtle | Default cards, collection views |
| Grouped | #F2F2F7 | #2C2C2E | none | Grouped list sections, inset style |

## HTML Structure

```html
<!-- Standard card -->
<article class="apple-card" tabindex="0">
  <div class="apple-card__media">
    <img src="image.jpg" alt="Description" class="apple-card__image" />
  </div>
  <div class="apple-card__header">
    <h3 class="apple-card__title">Title</h3>
    <p class="apple-card__subtitle">Subtitle</p>
  </div>
  <div class="apple-card__content">
    <p class="apple-card__body">Supporting text goes here.</p>
  </div>
  <div class="apple-card__actions">
    <button class="apple-button apple-button--borderless" type="button">Action</button>
  </div>
</article>

<!-- Grouped card -->
<article class="apple-card apple-card--grouped">
  <div class="apple-card__header">
    <h3 class="apple-card__title">Group Title</h3>
  </div>
  <div class="apple-card__content">
    <p class="apple-card__body">Content in grouped style.</p>
  </div>
</article>

<!-- Interactive card -->
<a href="/detail" class="apple-card apple-card--interactive" role="article" aria-label="Card title">
  <div class="apple-card__media">
    <img src="image.jpg" alt="" class="apple-card__image" />
  </div>
  <div class="apple-card__header">
    <h3 class="apple-card__title">Tappable Card</h3>
  </div>
</a>

<!-- Card with separator between sections -->
<article class="apple-card">
  <div class="apple-card__header">
    <h3 class="apple-card__title">Title</h3>
  </div>
  <hr class="apple-card__separator" aria-hidden="true" />
  <div class="apple-card__content">
    <p class="apple-card__body">Content below separator.</p>
  </div>
</article>
```

## Complete CSS

```css
.apple-card {
  position: relative;
  display: flex;
  flex-direction: column;
  background: var(--apple-card-bg);
  border-radius: var(--apple-card-radius);
  box-shadow: var(--apple-card-shadow-1);
  overflow: hidden;
  transition: var(--apple-card-transition);
  font-family: var(--apple-card-font);
  color: var(--apple-card-label);
}

/* -- Grouped variant -- */
.apple-card--grouped {
  background: var(--apple-card-bg-secondary);
  box-shadow: none;
  border-radius: 10px;
}

/* -- Content areas -- */
.apple-card__media { position: relative; overflow: hidden; }
.apple-card__image { display: block; width: 100%; height: auto; object-fit: cover; }
.apple-card__header { padding: var(--apple-card-padding) var(--apple-card-padding) 0; }
.apple-card__content { padding: 8px var(--apple-card-padding); }
.apple-card__actions {
  display: flex; gap: 8px;
  padding: 8px var(--apple-card-padding) var(--apple-card-padding);
}
.apple-card__media + .apple-card__header { padding-top: var(--apple-card-padding); }

/* -- Typography -- */
.apple-card__title {
  font-size: 17px; font-weight: 600; line-height: 22px;
  letter-spacing: -0.41px; margin: 0;
  color: var(--apple-card-label);
}
.apple-card__subtitle {
  font-size: 15px; font-weight: 400; line-height: 20px;
  letter-spacing: -0.24px; margin: 4px 0 0;
  color: var(--apple-card-secondary-label);
}
.apple-card__body {
  font-size: 17px; font-weight: 400; line-height: 22px;
  letter-spacing: -0.41px; margin: 0;
  color: var(--apple-card-secondary-label);
}

/* -- Separator -- */
.apple-card__separator {
  border: none;
  border-top: 0.5px solid var(--apple-card-separator);
  margin: 8px var(--apple-card-padding);
}

/* -- Interactive card -- */
.apple-card--interactive {
  cursor: pointer;
  text-decoration: none;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

/* -- Hover (desktop: lift effect) -- */
@media (hover: hover) {
  .apple-card--interactive:hover {
    transform: translateY(-2px);
    box-shadow: var(--apple-card-shadow-2);
  }
}

/* -- Focus -- */
.apple-card--interactive:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}

/* -- Pressed -- */
.apple-card--interactive:active {
  transform: scale(0.98);
  opacity: 0.85;
}

/* -- Selected -- */
.apple-card--selected {
  border: 2px solid var(--apple-card-blue);
}

/* -- Dark mode -- */
@media (prefers-color-scheme: dark) {
  .apple-card--interactive:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-card--interactive:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Shadow | Transform | Opacity | Border | Cursor |
|-------|--------|-----------|---------|--------|--------|
| Default | level 1 | none | 1 | none | default |
| Hover | level 2 | translateY(-2px) | 1 | none | pointer |
| Focus | level 1 | none | 1 | 4px blue ring | pointer |
| Pressed | level 1 | scale(0.98) | 0.85 | none | pointer |
| Selected | level 1 | none | 1 | 2px blue | default |
| Grouped | none | none | 1 | none | default |

## Animation & Motion

```css
.apple-card {
  transition: transform 250ms ease-out, box-shadow 250ms ease-out, opacity 150ms ease-out;
}
@media (prefers-reduced-motion: reduce) {
  .apple-card { transition: none; }
  .apple-card--interactive:hover { transform: none; }
  .apple-card--interactive:active { transform: none; }
}
```

## Accessibility

- **ARIA**: `role="article"` on interactive cards, `aria-label` for linked cards
- **Keyboard**: Tab to focus, Enter/Space to activate interactive cards
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: entire card surface tappable, min 44x44px per action
- **Screen reader**: card title announced, internal actions individually focusable

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Single column, full-width, stacked vertically, 8px gap |
| 600-1024px | 2-column grid, 12px gap |
| > 1024px | 3-4 column grid, 16px gap, max-width constraint |

## Do / Don't

| Do | Don't |
|----|-------|
| Use continuous corners (squircle) for Apple feel | Use standard CSS border-radius without adjustment |
| Use subtle shadows, prefer background differentiation | Use heavy drop shadows (not Apple aesthetic) |
| Keep consistent padding within all cards | Mix padding values across cards in a group |
| Full-bleed images at top, text below | Place images inline with text in cards |
| Use grouped style on colored backgrounds | Combine shadow and border on the same card |
