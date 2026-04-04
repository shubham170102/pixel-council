---
name: editorial-type
description: M3 marketing/editorial typography scale — display headlines 88-45px extending beyond the UI scale, Overline labels, and responsive scaling for landing pages
metadata:
  tags: typography, editorial, marketing, display, headline, hero, landing page, material design, roboto
---

# Editorial Type -- Google Material Design 3 Marketing Typography

## Quick Reference

| Property | Value |
|----------|-------|
| Display XL | 88px / 400 / 96px / -0.5px tracking |
| Display L | 72px / 400 / 80px / -0.25px tracking |
| Display M | 57px / 400 / 64px / -0.25px tracking |
| Display S | 45px / 400 / 52px / 0px tracking |
| Headline L | 36px / 400 / 44px / 0px tracking |
| Headline M | 28px / 400 / 36px / 0px tracking |
| Headline S | 24px / 400 / 32px / 0px tracking |
| Title L | 22px / 400 / 28px / 0px tracking |
| Title M | 16px / 500 / 24px / 0.15px tracking |
| Body L | 16px / 400 / 24px / 0.5px tracking |
| Body M | 14px / 400 / 20px / 0.25px tracking |
| Body S | 12px / 400 / 16px / 0.4px tracking |
| Label L | 14px / 500 / 20px / 0.1px tracking |
| Label S | 11px / 500 / 16px / 0.5px tracking |
| Overline | 12px / 500 / 16px / 0.5px tracking (UPPERCASE) |
| Primary color (light) | #1D1B20 |
| Primary color (dark) | #E6E0E9 |
| CSS prefix | `.md-type` |

## Marketing Type Scale

| Style | Size | Weight | Line-Height | Letter-Spacing | Font | Use Case |
|-------|------|--------|-------------|----------------|------|----------|
| Display XL | 88px | 400 | 96px | -0.5px | Roboto | Hero headline (single line) |
| Display L | 72px | 400 | 80px | -0.25px | Roboto | Hero headline (multi-line) |
| Display M | 57px | 400 | 64px | -0.25px | Roboto | Section headlines |
| Display S | 45px | 400 | 52px | 0px | Roboto | Sub-section headlines |
| Headline L | 36px | 400 | 44px | 0px | Roboto | Feature titles |
| Headline M | 28px | 400 | 36px | 0px | Roboto | Card headlines |
| Headline S | 24px | 400 | 32px | 0px | Roboto | Component headers |
| Title L | 22px | 400 | 28px | 0px | Roboto | Emphasized body |
| Title M | 16px | 500 | 24px | 0.15px | Roboto | Section labels |
| Body L | 16px | 400 | 24px | 0.5px | Roboto | Intro paragraphs |
| Body M | 14px | 400 | 20px | 0.25px | Roboto | Standard body |
| Body S | 12px | 400 | 16px | 0.4px | Roboto | Secondary copy |
| Label L | 14px | 500 | 20px | 0.1px | Roboto | Button labels |
| Label S | 11px | 500 | 16px | 0.5px | Roboto | Captions |
| Overline | 12px | 500 | 16px | 0.5px | Roboto | Section labels (UPPERCASE) |

