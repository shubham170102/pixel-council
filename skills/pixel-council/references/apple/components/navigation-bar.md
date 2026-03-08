---
name: navigation-bar
description: Apple navigation bar — large title, inline title, back button, bar button items, Liquid Glass
metadata:
  tags: navigation, nav bar, header, back button, large title, inline title, toolbar, liquid glass
---

# Navigation Bar -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Standard height | 44px (compact), 96px (large title) |
| Large title font | SF Pro, 34px/41px, weight 700 |
| Inline title font | SF Pro, 17px/22px, weight 600 |
| Back button font | SF Pro, 17px/22px, weight 400 |
| Tint color (light) | #007AFF |
| Tint color (dark) | #0A84FF |
| Background (light) | rgba(249,249,249,0.94) |
| Background (dark) | rgba(29,29,29,0.94) |
| Separator | rgba(60,60,67,0.29) / rgba(84,84,88,0.6) |
| CSS prefix | `.apple-navbar` |

## Design Tokens

```css
:root {
  --apple-navbar-bg: rgba(249, 249, 249, 0.94);
  --apple-navbar-tint: #007AFF;
  --apple-navbar-title: #000000;
  --apple-navbar-secondary: rgba(60, 60, 67, 0.6);
  --apple-navbar-separator: rgba(60, 60, 67, 0.29);
  --apple-navbar-fill: rgba(120, 120, 128, 0.16);
  --apple-navbar-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-navbar-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
  --apple-navbar-transition: opacity 150ms ease-out, transform 150ms ease-out;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-navbar-bg: rgba(29, 29, 29, 0.94);
    --apple-navbar-tint: #0A84FF;
    --apple-navbar-title: #FFFFFF;
    --apple-navbar-secondary: rgba(235, 235, 245, 0.6);
    --apple-navbar-separator: rgba(84, 84, 88, 0.6);
    --apple-navbar-fill: rgba(120, 120, 128, 0.36);
    --apple-navbar-focus-ring: rgba(10, 132, 255, 0.6);
  }
}
.dark {
  --apple-navbar-bg: rgba(29, 29, 29, 0.94);
  --apple-navbar-tint: #0A84FF;
  --apple-navbar-title: #FFFFFF;
  --apple-navbar-secondary: rgba(235, 235, 245, 0.6);
  --apple-navbar-separator: rgba(84, 84, 88, 0.6);
  --apple-navbar-fill: rgba(120, 120, 128, 0.36);
  --apple-navbar-focus-ring: rgba(10, 132, 255, 0.6);
}
```

## Variants

| Style | Title Size | Height | Title Position | Use Case |
|-------|-----------|--------|---------------|----------|
| Large Title | 34px/700 | 96px total | Below bar, left-aligned | Primary screens, top-level views |
| Inline Title | 17px/600 | 44px | Centered in bar | Detail screens, pushed views |
| Large Title (scrolled) | 17px/600 | 44px | Collapses to centered inline | After user scrolls down |

## HTML Structure

