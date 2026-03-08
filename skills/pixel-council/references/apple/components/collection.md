---
name: collection
description: Apple collection view — grid layout, compositional layout, section headers, inset groups
metadata:
  tags: collection, grid, gallery, layout, cards, images, compositional, section, thumbnail
---

# Collection (Grid) -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Grid gap | 8px (compact), 12px (regular), 16px (relaxed) |
| Item corner radius | 10px continuous |
| Section header font | SF Pro, 22px/28px, weight 700 |
| Section header padding | 16px horizontal, 12px vertical |
| Item label font | SF Pro, 13px/18px, weight 400 |
| Min item width | 100px |
| Touch target | 44x44px minimum per item |
| CSS prefix | `.apple-collection` |

## Design Tokens

```css
:root {
  --apple-collection-bg: #FFFFFF;
  --apple-collection-surface: #F2F2F7;
  --apple-collection-text: #000000;
  --apple-collection-secondary: rgba(60, 60, 67, 0.6);
  --apple-collection-tint: #007AFF;
  --apple-collection-separator: rgba(60, 60, 67, 0.29);
  --apple-collection-item-bg: #FFFFFF;
  --apple-collection-item-shadow: 0 1px 3px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.06);
  --apple-collection-selected: rgba(0, 122, 255, 0.12);
  --apple-collection-fill: rgba(120, 120, 128, 0.12);
  --apple-collection-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-collection-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-collection-bg: #000000;
    --apple-collection-surface: #1C1C1E;
    --apple-collection-text: #FFFFFF;
    --apple-collection-secondary: rgba(235, 235, 245, 0.6);
    --apple-collection-tint: #0A84FF;
    --apple-collection-separator: rgba(84, 84, 88, 0.6);
    --apple-collection-item-bg: #1C1C1E;
    --apple-collection-item-shadow: 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.16);
    --apple-collection-selected: rgba(10, 132, 255, 0.2);
    --apple-collection-fill: rgba(120, 120, 128, 0.24);
    --apple-collection-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-collection-bg: #000000;
  --apple-collection-surface: #1C1C1E;
  --apple-collection-text: #FFFFFF;
  --apple-collection-secondary: rgba(235, 235, 245, 0.6);
  --apple-collection-tint: #0A84FF;
  --apple-collection-separator: rgba(84, 84, 88, 0.6);
  --apple-collection-item-bg: #1C1C1E;
  --apple-collection-item-shadow: 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px 2px rgba(0, 0, 0, 0.16);
  --apple-collection-selected: rgba(10, 132, 255, 0.2);
  --apple-collection-fill: rgba(120, 120, 128, 0.24);
  --apple-collection-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Description | Layout | Item Shape |
|-------|-------------|--------|------------|
| Grid (Equal) | Equal-sized items in a grid | CSS Grid | Square/Rectangle |
| Grid (Adaptive) | Variable column count based on width | Auto-fill minmax | Square/Rectangle |
| Horizontal Scroll | Single-row scrolling collection | Flexbox overflow | Cards |
| Compositional | Mixed sizes (featured + grid) | CSS Grid areas | Mixed |
| List + Grid Hybrid | Section with list header, grid body | Mixed | Mixed |

## HTML Structure

```html
<!-- Standard Grid Collection -->
<section class="apple-collection" aria-label="Photo library">
  <div class="apple-collection__header">
    <h2 class="apple-collection__title">Recents</h2>
    <button class="apple-collection__action">See All</button>
  </div>
  <div class="apple-collection__grid">
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="photo1.jpg" alt="Mountain sunset" loading="lazy" />
      </div>
      <span class="apple-collection__label">Mountain Sunset</span>
    </article>
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="photo2.jpg" alt="Ocean view" loading="lazy" />
      </div>
      <span class="apple-collection__label">Ocean View</span>
    </article>
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="photo3.jpg" alt="City skyline" loading="lazy" />
      </div>
      <span class="apple-collection__label">City Skyline</span>
    </article>
    <!-- More items... -->
  </div>
</section>