**Key rules**: Weight 400 for display/headline (lighter than Apple's 700). POSITIVE letter-spacing at small sizes (Body 0.25-0.5px) — opposite of Apple's negative. Only Display XL/L get negative letter-spacing. Overline = M3's eyebrow equivalent (uppercase, 500 weight, wide tracking). Font stack: `'Roboto', 'Noto Sans', 'Helvetica Neue', Arial, sans-serif`. Google Sans is used on Google's own properties; Roboto is the M3 default.

## Design Tokens

```css
:root {
  /* -- Scale: size / weight / line-height / letter-spacing -- */
  --md-type-display-xl-size: 88px;  --md-type-display-xl-weight: 400;
  --md-type-display-xl-line-height: 96px;  --md-type-display-xl-tracking: -0.5px;
  --md-type-display-l-size: 72px;  --md-type-display-l-weight: 400;
  --md-type-display-l-line-height: 80px;  --md-type-display-l-tracking: -0.25px;
  --md-type-display-m-size: 57px;  --md-type-display-m-weight: 400;
  --md-type-display-m-line-height: 64px;  --md-type-display-m-tracking: -0.25px;
  --md-type-display-s-size: 45px;  --md-type-display-s-weight: 400;
  --md-type-display-s-line-height: 52px;  --md-type-display-s-tracking: 0px;
  --md-type-headline-l-size: 36px;  --md-type-headline-l-weight: 400;
  --md-type-headline-l-line-height: 44px;  --md-type-headline-l-tracking: 0px;
  --md-type-headline-m-size: 28px;  --md-type-headline-m-weight: 400;
  --md-type-headline-m-line-height: 36px;  --md-type-headline-m-tracking: 0px;
  --md-type-headline-s-size: 24px;  --md-type-headline-s-weight: 400;
  --md-type-headline-s-line-height: 32px;  --md-type-headline-s-tracking: 0px;
  --md-type-title-l-size: 22px;  --md-type-title-l-weight: 400;
  --md-type-title-l-line-height: 28px;  --md-type-title-l-tracking: 0px;
  --md-type-title-m-size: 16px;  --md-type-title-m-weight: 500;
  --md-type-title-m-line-height: 24px;  --md-type-title-m-tracking: 0.15px;
  --md-type-body-l-size: 16px;  --md-type-body-l-weight: 400;
  --md-type-body-l-line-height: 24px;  --md-type-body-l-tracking: 0.5px;
  --md-type-body-m-size: 14px;  --md-type-body-m-weight: 400;
  --md-type-body-m-line-height: 20px;  --md-type-body-m-tracking: 0.25px;
  --md-type-body-s-size: 12px;  --md-type-body-s-weight: 400;
  --md-type-body-s-line-height: 16px;  --md-type-body-s-tracking: 0.4px;
  --md-type-label-l-size: 14px;  --md-type-label-l-weight: 500;
  --md-type-label-l-line-height: 20px;  --md-type-label-l-tracking: 0.1px;
  --md-type-label-s-size: 11px;  --md-type-label-s-weight: 500;
  --md-type-label-s-line-height: 16px;  --md-type-label-s-tracking: 0.5px;
  --md-type-overline-size: 12px;  --md-type-overline-weight: 500;
  --md-type-overline-line-height: 16px;  --md-type-overline-tracking: 0.5px;
  /* -- Color tokens -- */
  --md-type-color-on-surface: #1D1B20;
  --md-type-color-on-surface-variant: #49454F;
  --md-type-color-primary: #6750A4;
  --md-type-color-error: #B3261E;
  /* -- Font stack -- */
  --md-type-font: 'Roboto', 'Noto Sans', 'Helvetica Neue', Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --md-type-color-on-surface: #E6E0E9;
    --md-type-color-on-surface-variant: #CAC4D0;
    --md-type-color-primary: #D0BCFF;
    --md-type-color-error: #F2B8B5;
  }
}
.dark {
  --md-type-color-on-surface: #E6E0E9;
  --md-type-color-on-surface-variant: #CAC4D0;
  --md-type-color-primary: #D0BCFF;
  --md-type-color-error: #F2B8B5;
}
```

## HTML Structure

```html
<!-- Hero section pattern -->
<section class="hero">
  <p class="md-type md-type--overline">Introducing TaskFlow</p>
  <h1 class="md-type md-type--display-xl">Get more done.<br>With less effort.</h1>
  <p class="md-type md-type--body-l">
    A task management app built with Material Design 3.
  </p>
</section>

<!-- Section headline pattern -->
<section class="feature">
  <p class="md-type md-type--overline md-type--primary">Features</p>
  <h2 class="md-type md-type--display-m">Designed to keep you in flow.</h2>
  <p class="md-type md-type--body-l">
    Smart scheduling and gentle reminders that adapt to how you work.
  </p>
</section>

<!-- Card headline pattern -->
<div class="card">
  <h3 class="md-type md-type--headline-m">Instant sync</h3>
  <p class="md-type md-type--body-m md-type--variant">
    Changes appear on every device within seconds.
  </p>
</div>

<!-- Footer pattern -->
<footer>
  <p class="md-type md-type--label-s md-type--variant">
    * Sync times may vary by network conditions. Tested March 2026.
  </p>
</footer>
```

## Complete CSS

```css
/* ---- Base ---- */
.md-type {
  margin: 0;
  padding: 0;
  font-family: var(--md-type-font);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: var(--md-type-color-on-surface);
}

/* ---- Display Scale (45-88px) ---- */
.md-type--display-xl {
  font-size: var(--md-type-display-xl-size);  font-weight: var(--md-type-display-xl-weight);
  line-height: var(--md-type-display-xl-line-height);  letter-spacing: var(--md-type-display-xl-tracking);
}
.md-type--display-l {
  font-size: var(--md-type-display-l-size);  font-weight: var(--md-type-display-l-weight);
  line-height: var(--md-type-display-l-line-height);  letter-spacing: var(--md-type-display-l-tracking);
}
.md-type--display-m {
  font-size: var(--md-type-display-m-size);  font-weight: var(--md-type-display-m-weight);
  line-height: var(--md-type-display-m-line-height);  letter-spacing: var(--md-type-display-m-tracking);
}
.md-type--display-s {
  font-size: var(--md-type-display-s-size);  font-weight: var(--md-type-display-s-weight);
  line-height: var(--md-type-display-s-line-height);  letter-spacing: var(--md-type-display-s-tracking);
}

/* ---- Headline Scale (24-36px) ---- */
.md-type--headline-l {
  font-size: var(--md-type-headline-l-size);  font-weight: var(--md-type-headline-l-weight);
  line-height: var(--md-type-headline-l-line-height);  letter-spacing: var(--md-type-headline-l-tracking);
}
.md-type--headline-m {
  font-size: var(--md-type-headline-m-size);  font-weight: var(--md-type-headline-m-weight);
  line-height: var(--md-type-headline-m-line-height);  letter-spacing: var(--md-type-headline-m-tracking);
}
.md-type--headline-s {
  font-size: var(--md-type-headline-s-size);  font-weight: var(--md-type-headline-s-weight);
  line-height: var(--md-type-headline-s-line-height);  letter-spacing: var(--md-type-headline-s-tracking);
}

/* ---- Title Scale (16-22px) ---- */
.md-type--title-l {
  font-size: var(--md-type-title-l-size);  font-weight: var(--md-type-title-l-weight);
  line-height: var(--md-type-title-l-line-height);  letter-spacing: var(--md-type-title-l-tracking);
}
.md-type--title-m {
  font-size: var(--md-type-title-m-size);  font-weight: var(--md-type-title-m-weight);
  line-height: var(--md-type-title-m-line-height);  letter-spacing: var(--md-type-title-m-tracking);
}

/* ---- Body Scale (12-16px) ---- */
.md-type--body-l {
  font-size: var(--md-type-body-l-size);  font-weight: var(--md-type-body-l-weight);
  line-height: var(--md-type-body-l-line-height);  letter-spacing: var(--md-type-body-l-tracking);
}
.md-type--body-m {
  font-size: var(--md-type-body-m-size);  font-weight: var(--md-type-body-m-weight);
  line-height: var(--md-type-body-m-line-height);  letter-spacing: var(--md-type-body-m-tracking);
}
.md-type--body-s {
  font-size: var(--md-type-body-s-size);  font-weight: var(--md-type-body-s-weight);
  line-height: var(--md-type-body-s-line-height);  letter-spacing: var(--md-type-body-s-tracking);
}

/* ---- Label Scale (11-14px) ---- */
.md-type--label-l {
  font-size: var(--md-type-label-l-size);  font-weight: var(--md-type-label-l-weight);
  line-height: var(--md-type-label-l-line-height);  letter-spacing: var(--md-type-label-l-tracking);
}
.md-type--label-s {
  font-size: var(--md-type-label-s-size);  font-weight: var(--md-type-label-s-weight);
  line-height: var(--md-type-label-s-line-height);  letter-spacing: var(--md-type-label-s-tracking);
}

/* ---- Overline ---- */
.md-type--overline {
  font-size: var(--md-type-overline-size);  font-weight: var(--md-type-overline-weight);
  line-height: var(--md-type-overline-line-height);  letter-spacing: var(--md-type-overline-tracking);
  text-transform: uppercase;
}

/* ---- Color Modifiers ---- */
.md-type--variant { color: var(--md-type-color-on-surface-variant); }
.md-type--primary { color: var(--md-type-color-primary); }
.md-type--error { color: var(--md-type-color-error); }

/* ---- Responsive: Compact (<600px) ---- */
@media (max-width: 599px) {
  .md-type--display-xl { font-size: 45px; line-height: 52px; letter-spacing: 0px; }
  .md-type--display-l  { font-size: 36px; line-height: 44px; letter-spacing: 0px; }
  .md-type--display-m  { font-size: 32px; line-height: 40px; letter-spacing: 0px; }
  .md-type--display-s  { font-size: 28px; line-height: 36px; letter-spacing: 0px; }
  .md-type--headline-l { font-size: 28px; line-height: 36px; }
  .md-type--body-l     { font-size: 14px; line-height: 20px; }
}

/* ---- Responsive: Medium (600-839px) ---- */
@media (min-width: 600px) and (max-width: 839px) {
  .md-type--display-xl { font-size: 64px; line-height: 72px; letter-spacing: -0.25px; }
  .md-type--display-l  { font-size: 52px; line-height: 60px; letter-spacing: -0.25px; }
  .md-type--display-m  { font-size: 45px; line-height: 52px; letter-spacing: 0px; }
  .md-type--display-s  { font-size: 36px; line-height: 44px; letter-spacing: 0px; }
  .md-type--headline-l { font-size: 32px; line-height: 40px; }
  .md-type--body-l     { font-size: 16px; line-height: 24px; }
}
```

## States Reference

| Color Level | Light | Dark | Use Case |
|------------|-------|------|----------|
| On Surface | #1D1B20 | #E6E0E9 | Display headlines, body text |
| On Surface Variant | #49454F | #CAC4D0 | Subtitles, descriptions, secondary copy |
| Primary | #6750A4 | #D0BCFF | Accent overlines, linked text |
| Error | #B3261E | #F2B8B5 | Error messages, validation text |

## Animation & Motion

```css
.md-type--reveal {
  opacity: 0; transform: translateY(20px);
  transition: opacity 400ms cubic-bezier(0.2, 0.0, 0, 1.0),
              transform 400ms cubic-bezier(0.2, 0.0, 0, 1.0);
}
.md-type--reveal.is-visible { opacity: 1; transform: translateY(0); }
.md-type--reveal:nth-child(2) { transition-delay: 50ms; }
.md-type--reveal:nth-child(3) { transition-delay: 100ms; }

@media (prefers-reduced-motion: reduce) {
  .md-type--reveal { opacity: 1; transform: none; transition: none; }
}
```

## Accessibility

- **Semantic elements**: Use `<h1>`-`<h6>` for display/headline levels, `<p>` for body/label/overline. Screen readers use element semantics, not class names
- **Heading hierarchy**: One `<h1>` per page (Display XL or Display L). Section headlines use `<h2>`. Do not skip levels
- **Contrast**: On Surface text on surface backgrounds exceeds WCAG AA (4.5:1). On Surface Variant meets AA for large text (3:1 at 24px+)
- **Minimum size**: Body text minimum 12px (Body S). Label S at 11px is acceptable for non-essential captions only
- **Zoom**: Support 200% browser zoom. Use `max-width` on text containers so text reflows properly
- **Reduced motion**: Disable scroll-reveal transitions when `prefers-reduced-motion: reduce` is set

## Responsive Typography

Only levels that scale are shown. Title and below remain fixed across breakpoints.

| Scale | Compact (<600px) | Medium (600-839px) | Expanded (840px+) |
|-------|-----------------|-------------------|-------------------|
| Display XL | 45px | 64px | 88px |
| Display L | 36px | 52px | 72px |
| Display M | 32px | 45px | 57px |
| Display S | 28px | 36px | 45px |
| Headline L | 28px | 32px | 36px |
| Body L | 14px | 16px | 16px |

## Do / Don't

| Do | Don't |
|----|-------|
| Use weight 400 for display text — M3 is lighter than Apple | Use bold (700) on large display sizes — that is Apple's convention, not M3 |
| Use positive letter-spacing on body text (0.25-0.5px) | Use negative tracking on small sizes — M3 reserves that for display only |
| Extend to Display XL (88px) for marketing hero headlines | Cap at the UI scale maximum (57px) for page heroes — it looks undersized |
| Use Overline for section labels above headlines | Skip the Overline — it provides critical hierarchy context in M3 layouts |
| Keep Roboto as the base font throughout | Mix Roboto with serif fonts — M3 is a sans-serif system |
| Use 2-3 type levels per section maximum | Use all 15 levels on a single page — it creates visual noise |
| Decrease letter-spacing for display sizes (-0.5px at 88px) | Use positive letter-spacing on 88px text — it looks unnaturally wide |
| Maintain the M3 type ramp ratios between levels | Invent custom sizes outside the scale — stay within the defined ramp |
