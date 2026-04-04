---
name: page-patterns
description: M3 page-level composition patterns — hero layouts, section structure, tonal elevation, 12-column grid, feature showcases, CTAs, footers for marketing and landing pages
metadata:
  tags: page, layout, composition, hero, section, landing, marketing, material design, grid, tonal elevation
---

# Page Patterns -- Google Material Design 3

## Quick Reference

| Property | Value |
|----------|-------|
| Max content width | 1200px |
| Grid | 12 columns, 24px gutter |
| Section gap | 96px (desktop), 64px (tablet), 48px (mobile) |
| Corner radius | 12px medium, 16px large, 28px xl |
| Background (light) | Surface #FEF7FF, Surface-Container #F3EDF7 |
| Background (dark) | Surface #141218, Surface-Container #211F26 |
| Hero title | 72px, weight 400, -0.25px tracking |
| Overline | 12px, weight 500, uppercase, 0.5px tracking |
| Primary CTA | 56px height, pill radius, filled primary |
| Breakpoints | Compact <600, Medium 600-839, Expanded 840+ |

## Design Tokens

```css
:root {
  --md-page-surface: #FEF7FF;
  --md-page-surface-container: #F3EDF7;
  --md-page-surface-container-high: #ECE6F0;
  --md-page-surface-container-highest: #E6E0E9;
  --md-page-on-surface: #1D1B20;
  --md-page-on-surface-variant: #49454F;
  --md-page-primary: #6750A4;
  --md-page-on-primary: #FFFFFF;
  --md-page-outline: #79747E;
  --md-page-outline-variant: #CAC4D0;
  --md-page-max-width: 1200px;
  --md-page-gutter: 24px;
  --md-page-section-gap: 96px;
  --md-page-font: 'Roboto', 'Noto Sans', 'Helvetica Neue', Arial, sans-serif;
  --md-page-corner-medium: 12px;
  --md-page-corner-large: 16px;
  --md-page-corner-xl: 28px;
  --md-page-elevation-1: 0 1px 2px rgba(0,0,0,0.3), 0 1px 3px 1px rgba(0,0,0,0.15);
  --md-page-elevation-2: 0 1px 2px rgba(0,0,0,0.3), 0 2px 6px 2px rgba(0,0,0,0.15);
  --md-page-easing: cubic-bezier(0.2, 0, 0, 1.0);
  --md-page-easing-decelerate: cubic-bezier(0.05, 0.7, 0.1, 1.0);
}
@media (prefers-color-scheme: dark) {
  :root {
    --md-page-surface: #141218;
    --md-page-surface-container: #211F26;
    --md-page-surface-container-high: #2B2930;
    --md-page-surface-container-highest: #36343B;
    --md-page-on-surface: #E6E0E9;
    --md-page-on-surface-variant: #CAC4D0;
    --md-page-primary: #D0BCFF;
    --md-page-on-primary: #381E72;
    --md-page-outline: #938F99;
    --md-page-outline-variant: #49454F;
  }
}
.dark {
  --md-page-surface: #141218;
  --md-page-surface-container: #211F26;
  --md-page-surface-container-high: #2B2930;
  --md-page-surface-container-highest: #36343B;
  --md-page-on-surface: #E6E0E9;
  --md-page-on-surface-variant: #CAC4D0;
  --md-page-primary: #D0BCFF;
  --md-page-on-primary: #381E72;
  --md-page-outline: #938F99;
  --md-page-outline-variant: #49454F;
}
```

## Variants (Section Types)

| Pattern | Description | Background | Typical Height |
|---------|-------------|------------|----------------|
| Text Hero | Centered overline + display headline + subtitle + CTAs | surface | auto, generous padding |
| Product Hero | 5-col text + 7-col image split on 12-col grid | surface | auto |
| Feature Showcase | Single feature, text + image alternating sides | alternates surface / surface-container | auto |
| Feature Strip | 3 M3 elevated or outlined cards | surface-container | auto |
| Stats Bar | Large numbers with body labels | surface | auto |
| Pricing Grid | 3 M3 cards, center highlighted | surface-container | auto |
| CTA Section | Centered headline + subtitle + filled button | surface-container-high | auto |
| FAQ Section | Expansion panels with outline-variant borders | surface | auto |
| Footer | Link columns + legal, outline-variant top border | surface | auto |