```html
<!-- Large Title Navigation Bar -->
<header class="apple-navbar apple-navbar--large" role="banner">
  <nav class="apple-navbar__bar" aria-label="Navigation">
    <div class="apple-navbar__leading">
      <button class="apple-navbar__back" aria-label="Back">
        <svg class="apple-navbar__chevron" width="12" height="20" viewBox="0 0 12 20" aria-hidden="true">
          <path d="M10 2L2 10l8 8" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="apple-navbar__back-label">Back</span>
      </button>
    </div>
    <h1 class="apple-navbar__inline-title" aria-hidden="true">Settings</h1>
    <div class="apple-navbar__trailing">
      <button class="apple-navbar__action" aria-label="Edit">Edit</button>
    </div>
  </nav>
  <div class="apple-navbar__large-title">
    <h1>Settings</h1>
  </div>
</header>

<!-- Inline Title Navigation Bar -->
<header class="apple-navbar apple-navbar--inline" role="banner">
  <nav class="apple-navbar__bar" aria-label="Navigation">
    <div class="apple-navbar__leading">
      <button class="apple-navbar__back" aria-label="Back to Settings">
        <svg class="apple-navbar__chevron" width="12" height="20" viewBox="0 0 12 20" aria-hidden="true">
          <path d="M10 2L2 10l8 8" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="apple-navbar__back-label">Settings</span>
      </button>
    </div>
    <h1 class="apple-navbar__inline-title">General</h1>
    <div class="apple-navbar__trailing">
      <button class="apple-navbar__action" aria-label="Done">Done</button>
    </div>
  </nav>
</header>

<!-- Liquid Glass Navigation Bar -->
<header class="apple-navbar apple-navbar--inline apple-navbar--glass" role="banner">
  <nav class="apple-navbar__bar" aria-label="Navigation">
    <div class="apple-navbar__leading">
      <button class="apple-navbar__back" aria-label="Back">
        <svg class="apple-navbar__chevron" width="12" height="20" viewBox="0 0 12 20" aria-hidden="true">
          <path d="M10 2L2 10l8 8" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="apple-navbar__back-label">Back</span>
      </button>
    </div>
    <h1 class="apple-navbar__inline-title">Photos</h1>
    <div class="apple-navbar__trailing">
      <button class="apple-navbar__icon-action" aria-label="Search">
        <svg width="22" height="22" viewBox="0 0 22 22" aria-hidden="true"><!-- search icon --></svg>
      </button>
    </div>
  </nav>
</header>
```

## Complete CSS

```css
.apple-navbar {
  position: sticky;
  top: 0;
  z-index: 100;
  width: 100%;
  background: var(--apple-navbar-bg);
  border-bottom: 0.5px solid var(--apple-navbar-separator);
  font-family: var(--apple-navbar-font);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Liquid Glass variant */
.apple-navbar--glass {
  background: rgba(255, 255, 255, 0.72);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-bottom: 0.5px solid rgba(255, 255, 255, 0.3);
}

.apple-navbar__bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 44px;
  padding: 0 16px;
  gap: 8px;
}

.apple-navbar__leading,
.apple-navbar__trailing {
  display: flex;
  align-items: center;
  gap: 8px;
  min-width: 70px;
}
.apple-navbar__trailing { justify-content: flex-end; }

/* Back button */
.apple-navbar__back {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  background: none;
  border: none;
  color: var(--apple-navbar-tint);
  font-family: var(--apple-navbar-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  padding: 8px 4px;
  min-height: 44px;
  cursor: pointer;
  transition: var(--apple-navbar-transition);
  -webkit-tap-highlight-color: transparent;
}
.apple-navbar__chevron {
  color: var(--apple-navbar-tint);
  flex-shrink: 0;
}
.apple-navbar__back:active { opacity: 0.5; }

/* Action buttons */
.apple-navbar__action {
  background: none;
  border: none;
  color: var(--apple-navbar-tint);
  font-family: var(--apple-navbar-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  padding: 8px 4px;
  min-height: 44px;
  cursor: pointer;
  transition: var(--apple-navbar-transition);
  -webkit-tap-highlight-color: transparent;
}
.apple-navbar__action:active { opacity: 0.5; }

.apple-navbar__icon-action {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background: none;
  border: none;
  color: var(--apple-navbar-tint);
  width: 44px;
  height: 44px;
  padding: 0;
  cursor: pointer;
  transition: var(--apple-navbar-transition);
  -webkit-tap-highlight-color: transparent;
}
.apple-navbar__icon-action:active { opacity: 0.5; }

/* Inline title */
.apple-navbar__inline-title {
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-navbar-title);
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  flex: 1;
  margin: 0;
}
/* Hide inline title when large title is visible */
.apple-navbar--large .apple-navbar__inline-title { opacity: 0; }
.apple-navbar--large.apple-navbar--collapsed .apple-navbar__inline-title { opacity: 1; }

/* Large title */
.apple-navbar__large-title {
  padding: 0 16px 8px;
}
.apple-navbar__large-title h1 {
  font-size: 34px;
  font-weight: 700;
  line-height: 41px;
  letter-spacing: 0.37px;
  color: var(--apple-navbar-title);
  margin: 0;
}
/* Collapse large title on scroll */
.apple-navbar--collapsed .apple-navbar__large-title {
  height: 0;
  padding: 0 16px;
  overflow: hidden;
  opacity: 0;
  transition: height 250ms ease-out, opacity 200ms ease-out, padding 250ms ease-out;
}

/* Focus states */
.apple-navbar__back:focus-visible,
.apple-navbar__action:focus-visible,
.apple-navbar__icon-action:focus-visible {
  outline: 4px solid var(--apple-navbar-focus-ring);
  outline-offset: 1px;
  border-radius: 6px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-navbar__back:hover,
  .apple-navbar__action:hover {
    background: var(--apple-navbar-fill);
    border-radius: 6px;
  }
  .apple-navbar__icon-action:hover {
    background: var(--apple-navbar-fill);
    border-radius: 9999px;
  }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-navbar--glass {
    background: rgba(30, 30, 30, 0.72);
    border-bottom-color: rgba(255, 255, 255, 0.1);
  }
  .apple-navbar__back:focus-visible,
  .apple-navbar__action:focus-visible,
  .apple-navbar__icon-action:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-navbar--glass {
  background: rgba(30, 30, 30, 0.72);
  border-bottom-color: rgba(255, 255, 255, 0.1);
}
.dark .apple-navbar__back:focus-visible,
.dark .apple-navbar__action:focus-visible,
.dark .apple-navbar__icon-action:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Back Button | Action Button | Icon Action | Title |
|-------|------------|---------------|-------------|-------|
| Default | tint color | tint color | tint color | label color |
| Hover | fill bg, 6px radius | fill bg, 6px radius | fill bg, round | — |
| Focus | 4px blue ring | 4px blue ring | 4px blue ring | — |
| Active | opacity 0.5 | opacity 0.5 | opacity 0.5 | — |
| Scrolled (large) | — | — | — | collapses to inline |

## Animation & Motion

```css
/* Large title collapse/expand */
.apple-navbar__large-title {
  transition: height 250ms ease-out, opacity 200ms ease-out, padding 250ms ease-out;
}
.apple-navbar--large .apple-navbar__inline-title {
  transition: opacity 200ms ease-out;
}

