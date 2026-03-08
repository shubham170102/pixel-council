---
name: page-control
description: Apple page control — dot pagination indicators, current page highlight, custom appearance
metadata:
  tags: page control, pagination, dots, indicator, carousel, paging, swipe, onboarding
---

# Page Control -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Dot diameter | 7px (inactive), 9px (active) |
| Dot spacing | 16px center-to-center |
| Touch target | 44px tall strip |
| Active color (light) | #000000 at 100% |
| Inactive color (light) | #000000 at 20% |
| Active color (dark) | #FFFFFF at 100% |
| Inactive color (dark) | #FFFFFF at 20% |
| Max visible dots | 10 (collapses beyond) |
| CSS prefix | `.apple-pagecontrol` |

## Design Tokens

```css
:root {
  --apple-pagecontrol-active: rgba(0, 0, 0, 1);
  --apple-pagecontrol-inactive: rgba(0, 0, 0, 0.2);
  --apple-pagecontrol-tint-active: #007AFF;
  --apple-pagecontrol-tint-inactive: rgba(0, 122, 255, 0.3);
  --apple-pagecontrol-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-pagecontrol-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-pagecontrol-active: rgba(255, 255, 255, 1);
    --apple-pagecontrol-inactive: rgba(255, 255, 255, 0.2);
    --apple-pagecontrol-tint-active: #0A84FF;
    --apple-pagecontrol-tint-inactive: rgba(10, 132, 255, 0.3);
    --apple-pagecontrol-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-pagecontrol-active: rgba(255, 255, 255, 1);
  --apple-pagecontrol-inactive: rgba(255, 255, 255, 0.2);
  --apple-pagecontrol-tint-active: #0A84FF;
  --apple-pagecontrol-tint-inactive: rgba(10, 132, 255, 0.3);
  --apple-pagecontrol-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Active Dot | Inactive Dot | Use Case |
|-------|-----------|-------------|----------|
| Default (B&W) | Black/White 9px | Black/White 20% 7px | Standard pagination |
| Tinted | System blue 9px | Blue 30% 7px | Branded pages |
| Custom images | Custom per-dot image | Dimmed image | Onboarding, tutorials |
| Progress | Elongated pill for current | Dot 7px | Page progress indicator |

## HTML Structure

```html
<!-- Standard Page Control -->
<nav class="apple-pagecontrol" role="tablist" aria-label="Page navigation">
  <button class="apple-pagecontrol__dot apple-pagecontrol__dot--active"
          role="tab" aria-selected="true" aria-label="Page 1 of 5" tabindex="0">
  </button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Page 2 of 5" tabindex="-1">
  </button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Page 3 of 5" tabindex="-1">
  </button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Page 4 of 5" tabindex="-1">
  </button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Page 5 of 5" tabindex="-1">
  </button>
</nav>

<!-- Tinted Page Control -->
<nav class="apple-pagecontrol apple-pagecontrol--tinted" role="tablist" aria-label="Carousel navigation">
  <button class="apple-pagecontrol__dot apple-pagecontrol__dot--active"
          role="tab" aria-selected="true" aria-label="Slide 1 of 3" tabindex="0"></button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Slide 2 of 3" tabindex="-1"></button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Slide 3 of 3" tabindex="-1"></button>
</nav>

<!-- Progress-style Page Control -->
<nav class="apple-pagecontrol apple-pagecontrol--progress" role="tablist" aria-label="Onboarding steps">
  <button class="apple-pagecontrol__dot apple-pagecontrol__dot--active"
          role="tab" aria-selected="true" aria-label="Step 1 of 4" tabindex="0"></button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Step 2 of 4" tabindex="-1"></button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Step 3 of 4" tabindex="-1"></button>
  <button class="apple-pagecontrol__dot"
          role="tab" aria-selected="false" aria-label="Step 4 of 4" tabindex="-1"></button>
</nav>
```

## Complete CSS

```css
.apple-pagecontrol {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 9px;
  min-height: 44px;
  padding: 8px 16px;
  font-family: var(--apple-pagecontrol-font);
  -webkit-tap-highlight-color: transparent;
}