## HTML Structure

### Text Hero

```html
<section class="md-page__hero" aria-label="Introduction">
  <div class="md-page__wrap">
    <p class="md-page__overline">Introducing TaskFlow</p>
    <h1 class="md-page__hero-title">Get more done.<br>With less effort.</h1>
    <p class="md-page__hero-subtitle">The task management app built for how you actually work.</p>
    <div class="md-page__hero-actions">
      <button class="md-page__cta md-page__cta--filled">Get Started Free</button>
      <button class="md-page__cta md-page__cta--tonal">Learn More</button>
    </div>
  </div>
</section>
```

Product Hero uses same inner markup inside `md-page__hero--product` with a 12-column split: `<div class="md-page__wrap md-page__hero-split">` containing `md-page__hero-content` (grid-column 1/6) and `md-page__hero-media` (grid-column 6/13).

### Feature Showcase (alternating)

```html
<section class="md-page__feature" aria-label="Smart Planning feature">
  <div class="md-page__wrap md-page__feature-grid">
    <div class="md-page__feature-text">
      <p class="md-page__overline">Smart Planning</p>
      <h2 class="md-page__feature-title">Your schedule,<br>optimized.</h2>
      <p class="md-page__feature-body">AI-powered scheduling that adapts to your workflow.</p>
    </div>
    <div class="md-page__feature-media">
      <img src="feature.jpg" alt="Feature" class="md-page__feature-img" />
    </div>
  </div>
</section>
```

Reversed variant: add `md-page__feature-grid--reversed` and `md-page__feature--alt` for tonal background.

### Feature Strip (M3 Cards)

```html
<section class="md-page__strip" aria-label="Key features">
  <div class="md-page__wrap">
    <h2 class="md-page__section-title">Built for productivity</h2>
    <p class="md-page__section-subtitle">Everything you need, nothing you don't.</p>
    <div class="md-page__strip-cards">
      <div class="md-page__card md-page__card--elevated">
        <span class="md-page__card-icon material-symbols-outlined" aria-hidden="true">bolt</span>
        <h3 class="md-page__card-title">Quick Capture</h3>
        <p class="md-page__card-body">Add tasks in seconds with natural language input.</p>
      </div>
      <!-- repeat 2-3 more cards -->
    </div>
  </div>
</section>
```

### Stats, Pricing, CTA, FAQ, Footer

