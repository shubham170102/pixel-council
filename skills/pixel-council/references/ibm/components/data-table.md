---
name: data-table
description: Carbon DataTable — the flagship enterprise data grid. Variants embedded verbatim from Storybook: Default (basic), XLWithTwoLines, WithToolbar (Default/PersistentToolbar/SmallPersistentToolbar/WithOverflowMenu), WithSorting, WithSelection (multi/radio/with-sorting), WithBatchActions, WithExpansion (single + batch), FilteringWithMultiSelect, DynamicContent, Skeleton — five row densities (xs 24px / sm 32px / md 40px / lg 48px default / xl 64px), zebra stripes, sticky header, and AILabel decoration.
metadata:
  tags: data-table, table, data-grid, grid, sortable, selectable, expandable, batch-actions, toolbar, pagination, sticky-header, zebra, skeleton, enterprise, ibm, carbon, react, web-components
---

# DataTable -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React stories folder:** [`packages/react/src/components/DataTable/stories/`](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/DataTable/stories) — DataTable's stories are split across multiple files (Basic / Toolbar / Sorting / Selection / Batch-actions / Filtering / Expansion / Dynamic-content / AI-label)
> - [`DataTable-basic.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-basic.stories.js)
> - [`DataTable-toolbar.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-toolbar.stories.js)
> - [`DataTable-sorting.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-sorting.stories.js)
> - [`DataTable-selection.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-selection.stories.js)
> - [`DataTable-batch-actions.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-batch-actions.stories.js)
> - [`DataTable-filtering.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/DataTable-filtering.stories.js)
> - [`expansion/DataTable-expansion.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/expansion/DataTable-expansion.stories.js)
> - [`dynamic-content/DataTable-dynamic-content.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/dynamic-content/DataTable-dynamic-content.stories.js)
> - [`stories/shared.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DataTable/stories/shared.js) — shared `rows` / `headers` / `batchActionClick` fixtures used by every React story
> - **WC stories folder:** [`packages/web-components/src/components/data-table/stories/`](https://github.com/carbon-design-system/carbon/tree/main/packages/web-components/src/components/data-table/stories) — also split: `data-table-basic`, `data-table-toolbar`, `data-table-sorting`, `data-table-selection`, `data-table-batch-actions`, `data-table-filtering`, `data-table-expansion`, `data-table-dynamic`, `data-table-skeleton`, `data-table-ai-label`
> - **SCSS source:** [`packages/styles/scss/components/data-table/_data-table.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/data-table/_data-table.scss) (1191-line monolith — Container, Header, Body, Sort, Selection, Expansion, Sizes, Sticky, Zebra, Top-aligned, AI Label all inside the single `@mixin data-table` block)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-datatable-basic--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-datatable--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/data-table/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

DataTable is Carbon's flagship enterprise component — a fully-featured data grid that ships toolbar (search + filter + overflow + primary action), header sort, multi-row selection (checkbox or radio), batch action bar, expandable rows, sticky header, zebra striping, five row densities (`xs`/`sm`/`md`/`lg`/`xl`), skeleton loader, and an AILabel decorator out of the box. Carbon's React API is composition-based: `<DataTable>` is a render-prop wrapper that hands you `getHeaderProps`, `getRowProps`, `getSelectionProps`, `getBatchActionProps`, `getToolbarProps`, `getExpandHeaderProps`, `getExpandedRowProps`, `getCellProps`, `getTableProps`, `getTableContainerProps`, `onInputChange`, `selectedRows` — and you assemble `<Table>`, `<TableHead>`, `<TableHeader>`, `<TableBody>`, `<TableRow>`, `<TableCell>`, `<TableSelectAll>`, `<TableSelectRow>`, `<TableExpandHeader>`, `<TableExpandRow>`, `<TableExpandedRow>`, `<TableToolbar>`, `<TableToolbarContent>`, `<TableToolbarSearch>`, `<TableToolbarMenu>`, `<TableToolbarAction>`, `<TableBatchActions>`, `<TableBatchAction>` from those props. The Web Components mirror is declarative: drop in `<cds-table>` with feature-flag attributes (`is-sortable`, `is-selectable`, `expandable`, `batch-expansion`, `radio`, `?use-zebra-styles`, `?use-static-width`, `size="xs|sm|md|lg|xl"`).

The visual signature you must preserve: **sharp corners (border-radius: 0)**, header on `--cds-layer-accent-01` (`#e0e0e0` White / `#525252` G100), body rows on `--cds-layer-01`, hover `--cds-layer-hover-01`, selected `--cds-layer-selected-01` with a 1px `--cds-layer-active-01` bottom border. Header text is `heading-compact-01` (semibold). Cells are `body-compact-01`. The toolbar height matches the row size (`lg` = 48px). The batch action bar slides in over the toolbar from above when `shouldShowBatchActions` is true and shows "{n} item(s) selected" + action buttons + a Cancel button on the right. The expansion chevron is `chevron-right-16` rotated 0deg (collapsed) → 90deg (expanded). The sort arrow is `arrow-down-16` rotated 180deg (ASC) → 0deg (DESC) and shows on hover for unsorted columns.

## Quick Reference

