---
name: pagination
description: Carbon Pagination — full data-table footer (items-per-page select + range count + prev/next + page select) and PaginationNav (standalone numbered page buttons with overflow ellipsis). Sizes sm/md/lg, sharp corners, top border separator, --cds-layer-01 background.
metadata:
  tags: pagination, paging, page-nav, data-table-footer, page-size, items-per-page, page-select, prev-next, ibm, carbon, react, web-components, enterprise
---

# Pagination -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (Pagination):** [`Pagination.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Pagination/Pagination.stories.js)
> - **React story (PaginationNav):** [`PaginationNav.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/PaginationNav/PaginationNav.stories.js)
> - **WC story (Pagination):** [`pagination.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/pagination/pagination.stories.ts)
> - **WC story (PaginationNav):** [`pagination-nav.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/pagination-nav/pagination-nav.stories.ts)
> - **SCSS source (Pagination):** [`_pagination.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/pagination/_pagination.scss)
> - **SCSS source (PaginationNav):** [`_pagination-nav.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/pagination-nav/_pagination-nav.scss)
> - **Storybook live (React Pagination):** https://react.carbondesignsystem.com/?path=/story/components-pagination--default
> - **Storybook live (React PaginationNav):** https://react.carbondesignsystem.com/?path=/story/components-paginationnav--default
> - **Storybook live (WC Pagination):** https://web-components.carbondesignsystem.com/?path=/story/components-pagination--default
> - **Storybook live (WC PaginationNav):** https://web-components.carbondesignsystem.com/?path=/story/components-pagination-nav--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/pagination/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

Pagination is Carbon's data-table footer — the full strip that appears beneath a `DataTable` to control which slice of records is visible. It composes three regions: a "Items per page: {select}" picker on the left, an "{start}-{end} of {total} items" count in the centre, and prev/next icon buttons + a page select on the right. PaginationNav is the standalone alternative — a numbered button bar (1, 2, 3, ..., 10) with an ellipsis overflow for collapsed ranges. Use Pagination for tables; use PaginationNav for content pages (search results, blog archives, image galleries) where the user wants direct jump-to-page control.

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg) | `32px` / `40px` (default) / `48px` |
| Corner radius | `0` (Carbon: sharp by default — no rounding on the strip, the select boxes, or the icon buttons) |
| Background (light themes) | `#ffffff` (`--cds-layer-01` on White) / `#f4f4f4` (`--cds-layer-01` on G10) |
| Background (dark themes) | `#393939` (`--cds-layer-01` on G90) / `#262626` (`--cds-layer-01` on G100) |
| Top border (separator from table) | `1px solid var(--cds-border-subtle-01)` — White: `#e0e0e0`, G100: `#393939` |
| Inline borders (left/right strip dividers) | `1px solid var(--cds-border-subtle)` between left region / count / right region |
| Type style | `body-compact-01` — IBM Plex Sans, `14px` / `18px`, weight `400`, letter-spacing `0.16px` |
| Text colour (labels) | `--cds-text-primary` — White: `#161616`, G100: `#f4f4f4` |
| Text colour (range count) | `--cds-text-secondary` — White: `#525252`, G100: `#c6c6c6` |
| Inline-size | `calc(100% - 1px)` (subtracts a hairline so the strip aligns with the parent table border) |
| Container query breakpoint | `42rem` (672px) — below this the prev/next buttons collapse and labels hide |
| Prev / next button size | matches the strip height: `32px × 32px` (sm), `40px × 40px` (md), `48px × 48px` (lg) |
| Prev / next icon | `chevron--left 16` / `chevron--right 16` from `@carbon/icons` |
| Prev / next icon fill | `--cds-icon-primary` (rest), `--cds-icon-disabled` at start/end |
| Hover background (buttons + selects) | `--cds-layer-hover` — White: `#e8e8e8`, G100: `#333333` |
| Focus ring | `2px solid var(--cds-focus)` inset (via `focus-outline('outline')` mixin) |
| Transition | `outline 110ms cubic-bezier(0.2,0,0.38,0.9), background-color 110ms cubic-bezier(0.2,0,0.38,0.9)` |
| **PaginationNav heights (sm / md / lg)** | `32px` / `40px` / `48px` (uses `layout.size('height')`, default `lg`) |
| PaginationNav active page | `font-weight: 600`, underline pseudo, color `--cds-text-primary` |
| PaginationNav overflow | `…` ellipsis trigger that opens a `<select>` for hidden page indices (configurable `disableOverflow`) |
| PaginationNav `itemsShown` minimum | 4 (or `totalItems` if smaller) |
| Pagination React import | `import { Pagination } from '@carbon/react';` |
| PaginationNav React import | `import { PaginationNav } from '@carbon/react';` |
| Pagination WC import | `import '@carbon/web-components/es/components/pagination/index.js';` (auto-imports `cds-select-item` peer) |
| PaginationNav WC import | `import '@carbon/web-components/es/components/pagination-nav/index.js';` |

## Variants (from Storybook story exports)

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| **Pagination** | | | Full footer strip — items-per-page + count + prev/next + page select |
| Default | `Default` | `Default` | The canonical layout. `pageSizes={[10,20,30,40,50]}`, `totalItems={103}`, `page={1}`. |
| Multiple Pagination components | `MultiplePaginationComponents` | `MultiplePaginationComponents` | Two stacked Paginations — used to verify they don't collide visually (top + bottom of a long table). |
| Pagination with custom page sizes label | `PaginationWithCustomPageSizesLabel` | `PaginationWithCustomPageSizesLabel` | Replaces the default `10`, `20`, ... labels with `Ten`, `Twenty`, ... — demonstrates the `{ text, value }` shape for `pageSizes`. |
| Unknown pages and items | `PaginationUnknownPages` | `PaginationUnknownPages` (`name: 'Unknown pages and items'`) | `pagesUnknown` mode — count text becomes `"Item 1-10"` (no total), page select hidden, prev/next remain. For infinite or streaming data sets. |
| **PaginationNav** | | | Standalone numbered page buttons |
| Default | `Default` | `Default` | Numbered buttons `1 2 3 ... 10` with `<` and `>` ends. `itemsShown=10`, `totalItems=25`, `page=0`. Tooltip-positionable next/prev (WC only). |

## React (Pagination) — verbatim from Storybook

> The code below is copied verbatim from `Pagination.stories.js` on the Carbon `main` branch. Do NOT edit it — the Carbon source is the truth.

```jsx
/**
 * Copyright IBM Corp. 2016, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import Pagination from './Pagination';
import React from 'react';
import { action } from 'storybook/actions';
import mdx from './Pagination.mdx';

const props = () => ({
  disabled: false,
  page: 1,
  totalItems: 103,
  pagesUnknown: false,
  pageInputDisabled: undefined,
  pageSizeInputDisabled: undefined,
  backwardText: 'Previous',
  forwardText: 'Next',
  pageSize: 10,
  pageSizes: [10, 20, 30, 40, 50],
  itemsPerPageText: 'Items per page:',
  onChange: action('onChange'),
});

export default {
  title: 'Components/Pagination',
  component: Pagination,
  argTypes: {
    size: {
      options: ['sm', 'md', 'lg'],
      control: { type: 'select' },
    },
  },
  args: {
    size: 'md',
  },
  decorators: [
    (story) => (
      <div style={{ maxWidth: '800px', marginTop: '15px' }}>{story()}</div>
    ),
  ],
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

export const Default = (args) => {
  return <Pagination pageSizes={[10, 20, 30, 40, 50]} {...args} />;
};

Default.args = {
  backwardText: 'Previous',
  forwardText: 'Next',
  disabled: false,
  isLastPage: false,
  itemsPerPageText: 'Items per page:',
  page: 1,
  pageInputDisabled: false,
  pageSize: 10,
  pageSizes: [10, 20, 30, 40, 50],
  pageNumberText: 'Page Number',
  pagesUnknown: false,
  pageSizeInputDisabled: false,
  totalItems: 103,
};

Default.argTypes = {
  className: {
    control: false,
  },
  id: {
    control: false,
  },
  itemText: {
    control: false,
  },
  backwardText: {
    control: {
      type: 'text',
    },
  },
  forwardText: {
    control: {
      type: 'text',
    },
  },
  disabled: {
    control: {
      type: 'boolean',
    },
  },
  isLastPage: {
    control: {
      type: 'boolean',
    },
  },
  itemsPerPageText: {
    control: {
      type: 'text',
    },
  },
  page: {
    control: {
      type: 'number',
    },
  },
  pageInputDisabled: {
    control: {
      type: 'boolean',
    },
  },
  pageSize: {
    control: {
      type: 'number',
    },
  },
  pageSizes: {
    control: {
      type: 'array',
    },
  },
  pageNumberText: {
    control: {
      type: 'text',
    },
  },
  pagesUnknown: {
    control: {
      type: 'boolean',
    },
  },
  pageSizeInputDisabled: {
    control: {
      type: 'boolean',
    },
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
  totalItems: {
    control: {
      type: 'number',
    },
  },
};

export const MultiplePaginationComponents = (args) => {
  return (
    <div>
      <Pagination {...props()} {...args} />
      <Pagination {...props()} {...args} />
    </div>
  );
};

MultiplePaginationComponents.storyName = 'Multiple Pagination components';

export const PaginationWithCustomPageSizesLabel = (args) => {
  return (
    <div>
      <Pagination
        {...props()}
        pageSizes={[
          { text: 'Ten', value: 10 },
          { text: 'Twenty', value: 20 },
          { text: 'Thirty', value: 30 },
          { text: 'Forty', value: 40 },
          { text: 'Fifty', value: 50 },
        ]}
        {...args}
      />
    </div>
  );
};

PaginationWithCustomPageSizesLabel.storyName =
  'Pagination with custom page sizes label';

export const PaginationUnknownPages = (args) => {
  const { pageInputDisabled, pagesUnknown, totalItems, ...rest } = args ?? {};

  return (
    <div>
      <Pagination
        {...props()}
        page={1}
        {...rest}
        pagesUnknown
        totalItems={undefined}
      />
    </div>
  );
};

PaginationUnknownPages.storyName = 'Unknown pages and items';
PaginationUnknownPages.parameters = {
  controls: {
    exclude: ['pageInputDisabled', 'pagesUnknown', 'totalItems'],
  },
};
```

## React (PaginationNav) — verbatim from Storybook

> The code below is copied verbatim from `PaginationNav.stories.js` on the Carbon `main` branch.

```jsx
/**
 * Copyright IBM Corp. 2020, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import PaginationNav from '../PaginationNav';
import mdx from './PaginationNav.mdx';

export default {
  title: 'Components/PaginationNav',
  component: PaginationNav,
  subcomponents: {},
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['translateWithId'],
    },
  },
};

export const Default = (args) => {
  return (
    <div style={{ width: '800px' }}>
      <PaginationNav totalItems={25} {...args} />
    </div>
  );
};

Default.args = {
  size: 'lg',
  loop: false,
  itemsShown: 10,
  page: 0,
  totalItems: 25,
  disableOverflow: false,
};

Default.argTypes = {
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
  loop: {
    control: {
      type: 'boolean',
    },
  },
  itemsShown: {
    control: {
      type: 'number',
    },
  },
  page: {
    control: {
      type: 'number',
    },
  },
  totalItems: {
    control: {
      type: 'number',
    },
  },
  disableOverflow: {
    control: {
      type: 'boolean',
    },
  },
};
```

## Web Components (Pagination) — verbatim from Storybook

> The code below is copied verbatim from `pagination.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

```ts
/**
 * Copyright IBM Corp. 2019, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './index';
import '../select/index';

import { PAGINATION_SIZE } from './defs';
import { html } from 'lit';
import { action } from 'storybook/actions';

const sizes = {
  [`Small size (${PAGINATION_SIZE.SMALL})`]: PAGINATION_SIZE.SMALL,
  [`Medium size (${PAGINATION_SIZE.MEDIUM})`]: PAGINATION_SIZE.MEDIUM,
  [`Large size (${PAGINATION_SIZE.LARGE})`]: PAGINATION_SIZE.LARGE,
};

const args = {
  backwardText: 'Previous',
  disabled: false,
  forwardText: 'Next',
  isLastPage: false,
  itemsPerPageText: 'Items per page:',
  page: 1,
  pageSize: 10,
  pageInputDisabled: false,
  pageSizeInputDisabled: false,
  pagesUnknown: false,
  size: PAGINATION_SIZE.MEDIUM,
  totalItems: 103,
};

const argTypes = {
  backwardText: {
    control: 'text',
    description: 'The description for the backward icon.',
  },
  disabled: {
    control: 'boolean',
    description:
      '<code>true</code> if the backward/forward buttons, as well as the page select elements, should be disabled.',
  },
  forwardText: {
    control: 'text',
    description: 'The description for the forward icon.',
  },
  isLastPage: {
    control: 'boolean',
    description:
      '<code>true</code> if the current page should be the last page.',
  },
  itemsPerPageText: {
    control: 'text',
    description: 'The text indicating the number of items per page.',
  },
  page: {
    control: 'number',
    description: 'The current page.',
  },
  pageSize: {
    control: 'number',
    description: 'The number dictating how many items a page contains.',
  },
  pageInputDisabled: {
    control: 'boolean',
    description:
      '<code>true</code> if the select box to change the page should be disabled.',
  },
  pageSizeInputDisabled: {
    control: 'boolean',
    description:
      '<code>true</code> if the select box to change the items per page should be disabled.',
  },
  pagesUnknown: {
    control: 'boolean',
    description: '<code>true</code> if the total number of items is unknown.',
  },
  size: {
    control: 'select',
    description: 'Specify the size of the Pagination.',
    options: sizes,
  },
  totalItems: {
    control: 'number',
    description: 'The total number of items.',
  },
};

export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      backwardText,
      disabled,
      forwardText,
      isLastPage,
      itemsPerPageText,
      page,
      pageInputDisabled,
      pageSize,
      pageSizeInputDisabled,
      pagesUnknown,
      size,
      totalItems,
    } = args ?? {};
    return html`
      <cds-pagination
        backward-text=${backwardText}
        ?disabled=${disabled}
        forward-text=${forwardText}
        ?is-last-page=${isLastPage}
        items-per-page-text=${itemsPerPageText}
        page=${page}
        page-size=${pageSize}
        ?page-input-disabled=${pageInputDisabled}
        ?page-size-input-disabled=${pageSizeInputDisabled}
        size=${size}
        ?pages-unknown=${pagesUnknown}
        total-items=${totalItems}
        @cds-page-sizes-select-changed=${(event: CustomEvent) => {
          action('cds-page-sizes-select-changed')(event.detail);
        }}
        @cds-pagination-changed-current=${(event: CustomEvent) => {
          action('cds-pagination-changed-current')(event.detail);
        }}>
        <cds-select-item value="10">10</cds-select-item>
        <cds-select-item value="20">20</cds-select-item>
        <cds-select-item value="30">30</cds-select-item>
        <cds-select-item value="40">40</cds-select-item>
        <cds-select-item value="50">50</cds-select-item>
      </cds-pagination>
    `;
  },
};

// --- Less-essential variants — render bodies condensed (full source upstream) ---
// Each variant below uses the same args/argTypes block above and the same
// <cds-pagination> attribute mapping as Default. Only the documented delta is
// shown; see the upstream story file for the full verbatim render functions:
// https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/pagination/pagination.stories.ts

export const MultiplePaginationComponents = {
  // Renders TWO sibling <cds-pagination> elements with the same args spread —
  // used to verify a top + bottom pair on a long table doesn't visually collide.
  render: (args) => html`<cds-pagination ...></cds-pagination><cds-pagination ...></cds-pagination>`,
};

export const PaginationUnknownPages = {
  name: 'Unknown pages and items',
  args: { totalItems: undefined },
  parameters: { controls: { exclude: ['pageInputDisabled', 'pagesUnknown', 'totalItems'] } },
  // Same render as Default but forces ?pages-unknown=${true} and .totalItems=${undefined};
  // count text becomes "Item 1-10" with no total, page-jump select is hidden.
  render: (args) => html`<cds-pagination ?pages-unknown=${true} .totalItems=${undefined} ...></cds-pagination>`,
};

export const PaginationWithCustomPageSizesLabel = {
  // Same render as Default; the only change is the <cds-select-item> labels:
  // value="10" → "Ten", "20" → "Twenty", "30" → "Thirty", "40" → "Forty", "50" → "Fifty".
  render: (args) => html`<cds-pagination ...><cds-select-item value="10">Ten</cds-select-item>…</cds-pagination>`,
};

const meta = {
  title: 'Components/Pagination',
  decorators: [(story) => html`<div style="max-width: 800px">${story()}</div>`],
  argTypes,
  args,
};

export default meta;
```

## Web Components (PaginationNav) — verbatim from Storybook

> The code below is copied verbatim from `pagination-nav.stories.ts` on the Carbon `main` branch.

```ts
/**
 *
 * Copyright IBM Corp. 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit-element';
import './index';
import { ifDefined } from 'lit/directives/if-defined.js';
import {
  PAGINATION_NAV_SIZE,
  PAGINATION_TOOLTIP_ALIGNMENT,
  PAGINATION_TOOLTIP_POSITION,
} from './defs';

const args = {
  size: PAGINATION_NAV_SIZE.LARGE,
  loop: false,
  itemsShown: 10,
  page: 0,
  totalItems: 25,
  disableOverflow: false,
  tooltipAlignment: PAGINATION_TOOLTIP_ALIGNMENT.CENTER,
  tooltipPosition: PAGINATION_TOOLTIP_POSITION.BOTTOM,
};

const argTypes = {
  size: {
    control: 'select',
    description: 'Specify the size of the PaginationNav. `sm` `md` `lg`',
    options: [
      PAGINATION_NAV_SIZE.SMALL,
      PAGINATION_NAV_SIZE.MEDIUM,
      PAGINATION_NAV_SIZE.LARGE,
    ],
  },
  loop: {
    control: 'boolean',
    description:
      'Whether user should be able to loop through the items when reaching first / last.',
  },
  itemsShown: {
    control: 'number',
    description:
      'The number of items to be shown (minimum of 4 unless items < 4).',
  },
  page: {
    control: 'number',
    description: 'The index of current page.',
  },
  totalItems: {
    control: 'number',
    description: 'The total number of items.',
  },
  disableOverflow: {
    control: 'boolean',
    description:
      'If true, the `...` pagination overflow will not render page links between the first and last rendered buttons. Set this to true if you are having performance problems with large data sets.',
  },
  tooltipAlignment: {
    control: 'radio',
    description:
      'Specify the alignment of the tooltip for the icon-only next/prev buttons. Can be one of: start, center, or end.',
    options: [
      PAGINATION_TOOLTIP_ALIGNMENT.START,
      PAGINATION_TOOLTIP_ALIGNMENT.CENTER,
      PAGINATION_TOOLTIP_ALIGNMENT.END,
    ],
  },
  tooltipPosition: {
    control: 'radio',
    description:
      'Specify the position of the tooltip for the icon-only next/prev buttons. Can be one of: top, right, bottom, or left.',

    options: [
      PAGINATION_TOOLTIP_POSITION.TOP,
      PAGINATION_TOOLTIP_POSITION.RIGHT,
      PAGINATION_TOOLTIP_POSITION.BOTTOM,
      PAGINATION_TOOLTIP_POSITION.LEFT,
    ],
  },
};

export const Default = {
  args,
  argTypes,
  render: ({
    disableOverflow,
    loop,
    itemsShown,
    page,
    size,
    tooltipAlignment,
    tooltipPosition,
    totalItems,
  }) => html`
    <cds-pagination-nav
      ?disable-overflow="${disableOverflow}"
      ?loop="${loop}"
      items-shown="${itemsShown}"
      page="${ifDefined(page)}"
      size="${ifDefined(size)}"
      tooltip-alignment="${ifDefined(tooltipAlignment)}"
      tooltip-position="${ifDefined(tooltipPosition)}"
      total-items="${ifDefined(totalItems)}">
    </cds-pagination-nav>
  `,
};

const meta = {
  title: 'Components/Pagination Nav',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`${expression}`) resolved to literal attributes. Use this for hand-coded HTML without a component framework. The `cds-*` custom elements still require `@carbon/web-components` to be loaded on the page. Only the canonical Default examples are kept here — the variant deltas (`pages-unknown`, `disabled`, `size="sm"|"lg"`, custom page-size labels, `loop`, `disable-overflow`) are documented in the WC story above; just toggle the matching attribute on the markup below.

**Pagination — Default (md, 103 total items, 10 per page, page 1)**

```html
<cds-pagination
  backward-text="Previous"
  forward-text="Next"
  items-per-page-text="Items per page:"
  page="1"
  page-size="10"
  size="md"
  total-items="103">
  <cds-select-item value="10">10</cds-select-item>
  <cds-select-item value="20">20</cds-select-item>
  <cds-select-item value="30">30</cds-select-item>
  <cds-select-item value="40">40</cds-select-item>
  <cds-select-item value="50">50</cds-select-item>
</cds-pagination>
```

**PaginationNav — Default (lg, 25 items, 10 shown, current page = 0)**

```html
<cds-pagination-nav
  items-shown="10"
  page="0"
  size="lg"
  total-items="25"
  tooltip-alignment="center"
  tooltip-position="bottom">
</cds-pagination-nav>
```

Variant attribute deltas (apply to the markup above):
- `pagesUnknown`: add `pages-unknown` and remove `total-items` — count becomes "Item 1-10", page-jump select is hidden.
- Disabled strip: add `disabled` to `<cds-pagination>`.
- Size: change `size="md"` to `"sm"` (32px) or `"lg"` (48px).
- Custom page-size labels: change inner text of `<cds-select-item>` (e.g. `value="10">Ten`).
- PaginationNav `disable-overflow`: add the boolean attribute to skip the `…` overflow rendering (use for very large data sets).
- PaginationNav `loop`: add the boolean attribute so next-from-last wraps to first.

## Internal DOM (rendered structure for both components)

> The Storybook source is declarative (you only set props). At runtime Carbon expands `<cds-pagination>` into the structure below. Inspect the live story DOM for the canonical output; the skeleton below mirrors `_pagination.scss`'s class hierarchy.

**Pagination — rendered**

```html
<div class="cds--pagination cds--pagination--md">  <!-- size class: --sm | (md default, no class) | --lg -->
  <div class="cds--pagination__left">
    <label id="page-size-label" class="cds--pagination__text">Items per page:</label>
    <div class="cds--form-item">
      <div class="cds--select cds--select--inline cds--select__item-count">
        <select class="cds--select-input" aria-labelledby="page-size-label">
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="30">30</option>
          <option value="40">40</option>
          <option value="50">50</option>
        </select>
        <svg class="cds--select__arrow" focusable="false" aria-hidden="true" width="10" height="6" viewBox="0 0 10 6">
          <path d="M5 6L0 1 .7.3 5 4.6 9.3.3l.7.7z"/>
        </svg>
      </div>
    </div>
    <span class="cds--pagination__text cds--pagination__items-count">1–10 of 103 items</span>
  </div>

  <div class="cds--pagination__right">
    <div class="cds--form-item">
      <div class="cds--select cds--select--inline">
        <select class="cds--select-input" aria-label="Page number">
          <option value="1">1</option>
          <option value="2">2</option>
          <!-- …one option per page… -->
          <option value="11">11</option>
        </select>
        <svg class="cds--select__arrow" focusable="false" aria-hidden="true" width="10" height="6" viewBox="0 0 10 6">
          <path d="M5 6L0 1 .7.3 5 4.6 9.3.3l.7.7z"/>
        </svg>
      </div>
    </div>
    <span class="cds--pagination__text cds--pagination__page-text">of 11 pages</span>

    <div class="cds--pagination__control-buttons">
      <button type="button" class="cds--pagination__button cds--pagination__button--backward"
              aria-label="Previous page" disabled>
        <svg focusable="false" aria-hidden="true" width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
          <!-- @carbon/icons chevron--left 16 -->
          <path d="M5 8L10 3 10.7 3.7 6.4 8 10.7 12.3 10 13z"/>
        </svg>
      </button>
      <button type="button" class="cds--pagination__button cds--pagination__button--forward"
              aria-label="Next page">
        <svg focusable="false" aria-hidden="true" width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
          <!-- @carbon/icons chevron--right 16 -->
          <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
        </svg>
      </button>
    </div>
  </div>
</div>
```

**PaginationNav — rendered** (`itemsShown=10`, `totalItems=25`, current page index `0` → button `1` active)

```html
<nav class="cds--pagination-nav" aria-label="Pagination Navigation">
  <ul class="cds--pagination-nav__list">
    <li class="cds--pagination-nav__list-item">
      <button class="cds--pagination-nav__page cds--pagination-nav__page--direction"
              aria-label="Previous page" disabled>
        <svg class="cds--pagination-nav__icon" focusable="false" aria-hidden="true"
             width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
          <path d="M5 8L10 3 10.7 3.7 6.4 8 10.7 12.3 10 13z"/>
        </svg>
      </button>
    </li>
    <li class="cds--pagination-nav__list-item">
      <button class="cds--pagination-nav__page cds--pagination-nav__page--active" aria-current="page">
        1<span class="cds--pagination-nav__accessibility-label">, Current page</span>
      </button>
    </li>
    <li class="cds--pagination-nav__list-item"><button class="cds--pagination-nav__page">2</button></li>
    <li class="cds--pagination-nav__list-item"><button class="cds--pagination-nav__page">3</button></li>
    <li class="cds--pagination-nav__list-item"><button class="cds--pagination-nav__page">4</button></li>
    <li class="cds--pagination-nav__list-item">
      <div class="cds--pagination-nav__select">
        <select class="cds--pagination-nav__page cds--pagination-nav__page--select" aria-label="select page number">
          <option value="">…</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
        </select>
        <div class="cds--pagination-nav__select-icon-wrapper">
          <svg class="cds--pagination-nav__select-icon" focusable="false" aria-hidden="true"
               width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
            <!-- @carbon/icons overflow-menu-horizontal 16 -->
            <circle cx="3" cy="8" r="1"/><circle cx="8" cy="8" r="1"/><circle cx="13" cy="8" r="1"/>
          </svg>
        </div>
      </div>
    </li>
    <li class="cds--pagination-nav__list-item"><button class="cds--pagination-nav__page">9</button></li>
    <li class="cds--pagination-nav__list-item"><button class="cds--pagination-nav__page">10</button></li>
    <li class="cds--pagination-nav__list-item">
      <button class="cds--pagination-nav__page cds--pagination-nav__page--direction" aria-label="Next page">
        <svg class="cds--pagination-nav__icon" focusable="false" aria-hidden="true"
             width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
          <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
        </svg>
      </button>
    </li>
  </ul>
</nav>
```

## Design Tokens (component-scoped, literal hex)

> Pagination's strip background, separator borders, button fills, hover overlays, focus ring and disabled colours all resolve to the four-theme palette in `overview.md`. The values below are taken straight from `packages/themes/src/{white,g10,g90,g100}.js`.

**Light themes — `[data-theme="white"]` and `[data-theme="g10"]`:**

| Role | Token | White hex | G10 hex |
|---|---|---|---|
| Strip background | `--cds-layer-01` | `#ffffff` | `#f4f4f4` |
| Top border (table separator) | `--cds-border-subtle-01` | `#e0e0e0` | `#c6c6c6` |
| Strip dividers (left / right region borders) | `--cds-border-subtle` | `#e0e0e0` | `#c6c6c6` |
| Label text ("Items per page:", "of N pages") | `--cds-text-primary` | `#161616` | `#161616` |
| Range count text ("1-10 of 103 items") | `--cds-text-secondary` | `#525252` | `#525252` |
| Select / button hover background | `--cds-layer-hover` | `#e8e8e8` | `#e8e8e8` |
| Prev / next icon (rest) | `--cds-icon-primary` | `#161616` | `#161616` |
| Prev / next icon (disabled at start/end) | `--cds-icon-disabled` | `#16161640` (rgba 22,22,22,0.25) | `#16161640` |
| Disabled select text | `--cds-text-disabled` | `#16161640` | `#16161640` |
| Focus ring | `--cds-focus` | `#0f62fe` | `#0f62fe` |

**Dark themes — `[data-theme="g90"]`, `[data-theme="g100"]`, and `.dark`:**

| Role | Token | G90 hex | G100 hex |
|---|---|---|---|
| Strip background | `--cds-layer-01` | `#393939` | `#262626` |
| Top border (table separator) | `--cds-border-subtle-01` | `#525252` | `#393939` |
| Strip dividers | `--cds-border-subtle` | `#525252` | `#393939` |
| Label text | `--cds-text-primary` | `#f4f4f4` | `#f4f4f4` |
| Range count text | `--cds-text-secondary` | `#c6c6c6` | `#c6c6c6` |
| Select / button hover background | `--cds-layer-hover` | `#4c4c4c` | `#333333` |
| Prev / next icon (rest) | `--cds-icon-primary` | `#f4f4f4` | `#f4f4f4` |
| Prev / next icon (disabled) | `--cds-icon-disabled` | `#f4f4f440` (rgba 244,244,244,0.25) | `#f4f4f440` |
| Disabled select text | `--cds-text-disabled` | `#f4f4f440` | `#f4f4f440` |
| Focus ring | `--cds-focus` | `#ffffff` | `#ffffff` |

**PaginationNav — additional tokens (active page underline + hover):**

| Role | Token | White hex | G100 hex |
|---|---|---|---|
| Page button text (rest, hover, active) | `--cds-text-primary` | `#161616` | `#f4f4f4` |
| Disabled page button text | rgba(`--cds-text-secondary`, 0.5) | `#52525280` | `#c6c6c680` |
| Page button hover background | `--cds-background-hover` | `#16161614` (rgba 22,22,22,0.08) | `#f4f4f414` (rgba 244,244,244,0.08) |
| Active page underline | `--cds-border-interactive` (via `pseudo-underline`) | `#0f62fe` | `#4589ff` |
| Active page font-weight | (literal) | `600` | `600` |

These tokens are emitted on `[data-theme="white"]` / `[data-theme="g10"]` (light pair) and `[data-theme="g90"]` / `[data-theme="g100"]` / `.dark` (dark pair). The Complete CSS section below references them.

## Complete CSS (verbatim from `_pagination.scss` + `_pagination-nav.scss`)

> The selectors below mirror Carbon's source 1:1 — copied straight from `packages/styles/scss/components/pagination/_pagination.scss` and `pagination-nav/_pagination-nav.scss`. Sass variables are resolved to the `--cds-*` custom properties used in production output.

**Pagination strip — full layout**

```css
/* When directly preceded by a DataTable, drop the top border so the strip
   sits flush against the table footer row. */
.cds--data-table-container + .cds--pagination {
  border-block-start: 0;
}

.cds--pagination {
  /* type-style('body-compact-01') */
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.875rem;        /* 14px */
  line-height: 1.28572;        /* 18px */
  font-weight: 400;
  letter-spacing: 0.16px;

  display: flex;
  overflow: initial;
  align-items: center;
  justify-content: space-between;
  background-color: var(--cds-layer-01);
  border-block-start: 1px solid var(--cds-border-subtle);
  container-name: pagination;
  container-type: inline-size;
  inline-size: calc(100% - 1px);
  min-block-size: 2.5rem;     /* 40px — md (default) */
}

/* SIZE OVERRIDES */
.cds--pagination--sm { min-block-size: 2rem; }     /* 32px */
.cds--pagination--lg { min-block-size: 3rem; }     /* 48px */

/* Container query — at 42rem (672px) and below, hide left/right children
   except the items-count, and keep the prev/next buttons visible. */
@container pagination (min-width: 42rem) {
  .cds--pagination__control-buttons { display: flex; }
}
@container pagination (max-width: 42rem) {
  .cds--pagination__left > *,
  .cds--pagination__right > * { display: none; }
  .cds--pagination__items-count { display: initial; }
  .cds--pagination__control-buttons { display: flex; }
}

/* PAGE-SIZE / PAGE SELECTS — inline select inside the strip */
.cds--pagination .cds--select {
  align-items: center;
  block-size: 100%;
}
.cds--pagination .cds--select-input--inline__wrapper {
  display: flex;
  block-size: 100%;
}
.cds--pagination .cds--select-input {
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.875rem;
  line-height: 2.5rem;        /* 40px — matches md height */
  font-weight: 400;
  letter-spacing: 0.16px;
  block-size: 100%;
  inline-size: auto;
  min-inline-size: auto;
}
@-moz-document url-prefix() {
  .cds--pagination .cds--select-input {
    padding-inline-end: 1rem;  /* $spacing-05 */
    text-overflow: clip;
  }
}

.cds--pagination .cds--select--inline .cds--select-input {
  padding-inline: 1rem 2.25rem;       /* $spacing-05 left, 36px right (icon room) */
}
.cds--pagination--sm .cds--select-input { line-height: 2rem; }     /* 32px */
.cds--pagination--lg .cds--select-input { line-height: 3rem; }     /* 48px */

.cds--pagination .cds--select-input:hover {
  background: var(--cds-layer-hover);
}

/* Keep the dropdown panel background on focus */
.cds--pagination .cds--select--inline .cds--select-input:focus,
.cds--pagination .cds--select--inline .cds--select-input:focus option,
.cds--pagination .cds--select--inline .cds--select-input:focus optgroup {
  background-color: var(--cds-layer);
}

.cds--pagination .cds--select__arrow {
  inset-block-start: 50%;
  transform: translate(-0.5rem, -50%);
}

/* Vertical divider after the items-count select */
.cds--pagination .cds--select__item-count .cds--select-input {
  border-inline-end: 1px solid var(--cds-border-subtle);
}

/* Right region — divider on its left */
.cds--pagination__right {
  border-inline-start: 1px solid var(--cds-border-subtle);
}

/* LEFT / RIGHT REGION LAYOUT */
.cds--pagination__left,
.cds--pagination__right {
  display: flex;
  align-items: center;
  block-size: 100%;
}
.cds--pagination__left > .cds--form-item,
.cds--pagination__right > .cds--form-item {
  block-size: 100%;
}
.cds--pagination__left .cds--pagination__text,
.cds--pagination__right .cds--pagination__text {
  white-space: nowrap;
}

.cds--pagination__left .cds--pagination__text {
  margin-inline-end: 0.0625rem; /* 1px hairline */
}
.cds--pagination__right .cds--pagination__text {
  margin-inline: 0.0625rem 1rem;
}
.cds--pagination__right .cds--pagination__text.cds--pagination__page-text {
  margin-inline: 1rem 0.0625rem;
}
.cds--pagination__right
  .cds--pagination__text.cds--pagination__page-text.cds--pagination__unknown-pages-text {
  margin-inline-end: 1rem;     /* $spacing-05 */
}
.cds--pagination__right .cds--pagination__text:empty { margin: 0; }

.cds--pagination__left {
  padding: 0 1rem 0 0;          /* 0 $spacing-05 0 0 */
  @container pagination (min-width: 42rem) { padding: 0 1rem; }
}
.cds--pagination__text {
  @container pagination (min-width: 42rem) { display: inline-block; }
}

/* TEXT COLOURS */
span.cds--pagination__text { color: var(--cds-text-primary); }
span.cds--pagination__text.cds--pagination__items-count {
  color: var(--cds-text-secondary);
  margin-inline-start: 1rem;
}

/* PREV / NEXT BUTTONS */
.cds--pagination__button,
.cds--btn--ghost.cds--pagination__button {
  display: flex;
  align-items: center;
  justify-content: center;
  border: none;
  margin: 0;
  background: none;
  block-size: 2.5rem;          /* 40px md */
  border-inline-start: 1px solid var(--cds-border-subtle);
  cursor: pointer;
  fill: var(--cds-icon-primary);
  inline-size: 2.5rem;
  min-block-size: 2rem;        /* 32px floor */
  transition:
    outline var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9)),
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}
.cds--pagination__button > svg,
.cds--btn--ghost.cds--pagination__button > svg { margin-block-start: 0; }

