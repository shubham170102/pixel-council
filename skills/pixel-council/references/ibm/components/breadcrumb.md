---
name: breadcrumb
description: Carbon Breadcrumb — wayfinding component with slash-separated navigation links, default and small sizes, optional trailing slash, overflow menu for long paths, current-page styling, and skeleton loading state
metadata:
  tags: breadcrumb, wayfinding, navigation, overflow-menu, skeleton, ibm, carbon, react, web-components
---

# Breadcrumb -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Breadcrumb.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Breadcrumb/Breadcrumb.stories.js)
> - **WC story:** [`breadcrumb.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/breadcrumb/breadcrumb.stories.ts)
> - **Core SCSS:** [`_breadcrumb.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/breadcrumb/_breadcrumb.scss)
> - **WC SCSS:** [`breadcrumb.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/breadcrumb/breadcrumb.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-breadcrumb--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-breadcrumb--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/breadcrumb/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Type style (md, default) | `body-compact-01` — 14px / 18px line-height / 400 / 0.16px tracking |
| Type style (sm) | `label-01` — 12px / 16px line-height / 400 / 0.32px tracking |
| Display | `inline` (mobile) → `flex` with `flex-wrap: wrap` at `md` breakpoint (672px) |
| Item gap (md) | `margin-inline-end: var(--cds-spacing-03)` (8px) per item |
| Item gap (sm) | `margin-inline-end: var(--cds-spacing-02)` (4px) per item |
| Separator | `/` slash via `::after` pseudo-element (NOT chevron — Carbon-distinctive) |
| Separator margin (md) | `margin-inline-start: var(--cds-spacing-03)` (8px) |
| Separator margin (sm) | `margin-inline-start: var(--cds-spacing-02)` (4px) |
| Separator color | `var(--cds-text-primary)` (`#161616` light / `#f4f4f4` dark) |
| Link color (rest) | `var(--cds-link-primary)` (`#0f62fe` light / `#78a9ff` dark) |
| Link color (hover) | `var(--cds-link-primary-hover)` (`#0043ce` light / `#a6c8ff` dark) |
| Link color (active) | `var(--cds-text-primary)` (`#161616` light / `#f4f4f4` dark) |
| Current page color | `var(--cds-text-primary)` — NOT a link, `cursor: auto`, `aria-current="page"` |
| Disabled color | `var(--cds-text-disabled)` (`rgba(22, 22, 22, 0.25)` light / `rgba(244, 244, 244, 0.25)` dark) |
| Overflow menu size (md) | `block-size: 18px`, `inline-size: 16px` (`spacing-05`) |
| Overflow menu size (sm) | `block-size: 16px` (`spacing-05`), `inline-size: 16px` (`spacing-05`) |
| Overflow icon | `OverflowMenuHorizontal16` — fill `var(--cds-link-primary)`, translateY(4px) |
| Overflow underline | 1px tall × 12px wide rectangle at `inset-block-end: 2px`, fades in on hover/focus |
| Overflow caret | 7px equilateral triangle pointing up from the menu options surface |
| Skeleton link | `block-size: 1rem` (16px), `inline-size: 100px`, animated skeleton placeholder |
| Corner radius | `0` (Carbon: sharp by default — links + outlines are rectangular) |
| Font | IBM Plex Sans |
| Focus ring (overflow menu) | `outline: 1px solid var(--cds-focus)` (NOT 2px — overflow menus inside breadcrumbs intentionally use a thinner focus ring), `outline-offset: 0` |
| Focus ring (link) | `outline: 2px solid var(--cds-focus)` + `text-decoration: underline` (inherited from `cds--link`) |
| Transition | `opacity var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70ms) on overflow underline |
| React import | `import { Breadcrumb, BreadcrumbItem, BreadcrumbSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/breadcrumb/index.js';` |

## Variants (from Storybook story exports)

The React stories file exports four primary variants (plus two `!dev`-tagged visual-snapshot helpers). The WC stories file mirrors the three primary variants (`Default`, `BreadcrumbWithOverflowMenu`, `Skeleton`). All Carbon breadcrumbs are slash-separated; there is no chevron variant.

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Standard breadcrumb trail of 4 link items (`Breadcrumb 1` → `Breadcrumb 4`) separated by `/`. Trailing slash is shown by default. The first item is hand-coded as a child `<a>` inside `BreadcrumbItem`; the rest pass `href` directly on `BreadcrumbItem`. |
| BreadcrumbWithOverflowMenu | `BreadcrumbWithOverflowMenu` | Long path collapsed: items 3 and 4 are hidden behind an `OverflowMenu` (rendered as the IBM "horizontal three-dot" 16px icon) sitting between items 2 and 5. The final item (`Breadcrumb 6`) uses `isCurrentPage` (React) / `is-currentpage` (WC) — text-primary, no link styling, `aria-current="page"`. `noTrailingSlash` removes the trailing `/`. |
| BreadcrumbWithOverflowMenuSizeSmall | `BreadcrumbWithOverflowMenuSizeSmall` | Same as above but with `size="sm"` — `label-01` typography (12px), 4px gaps, 16px overflow menu. Tagged `!dev` and `!autodocs` (visual snapshot only — not surfaced in the public Storybook nav, but a real story export). |
| Skeleton | `Skeleton` | Loading state: 3 placeholder bars (default), each `1rem × 100px`, slash-separated. Pass `items={N}` (React) / `items="${N}"` (WC) to control bar count. |
| BreadcrumbWithOverflowVisualSnapshots | `BreadcrumbWithOverflowVisualSnapshots` | React-only visual-snapshot story (tagged `!dev`, `!autodocs`) that renders the overflow variant with a `play` function clicking the menu open. Used by Carbon's regression suite — agents can mirror this output for the "menu open" state but normal product UI uses `BreadcrumbWithOverflowMenu`. |
| Disabled (state, not a separate export) | any with disabled `<a>` children | A breadcrumb item whose `<a>` is disabled adopts `text-disabled` color (`rgba(22, 22, 22, 0.25)` light) and `cursor: not-allowed`. Carbon's React `BreadcrumbItem` does not expose a `disabled` prop directly — disable the inner `<a>` (or use Link's `disabled` prop) instead. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Breadcrumb.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable no-console */

import React from 'react';
import { Breadcrumb, BreadcrumbItem, BreadcrumbSkeleton } from '../Breadcrumb';
import OverflowMenu from '../OverflowMenu';
import OverflowMenuItem from '../OverflowMenuItem';
import mdx from './Breadcrumb.mdx';

export default {
  title: 'Components/Breadcrumb',
  component: Breadcrumb,
  subcomponents: {
    BreadcrumbItem,
    BreadcrumbSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  size: {
    options: ['sm', 'md'],
    control: { type: 'select' },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => (
  <Breadcrumb {...args}>
    <BreadcrumbItem>
      <a href="/#">Breadcrumb 1</a>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 3</BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 4</BreadcrumbItem>
  </Breadcrumb>
);

Default.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: BreadcrumbWithOverflowMenu**

```jsx
export const BreadcrumbWithOverflowMenu = (args) => (
  <Breadcrumb noTrailingSlash {...args}>
    <BreadcrumbItem>
      <a href="/#">Breadcrumb 1</a>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
    <BreadcrumbItem data-floating-menu-container>
      <OverflowMenu align="bottom" aria-label="Overflow menu in a breadcrumb">
        <OverflowMenuItem itemText="Breadcrumb 3" />
        <OverflowMenuItem itemText="Breadcrumb 4" />
      </OverflowMenu>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 5</BreadcrumbItem>
    <BreadcrumbItem isCurrentPage>Breadcrumb 6</BreadcrumbItem>
  </Breadcrumb>
);

BreadcrumbWithOverflowMenu.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: BreadcrumbWithOverflowMenuSizeSmall**

```jsx
export const BreadcrumbWithOverflowMenuSizeSmall = (args) => (
  <Breadcrumb noTrailingSlash {...args}>
    <BreadcrumbItem>
      <a href="/#">Breadcrumb 1</a>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
    <BreadcrumbItem data-floating-menu-container>
      <OverflowMenu align="bottom" aria-label="Overflow menu in a breadcrumb">
        <OverflowMenuItem itemText="Breadcrumb 3" />
        <OverflowMenuItem itemText="Breadcrumb 4" />
      </OverflowMenu>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 5</BreadcrumbItem>
    <BreadcrumbItem isCurrentPage>Breadcrumb 6</BreadcrumbItem>
  </Breadcrumb>
);

BreadcrumbWithOverflowMenuSizeSmall.argTypes = {
  ...sharedArgTypes,
};

BreadcrumbWithOverflowMenuSizeSmall.tags = ['!dev', '!autodocs'];

BreadcrumbWithOverflowMenuSizeSmall.args = {
  size: 'sm',
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => {
  return <BreadcrumbSkeleton {...args} />;
};

Skeleton.args = {
  items: 3,
};

Skeleton.parameters = {
  controls: { exclude: ['aria-label'] },
};

Skeleton.argTypes = {
  ...sharedArgTypes,
  items: {
    description: 'Specify the number of items',
    table: {
      defaultValue: { summary: 3 },
    },
  },
};
```

**Variant: BreadcrumbWithOverflowVisualSnapshots** (visual-snapshot only — `tags: ['!dev', '!autodocs']`)

```jsx
export const BreadcrumbWithOverflowVisualSnapshots = (args) => (
  <Breadcrumb noTrailingSlash {...args}>
    <BreadcrumbItem>
      <a href="/#">Breadcrumb 1</a>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
    <BreadcrumbItem data-floating-menu-container>
      <OverflowMenu align="bottom" aria-label="Overflow menu in a breadcrumb">
        <OverflowMenuItem itemText="Breadcrumb 3" />
        <OverflowMenuItem itemText="Breadcrumb 4" />
      </OverflowMenu>
    </BreadcrumbItem>
    <BreadcrumbItem href="#">Breadcrumb 5</BreadcrumbItem>
    <BreadcrumbItem isCurrentPage>Breadcrumb 6</BreadcrumbItem>
  </Breadcrumb>
);

BreadcrumbWithOverflowVisualSnapshots.argTypes = {
  ...sharedArgTypes,
};

BreadcrumbWithOverflowVisualSnapshots.play = async ({ canvas, userEvent }) => {
  await userEvent.click(canvas.getByRole('button'));
};

BreadcrumbWithOverflowVisualSnapshots.tags = ['!dev', '!autodocs'];
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `breadcrumb.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports + shared args/argTypes** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './breadcrumb';
import './breadcrumb-item';
import './breadcrumb-link';
import './breadcrumb-overflow-menu';
import '../overflow-menu/overflow-menu-body';
import '../overflow-menu/overflow-menu-item';
import '../overflow-menu/index';
import './breadcrumb-skeleton';
import { BREADCRUMB_SIZE } from './defs';

import { prefix } from '../../globals/settings';

import OverflowMenuHorizontal16 from '@carbon/icons/es/overflow-menu--horizontal/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';

const sizes = {
  [`Small size (${BREADCRUMB_SIZE.SMALL})`]: BREADCRUMB_SIZE.SMALL,
  [`Medium size (${BREADCRUMB_SIZE.MEDIUM})`]: BREADCRUMB_SIZE.MEDIUM,
};
const args = {
  ariaLabel: '',
  className: '',
  noTrailingSlash: false,
  size: BREADCRUMB_SIZE.MEDIUM,
};

const argTypes = {
  ariaLabel: {
    control: 'text',
    description: 'Specify the aria-label for the breadcrumb container.',
    name: 'aria-label',
  },
  className: {
    control: 'text',
    description:
      'Specify an optional className to be applied to the container node.',
  },
  noTrailingSlash: {
    control: 'boolean',
    description:
      'Optional prop to omit the trailing slash for the breadcrumbs.',
  },
  size: {
    control: 'select',
    description: 'Specify the size of the Accordion.',
    options: sizes,
  },
};
```

**Variant: Default**

```html
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const { className, ariaLabel, noTrailingSlash, size } = args ?? {};
    return html`
      <cds-breadcrumb
        ?no-trailing-slash="${noTrailingSlash}"
        .class="${className}"
        .size="${size}"
        aria-label="${ariaLabel}">
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 3</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 4</cds-breadcrumb-link>
        </cds-breadcrumb-item>
      </cds-breadcrumb>
    `;
  },
};
```

**Variant: BreadcrumbWithOverflowMenu**

```html
export const BreadcrumbWithOverflowMenu = {
  args,
  argTypes,
  render: (args) => {
    const { ariaLabel, className, noTrailingSlash, size } = args ?? {};
    return html`
      <cds-breadcrumb
        ?no-trailing-slash="${noTrailingSlash}"
        .class="${className}"
        .size="${size}"
        aria-label="${ariaLabel}">
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-overflow-menu breadcrumb align="bottom">
            ${iconLoader(OverflowMenuHorizontal16, {
              class: `${prefix}--overflow-menu__icon`,
              slot: 'icon',
            })}
            <span slot="tooltip-content"> Options </span>
            <cds-overflow-menu-body>
              <cds-overflow-menu-item>Breadcrumb 3</cds-overflow-menu-item>
              <cds-overflow-menu-item>Breadcrumb 4</cds-overflow-menu-item>
            </cds-overflow-menu-body>
          </cds-overflow-menu>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link href="#">Breadcrumb 5</cds-breadcrumb-link>
        </cds-breadcrumb-item>
        <cds-breadcrumb-item>
          <cds-breadcrumb-link is-currentpage>Breadcrumb 6</cds-breadcrumb-link>
        </cds-breadcrumb-item>
      </cds-breadcrumb>
    `;
  },
};
```

**Variant: Skeleton**

```html
const skeletonArgs = { items: 3, ...args };
const skeletonArgTypes = {
  items: {
    control: 'number',
    description: 'Specify the number of items',
  },
  ...argTypes,
};

export const Skeleton = {
  args: skeletonArgs,
  argTypes: skeletonArgTypes,
  parameters: {
    controls: {
      exclude: ['aria-label'],
    },
  },
  render: (args) => {
    const { className, noTrailingSlash, size, items } = args ?? {};
    return html`
      <cds-breadcrumb-skeleton
        .size="${size}"
        .class="${className}"
        ?no-trailing-slash="${noTrailingSlash}"
        items="${items}">
      </cds-breadcrumb-skeleton>
    `;
  },
};

const meta = {
  title: 'Components/Breadcrumb',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?no-trailing-slash`, `.size`, `aria-label`, `${iconLoader(...)}`) resolved to static attributes / inline SVG. Use this for hand-coded HTML without a component framework. The `<cds-breadcrumb>` family of custom elements internally renders an `<ol class="cds--breadcrumb">` with `<li class="cds--breadcrumb-item">` children — when there is no framework available you can output the bare list with the `cds--breadcrumb` classes directly, which is what the SCSS targets.

**Variant: Default — using the `<cds-breadcrumb>` custom elements**

```html
<cds-breadcrumb size="md" aria-label="Breadcrumb">
  <cds-breadcrumb-item>
    <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
  </cds-breadcrumb-item>
  <cds-breadcrumb-item>
    <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
  </cds-breadcrumb-item>
  <cds-breadcrumb-item>
    <cds-breadcrumb-link href="#">Breadcrumb 3</cds-breadcrumb-link>
  </cds-breadcrumb-item>
  <cds-breadcrumb-item>
    <cds-breadcrumb-link href="#">Breadcrumb 4</cds-breadcrumb-link>
  </cds-breadcrumb-item>
</cds-breadcrumb>
```

**Variant: Default — using a plain `<nav>` + `<ol>` with Carbon classes (no custom element)**

```html
<nav aria-label="Breadcrumb">
  <ol class="cds--breadcrumb">
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 1</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 2</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 3</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 4</a>
    </li>
  </ol>
</nav>
```

**Variant: BreadcrumbWithOverflowMenu — using a plain `<nav>` + `<ol>` with Carbon classes**

```html
<nav aria-label="Breadcrumb">
  <ol class="cds--breadcrumb cds--breadcrumb--no-trailing-slash">
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="/#">Breadcrumb 1</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 2</a>
    </li>
    <li class="cds--breadcrumb-item" data-floating-menu-container>
      <button class="cds--overflow-menu cds--btn--icon-only" aria-haspopup="true" aria-expanded="false" aria-label="Overflow menu in a breadcrumb" type="button">
        <svg class="cds--overflow-menu__icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" width="16" height="16" aria-hidden="true">
          <circle cx="3" cy="8" r="1"/>
          <circle cx="8" cy="8" r="1"/>
          <circle cx="13" cy="8" r="1"/>
        </svg>
      </button>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 5</a>
    </li>
    <li class="cds--breadcrumb-item cds--breadcrumb-item--current">
      <span class="cds--link" aria-current="page">Breadcrumb 6</span>
    </li>
  </ol>
</nav>
```

**Variant: BreadcrumbWithOverflowMenuSizeSmall — small size (12px label-01)**

```html
<nav aria-label="Breadcrumb">
  <ol class="cds--breadcrumb cds--breadcrumb--sm cds--breadcrumb--no-trailing-slash">
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="/#">Breadcrumb 1</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 2</a>
    </li>
    <li class="cds--breadcrumb-item" data-floating-menu-container>
      <button class="cds--overflow-menu cds--btn--icon-only" aria-haspopup="true" aria-expanded="false" aria-label="Overflow menu in a breadcrumb" type="button">
        <svg class="cds--overflow-menu__icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" width="16" height="16" aria-hidden="true">
          <circle cx="3" cy="8" r="1"/>
          <circle cx="8" cy="8" r="1"/>
          <circle cx="13" cy="8" r="1"/>
        </svg>
      </button>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 5</a>
    </li>
    <li class="cds--breadcrumb-item cds--breadcrumb-item--current">
      <span class="cds--link" aria-current="page">Breadcrumb 6</span>
    </li>
  </ol>
</nav>
```

**Variant: Skeleton — 3 items (default)**

```html
<div class="cds--breadcrumb cds--skeleton">
  <div class="cds--breadcrumb-item">
    <span class="cds--link"></span>
  </div>
  <div class="cds--breadcrumb-item">
    <span class="cds--link"></span>
  </div>
  <div class="cds--breadcrumb-item">
    <span class="cds--link"></span>
  </div>
</div>
```

**Variant: Disabled (state) — applied to a single link inside an active breadcrumb**

```html
<nav aria-label="Breadcrumb">
  <ol class="cds--breadcrumb">
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 1</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link cds--link--disabled" aria-disabled="true" tabindex="-1">Breadcrumb 2</a>
    </li>
    <li class="cds--breadcrumb-item">
      <a class="cds--link" href="#">Breadcrumb 3</a>
    </li>
  </ol>
</nav>
```

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by Breadcrumb's SCSS (`$link-primary`, `$link-primary-hover`, `$text-primary`, `$text-disabled`, `$focus`, `$icon-primary`, `$field`, `$skeleton-element`, `$spacing-02`, `$spacing-03`, `$spacing-05`, `$duration-fast-01`) to their literal hex values per theme. Breadcrumb does not expose its own component-prefixed tokens; the inner `cds--link` and `cds--overflow-menu` consume the global tokens below directly.

```css
[data-theme="white"] {
  /* Link tokens — used by every cds--link inside a cds--breadcrumb-item */
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;

  /* Text tokens — used by separator (::after), :active link, current page */
  --cds-text-primary: #161616;        /* separator color, active link, aria-current=page */
  --cds-text-secondary: #525252;      /* unused by breadcrumb itself, surfaced for surrounding labels */
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  /* Icon tokens — used by overflow menu's three-dot icon when :active */
  --cds-icon-primary: #161616;

  /* Field token — used by overflow menu options surface caret */
  --cds-field: #f4f4f4;

  /* Focus token — overflow menu uses 1px solid focus (NOT 2px); links use 2px */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;

  /* Skeleton token */
  --cds-skeleton-element: #c6c6c6;

  /* Spacing — gaps between items + separator margin */
  --cds-spacing-01: 0.125rem;   /*  2px — overflow underline inset-block-end variant */
  --cds-spacing-02: 0.25rem;    /*  4px — sm gap + sm separator margin + sm min-link-width */
  --cds-spacing-03: 0.5rem;     /*  8px — md gap + md separator margin */
  --cds-spacing-04: 0.75rem;    /* 12px — overflow underline width */
  --cds-spacing-05: 1rem;       /* 16px — overflow menu inline-size + sm overflow block-size */

  /* Motion — overflow underline fade */
  --cds-duration-fast-01: 70ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
}

[data-theme="g10"] {
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;
  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-primary: #161616;
  --cds-field: #ffffff;                /* G10 inverts field-01 vs White */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
  --cds-skeleton-element: #c6c6c6;
}

[data-theme="g90"] {
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-field: #525252;
  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;
  --cds-skeleton-element: #525252;
}

[data-theme="g100"],
.dark {
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-field: #393939;
  --cds-focus: #ffffff;
  --cds-focus-inset: #161616;
  --cds-skeleton-element: #393939;
}
```

## States Reference (from .scss)

> Pulled verbatim from `packages/styles/scss/components/breadcrumb/_breadcrumb.scss` (the cross-package source) and `packages/web-components/src/components/breadcrumb/breadcrumb.scss` (the WC shadow-DOM overrides). The breadcrumb container has no background (transparent — inherits the surface beneath it). Borders are not used. Focus is provided by `outline` on the inner overflow menu, and by inherited `cds--link` focus styles on the link items.

White theme (`[data-theme="white"]`) — link inside `cds--breadcrumb-item`:

| State | Color | Text-decoration | Outline | Cursor |
|---|---|---|---|---|
| Rest | `#0f62fe` (link-primary) | `none` | `none` | `pointer` |
| Hover | `#0043ce` (link-primary-hover) | `underline` (inherited from `cds--link:hover`) | `none` | `pointer` |
| Active | `#161616` (text-primary) | `underline` | `2px solid #0f62fe` (focus) | `pointer` |
| Focus (`:focus-visible`) | `#0f62fe` | `underline` | `2px solid #0f62fe` | `pointer` |
| Visited | `#0f62fe` (link-primary — Carbon explicitly resets `:visited` so it stays the same color) | `none` | `none` | `pointer` |
| Visited + Hover | `#0043ce` (link-primary-hover) | `underline` | `none` | `pointer` |
| Visited + Active + Hover | `#161616` (text-primary) | `underline` | `2px solid #0f62fe` | `pointer` |
| Current page (`aria-current="page"`) | `#161616` (text-primary) | `none` (`:hover` keeps `text-decoration: none`) | `none` | `auto` |
| Disabled (manual `cds--link--disabled`) | `rgba(22, 22, 22, 0.25)` (text-disabled) | `none` | `none` | `not-allowed` |

White theme — separator (`::after` pseudo-element):

| State | Color | Content | Margin-inline-start |
|---|---|---|---|
| Default (md) | `#161616` (text-primary) | `'/'` | `8px` (`spacing-03`) |
| Default (sm) | `#161616` | `'/'` | `4px` (`spacing-02`) |
| `--no-trailing-slash` last item | — | `''` (empty — slash removed) | (margin-inline-end set to `0`) |

White theme — overflow menu inside breadcrumb-item (`cds--breadcrumb-item .cds--overflow-menu`):

| State | Background | Icon fill | Outline | Underline (`::after`) |
|---|---|---|---|---|
| Rest | `transparent` | `#0f62fe` (link-primary) | `none` | `opacity: 0`, `background: #0f62fe` (focus) |
| Hover | `transparent` | `#0043ce` (link-primary-hover) | `none` | `opacity: 1`, `background: #0043ce` (link-primary-hover) |
| Focus (`:focus`) | `transparent` | `#0f62fe` | `1px solid #0f62fe` (focus, NOT 2px), `outline-offset: 0` | `opacity: 1`, `background: #0f62fe` |
| Active | `transparent` | `#161616` (icon-primary) | `none` | `opacity: 0`, `background: #161616` (text-primary) |
| Open (`cds--overflow-menu--open`) | `transparent` | `#0f62fe` | `none` (no box-shadow) | (controlled by parent state) |

G100 theme (`[data-theme="g100"]`) — link inside breadcrumb-item:

| State | Color | Text-decoration | Outline |
|---|---|---|---|
| Rest | `#78a9ff` (link-primary) | `none` | `none` |
| Hover | `#a6c8ff` (link-primary-hover) | `underline` | `none` |
| Active | `#f4f4f4` (text-primary) | `underline` | `2px solid #ffffff` (focus inverts to white in dark) |
| Focus | `#78a9ff` | `underline` | `2px solid #ffffff` |
| Current page (`aria-current="page"`) | `#f4f4f4` (text-primary) | `none` | `none` |
| Disabled | `rgba(244, 244, 244, 0.25)` (text-disabled) | `none` | `none` |

G100 theme — overflow menu:

| State | Icon fill | Outline | Underline |
|---|---|---|---|
| Rest | `#78a9ff` (link-primary) | `none` | `opacity: 0`, `background: #ffffff` (focus) |
| Hover | `#a6c8ff` (link-primary-hover) | `none` | `opacity: 1`, `background: #a6c8ff` |
| Focus | `#78a9ff` | `1px solid #ffffff`, `outline-offset: 0` | `opacity: 1`, `background: #ffffff` |
| Active | `#f4f4f4` (icon-primary) | `none` | `opacity: 0`, `background: #f4f4f4` (text-primary) |

Sizes (apply to all themes — type style, gap, and overflow dimensions are the only differences):

| Class | Type token | Px / line-height | Item gap | Separator margin | Overflow block-size | Overflow inline-size | Overflow icon translateY |
|---|---|---|---|---|---|---|---|
| `.cds--breadcrumb` (default md) | `body-compact-01` | 14px / 18px | `8px` (spacing-03) | `8px` (spacing-03) | `18px` (1.125rem) | `16px` (spacing-05) | `4px` |
| `.cds--breadcrumb--sm` | `label-01` | 12px / 16px | `4px` (spacing-02) | `4px` (spacing-02) | `16px` (spacing-05) | `16px` (spacing-05) | `3px` |

Layout breakpoint (display flips from `inline` to `flex` to enable wrapping):

| Viewport | Display | Notes |
|---|---|---|
| `< 672px` (below `md` breakpoint) | `inline` | Items render in document flow as inline boxes, allowing browser line-wrap of long trails |
| `≥ 672px` (`md` and up) | `flex` with `flex-wrap: wrap` | Items become flex children; the wrap allows multi-row breadcrumbs without horizontal overflow |

Skeleton link (apply to `.cds--breadcrumb.cds--skeleton .cds--link`):

| Property | Value |
|---|---|
| `block-size` | `1rem` (16px) |
| `inline-size` | `100px` (`convert.to-rem(100px)` = `6.25rem`) |
| Background | `var(--cds-skeleton-element)` (`#c6c6c6` light / `#393939` dark) — animated via the shared `@include skeleton` mixin |

Overflow menu options surface caret (`.cds--breadcrumb-menu-options::after`):

| Property | Value |
|---|---|
| Caret size | `7px` (`convert.to-rem(7px)`) — equilateral triangle pointing up |
| `border-block-end` | `7px solid var(--cds-field)` (`#f4f4f4` light / `#393939` dark) — the visible caret triangle |
| `border-inline-end` / `border-inline-start` | `7px solid transparent` |
| `inset-block-start` | `-7px` (caret hangs above the menu surface) |
| `inset-inline-start` | `14px` (`$caret-size * 2`) — offsets the caret to align under the trigger |

## Animation & Motion

Carbon's Breadcrumb source applies a single transition: the **opacity fade of the overflow menu's underline pseudo-element on hover/focus**. Link color changes are inherited from `cds--link` (a separate 70ms color transition). The separator (`/`) does not animate. The skeleton uses Carbon's shared `skeleton` mixin (a global animated background-position keyframe).

```css
/* From _breadcrumb.scss — overflow menu underline fade */
.cds--breadcrumb-item .cds--overflow-menu::after {
  position: absolute;
  background: var(--cds-focus);
  block-size: 1px;
  content: '';
  inline-size: 12px;             /* convert.to-rem(12px) */
  inset-block-end: 2px;
  opacity: 0;
  transition: opacity var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
  /* duration-fast-01 = 70ms */
  /* easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

.cds--breadcrumb-item .cds--overflow-menu:focus::after,
.cds--breadcrumb-item .cds--overflow-menu:hover::after {
  opacity: 1;
}

.cds--breadcrumb-item .cds--overflow-menu:hover::after {
  background: var(--cds-link-primary-hover);  /* swaps from focus blue → hover dark-blue mid-fade */
}

.cds--breadcrumb-item .cds--overflow-menu:active::after {
  background: var(--cds-text-primary);
}

@media (prefers-reduced-motion: reduce) {
  .cds--breadcrumb-item .cds--overflow-menu::after {
    transition: none;
  }
}
```

The focus outline (`outline: 1px solid var(--cds-focus)` on the overflow menu, `outline: 2px solid var(--cds-focus)` on the link) appears instantly on `:focus` / `:focus-visible` — Carbon does not animate focus rings, by design (instant feedback for keyboard users).

The skeleton placeholder bars use the shared `@include skeleton` mixin from `packages/styles/scss/utilities/_skeleton.scss`, which applies a `linear-gradient` background animated via a `skeleton` keyframe (`background-position` shifts from right to left over a longer duration). Reduced-motion is respected by the same shared mixin.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon's React `Breadcrumb` renders a `<nav aria-label="Breadcrumb">` containing an `<ol class="cds--breadcrumb">` of `<li class="cds--breadcrumb-item">` items. The `<cds-breadcrumb>` web component renders the same structure inside its shadow DOM. Use a real `<nav>` wrapper — `role="navigation"` is already implicit on the React `Breadcrumb` component.
- **`aria-label` on the nav:** Carbon's React `Breadcrumb` accepts an `aria-label` prop (default: `'Breadcrumb'`). The WC `cds-breadcrumb` accepts the matching attribute. Always provide an `aria-label` so screen readers can distinguish the breadcrumb landmark from other navs on the page (e.g., `aria-label="Project breadcrumb"`).
- **Current page (`aria-current="page"`):** The last item should mark the current location with `aria-current="page"`. In React, pass `isCurrentPage` to `BreadcrumbItem`; Carbon's source then sets `aria-current="page"` on the inner `<a>` AND swaps the color to `text-primary` AND removes the link affordance (`cursor: auto`, `:hover { text-decoration: none }`). In WC, set the `is-currentpage` attribute on `<cds-breadcrumb-link>`. In hand-coded HTML, add `aria-current="page"` to the inner element AND add `cds--breadcrumb-item--current` to the `<li>`.
- **Disabled items:** Carbon's `BreadcrumbItem` does not expose a `disabled` prop directly — disable the inner `<a>` (e.g., wrap with the Link component using `disabled={true}`, or apply `cds--link--disabled` + `aria-disabled="true"` + `tabindex="-1"` + remove `href` to a hand-coded `<a>`).
- **Overflow menu (`OverflowMenu`):**
  - The trigger button must carry `aria-label="Overflow menu in a breadcrumb"` (or similar context-providing label) so screen readers can describe its purpose. The React story and the WC story both demonstrate this label pattern.
  - The trigger uses `aria-haspopup="true"` and toggles `aria-expanded` between `false` and `true` based on menu state.
  - The collapsed items inside the overflow menu are real `<button>` (or anchor) `OverflowMenuItem` children — they remain in the keyboard tab order when the menu is open.
  - The menu options surface (`cds--breadcrumb-menu-options`) is positioned with `align="bottom"` so it opens directly beneath the trigger; the 7px caret points up to its source.
  - Wrap the parent `BreadcrumbItem` with `data-floating-menu-container` (React story does this) so the popover anchors to the breadcrumb item rather than escaping to `document.body` and losing scroll/position context.
- **Keyboard:**
  - **Tab / Shift+Tab** moves focus between the link items and the overflow menu trigger in document order.
  - **Enter / Space** activates the focused link or opens the overflow menu trigger (Carbon's `OverflowMenu` handles Space/Enter).
  - **Arrow keys** (when overflow menu is open) navigate between menu items; **Esc** closes the menu and returns focus to the trigger.
  - The current-page item (`aria-current="page"`) is rendered as a non-interactive element when used as a `<span>`, OR as an unfocusable anchor when rendered as `<a>` without `href`. Carbon does not focus the current page item by default.
- **Touch target:** Each link item's tappable area is governed by the link's own type-style line-height (`body-compact-01` md = 18px, `label-01` sm = 16px) plus surrounding padding. For mobile breadcrumbs that need to meet WCAG 2.1 SC 2.5.5 (24×24 minimum), wrap the whole `cds--breadcrumb` in a min-height query — Carbon's bare breadcrumb does not enforce 44px touch targets out of the box.
- **Color contrast (White theme):** `#0f62fe` on `#ffffff` = 4.62:1 (AA Normal). `#161616` (current page / separator) on `#ffffff` = 16.96:1 (AAA). The text-disabled `rgba(22, 22, 22, 0.25)` resolves to roughly `#bfbfbf` over white — does NOT meet AA, so disabled is intentionally low-contrast (Carbon: disabled state communicates non-interactivity, not information).
- **Color contrast (G100 theme):** `#78a9ff` on `#161616` = 7.39:1 (AAA). `#f4f4f4` (current page / separator) on `#161616` = 15.80:1 (AAA).
- **Reduced motion:** The overflow menu's underline `transition: opacity 70ms` is wrapped in `@media (prefers-reduced-motion: reduce) { transition: none }` — when set, the underline appears/disappears instantly with no fade. The skeleton shimmer is disabled by the shared `skeleton` mixin under reduced-motion.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5 & 6 when generating Carbon Breadcrumb | Don't paraphrase, rename props, or substitute generic anchor utilities |
| Use `/` slashes as the separator (Carbon's `::after { content: '/' }`) — this is the Carbon-distinctive look | Don't use chevron `>`, arrows, or middots — Carbon-distinctive separator is the slash, full stop |
| Mark the final item as `isCurrentPage` (React) / `is-currentpage` (WC) / `aria-current="page"` (HTML) — Carbon swaps it to `text-primary` with no hover affordance | Don't render the last item as a clickable link — users should not navigate to the page they're already on |
| Use `noTrailingSlash` (React) / `no-trailing-slash` (WC) when the last item is current page — the trailing slash is redundant when the last item is text, not a link | Don't keep the trailing slash after a non-link current-page item — visually it suggests another level still exists |
| Wrap the parent `BreadcrumbItem` of an `OverflowMenu` with `data-floating-menu-container` so the popover anchors to the item instead of `document.body` | Don't omit `data-floating-menu-container` — without it the menu can lose its caret alignment when the breadcrumb is inside a scroll container |
| Use the `OverflowMenu` (React) / `cds-overflow-menu` (WC) pattern from Section 5/6 to collapse middle items when the trail exceeds 4 items on desktop or 3 on mobile | Don't truncate breadcrumb text with `text-overflow: ellipsis` — collapse items into the overflow menu instead |
| Provide an `aria-label` on the `<nav>` / `<cds-breadcrumb>` (e.g., `aria-label="Project navigation"`) to disambiguate the breadcrumb from other landmarks | Don't omit the nav landmark wrapper — the breadcrumb should be a discrete navigation region for screen readers |
| Keep the slash separator color at `text-primary` (#161616 light / #f4f4f4 dark) — this is the source-of-truth value from Carbon's SCSS even though the docs description loosely calls it "secondary" | Don't recolor the separator to `--cds-text-secondary` (#525252) — Carbon's source uses `text-primary` and changing it weakens the visual rhythm of the trail |
| Use `size="sm"` (`label-01`, 12px) for compact / dense product UI like file tree headers, page-header eyebrows, or rail collapsed surfaces; default md (`body-compact-01`, 14px) for primary product navigation | Don't manually set `font-size` on `.cds--breadcrumb` — change the `size` attribute / prop instead so type token, gap, separator margin, and overflow menu dimensions all stay coordinated |
| Use the overflow menu's 1px focus outline (`outline: 1px solid var(--cds-focus)`) — this is intentionally thinner than the link's 2px focus, because the overflow menu sits inside an already-narrow breadcrumb trail | Don't override the overflow menu focus to 2px — it visually crowds adjacent items and breaks Carbon's breadcrumb rhythm |
| Use `border-radius: 0` (Carbon's sharp-corner default) — focus outlines on links and overflow menus are rectangular | Don't add `border-radius` to the breadcrumb container or focus rings |
| Use the `BreadcrumbSkeleton` component (React) / `cds-breadcrumb-skeleton` (WC) for loading states, passing `items={N}` for variable trail lengths | Don't render placeholder text like "Loading..." — Carbon's skeleton is a built-in animated placeholder that matches the final layout |
| Use `--cds-link-primary` (#0f62fe light / #78a9ff dark) for breadcrumb links sitting on `--cds-background` or `--cds-layer-01` surfaces | Don't keep `--cds-link-primary` on inverted callout bands — for `[data-theme="g100"]` breadcrumbs inside a White-theme page, switch to `--cds-link-inverse` |