/* Scroll-triggered collapse (add via JS) */
.apple-navbar--collapsed .apple-navbar__large-title {
  height: 0;
  padding: 0 16px;
  opacity: 0;
}
.apple-navbar--collapsed .apple-navbar__inline-title {
  opacity: 1;
}

@media (prefers-reduced-motion: reduce) {
  .apple-navbar__large-title,
  .apple-navbar--large .apple-navbar__inline-title,
  .apple-navbar__back,
  .apple-navbar__action,
  .apple-navbar__icon-action {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="banner"` on header, `aria-label="Navigation"` on nav, `aria-label` on all buttons
- **Keyboard**: Tab to focus each button, Enter/Space to activate
- **Focus ring**: 4px solid blue at 60% opacity, 1px offset
- **Touch target**: All buttons minimum 44x44px
- **Screen reader**: Back button announces "Back" or parent screen name
- **Title hierarchy**: `<h1>` for page title in both large and inline variants
- **Landmark**: Uses `<header>` and `<nav>` for landmark navigation

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Large title variant, full width, 16px horizontal padding |
| 600-1024px | Inline title for pushed views, optional large title for root |
| > 1024px | Thinner bar, can integrate with sidebar layout, 24px padding |

## Do / Don't

| Do | Don't |
|----|-------|
| Use Large Title for top-level screens | Use Large Title on every pushed screen |
| Show parent screen name in back label | Use generic "Back" when parent name is short |
| Use Liquid Glass for content-over-bar layouts | Apply Liquid Glass to every navigation bar |
| Limit to 2-3 trailing actions | Overcrowd the trailing area with buttons |
| Collapse large title on scroll | Keep large title always visible while scrolling |