[dir='rtl'] .cds--pagination__button > svg,
[dir='rtl'] .cds--btn--ghost.cds--pagination__button > svg { transform: rotate(0.5turn); }

/* SIZE OVERRIDES on prev/next */
.cds--pagination--sm .cds--pagination__button,
.cds--pagination--sm .cds--btn--ghost.cds--pagination__button {
  block-size: 2rem;            /* 32px */
  inline-size: 2rem;
}
.cds--pagination--lg .cds--pagination__button,
.cds--pagination--lg .cds--btn--ghost.cds--pagination__button {
  block-size: 3rem;            /* 48px */
  inline-size: 3rem;
}

/* FOCUS — inset 2px ring (replaces the left divider on focus) */
.cds--pagination__button:focus,
.cds--btn--ghost:focus.cds--pagination__button {
  outline: 2px solid var(--cds-focus);
  outline-offset: -2px;
  border-inline-start: 0;
}

/* HOVER */
.cds--pagination__button:hover,
.cds--btn--ghost:hover.cds--pagination__button {
  background: var(--cds-layer-hover);
}

/* DISABLED at edge (no-index = first/last page) */
.cds--pagination__button--no-index,
.cds--btn--ghost.cds--pagination__button--no-index {
  cursor: not-allowed;
  fill: var(--cds-icon-disabled);
}
.cds--pagination__button:disabled:hover,
.cds--pagination__button--no-index:hover,
.cds--btn--ghost:disabled:hover.cds--pagination__button,
.cds--btn--ghost:hover.cds--pagination__button--no-index {
  border-color: var(--cds-border-subtle);
  background: var(--cds-layer);
  cursor: not-allowed;
  fill: var(--cds-icon-disabled);
}