```html
<!-- Stats -->
<section class="md-page__stats" aria-label="Key statistics">
  <div class="md-page__wrap">
    <div class="md-page__stats-items">
      <div class="md-page__stat">
        <span class="md-page__stat-number">10M+</span>
        <span class="md-page__stat-label">tasks completed</span>
      </div>
      <!-- repeat 2-3 stats -->
    </div>
  </div>
</section>

<!-- Pricing -->
<section class="md-page__pricing" aria-label="Pricing plans">
  <div class="md-page__wrap">
    <h2 class="md-page__section-title">Choose your plan</h2>
    <div class="md-page__pricing-grid">
      <div class="md-page__pricing-card md-page__card--outlined">
        <h3 class="md-page__pricing-name">Free</h3>
        <p class="md-page__pricing-price"><span class="md-page__pricing-amount">$0</span>/mo</p>
        <ul class="md-page__pricing-features" role="list"><li>Up to 50 tasks</li></ul>
        <button class="md-page__cta md-page__cta--tonal">Get Started</button>
      </div>
      <div class="md-page__pricing-card md-page__pricing-card--featured md-page__card--elevated">
        <p class="md-page__overline">Most Popular</p>
        <h3 class="md-page__pricing-name">Pro</h3>
        <p class="md-page__pricing-price"><span class="md-page__pricing-amount">$9</span>/mo</p>
        <ul class="md-page__pricing-features" role="list"><li>Unlimited tasks</li><li>AI scheduling</li></ul>
        <button class="md-page__cta md-page__cta--filled">Get Started</button>
      </div>
      <!-- repeat third card -->
    </div>
  </div>
</section>

<!-- CTA Section -->
<section class="md-page__cta-section" aria-label="Call to action">
  <div class="md-page__wrap">
    <h2 class="md-page__section-title">Ready to get more done?</h2>
    <p class="md-page__section-subtitle">Join millions who manage work with TaskFlow.</p>
    <button class="md-page__cta md-page__cta--filled">Start Free Trial</button>
  </div>
</section>

<!-- FAQ -->
<section class="md-page__faq" aria-label="Frequently asked questions">
  <div class="md-page__wrap md-page__wrap--narrow">
    <h2 class="md-page__section-title">Frequently asked questions</h2>
    <div class="md-page__faq-list">
      <details class="md-page__faq-item">
        <summary class="md-page__faq-question">Is there a free plan?</summary>
        <div class="md-page__faq-answer"><p>Yes. Free plan includes 50 tasks with no time limit.</p></div>
      </details>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="md-page__footer" role="contentinfo">
  <div class="md-page__wrap">
    <div class="md-page__footer-grid">
      <nav class="md-page__footer-col" aria-label="Product">
        <h4 class="md-page__footer-heading">Product</h4>
        <ul class="md-page__footer-links"><li><a href="#">Features</a></li><li><a href="#">Pricing</a></li></ul>
      </nav>
      <!-- repeat 3-4 columns -->
    </div>
    <div class="md-page__footer-legal"><p>&copy; 2026 TaskFlow. All rights reserved.</p></div>
  </div>
</footer>
```

## Complete CSS