/* Dots */
.apple-pagecontrol__dot {
  width: 7px;
  height: 7px;
  border-radius: 9999px;
  background: var(--apple-pagecontrol-inactive);
  border: none;
  padding: 0;
  cursor: pointer;
  transition: width 200ms ease-in-out, height 200ms ease-in-out, background-color 200ms ease-in-out;
  flex-shrink: 0;
}

.apple-pagecontrol__dot--active {
  width: 9px;
  height: 9px;
  background: var(--apple-pagecontrol-active);
}

/* Tinted variant */
.apple-pagecontrol--tinted .apple-pagecontrol__dot {
  background: var(--apple-pagecontrol-tint-inactive);
}
.apple-pagecontrol--tinted .apple-pagecontrol__dot--active {
  background: var(--apple-pagecontrol-tint-active);
}

/* Progress variant (pill for active) */
.apple-pagecontrol--progress .apple-pagecontrol__dot--active {
  width: 24px;
  border-radius: 9999px;
}

/* Focus */
.apple-pagecontrol__dot:focus-visible {
  outline: 4px solid var(--apple-pagecontrol-focus-ring);
  outline-offset: 2px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-pagecontrol__dot:hover:not(.apple-pagecontrol__dot--active) {
    background: rgba(0, 0, 0, 0.4);
    transform: scale(1.2);
  }
}

/* Many dots: collapse outer dots */
.apple-pagecontrol--collapsed .apple-pagecontrol__dot:first-child,
.apple-pagecontrol--collapsed .apple-pagecontrol__dot:last-child {
  width: 5px;
  height: 5px;
  opacity: 0.5;
}

/* Dark hover */
@media (prefers-color-scheme: dark) {
  .apple-pagecontrol__dot:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-pagecontrol__dot:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}

@media (hover: hover) and (prefers-color-scheme: dark) {
  .apple-pagecontrol__dot:hover:not(.apple-pagecontrol__dot--active) {
    background: rgba(255, 255, 255, 0.4);
  }
}
@media (hover: hover) {
  .dark .apple-pagecontrol__dot:hover:not(.apple-pagecontrol__dot--active) {
    background: rgba(255, 255, 255, 0.4);
  }
}
```

## States Reference

| State | Active Dot | Inactive Dot | Cursor |
|-------|-----------|-------------|--------|
| Default | 9px, full opacity | 7px, 20% opacity | pointer |
| Hover | — | 40% opacity, scale(1.2) | pointer |
| Focus | +4px blue ring | +4px blue ring | pointer |
| Tinted | blue 9px | blue 30% 7px | pointer |
| Collapsed | — | outer dots 5px, 50% opacity | pointer |

## Animation & Motion

```css
.apple-pagecontrol__dot {
  transition: width 200ms ease-in-out, height 200ms ease-in-out,
              background-color 200ms ease-in-out, transform 200ms ease-in-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-pagecontrol__dot {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="tablist"` on container, `role="tab"` on each dot, `aria-selected` on active dot, `aria-label` with "Page X of Y"
- **Keyboard**: Left/Right arrow keys to navigate between dots, Tab to focus the control, only active dot has `tabindex="0"`
- **Focus ring**: 4px solid blue at 60% opacity, 2px offset
- **Touch target**: 44px minimum height strip (dots expand into touch area)
- **Screen reader**: Announces current page and total count
- **Swipe**: On touch devices, the associated scroll view handles swipe; dots update in response

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Standard dot size, centered below content |
| 600-1024px | Same, can be larger spacing |
| > 1024px | Consider replacing with numbered pagination on desktop |

## Do / Don't

| Do | Don't |
|----|-------|
| Use for 2-10 pages of paged content | Use for 20+ pages (use numbered pagination) |
| Position centered below the paged content | Float page control away from its content |
| Update active dot on swipe/scroll | Require tap on dot as the only navigation method |
| Collapse outer dots when count > 7 | Show 15 equally-sized dots |
| Use tinted variant when dots overlay content | Use black dots on dark background images |