/* SKELETON */
.cds--pagination.cds--skeleton .cds--skeleton__text {
  margin-block-end: 0;
  margin-inline-end: 1rem;
}

/* WINDOWS HIGH-CONTRAST MODE */
.cds--pagination__button,
.cds--btn--ghost.cds--pagination__button {
  /* high-contrast-mode('outline') — emits an outline in forced-colors */
}

/* RTL */
[dir='rtl'] .cds--pagination .cds--select__arrow {
  transform: translate(0.5rem, -50%);
}

/* Disabled select keeps the layer background */
.cds--pagination .cds--select--inline .cds--select-input[disabled],
.cds--pagination .cds--select--inline .cds--select-input[disabled]:hover {
  background-color: var(--cds-layer);
}
```

**PaginationNav — full layout**

```css
.cds--pagination-nav {
  /* type-style('body-compact-01') */
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.875rem;        /* 14px */
  line-height: 0;             /* the list children carry their own line-height */
  font-weight: 400;
  letter-spacing: 0.16px;

  /* layout.use('size', $default: 'lg') exposes height tokens used below:
     sm = 2rem (32px), md = 2.5rem (40px), lg = 3rem (48px) */
}

.cds--pagination-nav__list {
  display: flex;
  align-items: center;
  list-style: none;
  margin: 0;
  padding: 0;
}

