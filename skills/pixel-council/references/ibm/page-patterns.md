---
name: page-patterns
description: Carbon page-level composition patterns — IBM.com marketing heroes, UIShell + dashboard layouts, data-dense product views, AI surfaces (aiAura tiles, chat shell), 16-column 2x grid, sharp corners, Layer-01/02/03 depth instead of shadows
metadata:
  tags: page, layout, composition, dashboard, ui shell, hero, marketing, ibm.com, carbon, 2x grid, ai surface, chat shell, data table, productive, expressive
---

# Page Patterns -- IBM Carbon Design System

> Source: [carbondesignsystem.com/elements/2x-grid/usage](https://carbondesignsystem.com/elements/2x-grid/usage), [v11.carbondesignsystem.com/components/UIShell/usage](https://v11.carbondesignsystem.com/components/UIShell/usage), [@carbon/ibm-products — AI patterns](https://github.com/carbon-design-system/ibm-products) — Apache 2.0

Carbon page composition is fundamentally different from Apple or Material. Marketing pages center inside a 1584px frame. Product surfaces fill the entire viewport behind a UIShell. Depth comes from **Layer-01 / Layer-02 / Layer-03 nesting**, never from drop shadows. Corners are sharp (`border-radius: 0`) everywhere except the AI Aura surfaces. Pictograms (64-128px) are the editorial workhorse for marketing — never icons, never emoji.

## Quick Reference

| Property | Value |
|----------|-------|
| Marketing wrapper | `.cds--page` (max-width 1584px, centered) |
| Product wrapper | `.cds--dashboard` (full-width, 100vh min-height) |
| Grid | 16 columns at lg+, 8 at md, 4 at sm |
| Breakpoints | sm 320, md 672, lg 1056, xlg 1312, max 1584 |
| Gutter modes | wide 32px / narrow 16px / condensed 1px |
| Section vertical rhythm | 96-160px (marketing), 24-48px (dashboard) |
| Hero pictogram | 96-128px |
| Feature pictogram | 64-96px |
| Background swap | `data-theme="white"` ↔ `data-theme="g10"` per section |
| CTA strip theme | `data-theme="g100"` (full-bleed dark band) |
| UIShell header | 48px tall, fixed top |
| UIShell side nav | 256px expanded, 48px rail collapsed |
| Drop shadows | NEVER — depth via Layer-01/02/03 |
| Corners | Sharp — `border-radius: 0` everywhere except AI surfaces |

## Design Tokens

Full theme tokens live in `overview.md`. Page composition adds these layout-specific tokens; the four theme blocks below are the bare minimum every page-level example references.

```css
:root {
  /* Layout */
  --cds-page-max-width: 1584px;
  --cds-shell-header-height: 48px;
  --cds-shell-sidenav-width: 256px;
  --cds-shell-sidenav-rail: 48px;
  --cds-grid-gutter: 32px;
  --cds-grid-gutter-narrow: 16px;
  --cds-grid-gutter-condensed: 1px;

  /* AI surfaces */
  --cds-ai-border-start: #4870b5;
  --cds-ai-border-end: #b58be2;
}

/* White (default) */
[data-theme="white"], :root {
  --cds-background: #ffffff; --cds-layer-01: #f4f4f4; --cds-layer-02: #ffffff; --cds-layer-03: #f4f4f4;
  --cds-text-primary: #161616; --cds-text-secondary: #525252; --cds-text-on-color: #ffffff;
  --cds-border-subtle-01: #e0e0e0; --cds-link-primary: #0f62fe;
}
/* G10 (alt light — section bands) */
[data-theme="g10"] {
  --cds-background: #f4f4f4; --cds-layer-01: #ffffff; --cds-layer-02: #f4f4f4; --cds-layer-03: #ffffff;
  --cds-text-primary: #161616; --cds-text-secondary: #525252; --cds-border-subtle-01: #c6c6c6;
}
/* G100 (dark primary) */
[data-theme="g100"], .dark {
  --cds-background: #161616; --cds-layer-01: #262626; --cds-layer-02: #393939; --cds-layer-03: #525252;
  --cds-text-primary: #f4f4f4; --cds-text-secondary: #c6c6c6; --cds-text-on-color: #ffffff;
  --cds-border-subtle-01: #393939; --cds-link-primary: #78a9ff;
}
```

---

## 1. Layout Primitives

Carbon ships two top-level wrappers — pick by content type, not visual preference. Marketing pages center inside `.cds--page`. Product surfaces (any UIShell-hosted view) fill with `.cds--dashboard`.

```css
/* Marketing page wrapper — centered, padded */
.cds--page {
  max-width: 1584px;
  margin: 0 auto;
  padding: 0 16px; /* sm */
  background: var(--cds-background);
  color: var(--cds-text-primary);
}
@media (min-width: 672px) { .cds--page { padding: 0 32px; } } /* md+ */

/* Dashboard wrapper — fills space after sidebar, no max-width */
.cds--dashboard {
  width: 100%;
  min-height: 100vh;
  padding: 0;
  background: var(--cds-background);
  color: var(--cds-text-primary);
}

/* 2x grid — responsive column count */
.cds--grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  column-gap: 32px;
  row-gap: 0;
  padding: 0 16px;
}
@media (min-width: 672px)  { .cds--grid { grid-template-columns: repeat(8, 1fr);  padding: 0 32px; } }
@media (min-width: 1056px) { .cds--grid { grid-template-columns: repeat(16, 1fr); } }

/* Narrow + condensed gutter modes */
.cds--grid--narrow    { column-gap: 16px; }
.cds--grid--condensed { column-gap: 1px; }

/* Row groups inside grid (rarely needed — grid handles flow) */
.cds--row { display: contents; }

/* Column spans — sm (4 cols), md (8 cols), lg+ (16 cols) */
.cds--col-sm-2  { grid-column: span 2; }
.cds--col-sm-4  { grid-column: span 4; }
.cds--col-md-4  { grid-column: span 4; }
.cds--col-md-8  { grid-column: span 8; }
.cds--col-lg-4  { grid-column: span 4; }
.cds--col-lg-8  { grid-column: span 8; }
.cds--col-lg-12 { grid-column: span 12; }
.cds--col-lg-16 { grid-column: span 16; }
```

### Dashboard vs Marketing distinction

| Page type | Use class | Width behavior |
|---|---|---|
| Marketing/landing | `.cds--page` | Centered max-width 1584px |
| Product dashboard | `.cds--dashboard` | Fill available space after sidebar |
| Admin / app shell | `.cds--dashboard` | Fill |
| Documentation | `.cds--page` with sidebar | Centered + sidebar |
| AI chat surface | `.cds--dashboard` | Fill (chat owns the viewport) |

Mistake to avoid: putting a DataTable inside `.cds--page` — the max-width strangles wide tables. Mistake to avoid: putting marketing copy inside `.cds--dashboard` — body copy spans absurdly wide on 4K monitors.

---

## 2. IBM.com Marketing Patterns

IBM.com uses six recurring section types. Compose a landing page by stacking 4-7 of these with 96-160px vertical breathing room between each, alternating `data-theme="white"` and `data-theme="g10"` for subtle visual banding.

### 2a. Hero — left-aligned with pictogram

The IBM.com hero is **left-aligned, never centered**. Eyebrow → fluid-display-04 headline → body → 2 buttons on the left half (8 cols). Pictogram (96-128px) on the right half (8 cols). Stack vertically below `lg`.

```html
<section class="cds--page cds-hero" data-theme="white" aria-labelledby="hero-title">
  <div class="cds--grid">
    <div class="cds--col-sm-4 cds--col-md-8 cds--col-lg-8 cds-hero__content">
      <p class="cds--label-01 cds-hero__eyebrow">Watsonx</p>
      <h1 id="hero-title" class="cds--fluid-display-04 cds-hero__title">
        Put AI to work<br>across your business.
      </h1>
      <p class="cds--body-02 cds-hero__body">
        A unified studio for foundation models, generative AI, and machine learning &mdash;
        built for the demands of the enterprise.
      </p>
      <div class="cds-hero__actions">
        <cds-button kind="primary" size="lg">Start your trial</cds-button>
        <cds-button kind="tertiary" size="lg">Book a consultation</cds-button>
      </div>
    </div>
    <div class="cds--col-sm-4 cds--col-md-8 cds--col-lg-8 cds-hero__media">
      <img src="https://unpkg.com/@carbon/pictograms/svg/ai.svg"
           alt="" aria-hidden="true" width="128" height="128"
           class="cds-hero__pictogram">
    </div>
  </div>
</section>
```

```css
.cds-hero { padding: 96px 0 160px; }
.cds-hero__eyebrow { color: var(--cds-text-secondary); margin: 0 0 16px; }
.cds-hero__title   { color: var(--cds-text-primary); font-weight: 300; margin: 0 0 24px; letter-spacing: -0.01em; }
.cds-hero__body    { color: var(--cds-text-secondary); margin: 0 0 32px; max-width: 36em; }
.cds-hero__actions { display: flex; gap: 0; } /* Carbon buttons sit flush */
.cds-hero__media   { display: flex; justify-content: flex-end; align-items: center; }
.cds-hero__pictogram { width: 128px; height: 128px; color: var(--cds-text-primary); }
@media (max-width: 1055px) { .cds-hero__media { justify-content: flex-start; margin-top: 48px; } .cds-hero__pictogram { width: 96px; height: 96px; } }
@media (max-width: 671px)  { .cds-hero { padding: 64px 0 96px; } .cds-hero__pictogram { display: none; } }
```

### 2b. Section rhythm — alternating bands

Stack sections with 96-160px vertical padding. Toggle `data-theme="white"` and `data-theme="g10"` on consecutive sections so the page reads as quiet bands of light gray. **Never add box-shadow.** The contrast between Layer-01 surfaces is the elevation cue.

```html
<section data-theme="white" class="cds-section">...</section>
<section data-theme="g10"   class="cds-section">...</section>
<section data-theme="white" class="cds-section">...</section>
<section data-theme="g10"   class="cds-section">...</section>
```

```css
.cds-section { background: var(--cds-background); color: var(--cds-text-primary); padding: 96px 0; }
@media (min-width: 1056px) { .cds-section { padding: 128px 0; } }
@media (min-width: 1584px) { .cds-section { padding: 160px 0; } }
.cds-section + .cds-section { border-top: 0; } /* no separators — color does the work */
```

### 2c. Feature section — 3-column pictogram grid

Three side-by-side columns, each containing pictogram + heading + body + a single Link. Pictograms 64-96px, never smaller (that's icon territory). Headlines use `expressive-heading-04`.

```html
<section data-theme="white" class="cds-section" aria-labelledby="features-title">
  <div class="cds--grid">
    <div class="cds--col-sm-4 cds--col-md-8 cds--col-lg-16">
      <h2 id="features-title" class="cds--fluid-heading-05 cds-section__title">
        Built for the way your teams work.
      </h2>
    </div>
  </div>

  <div class="cds--grid cds-features">
    <article class="cds--col-sm-4 cds--col-md-4 cds--col-lg-5 cds-feature">
      <img src="https://unpkg.com/@carbon/pictograms/svg/data.svg"
           alt="" aria-hidden="true" width="80" height="80" class="cds-feature__pic">
      <h3 class="cds--expressive-heading-04 cds-feature__title">Bring your data</h3>
      <p class="cds--body-02 cds-feature__body">
        Connect to existing data lakes, warehouses, and streaming sources without ETL.
      </p>
      <a href="#" class="cds--link cds-feature__link">Explore data integrations &rarr;</a>
    </article>

    <article class="cds--col-sm-4 cds--col-md-4 cds--col-lg-5 cds-feature">
      <img src="https://unpkg.com/@carbon/pictograms/svg/security.svg"
           alt="" aria-hidden="true" width="80" height="80" class="cds-feature__pic">
      <h3 class="cds--expressive-heading-04 cds-feature__title">Secure by default</h3>
      <p class="cds--body-02 cds-feature__body">
        Zero-trust architecture, encrypted in transit and at rest, FedRAMP-ready.
      </p>
      <a href="#" class="cds--link cds-feature__link">Read the security brief &rarr;</a>
    </article>

    <article class="cds--col-sm-4 cds--col-md-4 cds--col-lg-5 cds-feature">
      <img src="https://unpkg.com/@carbon/pictograms/svg/cloud.svg"
           alt="" aria-hidden="true" width="80" height="80" class="cds-feature__pic">
      <h3 class="cds--expressive-heading-04 cds-feature__title">Run anywhere</h3>
      <p class="cds--body-02 cds-feature__body">
        Deploy on IBM Cloud, AWS, Azure, or on-prem &mdash; same APIs, same SDK.
      </p>
      <a href="#" class="cds--link cds-feature__link">View deployment options &rarr;</a>
    </article>
  </div>
</section>
```

```css
.cds-section__title { color: var(--cds-text-primary); margin: 0 0 64px; font-weight: 300; }
.cds-features      { row-gap: 48px; }
.cds-feature__pic  { display: block; width: 80px; height: 80px; margin: 0 0 24px; color: var(--cds-text-primary); }
.cds-feature__title { color: var(--cds-text-primary); margin: 0 0 16px; }
.cds-feature__body { color: var(--cds-text-secondary); margin: 0 0 24px; }
.cds-feature__link { color: var(--cds-link-primary); text-decoration: none; }
.cds-feature__link:hover { text-decoration: underline; }
```

### 2d. Stats section — large numerics

2-4 columns of fluid-display-02 numbers with label-01 captions. Numbers anchor the section visually; everything else is restraint.

```html
<section data-theme="g10" class="cds-section" aria-labelledby="stats-title">
  <div class="cds--grid">
    <h2 id="stats-title" class="cds--col-lg-16 cds--fluid-heading-04 cds-section__title">
      The numbers behind the platform.
    </h2>
  </div>

  <div class="cds--grid cds-stats">
    <div class="cds--col-sm-2 cds--col-md-4 cds--col-lg-4 cds-stat">
      <p class="cds--fluid-display-02 cds-stat__num">99.99<span>%</span></p>
      <p class="cds--label-01 cds-stat__label">Service availability SLA</p>
    </div>
    <div class="cds--col-sm-2 cds--col-md-4 cds--col-lg-4 cds-stat">
      <p class="cds--fluid-display-02 cds-stat__num">450<span>+</span></p>
      <p class="cds--label-01 cds-stat__label">Foundation models available</p>
    </div>
    <div class="cds--col-sm-2 cds--col-md-4 cds--col-lg-4 cds-stat">
      <p class="cds--fluid-display-02 cds-stat__num">42<span>ms</span></p>
      <p class="cds--label-01 cds-stat__label">P50 inference latency</p>
    </div>
    <div class="cds--col-sm-2 cds--col-md-4 cds--col-lg-4 cds-stat">
      <p class="cds--fluid-display-02 cds-stat__num">3.2x</p>
      <p class="cds--label-01 cds-stat__label">Faster than baseline</p>
    </div>
  </div>
</section>
```

```css
.cds-stats { row-gap: 32px; }
.cds-stat__num { color: var(--cds-text-primary); font-weight: 300; margin: 0 0 8px; line-height: 1; }
.cds-stat__num span { color: var(--cds-text-secondary); font-weight: 300; }
.cds-stat__label { color: var(--cds-text-secondary); margin: 0; text-transform: uppercase; letter-spacing: 0.32px; }
```

### 2e. CTA strip — full-bleed dark band

A single full-bleed `data-theme="g100"` section interrupts the white/g10 rhythm to drive conversion. display-03 headline, short body, single primary button.

```html
<section data-theme="g100" class="cds-cta" aria-labelledby="cta-title">
  <div class="cds--grid">
    <div class="cds--col-sm-4 cds--col-md-8 cds--col-lg-12 cds-cta__content">
      <h2 id="cta-title" class="cds--display-03 cds-cta__title">
        Ready to ship enterprise AI?
      </h2>
      <p class="cds--body-02 cds-cta__body">
        Start building in the playground &mdash; no credit card required.
      </p>
    </div>
    <div class="cds--col-sm-4 cds--col-md-8 cds--col-lg-4 cds-cta__action">
      <cds-button kind="primary" size="lg">Open the playground</cds-button>
    </div>
  </div>
</section>
```

```css
.cds-cta { background: var(--cds-background); color: var(--cds-text-primary); padding: 96px 0; }
.cds-cta__title { color: var(--cds-text-primary); font-weight: 300; margin: 0 0 16px; }
.cds-cta__body { color: var(--cds-text-secondary); margin: 0; max-width: 36em; }
.cds-cta__action { display: flex; align-items: center; justify-content: flex-end; }
@media (max-width: 1055px) { .cds-cta__action { justify-content: flex-start; margin-top: 32px; } }
```

### 2f. Quote section — quotation type with author

Generous whitespace, quotation-02 type, name + role label below.

```html
<section data-theme="white" class="cds-section" aria-label="Customer quote">
  <div class="cds--grid">
    <figure class="cds--col-sm-4 cds--col-md-8 cds--col-lg-12 cds--col-lg-start-3 cds-quote">
      <blockquote class="cds--quotation-02 cds-quote__text">
        We replaced six tools with one workflow and cut model deployment from
        weeks to a single afternoon.
      </blockquote>
      <figcaption class="cds-quote__cite">
        <p class="cds--label-02 cds-quote__name">Maya Chen</p>
        <p class="cds--label-01 cds-quote__role">Director of ML Platform, Northwind Logistics</p>
      </figcaption>
    </figure>
  </div>
</section>
```

```css
.cds-quote { margin: 0; }
.cds-quote__text { color: var(--cds-text-primary); margin: 0 0 32px; font-weight: 300; }
.cds-quote__name { color: var(--cds-text-primary); margin: 0 0 4px; }
.cds-quote__role { color: var(--cds-text-secondary); margin: 0; }
```

---

## 3. Product / Dashboard Patterns

Product surfaces use UIShell to provide consistent header chrome and side navigation. The main content area is `.cds--dashboard` and fills whatever space remains.

### 3a. UIShell layout

48px header pinned to the top (logo, hamburger, product name, global actions). 256px persistent side nav at lg+ (collapses to a 48px rail or hides behind the hamburger below lg). Content fills the rest.

```html
<cds-header aria-label="IBM Platform">
  <cds-header-menu-button button-label-active="Close menu"
                          button-label-inactive="Open menu"></cds-header-menu-button>
  <cds-header-name href="/" prefix="IBM">Cloud Pak</cds-header-name>

  <cds-header-nav menu-bar-label="IBM Platform">
    <cds-header-nav-item href="/catalog">Catalog</cds-header-nav-item>
    <cds-header-nav-item href="/projects">Projects</cds-header-nav-item>
    <cds-header-nav-item href="/deployments">Deployments</cds-header-nav-item>
  </cds-header-nav>

  <div class="cds--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      <img src="https://unpkg.com/@carbon/icons/svg/32/search.svg" width="20" height="20" alt="">
    </cds-header-global-action>
    <cds-header-global-action aria-label="Notifications" tooltip-text="Notifications">
      <img src="https://unpkg.com/@carbon/icons/svg/32/notification.svg" width="20" height="20" alt="">
    </cds-header-global-action>
    <cds-header-global-action aria-label="App switcher" tooltip-text="App switcher">
      <img src="https://unpkg.com/@carbon/icons/svg/32/switcher.svg" width="20" height="20" alt="">
    </cds-header-global-action>
    <cds-header-global-action aria-label="User profile" tooltip-text="Maya Chen">
      <img src="https://unpkg.com/@carbon/icons/svg/32/user--avatar.svg" width="20" height="20" alt="">
    </cds-header-global-action>
  </div>
</cds-header>

<cds-side-nav aria-label="Side navigation" collapse-mode="responsive">
  <cds-side-nav-items>
    <cds-side-nav-link href="/overview" active>Overview</cds-side-nav-link>
    <cds-side-nav-link href="/models">Models</cds-side-nav-link>
    <cds-side-nav-link href="/data">Data assets</cds-side-nav-link>
    <cds-side-nav-link href="/runs">Training runs</cds-side-nav-link>
    <cds-side-nav-link href="/settings">Settings</cds-side-nav-link>
  </cds-side-nav-items>
</cds-side-nav>

<main class="cds--dashboard" id="main-content">
  <!-- dashboard grid goes here -->
</main>
```

```css
.cds--dashboard { padding-top: var(--cds-shell-header-height); } /* 48px */
@media (min-width: 1056px) { .cds--dashboard { padding-left: var(--cds-shell-sidenav-width); } } /* 256px */
.cds--header__global { display: flex; margin-left: auto; }
```

### 3b. Dashboard grid — Tiles in 2x grid

Cards on a dashboard are `cds-tile` components in the 16-col grid. Default span: 4 cols at lg (4-up), 8 cols at md (2-up), 4 cols at sm (1-up). Background of each tile is `--cds-layer-01`, sitting on the page's `--cds-background`.

```html
<main class="cds--dashboard" data-theme="white">
  <header class="cds-dashboard__header">
    <p class="cds--label-01">Watsonx / Models</p>
    <h1 class="cds--productive-heading-05">Model performance</h1>
  </header>

  <div class="cds--grid cds-dashboard__grid">
    <cds-tile class="cds--col-sm-4 cds--col-md-4 cds--col-lg-4">
      <p class="cds--label-01">Active deployments</p>
      <p class="cds--productive-heading-05">42</p>
      <p class="cds--helper-text-01">+6 this week</p>
    </cds-tile>
    <cds-tile class="cds--col-sm-4 cds--col-md-4 cds--col-lg-4">
      <p class="cds--label-01">P50 latency</p>
      <p class="cds--productive-heading-05">38ms</p>
      <p class="cds--helper-text-01">-4ms vs last week</p>
    </cds-tile>
    <cds-tile class="cds--col-sm-4 cds--col-md-4 cds--col-lg-4">
      <p class="cds--label-01">Token throughput</p>
      <p class="cds--productive-heading-05">12.4K/s</p>
      <p class="cds--helper-text-01">+3% vs last week</p>
    </cds-tile>
    <cds-tile class="cds--col-sm-4 cds--col-md-4 cds--col-lg-4">
      <p class="cds--label-01">Errors (24h)</p>
      <p class="cds--productive-heading-05">7</p>
      <p class="cds--helper-text-01">2 unresolved</p>
    </cds-tile>

    <cds-tile class="cds--col-sm-4 cds--col-md-8 cds--col-lg-10 cds-dashboard__chart">
      <h2 class="cds--productive-heading-03">Latency over time</h2>
      <!-- chart goes here -->
    </cds-tile>
    <cds-tile class="cds--col-sm-4 cds--col-md-8 cds--col-lg-6 cds-dashboard__list">
      <h2 class="cds--productive-heading-03">Recent runs</h2>
      <!-- list goes here -->
    </cds-tile>
  </div>
</main>
```

```css
.cds-dashboard__header { padding: 24px 32px; }
.cds-dashboard__grid { padding: 0 32px 48px; row-gap: 32px; }
cds-tile { background: var(--cds-layer-01); color: var(--cds-text-primary); padding: 16px; border-radius: 0; box-shadow: none; }
```

### 3c. Data-dense view — DataTable + filter sidebar + batch actions

Dense product views put a DataTable at the heart of the page. A 320px filter sidebar can sit on the left. Batch action bar slides in over the table header when rows are selected. Pagination anchors the bottom.

```html
<main class="cds--dashboard" data-theme="white">
  <div class="cds-dense">
    <aside class="cds-dense__filters" aria-label="Filters">
      <h2 class="cds--productive-heading-02">Filters</h2>
      <!-- cds-checkbox, cds-dropdown, cds-date-picker as needed -->
    </aside>

    <section class="cds-dense__table" aria-label="Training runs">
      <cds-table is-sortable size="md">
        <cds-table-head>
          <cds-table-header-row>
            <cds-table-header-cell>Run ID</cds-table-header-cell>
            <cds-table-header-cell>Model</cds-table-header-cell>
            <cds-table-header-cell>Status</cds-table-header-cell>
            <cds-table-header-cell>Started</cds-table-header-cell>
            <cds-table-header-cell>Duration</cds-table-header-cell>
          </cds-table-header-row>
        </cds-table-head>
        <cds-table-body>
          <cds-table-row>
            <cds-table-cell>run-94a2</cds-table-cell>
            <cds-table-cell>granite-13b</cds-table-cell>
            <cds-table-cell>Completed</cds-table-cell>
            <cds-table-cell>2 hours ago</cds-table-cell>
            <cds-table-cell>00:42:18</cds-table-cell>
          </cds-table-row>
          <!-- more rows -->
        </cds-table-body>
      </cds-table>

      <cds-pagination page-size="25" total-items="1428"></cds-pagination>
    </section>
  </div>
</main>
```

```css
.cds-dense { display: grid; grid-template-columns: 1fr; gap: 0; }
@media (min-width: 1056px) { .cds-dense { grid-template-columns: 320px 1fr; } }
.cds-dense__filters { padding: 24px; background: var(--cds-layer-01); border-right: 1px solid var(--cds-border-subtle-01); min-height: calc(100vh - var(--cds-shell-header-height)); }
.cds-dense__table { padding: 0; background: var(--cds-background); }
```

---

## 4. AI Patterns

Carbon's AI surfaces are the **only** components in the system that break the sharp-corner rule. They use a dual-stop linear gradient border (the "AI Aura") to mark generated or AI-influenced content. Two main patterns: AI-tagged surfaces (tiles, modals) and the chat shell.

### 4a. AI surface — Tile or Modal with aiAura border

Wrap any container with `data-ai="true"` to add the aura border. Pair it with an inline `<cds-ai-label>` so screen readers and sighted users both understand the AI provenance.

```html
<cds-tile data-ai="true" class="cds-ai-tile">
  <header class="cds-ai-tile__header">
    <h3 class="cds--productive-heading-03">Summary</h3>
    <cds-ai-label aria-label="Generated by AI">AI</cds-ai-label>
  </header>
  <p class="cds--body-02">
    Latency degraded 12% over the last hour, primarily on the granite-13b deployment.
    Most requests above the 200ms threshold originated from the EU-CENTRAL region.
  </p>
  <cds-button kind="ghost" size="sm">Explain how this was generated</cds-button>
</cds-tile>
```

```css
/* AI Aura — dual-stop gradient border via padding-box / border-box layering */
.cds--tile[data-ai="true"],
cds-tile[data-ai="true"] {
  position: relative;
  border: 1px solid transparent;
  border-radius: 2px; /* the only place Carbon allows curve */
  background:
    linear-gradient(var(--cds-layer-01), var(--cds-layer-01)) padding-box,
    linear-gradient(135deg, var(--cds-ai-border-start, #4870b5), var(--cds-ai-border-end, #b58be2)) border-box;
}
.cds--tile[data-ai="true"]:hover,
cds-tile[data-ai="true"]:hover { box-shadow: 0 0 24px rgba(72, 112, 181, 0.2); }

/* AI Label inline pill */
cds-ai-label, .cds--ai-label {
  display: inline-flex; align-items: center; height: 20px; padding: 0 8px;
  font: 500 12px/20px var(--cds-font-sans, 'IBM Plex Sans');
  color: var(--cds-text-on-color, #ffffff);
  background: linear-gradient(135deg, #4870b5, #b58be2);
  border-radius: 10px; margin-left: 8px;
}
.cds-ai-tile__header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 16px; }
```

### 4b. Chat shell — full-height conversation layout

Chat takes the whole viewport. Vertical layout: scrollable message list on top, prompt input pinned to the bottom. Agent bubbles left-aligned on `--cds-layer-02`; user bubbles right-aligned on `--cds-layer-01`. The prompt input gets the same dual-stop AI gradient border as AI surfaces.

```html
<main class="cds--dashboard cds-chat" data-theme="white" aria-label="AI Assistant">
  <header class="cds-chat__header">
    <h1 class="cds--productive-heading-03">Watsonx Assistant</h1>
    <cds-ai-label>AI</cds-ai-label>
  </header>

  <ol class="cds-chat__list" aria-live="polite">
    <li class="cds-chat__msg cds-chat__msg--agent">
      <p class="cds--body-02">Hi Maya &mdash; ask me anything about your training runs or deployments.</p>
    </li>
    <li class="cds-chat__msg cds-chat__msg--user">
      <p class="cds--body-02">Why did latency spike on granite-13b at 14:00 UTC?</p>
    </li>
    <li class="cds-chat__msg cds-chat__msg--agent">
      <p class="cds--body-02">
        At 14:00 UTC, request volume to <code>granite-13b</code> rose from 220 to 1,840 RPM&hellip;
      </p>
    </li>
  </ol>

  <form class="cds-chat__prompt" aria-label="Send a message">
    <label for="chat-input" class="cds--visually-hidden">Message</label>
    <textarea id="chat-input" class="cds-chat__input" rows="1"
              placeholder="Ask about runs, models, latency, costs&hellip;"></textarea>
    <cds-button kind="primary" size="md" type="submit" aria-label="Send">
      <img src="https://unpkg.com/@carbon/icons/svg/32/send.svg" width="20" height="20" alt="">
    </cds-button>
  </form>
</main>
```

```css
.cds-chat { display: grid; grid-template-rows: auto 1fr auto; height: 100vh; background: var(--cds-background); }
.cds-chat__header { display: flex; align-items: center; gap: 8px; padding: 16px 24px; border-bottom: 1px solid var(--cds-border-subtle-01); }

/* Scrollable message list */
.cds-chat__list { list-style: none; margin: 0; padding: 24px; overflow-y: auto; display: flex; flex-direction: column; gap: 16px; }
.cds-chat__msg { max-width: 60ch; padding: 12px 16px; border-radius: 0; } /* sharp corners — Carbon rule */
.cds-chat__msg--agent { align-self: flex-start; background: var(--cds-layer-02); color: var(--cds-text-primary); }
.cds-chat__msg--user  { align-self: flex-end;   background: var(--cds-layer-01); color: var(--cds-text-primary); border-left: 2px solid var(--cds-link-primary); }

/* Prompt input — same dual-stop gradient border as AI tiles, pinned bottom */
.cds-chat__prompt { display: flex; gap: 0; padding: 16px 24px 24px; background: var(--cds-background); border-top: 1px solid var(--cds-border-subtle-01); }
.cds-chat__input {
  flex: 1; min-height: 48px; padding: 14px 16px;
  border: 1px solid transparent; border-radius: 0;
  background:
    linear-gradient(var(--cds-layer-01), var(--cds-layer-01)) padding-box,
    linear-gradient(135deg, var(--cds-ai-border-start, #4870b5), var(--cds-ai-border-end, #b58be2)) border-box;
  font: 400 14px/20px var(--cds-font-sans, 'IBM Plex Sans');
  color: var(--cds-text-primary); resize: none;
}
.cds-chat__input:focus-visible { outline: 2px solid var(--cds-focus, #0f62fe); outline-offset: 0; }
```

---

## 5. Responsive Behavior

| Breakpoint | sm | md | lg | xlg | max |
|---|---|---|---|---|---|
| Min width | 320px | 672px | 1056px | 1312px | 1584px |
| Columns | 4 | 8 | 16 | 16 | 16 |
| Page padding | 16px | 32px | 32px | 32px | 32px |
| Section padding (V) | 64px | 96px | 128px | 128px | 160px |
| UIShell sidebar | hidden / hamburger | hidden / hamburger | 256px persistent | 256px | 320px option |
| Hero pictogram | hidden | full-width below text | 8 cols right | 8 cols right | 8 cols right |
| Feature grid | 1 column | 2 columns | 3 columns | 3 columns | 3 columns |
| Dashboard tiles | 1-up | 2-up | 4-up | 4-up | 4-up |
| Filter sidebar | drawer | drawer | 320px persistent | 320px | 320px |

Mobile UIShell collapses the side nav into a slide-in drawer triggered by the hamburger. The header itself stays 48px tall at every breakpoint — Carbon does not grow header chrome on mobile.

---

## 6. Do / Don't — Marketing Pages

| Do | Don't |
|---|---|
| Left-align hero content | Don't center marketing heroes (that's Apple, not IBM) |
| Use pictograms (64-128px) in feature grids | Don't use icons (16-32px is too small) or emoji |
| 96-160px between sections | Don't cram sections together |
| Alternate `data-theme="white"` and `data-theme="g10"` for visual rhythm | Don't add drop shadows or border-radius to sections |
| Use `fluid-display-04` for the hero headline | Don't use productive-heading-* in marketing (it's UI type) |
| Use `expressive-heading-04` in feature cards | Don't pick the smaller productive scale for editorial copy |
| One full-bleed `data-theme="g100"` CTA strip per page | Don't make the whole page dark — reserve G100 for emphasis |
| Sharp corners everywhere | Don't add `border-radius` to tiles, cards, or sections |
| Pictograms via `<img src="https://unpkg.com/@carbon/pictograms/svg/{name}.svg">` | Don't inline base64 PNGs or use lifestyle photography stock |
| Single primary button per CTA, paired with one tertiary | Don't stack 3+ buttons of similar weight |
| `font-weight: 300` for fluid-display titles | Don't use 700 bold on fluid display — it loses Carbon's restraint |
| `.cds--page` wrapper for marketing | Don't use `.cds--dashboard` (no max-width = absurdly wide text) |