```css
/* ===== FOUNDATION ===== */
*, *::before, *::after { box-sizing: border-box; }
.md-page__wrap { max-width: var(--md-page-max-width); margin: 0 auto; padding: 0 var(--md-page-gutter); }
.md-page__wrap--narrow { max-width: 800px; }

/* ===== OVERLINE & SECTION TITLES ===== */
.md-page__overline { font-family: var(--md-page-font); font-size: 12px; font-weight: 500; text-transform: uppercase; letter-spacing: 0.5px; color: var(--md-page-primary); margin: 0 0 16px; }
.md-page__section-title { font-family: var(--md-page-font); font-size: 45px; font-weight: 400; line-height: 1.16; color: var(--md-page-on-surface); margin: 0 0 16px; text-align: center; }
.md-page__section-subtitle { font-family: var(--md-page-font); font-size: 16px; font-weight: 400; line-height: 1.5; letter-spacing: 0.5px; color: var(--md-page-on-surface-variant); margin: 0 auto 48px; text-align: center; max-width: 640px; }

/* ===== HERO ===== */
.md-page__hero { padding: 120px 0 80px; text-align: center; background: var(--md-page-surface); color: var(--md-page-on-surface); }
.md-page__hero-title { font-family: var(--md-page-font); font-size: 72px; font-weight: 400; line-height: 1.06; letter-spacing: -0.25px; color: var(--md-page-on-surface); margin: 0 0 24px; }
.md-page__hero-subtitle { font-family: var(--md-page-font); font-size: 22px; font-weight: 400; line-height: 1.36; color: var(--md-page-on-surface-variant); margin: 0 auto 40px; max-width: 640px; }
.md-page__hero-actions { display: flex; justify-content: center; align-items: center; gap: 16px; flex-wrap: wrap; }

/* Product Hero (12-col split) */
.md-page__hero--product { text-align: left; }
.md-page__hero-split { display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--md-page-gutter); align-items: center; }
.md-page__hero-content { grid-column: 1 / 6; }
.md-page__hero-content .md-page__hero-title { font-size: 57px; }
.md-page__hero-content .md-page__hero-actions { justify-content: flex-start; }
.md-page__hero-media { grid-column: 6 / 13; }
.md-page__hero-image { display: block; width: 100%; height: auto; border-radius: var(--md-page-corner-xl); }

/* ===== CTA BUTTONS ===== */
.md-page__cta { position: relative; display: inline-flex; align-items: center; justify-content: center; font-family: var(--md-page-font); font-size: 14px; font-weight: 500; letter-spacing: 0.1px; text-decoration: none; border: none; cursor: pointer; height: 56px; padding: 0 32px; border-radius: 9999px; overflow: hidden; transition: box-shadow 200ms var(--md-page-easing); user-select: none; }
/* State layer */
.md-page__cta::before { content: ''; position: absolute; inset: 0; border-radius: inherit; background: currentColor; opacity: 0; transition: opacity 200ms var(--md-page-easing); pointer-events: none; }
.md-page__cta--filled { background: var(--md-page-primary); color: var(--md-page-on-primary); }
.md-page__cta--tonal { background: var(--md-page-surface-container-high); color: var(--md-page-on-surface); }
@media (hover: hover) { .md-page__cta:hover::before { opacity: 0.08; } }
.md-page__cta:focus-visible::before { opacity: 0.10; }
.md-page__cta:active::before { opacity: 0.10; }
.md-page__cta:focus-visible { outline: 3px solid var(--md-page-primary); outline-offset: 2px; }
.md-page__cta--filled:hover { box-shadow: var(--md-page-elevation-1); }

/* ===== FEATURE SHOWCASE ===== */
.md-page__feature { padding: var(--md-page-section-gap) 0; background: var(--md-page-surface); color: var(--md-page-on-surface); }
.md-page__feature--alt { background: var(--md-page-surface-container); }
.md-page__feature-grid { display: grid; grid-template-columns: repeat(12, 1fr); gap: var(--md-page-gutter); align-items: center; }
.md-page__feature-text { grid-column: 1 / 6; }
.md-page__feature-media { grid-column: 6 / 13; }
.md-page__feature-grid--reversed .md-page__feature-text { grid-column: 8 / 13; order: 2; }
.md-page__feature-grid--reversed .md-page__feature-media { grid-column: 1 / 8; order: 1; }
.md-page__feature-title { font-family: var(--md-page-font); font-size: 36px; font-weight: 400; line-height: 1.22; color: var(--md-page-on-surface); margin: 0 0 16px; }
.md-page__feature-body { font-family: var(--md-page-font); font-size: 16px; font-weight: 400; line-height: 1.5; letter-spacing: 0.5px; color: var(--md-page-on-surface-variant); margin: 0; }
.md-page__feature-img { display: block; width: 100%; height: auto; border-radius: var(--md-page-corner-large); }

/* ===== FEATURE STRIP (M3 CARDS) ===== */
.md-page__strip { padding: var(--md-page-section-gap) 0; background: var(--md-page-surface-container); color: var(--md-page-on-surface); text-align: center; }
.md-page__strip-cards { display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--md-page-gutter); margin-top: 8px; }
.md-page__card { padding: 32px 24px; border-radius: var(--md-page-corner-medium); text-align: left; }
.md-page__card--elevated { background: var(--md-page-surface); box-shadow: var(--md-page-elevation-1); }
.md-page__card--outlined { background: var(--md-page-surface); border: 1px solid var(--md-page-outline-variant); }
.md-page__card-icon { font-size: 24px; color: var(--md-page-primary); margin-bottom: 16px; display: block; /* No background — bare Material Symbol */ }
.md-page__card-title { font-family: var(--md-page-font); font-size: 16px; font-weight: 500; line-height: 1.5; letter-spacing: 0.15px; color: var(--md-page-on-surface); margin: 0 0 8px; }
.md-page__card-body { font-family: var(--md-page-font); font-size: 14px; font-weight: 400; line-height: 1.43; letter-spacing: 0.25px; color: var(--md-page-on-surface-variant); margin: 0; }

/* ===== STATS BAR ===== */
.md-page__stats { padding: var(--md-page-section-gap) 0; background: var(--md-page-surface); color: var(--md-page-on-surface); }
.md-page__stats-items { display: flex; justify-content: center; gap: 64px; }
.md-page__stat { text-align: center; }
.md-page__stat-number { display: block; font-family: var(--md-page-font); font-size: 45px; font-weight: 400; line-height: 1.16; color: var(--md-page-primary); }
.md-page__stat-label { display: block; font-family: var(--md-page-font); font-size: 14px; font-weight: 400; letter-spacing: 0.25px; color: var(--md-page-on-surface-variant); margin-top: 8px; }

/* ===== PRICING ===== */
.md-page__pricing { padding: var(--md-page-section-gap) 0; background: var(--md-page-surface-container); color: var(--md-page-on-surface); }
.md-page__pricing-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--md-page-gutter); margin: 0 auto; max-width: 960px; }
.md-page__pricing-card { padding: 40px 24px; border-radius: var(--md-page-corner-large); text-align: center; display: flex; flex-direction: column; align-items: center; gap: 12px; }
.md-page__pricing-card--featured { border: 2px solid var(--md-page-primary); box-shadow: var(--md-page-elevation-2); }
.md-page__pricing-name { font-family: var(--md-page-font); font-size: 22px; font-weight: 400; margin: 0; color: var(--md-page-on-surface); }
.md-page__pricing-price { font-size: 14px; color: var(--md-page-on-surface-variant); margin: 0; }
.md-page__pricing-amount { font-size: 45px; font-weight: 400; color: var(--md-page-on-surface); }
.md-page__pricing-features { list-style: none; padding: 0; margin: 8px 0 16px; font-size: 14px; line-height: 2; letter-spacing: 0.25px; color: var(--md-page-on-surface-variant); }

/* ===== CTA SECTION ===== */
.md-page__cta-section { padding: var(--md-page-section-gap) 0; text-align: center; background: var(--md-page-surface-container-high); color: var(--md-page-on-surface); }

/* ===== FAQ ===== */
.md-page__faq { padding: var(--md-page-section-gap) 0; background: var(--md-page-surface); color: var(--md-page-on-surface); }
.md-page__faq-list { margin-top: 48px; }
.md-page__faq-item { border-top: 1px solid var(--md-page-outline-variant); }
.md-page__faq-item:last-child { border-bottom: 1px solid var(--md-page-outline-variant); }
.md-page__faq-question { font-family: var(--md-page-font); font-size: 16px; font-weight: 500; line-height: 1.5; letter-spacing: 0.15px; color: var(--md-page-on-surface); padding: 16px 0; cursor: pointer; list-style: none; display: flex; justify-content: space-between; align-items: center; }
.md-page__faq-question::-webkit-details-marker { display: none; }
.md-page__faq-question::after { content: '+'; font-size: 24px; font-weight: 300; color: var(--md-page-on-surface-variant); transition: transform 300ms var(--md-page-easing); }
.md-page__faq-item[open] .md-page__faq-question::after { transform: rotate(45deg); }
.md-page__faq-answer { padding: 0 0 16px; font-size: 14px; line-height: 1.43; letter-spacing: 0.25px; color: var(--md-page-on-surface-variant); }

/* ===== FOOTER ===== */
.md-page__footer { border-top: 1px solid var(--md-page-outline-variant); padding: 24px 0 48px; background: var(--md-page-surface); color: var(--md-page-on-surface-variant); font-family: var(--md-page-font); font-size: 14px; letter-spacing: 0.25px; }
.md-page__footer-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: var(--md-page-gutter); padding-bottom: 24px; border-bottom: 1px solid var(--md-page-outline-variant); }
.md-page__footer-heading { font-size: 14px; font-weight: 500; color: var(--md-page-on-surface); margin: 0 0 12px; }
.md-page__footer-links { list-style: none; padding: 0; margin: 0; }
.md-page__footer-links li { margin-bottom: 8px; }
.md-page__footer-links a { color: var(--md-page-on-surface-variant); text-decoration: none; position: relative; }
.md-page__footer-links a::before { content: ''; position: absolute; inset: -4px -8px; border-radius: var(--md-page-corner-medium); background: currentColor; opacity: 0; transition: opacity 200ms var(--md-page-easing); pointer-events: none; }
@media (hover: hover) { .md-page__footer-links a:hover::before { opacity: 0.08; } }
.md-page__footer-links a:focus-visible { outline: 3px solid var(--md-page-primary); outline-offset: 2px; border-radius: var(--md-page-corner-medium); }
.md-page__footer-legal { padding-top: 16px; font-size: 12px; color: var(--md-page-on-surface-variant); }
.md-page__footer-legal p { margin: 0; }

/* ===== RESPONSIVE: Compact (<600px) ===== */
@media (max-width: 599px) {
  :root { --md-page-section-gap: 48px; }
  .md-page__hero { padding: 80px 0 48px; }
  .md-page__hero-title { font-size: 36px; letter-spacing: 0; }
  .md-page__hero-subtitle { font-size: 16px; }
  .md-page__section-title { font-size: 28px; }
  .md-page__hero-split,
  .md-page__feature-grid { grid-template-columns: 1fr; }
  .md-page__hero-content,
  .md-page__hero-media,
  .md-page__feature-text,
  .md-page__feature-media { grid-column: 1 / -1; }
  .md-page__hero-content { text-align: center; }
  .md-page__hero-content .md-page__hero-title { font-size: 36px; }
  .md-page__hero-content .md-page__hero-actions { justify-content: center; }
  .md-page__feature-grid--reversed .md-page__feature-text { grid-column: 1 / -1; order: 1; }
  .md-page__feature-grid--reversed .md-page__feature-media { grid-column: 1 / -1; order: 2; }
  .md-page__feature-title { font-size: 28px; }
  .md-page__strip-cards { grid-template-columns: 1fr; }
  .md-page__stats-items { flex-direction: column; gap: 32px; }
  .md-page__stat-number { font-size: 36px; }
  .md-page__pricing-grid { grid-template-columns: 1fr; }
  .md-page__footer-grid { grid-template-columns: repeat(2, 1fr); }
  .md-page__hero-actions { flex-direction: column; }
  .md-page__cta { width: 100%; }
}
/* ===== RESPONSIVE: Medium (600-839px) ===== */
@media (min-width: 600px) and (max-width: 839px) {
  :root { --md-page-section-gap: 64px; }
  .md-page__hero-title { font-size: 57px; letter-spacing: -0.25px; }
  .md-page__section-title { font-size: 36px; }
  .md-page__hero-split,
  .md-page__feature-grid { grid-template-columns: 1fr; }
  .md-page__hero-content,
  .md-page__hero-media,
  .md-page__feature-text,
  .md-page__feature-media { grid-column: 1 / -1; }
  .md-page__hero-content { text-align: center; }
  .md-page__hero-content .md-page__hero-actions { justify-content: center; }
  .md-page__feature-grid--reversed .md-page__feature-text { grid-column: 1 / -1; order: 1; }
  .md-page__feature-grid--reversed .md-page__feature-media { grid-column: 1 / -1; order: 2; }
  .md-page__feature-title { font-size: 32px; }
  .md-page__footer-grid { grid-template-columns: repeat(2, 1fr); }
}

/* ===== REDUCED MOTION ===== */
@media (prefers-reduced-motion: reduce) {
  .md-page__cta, .md-page__cta::before, .md-page__footer-links a::before, .md-page__faq-question::after { transition: none; }
  .md-page__reveal { opacity: 1; transform: none; transition: none; }
}

/* ===== DARK MODE ===== */
@media (prefers-color-scheme: dark) {
  .md-page__cta:focus-visible { outline-color: var(--md-page-primary); }
  .md-page__card--elevated { box-shadow: var(--md-page-elevation-2); }
}
.dark .md-page__cta:focus-visible { outline-color: var(--md-page-primary); }
.dark .md-page__card--elevated { box-shadow: var(--md-page-elevation-2); }
```