.cds--pagination-nav__list-item {
  padding: 0;
}
.cds--pagination-nav__list-item:first-child { padding-inline-start: 0; }
.cds--pagination-nav__list-item:last-child  { padding-inline-end: 0; }

.cds--pagination-nav__page {
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.875rem;        /* body-compact-01 */
  line-height: 1;
  font-weight: 400;
  letter-spacing: 0.16px;

  position: relative;
  display: block;
  /* (height − 14px) / 2 vertical padding + 4px horizontal */
  padding: calc((var(--cds-layout-size-height-context, 3rem) - 0.875rem) / 2) 0.25rem;
  border: 0;
  border-radius: 0;            /* Carbon: sharp by default */
  background: transparent;
  color: var(--cds-text-primary);
  min-inline-size: var(--cds-layout-size-height-context, 3rem);
  outline: 0;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition:
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9)),
    color            var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
  user-select: none;
}

.cds--pagination-nav__page:hover {
  background-color: var(--cds-background-hover);
  color: var(--cds-text-primary);
}

.cds--pagination-nav__page:focus {
  outline: 2px solid var(--cds-focus);
  outline-offset: -2px;
}

.cds--pagination-nav__page:disabled,
.cds--pagination-nav__page.cds--pagination-nav__page--disabled {
  background: none;
  color: rgba(82, 82, 82, 0.5);  /* rgba($text-secondary, 0.5) */
  outline: none;
  pointer-events: none;
}