---

## 7. Do / Don't — Dashboards & Product

| Do | Don't |
|---|---|
| Use `.cds--dashboard` (full-width) | Don't use `.cds--page` (max-width strangles tables) |
| UIShell + DataTable + Tiles | Don't replicate marketing card grids in product chrome |
| Productive type scale (heading-01..07) | Don't use `expressive-*` or `fluid-*` in dashboards — too loud |
| `--cds-layer-01` for Tiles on `--cds-background` | Don't add `box-shadow` to tiles — use Layer-01/02/03 nesting |
| Sharp corners (`border-radius: 0`) | Don't soften corners to "feel friendlier" — that's another DS |
| Filter sidebar 320px on the left at lg+ | Don't put filters in a top bar (loses vertical real estate) |
| Batch action bar that overlays the table header on selection | Don't move selected-row actions into a separate panel |
| Pagination anchored at the bottom of the table | Don't use infinite scroll for data-dense work surfaces |
| AI surfaces marked with `data-ai="true"` + `<cds-ai-label>` | Don't ship AI output without the aura border or label |
| Chat input gets the dual-stop gradient border | Don't style the chat input like a regular text field |
| Header stays 48px at every breakpoint | Don't grow header chrome on mobile to "fit more icons" |
| Side nav collapses to a 48px rail (or hides) below lg | Don't keep the 256px nav permanently on phones |
