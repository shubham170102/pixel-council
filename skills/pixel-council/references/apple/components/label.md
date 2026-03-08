---
name: label
description: Apple label — typography scale, dynamic type, text styles, icon+text, monospaced digits
metadata:
  tags: label, typography, text, heading, body, caption, footnote, dynamic type, font, title
---

# Label -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Font family | SF Pro Display (20px+), SF Pro Text (<20px) |
| Body size | 17px/22px, weight 400 |
| Headline | 17px/22px, weight 600 |
| Title 1 | 28px/34px, weight 400 |
| Large Title | 34px/41px, weight 700 |
| Primary color (light) | #000000 |
| Primary color (dark) | #FFFFFF |
| Secondary color (light) | rgba(60,60,67,0.6) |
| Secondary color (dark) | rgba(235,235,245,0.6) |
| CSS prefix | `.apple-label` |

## Design Tokens

```css
:root {
  --apple-label-primary: #000000;
  --apple-label-secondary: rgba(60, 60, 67, 0.6);
  --apple-label-tertiary: rgba(60, 60, 67, 0.3);
  --apple-label-quaternary: rgba(60, 60, 67, 0.18);
  --apple-label-tint: #007AFF;
  --apple-label-destructive: #FF3B30;
  --apple-label-green: #34C759;
  --apple-label-orange: #FF9500;
  --apple-label-font-display: -apple-system, BlinkMacSystemFont, 'SF Pro Display',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
  --apple-label-font-text: -apple-system, BlinkMacSystemFont, 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-label-primary: #FFFFFF;
    --apple-label-secondary: rgba(235, 235, 245, 0.6);
    --apple-label-tertiary: rgba(235, 235, 245, 0.3);
    --apple-label-quaternary: rgba(235, 235, 245, 0.16);
    --apple-label-tint: #0A84FF;
    --apple-label-destructive: #FF453A;
    --apple-label-green: #30D158;
    --apple-label-orange: #FF9F0A;
  }
}
.dark {
  --apple-label-primary: #FFFFFF;
  --apple-label-secondary: rgba(235, 235, 245, 0.6);
  --apple-label-tertiary: rgba(235, 235, 245, 0.3);
  --apple-label-quaternary: rgba(235, 235, 245, 0.16);
  --apple-label-tint: #0A84FF;
  --apple-label-destructive: #FF453A;
  --apple-label-green: #30D158;
  --apple-label-orange: #FF9F0A;
}
```

## Variants (iOS Type Scale)

| Style | Size | Weight | Leading | Letter-Spacing | Use Case |
|-------|------|--------|---------|----------------|----------|
| Large Title | 34px | 700 | 41px | 0.37px | Screen headings, hero text |
| Title 1 | 28px | 400 | 34px | 0.36px | Section titles |
| Title 2 | 22px | 400 | 28px | 0.35px | Sub-section titles |
| Title 3 | 20px | 400 | 25px | 0.38px | Card headers |
| Headline | 17px | 600 | 22px | -0.41px | Emphasized body text |
| Body | 17px | 400 | 22px | -0.41px | Main content |
| Callout | 16px | 400 | 21px | -0.32px | Descriptive text |
| Subheadline | 15px | 400 | 20px | -0.24px | Supplementary text |
| Footnote | 13px | 400 | 18px | -0.08px | Small print, timestamps |
| Caption 1 | 12px | 400 | 16px | 0px | Image captions |
| Caption 2 | 11px | 400 | 13px | 0.07px | Legal, fine print |

## HTML Structure

```html
<!-- Text Style Labels -->
<h1 class="apple-label apple-label--large-title">Large Title</h1>
<h2 class="apple-label apple-label--title1">Title 1</h2>
<h3 class="apple-label apple-label--title2">Title 2</h3>
<h4 class="apple-label apple-label--title3">Title 3</h4>
<p class="apple-label apple-label--headline">Headline</p>
<p class="apple-label apple-label--body">Body text</p>
<p class="apple-label apple-label--callout">Callout text</p>
<p class="apple-label apple-label--subheadline">Subheadline text</p>
<p class="apple-label apple-label--footnote">Footnote text</p>
<p class="apple-label apple-label--caption1">Caption 1</p>
<p class="apple-label apple-label--caption2">Caption 2</p>

<!-- Label with Icon -->
<span class="apple-label apple-label--body apple-label--icon">
  <svg class="apple-label__icon" width="20" height="20" aria-hidden="true"><!-- icon --></svg>
  <span>Label with icon</span>
</span>

<!-- Color variants -->
<span class="apple-label apple-label--body apple-label--secondary">Secondary text</span>
<span class="apple-label apple-label--body apple-label--tertiary">Tertiary text</span>
<span class="apple-label apple-label--body apple-label--tint">Tinted text</span>
<span class="apple-label apple-label--body apple-label--destructive">Destructive text</span>

<!-- Monospaced digits -->
<span class="apple-label apple-label--body apple-label--tabular">12:34:56</span>

<!-- Truncation -->
<p class="apple-label apple-label--body apple-label--truncate">
  This is a very long label that will be truncated with an ellipsis when it overflows its container.
</p>

<!-- Multi-line with line clamp -->
<p class="apple-label apple-label--body apple-label--clamp-2">
  This text will show a maximum of two lines and truncate with an ellipsis if it exceeds that limit.
</p>
```

## Complete CSS