/* ACTIVE PAGE — underline + bold */
.cds--pagination-nav__page.cds--pagination-nav__page--active {
  background-color: initial;
  color: var(--cds-text-primary);
  font-weight: 600;
}
/* pseudo-underline mixin emits the active underline using an absolute ::after
   bar at the bottom of the button. Approximate equivalent: */
.cds--pagination-nav__page::after {
  content: '';
  position: absolute;
  inset-inline: 0;
  inset-block-end: 0;
  block-size: 2px;
  background-color: transparent;
}
.cds--pagination-nav__page--active::after {
  background-color: var(--cds-border-interactive);
}

.cds--pagination-nav__page .cds--pagination-nav__icon {
  fill: currentColor;
  pointer-events: none;
}

/* DIRECTION (prev/next) — square buttons */
.cds--pagination-nav__page--direction {
  display: flex;
  align-items: center;
  justify-content: center;
  block-size: 3rem;            /* $spacing-09 = 48px */
  inline-size: 3rem;
  line-height: 0;
}

/* OVERFLOW SELECT — the "..." button */
.cds--pagination-nav__select { position: relative; }

.cds--pagination-nav__page--select {
  appearance: none;
  max-block-size: var(--cds-layout-size-height-context, 3rem);
  text-indent: calc(50% - 4.5px);
}
@-moz-document url-prefix() {
  .cds--pagination-nav__page--select { text-indent: 0; }
}