| Property | Value |
|---|---|
| Sizes (row heights) | `xs` = `1.5rem` (24px) / `sm` = `2rem` (32px) / `md` = `2.5rem` (40px) / `lg` = `3rem` (48px, default) / `xl` = `4rem` (64px) |
| React import (default) | `import { DataTable } from '@carbon/react';` then destructure `Table, TableHead, TableHeader, TableBody, TableRow, TableCell` from `DataTable` (or import the subcomponents directly from `@carbon/react`) |
| React imports (selection) | `TableSelectAll`, `TableSelectRow` |
| React imports (expansion) | `TableExpandHeader`, `TableExpandRow`, `TableExpandedRow` |
| React imports (toolbar) | `TableToolbar`, `TableToolbarContent`, `TableToolbarSearch`, `TableToolbarMenu`, `TableToolbarAction` |
| React imports (batch) | `TableBatchActions`, `TableBatchAction` |
| WC import | `import '@carbon/web-components/es/components/data-table/index.js';` |
| Custom elements | `<cds-table>`, `<cds-table-head>`, `<cds-table-header-row>`, `<cds-table-header-cell>`, `<cds-table-body>`, `<cds-table-row>`, `<cds-table-cell>`, `<cds-table-cell-content>`, `<cds-table-toolbar>`, `<cds-table-toolbar-content>`, `<cds-table-toolbar-search>`, `<cds-table-batch-actions>`, `<cds-table-expanded-row>`, `<cds-table-skeleton>`, `<cds-table-header-title>`, `<cds-table-header-description>` |
| Container padding | `padding-block-start: $spacing-01` (4px — reserves room for focus ring) |
| Container header padding | `padding-block: $spacing-05 $spacing-06` = `16px 0 24px 0`, `padding-inline: $spacing-05` = `0 16px` |
| Header (`<th>`) background | `--cds-layer-accent-01` (`#e0e0e0` White / `#525252` G100) |
| Header (`<th>`) text color | `--cds-text-primary` (`#161616` White / `#f4f4f4` G100) |
| Header (`<th>`) typography | `heading-compact-01` — `font-size: 0.875rem` (14px) / `line-height: 1.28572` (18px) / `font-weight: 600` / `letter-spacing: 0.16px` |
| Header padding-inline | `$spacing-05 $spacing-05` = `16px 16px` |
| Body (`<td>`) background | `--cds-layer-01` (`#ffffff` White / `#393939` G100) |
| Body (`<td>`) text color | `--cds-text-secondary` (`#525252` White / `#c6c6c6` G100) |
| Body (`<td>`) typography | `body-compact-01` — `font-size: 0.875rem` / `line-height: 1.28572` / `font-weight: 400` / `letter-spacing: 0.16px` |
| Body padding-inline | `$spacing-05 $spacing-05` = `16px 16px` |
| Body row border-block-end | `1px solid $border-subtle-01` (`#c6c6c6` White / `#6f6f6f` G100) |
| Body row hover background | `--cds-layer-hover-01` (`#e8e8e8` White / `#4c4c4c` G100) |
| Body row hover border (top + bottom) | `1px solid $layer-hover` |
| Selected row background | `--cds-layer-selected-01` (`#e0e0e0` White / `#525252` G100) |
| Selected row top border | `1px solid $layer-selected` |
| Selected row bottom border | `1px solid $layer-active` (`#c6c6c6` White / `#6f6f6f` G100) |
| Selected row hover background | `--cds-layer-selected-hover-01` (resolves to `#cacaca` White / `#636363` G100) |
| Last selected row bottom border | `1px solid $border-subtle-selected` (`--cds-border-subtle-selected-01`) |
| Disabled link text | `--cds-text-disabled` (`rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Zebra odd row | `--cds-layer-01` |
| Zebra even row | `--cds-layer-accent-01` (`#e0e0e0`) — note the surface-tier inversion |
| Sort arrow icon | `arrow-down-16` (Carbon icon set), 16×16 px, transitions `transform 110ms ease` |
| Sort hover background | `--cds-layer-active` (`#c6c6c6` White / `#6f6f6f` G100) — header cell darkens on hover when sortable |
| Sort visible-when-active | shows arrow always when column is the active sort target; on hover for inactive columns |
| Expansion chevron | `chevron-right-16` (16×16), `transform: rotate(0deg)` collapsed, `rotate(90deg)` expanded, `transition: transform 150ms cubic-bezier(0.2, 0, 0.38, 0.9)` |
| Expansion column width | `2.5rem` (40px) at `md`, fills first `<th>`/`<td>` slot |
| Selection column width | `2.5rem` (40px), checkbox/radio centered in cell |
| Toolbar height | matches row size (`lg` = 48px / `md` = 40px / `sm` = 32px) |
| Toolbar background | `--cds-layer-01` |
| Toolbar primary button | `--cds-button-primary` (`#0f62fe`), full toolbar height, no inline padding (flush right) |
| TableToolbarSearch (default) | hidden until search icon clicked, expands to fill toolbar; `persistent` attribute keeps it always visible |
| TableToolbarSearch height | `48px` (`lg`) — ties to toolbar size |
| BatchAction bar background | `--cds-background-brand` (`#0f62fe`) — solid blue overlay covers the toolbar |
| BatchAction bar text | `--cds-text-on-color` (`#ffffff`) |
| BatchAction enter animation | `transform: translate3d(0, -100%, 0) → translate3d(0, 0, 0)` plus opacity, `$duration-fast-02` (110ms) `motion(entrance, productive)` cubic-bezier(0, 0, 0.38, 0.9) |
| BatchAction "{n} items selected" | `body-compact-01`, white, left-aligned, mirrors total-rows-count attribute on `<cds-table-batch-actions>` |
| Sticky header | `position: sticky; top: 0` on `<thead>` element with `z-index` above body rows; activated via `stickyHeader={true}` prop (React) — preview-quality flag |
| Skeleton row count | configurable via `rowCount` prop / `row-count` attribute; defaults vary per story (5 in WC) |
| Skeleton background | `--cds-skeleton-background` (`#e8e8e8` White / `#333333` G100) |
| Skeleton element | `--cds-skeleton-element` (`#c6c6c6` White / `#525252` G100), pulses via `@keyframes skeleton` |
| Focus ring (header sortable) | `outline: 2px solid var(--cds-focus)` `outline-offset: -2px`, `border: none` |
| Focus ring (row checkbox) | inherits Checkbox component focus ring (2px solid `--cds-focus`) |
| Border collapse | `border-collapse: collapse; border-spacing: 0` (always) |
| Corner radius | `0` (Carbon: sharp by default — never round DataTable) |
| Container width | `100%` by default; `useStaticWidth` / `?use-static-width` attribute switches to `width: auto` |
| Transition (row hover) | `background-color $duration-fast-01 (70ms) motion(entrance, productive)` |
| Transition (selected row) | `background-color $duration-fast-01 motion(entrance, productive)` |
| ARIA — table | `<table role="table">` (default browser semantics); add `aria-label="..."` on `<Table>` (every story does this) |
| ARIA — header sortable | `<th aria-sort="none|ascending|descending">` toggled by Carbon's sort handler |
| ARIA — selected row | `<tr aria-selected="true">` on `TableSelectRow` selection (Carbon adds automatically) |
| ARIA — expand row | `<button aria-label="Expand row" aria-expanded="false">` on `TableExpandRow`; updated to `true` when open |

## Variants (from Storybook story exports)

DataTable's stories are spread across **eight** React stories files and **ten** WC stories files. The list below is the complete enumeration of every named export we embed verbatim. Story keys with a `—` are not present in the corresponding library (e.g., the React story file uses `useState` to drive filtering while WC uses a static example).

| Variant | React story export (file) | WC story export (file) | Purpose |
|---|---|---|---|
| Default (basic) | `Default` (`DataTable-basic`) | `Default` (`data-table-basic`) | Plain `<Table>` with `<TableHead>` / `<TableBody>` rows. Five-column "Load Balancers" sample. The canonical reference example. Default size `lg` (48px row). |
| XL with two lines | `XLWithTwoLines` (`DataTable-basic`) | `XLWithTwoLines` (`data-table-basic`) | Sets `size="xl"` and stacks two text lines per name cell — demonstrates 64px row affordance. |
| With toolbar | `Default` (`DataTable-toolbar`) | `Default` (`data-table-toolbar`) | `<TableToolbar>` adds `<TableToolbarSearch>` + `<TableToolbarMenu>` (overflow with 3 actions) + `<Button>` primary action above the table. Search expands on click. |
| Persistent toolbar | `PersistentToolbar` (`DataTable-toolbar`) | `PersistentToolbar` (`data-table-toolbar`) | Same as above but `<TableToolbarSearch persistent>` keeps the search field always visible (full-width, no expand-on-click). |
| Small persistent toolbar | `SmallPersistentToolbar` (`DataTable-toolbar`) | `SmallPersistentToolbar` (`data-table-toolbar`) | Persistent toolbar with `size="sm"` on toolbar + table — 32px row + 32px toolbar. Use for dense admin views. |
| With overflow menu (per row) | `WithOverflowMenu` (`DataTable-toolbar`) | `WithOverflowMenu` (`data-table-toolbar`) | Adds an extra empty `<TableHeader aria-label="overflow actions" />` plus an `<OverflowMenu>` in each row's last `<TableCell className="cds--table-column-menu">`. The 3-dot menu appears at row end (`flipped`) with Stop / Restart / Rename app. |
| With sorting | `Default` (`DataTable-sorting`) | `Default` (`data-table-sorting`) | `<DataTable isSortable>` (`<cds-table is-sortable>`) — every header becomes a sort button with `aria-sort` toggle. Click cycles `none → ascending → descending → none`. |
| With selection (multi) | `Default` (`DataTable-selection`) | `Default` (`data-table-selection`) | Adds leftmost `<TableSelectAll>` + `<TableSelectRow>` per row. Each row becomes a multi-select checkbox; the header SelectAll toggles all rows. WC equivalent: `selection-name="header"` on `<cds-table-header-row>` + `selection-name="0|1|2…"` on each `<cds-table-row>`. |
| With radio selection | `WithRadioSelection` (`DataTable-selection`) | `WithRadioSelection` (`data-table-selection`) | `<DataTable radio>` swaps every row checkbox for a radio button — single-select pattern. Header gets a blank `<th scope="col" />`. WC: `<cds-table is-selectable with-header radio>` + `hide-checkbox` on header row. |
| With selection + sorting | `WithSelectionAndSorting` (`DataTable-selection`) | `WithSelectionAndSorting` (`data-table-selection`) | Combines `isSortable` + `<TableSelectAll>` / `<TableSelectRow>`. The selection column is fixed left (not sortable). |
| With batch actions | `Default` (`DataTable-batch-actions`) | `Default` (`data-table-batch-actions`) | Wires `<TableBatchActions>` (Delete / Save / Download with `@carbon/icons-react`) above the toolbar; bar slides in when ≥1 row selected. `aria-hidden` swap hides toolbar content while batch is active. WC equivalent: `<cds-table-batch-actions total-rows-count="6">`. |
| With filtering | `Default` (`DataTable-filtering`) | `Default` (`data-table-filtering`) | React: stateful `useState(rows)` + `TableToolbarFilter` example component (multi-select checkbox panel) drives client-side filter. WC: same toolbar shape (`<cds-table-toolbar-content has-batch-actions>`) — filter component is a custom example, not a built-in WC element. |
| With expansion | `Default` (`expansion/DataTable-expansion`) | `Default` (`data-table-expansion`) | `<TableExpandHeader>` + `<TableExpandRow>` + `<TableExpandedRow>` (React) / `expandable` attribute + `<cds-table-expanded-row>` (WC). Each row gains a chevron expand button; expanded content spans the full table width via `colSpan={headers.length + 1}`. |
| Batch expansion (toggle all) | `BatchExpansion` (`expansion/DataTable-expansion`) | `BatchExpansion` (`data-table-expansion`) | `<TableExpandHeader enableToggle={true}>` (React) / `batch-expansion` attribute (WC) gives the header expand cell a master toggle that opens/closes every row at once. |
| Batch expansion (multiple tables) | `BatchExpansionMultipleTables` (`expansion/DataTable-expansion`) | — | Tagged `['!dev', '!autodocs']` — hidden from sidebar, used as integration test. Two `<DataTable>` instances side-by-side with `enableToggle`. Demonstrates that each table's batch toggle is scoped to its own rows. |
| Dynamic content (live add row/header) | `Default` (`dynamic-content/DataTable-dynamic-content`) | `Default` (`data-table-dynamic`) | Composes nearly every feature: toolbar + batch actions + expansion + selection + sortable + radio toggle. Toolbar's overflow menu has "Add row" / "Add header" actions that mutate component state. Status cells use `<IconIndicator>` (Failed / In progress / Succeeded). Demonstrates DataTable handles dynamic schema. |
| Skeleton | — (use `<DataTableSkeleton>` from `@carbon/react`) | `Default` (`data-table-skeleton`) | `<cds-table-skeleton column-count row-count show-header show-toolbar zebra>` renders pulsing placeholder rows while the real table loads. React equivalent imported as `import { DataTableSkeleton } from '@carbon/react';`. |
| With AI Label | `withAILabel` and 6 more variants (`DataTable-ai-label`) | `WithAILabel` etc. (`data-table-ai-label`) | Decorates header cells, individual cells, or the entire table with `<AILabel>` / `<cds-ai-label>` popover triggers. Adds Carbon's AI gradient outline + `inset 0 -80px 70px -65px $ai-inner-shadow` AI-aura around the table. See `DataTable-ai-label.stories.js` for the full enumeration (`AILabelWithSelection`, `AILabelWithRadioSelection`, `AILabelWithSelectionAndExpansion`, `AILabelWithExpansion`, `ColumnAILabelWithSelectionAndExpansion`, `ColumnAILabelSort`, `FullTableAI`). |

## React (verbatim from Storybook — Basic)

> The code blocks below are copied exactly from `DataTable-basic.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI. License: Apache 2.0.

**Imports + default export + shared args (top of `DataTable-basic.stories.js`):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { DataTable } from '..';

const {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableHeader,
  TableRow,
} = DataTable;

import mdx from '../DataTable.mdx';
import './datatable-story.scss';

export default {
  title: 'Components/DataTable/Basic',
  component: DataTable,
  subcomponents: {
    TableContainer,
    Table,
    TableHead,
    TableRow,
    TableHeader,
    TableBody,
    TableCell,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  size: {
    control: 'select',
    options: ['xs', 'sm', 'md', 'lg', 'xl'],
    description: 'Change the row height of table',
  },
  stickyHeader: {
    control: 'boolean',
    description:
      'Specify whether the header should be sticky. Still in preview: may not work with every combination of table props',
  },
  useStaticWidth: {
    control: 'boolean',
    description: 'If true, will use a width of "auto" instead of 100%',
  },
  useZebraStyles: {
    control: 'boolean',
    description: 'Add zebra striping to rows',
  },
};

const sharedArgs = {
  size: 'lg',
  stickyHeader: false,
  useStaticWidth: false,
  useZebraStyles: false,
};
```

**Variant: Default** (basic table — minimal API, plain `<Table>` without the render-prop wrapper):

```jsx
export const Default = (args) => {
  const rows = [
    {
      id: 'load-balancer-1',
      name: 'Load Balancer 1',
      rule: 'Round robin',
      Status: 'Starting',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-2',
      name: 'Load Balancer 2',
      rule: 'DNS delegation',
      status: 'Active',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-3',
      name: 'Load Balancer 3',
      rule: 'Round robin',
      status: 'Disabled',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-4',
      name: 'Load Balancer 4',
      rule: 'Round robin',
      status: 'Disabled',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-5',
      name: 'Load Balancer 5',
      rule: 'Round robin',
      status: 'Disabled',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-6',
      name: 'Load Balancer 6',
      rule: 'Round robin',
      status: 'Disabled',
      other: 'Test',
      example: '22',
    },
    {
      id: 'load-balancer-7',
      name: 'Load Balancer 7',
      rule: 'Round robin',
      status: 'Disabled',
      other: 'Test',
      example: '22',
    },
  ];
  const headers = ['Name', 'Rule', 'Status', 'Other', 'Example'];

  return (
    <Table {...args} aria-label="sample table">
      <TableHead>
        <TableRow>
          {headers.map((header) => (
            <TableHeader id={header.key} key={header}>
              {header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <TableRow key={row.id}>
            {Object.keys(row)
              .filter((key) => key !== 'id')
              .map((key) => {
                return <TableCell key={key}>{row[key]}</TableCell>;
              })}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
};

Default.args = sharedArgs;
Default.argTypes = sharedArgTypes;
```

**Variant: XLWithTwoLines** (`size="xl"`, two-line cell content for the Name column — identical to Default except every Name cell wraps in `<div className="sb-two-lines"><p>Load Balancer N</p><p>Austin, Tx</p></div>` and `XLWithTwoLines.args = { ...sharedArgs, size: 'xl' }`):

```jsx
export const XLWithTwoLines = (args) => {
  const rows = [
    {
      id: 'load-balancer-1',
      name: (
        <div className="sb-two-lines">
          <p>Load Balancer 1</p>
          <p>Austin, Tx</p>
        </div>
      ),
      rule: 'Round robin',
      Status: 'Starting',
      other: 'Test',
      example: '22',
    },
    /* ...rows 2-7 identical structure: each has the same `<div className="sb-two-lines">` wrapper around `<p>Load Balancer N</p><p>Austin, Tx</p>` for the `name` field; `rule` / `status` / `other` / `example` match the Default story's row N (rows 2-7 use 'DNS delegation'/'Active', then 'Round robin'/'Disabled' for the rest)... */
  ];
  const headers = ['Name', 'Rule', 'Status', 'Other', 'Example'];

  return (
    <Table {...args} aria-label="sample table">
      <TableHead>
        <TableRow>
          {headers.map((header) => (
            <TableHeader id={header.key} key={header}>
              {header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <TableRow key={row.id}>
            {Object.keys(row)
              .filter((key) => key !== 'id')
              .map((key) => {
                return <TableCell key={key}>{row[key]}</TableCell>;
              })}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
};

XLWithTwoLines.args = { ...sharedArgs, size: 'xl' };
XLWithTwoLines.argTypes = sharedArgTypes;
```

## React (verbatim from Storybook — Shared fixtures)

> Every Toolbar / Sorting / Selection / Batch-actions / Filtering / Expansion story in Carbon's React Storybook imports `rows`, `headers`, and `batchActionClick` from this file. Reproduce these exact fixtures when building demos so your output looks like Carbon's reference.

**File: `stories/shared.js`**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import { action } from 'storybook/actions';
import Link from '../../Link';

export const rows = [
  {
    id: 'a',
    name: 'Load Balancer 3',
    protocol: 'HTTP',
    port: 3000,
    rule: 'Round robin',
    attached_groups: 'Kevin’s VM Groups',
    status: (
      <Link href="#" disabled={true}>
        Disabled
      </Link>
    ),
  },
  {
    id: 'b',
    name: 'Load Balancer 1',
    protocol: 'HTTP',
    port: 443,
    rule: 'Round robin',
    attached_groups: 'Maureen’s VM Groups',
    status: <Link href="#">Starting</Link>,
  },
  {
    id: 'c',
    name: 'Load Balancer 2',
    protocol: 'HTTP',
    port: 80,
    rule: 'DNS delegation',
    attached_groups: 'Andrew’s VM Groups',
    status: <Link href="#">Active</Link>,
  },
  {
    id: 'd',
    name: 'Load Balancer 6',
    protocol: 'HTTP',
    port: 3000,
    rule: 'Round robin',
    attached_groups: 'Marc’s VM Groups',
    status: (
      <Link href="#" disabled={true}>
        Disabled
      </Link>
    ),
  },
  {
    id: 'e',
    name: 'Load Balancer 4',
    protocol: 'HTTP',
    port: 443,
    rule: 'Round robin',
    attached_groups: 'Mel’s VM Groups',
    status: <Link href="#">Starting</Link>,
  },
  {
    id: 'f',
    name: 'Load Balancer 5',
    protocol: 'HTTP',
    port: 80,
    rule: 'DNS delegation',
    attached_groups: 'Ronja’s VM Groups',
    status: <Link href="#">Active</Link>,
  },
];

export const headers = [
  {
    key: 'name',
    header: 'Name',
  },
  {
    key: 'protocol',
    header: 'Protocol',
  },
  {
    key: 'port',
    header: 'Port',
  },
  {
    key: 'rule',
    header: 'Rule',
  },
  {
    key: 'attached_groups',
    header: 'Attached groups',
  },
  {
    key: 'status',
    header: 'Status',
  },
];

export const batchActionClick = (selectedRows) => () =>
  action('Batch action click')(selectedRows);
```

## React (verbatim from Storybook — Sorting)

**Variant: Default (sorting)** — `isSortable` makes every column header a sort button. Header `aria-sort` cycles `none → ascending → descending → none` on click.

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import DataTable, {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableHeader,
  TableRow,
} from '..';
import { rows, headers } from './shared';
import mdx from '../DataTable.mdx';

export default {
  title: 'Components/DataTable/Sorting',
  component: DataTable,
  subcomponents: {
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableHeader,
    TableRow,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

export const Default = (args) => (
  <DataTable isSortable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getTableProps,
      getCellProps,
    }) => (
      <TableContainer title="DataTable" description="With sorting">
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              {headers.map((header) => (
                <TableHeader key={header.key} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);
```

## React (verbatim from Storybook — Selection)

> File: `DataTable-selection.stories.js`. Three exports: `Default` (multi-select checkbox), `WithRadioSelection` (single-select radio), `WithSelectionAndSorting`.

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import DataTable, {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableHeader,
  TableRow,
  TableSelectAll,
  TableSelectRow,
} from '..';
import { rows, headers } from './shared';
import mdx from '../DataTable.mdx';
import { action } from 'storybook/actions';

export default {
  title: 'Components/DataTable/Selection',
  component: DataTable,
  subcomponents: {
    TableSelectAll,
    TableSelectRow,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableHeader,
    TableRow,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  filterRows: { control: false },
  headers: { control: false },
  overflowMenuOnHover: { control: false },
  rows: { control: false },
  translateWithId: { control: false },
  sortRow: { control: false },
};

export const Default = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getSelectionProps,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With selection"
        {...getTableContainerProps()}>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              {args.radio ? (
                <th scope="col" />
              ) : (
                <TableSelectAll {...getSelectionProps()} />
              )}
              {headers.map((header, i) => (
                <TableHeader key={i} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow
                {...getRowProps({ row })}
                onClick={(evt) => {
                  action('TableRow onClick')(evt);
                }}>
                <TableSelectRow
                  {...getSelectionProps({ row })}
                  onChange={action('TableSelectRow - onChange')}
                />
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

Default.argTypes = { ...sharedArgTypes };

export const WithRadioSelection = (args) => (
  <DataTable rows={rows} headers={headers} radio {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getSelectionProps,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With radio selection"
        {...getTableContainerProps()}>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              <th scope="col" />
              {headers.map((header, i) => (
                <TableHeader key={i} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                <TableSelectRow {...getSelectionProps({ row })} />
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

WithRadioSelection.argTypes = { ...sharedArgTypes };

export const WithSelectionAndSorting = (args) => (
  <DataTable rows={rows} headers={headers} isSortable {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getSelectionProps,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With selection"
        {...getTableContainerProps()}>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              <TableSelectAll {...getSelectionProps()} />
              {headers.map((header, i) => (
                <TableHeader key={i} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                <TableSelectRow {...getSelectionProps({ row })} />
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

WithSelectionAndSorting.argTypes = { ...sharedArgTypes };
```

## React (verbatim from Storybook — Toolbar)

> File: `DataTable-toolbar.stories.js`. Four exports: `Default` (toolbar w/ search + overflow menu + primary button), `PersistentToolbar` (search always visible), `SmallPersistentToolbar`, `WithOverflowMenu` (per-row 3-dot menu).

**Imports + default export + shared args:**

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { action } from 'storybook/actions';
import React from 'react';
import Button from '../../Button';
import OverflowMenu from '../../OverflowMenu';
import OverflowMenuItem from '../../OverflowMenuItem';
import {
  default as DataTable,
  TableContainer,
  Table,
  TableHead,
  TableRow,
  TableHeader,
  TableBody,
  TableCell,
  TableToolbar,
  TableToolbarAction,
  TableToolbarContent,
  TableToolbarSearch,
  TableToolbarMenu,
} from '..';
import mdx from '../DataTable.mdx';
import { headers, rows } from './shared';

export default {
  title: 'Components/DataTable/Toolbar',
  component: DataTable,
  subcomponents: {
    TableContainer,
    Table,
    TableHead,
    TableRow,
    TableHeader,
    TableBody,
    TableCell,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  size: {
    options: ['xs', 'sm', 'md', 'lg', 'xl'],
    control: { type: 'select' },
  },
  useZebraStyles: {
    control: { type: 'boolean' },
  },
  isSortable: { control: { type: 'boolean' } },
  persistent: { control: { type: 'boolean' } },
};
```

**Variant: Default** (toolbar with collapsible search + overflow menu + primary button):

```jsx
export const Default = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getTableProps,
      getToolbarProps,
      onInputChange,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With toolbar"
        {...getTableContainerProps()}>
        <TableToolbar {...getToolbarProps()} aria-label="data table toolbar">
          <TableToolbarContent>
            <TableToolbarSearch onChange={onInputChange} />
            <TableToolbarMenu>
              <TableToolbarAction onClick={action('Action 1 Click')}>
                Action 1
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 2 Click')}>
                Action 2
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 3 Click')}>
                Action 3
              </TableToolbarAction>
            </TableToolbarMenu>
            <Button onClick={action('Button click')}>Primary Button</Button>
          </TableToolbarContent>
        </TableToolbar>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              {headers.map((header) => (
                <TableHeader key={header.key} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

Default.argTypes = { ...sharedArgTypes };
```

**Variant: PersistentToolbar** (`<TableToolbarSearch persistent>` keeps the search field always expanded):

```jsx
export const PersistentToolbar = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getTableProps,
      getToolbarProps,
      onInputChange,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With toolbar"
        {...getTableContainerProps()}>
        <TableToolbar {...getToolbarProps()} aria-label="data table toolbar">
          <TableToolbarContent>
            <TableToolbarSearch onChange={onInputChange} persistent />
            <TableToolbarMenu>
              <TableToolbarAction onClick={action('Action 1 Click')}>
                Action 1
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 2 Click')}>
                Action 2
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 3 Click')}>
                Action 3
              </TableToolbarAction>
            </TableToolbarMenu>
            <Button onClick={action('Button click')}>Primary Button</Button>
          </TableToolbarContent>
        </TableToolbar>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              {headers.map((header) => (
                <TableHeader key={header.key} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

PersistentToolbar.argTypes = { ...sharedArgTypes };
```

**Variant: SmallPersistentToolbar** (`size="sm"` toolbar + search + menu + table):

```jsx
export const SmallPersistentToolbar = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getTableProps,
      getToolbarProps,
      onInputChange,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With toolbar"
        {...getTableContainerProps()}>
        <TableToolbar
          {...getToolbarProps()}
          aria-label="data table toolbar"
          size="sm">
          <TableToolbarContent>
            <TableToolbarSearch onChange={onInputChange} persistent size="sm" />
            <TableToolbarMenu size="sm">
              <TableToolbarAction onClick={action('Action 1 Click')}>
                Action 1
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 2 Click')}>
                Action 2
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 3 Click')}>
                Action 3
              </TableToolbarAction>
            </TableToolbarMenu>
            <Button onClick={action('Button click')}>Primary Button</Button>
          </TableToolbarContent>
        </TableToolbar>
        <Table {...getTableProps()} size="sm" aria-label="sample table">
          <TableHead>
            <TableRow>
              {headers.map((header) => (
                <TableHeader key={header.key} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

SmallPersistentToolbar.argTypes = { ...sharedArgTypes };
```

**Variant: WithOverflowMenu** (adds a 3-dot `<OverflowMenu>` to each row's last cell — Stop / Restart / Rename app):

```jsx
export const WithOverflowMenu = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getTableProps,
      getToolbarProps,
      onInputChange,
      getCellProps,
    }) => (
      <TableContainer title="DataTable" description="With overflow menu">
        <TableToolbar {...getToolbarProps()} aria-label="data table toolbar">
          <TableToolbarContent>
            <TableToolbarSearch onChange={onInputChange} />
            <TableToolbarMenu>
              <TableToolbarAction onClick={action('Action 1 Click')}>
                Action 1
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 2 Click')}>
                Action 2
              </TableToolbarAction>
              <TableToolbarAction onClick={action('Action 3 Click')}>
                Action 3
              </TableToolbarAction>
            </TableToolbarMenu>
            <Button onClick={action('Button click')}>Primary Button</Button>
          </TableToolbarContent>
        </TableToolbar>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              {headers.map((header) => (
                <TableHeader key={header.key} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
              <TableHeader aria-label="overflow actions" />
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map((cell) => (
                  <TableCell {...getCellProps({ cell })}>
                    {cell.value}
                  </TableCell>
                ))}
                <TableCell className="cds--table-column-menu">
                  <OverflowMenu size="sm" flipped>
                    <OverflowMenuItem itemText="Stop app" />
                    <OverflowMenuItem itemText="Restart app" />
                    <OverflowMenuItem itemText="Rename app" />
                  </OverflowMenu>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

WithOverflowMenu.argTypes = {
  ...sharedArgTypes,
  overflowMenuOnHover: {
    control: { type: 'boolean' },
  },
};
```

## React (verbatim from Storybook — Batch Actions)

> File: `DataTable-batch-actions.stories.js`. Single export: `Default`. Demonstrates the BatchActionBar overlay + selection + toolbar swap pattern. When `shouldShowBatchActions` is true, the `<TableBatchActions>` slides in over `<TableToolbarContent>` (which gets `aria-hidden`).

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { action } from 'storybook/actions';
import { TrashCan, Save, Download, Add } from '@carbon/icons-react';

import Button from '../../Button';
import DataTable, {
  Table,
  TableBatchAction,
  TableBatchActions,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableHeader,
  TableRow,
  TableSelectAll,
  TableSelectRow,
  TableToolbar,
  TableToolbarAction,
  TableToolbarContent,
  TableToolbarSearch,
  TableToolbarMenu,
} from '..';

import { Toggletip, ToggletipButton, ToggletipContent } from '../../Toggletip';

import { batchActionClick, rows, headers } from './shared';
import mdx from '../DataTable.mdx';
import Link from '../../Link';

export default {
  title: 'Components/DataTable/Batch Actions',
  component: DataTable,
  subcomponents: {
    TableBatchAction,
    TableBatchActions,
    TableToolbar,
    TableToolbarAction,
    TableToolbarContent,
    TableToolbarSearch,
    TableToolbarMenu,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableHeader,
    TableRow,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

export const Default = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getRowProps,
      getSelectionProps,
      getToolbarProps,
      getBatchActionProps,
      onInputChange,
      selectedRows,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => {
      const batchActionProps = getBatchActionProps();

      return (
        <TableContainer
          title="DataTable"
          description="With batch actions"
          {...getTableContainerProps()}>
          <TableToolbar {...getToolbarProps()}>
            <TableBatchActions {...batchActionProps}>
              <TableBatchAction
                tabIndex={batchActionProps.shouldShowBatchActions ? 0 : -1}
                renderIcon={TrashCan}
                onClick={batchActionClick(selectedRows)}>
                Delete
              </TableBatchAction>
              <TableBatchAction
                tabIndex={batchActionProps.shouldShowBatchActions ? 0 : -1}
                renderIcon={Save}
                onClick={batchActionClick(selectedRows)}>
                Save
              </TableBatchAction>
              <TableBatchAction
                tabIndex={batchActionProps.shouldShowBatchActions ? 0 : -1}
                renderIcon={Download}
                onClick={batchActionClick(selectedRows)}>
                Download
              </TableBatchAction>
            </TableBatchActions>
            <TableToolbarContent
              aria-hidden={batchActionProps.shouldShowBatchActions}>
              <TableToolbarSearch
                tabIndex={batchActionProps.shouldShowBatchActions ? -1 : 0}
                onChange={(evt) => {
                  action('TableToolbarSearch - onChange')(evt);
                  onInputChange(evt);
                }}
              />
              <TableToolbarMenu
                tabIndex={batchActionProps.shouldShowBatchActions ? -1 : 0}>
                <TableToolbarAction onClick={() => alert('Alert 1')}>
                  Action 1
                </TableToolbarAction>
                <TableToolbarAction onClick={() => alert('Alert 2')}>
                  Action 2
                </TableToolbarAction>
                <TableToolbarAction onClick={() => alert('Alert 3')}>
                  Action 3
                </TableToolbarAction>
              </TableToolbarMenu>
              <Button
                tabIndex={batchActionProps.shouldShowBatchActions ? -1 : 0}
                onClick={action('Add new row')}
                kind="primary">
                Add new
              </Button>
            </TableToolbarContent>
          </TableToolbar>
          <Table {...getTableProps()} aria-label="sample table">
            <TableHead>
              <TableRow>
                <TableSelectAll {...getSelectionProps()} />
                {headers.map((header, i) => (
                  <TableHeader key={i} {...getHeaderProps({ header })}>
                    {header.header}
                  </TableHeader>
                ))}
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map((row) => (
                <TableRow {...getRowProps({ row })}>
                  <TableSelectRow
                    {...getSelectionProps({ row })}
                    onChange={action('TableSelectRow - onChange')}
                  />
                  {row.cells.map((cell) => (
                    <TableCell {...getCellProps({ cell })}>
                      {cell.value}
                    </TableCell>
                  ))}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      );
    }}
  </DataTable>
);

Default.args = {
  isSortable: false,
  locale: 'en',
  overflowMenuOnHover: true,
  size: 'lg',
  stickyHeader: false,
  useStaticWidth: false,
  useZebraStyles: false,
};

Default.argTypes = {
  locale: { control: 'text', description: 'Provide a string for the current locale' },
  overflowMenuOnHover: {
    control: 'boolean',
    description: 'Specify whether the overflow menu (if it exists) should be shown always, or only on hover',
  },
  size: {
    control: 'select',
    options: ['xs', 'sm', 'md', 'lg', 'xl'],
    description: 'Change the row height of table',
  },
  stickyHeader: {
    control: 'boolean',
    description: 'Specify whether the header should be sticky. Still in preview: may not work with every combination of table props',
  },
  useStaticWidth: { control: 'boolean', description: 'If true, will use a width of "auto" instead of 100%' },
  useZebraStyles: { control: 'boolean', description: 'Add zebra striping to rows' },
};
```

## React (verbatim from Storybook — Filtering)

> File: `DataTable-filtering.stories.js`. Uses `useState` to drive client-side row filtering. Pairs `<TableToolbarSearch onChange={onInputChange}>` (the built-in DataTable search filter) with a custom `<TableToolbarFilter>` example component (multi-select checkbox panel) imported from `./examples/TableToolbarFilter`.

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { action } from 'storybook/actions';
import React, { useState } from 'react';
import Button from '../../Button';
import DataTable, {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableHeader,
  TableRow,
  TableToolbar,
  TableToolbarContent,
  TableToolbarSearch,
  TableToolbarMenu,
  TableToolbarAction,
  TableBatchActions,
  TableBatchAction,
  TableSelectAll,
  TableSelectRow,
} from '..';
import { rows, headers } from './shared';
import mdx from '../DataTable.mdx';
import TableToolbarFilter from './examples/TableToolbarFilter';
import './datatable-story.scss';
import { Add, Download, Save, TrashCan } from '@carbon/icons-react';

export default {
  title: 'Components/DataTable/Filtering',
  component: DataTable,
  subcomponents: {
    TableToolbar,
    TableToolbarContent,
    TableToolbarSearch,
    TableToolbarMenu,
    TableToolbarAction,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableHeader,
    TableRow,
  },
  argTypes: {
    size: {
      options: ['xs', 'sm', 'md', 'lg', 'xl'],
      control: { type: 'select' },
    },
    useZebraStyles: { control: { type: 'boolean' } },
  },
  args: { size: 'lg', useZebraStyles: false },
  parameters: { docs: { page: mdx } },
};

export const Default = (args) => {
  const [renderedRows, setRenderedRows] = useState(rows);

  const handleTableFilter = (selectedCheckboxes) => {
    setRenderedRows([]);

    for (let i = 0; i < selectedCheckboxes.length; i++) {
      // Filter the items inside the rows list
      const filteredRows = rows.filter((row) => {
        return Object.values(row).some((value) =>
          String(value)
            .toLowerCase()
            .includes(selectedCheckboxes[i].toLowerCase())
        );
      });

      setRenderedRows((prevData) => {
        // Filter out duplicate rows
        const uniqueRows = filteredRows.filter((row) => {
          return !prevData.some((prevRow) => {
            return Object.keys(row).every((key) => {
              return row[key] === prevRow[key];
            });
          });
        });
        return [...prevData, ...uniqueRows];
      });
    }
  };

  const handleOnResetFilter = () => {
    setRenderedRows(rows);
  };

  return (
    <DataTable rows={renderedRows} headers={headers} {...args}>
      {({
        rows,
        headers,
        getHeaderProps,
        getRowProps,
        getTableProps,
        onInputChange,
        getCellProps,
      }) => (
        <TableContainer title="DataTable" description="With filtering">
          <TableToolbar>
            <TableToolbarContent>
              {/* pass in `onInputChange` change here to make filtering work */}
              <TableToolbarSearch
                onChange={(evt, value) => {
                  action(`TableToolbarSearch - onChange ${value}`)(evt);
                  onInputChange(evt);
                }}
              />
              <TableToolbarFilter
                onApplyFilter={handleTableFilter}
                onResetFilter={handleOnResetFilter}
              />
              <TableToolbarMenu>
                <TableToolbarAction onClick={action('Action 1 Click')}>
                  Action 1
                </TableToolbarAction>
                <TableToolbarAction onClick={action('Action 2 Click')}>
                  Action 2
                </TableToolbarAction>
                <TableToolbarAction onClick={action('Action 3 Click')}>
                  Action 3
                </TableToolbarAction>
              </TableToolbarMenu>
              <Button onClick={action('Button click')}>Primary Button</Button>
            </TableToolbarContent>
          </TableToolbar>
          <Table {...getTableProps()} aria-label="sample table">
            <TableHead>
              <TableRow>
                {headers.map((header) => (
                  <TableHeader key={header.key} {...getHeaderProps({ header })}>
                    {header.header}
                  </TableHeader>
                ))}
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map((row) => (
                <TableRow {...getRowProps({ row })}>
                  {row.cells.map((cell) => (
                    <TableCell {...getCellProps({ cell })}>
                      {cell.value}
                    </TableCell>
                  ))}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      )}
    </DataTable>
  );
};
```

## React (verbatim from Storybook — Expansion)

> File: `expansion/DataTable-expansion.stories.js`. Three exports: `Default`, `BatchExpansion` (master toggle in header), `BatchExpansionMultipleTables` (hidden integration test, two tables side-by-side).

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './DataTable-expansion-story.scss';
import React from 'react';
import DataTable, {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableExpandHeader,
  TableExpandRow,
  TableExpandedRow,
  TableHead,
  TableHeader,
  TableRow,
} from '../..';
import { rows, headers } from '../shared';
import mdx from '../../DataTable.mdx';
import { action } from 'storybook/actions';

export default {
  title: 'Components/DataTable/Expansion',
  component: DataTable,
  subcomponents: {
    TableExpandHeader,
    TableExpandRow,
    TableExpandedRow,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableHeader,
    TableRow,
  },
  parameters: { docs: { page: mdx } },
};

export const Default = (args) => (
  <DataTable rows={rows} headers={headers} {...args}>
    {({
      rows,
      headers,
      getHeaderProps,
      getExpandHeaderProps,
      getRowProps,
      getExpandedRowProps,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With expansion"
        {...getTableContainerProps()}>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              <TableExpandHeader
                aria-label="expand row"
                {...getExpandHeaderProps()}
              />
              {headers.map((header, i) => (
                <TableHeader key={i} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <React.Fragment key={row.id}>
                <TableExpandRow
                  {...getRowProps({ row })}
                  onClick={action('onClick')}>
                  {row.cells.map((cell) => (
                    <TableCell {...getCellProps({ cell })}>
                      {cell.value}
                    </TableCell>
                  ))}
                </TableExpandRow>
                <TableExpandedRow
                  colSpan={headers.length + 1}
                  className="demo-expanded-td"
                  {...getExpandedRowProps({ row })}>
                  <h6>Expandable row content</h6>
                  <div>Description here</div>
                </TableExpandedRow>
              </React.Fragment>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);

export const BatchExpansion = (args) => (
  <DataTable {...args} rows={rows} headers={headers}>
    {({
      rows,
      headers,
      getHeaderProps,
      getExpandHeaderProps,
      getRowProps,
      getExpandedRowProps,
      getTableProps,
      getTableContainerProps,
      getCellProps,
    }) => (
      <TableContainer
        title="DataTable"
        description="With batch expansion"
        {...getTableContainerProps()}>
        <Table {...getTableProps()} aria-label="sample table">
          <TableHead>
            <TableRow>
              <TableExpandHeader
                enableToggle={true}
                {...getExpandHeaderProps()}
              />
              {headers.map((header, i) => (
                <TableHeader key={i} {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <React.Fragment key={row.id}>
                <TableExpandRow {...getRowProps({ row })}>
                  {row.cells.map((cell) => (
                    <TableCell {...getCellProps({ cell })}>
                      {cell.value}
                    </TableCell>
                  ))}
                </TableExpandRow>
                <TableExpandedRow
                  colSpan={headers.length + 1}
                  className="demo-expanded-td"
                  {...getExpandedRowProps({ row })}>
                  <h6>Expandable row content</h6>
                  <div>Description here</div>
                </TableExpandedRow>
              </React.Fragment>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )}
  </DataTable>
);
```

## React (verbatim from Storybook — Dynamic Content)

> File: `dynamic-content/DataTable-dynamic-content.stories.js`. Demonstrates the **complete** DataTable composition: toolbar + batch actions + selection (multi or radio) + expansion + sortable + add-row/header-from-toolbar mutations. Status cells use `<IconIndicator kind="failed|in-progress|succeeded" label="…">`. The rendered example is wrapped in a class component with internal state.

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './story.scss';

import React from 'react';
import { TrashCan, Save, Download } from '@carbon/icons-react';
import { action } from 'storybook/actions';
import DataTable, {
  Table,
  TableBatchAction,
  TableBatchActions,
  TableBody,
  TableCell,
  TableContainer,
  TableExpandHeader,
  TableExpandRow,
  TableExpandedRow,
  TableHead,
  TableHeader,
  TableRow,
  TableSelectAll,
  TableSelectRow,
  TableToolbar,
  TableToolbarAction,
  TableToolbarContent,
  TableToolbarSearch,
  TableToolbarMenu,
} from '../..';
import { batchActionClick, headers } from '../shared';
import IconIndicator from '../../../IconIndicator';

const rows = [
  {
    id: 'a',
    name: 'Load Balancer 3',
    protocol: 'HTTP',
    port: 3000,
    rule: 'Round robin',
    attached_groups: 'Kevin’s VM Groups',
    status: <IconIndicator kind="failed" label="Failed" />,
  },
  {
    id: 'b',
    name: 'Load Balancer 1',
    protocol: 'HTTP',
    port: 443,
    rule: 'Round robin',
    attached_groups: 'Maureen’s VM Groups',
    status: <IconIndicator kind="in-progress" label="In progress" />,
  },
  {
    id: 'c',
    name: 'Load Balancer 2',
    protocol: 'HTTP',
    port: 80,
    rule: 'DNS delegation',
    attached_groups: 'Andrew’s VM Groups',
    status: <IconIndicator kind="succeeded" label="Succeeded" />,
  },
  {
    id: 'd',
    name: 'Load Balancer 6',
    protocol: 'HTTP',
    port: 3000,
    rule: 'Round robin',
    attached_groups: 'Marc’s VM Groups',
    status: <IconIndicator kind="failed" label="Failed" />,
  },
  {
    id: 'e',
    name: 'Load Balancer 4',
    protocol: 'HTTP',
    port: 443,
    rule: 'Round robin',
    attached_groups: 'Mel’s VM Groups',
    status: <IconIndicator kind="in-progress" label="In progress" />,
  },
  {
    id: 'f',
    name: 'Load Balancer 5',
    protocol: 'HTTP',
    port: 80,
    rule: 'DNS delegation',
    attached_groups: 'Ronja’s VM Groups',
    status: <IconIndicator kind="succeeded" label="Succeeded" />,
  },
];

export default {
  title: 'Components/DataTable/Dynamic',
  component: DataTable,
};

export const Default = (args) => {
  const insertInRandomPosition = (array, element) => {
    const index = Math.floor(Math.random() * (array.length + 1));
    return [...array.slice(0, index), element, ...array.slice(index)];
  };

  class DynamicRows extends React.Component {
    state = {
      rows,
      headers: headers,
      id: 0,
    };

    handleOnHeaderAdd = () => {
      const length = this.state.headers.length;
      const header = {
        key: `header_${length}`,
        header: `Header ${length}`,
      };

      this.setState((state) => {
        const rows = state.rows.map((row) => {
          return {
            ...row,
            [header.key]: header.header,
          };
        });
        return {
          rows,
          headers: state.headers.concat(header),
        };
      });
    };

    handleOnRowAdd = () => {
      this.setState((state) => {
        const { id: _id, rows } = state;
        const id = _id + 1;
        const row = {
          id: '' + id,
          name: `New Row ${id}`,
          protocol: 'HTTP',
          port: id * 100,
          rule: id % 2 === 0 ? 'Round robin' : 'DNS delegation',
          attached_groups: `Row ${id}'s VM Groups`,
          status: 'Starting',
        };

        state.headers
          .filter((header) => row[header.key] === undefined)
          .forEach((header) => {
            row[header.key] = header.header;
          });

        return {
          id,
          rows: insertInRandomPosition(rows, row),
        };
      });
    };

    render() {
      return (
        <DataTable
          {...args}
          rows={this.state.rows}
          headers={this.state.headers}>
          {({
            rows,
            headers,
            getExpandHeaderProps,
            getHeaderProps,
            getSelectionProps,
            getToolbarProps,
            getBatchActionProps,
            getRowProps,
            getExpandedRowProps,
            onInputChange,
            selectedRows,
            getTableProps,
            getTableContainerProps,
            getCellProps,
          }) => {
            const batchActionProps = getBatchActionProps();
            return (
              <TableContainer
                title="DataTable"
                description="Use the toolbar menu to add rows and headers"
                {...getTableContainerProps()}>
                <TableToolbar {...getToolbarProps()}>
                  <TableBatchActions {...getBatchActionProps()}>
                    <TableBatchAction
                      renderIcon={TrashCan}
                      iconDescription="Delete the selected rows"
                      onClick={batchActionClick(selectedRows)}
                      tabIndex={
                        batchActionProps.shouldShowBatchActions ? 0 : -1
                      }>
                      Delete
                    </TableBatchAction>
                    <TableBatchAction
                      renderIcon={Save}
                      iconDescription="Save the selected rows"
                      onClick={batchActionClick(selectedRows)}
                      tabIndex={
                        batchActionProps.shouldShowBatchActions ? 0 : -1
                      }>
                      Save
                    </TableBatchAction>
                    <TableBatchAction
                      renderIcon={Download}
                      iconDescription="Download the selected rows"
                      onClick={batchActionClick(selectedRows)}
                      tabIndex={
                        batchActionProps.shouldShowBatchActions ? 0 : -1
                      }>
                      Download
                    </TableBatchAction>
                  </TableBatchActions>
                  <TableToolbarContent
                    aria-hidden={batchActionProps.shouldShowBatchActions}>
                    <TableToolbarSearch
                      tabIndex={
                        batchActionProps.shouldShowBatchActions ? -1 : 0
                      }
                      onChange={onInputChange}
                    />
                    <TableToolbarMenu
                      tabIndex={
                        batchActionProps.shouldShowBatchActions ? -1 : 0
                      }>
                      <TableToolbarAction onClick={this.handleOnRowAdd}>
                        Add row
                      </TableToolbarAction>
                      <TableToolbarAction onClick={this.handleOnHeaderAdd}>
                        Add header
                      </TableToolbarAction>
                    </TableToolbarMenu>
                  </TableToolbarContent>
                </TableToolbar>
                <Table {...getTableProps()} aria-label="sample table">
                  <TableHead>
                    <TableRow>
                      <TableExpandHeader
                        aria-label="expand row"
                        {...getExpandHeaderProps()}
                      />
                      {args.radio ? (
                        <th scope="col" />
                      ) : (
                        <TableSelectAll {...getSelectionProps()} />
                      )}
                      {headers.map((header, i) => (
                        <TableHeader key={i} {...getHeaderProps({ header })}>
                          {header.header}
                        </TableHeader>
                      ))}
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {rows.map((row) => (
                      <React.Fragment key={row.id}>
                        <TableExpandRow {...getRowProps({ row })}>
                          <TableSelectRow {...getSelectionProps({ row })} />
                          {row.cells.map((cell) => (
                            <TableCell {...getCellProps({ cell })}>
                              {cell.value}
                            </TableCell>
                          ))}
                        </TableExpandRow>
                        <TableExpandedRow
                          colSpan={headers.length + 3}
                          className="demo-expanded-td"
                          {...getExpandedRowProps({ row })}>
                          <h6>Expandable row content</h6>
                          <div>Description here</div>
                        </TableExpandedRow>
                      </React.Fragment>
                    ))}
                  </TableBody>
                </Table>
              </TableContainer>
            );
          }}
        </DataTable>
      );
    }
  }
  return <DynamicRows />;
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from the `data-table-*.stories.ts` files on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit). License: Apache 2.0. Each variant lives in its own stories file inside `packages/web-components/src/components/data-table/stories/`.

**Imports + size enum + default args** (this header pattern repeats across every WC story file):

```ts
/**
 * Copyright IBM Corp. 2019, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { TABLE_SIZE } from '../table';
import '../index';
import storyDocs from './data-table.mdx';

const sizes = {
  [`xs (${TABLE_SIZE.XS})`]: TABLE_SIZE.XS,
  [`sm (${TABLE_SIZE.SM})`]: TABLE_SIZE.SM,
  [`md (${TABLE_SIZE.MD})`]: TABLE_SIZE.MD,
  [`lg (${TABLE_SIZE.LG} - default)`]: TABLE_SIZE.LG,
  [`xl (${TABLE_SIZE.XL})`]: TABLE_SIZE.XL,
};

const defaultArgs = {
  locale: 'en',
  size: TABLE_SIZE.LG,
  useStaticWidth: false,
  useZebraStyles: false,
};

const controls = {
  locale: { control: 'text', description: 'Provide a string for the current locale.' },
  size: { control: 'radio', description: 'Change the row height of table.', options: sizes },
  useStaticWidth: { control: 'boolean', description: 'Use static width.' },
  useZebraStyles: { control: 'boolean', description: 'Use zebra styles.' },
};
```

**Variant: Default (basic)** (`data-table-basic.stories.ts`):

```html
<cds-table
  locale="en"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
      <cds-table-header-cell>Other</cds-table-header-cell>
      <cds-table-header-cell>Example</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Starting</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Active</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 7</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: XLWithTwoLines** (`size="xl"`, two-line content via `<cds-table-cell-content>`. Each `<cds-table-row>` has the Name cell wrapped as `<cds-table-cell>Load Balancer N <cds-table-cell-content>Austin, Tx</cds-table-cell-content></cds-table-cell>`; remaining cells identical to Default basic):

```html
<cds-table size="xl">
  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
      <cds-table-header-cell>Other</cds-table-header-cell>
      <cds-table-header-cell>Example</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>
        Load Balancer 1
        <cds-table-cell-content>Austin, Tx</cds-table-cell-content>
      </cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Starting</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <!-- Repeat the row pattern above for Load Balancers 2-7. The non-Name cells reuse the same values as the Default basic story (Load Balancer 2: 'DNS delegation' / 'Active'; Load Balancers 3-7: 'Round robin' / 'Disabled'). -->
  </cds-table-body>
</cds-table>
```

**Variant: Sorting** (`data-table-sorting.stories.ts` — `is-sortable` boolean + `<cds-table-header-title>` / `<cds-table-header-description>` slots):

```html
<cds-table
  ?is-sortable="true"
  locale="en"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With sorting</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: Selection (multi)** (`data-table-selection.stories.ts` — `selection-name` attribute on rows enables checkbox selection):

```html
<cds-table
  ?is-sortable="false"
  locale="en"
  ?radio="false"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With selection</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="1">
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="2">
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="3">
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="4">
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="5">
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: WithRadioSelection** (`is-selectable with-header radio` plus `hide-checkbox` on the header row):

```html
<cds-table is-selectable with-header radio>
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With selection</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row selection-name="header" hide-checkbox>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="1">
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="2">
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="3">
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="4">
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="5">
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: WithSelectionAndSorting** (combines `is-sortable` + `selection-name`):

```html
<cds-table is-sortable>
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With selection</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <!-- ...remaining 5 rows identical structure... -->
  </cds-table-body>
</cds-table>
```

**Variant: Toolbar (Default)** (`data-table-toolbar.stories.ts` — `<cds-table-toolbar slot="toolbar">` + `<cds-table-toolbar-content has-batch-actions>` + `<cds-table-toolbar-search>` + `<cds-overflow-menu toolbar-action>` + `<cds-button>`. Each row also gets a per-row 3-dot overflow menu in the rightmost cell):

```html
<cds-table
  ?is-sortable="false"
  locale="en"
  ?overflow-menu-on-hover="false"
  ?radio="false"
  size="lg"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With batch actions.</cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-toolbar-content ?has-batch-actions="true">
      <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <!-- Settings 16 icon, slotted -->
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item> Action 1 </cds-overflow-menu-item>
          <cds-overflow-menu-item> Action 2 </cds-overflow-menu-item>
          <cds-overflow-menu-item> Action 3 </cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
      <cds-button>Primary button</cds-button>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
      <cds-table-header-cell></cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
      <cds-table-cell>
        <cds-overflow-menu toolbar-action>
          <!-- OverflowMenuVertical 16 icon, slotted -->
          <span slot="tooltip-content"> Options </span>
          <cds-overflow-menu-body flipped>
            <cds-overflow-menu-item> Stop app </cds-overflow-menu-item>
            <cds-overflow-menu-item> Restart app </cds-overflow-menu-item>
            <cds-overflow-menu-item> Rename </cds-overflow-menu-item>
          </cds-overflow-menu-body>
        </cds-overflow-menu>
      </cds-table-cell>
    </cds-table-row>
    <!-- ...5 more rows with the same structure (Load Balancer 1/2/6/4/5)... -->
  </cds-table-body>
</cds-table>
```

**Variant: PersistentToolbar** (`<cds-table-toolbar-search persistent>` keeps the search field always visible — no expand-on-click affordance):

```html
<cds-table>
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With toolbar</cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-toolbar-content>
      <cds-table-toolbar-search persistent placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
      <cds-button>Primary button</cds-button>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <!-- 6 rows identical to the Sorting story above -->
  </cds-table-body>
</cds-table>
```

**Variant: Batch Actions** (`data-table-batch-actions.stories.ts` — `<cds-table-batch-actions total-rows-count="6">` slides in over the toolbar when ≥1 row is selected):

```html
<cds-table
  ?is-sortable="false"
  locale="en"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With batch actions.</cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-batch-actions total-rows-count="6">
      <cds-button data-context="data-table">Delete <!-- TrashCan 16 icon, slotted --></cds-button>
      <cds-button data-context="data-table">Save <!-- Save 16 icon, slotted --></cds-button>
      <cds-button
        href="javascript:void 0"
        download="table-data.json"
        data-context="data-table">
        Download <!-- Download 16 icon, slotted -->
      </cds-button>
    </cds-table-batch-actions>
    <cds-table-toolbar-content ?has-batch-actions="true">
      <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <!-- Settings 16 icon, slotted -->
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
      <cds-button>Add new</cds-button>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="1">
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="2">
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="3">
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="4">
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="5">
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: Filtering** (`data-table-filtering.stories.ts` — toolbar shape with `has-batch-actions` content slot):

```html
<cds-table
  ?is-sortable="false"
  locale="en"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With filtering</cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-toolbar-content ?has-batch-actions="true">
      <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <!-- Settings 16 icon, slotted -->
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
      <cds-button>Primary Button</cds-button>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <!-- Same 6 rows as Sorting/Selection -->
  </cds-table-body>
</cds-table>
```

**Variant: Expansion (Default)** (`data-table-expansion.stories.ts` — `expandable` attribute on `<cds-table>`, `<cds-table-expanded-row>` immediately after each `<cds-table-row>` that should be expandable):

```html
<cds-table
  expandable
  ?is-sortable="false"
  locale="en"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With expansion</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Variant: BatchExpansion** (`<cds-table expandable batch-expansion>` adds a master toggle in the header chevron column):

```html
<cds-table expandable batch-expansion>
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With expansion</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
  </cds-table-body>
</cds-table>
```

**Variant: Skeleton** (`data-table-skeleton.stories.ts` — single element with column/row count attributes):

```html
<cds-table-skeleton
  column-count="5"
  row-count="5"
  ?show-header="true"
  ?show-toolbar="true"
  ?zebra="false">
</cds-table-skeleton>
```

Set `.headers` (property binding in lit) to a string array (e.g., `['Name','Protocol','Port','Rule','Attached groups','Status']`) to replace the placeholder header labels with real ones. Defaults: `columnCount=5`, `rowCount=5`, `showHeader=true`, `showToolbar=true`, `zebra=false`.

**Variant: Dynamic Content** (`data-table-dynamic.stories.ts` — uses `setTimeout` + DOM mutation in `addRow`/`addHeader`/`removeRow`/`removeHeader` callbacks. Composes toolbar + batch-actions + selection + expansion):

```html
<cds-table
  ?is-sortable="false"
  locale="en"
  ?radio="false"
  size="lg"
  ?use-static-width="false"
  ?use-zebra-styles="false">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">
    Use the toolbar menu to add rows and headers
  </cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-batch-actions total-rows-count="6">
      <cds-button data-context="data-table">Delete</cds-button>
      <cds-button data-context="data-table">Save</cds-button>
      <cds-button data-context="data-table">Download</cds-button>
    </cds-table-batch-actions>
    <cds-table-toolbar-content ?has-batch-actions="true">
      <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Add row</cds-overflow-menu-item>
          <cds-overflow-menu-item>Add header</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <!-- Initial 6 rows; additional rows are inserted via document.createElement('cds-table-row') -->
  </cds-table-body>
</cds-table>
```

## Plain HTML (derived from Web Components)

> Use these blocks for hand-coded HTML projects (no Lit, no React, no framework). Same `<cds-table>` markup as the WC section with all `${...}` lit-html bindings resolved to literal attribute values. These render correctly with `@carbon/web-components` loaded as a `<script type="module">` import.

**Plain HTML — Default:**

```html
<cds-table locale="en" size="lg">
  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
      <cds-table-header-cell>Other</cds-table-header-cell>
      <cds-table-header-cell>Example</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Starting</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Active</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
    <cds-table-row>
      <cds-table-cell>Load Balancer 7</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Disabled</cds-table-cell>
      <cds-table-cell>Test</cds-table-cell>
      <cds-table-cell>22</cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Plain HTML — Sortable + Selectable:**

```html
<cds-table is-sortable size="lg">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With sorting and selection</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="1">
      <cds-table-cell>Load Balancer 1</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Maureen's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="2">
      <cds-table-cell>Load Balancer 2</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Andrew's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="3">
      <cds-table-cell>Load Balancer 6</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Marc's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="4">
      <cds-table-cell>Load Balancer 4</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>443</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Mel's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Starting</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-row selection-name="5">
      <cds-table-cell>Load Balancer 5</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>80</cds-table-cell>
      <cds-table-cell>DNS delegation</cds-table-cell>
      <cds-table-cell>Ronja's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link>Active</cds-link></cds-table-cell>
    </cds-table-row>
  </cds-table-body>
</cds-table>
```

**Plain HTML — Toolbar with Batch Actions, Search, Overflow, Primary Button:**

```html
<cds-table size="lg">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With batch actions</cds-table-header-description>

  <cds-table-toolbar slot="toolbar">
    <cds-table-batch-actions total-rows-count="6">
      <cds-button data-context="data-table">Delete</cds-button>
      <cds-button data-context="data-table">Save</cds-button>
      <cds-button data-context="data-table">Download</cds-button>
    </cds-table-batch-actions>
    <cds-table-toolbar-content has-batch-actions>
      <cds-table-toolbar-search placeholder="Filter table"></cds-table-toolbar-search>
      <cds-overflow-menu toolbar-action>
        <span slot="tooltip-content">Settings</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Action 1</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 2</cds-overflow-menu-item>
          <cds-overflow-menu-item>Action 3</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
      <cds-button>Add new</cds-button>
    </cds-table-toolbar-content>
  </cds-table-toolbar>

  <cds-table-head>
    <cds-table-header-row selection-name="header">
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row selection-name="0">
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <!-- Repeat 5 more rows with selection-name="1" through "5" -->
  </cds-table-body>
</cds-table>
```

**Plain HTML — Expandable Rows:**

```html
<cds-table expandable size="lg">
  <cds-table-header-title slot="title">DataTable</cds-table-header-title>
  <cds-table-header-description slot="description">With expansion</cds-table-header-description>

  <cds-table-head>
    <cds-table-header-row>
      <cds-table-header-cell>Name</cds-table-header-cell>
      <cds-table-header-cell>Protocol</cds-table-header-cell>
      <cds-table-header-cell>Port</cds-table-header-cell>
      <cds-table-header-cell>Rule</cds-table-header-cell>
      <cds-table-header-cell>Attached groups</cds-table-header-cell>
      <cds-table-header-cell>Status</cds-table-header-cell>
    </cds-table-header-row>
  </cds-table-head>
  <cds-table-body>
    <cds-table-row>
      <cds-table-cell>Load Balancer 3</cds-table-cell>
      <cds-table-cell>HTTP</cds-table-cell>
      <cds-table-cell>3000</cds-table-cell>
      <cds-table-cell>Round robin</cds-table-cell>
      <cds-table-cell>Kevin's VM Groups</cds-table-cell>
      <cds-table-cell><cds-link disabled>Disabled</cds-link></cds-table-cell>
    </cds-table-row>
    <cds-table-expanded-row>
      <h6>Expandable row content</h6>
      <div>Description here</div>
    </cds-table-expanded-row>
    <!-- Repeat row + expanded-row pairs for each entry -->
  </cds-table-body>
</cds-table>
```

**Plain HTML — Skeleton loader:**

```html
<cds-table-skeleton
  column-count="5"
  row-count="5"
  show-header
  show-toolbar>
</cds-table-skeleton>
```

## Design Tokens (component-scoped, literal hex)

> Carbon's SCSS source (`packages/styles/scss/components/data-table/_data-table.scss`) uses semantic tokens like `$layer`, `$layer-accent`, `$layer-hover`, `$layer-selected`, `$layer-active`, `$border-subtle-01`, `$text-primary`, `$text-secondary`, `$text-disabled`, `$link-secondary`, `$field-02`, `$layer-selected-hover`, `$border-subtle-selected`, `$data-table-column-hover`. These resolve to the values below. Light theme = White; dark theme = G100. (G10 + G90 alternates exist — see `overview.md`.)

```css
[data-theme="white"] {
  /* Surfaces — table containers + body */
  --cds-data-table-container-bg: #ffffff;        /* page bg under the table */
  --cds-data-table-row-bg: #ffffff;              /* $layer-01 — primary body row */
  --cds-data-table-row-bg-zebra-even: #e0e0e0;   /* $layer-accent-01 — every other row when ?use-zebra-styles */

  /* Header (thead) */
  --cds-data-table-header-bg: #e0e0e0;           /* $layer-accent-01 */
  --cds-data-table-header-text: #161616;         /* $text-primary */

  /* Body cell */
  --cds-data-table-cell-text: #525252;           /* $text-secondary */

  /* Borders */
  --cds-data-table-border-row: #c6c6c6;          /* $border-subtle-01 — between body rows */
  --cds-data-table-border-row-zebra: #e0e0e0;    /* $border-subtle-02 — between zebra rows */

  /* States */
  --cds-data-table-row-bg-hover: #e8e8e8;        /* $layer-hover-01 */
  --cds-data-table-row-bg-selected: #e0e0e0;     /* $layer-selected-01 */
  --cds-data-table-row-bg-selected-hover: #cacaca; /* $layer-selected-hover-01 */
  --cds-data-table-row-border-selected-bottom: #c6c6c6; /* $layer-active-01 */
  --cds-data-table-row-border-selected-top: #e0e0e0;    /* $layer-selected-01 */
  --cds-data-table-row-border-selected-last: #525252;   /* $border-subtle-selected-01 */
  --cds-data-table-column-hover: #d1d1d1;        /* $data-table-column-hover */

  /* Sort */
  --cds-data-table-sort-bg-hover: #c6c6c6;       /* $layer-active — header darkens when hover-sortable */
  --cds-data-table-sort-icon: #161616;           /* $icon-primary */

  /* Disabled link in cell */
  --cds-data-table-link-disabled: rgba(22, 22, 22, 0.25); /* $text-disabled */
  --cds-data-table-link-secondary: #161616;      /* $link-secondary */

  /* Focus */
  --cds-data-table-focus-outline: #0f62fe;       /* $focus */
  --cds-data-table-focus-inset-bg: #ffffff;      /* $focus-inset */

  /* Toolbar */
  --cds-data-table-toolbar-bg: #ffffff;          /* $layer-01 */
  --cds-data-table-toolbar-search-bg: #ffffff;   /* $field-02 — search input bg */
  --cds-data-table-toolbar-button-primary: #0f62fe; /* $button-primary — "Primary button" / "Add new" */

  /* Batch action bar */
  --cds-data-table-batch-bg: #0f62fe;            /* $background-brand */
  --cds-data-table-batch-text: #ffffff;          /* $text-on-color */
  --cds-data-table-batch-divider: #002d9c;       /* $highlight — vertical separators between batch buttons */

  /* Skeleton */
  --cds-data-table-skeleton-bg: #e8e8e8;         /* $skeleton-background */
  --cds-data-table-skeleton-element: #c6c6c6;    /* $skeleton-element */

  /* AI label decorator (when present) */
  --cds-data-table-ai-border-end: #4589ff;       /* $ai-border-end */
  --cds-data-table-ai-inner-shadow: rgba(69, 137, 255, 0.1); /* $ai-inner-shadow */
}

[data-theme="g100"],
.dark {
  /* Surfaces */
  --cds-data-table-container-bg: #161616;
  --cds-data-table-row-bg: #393939;              /* $layer-01 dark */
  --cds-data-table-row-bg-zebra-even: #525252;   /* $layer-accent-01 dark */

  /* Header */
  --cds-data-table-header-bg: #525252;           /* $layer-accent-01 dark */
  --cds-data-table-header-text: #f4f4f4;         /* $text-primary dark */

  /* Body cell */
  --cds-data-table-cell-text: #c6c6c6;           /* $text-secondary dark */

  /* Borders */
  --cds-data-table-border-row: #6f6f6f;          /* $border-subtle-01 dark */
  --cds-data-table-border-row-zebra: #525252;    /* $border-subtle-02 dark */

  /* States */
  --cds-data-table-row-bg-hover: #4c4c4c;        /* $layer-hover-01 dark */
  --cds-data-table-row-bg-selected: #525252;     /* $layer-selected-01 dark */
  --cds-data-table-row-bg-selected-hover: #636363; /* $layer-selected-hover-01 dark */
  --cds-data-table-row-border-selected-bottom: #6f6f6f; /* $layer-active-01 dark */
  --cds-data-table-row-border-selected-top: #525252;
  --cds-data-table-row-border-selected-last: #c6c6c6;
  --cds-data-table-column-hover: #5e5e5e;

  /* Sort */
  --cds-data-table-sort-bg-hover: #6f6f6f;       /* $layer-active dark */
  --cds-data-table-sort-icon: #f4f4f4;

  /* Disabled link */
  --cds-data-table-link-disabled: rgba(244, 244, 244, 0.25);
  --cds-data-table-link-secondary: #a6c8ff;

  /* Focus */
  --cds-data-table-focus-outline: #ffffff;
  --cds-data-table-focus-inset-bg: #161616;

  /* Toolbar */
  --cds-data-table-toolbar-bg: #393939;
  --cds-data-table-toolbar-search-bg: #525252;   /* $field-02 dark */
  --cds-data-table-toolbar-button-primary: #0f62fe;

  /* Batch action bar */
  --cds-data-table-batch-bg: #0f62fe;
  --cds-data-table-batch-text: #ffffff;
  --cds-data-table-batch-divider: #002d9c;

  /* Skeleton */
  --cds-data-table-skeleton-bg: #333333;
  --cds-data-table-skeleton-element: #525252;

  /* AI label decorator */
  --cds-data-table-ai-border-end: #4589ff;
  --cds-data-table-ai-inner-shadow: rgba(69, 137, 255, 0.16);
}
```

## States Reference (from `_data-table.scss`)

> All values quoted from `packages/styles/scss/components/data-table/_data-table.scss` (1191 lines, Apache 2.0). The `border-radius: 0` rule is implicit (Carbon's global shape rule — the SCSS does not set any `border-radius` on table elements). Token names match the `[data-theme]` blocks in `overview.md`.

### Container + table base

| Slot | Property | Value (verbatim from SCSS) |
|---|---|---|
| `.cds--data-table-container` | `padding-block-start` | `$spacing-01` (4px) |
| `.cds--data-table-content` | `display` / `overflow-x` | `block` / `auto` |
| `.cds--data-table-content:focus` | `outline` | `@include focus-outline('outline')` (2px solid `$focus`) |
| `.cds--data-table` | `border-collapse` / `border-spacing` | `collapse` / `0` |
| `.cds--data-table` | `inline-size` | `100%` |

### Body row (`tbody tr`)

| State | Property | Value |
|---|---|---|
| Rest | `background-color` | `$layer` (`#ffffff` White / `#393939` G100) |
| Rest | `transition` | `background-color $duration-fast-01 motion(entrance, productive)` (= `70ms cubic-bezier(0, 0, 0.38, 0.9)`) |
| Rest | `border` | `none` (border lives on the `<td>`/`<th>` siblings) |
| Hover | `background-color` (on `tr:not([data-child-row]):hover`) | `$layer-hover` (`#e8e8e8` White / `#4c4c4c` G100) |
| Hover (`tr:hover td`, `tr:hover th`) | `border-block-end` | `1px solid $layer-hover` |
| Hover (`tr:hover td`, `tr:hover th`) | `border-block-start` | `1px solid $layer-hover` |

### Header cell (`thead tr th`)

| State | Property | Value |
|---|---|---|
| Rest | `background-color` | `$layer-accent` (`#e0e0e0` White / `#525252` G100) |
| Rest | `color` | `$text-primary` (`#161616` White / `#f4f4f4` G100) |
| Rest | `padding-inline` | `$spacing-05 $spacing-05` (16px 16px) |
| Rest | `vertical-align` | `middle` |
| Sortable rest | text wrapped in `.cds--table-sort` button — same colors as header cell |
| Sortable hover (`th.cds--table-sort__header:hover`) | `background-color` | `$layer-active` (`#c6c6c6` White / `#6f6f6f` G100) |
| Sortable focus (`.cds--table-sort:focus`) | `outline` | `2px solid $focus`, `outline-offset: -2px` |
| Sortable active (sort applied — `aria-sort="ascending|descending"`) | sort arrow visible always; rotate 180deg ↔ 0deg via `transform` on the arrow icon |
| Sortable active arrow | `transition: transform 110ms cubic-bezier(0, 0, 0.38, 0.9)` (`$duration-fast-02 motion(entrance, productive)`) |

### Body cell (`tbody tr td`)

| State | Property | Value |
|---|---|---|
| Rest | `background-color` | inherits from `tr` (`$layer`) |
| Rest | `color` | `$text-secondary` (`#525252` White / `#c6c6c6` G100) |
| Rest | `border-block-end` | `1px solid $border-subtle-01` (`#c6c6c6` White / `#6f6f6f` G100) |
| Rest | `border-block-start` | `1px solid $layer` (transparent on top — only bottom shows by default) |
| Rest | `padding-inline` | `$spacing-05 $spacing-05` (16px 16px) |
| Disabled link in cell (`tr:hover .cds--link--disabled`) | `color` | `$text-disabled` (`rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Hover (`tr:hover td`) | `color` | `$text-primary` |
| Hover (`tr:hover .cds--link`) | `color` | `$link-secondary` |

### Row densities (size)

| Size | Row `block-size` (height) | Cell `padding-block` (top → bottom) |
|---|---|---|
| `xs` | `1.5rem` (24px) | `2px 2px` |
| `sm` | `2rem` (32px) | `7px 6px` |
| `md` | `2.5rem` (40px) | `7px 6px` |
| `lg` (default) | `3rem` (48px) | `14px 14px` (`$spacing-05 - 2px` ≈ 14px) |
| `xl` | `4rem` (64px) | `16px 16px` (`$spacing-05`) |

### Selection column

| State | Property | Value |
|---|---|---|
| Selection cell (`th.cds--table-column-checkbox`, `td.cds--table-column-checkbox`) | `background-color` | matches row |
| Selected row (`tr.cds--data-table--selected td`) | `background-color` | `$layer-selected` (`#e0e0e0` White / `#525252` G100) |
| Selected row (`tr.cds--data-table--selected td`) | `color` | `$text-primary` |
| Selected row (`tr.cds--data-table--selected td`) | `border-block-end` | `1px solid $layer-active` (`#c6c6c6` White / `#6f6f6f` G100) |
| Selected row (`tr.cds--data-table--selected td`) | `border-block-start` | `1px solid $layer-selected` |
| Selected hover (`tr.cds--data-table--selected:hover td`) | `background-color` | `$layer-selected-hover` (`#cacaca` White / `#636363` G100) |
| Last selected row (`tr.cds--data-table--selected:last-of-type td`) | `border-block-start` | `1px solid $border-subtle-selected` (`--cds-border-subtle-selected-01`) |
| Selected + zebra (`tr:nth-child(odd).cds--data-table--selected + tr.cds--data-table--selected td`) | `background` | `$layer-selected` |

### Expandable rows

| State | Property | Value |
|---|---|---|
| Expand chevron icon | `transform: rotate(0deg)` collapsed → `rotate(90deg)` expanded |
| Expand chevron transition | `transform $duration-moderate-01 motion(standard, productive)` (= 150ms `cubic-bezier(0.2, 0, 0.38, 0.9)`) |
| Expanded row (`tr.cds--expandable-row td.cds--child-row-inner-container`) | `padding-block-start` | `convert.to-rem(13px)` |
| Expanded row content border | `border-block-end: 1px solid $layer-hover` (when parent hovers) |
| Expand cell width (`md`) | `2.5rem` (40px) |
| Expand cell width (`xl`) | `convert.to-rem(64px)` |

### Zebra striping

| State | Property | Value |
|---|---|---|
| Odd rows (`tr:nth-child(odd):not(.cds--parent-row)`) | `background-color` | `$layer` |
| Even rows (`tr:nth-child(even):not(.cds--parent-row)`) | `background-color` | `$layer-accent` (`#e0e0e0` White / `#525252` G100) |
| Even rows | `border-block-end`, `border-block-start` | `1px solid $layer-accent` |
| Hover (any zebra row) | `background-color` | `$layer-hover` |
| Hover (any zebra row) | `border-block-end`, `border-block-start` | `1px solid $layer-hover` |

### Sticky header

| State | Property | Value |
|---|---|---|
| Sticky `<thead>` | `position` | `sticky` |
| Sticky `<thead>` | `inset-block-start` (top) | `0` |
| Sticky `<thead>` | `z-index` | above body rows (Carbon assigns within table stacking context) |

### Top-aligned body / header

| Modifier | Property | Value |
|---|---|---|
| `.cds--data-table--top-aligned-body.cds--data-table--lg` th | `padding-block` | `$spacing-05 $spacing-05` |
| `.cds--data-table--top-aligned-body.cds--data-table--lg` th + checkbox column | `padding-block-start` | `$spacing-03` (8px) |
| `.cds--data-table--top-aligned-body.cds--data-table--lg` td | `padding-block-start` | `convert.to-rem(13px)` |

## Animation & Motion

Carbon's source uses these motion tokens for DataTable (extracted from the SCSS):

```css
/* Body row hover background */
.cds--data-table tbody tr {
  transition: background-color 70ms cubic-bezier(0, 0, 0.38, 0.9);
  /* = $duration-fast-01 motion(entrance, productive) */
}

/* Sort arrow rotation (when header sortable, on toggle) */
.cds--table-sort__icon,
.cds--table-sort__icon-unsorted {
  transition: transform 110ms cubic-bezier(0, 0, 0.38, 0.9);
  /* = $duration-fast-02 motion(entrance, productive) */
}

/* Expand chevron rotation */
.cds--table-expand__svg {
  transition: transform 150ms cubic-bezier(0.2, 0, 0.38, 0.9);
  /* = $duration-moderate-01 motion(standard, productive) */
}

/* Selected row background */
tr.cds--data-table--selected td {
  transition: background-color 70ms cubic-bezier(0, 0, 0.38, 0.9);
}

/* Batch action bar enter (overlay slides over toolbar) */
.cds--batch-actions {
  transform: translate3d(0, -100%, 0);
  opacity: 0;
  transition:
    transform 110ms cubic-bezier(0, 0, 0.38, 0.9),
    opacity   110ms cubic-bezier(0, 0, 0.38, 0.9);
}
.cds--batch-actions--active {
  transform: translate3d(0, 0, 0);
  opacity: 1;
}

/* Batch action bar exit */
.cds--batch-actions {
  /* On removal of --active modifier */
  transition:
    transform 110ms cubic-bezier(0.2, 0, 1, 0.9),
    opacity   110ms cubic-bezier(0.2, 0, 1, 0.9);
  /* = motion(exit, productive) */
}

/* Skeleton pulse (delegated to global @keyframes skeleton in skeleton-styles) */
.cds--data-table--skeleton tr td span {
  animation: 3s ease-in-out skeleton infinite;
}

/* Honor reduced-motion preferences */
@media (prefers-reduced-motion: reduce) {
  .cds--data-table tbody tr,
  .cds--table-sort__icon,
  .cds--table-sort__icon-unsorted,
  .cds--table-expand__svg,
  tr.cds--data-table--selected td,
  .cds--batch-actions {
    transition: none;
  }
  .cds--data-table--skeleton tr td span {
    animation: none;
  }
}
```

## Accessibility (from Carbon's docs + source)

**Semantic markup (the actual elements Carbon renders, both libraries):**
- `<table>` (outer table element — never `<div role="grid">`)
- `<thead>` → `<tr>` → `<th scope="col">` for column headers
- `<tbody>` → `<tr>` → `<td>` for body cells; row headers use `<th scope="row">`
- `<TableExpandRow>` renders an inner `<button class="cds--table-expand__button">` for the chevron — buttons inside table cells, not row-level click handlers, so screen-reader users can target the affordance
- `<TableSelectAll>` and `<TableSelectRow>` render a Carbon `<Checkbox>` (or radio when `radio` is set) inside a `<th>` / `<td>` — keyboard reachable via Tab
- `<TableToolbar>` renders a `<section>` with `aria-label="data table toolbar"` (set by the story; agent should preserve this)
- `<TableBatchActions>` renders a `<div class="cds--batch-actions">` with `aria-live` for "{n} item(s) selected" status updates

**ARIA attributes Carbon's source applies:**
- `<table aria-label="...">` — every story sets this. Required for screen readers.
- `<th aria-sort="none|ascending|descending">` — Carbon's React `getHeaderProps` toggles this; WC's `is-sortable` driver does the same.
- `<tr aria-selected="true">` — applied automatically when a `TableSelectRow` is checked.
- `<button aria-label="Expand row" aria-expanded="false">` — on the chevron in `TableExpandRow`; flips to `true` on open.
- `<button aria-label="Select all rows" aria-checked="false|mixed|true">` — on `TableSelectAll`. The `mixed` state covers partial selection.
- `<button aria-label="Sort rows by Name in ascending order">` — Carbon composes this dynamically from the column header text.
- BatchActionBar: `<div role="region" aria-label="Batch actions">` and the count text uses `aria-live="polite"`.

**Keyboard handling Carbon's source provides:**
- `Tab` cycles into the toolbar → batch actions (when visible) → table cells (one stop per interactive cell — sort buttons, checkboxes, links, expand buttons)
- `Enter` / `Space` activates focused sort buttons, expand buttons, checkboxes
- `Esc` closes the BatchActionBar (clears selection — `cancel` button focus + `onClick` clears via `getBatchActionProps().onCancel`)
- Sortable header keyboard interaction: `Enter` cycles `none → ascending → descending → none` and updates `aria-sort`
- The `<TableToolbarSearch>` traps no focus — it's a normal `<input>`; `Esc` (in non-persistent mode) collapses the search field and returns focus to the search trigger

**Touch targets:** Carbon's `lg` (48px) and `xl` (64px) row sizes meet the 44px minimum touch target by default. For `xs` (24px), `sm` (32px), `md` (40px) tables on touch devices, wrap interactive cells in `min-height: 44px` containers, OR provide a "Switch to comfortable density" toggle.

**Focus management:** Carbon's CSS provides `:focus-visible` with the signature double-ring (2px solid `$focus` outline + 1px inset `$focus-inset` background). DO NOT remove it. Selected-row borders (1px `$layer-active` bottom) stack with focus rings — do not suppress one for the other.

**Color contrast:** Carbon's tokens guarantee WCAG AA contrast against the surfaces they sit on:
- Header `$text-primary` on `$layer-accent`: 16.1:1 (White) / 11.0:1 (G100)
- Cell `$text-secondary` on `$layer`: 7.5:1 (White) / 8.7:1 (G100)
- Disabled link `$text-disabled` (25% opacity) is intentionally low-contrast (visual disabled signal — exempt from contrast under WCAG 1.4.3 disabled-state allowance)

**Screen-reader announcements:** Use `<TableContainer title="..." description="...">` (React) or `<cds-table-header-title slot="title">` + `<cds-table-header-description slot="description">` (WC) — these render as `<h4>` / `<p>` siblings of the `<table>` and are announced before the table content.

## Responsive Behavior

- **Desktop / large viewports (≥672px):** the table renders at `100%` container width (or `auto` when `useStaticWidth` is set). Cells wrap text by default; force single-line truncation with the `cds--text-overflow` utility (`white-space: nowrap; overflow: hidden; text-overflow: ellipsis`).
- **Tablet (≥480px and <672px):** Carbon recommends switching to a **wider row size** (`lg` / `xl`) so touch targets meet 44px. Persistent toolbars become more important than collapsing toolbars at this breakpoint — set `<TableToolbarSearch persistent>` so the search input is always visible.
- **Mobile (<480px):** for narrow viewports, Carbon's docs recommend two patterns: (1) horizontal scroll inside `.cds--data-table-content` (the default — the SCSS already sets `overflow-x: auto`), or (2) stack-into-cards via custom CSS (Carbon does not ship a built-in stacked variant — see the IBM Cloud "Resource list" pattern for an approach).
- **Sticky header:** `stickyHeader={true}` is most useful on mobile + tablet where users scroll long lists. The SCSS sets `position: sticky; top: 0` on `<thead>` — combine with a fixed-height `.cds--data-table-content` parent to get internal scrolling.
- **Toolbar reflow:** `<TableToolbarContent>` is `display: flex; flex-wrap: nowrap; justify-content: flex-end` by default — at narrow widths, set `flex-wrap: wrap` and adjust order so the primary action stays last.
- **Expanded row content:** `<TableExpandedRow colSpan={headers.length + 1}>` (or `+ 3` for selection + expansion combined) ensures expanded content always spans the full table width regardless of viewport.
- **Batch actions on mobile:** The bar pins to the top of the table (replacing the toolbar). On narrow viewports, the action labels remain visible alongside their icons — DO NOT hide the labels (Carbon's source intentionally keeps both icon + label in the bar buttons).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs (paste from Section 5/6/7 verbatim) | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) on every table element | Don't add `border-radius` to rows, cells, headers, or the container |
| Use `cds--*` class names from the WC source / `<cds-table>` custom elements | Don't invent your own class names or substitute `<table>` if Carbon uses `<cds-table>` |
| Wrap in `[data-theme="white"]` or `[data-theme="g100"]` | Don't define your own theme classes — Carbon's tokens are scoped to these data attributes |
| Set `aria-label="..."` on every `<Table>` / `<cds-table>` (the stories all do this) | Don't omit `aria-label` — screen readers announce a generic "table" otherwise |
| Use `<TableContainer title description>` (React) / `<cds-table-header-title>` + `<cds-table-header-description>` slots (WC) for the heading | Don't put the table title in a sibling `<h2>` — Carbon's container renders the heading inside the table region for proper announcement order |
| Use `size="lg"` (48px) as the default — Carbon's documented default is `lg` | Don't default to `xs` or `sm` for general use — those are dense modes for power users |
| Use `<TableSelectAll>` for bulk selection (multi) and `<DataTable radio>` for single-select | Don't put both checkbox and radio columns — pick one selection model per table |
| Slide the `<TableBatchActions>` overlay over the toolbar when ≥1 row selected (Carbon's source toggles `shouldShowBatchActions` automatically) | Don't show batch actions inline with normal toolbar — the bar must overlay the toolbar to signal "selection mode" |
| Always include a Cancel button in the batch action bar (Carbon adds it automatically via `getBatchActionProps()`) | Don't strip the Cancel — users must be able to deselect without clicking each row |
| Use `<TableExpandedRow colSpan={headers.length + 1}>` (or `+2` / `+3` for selection or selection+expand) | Don't hard-code `colSpan` — compute from `headers.length` to stay correct as columns change |
| Use `<DataTableSkeleton rowCount={5} columnCount={5}>` (React) or `<cds-table-skeleton row-count="5" column-count="5">` (WC) while async data loads | Don't render an empty `<TableBody>` — skeleton rows preserve layout and signal loading |
| Tie sortable header `aria-sort` to actual sort state (Carbon's `getHeaderProps()` does this for you) | Don't set `aria-sort` to a static value — screen readers will announce stale sort directions |
| Use `<TableToolbarSearch onChange={onInputChange}>` — the `onInputChange` from `getToolbarProps` filters rows automatically when paired with `getRowProps` | Don't reimplement client-side filtering — Carbon's `DataTable` ships it. Drop in `onInputChange` and let it work. |
| Use `--cds-button-primary` (`#0f62fe`) for the toolbar's primary action button | Don't put a `kind="ghost"` button as the primary — Carbon's toolbar primary slot is meant for the highest-priority action |
| Reserve the rightmost cell column for per-row `<OverflowMenu size="sm" flipped>` actions | Don't put kebab menus in the leftmost or middle columns — Carbon's convention pins overflow to row-end |
| Honor `prefers-reduced-motion` (the SCSS conditionally drops transitions) | Don't override Carbon's reduced-motion rules — the SCSS `@media (prefers-reduced-motion: reduce)` block must remain |
| Use `useZebraStyles` / `?use-zebra-styles` only when row scanning improves comprehension (long tables, many columns) | Don't enable zebra by default — Carbon's research shows zebra adds visual noise for short tables (<10 rows) |
