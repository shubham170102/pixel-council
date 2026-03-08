---
name: scroll-view
description: Apple scroll view — pull-to-refresh, paging, content insets, rubber-banding, scroll indicators
metadata:
  tags: scroll, scroll view, pull to refresh, paging, rubber band, bounce, content inset, indicator
---

# Scroll View -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Scroll indicator width | 3px (idle), 6px (active) |
| Indicator corner radius | 9999px |
| Indicator color (light) | rgba(0,0,0,0.4) |
| Indicator color (dark) | rgba(255,255,255,0.4) |
| Pull-to-refresh spinner | 20px diameter |
| Pull threshold | 80px |
| Rubber-band tension | cubic-bezier(0.2, 0.8, 0.2, 1) |
| CSS prefix | `.apple-scrollview` |

## Design Tokens

```css
:root {
  --apple-scrollview-bg: #FFFFFF;
  --apple-scrollview-indicator: rgba(0, 0, 0, 0.4);
  --apple-scrollview-indicator-active: rgba(0, 0, 0, 0.6);
  --apple-scrollview-tint: #007AFF;
  --apple-scrollview-refresh-bg: #F2F2F7;
  --apple-scrollview-separator: rgba(60, 60, 67, 0.29);
  --apple-scrollview-text: #000000;
  --apple-scrollview-secondary: rgba(60, 60, 67, 0.6);
  --apple-scrollview-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-scrollview-bg: #000000;
    --apple-scrollview-indicator: rgba(255, 255, 255, 0.4);
    --apple-scrollview-indicator-active: rgba(255, 255, 255, 0.6);
    --apple-scrollview-tint: #0A84FF;
    --apple-scrollview-refresh-bg: #1C1C1E;
    --apple-scrollview-separator: rgba(84, 84, 88, 0.6);
    --apple-scrollview-text: #FFFFFF;
    --apple-scrollview-secondary: rgba(235, 235, 245, 0.6);
  }
}
.dark {
  --apple-scrollview-bg: #000000;
  --apple-scrollview-indicator: rgba(255, 255, 255, 0.4);
  --apple-scrollview-indicator-active: rgba(255, 255, 255, 0.6);
  --apple-scrollview-tint: #0A84FF;
  --apple-scrollview-refresh-bg: #1C1C1E;
  --apple-scrollview-separator: rgba(84, 84, 88, 0.6);
  --apple-scrollview-text: #FFFFFF;
  --apple-scrollview-secondary: rgba(235, 235, 245, 0.6);
}
```

## Variants

| Style | Scroll Direction | Features | Use Case |
|-------|-----------------|----------|----------|
| Vertical | Top to bottom | Bounce, indicators, pull-to-refresh | Lists, pages |
| Horizontal | Left to right | Snap points, paging | Carousels, galleries |
| Paging | Horizontal with snap | Full-width pages, page control | Onboarding, photo viewer |
| Free-form | Both directions | Zoom, pan | Maps, large images |

## HTML Structure