.cds--pagination-nav__select-icon-wrapper {
  position: absolute;
  block-size: 100%;
  inline-size: 100%;
  inset-block-start: 0;
  pointer-events: none;
}
.cds--pagination-nav__page--active + .cds--pagination-nav__select-icon-wrapper
  .cds--pagination-nav__select-icon { display: none; }

.cds--pagination-nav__select-icon {
  position: absolute;
  inset-block-start: calc(50% - (1rem * 0.25));
  inset-inline-start: calc(50% - (1rem * 0.5));
  pointer-events: none;
}

/* SCREEN-READER ONLY ", Current page" indicator */
.cds--pagination-nav__accessibility-label {
  position: absolute;
  overflow: hidden;
  block-size: 1px;
  clip: rect(0 0 0 0);
  inline-size: 1px;
  margin: -1px;
  padding: 0;
  border: 0;
  white-space: nowrap;
}

/* RTL: flip the prev/next chevrons */
[dir='rtl'] .cds--pagination-nav__list-item svg {
  transform: rotate(0.5turn);
}
```

## States Reference (per region × per state)

> Hex values are White theme unless noted. For G100, swap to the dark-theme tokens in the Design Tokens section above.

**Pagination — strip container:**

| State | Background | Border-top | Border-inline (dividers) |
|---|---|---|---|
| Rest | `#ffffff` (`--cds-layer-01`) | `1px solid #e0e0e0` | `1px solid #e0e0e0` |
| Adjacent to DataTable | `#ffffff` | `0` (border removed) | `1px solid #e0e0e0` |
| Disabled (`disabled`) | `#ffffff` | `1px solid #e0e0e0` | (rest) — only inputs change |

