---
name: icons
description: IBM Carbon Icons system for web — Apache 2.0 licensed SVG library (~2,500 icons), npm/CDN loading strategies, sizing rules, design tokens, and 24-icon inlined library
metadata:
  tags: icon, carbon icons, svg, apache 2.0, glyph, pictogram, image
---

# Icons -- IBM Carbon Design System

Source: [carbon-design-system/carbon — packages/icons](https://github.com/carbon-design-system/carbon/tree/main/packages/icons) · [carbondesignsystem.com/guidelines/icons/library](https://carbondesignsystem.com/guidelines/icons/library/)

## Quick Reference

| Property | Value |
|----------|-------|
| Format | SVG (one file per size, per icon) |
| Sizes | 16, 20, 24, 32 px (one viewBox per size) |
| Default size | 16px (inline UI / dense), 20-24px (button affordances) |
| Default stroke / weight | 2px (visual stroke equivalent — actual paths are filled geometry) |
| Color method | `fill="currentColor"` on `<svg>` element |
| Library size | ~2,500 unique icons across 4 sizes |
| License | **Apache 2.0** — free for commercial / web redistribution |
| npm packages | `@carbon/icons`, `@carbon/icons-react`, `@carbon/icons-vue` |
| Source repo | `github.com/carbon-design-system/carbon/tree/main/packages/icons` |
| Min touch target | 40x40px (per Carbon button spec, larger than 32px icon itself) |
| CSS prefix | `--cds-icon-*` tokens, `.cds--icon` class |
| Border-radius | `0` — Carbon icons follow the same sharp-corner rule as the rest of the system |

## Web Licensing Callout

> **Carbon Icons can be redistributed in web projects.**
>
> Unlike Apple SF Symbols (Apple platforms only) and emoji glyph fonts (system-locked), Carbon Icons ship under **Apache License 2.0**. You may inline the SVGs, ship them via npm, serve them from your own CDN, or load them from `unpkg.com/@carbon/icons` directly in production — for free, including commercial products.
>
> Use `@carbon/icons` directly via npm or unpkg CDN. There is no per-icon attribution requirement, but include the Apache 2.0 license file when redistributing the package itself.

## Design Tokens

```css
:root {
  /* Icon color tokens map onto Carbon text tokens */
  --cds-icon-primary: var(--cds-text-primary);             /* #161616 light / #f4f4f4 dark */
  --cds-icon-secondary: var(--cds-text-secondary);         /* #525252 light / #c6c6c6 dark */
  --cds-icon-on-color: #ffffff;                            /* On filled buttons / inverse surfaces */
  --cds-icon-disabled: var(--cds-text-disabled);           /* #16161640 light / #f4f4f440 dark */
  --cds-icon-interactive: var(--cds-link-primary);         /* #0f62fe light / #78a9ff dark */
  --cds-icon-inverse: var(--cds-text-inverse);             /* #ffffff light / #161616 dark */

  /* Status colors — surface these from overview.md */
  --cds-icon-success: #24a148;
  --cds-icon-warning: #f1c21b;
  --cds-icon-error: #da1e28;
  --cds-icon-info: #0043ce;

  /* Carbon's standard productive motion */
  --cds-icon-transition: fill 70ms cubic-bezier(0.2, 0, 0.38, 0.9),
    color 70ms cubic-bezier(0.2, 0, 0.38, 0.9),
    opacity 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

@media (prefers-color-scheme: dark) {
  :root {
    --cds-icon-success: #42be65;
    --cds-icon-warning: #f1c21b;
    --cds-icon-error: #fa4d56;
    --cds-icon-info: #4589ff;
  }
}
.cds--g100,
.cds--g90,
.dark {
  --cds-icon-success: #42be65;
  --cds-icon-warning: #f1c21b;
  --cds-icon-error: #fa4d56;
  --cds-icon-info: #4589ff;
}
```

## Loading Strategies

Carbon ships icons four ways. Pick the strategy that matches your build pipeline.

### A) npm + React (recommended for React apps)

```bash
npm install @carbon/icons-react
```

```jsx
import { Add, Settings, ChevronRight } from '@carbon/icons-react';

export function Toolbar() {
  return (
    <div className="cds--toolbar">
      <button className="cds--btn cds--btn--ghost" aria-label="Add item">
        <Add size={16} />
      </button>
      <button className="cds--btn cds--btn--ghost" aria-label="Settings">
        <Settings size={20} />
      </button>
      <ChevronRight size={16} aria-hidden="true" />
    </div>
  );
}
```

`size` accepts `16 | 20 | 24 | 32`. Each component renders the size-specific SVG with the matching viewBox — never scale a 16px icon up to 32px in CSS, swap to the 32-prefixed export instead.

### B) Vanilla npm (framework-agnostic)

```bash
npm install @carbon/icons
```

```js
// Each icon ships per-size as a JS module returning an AST you can serialize.
import Add16 from '@carbon/icons/lib/add/16';
import ChevronRight20 from '@carbon/icons/lib/chevron--right/20';

// Convert to a DOM node (use @carbon/icon-helpers, or your own renderer).
import { toString as iconToString } from '@carbon/icon-helpers';

document.querySelector('#add-btn').innerHTML = iconToString(Add16);
```

Static SVG files live at `node_modules/@carbon/icons/svg/{size}/{name}.svg` if you'd rather copy them into a sprite.

### C) CDN module (no build step — React)

```html
<script type="module">
  import 'https://unpkg.com/@carbon/icons-react@latest';
</script>
```

Use this only for prototypes — production apps should pin a version and bundle.

### D) Plain `<img>` from unpkg static SVG

```html
<!-- Cheap, cacheable, zero JS — use for static marketing pages -->
<img
  src="https://unpkg.com/@carbon/icons/svg/32/add.svg"
  width="24"
  height="24"
  alt=""
/>

<!-- Versioned (recommended in production) -->
<img
  src="https://unpkg.com/@carbon/icons@11/svg/16/chevron--right.svg"
  width="16"
  height="16"
  alt=""
/>
```

Tradeoff: `<img>` cannot inherit `currentColor`. If you need themeable color, inline the SVG (see library below) or use the React/JS APIs.

## Sizing Rules

Carbon ships **four discrete sizes** so each icon stays optically tuned. Pick the size that matches the component, never scale across sizes in CSS.

| Size | viewBox | Use Case | Examples |
|------|---------|----------|----------|
| **16px** | `0 0 16 16` | Inline body text, dense data tables, list rows, status indicators in tag/notification components | Chevron in breadcrumb, checkmark in checkbox, info icon next to a label |
| **20px** | `0 0 20 20` | Compact UI density (Carbon "compact" theme), tertiary buttons, secondary nav | Toolbar buttons in compact mode, dense grid actions |
| **24px** | `0 0 24 24` | Default productive density, primary/secondary button affordances, sidebar nav | Header utility icons, side nav items, button leading icons |
| **32px** | `0 0 32 32` | Empty states, illustration accents, marketing/expressive UI, large feature callouts | Onboarding tiles, empty-table placeholder, hero feature row |

**Default selection rule:**
- Inline with text, in dense surfaces, or inside a 32px tag → **16px**
- Inside a 40-48px button or icon-button → **20px** or **24px** (match button density)
- Standalone, decorative, or hero context → **32px**

## SVG Icon Library — 24 Inlined Icons

Each icon below is the **verbatim source** from `@carbon/icons` (32px viewBox), reformatted into a single `<svg>` element with `fill="currentColor"` so it inherits color from its parent. The transparent background `<rect class="cls-1">` is omitted to keep the inlined markup small — Carbon includes it only as a hit-target padding for sprites, which is unnecessary when you control the surrounding container.

Render at any of the four canonical sizes by setting `width` / `height` to `16`, `20`, `24`, or `32` while keeping the `viewBox="0 0 32 32"`. For pixel-perfect rendering at 16/20px, swap to the size-specific source from `@carbon/icons` instead.

### add (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="17,15 17,8 15,8 15,15 8,15 8,17 15,17 15,24 17,24 17,17 24,17 24,15 "/>
</svg>
```

### close (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="17.4141 16 24 9.4141 22.5859 8 16 14.5859 9.4143 8 8 9.4141 14.5859 16 8 22.5859 9.4143 24 16 17.4141 22.5859 24 24 22.5859 17.4141 16"/>
</svg>
```

### checkmark (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="13 24 4 15 5.414 13.586 13 21.171 26.586 7.586 28 9 13 24"/>
</svg>
```

### chevron--right (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="22,16 12,26 10.6,24.6 19.2,16 10.6,7.4 12,6 "/>
</svg>
```

### chevron--down (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="16,22 6,12 7.4,10.6 16,19.2 24.6,10.6 26,12 "/>
</svg>
```

### chevron--left (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="10,16 20,6 21.4,7.4 12.8,16 21.4,24.6 20,26 "/>
</svg>
```

### chevron--up (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="16,10 26,20 24.6,21.4 16,12.8 7.4,21.4 6,20 "/>
</svg>
```

### arrow--right (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="18 6 16.57 7.393 24.15 15 4 15 4 17 24.15 17 16.57 24.573 18 26 28 16 18 6"/>
</svg>
```

### arrow--left (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="14 26 15.41 24.59 7.83 17 28 17 28 15 7.83 15 15.41 7.41 14 6 4 16 14 26"/>
</svg>
```

### settings (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M27,16.76c0-.25,0-.5,0-.76s0-.51,0-.77l1.92-1.68A2,2,0,0,0,29.3,11L26.94,7a2,2,0,0,0-1.73-1,2,2,0,0,0-.64.1l-2.43.82a11.35,11.35,0,0,0-1.31-.75l-.51-2.52a2,2,0,0,0-2-1.61H13.64a2,2,0,0,0-2,1.61l-.51,2.52a11.48,11.48,0,0,0-1.32.75L7.43,6.06A2,2,0,0,0,6.79,6,2,2,0,0,0,5.06,7L2.7,11a2,2,0,0,0,.41,2.51L5,15.24c0,.25,0,.5,0,.76s0,.51,0,.77L3.11,18.45A2,2,0,0,0,2.7,21L5.06,25a2,2,0,0,0,1.73,1,2,2,0,0,0,.64-.1l2.43-.82a11.35,11.35,0,0,0,1.31.75l.51,2.52a2,2,0,0,0,2,1.61h4.72a2,2,0,0,0,2-1.61l.51-2.52a11.48,11.48,0,0,0,1.32-.75l2.42.82a2,2,0,0,0,.64.1,2,2,0,0,0,1.73-1L29.3,21a2,2,0,0,0-.41-2.51ZM25.21,24l-3.43-1.16a8.86,8.86,0,0,1-2.71,1.57L18.36,28H13.64l-.71-3.55a9.36,9.36,0,0,1-2.7-1.57L6.79,24,4.43,20l2.72-2.4a8.9,8.9,0,0,1,0-3.13L4.43,12,6.79,8l3.43,1.16a8.86,8.86,0,0,1,2.71-1.57L13.64,4h4.72l.71,3.55a9.36,9.36,0,0,1,2.7,1.57L25.21,8,27.57,12l-2.72,2.4a8.9,8.9,0,0,1,0,3.13L27.57,20Z"/>
  <path d="M16,22a6,6,0,1,1,6-6A5.94,5.94,0,0,1,16,22Zm0-10a3.91,3.91,0,0,0-4,4,3.91,3.91,0,0,0,4,4,3.91,3.91,0,0,0,4-4A3.91,3.91,0,0,0,16,12Z"/>
</svg>
```

### search (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M29,27.5859l-7.5521-7.5521a11.0177,11.0177,0,1,0-1.4141,1.4141L27.5859,29ZM4,13a9,9,0,1,1,9,9A9.01,9.01,0,0,1,4,13Z"/>
</svg>
```

### menu (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <rect x="4" y="6" width="24" height="2"/>
  <rect x="4" y="12" width="24" height="2"/>
  <rect x="4" y="18" width="24" height="2"/>
  <rect x="4" y="24" width="24" height="2"/>
</svg>
```

### filter (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M18,28H14a2,2,0,0,1-2-2V18.41L4.59,11A2,2,0,0,1,4,9.59V6A2,2,0,0,1,6,4H26a2,2,0,0,1,2,2V9.59A2,2,0,0,1,27.41,11L20,18.41V26A2,2,0,0,1,18,28ZM6,6V9.59l8,8V26h4V17.59l8-8V6Z"/>
</svg>
```

### edit (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <rect x="2" y="26" width="28" height="2"/>
  <path d="M25.4,9c0.8-0.8,0.8-2,0-2.8c0,0,0,0,0,0l-3.6-3.6c-0.8-0.8-2-0.8-2.8,0c0,0,0,0,0,0l-15,15V24h6.4L25.4,9z M20.4,4L24,7.6l-3,3L17.4,7L20.4,4z M6,22v-3.6l10-10l3.6,3.6l-10,10H6z"/>
</svg>
```

### trash-can (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <rect x="12" y="12" width="2" height="12"/>
  <rect x="18" y="12" width="2" height="12"/>
  <path d="M4,6V8H6V28a2,2,0,0,0,2,2H24a2,2,0,0,0,2-2V8h2V6ZM8,28V8H24V28Z"/>
  <rect x="12" y="2" width="8" height="2"/>
</svg>
```

### copy (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M28,10V28H10V10H28m0-2H10a2,2,0,0,0-2,2V28a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V10a2,2,0,0,0-2-2Z"/>
  <path d="M4,18H2V4A2,2,0,0,1,4,2H18V4H4Z"/>
</svg>
```

### download (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M26,24v4H6V24H4v4H4a2,2,0,0,0,2,2H26a2,2,0,0,0,2-2h0V24Z"/>
  <polygon points="26 14 24.59 12.59 17 20.17 17 2 15 2 15 20.17 7.41 12.59 6 14 16 24 26 14"/>
</svg>
```

### upload (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="6 18 7.41 19.41 15 11.83 15 30 17 30 17 11.83 24.59 19.41 26 18 16 8 6 18"/>
  <path d="M6,8V4H26V8h2V4a2,2,0,0,0-2-2H6A2,2,0,0,0,4,4V8Z"/>
</svg>
```

### user (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M16,4a5,5,0,1,1-5,5,5,5,0,0,1,5-5m0-2a7,7,0,1,0,7,7A7,7,0,0,0,16,2Z"/>
  <path d="M26,30H24V25a5,5,0,0,0-5-5H13a5,5,0,0,0-5,5v5H6V25a7,7,0,0,1,7-7h6a7,7,0,0,1,7,7Z"/>
</svg>
```

### notification (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M28.7071,19.293,26,16.5859V13a10.0136,10.0136,0,0,0-9-9.9492V1H15V3.0508A10.0136,10.0136,0,0,0,6,13v3.5859L3.2929,19.293A1,1,0,0,0,3,20v3a1,1,0,0,0,1,1h7v.7768a5.152,5.152,0,0,0,4.5,5.1987A5.0057,5.0057,0,0,0,21,25V24h7a1,1,0,0,0,1-1V20A1,1,0,0,0,28.7071,19.293ZM19,25a3,3,0,0,1-6,0V24h6Zm8-3H5V20.4141L7.707,17.707A1,1,0,0,0,8,17V13a8,8,0,0,1,16,0v4a1,1,0,0,0,.293.707L27,20.4141Z"/>
</svg>
```

### warning--filled (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M16,2C8.3,2,2,8.3,2,16s6.3,14,14,14s14-6.3,14-14C30,8.3,23.7,2,16,2z M14.9,8h2.2v11h-2.2V8z M16,25c-0.8,0-1.5-0.7-1.5-1.5S15.2,22,16,22c0.8,0,1.5,0.7,1.5,1.5S16.8,25,16,25z"/>
</svg>
```

### error--filled (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M16,2A13.914,13.914,0,0,0,2,16,13.914,13.914,0,0,0,16,30,13.914,13.914,0,0,0,30,16,13.914,13.914,0,0,0,16,2Zm5.4449,21L9,10.5557,10.5557,9,23,21.4448Z"/>
</svg>
```

### information (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <polygon points="17 22 17 14 13 14 13 16 15 16 15 22 12 22 12 24 20 24 20 22 17 22"/>
  <path d="M16,8a1.5,1.5,0,1,0,1.5,1.5A1.5,1.5,0,0,0,16,8Z"/>
  <path d="M16,30A14,14,0,1,1,30,16,14,14,0,0,1,16,30ZM16,4A12,12,0,1,0,28,16,12,12,0,0,0,16,4Z"/>
</svg>
```

### help (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M16,2A14,14,0,1,0,30,16,14,14,0,0,0,16,2Zm0,26A12,12,0,1,1,28,16,12,12,0,0,1,16,28Z"/>
  <circle cx="16" cy="23.5" r="1.5"/>
  <path d="M17,8H15.5A4.49,4.49,0,0,0,11,12.5V13h2v-.5A2.5,2.5,0,0,1,15.5,10H17a2.5,2.5,0,0,1,0,5H15v4.5h2V17a4.5,4.5,0,0,0,0-9Z"/>
</svg>
```

### view (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M30.94,15.66A16.69,16.69,0,0,0,16,5,16.69,16.69,0,0,0,1.06,15.66a1,1,0,0,0,0,.68A16.69,16.69,0,0,0,16,27,16.69,16.69,0,0,0,30.94,16.34,1,1,0,0,0,30.94,15.66ZM16,25c-5.3,0-10.9-3.93-12.93-9C5.1,10.93,10.7,7,16,7s10.9,3.93,12.93,9C26.9,21.07,21.3,25,16,25Z"/>
  <path d="M16,10a6,6,0,1,0,6,6A6,6,0,0,0,16,10Zm0,10a4,4,0,1,1,4-4A4,4,0,0,1,16,20Z"/>
</svg>
```

### view--off (32x32)
```html
<svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="M5.24,22.51l1.43-1.42A14.06,14.06,0,0,1,3.07,16C5.1,10.93,10.7,7,16,7a12.38,12.38,0,0,1,4,.72l1.55-1.56A14.72,14.72,0,0,0,16,5A16.69,16.69,0,0,0,1.06,15.66a1,1,0,0,0,0,.68A16,16,0,0,0,5.24,22.51Z"/>
  <path d="M12,15.73a4,4,0,0,1,3.7-3.7l1.81-1.82a6,6,0,0,0-7.33,7.33Z"/>
  <path d="M30.94,15.66A16.4,16.4,0,0,0,25.2,8.22L30,3.41,28.59,2,2,28.59,3.41,30l5.1-5.1A15.29,15.29,0,0,0,16,27,16.69,16.69,0,0,0,30.94,16.34,1,1,0,0,0,30.94,15.66ZM20,16a4,4,0,0,1-6,3.44L19.44,14A4,4,0,0,1,20,16Zm-4,9a13.05,13.05,0,0,1-6-1.58l2.54-2.54a6,6,0,0,0,8.35-8.35l2.87-2.87A14.54,14.54,0,0,1,28.93,16C26.9,21.07,21.3,25,16,25Z"/>
</svg>
```

## Accessibility

### Decorative vs meaningful

| Icon usage | Markup |
|------------|--------|
| **Decorative** — paired with adjacent visible text label | `aria-hidden="true"` on the `<svg>` (screen readers ignore it) |
| **Meaningful, standalone** — icon-only button or image conveying state | `<button aria-label="...">` wrapping an `aria-hidden` SVG, OR `<svg role="img" aria-labelledby="...">` with a `<title>` child |
| **Inside informational text** | Wrap in `<span aria-label="...">` if it changes the meaning, otherwise `aria-hidden="true"` |

### Patterns

```html
<!-- 1. Decorative icon next to a visible label (most common) -->
<button class="cds--btn cds--btn--primary" type="button">
  <svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
    <polygon points="17,15 17,8 15,8 15,15 8,15 8,17 15,17 15,24 17,24 17,17 24,17 24,15 "/>
  </svg>
  Add item
</button>

<!-- 2. Icon-only button — aria-label on the button, hidden SVG -->
<button class="cds--btn cds--btn--ghost cds--btn--icon-only" type="button" aria-label="Close">
  <svg width="20" height="20" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
    <polygon points="17.4141 16 24 9.4141 22.5859 8 16 14.5859 9.4143 8 8 9.4141 14.5859 16 8 22.5859 9.4143 24 16 17.4141 22.5859 24 24 22.5859 17.4141 16"/>
  </svg>
</button>

<!-- 3. Standalone meaningful icon — role="img" + <title> -->
<svg role="img" aria-labelledby="warn-title" width="20" height="20" viewBox="0 0 32 32"
  fill="currentColor" style="color: var(--cds-icon-warning)">
  <title id="warn-title">Warning: form contains errors</title>
  <path d="M16,2C8.3,2,2,8.3,2,16s6.3,14,14,14s14-6.3,14-14C30,8.3,23.7,2,16,2z M14.9,8h2.2v11h-2.2V8z M16,25c-0.8,0-1.5-0.7-1.5-1.5S15.2,22,16,22c0.8,0,1.5,0.7,1.5,1.5S16.8,25,16,25z"/>
</svg>
```

### Carbon-specific rules

- **Touch target:** minimum 40x40px on all interactive icon containers (Carbon's button minimum). Icons themselves stay 16/20/24/32 — pad the surrounding `<button>`.
- **Focus ring:** 2px solid `var(--cds-focus)` (`#0f62fe` light / `#ffffff` dark), inset on the button. Carbon focus is sharp, not rounded.
- **Color contrast:** `--cds-icon-primary` on `--cds-background` meets WCAG AAA. `--cds-icon-secondary` meets AA. Never use `--cds-icon-disabled` to communicate state.
- **High contrast mode:** all icons use `currentColor`, so they automatically follow Windows High Contrast and forced-colors settings.
- **Reduced motion:** wrap any icon transition (color, opacity, transform) in a `prefers-reduced-motion` guard.

```css
@media (prefers-reduced-motion: reduce) {
  .cds--icon { transition: none !important; }
}
```

## Color Application

Carbon icons are **fill-based geometry** (not stroked). Color is applied via the `fill` attribute, which inherits from `currentColor` when the SVG sets `fill="currentColor"`. Set the `color` of the parent element to theme the icon.

```css
/* ---- Base icon class (apply to <svg> or its wrapper) ---- */
.cds--icon {
  display: inline-block;
  flex-shrink: 0;
  vertical-align: middle;
  fill: currentColor;
  color: var(--cds-icon-primary);
  border-radius: 0;                               /* Carbon = sharp corners */
  transition: var(--cds-icon-transition);
}

/* ---- Color modifiers ---- */
.cds--icon--secondary    { color: var(--cds-icon-secondary); }
.cds--icon--on-color     { color: var(--cds-icon-on-color); }
.cds--icon--disabled     { color: var(--cds-icon-disabled); }
.cds--icon--interactive  { color: var(--cds-icon-interactive); }
.cds--icon--inverse      { color: var(--cds-icon-inverse); }
.cds--icon--success      { color: var(--cds-icon-success); }
.cds--icon--warning      { color: var(--cds-icon-warning); }
.cds--icon--error        { color: var(--cds-icon-error); }
.cds--icon--info         { color: var(--cds-icon-info); }

/* ---- Hover on interactive icons (link / ghost button context) ---- */
.cds--icon--interactive:hover {
  color: var(--cds-link-primary-hover, #0043ce);  /* Carbon link-hover */
}

/* ---- Disabled state ---- */
.cds--icon[aria-disabled="true"],
.cds--icon--disabled {
  color: var(--cds-icon-disabled);
  cursor: not-allowed;
}
```

### Color inheritance pattern

```html
<!-- The icon inherits #525252 from its parent text color -->
<p style="color: var(--cds-text-secondary)">
  <svg class="cds--icon" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
    <path d="..."/>
  </svg>
  Secondary text with icon
</p>

<!-- Override on the icon itself for status colors -->
<svg class="cds--icon cds--icon--error" width="20" height="20" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
  <path d="..."/>
</svg>
```

### Do / Don't

| Do | Don't |
|----|-------|
| Use `fill="currentColor"` on every inlined SVG | Hardcode hex values inside `<path fill="...">` |
| Pick the size-specific source (16/20/24/32) for crisp rendering | Scale a 16px icon to 32px in CSS |
| Pad the surrounding `<button>` to 40px minimum touch target | Set `padding` on the SVG itself |
| Use Apache 2.0 license — ship via npm or unpkg directly | Re-license or strip the LICENSE file when redistributing |
| Mirror directional icons (chevron/arrow) in RTL via `[dir="rtl"]` CSS | Manually swap to a different icon name in RTL |
| Use status colors (`--cds-icon-error`/`-warning`/`-success`) only for status | Use status colors as decorative accents |
