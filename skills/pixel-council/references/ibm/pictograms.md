---
name: pictograms
description: Carbon pictograms — editorial illustrations used at 32-128px in marketing, feature sections, and empty states. Single-color, scene-based, currentColor-driven. Sourced verbatim from @carbon/pictograms (Apache 2.0). Use when building marketing pages, hero illustrations, or feature grids in the IBM Carbon design system.
tags: [pictogram, illustration, marketing, editorial, ibm, carbon]
---

# Pictograms -- IBM Carbon Design System

> Source: [@carbon/pictograms](https://github.com/carbon-design-system/carbon/tree/main/packages/pictograms) — Apache 2.0
> React package: [@carbon/pictograms-react](https://github.com/carbon-design-system/carbon/tree/main/packages/pictograms-react)
> Browser/catalog: [carbondesignsystem.com/elements/pictograms/library](https://carbondesignsystem.com/elements/pictograms/library)

---

## What pictograms are

Pictograms are **editorial illustrations** — multi-stroke, scene-based, expressive marks used at sizes ranging from 32px (sidebar) up to 128px (hero/empty state). They convey concepts (analytics, sustainability, transformation) rather than actions, and live in marketing, content, and empty-state surfaces — never inside dense product UI.

This is the key distinction from **icons** (`@carbon/icons`), which are functional, single-purpose, drawn at 16-32px, and live inside buttons, fields, navigation, and tables. Use a pictogram when the goal is to communicate an *idea* with visual weight; use an icon when the goal is to mark a *control* or *status*.

There is no Apple HIG or Material Design 3 equivalent — pictograms are a Carbon-unique system. If you need editorial illustration in an Apple/Material build, fall back to large SF Symbols or Material Symbols at 64-96px (knowing they will read as oversized icons rather than true illustrations).

---

## When to use

| Context | Pictogram or Icon? | Size |
|---|---|---|
| Marketing feature section (3-column grid) | Pictogram | 64-96px |
| Empty state hero ("No projects yet") | Pictogram | 96-128px |
| Editorial section header (above expressive heading) | Pictogram | 64px |
| Landing page hero illustration | Pictogram | 96-128px |
| Product chrome / button / control | Icon | 16-24px |
| Side-nav, header, breadcrumb | Icon | 20-24px |
| Inline with body copy (badge, status) | Icon | 16px |
| Data table cell, form affordance | Icon | 16-20px |

**Rule of thumb:** if the surface is *productive* (the user is acting on data) → icon. If the surface is *expressive* (the page is selling, teaching, or empty) → pictogram.

---

## Loading strategies

### React (recommended for app shells)

```bash
npm install @carbon/pictograms-react
```

```jsx
import { Analytics, Cloud, Security } from '@carbon/pictograms-react';

export function FeatureCard() {
  return (
    <article className="feature">
      <Analytics aria-label="Analytics" width={96} height={96} />
      <h3>Analytics that scale</h3>
    </article>
  );
}
```

Each export accepts standard SVG props (`width`, `height`, `aria-label`, `className`). Color inherits from the parent text color via `currentColor`.

### Vanilla SVG via unpkg (zero-build, server-rendered HTML, emails, prototypes)

```html
<img
  src="https://unpkg.com/@carbon/pictograms/svg/analytics.svg"
  width="96" height="96"
  alt="" aria-hidden="true"
  style="color: var(--cds-text-primary);"
/>
```

When loaded as `<img>`, the SVG renders with its baked-in `currentColor` resolving to **the color of the surrounding text on the SVG itself**, not the page. To recolor, either:

- Inline the SVG (preferred for theming — see "Inlined examples" below), or
- Use a CSS mask: `background: var(--cds-text-primary); mask: url(...) center / contain no-repeat;`

### Web Components / vanilla projects

For projects already using `@carbon/web-components`, pictograms are **not** shipped as custom elements — embed the inline SVG directly or load via `<img>`/CSS mask.

---

## Color treatment

Carbon pictograms render in a **single color** by default and use `fill` (no explicit value → inherits `currentColor`). Set the color on a parent element and the pictogram follows:

```css
.feature {
  color: var(--cds-text-primary);  /* pictogram inherits this */
}

.feature--accent {
  color: var(--cds-link-primary);  /* pictogram now blue */
}
```

A subset of pictograms ship in **duo-tone variants** (e.g. `analytics--reference.svg` includes a secondary fill for emphasis). For these, the secondary fill is a literal hex (`#0f62fe` Carbon blue) — override via CSS by targeting the inline SVG paths directly:

```css
.duo-tone svg path[fill="#0f62fe"] {
  fill: var(--cds-link-primary);
}
```

For most cases, the single-color pictograms (used in this reference) are the safer default — they re-theme automatically across white, gray-10, gray-90, and gray-100.

---

## Sizing rules

| Size | Use case | Token-aligned |
|---|---|---|
| 32-48px | Inline with heading, sidebar nav, condensed empty state | 2x-3x of icon scale (16/20/24) |
| 64-80px | Feature card (3-col grid), section header | 4x-5x of icon scale |
| 96-128px | Hero illustration, full empty state, marketing splash | 6x-8x of icon scale |

Never render pictograms below 32px — the multi-stroke detail collapses and they read as broken icons. Above 128px, switch to a custom illustration or photography (pictograms are vector but not artistically scaled beyond their editorial range).

The fetched SVGs use `viewBox="0 0 32 32"` (Carbon authors at icon scale and lets the viewer scale up). Always set explicit `width` and `height` attributes — never rely on CSS-only sizing, because the intrinsic 32x32 will collapse the layout.

---

## Inlined pictogram examples

Twelve verbatim pictograms from `@carbon/pictograms` (Apache 2.0). Each example shows the SVG at a 96px display size; change `width`/`height` to fit context. The inner paths are **unmodified** from upstream — we only re-wrap with our own `<svg>` tag so `fill="currentColor"` is explicit and the `aria-*` defaults are sane.

### analytics

```html
<!-- analytics — source: @carbon/pictograms/svg/analytics.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M29,30.36c-0.625,0-1.153-0.425-1.312-1H17.312c-0.158,0.575-0.686,1-1.312,1c-0.75,0-1.36-0.61-1.36-1.36c0-0.244,0.065-0.475,0.178-0.673L9.5,23.009l-5.318,5.318C4.295,28.525,4.36,28.756,4.36,29c0,0.75-0.61,1.36-1.36,1.36S1.64,29.75,1.64,29S2.25,27.64,3,27.64c0.245,0,0.474,0.065,0.673,0.179L8.991,22.5l-5.318-5.318C3.474,17.295,3.245,17.36,3,17.36c-0.75,0-1.36-0.61-1.36-1.36S2.25,14.64,3,14.64c0.245,0,0.474,0.065,0.673,0.178L14.818,3.673C14.705,3.474,14.64,3.245,14.64,3c0-0.75,0.61-1.36,1.36-1.36S17.36,2.25,17.36,3c0,0.245-0.065,0.474-0.179,0.673l11.146,11.146c0.198-0.113,0.429-0.178,0.673-0.178c0.75,0,1.36,0.61,1.36,1.36s-0.61,1.36-1.36,1.36c-0.625,0-1.153-0.425-1.312-1H17.312c-0.158,0.576-0.686,1-1.312,1c-0.245,0-0.474-0.065-0.673-0.179L10.009,22.5l5.318,5.318c0.199-0.113,0.428-0.179,0.673-0.179c0.625,0,1.153,0.425,1.312,1h10.377c0.158-0.575,0.687-1,1.312-1c0.75,0,1.36,0.61,1.36,1.36S29.75,30.36,29,30.36z M29,28.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S29.353,28.36,29,28.36z M16,28.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S16.353,28.36,16,28.36z M3,28.36c-0.353,0-0.64,0.287-0.64,0.64S2.647,29.64,3,29.64S3.64,29.353,3.64,29S3.353,28.36,3,28.36z M4.182,16.673L9.5,21.991l5.318-5.318C14.705,16.474,14.64,16.245,14.64,16c0-0.75,0.61-1.36,1.36-1.36c0.625,0,1.153,0.424,1.312,1h10.377c0.03-0.11,0.074-0.215,0.13-0.313L16.673,4.182c-0.397,0.227-0.948,0.227-1.346,0L4.182,15.327C4.295,15.526,4.36,15.755,4.36,16C4.36,16.245,4.295,16.474,4.182,16.673z M29,15.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S29.353,15.36,29,15.36z M16,15.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S16.353,15.36,16,15.36z M3,15.36c-0.353,0-0.64,0.287-0.64,0.64S2.647,16.64,3,16.64S3.64,16.353,3.64,16S3.353,15.36,3,15.36z M16,2.36c-0.353,0-0.64,0.287-0.64,0.64S15.647,3.64,16,3.64c0.353,0,0.64-0.287,0.64-0.64S16.353,2.36,16,2.36z M29,4.36c-0.75,0-1.36-0.61-1.36-1.36S28.25,1.64,29,1.64S30.36,2.25,30.36,3S29.75,4.36,29,4.36z M29,2.36c-0.353,0-0.64,0.287-0.64,0.64S28.647,3.64,29,3.64S29.64,3.353,29.64,3S29.353,2.36,29,2.36z M3,4.36C2.25,4.36,1.64,3.75,1.64,3S2.25,1.64,3,1.64S4.36,2.25,4.36,3S3.75,4.36,3,4.36z M3,2.36C2.647,2.36,2.36,2.647,2.36,3S2.647,3.64,3,3.64S3.64,3.353,3.64,3S3.353,2.36,3,2.36z"/>
</svg>
```

### data (substituted: `data--management.svg`)

```html
<!-- data — source: @carbon/pictograms/svg/data--management.svg (no plain `data.svg` in catalog) -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M29,31.36h-2c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C29.36,31.199,29.199,31.36,29,31.36z M27.36,30.64h1.279v-1.28H27.36V30.64z M17,31.36h-2c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C17.36,31.199,17.199,31.36,17,31.36z M15.36,30.64h1.28v-1.28h-1.28V30.64z M5,31.36H3c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C5.36,31.199,5.199,31.36,5,31.36z M3.36,30.64h1.28v-1.28H3.36V30.64z M22.36,31h-0.72V1h0.721L22.36,31L22.36,31z M10.36,31H9.64V1h0.72C10.36,1,10.36,31,10.36,31z M17,24.36h-2c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C17.36,24.199,17.199,24.36,17,24.36z M15.36,23.64h1.28v-1.28h-1.28V23.64z M5,24.36H3c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C5.36,24.199,5.199,24.36,5,24.36z M3.36,23.64h1.28v-1.28H3.36V23.64z M29,17.36h-2c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C29.36,17.199,29.199,17.36,29,17.36z M27.36,16.64h1.279v-1.28H27.36V16.64z M17,17.36h-2c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C17.36,17.199,17.199,17.36,17,17.36z M15.36,16.64h1.28v-1.28h-1.28V16.64z M5,17.36H3c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C5.36,17.199,5.199,17.36,5,17.36z M3.36,16.64h1.28v-1.28H3.36V16.64z M29,10.36h-2c-0.199,0-0.36-0.161-0.36-0.36V8c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C29.36,10.199,29.199,10.36,29,10.36z M27.36,9.64h1.279V8.36H27.36V9.64z M17,10.36h-2c-0.199,0-0.36-0.161-0.36-0.36V8c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C17.36,10.199,17.199,10.36,17,10.36z M15.36,9.64h1.28V8.36h-1.28V9.64z M29,3.36h-2c-0.199,0-0.36-0.161-0.36-0.36V1c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C29.36,3.199,29.199,3.36,29,3.36z M27.36,2.64h1.279V1.36H27.36V2.64z M5,3.36H3C2.801,3.36,2.64,3.199,2.64,3V1c0-0.199,0.161-0.36,0.36-0.36h2c0.199,0,0.36,0.161,0.36,0.36v2C5.36,3.199,5.199,3.36,5,3.36z M3.36,2.64h1.28V1.36H3.36V2.64z"/>
</svg>
```

### cloud

```html
<!-- cloud — source: @carbon/pictograms/svg/cloud.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M24,27.36H10c-5.161,0-9.36-4.199-9.36-9.36S4.839,8.64,10,8.64c0.483,0,0.984,0.042,1.493,0.125C13.092,6.776,15.452,5.64,18,5.64c4.278,0,7.804,3.152,8.298,7.372C29.29,13.996,31.36,16.834,31.36,20C31.36,24.059,28.059,27.36,24,27.36z M10,9.36c-4.764,0-8.64,3.876-8.64,8.64s3.876,8.64,8.64,8.64h14c3.661,0,6.64-2.979,6.64-6.64c0-2.929-1.964-5.548-4.776-6.369c-0.143-0.042-0.245-0.166-0.258-0.314C25.253,9.351,21.983,6.36,18,6.36c-2.395,0-4.608,1.099-6.071,3.016c-0.083,0.108-0.219,0.16-0.352,0.136C11.03,9.41,10.514,9.36,10,9.36z"/>
</svg>
```

### security

```html
<!-- security — source: @carbon/pictograms/svg/security.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M16,31.36C9.842,31.36,4.64,26.158,4.64,20V6.786L16,0.59l11.36,6.196V20C27.36,26.158,22.158,31.36,16,31.36z M5.36,7.214V20c0,5.768,4.873,10.64,10.64,10.64S26.64,25.768,26.64,20V7.214L16,1.41L5.36,7.214z"/>
</svg>
```

### ai

```html
<!-- ai — source: @carbon/pictograms/svg/ai.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M16.195,31.36c-6.421,0-12.169-4.007-14.399-10.002C1.051,21.408,0.373,20.771,0.372,20c0-0.75,0.61-1.36,1.36-1.36s1.36,0.61,1.36,1.36c0,0.474-0.243,0.892-0.611,1.135c2.133,5.698,7.604,9.505,13.714,9.505c6.446,0,11.919-4.301,13.773-10.22c-1.448,2.06-3.877,3.44-6.565,3.44c-3.822,0-7.066-2.785-7.664-6.525C15.113,17.212,14.64,16.661,14.64,16c0-0.584,0.37-1.083,0.888-1.275c-0.608-3.421-3.615-5.962-7.125-5.962c-3.947,0-7.04,3.176-7.042,7.231c0,0.002,0,0.004,0,0.006H0.64c0-0.002,0-0.004,0-0.007C0.644,7.526,7.445,0.64,15.805,0.64c6.42,0,12.168,4.006,14.399,10.001c0.777-0.034,1.425,0.587,1.425,1.358c0,0.75-0.61,1.36-1.36,1.36s-1.36-0.61-1.36-1.36c0-0.473,0.243-0.891,0.611-1.135C27.387,5.166,21.916,1.36,15.805,1.36c-6.319,0-11.704,4.134-13.659,9.873c1.402-1.949,3.662-3.19,6.256-3.19c3.881,0,7.204,2.826,7.846,6.62C16.88,14.779,17.36,15.335,17.36,16c0,0.589-0.376,1.092-0.901,1.28c0.567,3.363,3.496,5.859,6.943,5.859c3.857,0,7.127-3.118,7.235-6.851c0.001-0.096,0.002-0.192,0.002-0.289h0.721c0,0.033,0,0.065-0.001,0.098h0.001c0,0.069-0.001,0.138-0.003,0.207C31.196,24.634,24.456,31.36,16.195,31.36z M1.732,19.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S2.085,19.36,1.732,19.36z M16,15.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S16.353,15.36,16,15.36z M30.269,11.36c-0.353,0-0.64,0.287-0.64,0.64s0.287,0.64,0.64,0.64s0.64-0.287,0.64-0.64S30.621,11.36,30.269,11.36z"/>
</svg>
```

### automation (substituted: `automation--software.svg`)

```html
<!-- automation — source: @carbon/pictograms/svg/automation--software.svg (no plain `automation.svg` in catalog) -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M16.001,31.86c-0.062,0-0.124-0.017-0.18-0.049l-1.001-0.577c-0.112-0.063-0.18-0.183-0.18-0.312v-1.155c0-0.129,0.068-0.248,0.18-0.312l1.001-0.577c0.111-0.064,0.249-0.064,0.36,0l0.815,0.472l7.818-4.66l0.369,0.619l-7.824,4.662v0.951c0,0.129-0.069,0.247-0.181,0.312l-0.998,0.577C16.126,31.844,16.063,31.86,16.001,31.86z M15.36,30.715l0.641,0.369l0.639-0.369v-0.739l-0.639-0.369l-0.641,0.369V30.715z M12.813,28.902l-7.817-4.751l-0.814,0.47c-0.111,0.064-0.249,0.064-0.36,0L2.82,24.044c-0.112-0.063-0.18-0.183-0.18-0.312v-1.155c0-0.129,0.068-0.248,0.18-0.312l1.001-0.577c0.111-0.064,0.249-0.064,0.36,0l0.999,0.577c0.111,0.064,0.18,0.183,0.18,0.312v0.953l7.827,4.757L12.813,28.902z M3.36,23.524l0.641,0.369l0.639-0.369v-0.739l-0.639-0.369L3.36,22.785V23.524z M28.001,24.67c-0.062,0-0.124-0.017-0.18-0.049l-1.001-0.577c-0.111-0.063-0.181-0.183-0.181-0.312v-1.155c0-0.129,0.069-0.248,0.181-0.312l0.82-0.474L27.637,12h0.721l0.004,9.792l0.818,0.474c0.111,0.064,0.181,0.183,0.181,0.312v1.155c0,0.129-0.069,0.247-0.181,0.312l-0.999,0.577C28.125,24.653,28.063,24.67,28.001,24.67z M27.36,23.524l0.641,0.369l0.639-0.369v-0.739l-0.639-0.369l-0.641,0.369V23.524z M16,22.36c-0.064,0-0.128-0.018-0.185-0.052l-2.5-1.5l0.37-0.617l2.314,1.389l3.641-2.206v-0.951c0-0.129,0.069-0.248,0.181-0.312l1.001-0.577c0.111-0.064,0.248-0.064,0.359,0l0.999,0.577c0.111,0.064,0.181,0.183,0.181,0.312v1.154c0,0.129-0.069,0.247-0.181,0.312l-0.999,0.577c-0.111,0.064-0.248,0.064-0.359,0l-0.816-0.471l-3.818,2.312C16.129,22.343,16.064,22.36,16,22.36z M20.36,19.369l0.641,0.369l0.639-0.369v-0.738l-0.639-0.369l-0.641,0.369V19.369z M11.001,20.515c-0.062,0-0.124-0.017-0.18-0.049L9.82,19.889c-0.112-0.063-0.18-0.183-0.18-0.312v-1.154c0-0.129,0.068-0.248,0.18-0.312l0.821-0.474L10.64,13c0-0.126,0.066-0.244,0.175-0.309l2.5-1.5l0.37,0.617l-2.325,1.395l0.001,4.434l0.819,0.474c0.111,0.064,0.18,0.183,0.18,0.312v1.154c0,0.129-0.068,0.247-0.18,0.312l-0.999,0.577C11.126,20.498,11.063,20.515,11.001,20.515z M10.36,19.369l0.641,0.369l0.639-0.369v-0.738l-0.639-0.369l-0.641,0.369V19.369z M4.358,20h-0.72l0.003-9.792L2.82,9.735C2.708,9.67,2.64,9.552,2.64,9.423V8.268c0-0.129,0.068-0.248,0.18-0.312l1.001-0.578c0.111-0.064,0.249-0.064,0.36,0L5.18,7.957C5.292,8.021,5.36,8.14,5.36,8.268v1.155c0,0.128-0.068,0.248-0.18,0.312l-0.819,0.474L4.358,20z M3.36,9.215l0.641,0.37l0.639-0.37v-0.74l-0.639-0.37L3.36,8.476V9.215z M21.36,16h-0.72v-2.797l-3.644-2.207l-0.815,0.471c-0.111,0.064-0.249,0.064-0.36,0l-1-0.578c-0.111-0.064-0.18-0.183-0.18-0.312V9.423c0-0.128,0.068-0.248,0.18-0.312l1-0.578c0.111-0.064,0.249-0.064,0.36,0l1,0.578c0.111,0.064,0.181,0.183,0.181,0.312v0.952l3.826,2.317c0.107,0.065,0.174,0.182,0.174,0.308v3H21.36z M15.36,10.369l0.64,0.37l0.64-0.37V9.631L16,9.261l-0.64,0.37V10.369z M28.001,10.36c-0.062,0-0.124-0.016-0.18-0.048L26.82,9.735c-0.111-0.065-0.18-0.183-0.18-0.312V8.471l-7.826-4.758l0.373-0.615l7.818,4.752l0.816-0.471c0.111-0.063,0.247-0.064,0.36,0l0.999,0.578c0.11,0.064,0.18,0.183,0.18,0.312v1.155c0,0.128-0.069,0.248-0.181,0.312l-0.999,0.577C28.125,10.344,28.063,10.36,28.001,10.36z M27.36,9.215l0.641,0.37l0.639-0.37V8.476l-0.639-0.37l-0.641,0.37V9.215z M7.184,7.309L6.816,6.691l7.824-4.664v-0.95c0-0.129,0.068-0.248,0.18-0.312l1.001-0.577c0.111-0.063,0.249-0.064,0.36,0l0.998,0.577c0.111,0.064,0.181,0.183,0.181,0.312v1.155c0,0.128-0.069,0.247-0.18,0.312l-0.999,0.578c-0.111,0.065-0.248,0.064-0.36,0L15.002,2.65L7.184,7.309z M15.36,2.024l0.641,0.37l0.639-0.37v-0.74l-0.639-0.369l-0.641,0.37V2.024z"/>
</svg>
```

### sustainability

```html
<!-- sustainability — source: @carbon/pictograms/svg/sustainability.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <g>
    <path d="M4.254,31.255l-0.509-0.51l2.918-2.909c0.213-2.925,2.644-5.196,5.595-5.196H20c0.721,0,1.313,0.564,1.357,1.274c0.008,0.028,0.012,0.058,0.012,0.088c0,0.065-0.003,0.13-0.009,0.194l4.999-4.062c0.663-0.666,1.79-0.667,2.48,0.024c0.692,0.692,0.691,1.818,0.001,2.51l-6.102,6.102c-0.369,0.369-0.857,0.607-1.375,0.672l-7.197,0.899l-0.913,0.913l-0.509-0.51l1-1c0.057-0.057,0.13-0.093,0.21-0.103l7.32-0.915c0.359-0.044,0.698-0.21,0.954-0.467l6.102-6.102c0.411-0.41,0.411-1.079,0-1.491c-0.411-0.411-1.081-0.41-1.49,0.001l-6.272,5.099C20.15,26.136,19.601,26.36,19,26.36h-5V25.64h5c0.396,0,0.76-0.14,1.045-0.371l-0.001-0.002l0.062-0.052c0.317-0.285,0.522-0.691,0.541-1.145c-0.005-0.022-0.008-0.046-0.008-0.07c0-0.353-0.287-0.64-0.64-0.64h-7.741c-2.614,0-4.759,2.043-4.885,4.651c-0.004,0.089-0.042,0.174-0.105,0.237L4.254,31.255z M16.36,11.36H19c4.127,0,7.36-3.233,7.36-7.36V1c0-0.199-0.161-0.36-0.36-0.36h-3c-4.053,0-7.244,3.117-7.357,7.138C14.468,5.309,11.965,3.64,9,3.64H6C5.801,3.64,5.64,3.801,5.64,4v3c0,4.127,3.233,7.36,7.36,7.36h2.64V21h0.72V11.36z M9,4.36c3.723,0,6.64,2.917,6.64,6.64v2.131l-5.386-5.385L9.746,8.254l5.385,5.386H13c-3.723,0-6.64-2.917-6.64-6.64V4.36H9z M22.255,5.254l-0.51-0.509l-5.385,5.385V8c0-3.723,2.917-6.64,6.64-6.64h2.64V4c0,3.723-2.916,6.64-6.64,6.64h-2.131L22.255,5.254z"/>
  </g>
</svg>
```

### accessibility

```html
<!-- accessibility — source: @carbon/pictograms/svg/accessibility.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M16,31.36C7.53,31.36,0.64,24.47,0.64,16S7.53,0.64,16,0.64S31.36,7.53,31.36,16S24.47,31.36,16,31.36z M16,1.36C7.927,1.36,1.36,7.927,1.36,16c0,8.072,6.567,14.64,14.64,14.64c8.072,0,14.64-6.567,14.64-14.64S24.072,1.36,16,1.36z M9.498,26.859c-0.23,0-0.464-0.059-0.677-0.182c-0.649-0.375-0.873-1.208-0.499-1.857l5.318-9.167c0-0.504,0-2.883,0-3.795c-0.96-0.001-3.71,0-5.64,0.002c-0.75,0-1.36-0.61-1.36-1.36S7.25,9.14,8,9.14h16c0.75,0,1.36,0.61,1.36,1.36s-0.61,1.36-1.36,1.36h-5.64v3.793l5.317,9.166c0.374,0.65,0.151,1.484-0.498,1.858c-0.647,0.375-1.483,0.151-1.857-0.498l-4.55-7.874c-0.323-0.559-1.223-0.558-1.545-0.001l-4.55,7.875C10.426,26.615,9.968,26.859,9.498,26.859z M11.114,11.137c3.032,0,3.051,0.019,3.141,0.108c0.067,0.068,0.105,0.159,0.105,0.255c0,4.283,0,4.283-0.007,4.321c-0.008,0.039-0.022,0.076-0.042,0.11l-5.366,9.25c-0.176,0.305-0.071,0.697,0.235,0.874c0.305,0.175,0.697,0.07,0.875-0.234l4.55-7.875C14.896,17.44,15.417,17.14,16,17.14l0,0c0.582,0,1.104,0.301,1.396,0.805v0.001l4.55,7.875c0.177,0.305,0.57,0.411,0.875,0.233c0.305-0.176,0.41-0.568,0.233-0.874l-5.365-9.249c-0.031-0.055-0.049-0.117-0.049-0.181V11.5c0-0.199,0.161-0.36,0.36-0.36h6c0.353,0,0.64-0.287,0.64-0.64S24.353,9.86,24,9.86H8c-0.353,0-0.64,0.287-0.64,0.64S7.647,11.14,8,11.14C9.29,11.138,10.308,11.137,11.114,11.137z M16,8.36c-1.301,0-2.36-1.059-2.36-2.36S14.699,3.64,16,3.64c1.302,0,2.36,1.059,2.36,2.36S17.302,8.36,16,8.36z M16,4.36c-0.904,0-1.64,0.736-1.64,1.64S15.096,7.64,16,7.64c0.904,0,1.64-0.736,1.64-1.64S16.904,4.36,16,4.36z"/>
</svg>
```

### network

```html
<!-- network — source: @carbon/pictograms/svg/network.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M22,29.253c-1.455,0-2.66-1.093-2.838-2.5h-6.325c-0.178,1.407-1.382,2.5-2.837,2.5c-1.577,0-2.86-1.283-2.86-2.86c0-0.928,0.444-1.753,1.13-2.276l-3.164-5.479C4.766,18.78,4.392,18.86,4,18.86c-1.577,0-2.86-1.283-2.86-2.86S2.423,13.14,4,13.14c0.392,0,0.766,0.079,1.106,0.223L8.27,7.884C7.583,7.361,7.14,6.535,7.14,5.608c0-1.577,1.283-2.86,2.86-2.86c1.455,0,2.66,1.092,2.837,2.5h6.326c0.178-1.408,1.382-2.5,2.837-2.5c1.577,0,2.86,1.283,2.86,2.86c0,0.927-0.444,1.753-1.13,2.276l3.162,5.479c0.341-0.144,0.715-0.223,1.107-0.223c1.577,0,2.86,1.283,2.86,2.86s-1.283,2.86-2.86,2.86c-0.393,0-0.767-0.08-1.107-0.224l-3.163,5.479c0.687,0.523,1.131,1.349,1.131,2.276C24.86,27.97,23.577,29.253,22,29.253z M22,24.253c-1.18,0-2.14,0.96-2.14,2.14s0.96,2.14,2.14,2.14s2.14-0.96,2.14-2.14S23.18,24.253,22,24.253z M10,24.253c-1.18,0-2.14,0.96-2.14,2.14s0.96,2.14,2.14,2.14s2.14-0.96,2.14-2.14S11.18,24.253,10,24.253z M12.837,26.032h6.325c0.099-0.779,0.512-1.462,1.108-1.916l-2.479-4.292h-3.584l-2.478,4.292C12.326,24.57,12.739,25.253,12.837,26.032z M5.729,18.276l3.164,5.479c0.681-0.287,1.532-0.287,2.214,0l2.478-4.292l-1.792-3.104H6.837C6.739,17.14,6.326,17.822,5.729,18.276z M22,23.532c0.393,0,0.767,0.08,1.107,0.224l3.163-5.479c-0.597-0.454-1.01-1.137-1.108-1.917h-4.954l-1.792,3.104l2.478,4.292C21.233,23.612,21.607,23.532,22,23.532z M14.208,19.104h3.584L19.584,16l-1.792-3.104h-3.584L12.416,16L14.208,19.104z M28,13.86c-1.18,0-2.14,0.96-2.14,2.14s0.96,2.14,2.14,2.14s2.14-0.96,2.14-2.14C30.14,14.82,29.18,13.86,28,13.86z M4,13.86c-1.18,0-2.14,0.96-2.14,2.14S2.82,18.14,4,18.14S6.14,17.18,6.14,16S5.18,13.86,4,13.86z M20.208,15.64h4.954c0.099-0.779,0.512-1.462,1.108-1.916l-3.163-5.479c-0.682,0.287-1.534,0.287-2.214,0l-2.478,4.291L20.208,15.64z M6.837,15.64h4.955l1.792-3.104l-2.478-4.291c-0.682,0.287-1.533,0.287-2.214,0l-3.163,5.479C6.326,14.178,6.739,14.861,6.837,15.64z M14.208,12.176h3.584l2.479-4.292c-0.597-0.455-1.01-1.137-1.108-1.917h-6.325c-0.098,0.78-0.511,1.462-1.107,1.917L14.208,12.176z M22,3.468c-1.18,0-2.14,0.96-2.14,2.14s0.96,2.14,2.14,2.14s2.14-0.96,2.14-2.14S23.18,3.468,22,3.468z M10,3.468c-1.18,0-2.14,0.96-2.14,2.14s0.96,2.14,2.14,2.14s2.14-0.96,2.14-2.14S11.18,3.468,10,3.468z"/>
</svg>
```

### devices (substituted: `connected--devices.svg`)

```html
<!-- devices — source: @carbon/pictograms/svg/connected--devices.svg (no plain `devices.svg` in catalog) -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M16,30.36c-7.381,0-13.59-5.684-14.281-13H1c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h0.719c0.691-7.317,6.9-13,14.281-13c7.382,0,13.59,5.683,14.28,13H31c0.199,0,0.36,0.161,0.36,0.36v2c0,0.199-0.161,0.36-0.36,0.36h-0.72C29.59,24.677,23.382,30.36,16,30.36z M3.094,20.37c1.835,5.402,6.972,9.27,12.906,9.27c6.988,0,12.869-5.363,13.558-12.279H29c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h0.558C28.869,7.723,22.988,2.36,16,2.36c-5.934,0-11.071,3.868-12.906,9.271C4.447,9.809,6.615,8.64,9,8.64c1.256,0,2.452,0.324,3.5,0.897C13.548,8.964,14.744,8.64,16,8.64c3.527,0,6.58,2.558,7.227,6H24c0.199,0,0.36,0.161,0.36,0.36v2c0,0.199-0.161,0.36-0.36,0.36h-0.773c-0.646,3.441-3.699,6-7.227,6c-1.256,0-2.452-0.324-3.5-0.897c-1.048,0.573-2.244,0.897-3.5,0.897C6.615,23.36,4.447,22.19,3.094,20.37z M13.213,22.019c0.853,0.399,1.799,0.621,2.787,0.621c3.136,0,5.856-2.242,6.492-5.279H22c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h0.492C21.856,11.602,19.136,9.36,16,9.36c-0.987,0-1.934,0.222-2.786,0.622c1.533,1.079,2.65,2.73,3.012,4.659H17c0.199,0,0.36,0.161,0.36,0.36v2c0,0.199-0.161,0.36-0.36,0.36h-0.774C15.864,19.289,14.747,20.939,13.213,22.019z M2.508,17.36C3.143,20.397,5.863,22.64,9,22.64c0.987,0,1.934-0.222,2.787-0.621c-1.534-1.079-2.65-2.729-3.012-4.658H8c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h0.774c0.361-1.929,1.479-3.58,3.012-4.659C10.934,9.582,9.987,9.36,9,9.36c-3.137,0-5.857,2.242-6.492,5.28H3c0.199,0,0.36,0.161,0.36,0.36v2c0,0.199-0.161,0.36-0.36,0.36H2.508z M9.508,17.36C9.886,19.165,11,20.69,12.5,21.63c1.5-0.939,2.614-2.465,2.992-4.27H15c-0.199,0-0.36-0.161-0.36-0.36v-2c0-0.199,0.161-0.36,0.36-0.36h0.492C15.114,12.834,14,11.31,12.5,10.37c-1.5,0.939-2.614,2.464-2.992,4.27H10c0.199,0,0.36,0.161,0.36,0.36v2c0,0.199-0.161,0.36-0.36,0.36H9.508z M29.36,16.64h1.279v-1.28H29.36V16.64z M22.36,16.64h1.279v-1.28H22.36V16.64z M15.36,16.64h1.28v-1.28h-1.28V16.64z M8.36,16.64h1.28v-1.28H8.36V16.64z M1.36,16.64h1.28v-1.28H1.36V16.64z"/>
</svg>
```

### integration

```html
<!-- integration — source: @carbon/pictograms/svg/integration.svg -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M23.5,29.36h-15c-0.129,0-0.248-0.069-0.312-0.181l-7.5-13.01c-0.064-0.111-0.064-0.249,0-0.36l7.5-12.99C8.252,2.708,8.372,2.64,8.5,2.64h15c0.129,0,0.247,0.068,0.312,0.18l7.5,12.99c0.064,0.111,0.064,0.249,0,0.36l-7.5,13.01C23.748,29.291,23.629,29.36,23.5,29.36z M9.124,28.64h13.753L16,16.72L9.124,28.64z M16.618,16.35L23.5,28.279l6.877-11.929C30.377,16.35,16.618,16.35,16.618,16.35z M1.623,16.35L8.5,28.279l6.882-11.929C15.382,16.35,1.623,16.35,1.623,16.35z M16.629,15.63h13.747L23.5,3.72L16.629,15.63z M1.624,15.63h13.748L8.5,3.72L1.624,15.63z M9.124,3.36L16,15.28l6.877-11.92C22.877,3.36,9.124,3.36,9.124,3.36z"/>
</svg>
```

### transformation (substituted: `transform--01.svg`)

```html
<!-- transformation — source: @carbon/pictograms/svg/transform--01.svg (no plain `transformation.svg` in catalog) -->
<svg width="96" height="96" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true" xmlns="http://www.w3.org/2000/svg">
  <path d="M13,31.36H1c-0.199,0-0.36-0.161-0.36-0.36V19c0-0.199,0.161-0.36,0.36-0.36h12c0.199,0,0.36,0.161,0.36,0.36v12C13.36,31.199,13.199,31.36,13,31.36z M1.36,30.64h11.28V19.36H1.36V30.64z M25,20.528c-0.139,0-0.271-0.081-0.33-0.216c-0.079-0.183,0.004-0.395,0.186-0.475c3.514-1.535,5.784-5.004,5.784-8.838c0-5.315-4.324-9.64-9.64-9.64c-3.833,0-7.303,2.271-8.838,5.784c-0.081,0.182-0.293,0.265-0.474,0.186c-0.182-0.08-0.266-0.292-0.186-0.474C13.152,3.08,16.88,0.64,21,0.64c5.713,0,10.36,4.647,10.36,10.36c0,4.12-2.44,7.849-6.216,9.498C25.098,20.519,25.048,20.528,25,20.528z M7.36,16.99c0-0.199-0.161-0.36-0.36-0.36s-0.36,0.161-0.36,0.36V17c0,0.199,0.161,0.355,0.36,0.355S7.36,17.189,7.36,16.99z M17.089,25.36h-0.021c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.36,0.36-0.36c0.199,0,0.37,0.161,0.37,0.36S17.288,25.36,17.089,25.36z M19.122,25.36h-0.021c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.36,0.36-0.36c0.199,0,0.37,0.161,0.37,0.36S19.321,25.36,19.122,25.36z M21.042,24.797c-0.132,0-0.259-0.073-0.322-0.199c-0.089-0.178-0.017-0.395,0.161-0.483c0.163-0.11,0.377-0.062,0.489,0.106c0.109,0.165,0.055,0.395-0.111,0.505c-0.012,0.008-0.042,0.026-0.056,0.033C21.151,24.784,21.097,24.797,21.042,24.797z M22.459,23.363c-0.069,0-0.139-0.02-0.199-0.061c-0.166-0.11-0.211-0.334-0.101-0.499c0.089-0.18,0.302-0.238,0.477-0.151c0.178,0.09,0.244,0.316,0.155,0.494c-0.007,0.014-0.024,0.044-0.032,0.056C22.689,23.307,22.575,23.363,22.459,23.363z M23,21.421c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.37,0.36-0.37s0.36,0.15,0.36,0.35v0.021C23.36,21.26,23.199,21.421,23,21.421z M23,19.382c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.37,0.36-0.37s0.36,0.151,0.36,0.351v0.02C23.36,19.221,23.199,19.382,23,19.382z M23,17.344c-0.199,0-0.36-0.161-0.36-0.36c0-0.199,0.161-0.37,0.36-0.37s0.36,0.151,0.36,0.35v0.02C23.36,17.183,23.199,17.344,23,17.344z M7,15.322c-0.199,0-0.36-0.151-0.36-0.35v-0.02c0-0.199,0.161-0.36,0.36-0.36s0.36,0.161,0.36,0.36S7.199,15.322,7,15.322z M23,15.305c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.37,0.36-0.37s0.36,0.151,0.36,0.35v0.02C23.36,15.144,23.199,15.305,23,15.305z M7,13.283c-0.004,0-0.009,0-0.013,0c-0.193-0.007-0.346-0.156-0.346-0.35c0-0.009,0-0.039,0.001-0.048c0.016-0.197,0.183-0.345,0.387-0.331c0.198,0.015,0.346,0.188,0.331,0.387C7.345,13.129,7.188,13.283,7,13.283z M7.542,11.342c-0.06,0-0.12-0.015-0.175-0.047c-0.172-0.1-0.235-0.312-0.135-0.483l0.01-0.018c0.101-0.171,0.323-0.229,0.492-0.129c0.172,0.1,0.23,0.321,0.13,0.492C7.797,11.273,7.67,11.342,7.542,11.342z M22.442,11.329c-0.127,0-0.251-0.068-0.316-0.188c-0.092-0.169-0.04-0.389,0.125-0.489c0.165-0.099,0.374-0.062,0.48,0.1c0.006,0.009,0.021,0.035,0.027,0.044c0.095,0.174,0.03,0.393-0.144,0.488C22.56,11.315,22.501,11.329,22.442,11.329z M21.014,9.907c-0.062,0-0.124-0.016-0.182-0.049c-0.172-0.1-0.238-0.326-0.138-0.498c0.1-0.171,0.311-0.235,0.483-0.135l0.018,0.01c0.172,0.1,0.229,0.321,0.129,0.493C21.258,9.843,21.137,9.907,21.014,9.907z M19.074,9.361c-0.008,0-0.017,0-0.025-0.001c-0.193-0.014-0.352-0.178-0.345-0.372c0.007-0.202,0.217-0.366,0.396-0.346c0.198,0.014,0.348,0.186,0.334,0.385C19.42,9.216,19.262,9.361,19.074,9.361z M17.035,9.36c-0.199,0-0.37-0.161-0.37-0.36s0.151-0.36,0.35-0.36h0.021c0.199,0,0.36,0.161,0.36,0.36S17.234,9.36,17.035,9.36z M14.997,9.36c-0.199,0-0.37-0.161-0.37-0.36s0.151-0.36,0.35-0.36h0.02c0.199,0,0.36,0.161,0.36,0.36S15.195,9.36,14.997,9.36z M12.958,9.36c-0.199,0-0.37-0.161-0.37-0.36s0.151-0.36,0.35-0.36h0.021c0.199,0,0.36,0.161,0.36,0.36S13.157,9.36,12.958,9.36z M15.37,25c0-0.199-0.167-0.36-0.365-0.36s-0.36,0.161-0.36,0.36s0.161,0.36,0.36,0.36h0.01C15.213,25.36,15.37,25.199,15.37,25z M10.905,9.36c-0.199,0-0.37-0.161-0.37-0.36s0.151-0.36,0.35-0.36h0.021c0.199,0,0.36,0.161,0.36,0.36S11.104,9.36,10.905,9.36z M8.978,9.92c-0.199,0-0.37-0.161-0.37-0.36S8.759,9.2,8.958,9.2h0.021c0.199,0,0.36,0.161,0.36,0.36S9.177,9.92,8.978,9.92z M23,13.294c-0.199,0-0.36-0.161-0.36-0.36s0.161-0.37,0.36-0.37s0.36,0.151,0.36,0.35v0.02C23.36,13.133,23.199,13.294,23,13.294z"/>
</svg>
```

---

## Substitutions (catalog mapping)

The Carbon catalog uses topical filenames; some short names don't exist as exact files. The mapping used above:

| Requested name | Actual file from `@carbon/pictograms` | Why |
|---|---|---|
| `analytics` | `analytics.svg` | exact match |
| `data` | `data--management.svg` | no plain `data.svg`; this is the most generic of the `data--*` family |
| `cloud` | `cloud.svg` | exact match |
| `security` | `security.svg` | exact match |
| `ai` | `ai.svg` | exact match |
| `automation` | `automation--software.svg` | no plain `automation.svg`; `--software` is the broadest of the `automation--*` family |
| `sustainability` | `sustainability.svg` | exact match |
| `accessibility` | `accessibility.svg` | exact match |
| `network` | `network.svg` | exact match |
| `devices` | `connected--devices.svg` | no plain `devices.svg`; this conveys the multi-device scene |
| `integration` | `integration.svg` | exact match |
| `transformation` | `transform--01.svg` | no `transformation.svg`; `transform--01` is the canonical scene |

When importing in React, use the corresponding PascalCase exports: `Analytics`, `DataManagement`, `Cloud`, `Security`, `Ai`, `AutomationSoftware`, `Sustainability`, `Accessibility`, `Network`, `ConnectedDevices`, `Integration`, `Transform01`.

---

## Accessibility

Pictograms are almost always **decorative** — the adjacent heading or body copy carries the meaning. In that case, hide them from assistive tech:

```html
<!-- Decorative (default) -->
<svg aria-hidden="true" focusable="false" ...>...</svg>

<!-- Or as <img> -->
<img src="..." alt="" aria-hidden="true" />
```

When a pictogram **is** the only label (rare — e.g. an icon-only feature link), promote it to an image with a name:

```html
<svg role="img" aria-label="Analytics" focusable="false" ...>
  <title>Analytics</title>
  <path .../>
</svg>
```

Rules:
- `focusable="false"` always — IE/Edge legacy still focuses SVGs without it, breaking tab order.
- `<title>` must be the **first** child of `<svg>` for AT to read it.
- Never combine `aria-hidden="true"` with `aria-label` — pick one role.
- If the pictogram is inside a link/button, label the parent instead and keep the SVG hidden:
  ```html
  <a href="/analytics" aria-label="Open analytics dashboard">
    <svg aria-hidden="true" ...>...</svg>
  </a>
  ```

---

## Composition with Carbon type and spacing

Pictograms sit on the same spacing grid as the rest of Carbon (`$spacing-*` tokens, 4px base). Recommended pairing inside a feature card:

```html
<article class="feature-card" style="
  padding: var(--cds-spacing-07);
  display: flex;
  flex-direction: column;
  gap: var(--cds-spacing-05);
  color: var(--cds-text-primary);
  background: var(--cds-layer-01);
  border-radius: 0;  /* Carbon: sharp corners */
">
  <svg width="64" height="64" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
    <!-- analytics path -->
  </svg>
  <h3 style="font: var(--cds-expressive-heading-04); margin: 0;">Analytics that scale</h3>
  <p style="font: var(--cds-body-02); margin: 0;">From first event to enterprise rollout — one pipeline, every team.</p>
</article>
```

Vertical rhythm: pictogram → 24px gap (`$spacing-05`) → heading → 16px gap → body → 32px gap → link/CTA.

---

## Do / Don't

| Do | Don't |
|---|---|
| Use pictograms in marketing feature sections (3-column grids), heroes, and empty states | Don't use pictograms in dense product UI — use `@carbon/icons` (16-24px) instead |
| Pair pictograms with `expressive-heading-*` and `body-02` type tokens | Don't pair with `productive-heading-*` (productive type is for app shells, not editorial) |
| Color the parent element and let pictograms inherit via `currentColor` | Don't hardcode `fill="#0f62fe"` on paths — it breaks theme switching across white/g10/g90/g100 |
| Render at 32-128px with explicit `width` and `height` attributes | Don't render below 32px (detail collapses) or above 128px (use real illustration/photography instead) |
| Always include `focusable="false"` and pick exactly one of `aria-hidden="true"` *or* `role="img" + aria-label` | Don't combine `aria-hidden` with `aria-label` — assistive tech ignores the label |
| Use `@carbon/pictograms` as the single source — pull the closest match if your concept isn't a 1:1 filename | Don't mix Carbon pictograms with custom illustrations or third-party icon sets in the same surface — visual language fragments |
| Keep pictograms monochrome (single `currentColor`) for reliable theming | Don't tint individual paths via inline `style` — use CSS custom properties instead |
| Load via `<img src="https://unpkg.com/@carbon/pictograms/svg/{name}.svg">` for prototypes and emails | Don't ship `<img>` pictograms when you need theme-aware recoloring — inline the SVG instead |