**Pagination — items-per-page select / page select:**

| State | Background | Text | Other |
|---|---|---|---|
| Rest | `#ffffff` | `#161616` (`--cds-text-primary`) | `border-inline-end: 1px solid #e0e0e0` (items-count only) |
| Hover | `#e8e8e8` (`--cds-layer-hover`) | `#161616` | — |
| Focus | `#ffffff` (focus background preserved on the dropdown) | `#161616` | `outline: 2px solid #0f62fe` (via select component) |
| Disabled (`pageInputDisabled` / `pageSizeInputDisabled` / `disabled`) | `#ffffff` (preserved via override) | `#16161640` (`--cds-text-disabled`) | `cursor: not-allowed`, hover background also preserved |

**Pagination — prev / next buttons:**

| State | Background | Icon fill | Border-inline-start | Outline |
|---|---|---|---|---|
| Rest | transparent | `#161616` (`--cds-icon-primary`) | `1px solid #e0e0e0` | none |
| Hover | `#e8e8e8` | `#161616` | (rest) | none |
| Focus | (rest) | `#161616` | `0` (replaced by ring) | `2px solid #0f62fe`, offset `-2px` |
| Disabled (`disabled` / `--no-index` at edge) | `#ffffff` (`--cds-layer`) | `#16161640` (`--cds-icon-disabled`) | `1px solid #e0e0e0` | none |
| Hover-while-disabled | `#ffffff` | `#16161640` | `1px solid #e0e0e0` | none, `cursor: not-allowed` |

**Pagination — text labels:**

| Element | Class | Colour | Weight |
|---|---|---|---|
| "Items per page:" | `.cds--pagination__text` | `#161616` (`--cds-text-primary`) | `400` |
| "1-10 of 103 items" | `.cds--pagination__items-count` | `#525252` (`--cds-text-secondary`) | `400` |
| "of 11 pages" | `.cds--pagination__page-text` | `#161616` | `400` |
| "Item 1-10" (`pagesUnknown`) | `.cds--pagination__unknown-pages-text` | `#161616` | `400` |

**PaginationNav — page button:**

| State | Background | Text | Underline | Weight |
|---|---|---|---|---|
| Rest (inactive) | transparent | `#161616` (`--cds-text-primary`) | none | `400` |
| Hover | `#16161614` (`--cds-background-hover`, ~8% black) | `#161616` | none | `400` |
| Focus | (rest) | `#161616` | none | `400` + `outline: 2px solid #0f62fe` |
| Active (current page) | transparent | `#161616` | `2px` bottom bar in `#0f62fe` (`--cds-border-interactive`) | `600` |
| Disabled | none | `#52525280` (`rgba(--cds-text-secondary, 0.5)`) | none | `400`, `pointer-events: none` |

**PaginationNav — direction (prev/next) buttons:** identical states to the page button above, but always square `48px × 48px` at `lg` (`40px` md, `32px` sm) and the icon fills via `currentColor`.

**PaginationNav — overflow `...` select:** uses the same hover / focus states as the page button. The `text-indent` trick centres the `...` glyph; once the user opens it the rendered options are screen-reader visible.

## Animation & Motion

Carbon's source uses these tokens for both Pagination and PaginationNav transitions (extracted from the SCSS):

```css
.cds--pagination__button,
.cds--btn--ghost.cds--pagination__button {
  transition:
    outline var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9)),
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}

.cds--pagination-nav__page {
  transition:
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9)),
    color            var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}

@media (prefers-reduced-motion: reduce) {
  .cds--pagination__button,
  .cds--btn--ghost.cds--pagination__button,
  .cds--pagination-nav__page {
    transition: none;
  }
}
```