## Section Transition Rules (M3-Specific)

1. **M3 DOES use tonal elevation for section differentiation.** Alternate between `surface` and `surface-container` -- this IS the standard M3 pattern (unlike Apple, which avoids background alternation).
2. **Keep it subtle:** only `surface` and `surface-container` for general sections. Reserve `surface-container-high` for emphasis (CTA blocks).
3. **Section gaps:** 96px desktop, 64px tablet, 48px mobile.
4. **Dividers** use `outline-variant` at 1px (thicker than Apple's 0.5px).
5. **Cards within sections** use elevation-1 OR outlined variant, not both.
6. **Hero section:** `surface` background, no tonal shift.
7. **CTA section:** `surface-container-high` for maximum emphasis.
8. **Adjacent features** alternate tonal backgrounds AND image side for visual rhythm.
9. **12-column grid** structures all two-column layouts (5+7 split), not simple 50/50 flex.

## Animation & Motion

```css
/* Scroll-triggered reveal (apply via JS IntersectionObserver) */
.md-page__reveal { opacity: 0; transform: translateY(20px); transition: opacity 300ms var(--md-page-easing-decelerate), transform 300ms var(--md-page-easing-decelerate); }
.md-page__reveal--visible { opacity: 1; transform: translateY(0); }
.md-page__reveal--stagger-1 { transition-delay: 50ms; }
.md-page__reveal--stagger-2 { transition-delay: 100ms; }
.md-page__reveal--stagger-3 { transition-delay: 150ms; }
@media (prefers-reduced-motion: reduce) { .md-page__reveal { opacity: 1; transform: none; transition: none; } }
```

## Accessibility

- **ARIA landmarks**: `aria-label` on each `<section>`, `role="contentinfo"` on `<footer>`, `role="list"` on pricing features
- **Keyboard**: Tab through CTAs/links, Enter/Space to activate, FAQ via native `<details>`
- **Focus ring**: 3px solid primary, 2px offset on all interactive elements
- **State layers**: Hover 0.08, focus 0.10, pressed 0.10 via `::before` pseudo-element
- **Touch target**: CTAs 56px height (exceeds 48px minimum), FAQ summaries full-width
- **Screen reader**: Overline reads before heading via DOM order, stats numbers associated with labels by proximity
- **Reduced motion**: All transitions and transforms disabled via `prefers-reduced-motion: reduce`
- **Contrast**: on-surface on surface = #1D1B20 on #FEF7FF (14.7:1 WCAG AAA)

## Do / Don't

| Do | Don't |
|----|-------|
| Use surface-container hierarchy for section backgrounds | Use random background colors or harsh alternation |
| Use 12-column grid for all two-column layouts | Use fixed pixel widths or simple 50/50 flex |
| Use filled button for primary CTA, tonal for secondary | Use outlined button for primary CTA |
| Use Material Symbols icons (no background circle) | Use emoji or colored icon squares |
| Use 8px spacing grid (8, 16, 24, 32, 48, 64, 96) | Use arbitrary spacing values (13px, 37px) |
| Use tonal elevation (surface tokens) for depth | Rely only on box-shadow for depth hierarchy |
| Use M3 emphasized easing: cubic-bezier(0.2, 0, 0, 1.0) | Use linear or generic ease transitions |
| Use Overline (12px, 500, uppercase) for section labels | Skip section label hierarchy or use large labels |
| Use state layers (::before overlay) for hover/focus | Change background-color directly on hover |
| Limit to 2 CTA buttons per section (filled + tonal) | Add 3+ competing action buttons |
| Use 96px section gaps on desktop, 48px on mobile | Pack sections with 40px gaps or less |
| Use weight 400 for display and headline text | Use bold (700) for headings -- M3 is lighter than Apple |