```html
<!-- Vertical Scroll View -->
<div class="apple-scrollview" role="region" aria-label="Scrollable content" tabindex="0">
  <div class="apple-scrollview__content">
    <!-- Scrollable content here -->
  </div>
</div>

<!-- Vertical Scroll View with Pull-to-Refresh -->
<div class="apple-scrollview apple-scrollview--refreshable" role="region" aria-label="Feed">
  <div class="apple-scrollview__refresh" aria-live="polite">
    <div class="apple-scrollview__spinner" role="progressbar" aria-label="Refreshing">
      <svg width="20" height="20" viewBox="0 0 20 20" aria-hidden="true">
        <circle cx="10" cy="10" r="8" fill="none" stroke="currentColor" stroke-width="2"
                stroke-dasharray="38" stroke-dashoffset="38" stroke-linecap="round"/>
      </svg>
    </div>
  </div>
  <div class="apple-scrollview__content">
    <!-- Content -->
  </div>
</div>

<!-- Horizontal Paging Scroll View -->
<div class="apple-scrollview apple-scrollview--horizontal apple-scrollview--paging"
     role="region" aria-label="Photo gallery" tabindex="0">
  <div class="apple-scrollview__content">
    <div class="apple-scrollview__page">
      <img src="photo1.jpg" alt="Photo 1" />
    </div>
    <div class="apple-scrollview__page">
      <img src="photo2.jpg" alt="Photo 2" />
    </div>
    <div class="apple-scrollview__page">
      <img src="photo3.jpg" alt="Photo 3" />
    </div>
  </div>
</div>

<!-- Scroll View with Sticky Header -->
<div class="apple-scrollview" role="region" aria-label="Messages">
  <div class="apple-scrollview__content">
    <div class="apple-scrollview__sticky-header">
      <span>Today</span>
    </div>
    <div class="apple-scrollview__items">
      <!-- Items -->
    </div>
    <div class="apple-scrollview__sticky-header">
      <span>Yesterday</span>
    </div>
    <div class="apple-scrollview__items">
      <!-- Items -->
    </div>
  </div>
</div>
```

## Complete CSS

```css
.apple-scrollview {
  position: relative;
  overflow: auto;
  -webkit-overflow-scrolling: touch;
  overscroll-behavior: contain;
  font-family: var(--apple-scrollview-font);
  -webkit-font-smoothing: antialiased;
}

.apple-scrollview__content {
  min-height: 100%;
}

/* ---- Custom Scrollbar (WebKit) ---- */
.apple-scrollview::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}
.apple-scrollview::-webkit-scrollbar-track {
  background: transparent;
}
.apple-scrollview::-webkit-scrollbar-thumb {
  background: var(--apple-scrollview-indicator);
  border-radius: 9999px;
  min-height: 36px;
}
.apple-scrollview::-webkit-scrollbar-thumb:hover {
  background: var(--apple-scrollview-indicator-active);
}
.apple-scrollview::-webkit-scrollbar-thumb:active {
  background: var(--apple-scrollview-indicator-active);
}

/* Firefox scrollbar */
.apple-scrollview {
  scrollbar-width: thin;
  scrollbar-color: var(--apple-scrollview-indicator) transparent;
}

/* ---- Horizontal ---- */
.apple-scrollview--horizontal {
  overflow-x: auto;
  overflow-y: hidden;
}
.apple-scrollview--horizontal .apple-scrollview__content {
  display: flex;
  min-height: auto;
}

/* ---- Paging ---- */
.apple-scrollview--paging .apple-scrollview__content {
  scroll-snap-type: x mandatory;
}
.apple-scrollview__page {
  flex-shrink: 0;
  width: 100%;
  scroll-snap-align: start;
}
.apple-scrollview__page img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

/* ---- Pull-to-Refresh ---- */
.apple-scrollview__refresh {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 0;
  overflow: hidden;
  transition: height 200ms ease-out;
}

.apple-scrollview--refreshing .apple-scrollview__refresh {
  height: 60px;
}

.apple-scrollview__spinner {
  color: var(--apple-scrollview-secondary);
  animation: apple-scroll-spin 800ms linear infinite;
}
.apple-scrollview__spinner svg {
  display: block;
}

/* Pull progress (before threshold) */
.apple-scrollview__spinner--pulling svg circle {
  transition: stroke-dashoffset 100ms ease-out;
}

/* ---- Sticky Headers ---- */
.apple-scrollview__sticky-header {
  position: sticky;
  top: 0;
  z-index: 1;
  background: var(--apple-scrollview-refresh-bg);
  padding: 6px 16px;
  font-size: 13px;
  font-weight: 600;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-scrollview-secondary);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}

/* ---- Rubber-banding effect (CSS approximation) ---- */
.apple-scrollview {
  overscroll-behavior-y: none;
}
.apple-scrollview--bounce {
  overscroll-behavior-y: auto;
}

/* ---- Content Insets ---- */
.apple-scrollview--inset-top .apple-scrollview__content {
  padding-top: env(safe-area-inset-top, 0px);
}
.apple-scrollview--inset-bottom .apple-scrollview__content {
  padding-bottom: env(safe-area-inset-bottom, 0px);
}

/* ---- Fade Edges ---- */
.apple-scrollview--fade-edges::before,
.apple-scrollview--fade-edges::after {
  content: '';
  position: sticky;
  display: block;
  height: 24px;
  z-index: 2;
  pointer-events: none;
}
.apple-scrollview--fade-edges::before {
  top: 0;
  background: linear-gradient(to bottom, var(--apple-scrollview-bg), transparent);
}
.apple-scrollview--fade-edges::after {
  bottom: 0;
  background: linear-gradient(to top, var(--apple-scrollview-bg), transparent);
}

/* Focus */
.apple-scrollview:focus-visible {
  outline: 4px solid var(--apple-scrollview-indicator-active);
  outline-offset: -4px;
  border-radius: 2px;
}

@media (prefers-color-scheme: dark) {
  .apple-scrollview:focus-visible {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-scrollview:focus-visible {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Scrollbar | Content | Refresh | Indicator |
|-------|-----------|---------|---------|-----------|
| Idle | hidden or thin | static | hidden | — |
| Scrolling | visible, thin | moving | — | visible |
| Dragging scrollbar | wider, active color | jumps | — | visible |
| Pull (pre-threshold) | — | pulled down | spinner partially drawn | — |
| Refreshing | — | offset 60px | spinner spinning | — |
| Bounce (overscroll) | — | rubber-band | — | — |

## Animation & Motion

```css
@keyframes apple-scroll-spin {
  to { transform: rotate(360deg); }
}

