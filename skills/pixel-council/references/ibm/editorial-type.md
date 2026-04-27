---
name: editorial-type
description: IBM Carbon marketing/editorial typography — Expressive + Fluid + Display scale (42-92px responsive headlines via clamp()) for landing pages and long-form content
metadata:
  tags: typography, editorial, marketing, expressive, fluid, display, ibm plex, carbon, landing page, hero, eyebrow
---

# Editorial Type -- IBM Carbon Design System

> Source: [Carbon Type — Style Strategy](https://carbondesignsystem.com/elements/typography/style-strategy/) · [Carbon Type — Productive & Expressive](https://carbondesignsystem.com/elements/typography/productive-expressive/) · [carbon-design-system on GitHub](https://github.com/carbon-design-system/carbon)

## When to use this scale

Carbon distinguishes two parallel type ramps. The **Productive** scale (`heading-01` through `heading-07`, `body-01`, `body-02`, defined in [overview.md](overview.md)) is for product UI: dashboards, forms, tables, settings panels — anywhere density and predictability matter. Sizes are fixed and tokens use the `-01` suffix. The **Expressive** scale documented here is for marketing pages, landing pages, blog posts, hero sections, pull quotes, and any editorial moment where headlines should breathe. Tokens use the `-02` suffix. **Fluid** tokens (`fluid-display-*`, `fluid-heading-*`) layer on top of Expressive and use CSS `clamp()` to scale smoothly between a small viewport (320px) and a large one (1584px). The **Display** tier (`fluid-display-01` through `-04`) is the largest editorial type — reserved for top-of-page hero headlines. **Rule of thumb**: if it's a marketing/landing/editorial surface, reach for Fluid + Display first. If it's a product UI surface, stay in Productive (`overview.md`).

## Marketing scale ladder

Carbon's editorial scale uses the following raw size array (px): **`[12, 14, 16, 18, 20, 24, 28, 32, 36, 42, 54, 60, 76]`**. Note that 92px appears as the practical max-render size for `fluid-display-04` at 1584px viewport (5.75rem = 92px), beyond the base scale array. All sizes from largest to smallest:

| Token | sm size | max size | Weight | Use |
|---|---|---|---|---|
| `fluid-display-04` | 42px | 92px | 300 (light) | Hero headline (largest) |
| `fluid-display-03` | 42px | 76px | 300 | Hero headline (alt) |
| `fluid-display-02` | 42px | 76px | 600 (semibold) | Section super-headline |
| `fluid-display-01` | 32px | 76px | 300 | Section headline |
| `fluid-heading-06` | 32px | 60px | 600 | Sub-hero |
| `fluid-heading-05` | 28px | 36px | 400 | Section eyebrow + headline |
| `fluid-heading-04` | 28px | 32px | 400 | Card / feature title |
| `fluid-heading-03` | 20px | 24px | 400 | Card / feature subtitle |
| `expressive-paragraph-01` | 24px | 32px | 300 | Long-form lead paragraph |
| `quotation-01` | 20px | 28px | 400 | Pull quote (small) |
| `quotation-02` | 32px | 48px | 300 | Pull quote (large) |

**Key rules**: weight 300 (IBM Plex Sans Light) is the editorial signature for Display tokens; weight 400 (Regular) for mid-tier headings; weight 600 (Semibold) reserved for Display-02 super-headlines and Heading-06 sub-heroes that need to anchor a section. Letter-spacing is **always 0** on headings 28px and above. Line-height tightens as size grows: 1.19 on Display, 1.25 on Heading-06/05, 1.4 on Heading-03.

## Fluid scaling behavior

Fluid tokens interpolate font-size between two viewport widths using `clamp()`. The lower bound (`sm`) takes effect at 320px (20rem); the upper bound (`max`) is reached at 1584px (99rem). Display tokens scale across the full 320-1584 range; Heading tokens (heading-03 through heading-05) scale only between 672px (41rem) and 1056px (66rem) — they are fixed below 672px and above 1056px. Below are the verbatim Carbon CSS rules:

```css
/* ---- Display tier — scales 320px → 1584px ---- */
.cds--fluid-display-04 {
  font-size: clamp(2.625rem, 2.625rem + (5.75 - 2.625) * ((100vw - 20rem) / (99 - 20)), 5.75rem);
  line-height: 1.19;
  font-weight: 300;
  letter-spacing: 0;
}
.cds--fluid-display-03 {
  font-size: clamp(2.625rem, 2.625rem + (4.75 - 2.625) * ((100vw - 20rem) / (99 - 20)), 4.75rem);
  line-height: 1.19;
  font-weight: 300;
  letter-spacing: 0;
}
.cds--fluid-display-02 {
  font-size: clamp(2.625rem, 2.625rem + (4.75 - 2.625) * ((100vw - 20rem) / (99 - 20)), 4.75rem);
  line-height: 1.199;
  font-weight: 600;
  letter-spacing: 0;
}
.cds--fluid-display-01 {
  font-size: clamp(2rem, 2rem + (4.75 - 2) * ((100vw - 20rem) / (99 - 20)), 4.75rem);
  line-height: 1.19;
  font-weight: 300;
  letter-spacing: 0;
}

/* ---- Heading tier — scales 672px → 1056px ---- */
.cds--fluid-heading-06 {
  font-size: clamp(2rem, 2rem + (3.75 - 2) * ((100vw - 20rem) / (99 - 20)), 3.75rem);
  line-height: 1.25;
  font-weight: 600;
  letter-spacing: 0;
}
.cds--fluid-heading-05 {
  font-size: clamp(1.75rem, 1.75rem + (2.25 - 1.75) * ((100vw - 41rem) / (66 - 41)), 2.25rem);
  line-height: 1.25;
  font-weight: 400;
  letter-spacing: 0;
}
.cds--fluid-heading-04 {
  font-size: clamp(1.75rem, 1.75rem + (2 - 1.75) * ((100vw - 41rem) / (66 - 41)), 2rem);
  line-height: 1.28572;
  font-weight: 400;
  letter-spacing: 0;
}
.cds--fluid-heading-03 {
  font-size: clamp(1.25rem, 1.25rem + (1.5 - 1.25) * ((100vw - 41rem) / (66 - 41)), 1.5rem);
  line-height: 1.4;
  font-weight: 400;
  letter-spacing: 0;
}

/* ---- Long-form body + quotations ---- */
.cds--expressive-paragraph-01 {
  font-size: clamp(1.5rem, 1.5rem + (2 - 1.5) * ((100vw - 41rem) / (66 - 41)), 2rem);
  line-height: 1.334;
  font-weight: 300;
  letter-spacing: 0;
}
.cds--quotation-01 {
  font-size: clamp(1.25rem, 1.25rem + (1.75 - 1.25) * ((100vw - 41rem) / (66 - 41)), 1.75rem);
  line-height: 1.3;
  font-weight: 400;
  letter-spacing: 0;
}
.cds--quotation-02 {
  font-size: clamp(2rem, 2rem + (3 - 2) * ((100vw - 41rem) / (66 - 41)), 3rem);
  line-height: 1.25;
  font-weight: 300;
  letter-spacing: 0;
}
```

**How to read the clamp**: `clamp(MIN, PREFERRED, MAX)`. The middle expression mixes the viewport width (`100vw`) into a linear interpolation between the small and large viewports. At 320px viewport, the preferred value resolves to MIN; at 1584px viewport (or 1056px for the heading tier), it resolves to MAX; in between, it scales smoothly with no media-query break.

### Resolved sizes at common breakpoints

| Token | 320px | 672px | 1056px | 1440px | 1584px |
|---|---|---|---|---|---|
| `fluid-display-04` | 42px | ~58px | ~75px | ~85px | 92px |
| `fluid-display-03` | 42px | ~54px | ~67px | ~73px | 76px |
| `fluid-display-02` | 42px | ~54px | ~67px | ~73px | 76px |
| `fluid-display-01` | 32px | ~46px | ~62px | ~72px | 76px |
| `fluid-heading-06` | 32px | ~41px | ~52px | ~58px | 60px |
| `fluid-heading-05` | 28px | 28px | 36px | 36px | 36px |
| `fluid-heading-04` | 28px | 28px | 32px | 32px | 32px |
| `fluid-heading-03` | 20px | 20px | 24px | 24px | 24px |
| `expressive-paragraph-01` | 24px | 24px | 32px | 32px | 32px |

Use this to sanity-check the type weight at the viewport you're designing for. Note the heading tier's piecewise behavior: it's flat below 672px and above 1056px, and only scales in the middle range.

## Expressive vs Productive contrast

The same headline rendered with Productive vs Expressive tokens behaves very differently. Productive locks to a fixed pixel size for predictable UI density; Expressive scales with the viewport so editorial content breathes on large screens.

| Surface | Token | Behavior at 375px | Behavior at 1440px | Use |
|---|---|---|---|---|
| Product UI heading | `heading-04` (productive) | 28px / weight 400 | 28px / weight 400 | Settings panel section header |
| Product UI heading | `heading-07` (productive) | 54px / weight 300 | 54px / weight 300 | Sign-in screen title |
| Marketing heading | `expressive-heading-04` | 28px / weight 400 | 32px / weight 400 | Marketing card title (subtle scale) |
| Marketing hero | `fluid-heading-06` | 32px / weight 600 | 60px / weight 600 | Sub-hero on landing page |
| Marketing hero | `fluid-display-04` | 42px / weight 300 | ~85px / weight 300 | Top-of-page editorial hero |

**Why it matters**: dropping `heading-07` (54px fixed) into a marketing hero looks small and cramped on a 1440px screen — there's empty space the type fails to fill. `fluid-display-04` solves this by growing to ~85-92px at desktop while collapsing to 42px on mobile, all from a single token. Conversely, using `fluid-display-04` inside a settings panel will overflow rows and wreck UI density — that's what Productive is for.

## Editorial composition rules

The Carbon editorial section pattern is **Eyebrow → Headline → Body → CTA**, repeated per section. Each role has a token assignment:

- **Eyebrow** — `label-01` (12px / 16px line-height / weight 600 / letter-spacing 0.32px), `text-transform: uppercase`, color `var(--cds-text-secondary)` (#525252 light / #c6c6c6 dark). Sits directly above the headline with 8-16px space-below. Acts as a kicker / category label / section identifier.
- **Headline** — `fluid-display-*` for hero sections, `fluid-heading-06`/`-05` for sub-heroes and feature blocks, `fluid-heading-04`/`-03` for card and tile titles. Color `var(--cds-text-primary)` (#161616 light / #f4f4f4 dark).
- **Body** — `body-02` (16px / 24px line-height / weight 400, from the Productive scale, used as standard editorial body) for default copy; `expressive-paragraph-01` (24-32px responsive, weight 300) for the lead paragraph directly under a hero.
- **CTA** — buttons sized `xl` (`cds--btn--xl`, 64px tall) on marketing hero; `lg` (48px) for secondary sections. Pair `primary` (filled) with `tertiary` (outline) to give one dominant action and one secondary action.

**Weight rules**: weight 300 (IBM Plex Sans Light) is the editorial signature — use it for `fluid-display-04`, `fluid-display-03`, `fluid-display-01`, `expressive-paragraph-01`, `quotation-02`. Reserve weight 600 (Semibold) for `fluid-display-02` and `fluid-heading-06` where a section needs extra anchoring weight. Use weight 400 (Regular) for `fluid-heading-05` through `-03`. Never use weight 700 (Bold) for editorial display — it reads too aggressively and breaks the IBM voice.

**Letter-spacing rules**: always `0` for any heading at or above 28px. Carbon's positive tracking (0.16-0.32px) only applies to small text (`label-01`, `helper-text-01`, `caption-01`, `code-01`).

**Line-length rules**: cap editorial body at 70-80 characters per line (≈ 32rem to 40rem max-width) for legibility. Hero headlines can run wider (60+ chars) since they're meant to fill the viewport.

## IBM.com headline pattern

A complete hero section using the editorial scale, with eyebrow + fluid-display-04 + expressive-paragraph + paired primary/tertiary buttons:

```html
<section class="hero">
  <p class="cds--label-01" style="text-transform: uppercase; color: var(--cds-text-secondary); margin-block-end: 1rem;">
    Introducing watsonx
  </p>
  <h1 class="cds--fluid-display-04" style="margin-block-end: 1.5rem; max-width: 60rem;">
    Build, deploy, and scale AI for business
  </h1>
  <p class="cds--expressive-paragraph-01" style="margin-block-end: 2.5rem; max-width: 48rem; color: var(--cds-text-primary);">
    A next-generation enterprise studio for AI builders to train, validate, tune, and deploy AI models.
  </p>
  <div class="hero__actions" style="display: flex; gap: 1rem; flex-wrap: wrap;">
    <button class="cds--btn cds--btn--primary cds--btn--xl">
      Start your free trial
    </button>
    <button class="cds--btn cds--btn--tertiary cds--btn--xl">
      Talk to a specialist
    </button>
  </div>
</section>
```

A secondary section pattern using `fluid-heading-06` for a sub-hero with `body-02`:

```html
<section class="feature">
  <p class="cds--label-01" style="text-transform: uppercase; color: var(--cds-text-secondary);">
    Foundation models
  </p>
  <h2 class="cds--fluid-heading-06" style="margin-block: 0.75rem 1rem; max-width: 48rem;">
    Train once. Tune for any task.
  </h2>
  <p class="cds--body-02" style="max-width: 36rem; color: var(--cds-text-primary);">
    Choose from a library of foundation models pre-trained on enterprise-grade data, then fine-tune them in minutes with your own examples.
  </p>
</section>
```

A 3-up feature grid using `fluid-heading-04` for tile titles with `body-02` descriptions:

```html
<section class="features">
  <div class="features__grid" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem;">
    <article class="feature-tile">
      <h3 class="cds--fluid-heading-04" style="margin-block-end: 1rem;">Open ecosystem</h3>
      <p class="cds--body-02" style="color: var(--cds-text-primary);">
        Bring your own models or choose from our library. Full Hugging Face compatibility.
      </p>
    </article>
    <article class="feature-tile">
      <h3 class="cds--fluid-heading-04" style="margin-block-end: 1rem;">Enterprise-grade</h3>
      <p class="cds--body-02" style="color: var(--cds-text-primary);">
        SOC 2 Type II, HIPAA, and GDPR compliant. Built for regulated industries.
      </p>
    </article>
    <article class="feature-tile">
      <h3 class="cds--fluid-heading-04" style="margin-block-end: 1rem;">Hybrid by design</h3>
      <p class="cds--body-02" style="color: var(--cds-text-primary);">
        Deploy on-prem, in any cloud, or at the edge. One platform, every environment.
      </p>
    </article>
  </div>
</section>
```

A pull-quote pattern using `quotation-02`:

```html
<figure class="quote">
  <blockquote class="cds--quotation-02" style="max-width: 56rem; color: var(--cds-text-primary);">
    "watsonx cut our model development time from six months to six weeks."
  </blockquote>
  <figcaption class="cds--label-01" style="text-transform: uppercase; color: var(--cds-text-secondary); margin-block-start: 1.5rem;">
    Director of AI, Fortune 100 financial services
  </figcaption>
</figure>
```

## Do / Don't

| Do | Don't |
|---|---|
| Use `fluid-display-04` (42-92px) for marketing hero headlines | Don't use `heading-07` (54px productive) for a hero — it locks to a fixed size and looks small at 1440px+ |
| Pair eyebrow + headline + body + CTA per editorial section | Don't skip the eyebrow — it is the section's identifier and provides critical hierarchy |
| Left-align long-form editorial copy | Don't center long paragraphs — center alignment kills readability past 2-3 lines |
| Use IBM Plex Sans **Light (300)** for `fluid-display-*` headlines | Don't use Bold (700) for editorial display — it breaks IBM's restrained voice |
| Use weight 0 letter-spacing on every heading ≥28px | Don't add positive tracking to display text — Carbon reserves tracking for `label-01` and helper text only |
| Use `expressive-paragraph-01` (24-32px) for the lead paragraph under a hero | Don't drop straight from `fluid-display-04` to `body-02` (16px) — the size jump is too violent |
| Keep editorial body to 70-80 characters per line (≈ `max-width: 36rem`) | Don't let body copy run the full viewport width — it becomes unreadable past ~80ch |
| Use Productive scale (`heading-01..07`, `body-01/02`) for all in-product UI | Don't use `fluid-display-*` inside dashboards, forms, or settings — it destroys UI density |
| Use `quotation-02` (weight 300) for large pull quotes | Don't bold pull quotes — light weight is the editorial signature |
| Render eyebrows in `var(--cds-text-secondary)` for visual hierarchy | Don't render eyebrows in primary text color — they should recede behind the headline |
