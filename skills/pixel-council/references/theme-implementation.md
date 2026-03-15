# Theme Implementation Guide

Implement both light and dark themes using this pattern. Single-theme output is the #1 signal of AI-generated UI.

## CSS Pattern

```css
:root {
  /* light tokens from reference files */
}

@media (prefers-color-scheme: dark) {
  :root {
    /* dark tokens */
  }
}

.dark {
  /* same dark tokens — enables manual toggle */
}
```

## HTML Theme Toggle

For standalone pages, include a visible theme toggle:

```html
<!-- Theme toggle for standalone pages -->
<button
  onclick="document.documentElement.classList.toggle('dark')"
  aria-label="Toggle theme"
>
  <!-- sun/moon icon -->
</button>
```

Add smooth transitions on color changes:

```css
body, /* and major containers */ {
  transition: background-color 200ms ease, color 200ms ease;
}
```

## Theme Verification Checklist

- [ ] **Light theme renders correctly** — all token values produce correct colors, proper contrast
- [ ] **Dark theme renders correctly** — dark tokens from reference files used (NOT inverted light theme)
- [ ] **Both `@media (prefers-color-scheme: dark)` AND `.dark` class** work
- [ ] **Theme toggle included** for standalone pages (button/switch that toggles `.dark` on `<html>`)
- [ ] **Contrast ratios** — text meets WCAG AA (4.5:1 normal, 3:1 large) in BOTH themes
- [ ] **Smooth theme transition** — `transition` on `background-color` and `color` for major containers
- [ ] **No hardcoded colors** — every color references a CSS variable that switches with theme

## Why Both Themes Matter

Users on macOS/iOS/Android expect dark mode. A light-only page feels like a prototype, not a product. This is why every reference file includes both light and dark token values — use them.

**Strategy:**
- Light theme is the PRIMARY presentation (design it first, show it first)
- Dark theme uses `@media (prefers-color-scheme: dark)` AND `.dark` class for manual toggle
- Dark theme is NOT "invert the colors" — use the specific dark token values from each reference file
