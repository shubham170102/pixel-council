---
name: link
description: Carbon Link — inline (underlined within paragraph copy), standalone (no underline at rest with optional trailing icon), and visited variants in sm/md/lg sizes, with disabled state
metadata:
  tags: link, anchor, navigation, inline-link, standalone-link, visited, ibm, carbon, react, web-components
---

# Link -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Link.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Link/Link.stories.js)
> - **WC story:** [`link.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/link/link.stories.ts)
> - **WC SCSS:** [`link.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/link/link.scss)
> - **Core SCSS:** [`_link.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/link/_link.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-link--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-link--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/link/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Type style (sm) | `helper-text-01` — 12px / 16px line-height / 400 / 0.32px tracking |
| Type style (md, default) | `body-compact-01` — 14px / 18px line-height / 400 / 0.16px tracking |
| Type style (lg) | `body-compact-02` — 16px / 22px line-height / 400 / 0 tracking |
| Icon gap (standalone) | `margin-inline-start: var(--cds-spacing-03)` (8px) |
| Icon size (sm/md) | 16 × 16 (inherits 1lh / SVG default) |
| Icon size (lg) | 20 × 20 (`block-size: 1.25rem; inline-size: 1.25rem`) |
| Corner radius | `0` (Carbon: sharp by default — links carry no radius, focus outline is rectangular) |
| Font | IBM Plex Sans |
| Default color (White theme) | `#0f62fe` (`--cds-link-primary`) |
| Default color (G100 theme) | `#78a9ff` (`--cds-link-primary`) |
| Hover color (White) | `#0043ce` (`--cds-link-primary-hover`) |
| Hover color (G100) | `#a6c8ff` (`--cds-link-primary-hover`) |
| Visited color (White) | `#8a3ffc` (`--cds-link-visited`) |
| Visited color (G100) | `#be95ff` (`--cds-link-visited`) |
| Disabled color (White) | `rgba(22, 22, 22, 0.25)` (`--cds-text-disabled`) |
| Disabled color (G100) | `rgba(244, 244, 244, 0.25)` (`--cds-text-disabled`) |
| Focus ring | `outline: 2px solid var(--cds-focus)` + `text-decoration: underline` (no inset shadow on links) |
| Transition | `color var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70ms) |
| React import | `import { Link } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/link/index.js';` |

## Variants (from Storybook story exports)

The React stories file exports three variants. The WC stories file mirrors the same three.

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Standalone link with no underline at rest, underline on hover. Used for navigation cards, footer links, "Learn more" callouts. |
| Inline | `Inline` | Always-underlined link rendered inline within a paragraph of body copy. Distinguishable from surrounding text by underline + link color. |
| PairedWithIcon | `PairedWithIcon` | Standalone link with a trailing icon (e.g., `ArrowRight 16`) slotted to the right via the `renderIcon` prop (React) or the `icon` slot (WC). Used for "Carbon Docs →"-style affordances. |
| Disabled (state, not a separate export) | `Default` with `disabled` arg | Any variant with `disabled={true}` renders as text-disabled color, no underline, `cursor: not-allowed`, no hover/focus reaction. Wired through the shared `disabled` arg in the default args block. |
| Visited (state, not a separate export) | any with `visited` arg | Any variant with `visited={true}` (or after a real `:visited` match in the browser) shows the visited token color. Wired through the shared `visited` arg. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Link.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { ArrowRight } from '@carbon/icons-react';
import Link from './Link';
import mdx from './Link.mdx';

export default {
  title: 'Components/Link',
  component: Link,
  parameters: {
    docs: {
      page: mdx,
    },
  },
  args: {
    disabled: false,
    inline: false,
    visited: false,
  },
  argTypes: {
    renderIcon: {
      table: {
        disable: true,
      },
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <Link href="#" {...args}>
      Link
    </Link>
  );
};
```

**Variant: Inline**

```jsx
export const Inline = (args) => {
  return (
    <>
      <Link {...args}>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      </Link>
      <p>
        Ut facilisis semper lorem in aliquet. Aliquam accumsan ante justo, vitae
        fringilla eros vehicula id. Ut at enim quis libero pharetra ullamcorper.
        Maecenas feugiat sodales arcu ut porttitor. In blandit ultricies est.
        Vivamus risus massa, cursus eu tellus sed, sagittis commodo nunc.{' '}
        <Link {...args}>
          Maecenas nunc mauris, consequat quis mauris sit amet
        </Link>
        , finibus suscipit nunc. Phasellus ex quam, placerat quis tempus sit
        amet, pretium nec sem. Etiam dictum scelerisque mauris, blandit ultrices
        erat pellentesque id. Quisque venenatis purus sit amet sodales
        condimentum. Duis at tincidunt orci. Ut velit ipsum, lacinia at ex quis,
        aliquet rhoncus purus. Praesent et scelerisque ligula.
      </p>
    </>
  );
};
Inline.args = {
  ...Default.args,
  inline: true,
};
```

**Variant: PairedWithIcon**

```jsx
export const PairedWithIcon = (args) => {
  return (
    <Link
      href="#"
      renderIcon={() => <ArrowRight aria-label="Arrow Right" />}
      {...args}>
      Carbon Docs
    </Link>
  );
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `link.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports + shared args/controls** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import ArrowRight16 from '@carbon/icons/es/arrow--right/16.js';
import { LINK_SIZE } from './link';
import { iconLoader } from '../../globals/internal/icon-loader';

const defaultArgs = {
  disabled: false,
  href: '#',
  inline: false,
  size: LINK_SIZE.MEDIUM,
  visited: false,
};

const controls = {
  disabled: {
    control: 'boolean',
    description: `Specify if the control should be disabled, or not`,
  },
  inline: {
    control: 'boolean',
    description: `Specify whether the link should render inline`,
  },
  href: {
    control: 'text',
    description: `Provide the href attribute for the <a> node`,
  },
  size: {
    control: 'radio',
    options: [LINK_SIZE.SMALL, LINK_SIZE.MEDIUM, LINK_SIZE.LARGE],
    description: `Specify the size of the Link. Currently supports either sm, 'md' (default) or 'lg' as an option.`,
  },
  visited: {
    control: 'boolean',
    description: `Specify whether you want the link to receive visited styles after the link has been clicked`,
  },
};
```

**Variant: Default**

```html
export const Default = {
  argTypes: controls,
  args: defaultArgs,
  render: ({ disabled, href, inline, size, visited, onClick }) => html`
    <cds-link
      ?disabled="${disabled}"
      .href="${ifDefined(href)}"
      .size="${ifDefined(size)}"
      ?inline="${inline}"
      ?visited="${visited}"
      @click="${onClick}">
      Link
    </cds-link>
  `,
};
```

**Variant: Inline**

```html
export const Inline = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    inline: true,
  },
  render: ({ disabled, href, inline, size, visited, onClick }) => html`
    <cds-link
      ?disabled="${disabled}"
      .href="${ifDefined(href)}"
      .size="${ifDefined(size)}"
      ?inline="${inline}"
      ?visited="${visited}"
      @click="${onClick}"
      >Lorem ipsum dolor sit amet, consectetur adipiscing elit.</cds-link
    >
    <p>
      Ut facilisis semper lorem in aliquet. Aliquam accumsan ante justo, vitae
      fringilla eros vehicula id. Ut at enim quis libero pharetra ullamcorper.
      Maecenas feugiat sodales arcu ut porttitor. In blandit ultricies est.
      Vivamus risus massa, cursus eu tellus sed, sagittis commodo nunc.
      <cds-link
        ?disabled="${disabled}"
        .href="${ifDefined(href)}"
        .size="${ifDefined(size)}"
        ?inline="${inline}"
        ?visited="${visited}"
        @click="${onClick}"
        >Maecenas nunc mauris, consequat quis mauris sit amet,</cds-link
      >
      finibus suscipit nunc. Phasellus ex quam, placerat quis tempus sit amet,
      pretium nec sem. Etiam dictum scelerisque mauris, blandit ultrices erat
      pellentesque id. Quisque venenatis purus sit amet sodales condimentum.
      Duis at tincidunt orci. Ut velit ipsum, lacinia at ex quis, aliquet
      rhoncus purus. Praesent et scelerisque ligula.
    </p>
  `,
};
```

**Variant: PairedWithIcon**

```html
export const PairedWithIcon = {
  args: defaultArgs,
  argTypes: controls,
  render: ({ disabled, href, size, visited, onClick }) => html`
    <cds-link
      ?disabled="${disabled}"
      .href="${ifDefined(href)}"
      .size="${ifDefined(size)}"
      ?visited="${visited}"
      @click="${onClick}">
      Carbon Docs ${iconLoader(ArrowRight16, { slot: 'icon' })}
    </cds-link>
  `,
};

const meta = {
  title: 'Components/Link',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?disabled`, `.href`, `.size`, `?inline`, `?visited`, `${iconLoader(...)}`) resolved to static attributes / SVG. Use this for hand-coded HTML without a component framework. Carbon's web component renders an internal `<a class="cds--link">` (or `<a class="cds--link cds--link--inline">`) — when there is no framework available you can output the bare anchor with the `cds--link` classes directly, which is what the SCSS targets.

**Variant: Default — using the `<cds-link>` custom element**

```html
<cds-link href="#" size="md">Link</cds-link>
```

**Variant: Default — using a plain `<a>` with Carbon classes (no custom element)**

```html
<a class="cds--link" href="#">Link</a>
```

**Variant: Inline — using the `<cds-link>` custom element**

```html
<cds-link href="#" size="md" inline>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</cds-link>
<p>
  Ut facilisis semper lorem in aliquet. Aliquam accumsan ante justo, vitae
  fringilla eros vehicula id. Ut at enim quis libero pharetra ullamcorper.
  Maecenas feugiat sodales arcu ut porttitor. In blandit ultricies est.
  Vivamus risus massa, cursus eu tellus sed, sagittis commodo nunc.
  <cds-link href="#" size="md" inline>Maecenas nunc mauris, consequat quis mauris sit amet,</cds-link>
  finibus suscipit nunc. Phasellus ex quam, placerat quis tempus sit amet,
  pretium nec sem. Etiam dictum scelerisque mauris, blandit ultrices erat
  pellentesque id. Quisque venenatis purus sit amet sodales condimentum.
  Duis at tincidunt orci. Ut velit ipsum, lacinia at ex quis, aliquet
  rhoncus purus. Praesent et scelerisque ligula.
</p>
```

**Variant: Inline — using a plain `<a>` with Carbon classes**

```html
<a class="cds--link cds--link--inline" href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
<p>
  Ut facilisis semper lorem in aliquet. Aliquam accumsan ante justo, vitae
  fringilla eros vehicula id. <a class="cds--link cds--link--inline" href="#">Maecenas nunc mauris, consequat quis mauris sit amet,</a> finibus suscipit nunc.
</p>
```

**Variant: PairedWithIcon — using the `<cds-link>` custom element with icon slot**

```html
<cds-link href="#" size="md">
  Carbon Docs
  <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" width="16" height="16" aria-hidden="true">
    <path d="M11.8 7.4 8 3.6 8.7 2.9 13.7 7.9 8.7 12.9 8 12.2 11.8 8.4 2 8.4 2 7.4z"/>
  </svg>
</cds-link>
```

**Variant: PairedWithIcon — using a plain `<a>` with Carbon classes**

```html
<a class="cds--link" href="#">
  Carbon Docs
  <span class="cds--link__icon">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" width="16" height="16" aria-label="Arrow Right">
      <path d="M11.8 7.4 8 3.6 8.7 2.9 13.7 7.9 8.7 12.9 8 12.2 11.8 8.4 2 8.4 2 7.4z"/>
    </svg>
  </span>
</a>
```

**Variant: Disabled (state) — using the `<cds-link>` custom element**

```html
<cds-link href="#" size="md" disabled>Link</cds-link>
```

**Variant: Disabled (state) — using a plain `<a>` with Carbon classes**

```html
<a class="cds--link cds--link--disabled" aria-disabled="true" tabindex="-1">Link</a>
```

**Variant: Visited (state, persistent) — using a plain `<a>` with Carbon classes**

```html
<a class="cds--link cds--link--visited" href="#">Carbon Docs</a>
```

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by Link's SCSS (`$link-primary`, `$link-primary-hover`, `$link-visited`, `$text-disabled`, `$focus`) to their literal hex values per theme. The SCSS exposes four overrideable custom properties — `--cds-link-text-color`, `--cds-link-hover-text-color`, `--cds-link-visited-text-color`, `--cds-link-focus-text-color` — which default to the four global link tokens below.

```css
[data-theme="white"] {
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;
  --cds-link-secondary: #0043ce;
  --cds-link-visited: #8a3ffc;
  --cds-link-inverse: #78a9ff;

  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
  --cds-focus-inverse: #ffffff;

  --cds-spacing-03: 0.5rem;                          /* 8px — icon gap */
  --cds-duration-fast-01: 70ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);

  /* Per-component overrides exposed by Carbon's _link.scss */
  --cds-link-text-color: var(--cds-link-primary);          /* #0f62fe */
  --cds-link-hover-text-color: var(--cds-link-primary-hover); /* #0043ce */
  --cds-link-visited-text-color: var(--cds-link-visited);  /* #8a3ffc */
  --cds-link-focus-text-color: var(--cds-focus);           /* #0f62fe */
}

[data-theme="g10"] {
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;
  --cds-link-secondary: #0043ce;
  --cds-link-visited: #8a3ffc;
  --cds-link-inverse: #78a9ff;

  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
}

[data-theme="g90"] {
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-link-secondary: #a6c8ff;
  --cds-link-visited: #be95ff;
  --cds-link-inverse: #0f62fe;

  --cds-text-disabled: rgba(244, 244, 244, 0.25);
}

[data-theme="g100"],
.dark {
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-link-secondary: #a6c8ff;
  --cds-link-visited: #be95ff;
  --cds-link-inverse: #0f62fe;

  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;

  /* Per-component overrides resolved against G100 values */
  --cds-link-text-color: var(--cds-link-primary);             /* #78a9ff */
  --cds-link-hover-text-color: var(--cds-link-primary-hover); /* #a6c8ff */
  --cds-link-visited-text-color: var(--cds-link-visited);     /* #be95ff */
  --cds-link-focus-text-color: var(--cds-focus);              /* #ffffff */
}
```

## States Reference (from .scss)

> Pulled verbatim from `packages/styles/scss/components/link/_link.scss` (the cross-package source) and `packages/web-components/src/components/link/link.scss` (the WC shadow-DOM overrides). Borders are not used — Link uses `outline` for focus and `text-decoration` for the underline. Background is always transparent (the link inherits the surface beneath it).

White theme (`[data-theme="white"]`) — standalone (`.cds--link`):

| State | Color | Text-decoration | Outline | Cursor |
|---|---|---|---|---|
| Rest | `#0f62fe` (link-primary) | `none` | `none` | `pointer` (default `<a>`) |
| Hover | `#0043ce` (link-primary-hover) | `underline` | `none` | `pointer` |
| Active (not disabled) | `#0f62fe` (link-text-color) | `underline` | `2px solid #0f62fe` (focus) | `pointer` |
| Focus (`:focus`, not disabled) | `#0f62fe` | `underline` | `2px solid #0f62fe` (focus) | `pointer` |
| Visited | `#8a3ffc` (link-visited) — only when `.cds--link--visited` is applied; default `:visited` keeps `#0f62fe` per the `&:visited { color: $link-text-color }` rule | `none` | `none` | `pointer` |
| Visited + Hover | `#0043ce` (link-primary-hover) | `underline` | `none` | `pointer` |
| Disabled | `rgba(22, 22, 22, 0.25)` (text-disabled) | `none` | `none` | `not-allowed` |

White theme — inline (`.cds--link.cds--link--inline`):

| State | Color | Text-decoration | Outline |
|---|---|---|---|
| Rest | `#0f62fe` | `underline` (always, per `.cds--link--inline { text-decoration: underline }`) | `none` |
| Hover | `#0043ce` | `underline` | `none` |
| Focus (not disabled) | `#0f62fe` | `underline` | `2px solid #0f62fe` |
| Disabled (inline) | `rgba(22, 22, 22, 0.25)` | `underline` (preserved per `.cds--link--disabled.cds--link--inline { text-decoration: underline }`) | `none` |

G100 theme (`[data-theme="g100"]`):

| State | Color | Text-decoration | Outline |
|---|---|---|---|
| Rest | `#78a9ff` | `none` (standalone) / `underline` (inline) | `none` |
| Hover | `#a6c8ff` | `underline` | `none` |
| Focus (not disabled) | `#78a9ff` | `underline` | `2px solid #ffffff` (focus inverts to white in dark) |
| Active (not disabled) | `#78a9ff` | `underline` | `2px solid #ffffff` |
| Visited (`.cds--link--visited`) | `#be95ff` | `none` (standalone) / `underline` (inline) | `none` |
| Visited + Hover | `#a6c8ff` | `underline` | `none` |
| Disabled | `rgba(244, 244, 244, 0.25)` | `none` (standalone) / `underline` (inline) | `none` |

Sizes (apply to all themes — type style is the only difference):

| Class | Type token | Px / line-height |
|---|---|---|
| `.cds--link--sm` | `helper-text-01` | 12px / 16px |
| `.cds--link` (default md) | `body-compact-01` | 14px / 18px |
| `.cds--link--lg` | `body-compact-02` | 16px / 22px |

Icon sizing (standalone with `renderIcon` / `slot="icon"`):

| Class | Icon block-size | Icon inline-size | Margin-inline-start |
|---|---|---|---|
| `.cds--link__icon` (sm/md) | `1lh` (matches line-height) | inherits SVG default 16px | `var(--cds-spacing-03)` = 8px |
| `.cds--link--lg .cds--link__icon` | `1.25rem` (20px) | `1.25rem` (20px) | `var(--cds-spacing-03)` = 8px |

## Animation & Motion

Carbon's Link source applies a single color transition. There is no transform, no scale, no background animation. The underline does not animate — it appears/disappears synchronously with hover. From `_link.scss`:

```css
.cds--link {
  transition: color var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
  /* duration-fast-01 = 70ms */
  /* easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

@media (prefers-reduced-motion: reduce) {
  .cds--link { transition: none; }
}
```

The focus outline (`2px solid var(--cds-focus)`) appears instantly on `:focus` / `:focus-visible` — Carbon does not animate focus rings, by design (instant feedback for keyboard users).

## Accessibility (from Carbon's docs + source)

- **Semantic element:** `<a>`. The `<cds-link>` web component renders an internal `<a>` anchor inside its shadow DOM; the React `<Link>` returns an `<a>` directly. If `href` is not provided, Carbon still renders an `<a>` (use it as a button-shaped affordance only when no real navigation target exists — otherwise prefer a real Button component).
- **`renderIcon` / `slot="icon"` ARIA:** the React story passes `aria-label="Arrow Right"` directly on the `<ArrowRight />` SVG. The WC story uses `iconLoader(ArrowRight16, { slot: 'icon' })` which renders an `aria-hidden` SVG inside `<span class="cds--link__icon">` — the surrounding link text carries the accessible name. Either pattern is valid; never duplicate the icon meaning in both the SVG label and the link text.
- **Disabled:** Carbon sets `color: $text-disabled` and `cursor: not-allowed`. The React `<Link disabled>` and the WC `?disabled` attribute also drop the `href` (so the anchor is no longer focusable / clickable). For hand-coded plain `<a>` markup, set `aria-disabled="true"` and `tabindex="-1"` and remove `href` to match.
- **Keyboard:** Standard anchor behaviour — Tab focuses, Enter activates. No custom keyboard handling is added by Carbon.
- **Focus management:** The `:focus:not(.cds--link--disabled)` rule applies `outline: 2px solid var(--cds-focus)` plus `text-decoration: underline`. **Do NOT remove either** — the underline-on-focus is part of Carbon's WCAG 2.1 SC 1.4.1 (Use of Color) story for inline links inside paragraphs, where color alone is not sufficient to identify the link in a sentence.
- **Visited:** `.cds--link.cds--link--visited` is a manual opt-in class; the default `&:visited { color: $link-text-color }` rule means browsers' real `:visited` pseudo-class does NOT change the color unless you also apply `.cds--link--visited`. This is intentional — Carbon's color-contrast guarantees only hold for `link-primary` and `link-visited` together when the consumer opts in.
- **Touch target:** Inline links in body copy are not required to meet 44 × 44 minimums (WCAG 2.1 SC 2.5.5 has the inline exception). Standalone links should sit on a row tall enough to give a 24-line × 44-px tappable region — Carbon's `body-compact-02` (lg, 22px line-height) plus surrounding spacing typically achieves this on mobile.
- **Color contrast (White theme):** `#0f62fe` on `#ffffff` = 4.62:1 (AA Normal). `#0f62fe` on `#f4f4f4` (layer-01) = 4.42:1 (AA Normal).
- **Color contrast (G100 theme):** `#78a9ff` on `#161616` = 7.39:1 (AAA Normal). `#78a9ff` on `#262626` (layer-01) = 6.51:1 (AAA Normal).

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5 & 6 when generating Carbon Link | Don't paraphrase, rename props, or substitute generic anchor utilities |
| Use `<Link inline>` (React) / `<cds-link inline>` (WC) for links **inside paragraphs of body copy** — they are always underlined | Don't use the standalone (default) variant inside a paragraph — without an underline it is not distinguishable from surrounding text in monochrome printouts or for color-blind users |
| Use the standalone (default) variant for **isolated** "Learn more", footer, or callout links — pair it with the trailing arrow icon (`PairedWithIcon`) when it sits alone in a card or row | Don't add an underline to the standalone variant at rest — it must appear at hover only (Carbon's source does this automatically) |
| Set `border-radius: 0` (Carbon's sharp-corner default) on any focus-ring container — Carbon's link focus is a **rectangular** 2px outline | Don't add `border-radius` to focus rings or wrap links in pill-shaped focus containers |
| Apply `.cds--link--visited` (or React `visited` prop) only when you actually want the visited token (`#8a3ffc` light / `#be95ff` dark) — Carbon's default suppresses browser `:visited` color | Don't rely on the browser's default `:visited` to recolor links — Carbon overrides it to `link-primary` so visited state is a deliberate opt-in |
| Use `size="sm"` (`helper-text-01`, 12px) for footer / caption / metadata links, `size="md"` (default, 14px) for body copy and product UI, `size="lg"` (16px) for marketing/expressive surfaces | Don't manually set `font-size` — change `size` instead so the type token, line-height, and (for lg) icon size all stay coordinated |
| Pair a 16px `ArrowRight` (sm/md) or 20px (lg) with the standalone variant only — the `cds--link__icon` span sits at `text-bottom` baseline | Don't add icons to the inline variant — the underline + icon collide visually inside body copy |
| For disabled links rendered as plain `<a>` (no framework), include `aria-disabled="true"` and `tabindex="-1"` and remove `href` | Don't use `pointer-events: none` alone for disabled — screen readers still announce the link as actionable |
| Keep the focus-state underline (`text-decoration: underline` on `:focus`) — it is required for WCAG SC 1.4.1 in body copy | Don't override `:focus { text-decoration: none }` — color alone is not a sufficient affordance for inline links |
| Use `--cds-link-inverse` (`#78a9ff` light / `#0f62fe` dark) when a link sits on an **inverted** surface (e.g., a White-theme link inside a `[data-theme="g100"]` callout band) | Don't keep `--cds-link-primary` on inverted surfaces — the contrast inverts and you'll fail AA |