```css
.apple-label {
  margin: 0;
  padding: 0;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* ---- Type Scale ---- */
.apple-label--large-title {
  font-family: var(--apple-label-font-display);
  font-size: 34px;
  font-weight: 700;
  line-height: 41px;
  letter-spacing: 0.37px;
  color: var(--apple-label-primary);
}

.apple-label--title1 {
  font-family: var(--apple-label-font-display);
  font-size: 28px;
  font-weight: 400;
  line-height: 34px;
  letter-spacing: 0.36px;
  color: var(--apple-label-primary);
}

.apple-label--title2 {
  font-family: var(--apple-label-font-display);
  font-size: 22px;
  font-weight: 400;
  line-height: 28px;
  letter-spacing: 0.35px;
  color: var(--apple-label-primary);
}

.apple-label--title3 {
  font-family: var(--apple-label-font-display);
  font-size: 20px;
  font-weight: 400;
  line-height: 25px;
  letter-spacing: 0.38px;
  color: var(--apple-label-primary);
}

.apple-label--headline {
  font-family: var(--apple-label-font-text);
  font-size: 17px;
  font-weight: 600;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-label-primary);
}

.apple-label--body {
  font-family: var(--apple-label-font-text);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-label-primary);
}

.apple-label--callout {
  font-family: var(--apple-label-font-text);
  font-size: 16px;
  font-weight: 400;
  line-height: 21px;
  letter-spacing: -0.32px;
  color: var(--apple-label-primary);
}

.apple-label--subheadline {
  font-family: var(--apple-label-font-text);
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: -0.24px;
  color: var(--apple-label-primary);
}

.apple-label--footnote {
  font-family: var(--apple-label-font-text);
  font-size: 13px;
  font-weight: 400;
  line-height: 18px;
  letter-spacing: -0.08px;
  color: var(--apple-label-primary);
}

.apple-label--caption1 {
  font-family: var(--apple-label-font-text);
  font-size: 12px;
  font-weight: 400;
  line-height: 16px;
  letter-spacing: 0px;
  color: var(--apple-label-primary);
}

.apple-label--caption2 {
  font-family: var(--apple-label-font-text);
  font-size: 11px;
  font-weight: 400;
  line-height: 13px;
  letter-spacing: 0.07px;
  color: var(--apple-label-primary);
}

/* ---- Color Variants ---- */
.apple-label--secondary { color: var(--apple-label-secondary); }
.apple-label--tertiary { color: var(--apple-label-tertiary); }
.apple-label--quaternary { color: var(--apple-label-quaternary); }
.apple-label--tint { color: var(--apple-label-tint); }
.apple-label--destructive { color: var(--apple-label-destructive); }
.apple-label--green { color: var(--apple-label-green); }
.apple-label--orange { color: var(--apple-label-orange); }

/* ---- Icon + Label ---- */
.apple-label--icon {
  display: inline-flex;
  align-items: center;
  gap: 6px;
}
.apple-label__icon {
  flex-shrink: 0;
  color: inherit;
}

/* ---- Monospaced / Tabular ---- */
.apple-label--tabular {
  font-variant-numeric: tabular-nums;
}
.apple-label--monospaced {
  font-family: 'SF Mono', SFMono-Regular, ui-monospace, Menlo, monospace;
}

/* ---- Truncation ---- */
.apple-label--truncate {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* Line clamp */
.apple-label--clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
.apple-label--clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* ---- Bold variant (accessibility: Bold Text setting) ---- */
.apple-label--bold {
  font-weight: 700;
}
.apple-label--bold.apple-label--body { font-weight: 600; }
.apple-label--bold.apple-label--footnote { font-weight: 600; }
```

## States Reference

| Color Level | Light | Dark | Use Case |
|------------|-------|------|----------|
| Primary | #000000 | #FFFFFF | Titles, body text, primary info |
| Secondary | rgba(60,60,67,0.6) | rgba(235,235,245,0.6) | Subtitles, descriptions, timestamps |
| Tertiary | rgba(60,60,67,0.3) | rgba(235,235,245,0.3) | Placeholder text, disabled labels |
| Quaternary | rgba(60,60,67,0.18) | rgba(235,235,245,0.16) | Decorative text, watermarks |
| Tint | #007AFF | #0A84FF | Links, interactive labels |
| Destructive | #FF3B30 | #FF453A | Error messages, warnings |

## Animation & Motion

```css
/* Labels don't typically animate, but number changes can */
.apple-label--animated {
  transition: color 200ms ease-out;
}

/* Counter animation (tabular nums ensure stable width) */
.apple-label--counter {
  font-variant-numeric: tabular-nums;
  transition: opacity 150ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-label--animated,
  .apple-label--counter {
    transition: none;
  }
}
```

## Accessibility

- **Dynamic Type**: Support `font-size` scaling up to 200%. Use `rem` or `em` units in production for scalability (px values in this reference are the default "Large" size)
- **Bold Text**: When user enables Bold Text in accessibility settings, increase weight by one step (400→600, 600→700)
- **Contrast**: Primary text meets WCAG AA (4.5:1), secondary meets AA for large text (3:1); verify tertiary/quaternary are decorative only
- **Screen reader**: Use semantic elements (`<h1>-<h6>`, `<p>`, `<span>`) — labels are visual; screen readers use element semantics
- **Truncation**: Ensure full text is accessible (via `title` attribute or expandable interaction)
- **Icon labels**: Icon is `aria-hidden="true"`, text provides the accessible name

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | iOS type scale (values in this file), Body 17px |
| 600-1024px | iPadOS scale, slightly larger titles possible |
| > 1024px | macOS scale: Body 13px, Headline 13px/700, Large Title 26px |

## Do / Don't

| Do | Don't |
|----|-------|
| Use the design system's type scale consistently | Invent custom font sizes outside the scale |
| Use semantic color tokens (primary, secondary) | Hardcode hex colors for text |
| Use SF Pro Display for sizes 20px+ | Use SF Pro Text for display sizes |
| Use `font-variant-numeric: tabular-nums` for numbers | Let numbers shift layout when they change |
| Limit to 2-3 hierarchy levels per view | Use all 11 type styles on one screen |
