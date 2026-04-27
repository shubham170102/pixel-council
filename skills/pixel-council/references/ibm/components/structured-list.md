---
name: structured-list
description: Carbon StructuredList — minimal table-style list for read-only data with optional radio-style row selection. Variants: Default, Selection, InitialSelection, WithBackgroundLayer, Skeleton.
metadata:
  tags: structured-list, list, table, data, selection, radio, skeleton, minimal, condensed, ibm, carbon, react, web-components
---

# StructuredList -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`StructuredList.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/StructuredList/StructuredList.stories.js)
> - **WC story:** [`structured-list.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/structured-list/structured-list.stories.ts)
> - **SCSS source:** [`_structured-list.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/structured-list/_structured-list.scss)
> - **SCSS mixins:** [`_mixins.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/structured-list/_mixins.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-structuredlist--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-structured-list--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/structured-list/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

StructuredList is Carbon's minimal table-style component for displaying read-only tabular data without the full feature set of `DataTable`. It renders as an HTML table (`display: table` / `table-row` / `table-cell`) and uses **only horizontal row borders** — no vertical column rules, no zebra striping, no shadows. Use it when you need columns and rows of data without sort, filter, pagination, batch actions, or expansion. The optional `selection` mode adds an invisible radio-style affordance: any row click selects that row (mutually exclusive with siblings), surfaced visually by a checkmark `<svg>` in the rightmost column and a tinted background. StructuredList is more minimal than DataTable by design — choose it for definition lists, compact summaries, settings rosters, key-value pair grids, and any "spreadsheet-but-quieter" use case.

## Quick Reference

| Property | Value |
|---|---|
| Header row min-height | `40px` (`block-size: convert.to-rem(40px)` in `.cds--structured-list-th`) |
| Default row padding (`<td>`) | `16px 8px 24px 8px` (`$spacing-05 $spacing-03 $spacing-06 $spacing-03`) |
| Default header padding (`<th>`) | `16px 8px 8px 8px` (`$spacing-05 $spacing-03 $spacing-03 $spacing-03`) |
| Condensed padding (all cells) | `8px` (`$structured-list-padding * 0.25` = `2rem * 0.25` = `0.5rem`) |
| Selection mode padding | `16px 16px` inline (`$structured-list-padding * 0.5` = `1rem`) for both `<td>` and `<th>` |
| First-cell inline-start padding (default) | `16px` (`padding-inline-start: 1rem`) |
| Flush variant padding | `padding-inline: 0 1rem` (zero leading, 16px trailing) on every cell |
| Selection column (last `<td>`) width | `32px` (`$spacing-07`) |
| Corner radius | `0` (Carbon: sharp by default — StructuredList has zero rounding anywhere) |
| Border (rows) | `1px solid var(--cds-border-subtle)` on `border-block-start` of every `.cds--structured-list-row` (last child also has `border-block-end`) |
| Border (header row) | `border: none` (the header row override removes the top border) |
| Vertical column rules | **none** (StructuredList NEVER draws vertical lines between columns) |
| Box shadow | **none** (Carbon list components are flat) |
| Header text font | IBM Plex Sans, `heading-compact-01` — `14px` / `18px` line-height / `600` semibold / `0.16px` letter-spacing |
| Body cell font | IBM Plex Sans, `body-01` — `14px` / `20px` line-height / `400` regular / `0.16px` letter-spacing |
| Header text color (White) | `#161616` (`--cds-text-primary`) |
| Body cell text color (White, rest) | `#525252` (`--cds-text-secondary`) |
| Selected row text color (White) | `#161616` (`--cds-text-primary` — promoted from secondary on selection) |
| Hover row background (Selection mode, White) | `#e8e8e8` (`--cds-layer-hover-01`) |
| Selected row background (White) | `#e0e0e0` (`--cds-layer-selected-01`) |
| Header text color (G100) | `#f4f4f4` (`--cds-text-primary`) |
| Body cell text color (G100, rest) | `#c6c6c6` (`--cds-text-secondary`) |
| Hover row background (Selection mode, G100) | `#333333` (`--cds-layer-hover-01`) |
| Selected row background (G100) | `#393939` (`--cds-layer-selected-01`) |
| Row border color (White) | `#c6c6c6` (`--cds-border-subtle-01`) |
| Row border color (G100) | `#525252` (`--cds-border-subtle-01`) |
| Selection checkmark color (when checked) | `#161616` light / `#f4f4f4` dark (`--cds-icon-primary`) |
| Selection checkmark color (rest) | `transparent` (visible only when row is `:checked`) |
| Max body cell width | `36rem` (`max-inline-size: 36rem` — prevents wide content from breaking layout) |
| Cell wrap behaviour | wrap by default; `noWrap` prop / `nowrap` class adds `white-space: nowrap` |
| Transition (row background, Selection mode) | `background-color var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` (`110ms` standard productive) |
| Transition (cell color) | `color var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` |
| Transition (checkmark) | `all var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` |
| Focus ring | `2px solid var(--cds-focus)` outline on `.cds--structured-list-row--focused-within` (focus ring follows the row that contains the focused radio input) |
| React import | `import { StructuredListWrapper, StructuredListHead, StructuredListBody, StructuredListRow, StructuredListInput, StructuredListCell } from '@carbon/react';` |
| Skeleton import (React) | `import StructuredListSkeleton from '@carbon/react/lib/components/StructuredList/StructuredList.Skeleton';` |
| WC imports | `import '@carbon/web-components/es/components/structured-list/index.js';` |

## Variants (from Storybook story exports)

The React stories file ships **five** named exports; the WC stories file ships **three** (Default, Selection, Skeleton). The React-only `InitialSelection` and `WithBackgroundLayer` exports are documented for parity — `InitialSelection` is `Selection` plus the `selectedInitialRow="row-2"` prop; `WithBackgroundLayer` wraps `Selection` in the Storybook `<WithLayer>` template to demonstrate `--cds-layer-*` token nesting.

| Variant | React story export | WC story export | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Read-only structured list — header row + 2 body rows, 3 columns, no selection. The `Default` story has knobs for `isCondensed` and `isFlush` so you can see all density modes from one export. |
| Selection | `Selection` | `Selection` | Same shape as Default with 4 generated rows, `selection` prop on the wrapper, and a hidden `<StructuredListInput>` (radio) per row. Click anywhere on a row to select it; checkmark appears on the right. |
| InitialSelection | `InitialSelection` | (n/a — React only) | Identical to `Selection` but passes `selectedInitialRow="row-2"` so row index 2 is selected on first render. Demonstrates the controlled-by-prop selection API. |
| WithBackgroundLayer | `WithBackgroundLayer` | (n/a — React only) | `Selection` rendered inside the Storybook `<WithLayer>` decorator, which mounts the same component three times against `layer-01` / `layer-02` / `layer-03` tiers. Shows that StructuredList is `background-color: $layer transparent` so it inherits whichever layer it sits on. |
| Skeleton | `Skeleton` | `Skeleton` | Loading placeholder — the React `Skeleton` story renders `<StructuredListSkeleton rowCount={5} />` inside an `800px`-wide div. The WC `Skeleton` renders **two** lists side-by-side using `<cds-structured-list-header-cell-skeleton>` for headers and empty `<cds-structured-list-cell>` rows for body. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `StructuredList.stories.js` on the Carbon `main` branch (`packages/react/src/components/StructuredList/StructuredList.stories.js`). Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import mdx from './StructuredList.mdx';
import { WithLayer } from '../../../.storybook/templates/WithLayer';

import {
  StructuredListWrapper,
  StructuredListHead,
  StructuredListBody,
  StructuredListRow,
  StructuredListInput,
  StructuredListCell,
} from './';
import { CheckmarkFilled } from '@carbon/icons-react';
const prefix = 'cds';
import StructuredListSkeleton from './StructuredList.Skeleton';

export default {
  title: 'Components/StructuredList',
  component: StructuredListWrapper,
  subcomponents: {
    StructuredListHead,
    StructuredListBody,
    StructuredListRow,
    StructuredListInput,
    StructuredListCell,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <StructuredListWrapper {...args}>
      <StructuredListHead>
        <StructuredListRow head>
          <StructuredListCell head>ColumnA</StructuredListCell>
          <StructuredListCell head>ColumnB</StructuredListCell>
          <StructuredListCell head>ColumnC</StructuredListCell>
        </StructuredListRow>
      </StructuredListHead>
      <StructuredListBody>
        <StructuredListRow>
          <StructuredListCell noWrap>Row 1</StructuredListCell>
          <StructuredListCell>Row 1</StructuredListCell>
          <StructuredListCell>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
            magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
            sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
            vulputate nisl a porttitor interdum.
          </StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell noWrap>Row 2</StructuredListCell>
          <StructuredListCell>Row 2</StructuredListCell>
          <StructuredListCell>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
            magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
            sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
            vulputate nisl a porttitor interdum.
          </StructuredListCell>
        </StructuredListRow>
      </StructuredListBody>
    </StructuredListWrapper>
  );
};

Default.args = {
  isCondensed: false,
  isFlush: false,
};

Default.parameters = {
  controls: {
    exclude: ['selection'],
  },
};
Default.argTypes = {
  isCondensed: {
    control: {
      type: 'boolean',
    },
  },
  isFlush: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Helper: `structuredListBodyRowGenerator`** (used by `Selection`, `InitialSelection`, and `WithBackgroundLayer`):

```jsx
const structuredListBodyRowGenerator = (numRows) => {
  return Array.apply(null, Array(numRows)).map((n, i) => (
    <StructuredListRow key={`row-${i}`} id={`row-${i}`}>
      <StructuredListCell>Row {i}</StructuredListCell>
      <StructuredListCell>Row {i}</StructuredListCell>
      <StructuredListCell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui magna,
        finibus id tortor sed, aliquet bibendum augue. Aenean posuere sem vel
        euismod dignissim. Nulla ut cursus dolor. Pellentesque vulputate nisl a
        porttitor interdum.
      </StructuredListCell>
      <StructuredListInput
        id={`row-${i}`}
        value={`row-${i}`}
        title={`row-${i}`}
        name="row-0"
        aria-label={`row-${i}`}
      />
      <StructuredListCell>
        <CheckmarkFilled
          className={`${prefix}--structured-list-svg`}
          aria-label="select an option">
          <title>select an option</title>
        </CheckmarkFilled>
      </StructuredListCell>
    </StructuredListRow>
  ));
};
```

**Variant: Selection**

```jsx
export const Selection = (args) => {
  return (
    <StructuredListWrapper selection {...args}>
      <StructuredListHead>
        <StructuredListRow head>
          <StructuredListCell head>ColumnA</StructuredListCell>
          <StructuredListCell head>ColumnB</StructuredListCell>
          <StructuredListCell head>ColumnC</StructuredListCell>
        </StructuredListRow>
      </StructuredListHead>
      <StructuredListBody>
        {structuredListBodyRowGenerator(4)}
      </StructuredListBody>
    </StructuredListWrapper>
  );
};
```

**Variant: InitialSelection**

```jsx
export const InitialSelection = (args) => {
  return (
    <StructuredListWrapper selection {...args} selectedInitialRow="row-2">
      <StructuredListHead>
        <StructuredListRow head>
          <StructuredListCell head>ColumnA</StructuredListCell>
          <StructuredListCell head>ColumnB</StructuredListCell>
          <StructuredListCell head>ColumnC</StructuredListCell>
        </StructuredListRow>
      </StructuredListHead>
      <StructuredListBody>
        {structuredListBodyRowGenerator(4)}
      </StructuredListBody>
    </StructuredListWrapper>
  );
};

const sharedParameters = {
  controls: {
    exclude: ['isFlush', 'selection'],
  },
};

Selection.parameters = { ...sharedParameters };

InitialSelection.parameters = { ...sharedParameters };
```

**Variant: WithBackgroundLayer**

```jsx
export const WithBackgroundLayer = () => {
  return (
    <WithLayer>
      <StructuredListWrapper selection>
        <StructuredListHead>
          <StructuredListRow head>
            <StructuredListCell head>ColumnA</StructuredListCell>
            <StructuredListCell head>ColumnB</StructuredListCell>
            <StructuredListCell head>ColumnC</StructuredListCell>
          </StructuredListRow>
        </StructuredListHead>
        <StructuredListBody>
          {structuredListBodyRowGenerator(4)}
        </StructuredListBody>
      </StructuredListWrapper>
    </WithLayer>
  );
};

WithBackgroundLayer.parameters = { ...sharedParameters };
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => (
  <div style={{ width: '800px' }}>
    <StructuredListSkeleton {...args} />
  </div>
);

Skeleton.args = {
  rowCount: 5,
};

Skeleton.parameters = {
  controls: {
    include: ['rowCount', 'selectedInitialRow'],
  },
};

Skeleton.argTypes = {
  rowCount: {
    control: {
      type: 'number',
    },
  },
};
```

**Skeleton sub-component** (verbatim from `StructuredList.Skeleton.tsx` — the `Skeleton` story renders this; included so the agent doesn't have to fetch a second file):

```tsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import PropTypes from 'prop-types';
import React from 'react';
import cx from 'classnames';
import { usePrefix } from '../../internal/usePrefix';

export interface StructuredListSkeletonProps {
  /**
   * Specify an optional className to add.
   */
  className?: string;

  /**
   * number of table rows
   */
  rowCount?: number;
}

export default function StructuredListSkeleton({
  rowCount = 5,
  className,
  ...rest
}: StructuredListSkeletonProps) {
  const prefix = usePrefix();
  const classNames = cx(
    `${prefix}--skeleton`,
    `${prefix}--structured-list`,
    className
  );

  const rows = new Array(rowCount).fill(null).map((_, i) => (
    <div className={`${prefix}--structured-list-row`} key={i}>
      <div className={`${prefix}--structured-list-td`} />
      <div className={`${prefix}--structured-list-td`} />
      <div className={`${prefix}--structured-list-td`} />
    </div>
  ));

  return (
    <div className={classNames} {...rest}>
      <div className={`${prefix}--structured-list-thead`}>
        <div
          className={`${prefix}--structured-list-row ${prefix}--structured-list-row--header-row`}>
          <div className={`${prefix}--structured-list-th`}>
            <span />
          </div>
          <div className={`${prefix}--structured-list-th`}>
            <span />
          </div>
          <div className={`${prefix}--structured-list-th`}>
            <span />
          </div>
        </div>
      </div>
      <div className={`${prefix}--structured-list-tbody`}>{rows}</div>
    </div>
  );
}

StructuredListSkeleton.propTypes = {
  /**
   * Specify an optional className to add.
   */
  className: PropTypes.string,

  /**
   * number of table rows
   */
  rowCount: PropTypes.number,
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `structured-list.stories.ts` on the Carbon `main` branch (`packages/web-components/src/components/structured-list/structured-list.stories.ts`). Use these for non-React projects (Lit, vanilla, framework-free).

**Imports + default args (from the top of the stories file):**

```ts
/* eslint-disable prefer-spread */
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './structured-list';
import './structured-list-head';
import './structured-list-header-row';
import './structured-list-header-cell';
import './structured-list-body';
import './structured-list-row';
import './structured-list-cell';
import './structured-list-header-cell-skeleton';

const defaultArgs = {
  condensed: false,
  flush: false,
  hasSelection: false,
};

const controls = {
  condensed: {
    control: 'boolean',
    description: 'Specify if structured list is condensed, default is false.',
  },
  flush: {
    control: 'boolean',
    description: 'Specify if structured list is flush, default is false.',
  },
  hasSelection: {
    control: 'boolean',
    description: 'Supports selection feature (has-selection)',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args: defaultArgs,
  argTypes: controls,
  render: ({ condensed, flush, hasSelection }) => {
    const selectionName = !hasSelection
      ? undefined
      : 'structured-list-selection';
    const selectionValues = !hasSelection
      ? []
      : [
          'structured-list-selection-0',
          'structured-list-selection-1',
          'structured-list-selection-2',
        ];
    return html`
      <cds-structured-list
      selection-name=${ifDefined(selectionName)}
      ?condensed=${condensed}
      ?flush=${flush}>
        <cds-structured-list-head>
          <cds-structured-list-header-row>
            <cds-structured-list-header-cell>
              ColumnA
            </cds-structured-list-header-cell>
            <cds-structured-list-header-cell>
              ColumnB
            </cds-structured-list-header-cell>
            <cds-structured-list-header-cell>
              ColumnC
            </cds-structured-list-header-cell>
        </cds-structured-list-head>
        <cds-structured-list-body>
          <cds-structured-list-row
            selection-value=${ifDefined(selectionValues[0])}>
            <cds-structured-list-cell>Row 1</cds-structured-list-cell>
            <cds-structured-list-cell>Row 1</cds-structured-list-cell>
            <cds-structured-list-cell>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
              magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
              sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
              vulputate nisl a porttitor interdum.</cds-structured-list-cell>
          </cds-structured-list-row>
          <cds-structured-list-row
            selection-value=${ifDefined(selectionValues[1])}>
            <cds-structured-list-cell>Row 2</cds-structured-list-cell>
            <cds-structured-list-cell>Row 2</cds-structured-list-cell>
            <cds-structured-list-cell>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
              magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
              sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
              vulputate nisl a porttitor interdum.</cds-structured-list-cell>
          </cds-structured-list-row>
        </cds-structured-list-body>
      </cds-structured-list>
    `;
  },
};
```

**Variant: Selection**

```html
export const Selection = {
  render: () => {
    const selectionName = 'structured-list-selection';
    const selectionValues = [
      'structured-list-selection-0',
      'structured-list-selection-1',
      'structured-list-selection-2',
      'structured-list-selection-3',
    ];

    return html`
      <cds-structured-list selection-name=${ifDefined(selectionName)}>
        <cds-structured-list-head>
          <cds-structured-list-header-row>
            <cds-structured-list-header-cell>
              ColumnA
            </cds-structured-list-header-cell>
            <cds-structured-list-header-cell>
              ColumnB
            </cds-structured-list-header-cell>
            <cds-structured-list-header-cell>
              ColumnC
            </cds-structured-list-header-cell>
          </cds-structured-list-header-row>
        </cds-structured-list-head>
        <cds-structured-list-body>
          ${selectionValues.map(
            (selectionValue, index) =>
              html` <cds-structured-list-row
                selection-value=${ifDefined(selectionValue)}>
                <cds-structured-list-cell
                  >Row ${index}</cds-structured-list-cell
                >
                <cds-structured-list-cell
                  >Row ${index}</cds-structured-list-cell
                >
                <cds-structured-list-cell>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc
                  dui magna, finibus id tortor sed, aliquet bibendum augue.
                  Aenean posuere sem vel euismod dignissim. Nulla ut cursus
                  dolor. Pellentesque vulputate nisl a porttitor
                  interdum.</cds-structured-list-cell
                >
              </cds-structured-list-row>`
          )}
        </cds-structured-list-body>
      </cds-structured-list>
    `;
  },
};
```

**Variant: Skeleton**

```html
export const Skeleton = {
  decorators: [(story) => html`<div style="width: 800px">${story()}</div>`],
  render: () => html`
    ${Array.apply(null, Array(2)).map(
      () => html`
        <cds-structured-list>
          <cds-structured-list-head>
            <cds-structured-list-header-row>
              ${Array.apply(null, Array(3)).map(
                () => html`
                  <cds-structured-list-header-cell-skeleton>
                  </cds-structured-list-header-cell-skeleton>
                `
              )}
            </cds-structured-list-header-row>
          </cds-structured-list-head>
          <cds-structured-list-body>
            ${Array.apply(null, Array(5)).map(
              () =>
                html`<cds-structured-list-row>
                  <cds-structured-list-cell></cds-structured-list-cell>
                  <cds-structured-list-cell></cds-structured-list-cell>
                  <cds-structured-list-cell></cds-structured-list-cell>
                </cds-structured-list-row>`
            )}
          </cds-structured-list-body>
        </cds-structured-list>
      `
    )}
  `,
};

const meta = {
  title: 'Components/Structured list',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.condensed}` → `condensed` or removed; `${ifDefined(selectionName)}` → static attribute) resolved to literal attribute values. Use this for hand-coded HTML without a component framework. The `<cds-*>` custom elements still require the WC bundle to be loaded, but the attributes are now declarative HTML.

**Variant: Default** (no selection — the `selection-name` attribute is omitted)

```html
<cds-structured-list>
  <cds-structured-list-head>
    <cds-structured-list-header-row>
      <cds-structured-list-header-cell>ColumnA</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnB</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnC</cds-structured-list-header-cell>
    </cds-structured-list-header-row>
  </cds-structured-list-head>
  <cds-structured-list-body>
    <cds-structured-list-row>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
    <cds-structured-list-row>
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
  </cds-structured-list-body>
</cds-structured-list>
```

**Variant: Default — Condensed** (Default story with `?condensed=${true}` resolved to a static attribute)

```html
<cds-structured-list condensed>
  <cds-structured-list-head>
    <cds-structured-list-header-row>
      <cds-structured-list-header-cell>ColumnA</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnB</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnC</cds-structured-list-header-cell>
    </cds-structured-list-header-row>
  </cds-structured-list-head>
  <cds-structured-list-body>
    <cds-structured-list-row>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Compact body content for the condensed variant.</cds-structured-list-cell>
    </cds-structured-list-row>
    <cds-structured-list-row>
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>Compact body content for the condensed variant.</cds-structured-list-cell>
    </cds-structured-list-row>
  </cds-structured-list-body>
</cds-structured-list>
```

**Variant: Default — Flush** (Default story with `?flush=${true}` resolved — removes the leading inline padding on the first cell of every row)

```html
<cds-structured-list flush>
  <cds-structured-list-head>
    <cds-structured-list-header-row>
      <cds-structured-list-header-cell>ColumnA</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnB</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnC</cds-structured-list-header-cell>
    </cds-structured-list-header-row>
  </cds-structured-list-head>
  <cds-structured-list-body>
    <cds-structured-list-row>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Edge-aligned body content.</cds-structured-list-cell>
    </cds-structured-list-row>
  </cds-structured-list-body>
</cds-structured-list>
```

**Variant: Selection** (the `selection-name` attribute groups the rows as a single radio set; `selection-value` becomes the submitted form value when that row is chosen)

```html
<cds-structured-list selection-name="structured-list-selection">
  <cds-structured-list-head>
    <cds-structured-list-header-row>
      <cds-structured-list-header-cell>ColumnA</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnB</cds-structured-list-header-cell>
      <cds-structured-list-header-cell>ColumnC</cds-structured-list-header-cell>
    </cds-structured-list-header-row>
  </cds-structured-list-head>
  <cds-structured-list-body>
    <cds-structured-list-row selection-value="structured-list-selection-0">
      <cds-structured-list-cell>Row 0</cds-structured-list-cell>
      <cds-structured-list-cell>Row 0</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
    <cds-structured-list-row selection-value="structured-list-selection-1">
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>Row 1</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
    <cds-structured-list-row selection-value="structured-list-selection-2">
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>Row 2</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
    <cds-structured-list-row selection-value="structured-list-selection-3">
      <cds-structured-list-cell>Row 3</cds-structured-list-cell>
      <cds-structured-list-cell>Row 3</cds-structured-list-cell>
      <cds-structured-list-cell>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui
        magna, finibus id tortor sed, aliquet bibendum augue. Aenean posuere
        sem vel euismod dignissim. Nulla ut cursus dolor. Pellentesque
        vulputate nisl a porttitor interdum.
      </cds-structured-list-cell>
    </cds-structured-list-row>
  </cds-structured-list-body>
</cds-structured-list>
```

**Variant: Skeleton** (loading placeholder; the WC story renders two stacked instances inside an `800px` container)

```html
<div style="width: 800px">
  <cds-structured-list>
    <cds-structured-list-head>
      <cds-structured-list-header-row>
        <cds-structured-list-header-cell-skeleton></cds-structured-list-header-cell-skeleton>
        <cds-structured-list-header-cell-skeleton></cds-structured-list-header-cell-skeleton>
        <cds-structured-list-header-cell-skeleton></cds-structured-list-header-cell-skeleton>
      </cds-structured-list-header-row>
    </cds-structured-list-head>
    <cds-structured-list-body>
      <cds-structured-list-row>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
      </cds-structured-list-row>
      <cds-structured-list-row>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
      </cds-structured-list-row>
      <cds-structured-list-row>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
      </cds-structured-list-row>
      <cds-structured-list-row>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
      </cds-structured-list-row>
      <cds-structured-list-row>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
        <cds-structured-list-cell></cds-structured-list-cell>
      </cds-structured-list-row>
    </cds-structured-list-body>
  </cds-structured-list>
</div>
```

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by StructuredList's SCSS to the literal hex values defined in the four-theme system in `overview.md`. Note that `--cds-structured-list-background` resolves to `$layer transparent` in the source — the component itself is transparent and inherits whichever layer surface it sits on. The "background" token below documents the **effective** rendered colour when the list is the page-level child.

```css
[data-theme="white"] {
  /* Surface — the table itself is transparent; layer-01 is what shows through */
  --cds-structured-list-background: transparent;
  --cds-structured-list-effective-background: #f4f4f4;     /* layer-01 (page surface) */

  /* Header */
  --cds-structured-list-header-text: #161616;              /* text-primary */

  /* Body cells (rest) */
  --cds-structured-list-cell-text: #525252;                /* text-secondary */

  /* Row borders */
  --cds-structured-list-row-border: #c6c6c6;               /* border-subtle-01 */

  /* Selection-mode interactive states */
  --cds-structured-list-row-hover-background: #e8e8e8;     /* layer-hover-01 */
  --cds-structured-list-row-hover-border: #e8e8e8;         /* layer-hover-01 — Carbon uses bg colour as border on hover */
  --cds-structured-list-row-selected-background: #e0e0e0;  /* layer-selected-01 */
  --cds-structured-list-row-selected-border: #e0e0e0;      /* layer-selected-01 */
  --cds-structured-list-row-selected-text: #161616;        /* text-primary — promoted on selection */

  /* Selection checkmark icon */
  --cds-structured-list-icon-rest: transparent;            /* hidden until row is :checked */
  --cds-structured-list-icon-selected: #161616;            /* icon-primary */

  /* Focus */
  --cds-structured-list-focus: #0f62fe;                    /* focus (blue-60) */
  --cds-structured-list-focus-inset: #ffffff;              /* background — inset companion ring */

  /* Skeleton */
  --cds-structured-list-skeleton-background: #e8e8e8;      /* skeleton-background */
  --cds-structured-list-skeleton-element: #c6c6c6;         /* skeleton-element */
}

[data-theme="g10"] {
  --cds-structured-list-background: transparent;
  --cds-structured-list-effective-background: #ffffff;     /* layer-01 (white tile on gray body in G10) */
  --cds-structured-list-header-text: #161616;
  --cds-structured-list-cell-text: #525252;
  --cds-structured-list-row-border: #e0e0e0;               /* border-subtle-01 in G10 */
  --cds-structured-list-row-hover-background: #e8e8e8;
  --cds-structured-list-row-hover-border: #e8e8e8;
  --cds-structured-list-row-selected-background: #e0e0e0;
  --cds-structured-list-row-selected-border: #e0e0e0;
  --cds-structured-list-row-selected-text: #161616;
  --cds-structured-list-icon-rest: transparent;
  --cds-structured-list-icon-selected: #161616;
  --cds-structured-list-focus: #0f62fe;
  --cds-structured-list-focus-inset: #f4f4f4;              /* background of g10 body */
  --cds-structured-list-skeleton-background: #e8e8e8;
  --cds-structured-list-skeleton-element: #c6c6c6;
}

[data-theme="g90"] {
  --cds-structured-list-background: transparent;
  --cds-structured-list-effective-background: #393939;     /* layer-01 in G90 */
  --cds-structured-list-header-text: #f4f4f4;              /* text-primary */
  --cds-structured-list-cell-text: #c6c6c6;                /* text-secondary */
  --cds-structured-list-row-border: #6f6f6f;               /* border-subtle-01 in G90 */
  --cds-structured-list-row-hover-background: #4c4c4c;     /* layer-hover-01 in G90 */
  --cds-structured-list-row-hover-border: #4c4c4c;
  --cds-structured-list-row-selected-background: #525252;  /* layer-selected-01 in G90 */
  --cds-structured-list-row-selected-border: #525252;
  --cds-structured-list-row-selected-text: #f4f4f4;
  --cds-structured-list-icon-rest: transparent;
  --cds-structured-list-icon-selected: #f4f4f4;            /* icon-primary in G90 */
  --cds-structured-list-focus: #ffffff;                    /* focus inverts to white in dark themes */
  --cds-structured-list-focus-inset: #262626;              /* background */
  --cds-structured-list-skeleton-background: #333333;
  --cds-structured-list-skeleton-element: #525252;
}

[data-theme="g100"],
.dark {
  --cds-structured-list-background: transparent;
  --cds-structured-list-effective-background: #262626;     /* layer-01 in G100 */
  --cds-structured-list-header-text: #f4f4f4;
  --cds-structured-list-cell-text: #c6c6c6;
  --cds-structured-list-row-border: #525252;               /* border-subtle-01 in G100 */
  --cds-structured-list-row-hover-background: #333333;     /* layer-hover-01 in G100 */
  --cds-structured-list-row-hover-border: #333333;
  --cds-structured-list-row-selected-background: #393939;  /* layer-selected-01 in G100 */
  --cds-structured-list-row-selected-border: #393939;
  --cds-structured-list-row-selected-text: #f4f4f4;
  --cds-structured-list-icon-rest: transparent;
  --cds-structured-list-icon-selected: #f4f4f4;
  --cds-structured-list-focus: #ffffff;
  --cds-structured-list-focus-inset: #161616;              /* background of g100 body */
  --cds-structured-list-skeleton-background: #292929;
  --cds-structured-list-skeleton-element: #393939;
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/structured-list/_structured-list.scss` and `_mixins.scss`. Carbon's SCSS uses semantic tokens (`$layer`, `$layer-hover`, `$layer-selected`, `$border-subtle`, `$text-primary`, `$text-secondary`, `$icon-primary`, `$focus`); the hex values below are resolved against the **White theme** (substitute the matching value from the Design Tokens block above for other themes).

### Wrapper `<cds-structured-list>` (`.cds--structured-list`)

| Property | Value | Source line |
|---|---|---|
| `display` | `table` | `_structured-list.scss` L33 |
| `background-color` | `$layer transparent` (transparent — inherits surrounding `--cds-layer`) | L35 |
| `border-collapse` | `collapse` | L36 |
| `border-spacing` | `0` | L37 |
| `inline-size` | `100%` | L38 |
| `overflow-x` | `auto` | L39 |
| `border-radius` | `0` (Carbon default — never override) | (component reset) |

### Header cell `<cds-structured-list-header-cell>` (`.cds--structured-list-th`)

| Property | Value | Source line |
|---|---|---|
| `display` | `table-cell` | L150 |
| `block-size` (min-height) | `40px` (`convert.to-rem(40px)`) | L151 |
| `color` | `#161616` (`$text-primary`) | L152 |
| `font-weight` | `600` (semibold) | L153 |
| `text-align` | `start` | L154 |
| `text-transform` | `none` (`$structured-list-text-transform: none !default`) | L155 |
| `vertical-align` | `top` | L156 |
| `padding` (default) | `16px 8px 8px 8px` (`$spacing-05 $spacing-03 $spacing-03 $spacing-03`) — from `padding-th` mixin | `_mixins.scss` L48-50 |
| `padding-inline-start` (first cell) | `16px` (`1rem`) — overrides default to keep the leading edge aligned | `_structured-list.scss` L48-55 |
| `font` | `heading-compact-01` — 14px / 18px / 600 / 0.16px | L148 |

### Body cell `<cds-structured-list-cell>` (`.cds--structured-list-td`)

| Property | Value | Source line |
|---|---|---|
| `position` | `relative` | L169 |
| `display` | `table-cell` | L170 |
| `color` | `#525252` (`$text-secondary`) | L171 |
| `max-inline-size` | `36rem` (576px) — caps cell width to keep paragraphs readable | L172 |
| `padding` (default) | `16px 8px 24px 8px` (`$spacing-05 $spacing-03 $spacing-06 $spacing-03`) — from `padding-td` mixin | `_mixins.scss` L57-59 |
| `font` | `body-01` — 14px / 20px / 400 / 0.16px | L166 |
| `transition` | `color var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` (`110ms` standard) | L174-175 |

### Row `<cds-structured-list-row>` (`.cds--structured-list-row`)

| State | Background | Color (cells) | Border | Other |
|---|---|---|---|---|
| Rest | (inherits — transparent) | `#525252` (`$text-secondary`) | `border-block-start: 1px solid #c6c6c6` (`$border-subtle`) | `display: table-row` |
| Last child (any mode) | (inherits) | (inherits) | `border-block-end: 1px solid #c6c6c6` added (`$border-subtle`) | from L81-84 |
| Header row (`.cds--structured-list-row--header-row`) | (inherits) | `#161616` (`$text-primary`) | `border: none` (overrides the body-row top border so the header sits flush) | `cursor: inherit` |
| Hover (Selection mode only, non-header, non-selected) | `#e8e8e8` (`$layer-hover`) | `#161616` (`$text-primary`) | top border becomes `#e8e8e8` (`$layer-hover` — matches bg) | `cursor: pointer` |
| Hover, next sibling row | (rest) | (rest) | top border of the **following** row becomes `#e8e8e8` (so the seam with the hovered row also tints) | from L99-105 |
| Selected (`.cds--structured-list-row--selected`) | `#e0e0e0` (`$layer-selected`) | `#161616` (`$text-primary`) | top border becomes `#e0e0e0` (`$layer-selected`) | from L107-117 |
| Selected, next sibling row | (rest) | (rest) | top border of the **following** row becomes `#e0e0e0` | from L113-117 |
| Focus (Selection mode — `.cds--structured-list-row--focused-within`) | (rest) | (rest) | `outline: 2px solid var(--cds-focus)` with the inset companion ring (Carbon double-ring via `@include focus-outline('outline')`) | from L26-28 |
| Transition | — | — | `transition: background-color var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` | L77-78 |

### Selection input `<cds-structured-list-row[selection-value]>` (renders a hidden `<input type="radio">` per row in WC; React uses `<StructuredListInput>`)

| Property | Value |
|---|---|
| Element | `<input type="radio">` (visually hidden — sits in the row but is offscreen) |
| Group | All radios in one list share `name="<selection-name>"` (or `name="row-0"` in the React `Selection` story) |
| Value | the row's `selection-value` (WC) / `value` (React) attribute is submitted on selection |
| Visual indicator | the next sibling cell's `<svg>` (with class `.cds--structured-list-svg`) becomes `fill: $icon-primary` when `:checked` |
| Default `<svg>` fill | `transparent` (the icon is in the DOM but invisible until selected) |
| `:checked` adjacent transition | `transition: all var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` on the `<svg>` |

### Selection checkmark column

| Property | Value | Source line |
|---|---|---|
| `inline-size` (last `<td>` in selection mode) | `32px` (`$spacing-07`) | L211-213 |
| `padding-inline-start` (last `<td>` in selection mode) | `0` | L213 |
| `<svg>` `display` | `inline-block` | L187 |
| `<svg>` `margin-block-start` | `2px` (`$spacing-01`) | L188 |
| `<svg>` `vertical-align` | `top` | L190 |
| `<svg>` `fill` (rest) | `transparent` | L208 |
| `<svg>` `fill` (`:checked` adjacent row) | `#161616` (`$icon-primary`) | L199 |
| `<svg>` `transition` | `all var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` | L189 |

### Density modifiers

| Modifier | What changes | Resolved value |
|---|---|---|
| `.cds--structured-list--condensed` (WC: `condensed` attr / React: `isCondensed` prop) | `<th>` and `<td>` padding becomes `$padding * 0.25` (where `$padding = 2rem`) → all-around `0.5rem` | `padding: 8px` on every cell |
| `.cds--structured-list--flush` (WC: `flush` attr / React: `isFlush` prop) | Removes the leading `padding-inline-start` (the first-cell `1rem` override is overridden back to `0`); trailing inline padding stays `1rem` | `padding-inline: 0 16px` on every cell — content aligns to the wrapper edge |
| `.cds--structured-list--selection` (WC: `selection-name` attr / React: `selection` prop) | `<th>` and `<td>` padding becomes the `padding--data-structured-list` mixin → `$padding * 0.5` (`1rem`) inline on every cell, including the first | `padding-inline: 16px 16px` on every cell |

### Skeleton state (`.cds--structured-list.cds--skeleton`)

| Property | Value | Source line |
|---|---|---|
| Header cell `:first-child` | `inline-size: 8%` | L230-232 |
| Header cell `:nth-child(3n + 2)` | `inline-size: 30%` | L234-236 |
| Header cell `:nth-child(3n + 3)` | `inline-size: 15%` | L238-240 |
| Inner `<span>` (the bar inside each header cell) | `display: block; block-size: 1rem; inline-size: 75%; @include skeleton` | L243-250 |
| First header in `selection` skeleton | `inline-size: 5%` and `<span>` is hidden | L253-260 |
| Skeleton background colour (light) | `#e8e8e8` (`--cds-skeleton-background`) | overview.md |
| Skeleton element colour (light) | `#c6c6c6` (`--cds-skeleton-element`) | overview.md |
| Skeleton background colour (dark, G100) | `#292929` (`--cds-skeleton-background`) | overview.md |
| Skeleton element colour (dark, G100) | `#393939` (`--cds-skeleton-element`) | overview.md |

## Animation & Motion

StructuredList's only motion is the **row-background tint** + **cell-color promotion** + **checkmark fill** on selection / hover. There is no expand animation, no slide-in, no shimmer (apart from the standard skeleton pulse). All transitions use the productive duration/easing pair — Carbon classifies StructuredList as a "productive" component (data-dense, fixed type scale, fast feedback).

```css
/* Row tint on hover / selection (Selection mode only) */
.cds--structured-list-row {
  transition:
    background-color
      var(--cds-duration-fast-02)        /* 110ms */
      var(--cds-easing-productive-standard); /* cubic-bezier(0.2, 0, 0.38, 0.9) */
}

/* Cell text colour promotion (text-secondary -> text-primary on hover/select) */
.cds--structured-list-td {
  transition:
    color
      var(--cds-duration-fast-02)
      var(--cds-easing-productive-standard);
}

/* Checkmark fill (transparent -> icon-primary when row is :checked) */
.cds--structured-list-svg {
  transition:
    all
      var(--cds-duration-fast-02)
      var(--cds-easing-productive-standard);
}

/* Reduced-motion: skip the tint animations entirely */
@media (prefers-reduced-motion: reduce) {
  .cds--structured-list-row,
  .cds--structured-list-td,
  .cds--structured-list-svg {
    transition: none;
  }
}
```

**Skeleton pulse** uses Carbon's shared `@include skeleton` mixin, which renders a `linear-gradient` background that animates with the global `var(--cds-duration-slow-02)` (`700ms`) easing. The pulse is identical across all skeleton-bearing components and is governed by Carbon's central `prefers-reduced-motion` handling — no per-component override needed.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** WC source uses `display: table` / `display: table-row` / `display: table-cell` on `<cds-*>` custom elements (not actual `<table>`). React source emits `<div role="row">` / `<div role="cell">` semantics through the wrapper. Either way, the rendered output is announced as a table by assistive tech.
- **ARIA — Selection mode:**
  - The hidden `<input type="radio">` carries an `aria-label` (Selection story passes `aria-label={`row-${i}`}`) so screen readers announce the row name when the radio receives focus
  - The visible checkmark `<svg>` carries `aria-label="select an option"` and a `<title>select an option</title>` child so it is announced when the row is selected
  - All inputs in one list share a `name` attribute (WC: `selection-name`; React: `name="row-0"` in the `Selection` story) — this is what makes them a mutually-exclusive radio group
- **ARIA — Default mode:** No interactive ARIA required. Cells inherit table semantics from the layout role.
- **Keyboard:**
  - Default mode: not focusable (read-only data has no interactive affordance)
  - Selection mode: `Tab` moves focus to the **first** radio in the list, then arrow keys move between radios in the group (native radio-button behaviour). `Space` selects the focused radio. `Tab` again leaves the list.
  - The `.cds--structured-list-row--focused-within` class is added (via `:has()` or React focus handler) when any descendant is focused, so the row gets the visible focus outline even though the radio itself is offscreen.
- **Focus management:** Carbon's CSS provides `outline: 2px solid var(--cds-focus)` on the focused row via `@include focus-outline('outline')` — this is the **double-ring** focus signature (`2px outline + inset 1px background-coloured ring`). DO NOT remove it.
- **Touch target:** Default row height is `~64px` (header `40px`, body `~64px` from `16px + content + 24px` padding plus `body-01` line-height). Condensed rows reduce to `~32px`, which is below WCAG 2.5.5 (44×44px) — when condensed Selection mode is used on touch devices, wrap rows in a media-query override:
  ```css
  @media (pointer: coarse) {
    .cds--structured-list--condensed .cds--structured-list-row { min-height: 44px; }
  }
  ```
- **Selection feedback:** When a row is selected, the cell text colour promotes from `--cds-text-secondary` (low contrast `#525252`) to `--cds-text-primary` (high contrast `#161616`). This is a deliberate **non-colour** signal (the checkmark) PLUS a colour signal (text contrast bump) PLUS a fill signal (background tint) — three redundant cues so the selection is conveyed to colour-blind, motion-sensitive, and screen-reader users alike.
- **Header cells:** `text-align: start` and `vertical-align: top` are deliberate — column headers stay locked to the top of multi-line rows so the visual mapping `header → first line of cell` is preserved.

## Responsive behaviour

StructuredList is **not** built for mobile-first the way DataTable is. It uses `display: table` and `inline-size: 100%`, so it expands to its container's width but does not collapse columns to stacked card view at narrow widths. Carbon's guidance:

- **Desktop / tablet (>= 672px):** use as-is — `width: 100%` of the parent; consider wrapping in a max-width container so paragraph cells don't stretch beyond the `36rem` `max-inline-size` cap
- **Mobile (< 672px):** prefer `condensed` mode (smaller padding) OR switch to a different pattern (e.g., `ContainedList` with `expandableSearch` or a stack of `Tile`s for card-style mobile presentation)
- **Horizontal overflow:** Carbon sets `overflow-x: auto` on the wrapper, so if you exceed the viewport, the list scrolls horizontally rather than wrapping awkwardly. Surface a visible scroll affordance (gradient mask on the right edge) if you ship it on mobile.
- **Long cell content:** the `36rem` `max-inline-size` on `.cds--structured-list-td` keeps paragraphs from spanning excessively wide columns. Cells default to wrap; add `noWrap` (React) / no equivalent in WC (achieved with `style="white-space: nowrap"`) on cells that should not break (e.g., dates, IDs, statuses).

## Composition with other Carbon components

| Slot | Pattern |
|---|---|
| Above the list | `Heading` (`heading-03` — 20px) + optional descriptive paragraph (`body-01`); leave `$spacing-05` (16px) below the heading and `$spacing-03` (8px) above the list |
| Inside cells | `Link` (inline), `Tag` (status), short `Button` (`size="sm"`) for row actions, `Tooltip`-wrapped icons for inline hints. Avoid putting `TextInput` / `Dropdown` inside cells — that is a `DataTable` use case, not StructuredList |
| Inside selection rows | The Selection story shows the canonical pattern: `<StructuredListInput>` (hidden radio) immediately before the trailing `<StructuredListCell>` that holds the `<CheckmarkFilled>` icon. Do not invent your own selection markup |
| Around the list (page composition) | StructuredList sits naturally inside a Tile (`Tile` → padded surface → StructuredList inside). When inside `<WithLayer>` or any nested layer, the list inherits the layer-tier background automatically because its own background is `transparent` |
| Skeleton | Show `<StructuredListSkeleton rowCount={N}>` (React) or the WC equivalent during the data fetch. Keep the row count equal to the expected payload size to avoid layout shift on settle |

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) — Carbon never rounds StructuredList | Don't add `border-radius` |
| Use only **horizontal** row borders (`border-block-start: 1px solid var(--cds-border-subtle-01)`) | Don't draw vertical column lines or zebra striping — that is the visual signature of a different table system |
| Use `cds--*` class names from the WC source (`.cds--structured-list`, `.cds--structured-list-row`, `.cds--structured-list-th`, `.cds--structured-list-td`) | Don't invent your own class names |
| Use `<cds-structured-list>` and its child elements for WC; `<StructuredListWrapper>` etc. for React | Don't substitute generic `<table>` / `<tr>` / `<td>` — Carbon's Custom Elements carry the prefix-protected styling and accessibility wiring |
| Wrap in `[data-theme="white"]` / `[data-theme="g10"]` / `[data-theme="g90"]` / `[data-theme="g100"]` | Don't define your own theme classes — use the four canonical Carbon themes |
| Use Selection mode when "pick one row" is the intent | Don't use Selection mode when you need multi-pick — that's a different component (`Tile.MultiSelect` or a `DataTable` with the batch-actions toolbar) |
| Use `condensed` for dense definition lists (settings, key-value pairs) | Don't use `condensed` on touch-first surfaces unless you also bump `min-height` to `44px` per WCAG 2.5.5 |
| Use `flush` when the list sits inside a parent that already provides edge padding (e.g., a Tile) | Don't use `flush` for top-level lists — the leading padding aligns the first column to the page grid |
| Cap cell width at `36rem` (Carbon's default) for paragraph cells | Don't override `max-inline-size` — wide cells become unreadable runs of text |
| Render the Skeleton at the same row count as the expected data payload | Don't use the wrong skeleton — `StructuredListSkeleton` is shape-specific (3 columns wide, generic widths). For different shapes, use `SkeletonText` / `SkeletonPlaceholder` directly |
| Use `--cds-text-primary` for the header and `--cds-text-secondary` for body cells | Don't promote body-cell text to `text-primary` — Carbon's contrast hierarchy reserves `text-primary` for headers and selected rows |
| Keep transitions at `var(--cds-duration-fast-02)` (110ms) productive-standard | Don't slow down the row tint — StructuredList is a productive component, fast feedback only |
| Honour `prefers-reduced-motion` by setting `transition: none` on rows / cells / svg | Don't keep the tint animation when the user has requested reduced motion |
| Pair StructuredList with a Heading above (16px gap) and let it inherit the parent's `--cds-layer` background | Don't apply a hard background colour to the wrapper — its own `background` is `$layer transparent` so it blends with the surrounding tier |