<!-- Horizontal Scroll Collection -->
<section class="apple-collection" aria-label="Suggested apps">
  <div class="apple-collection__header">
    <h2 class="apple-collection__title">Suggested For You</h2>
    <button class="apple-collection__action">See All</button>
  </div>
  <div class="apple-collection__scroll" role="list">
    <article class="apple-collection__card" role="listitem" tabindex="0">
      <div class="apple-collection__card-image">
        <img src="app1.jpg" alt="App name" loading="lazy" />
      </div>
      <div class="apple-collection__card-body">
        <span class="apple-collection__card-title">App Name</span>
        <span class="apple-collection__card-subtitle">Productivity</span>
      </div>
    </article>
    <!-- More cards... -->
  </div>
</section>

<!-- Compositional Layout (featured + grid) -->
<section class="apple-collection" aria-label="Featured content">
  <div class="apple-collection__compositional">
    <article class="apple-collection__item apple-collection__item--featured" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="featured.jpg" alt="Featured photo" loading="lazy" />
      </div>
      <span class="apple-collection__label">Featured</span>
    </article>
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="small1.jpg" alt="" loading="lazy" />
      </div>
    </article>
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="small2.jpg" alt="" loading="lazy" />
      </div>
    </article>
    <article class="apple-collection__item" tabindex="0">
      <div class="apple-collection__thumbnail">
        <img src="small3.jpg" alt="" loading="lazy" />
      </div>
    </article>
  </div>
</section>

<!-- Selected State (multi-select editing) -->
<article class="apple-collection__item apple-collection__item--selected" tabindex="0" aria-selected="true">
  <div class="apple-collection__thumbnail">
    <img src="photo.jpg" alt="Selected photo" loading="lazy" />
    <div class="apple-collection__check" aria-hidden="true">
      <svg width="20" height="20" viewBox="0 0 20 20">
        <circle cx="10" cy="10" r="10" fill="#007AFF"/>
        <path d="M6 10L9 13L14 7" fill="none" stroke="white" stroke-width="2" stroke-linecap="round"/>
      </svg>
    </div>
  </div>
</article>
```

## Complete CSS

```css
.apple-collection {
  font-family: var(--apple-collection-font);
  -webkit-font-smoothing: antialiased;
}

/* Section header */
.apple-collection__header {
  display: flex;
  align-items: baseline;
  justify-content: space-between;
  padding: 12px 16px 8px;
}

.apple-collection__title {
  font-size: 22px;
  font-weight: 700;
  line-height: 28px;
  letter-spacing: 0.35px;
  color: var(--apple-collection-text);
  margin: 0;
}

.apple-collection__action {
  background: none;
  border: none;
  font-family: var(--apple-collection-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-collection-tint);
  cursor: pointer;
  padding: 4px;
  -webkit-tap-highlight-color: transparent;
}
.apple-collection__action:active { opacity: 0.5; }

/* ---- Grid Layout ---- */
.apple-collection__grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  gap: 2px;
  padding: 0 16px;
}

/* ---- Items ---- */
.apple-collection__item {
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  transition: transform 150ms ease-out, opacity 150ms ease-out;
  position: relative;
}

.apple-collection__thumbnail {
  position: relative;
  overflow: hidden;
  border-radius: 0;
  aspect-ratio: 1 / 1;
  background: var(--apple-collection-fill);
}
.apple-collection__thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.apple-collection__label {
  display: block;
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-collection-text);
  padding: 4px 0;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Selected state */
.apple-collection__item--selected {
  opacity: 0.85;
}
.apple-collection__item--selected .apple-collection__thumbnail {
  outline: 3px solid var(--apple-collection-tint);
  outline-offset: -3px;
  border-radius: 4px;
}

.apple-collection__check {
  position: absolute;
  bottom: 4px;
  right: 4px;
}

/* ---- Horizontal Scroll ---- */
.apple-collection__scroll {
  display: flex;
  gap: 12px;
  overflow-x: auto;
  padding: 0 16px 16px;
  scroll-snap-type: x mandatory;
  scrollbar-width: none;
  -ms-overflow-style: none;
}
.apple-collection__scroll::-webkit-scrollbar { display: none; }