/* Smooth scrollbar visibility */
.apple-scrollview::-webkit-scrollbar-thumb {
  transition: background-color 200ms ease-out;
}

/* Pull-to-refresh height */
.apple-scrollview__refresh {
  transition: height 200ms ease-out;
}

/* Paging scroll */
.apple-scrollview--paging .apple-scrollview__content {
  scroll-behavior: smooth;
}

@media (prefers-reduced-motion: reduce) {
  .apple-scrollview__spinner { animation: none; }
  .apple-scrollview__refresh { transition: none; }
  .apple-scrollview--paging .apple-scrollview__content { scroll-behavior: auto; }
}
```

## Accessibility

- **ARIA**: `role="region"` with `aria-label` on scroll container, `role="progressbar"` on refresh spinner with `aria-label`, `aria-live="polite"` on refresh area
- **Keyboard**: Tab to focus scroll region, arrow keys to scroll, Page Up/Down for paging, Home/End for top/bottom
- **Focus**: Subtle outline when focused via keyboard (for keyboard scrolling)
- **Screen reader**: Announces refresh state changes
- **Scroll indicators**: Visible enough for low-vision users (min 3px width)
- **Content insets**: Respect safe areas for notch/Dynamic Island/home indicator

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Momentum scrolling, pull-to-refresh, bounce, thin indicators |
| 600-1024px | Standard scrolling, optional pull-to-refresh |
| > 1024px | Visible scrollbars on hover (macOS style), no pull-to-refresh |

## Do / Don't

| Do | Don't |
|----|-------|
| Use `scroll-snap-type` for paging behavior | Implement custom paging with JS when CSS snap works |
| Show pull-to-refresh spinner during loading | Keep spinner visible after content has loaded |
| Respect `overscroll-behavior` for nested scrolls | Let nested scroll views fight for scroll events |
| Use sticky headers for date/section grouping | Make every header sticky (clutter) |
| Thin scrollbars that thicken on hover (Apple style) | Use browser-default chunky scrollbars |