Token values (resolved from `overview.md`): `--cds-duration-fast-02: 110ms`, `--cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9)`. There are no entrance/exit keyframes — the strip is static and only its interactive children animate on hover/focus. This is intentional: pagination is a navigation control, not a delight surface, and Carbon's motion guidelines reserve animation for state change feedback only.

## Accessibility (from Carbon's docs + source)

- **Semantic elements:** Pagination renders as a `<div>` (no role) containing two `<select>` elements (`aria-labelledby` / `aria-label="Page number"`) and two `<button type="button">` prev/next controls (`aria-label="{backwardText}"` / `"{forwardText}"`). PaginationNav renders as a `<nav aria-label="Pagination Navigation">` containing a `<ul>` of `<button>` items; the active page button gets `aria-current="page"` plus a visually-hidden `", Current page"` label.
- **ARIA:** `backwardText` / `forwardText` (default `"Previous"` / `"Next"`) become the `aria-label` for the icon-only buttons — never ship them blank. `itemsPerPageText` becomes the `<label>` for the page-size select. The `pageNumberText` prop (default `"Page Number"`) labels the page-jump select. For PaginationNav, the `<nav>` wrapper provides region landmark identification — give it a unique `aria-label` if you have multiple PaginationNavs on one page.
- **Keyboard:** `Tab` walks through items-per-page select → page select → prev button → next button (Pagination), or prev → page 1 → page 2 → ... → next (PaginationNav). `Enter` / `Space` activates the focused button. Arrow keys cycle the focused `<select>`'s options (native browser behavior). For PaginationNav, **`loop` does not affect keyboard focus order** — it only changes the click behaviour at the edges.
- **Touch target:** `sm` (32px) is below the 44px touch minimum — reserve it for desktop / dense data tables. Use `md` (40px) inside a 44-px-tall container, or `lg` (48px), for touch surfaces. Carbon's recommendation: pair `lg` Pagination with `lg` DataTable rows on touch breakpoints.
- **Focus management:** Carbon emits `outline: 2px solid var(--cds-focus); outline-offset: -2px` on every interactive control inside the strip. The negative offset places the ring inside the button so it never extends past the strip's outer border. **Do not remove it.** When a page changes, do not move focus — the user is already focused on the prev/next button or the select, and yanking focus elsewhere would disorient screen-reader users.
- **`pagesUnknown`:** when `true`, the page-jump select is removed from the DOM and the count text becomes `"Item {start}-{end}"` (no total). The next button stays enabled until you set `isLastPage` — the consumer is responsible for tracking when the streamed data set ends. Always provide an `aria-live="polite"` region near the table that announces the new range when the page changes.
- **PaginationNav screen reader:** the active page button includes `<span class="cds--pagination-nav__accessibility-label">, Current page</span>` so screen readers announce "page 3, Current page" instead of just "page 3". Do not strip this span — it is the only ARIA cue distinguishing the active button from the others.

## Responsive behaviour

Carbon's Pagination uses CSS **container queries**, not media queries — it reacts to its own width, not the viewport. The breakpoint is `42rem` (672px) on the `pagination` container:

- **Container ≥ 672px (desktop / wide table):** the full strip is visible — items-per-page select, "1-10 of 103 items" count, page-jump select, "of 11 pages" label, prev/next buttons.
- **Container < 672px (narrow column / mobile drawer):** the labels and selects in `__left > *` and `__right > *` collapse to `display: none`. Only the count text (`__items-count`) and the prev/next button group (`__control-buttons`) remain visible. This keeps the most actionable controls (advance / retreat by one page) reachable when horizontal real-estate is tight.

The strip's inline-size is always `calc(100% - 1px)` — the 1px deduction lets the strip's right edge align with its parent table's border without doubling. Do **not** override this width to `100%` or absolute pixels — it will visibly clip the right edge against most table containers.

PaginationNav has no built-in responsive breakpoint — it is always a single horizontal row. For narrow screens, lower `itemsShown` (the prop that controls how many numbered buttons render before the overflow `...` kicks in) — for example `itemsShown={4}` on mobile, `{8}` on tablet, `{10}` on desktop. The minimum is 4 (or `totalItems` if smaller).

## Do / Don't

| Do | Don't |
|---|---|
| Pair Pagination with a `DataTable` — they share the strip's top border and `--cds-layer-01` background, so the seam disappears. | Don't put Pagination above scrolling content with no border-top harmonisation — the strip will look orphaned. |
| Use `pageSizes={[10, 20, 30, 40, 50]}` (or similar arithmetic progression) to match user expectations from other Carbon products. | Don't use exotic page sizes (`{[7, 13, 21]}`) — they confuse density expectations and break the implicit "round numbers" convention. |
| Set `size="md"` (40px) by default, `"lg"` (48px) for touch surfaces, `"sm"` (32px) only for dense desktop dashboards. | Don't use `"sm"` on mobile or tablet — its 32px height fails WCAG touch target. |
| Use `pagesUnknown` for streamed data sets where the total count is expensive or impossible to compute. | Don't fake a total just to populate the page-jump select — `pagesUnknown` is the correct affordance. |
| Use the verbatim `<cds-pagination>` / `<Pagination>` element. | Don't substitute a hand-rolled `<div class="footer">` — you lose container queries, focus rings, RTL support and disabled overrides. |
| Use **PaginationNav** for content lists (search results, blog index, gallery thumbnails) where direct page jumping matters more than knowing the total record count. | Don't use PaginationNav under a DataTable — it has no items-per-page picker and no record range count, both of which table users expect. |
| Use **Pagination** for tables. | Don't combine the two — never render a Pagination strip *and* a PaginationNav on the same dataset; pick one. |
| Provide meaningful `backwardText` / `forwardText` (e.g. `"Previous page of customers"`) for screen readers — never ship the icon-only button without a label. | Don't ship the bare strings `"Previous"` / `"Next"` if the page has multiple paginated sections — be explicit about what is being paginated. |
| Honour `prefers-reduced-motion` (already wired by Carbon's source — don't add custom transitions that bypass it). | Don't add page-transition animations to the table body — pagination is not a delight surface. |
| For PaginationNav, lower `itemsShown` on narrow viewports (`{4}` mobile, `{10}` desktop). | Don't render 20+ numbered buttons on mobile — they wrap or overflow off-screen. |
| Place a top **and** bottom Pagination (the `MultiplePaginationComponents` story) for tables ≥ 25 rows so the user can paginate without scrolling back to the top. | Don't add three or more — the cognitive load of "which strip am I clicking" outweighs the convenience. |
| Output the Storybook code **as-is** when generating Carbon UI. | Don't paraphrase or rewrite — Carbon's source is the truth. |