.apple-collection__card {
  flex-shrink: 0;
  width: 300px;
  background: var(--apple-collection-item-bg);
  border-radius: 10px;
  overflow: hidden;
  box-shadow: var(--apple-collection-item-shadow);
  cursor: pointer;
  scroll-snap-align: start;
  transition: transform 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}

.apple-collection__card-image {
  aspect-ratio: 16 / 9;
  overflow: hidden;
  background: var(--apple-collection-fill);
}
.apple-collection__card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.apple-collection__card-body {
  padding: 10px 12px;
}
.apple-collection__card-title {
  font-size: 15px;
  font-weight: 500;
  line-height: 20px;
  letter-spacing: -0.24px;
  color: var(--apple-collection-text);
  display: block;
}
.apple-collection__card-subtitle {
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-collection-secondary);
  display: block;
}

/* ---- Compositional Layout ---- */
.apple-collection__compositional {
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-template-rows: 1fr 1fr;
  gap: 2px;
  padding: 0 16px;
}
.apple-collection__item--featured {
  grid-row: 1 / -1;
}

/* Focus */
.apple-collection__item:focus-visible,
.apple-collection__card:focus-visible {
  outline: 4px solid var(--apple-collection-focus-ring);
  outline-offset: 2px;
  border-radius: 4px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-collection__item:hover { transform: scale(1.02); }
  .apple-collection__card:hover { transform: scale(1.01); }
  .apple-collection__action:hover { text-decoration: underline; }
}

/* Active */
.apple-collection__item:active { opacity: 0.8; }
.apple-collection__card:active { transform: scale(0.98); }

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-collection__item:focus-visible,
  .apple-collection__card:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-collection__item:focus-visible,
.dark .apple-collection__card:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Item | Card | Action Link | Cursor |
|-------|------|------|-------------|--------|
| Default | no outline | shadow, no transform | tint color | pointer |
| Hover | scale(1.02) | scale(1.01) | underline | pointer |
| Focus | 4px blue ring | 4px blue ring | — | pointer |
| Active | opacity 0.8 | scale(0.98) | opacity 0.5 | pointer |
| Selected | tint outline, check badge | — | — | pointer |

## Animation & Motion

```css
.apple-collection__item,
.apple-collection__card {
  transition: transform 150ms ease-out, opacity 150ms ease-out;
}

/* Horizontal scroll */
.apple-collection__scroll {
  scroll-behavior: smooth;
  scroll-snap-type: x mandatory;
}

@media (prefers-reduced-motion: reduce) {
  .apple-collection__item,
  .apple-collection__card {
    transition: none;
  }
  .apple-collection__scroll { scroll-behavior: auto; }
}
```

## Accessibility

- **ARIA**: Container has `aria-label`, `role="list"` on scroll containers, `role="listitem"` on items, `aria-selected` in multi-select mode
- **Keyboard**: Tab to focus items, Enter/Space to select, arrow keys to navigate grid
- **Focus ring**: 4px solid blue at 60% opacity, 2px offset
- **Touch target**: Each item is at least 44x44px
- **Screen reader**: Announces item label or image alt text, selection state
- **Images**: Use `loading="lazy"` for performance, provide meaningful `alt` text

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | 3-4 columns in grid, 2px gap (Photos-style), cards 280px in scroll |
| 600-1024px | 4-6 columns, 4px gap, cards 300px |
| > 1024px | 6-8+ columns, compositional layouts, cards can be wider |

## Do / Don't

| Do | Don't |
|----|-------|
| Use 1:1 aspect ratio for photo grids | Mix aspect ratios in the same grid section |
| Add section headers with "See All" actions | Present a wall of items without organization |
| Use horizontal scroll for curated content | Force horizontal scroll for all content |
| Lazy load images for performance | Load all images at once |
| Use compositional layout for editorial content | Use the same grid size for everything |
