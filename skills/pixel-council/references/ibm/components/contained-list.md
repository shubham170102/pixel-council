---
name: contained-list
description: Carbon ContainedList — sharp-cornered, sticky-header list surface for navigational, filterable, or actionable item collections. Variants: Default, Disclosed, WithInteractiveItems, WithActions, WithExpandableSearch, WithPersistentSearch, WithInteractiveItemsAndActions, WithListTitleDecorators, WithIcons, WithLayer, UsageExamples (overflow-menu / description / multi-column).
metadata:
  tags: contained-list, list, navigation, filter, search, sidebar, panel, disclosed, on-page, sticky-header, ibm, carbon, react, web-components
---

# Contained List -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`ContainedList.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ContainedList/ContainedList.stories.js)
> - **WC story:** [`contained-list.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/contained-list/contained-list.stories.ts)
> - **SCSS source:** [`_contained-list.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/contained-list/_contained-list.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-containedlist--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-contained-list--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/contained-list/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

ContainedList is Carbon's flat, sharp-cornered list surface — used wherever a vertical sequence of items needs a sticky title bar, optional search field, optional per-item action button, and a clean 1px subtle divider between rows. It is the workhorse of side panels, navigation menus, filter panels, settings drawers, and embedded list pickers. Two top-level kinds exist: `on-page` (header looks like a `heading-compact-01`, used inside the layout flow) and `disclosed` (header looks like a `label-01`, used inside dropdowns and popovers where the list is revealed by an outer surface). Items can be read-only, `clickable` (entire row toggles `:hover` and routes the click), or carry their own slotted action button (overflow menu, dismiss, edit). Carbon's contained list never uses shadow, never uses border-radius, and inherits row height from the unified layout-size scale (sm 32 / md 40 / lg 48 / xl 64).

## Quick Reference

| Property | Value |
|---|---|
| Heights — row + header (sm / md / lg / xl) | `32px` / `40px` / `48px` / `64px` (from `$layout-tokens.size.height` — sm `2rem`, md `2.5rem`, lg `3rem`, xl `4rem`) |
| Default size | `lg` (48px) — Storybook `defaultArgs.size = 'lg'` |
| Padding-inline (header + row content) | `16px` (`density.padding-inline = $spacing-05`, normal density) |
| Padding-inline (condensed density) | `8px` (`$spacing-03`) — applied via `.cds--layout--density-condensed` ancestor |
| Padding-inline-end when item has `[slot=action]` | `64px` (`$spacing-10`) — reserves space for the absolutely-positioned trailing action |
| Disclosed header height | `32px` (`$spacing-07`) — fixed regardless of layout-size |
| Corner radius | `0` (Carbon: sharp by default — no border-radius anywhere) |
| Inter-item divider | `1px` solid `$border-subtle` rendered as a `::before` pseudo on every item except the last; offset `-1px` margin on items so dividers don't double |
| Inset divider (when `is-inset` / `inset-rulers`) | divider is inset by `padding-inline` left and right (icon-aware) |
| Box shadow | **none** (Carbon never uses shadow on lists) |
| Font (item content) | IBM Plex Sans, `body-01` (14px / 20px line-height / 400 weight, 0.16px tracking) |
| Font (on-page header) | IBM Plex Sans, `heading-compact-01` (14px / 18px / 600 semibold, 0.16px tracking) |
| Font (disclosed header) | IBM Plex Sans, `label-01` (12px / 16px / 400 regular, 0.32px tracking) |
| Item color (rest) | `$text-primary` → `#161616` (White / G10), `#f4f4f4` (G90 / G100) |
| Item color (disabled) | `$text-disabled` → `rgba(22,22,22,0.25)` (light), `rgba(244,244,244,0.25)` (dark) |
| Header background | `$layer-background` (resolves to `$background` `#ffffff` light / `#161616` G100 at base context; auto-bumps to `$layer-01` inside `.cds--layer-two`, `$layer-02` inside `.cds--layer-three`) |
| Item background (rest) | inherits from parent surface — usually `$background` or `$layer-01` |
| Item hover background (clickable) | `$layer-hover` → `#e8e8e8` light / `#333333` G100 |
| Item active background (clickable) | `$layer-active` → `#c6c6c6` light / `#525252` G100 |
| Search input background (rest) | `$background` (matches surrounding container) |
| Search input background (expandable, expanded) | `$field` → `#f4f4f4` light / `#262626` G100 |
| Search input border-block-end | `1px solid $border-subtle` |
| Transition (clickable hover/active) | `background-color var(--cds-duration-moderate-01) motion(standard, productive)` → `150ms cubic-bezier(0.2, 0, 0.38, 0.9)` |
| Sticky positioning | header `position: sticky; inset-block-start: 0; z-index: 1`. Embedded search `position: sticky; inset-block-start: <header-height>` so it sticks below the title |
| Focus ring (clickable item) | `2px solid var(--cds-focus)` rendered as a `::after` pseudo with `inset: 0` (covers the full row); Carbon's standard double-ring uses `outline` here |
| React import | `import ContainedList, { ContainedListItem } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/contained-list/index.js';` |

## Variants (from Storybook story exports)

The React and Web Components stories file ship the same set of named exports. Both stories list `Default`, `Disclosed`, `WithInteractiveItems`, `WithActions`, `WithExpandableSearch`, `WithPersistentSearch`, `WithInteractiveItemsAndActions`, `WithListTitleDecorators`, `WithIcons`, `_WithLayer`, and `UsageExamples`. They share Storybook controls for `label`, `kind` (`on-page` | `disclosed`), `size` (`sm` | `md` | `lg` | `xl`), and `isInset` (boolean, controls inset-divider rulers).

| Variant | React story export | WC story export | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Four lists × eight items each. Demonstrates the baseline `on-page` kind at `lg` size. The Storybook controls panel is wired to this story for `label` / `kind` / `size` / `isInset` toggling. |
| Disclosed | `Disclosed` | `Disclosed` | Two stacked lists with `kind="disclosed"` — header uses `label-01` typography over `$layer`, used when the list is revealed by an outer surface (popover, dropdown, accordion). |
| WithInteractiveItems | `WithInteractiveItems` | `WithInteractiveItems` | Four items, each `<ContainedListItem onClick>` (React) / `<cds-contained-list-item clickable>` (WC). One item is `disabled`. The whole row becomes a button — hover paints `$layer-hover`, active paints `$layer-active`, focus draws the inset double ring. |
| WithActions | `WithActions` | `WithActions` | Each item has a trailing `<Button kind="ghost" hasIconOnly renderIcon={Close}>` (React) / `<cds-icon-button slot="action" kind="ghost">` (WC). Demonstrates the slotted-action pattern (dismissible items, edit, etc.). |
| WithExpandableSearch | `WithExpandableSearch` | `WithExpandableSearch` | Header carries an `<ExpandableSearch>` / `<cds-search expandable>` in its `action` slot. Collapsed by default to a search icon; expands to a full search input that filters the rendered children. Sticky-positioned just below the title bar. |
| WithPersistentSearch | `WithPersistentSearch` | `WithPersistentSearch` | Same filter logic, but the `<Search>` is rendered as a non-collapsing child between the header and the items. Used when filtering is the primary action and should always be visible. |
| WithInteractiveItemsAndActions | `WithInteractiveItemsAndActions` | `WithInteractiveItemsAndActions` | Combines `clickable` rows (`onClick`) with a per-item slotted action button. The action's `pointer-events: all` ensures it captures clicks separately from the row. |
| WithListTitleDecorators | `WithListTitleDecorators` | `WithListTitleDecorators` | Replaces the plain `label="…"` string with a flex container: title text on the left, a `<Tag size="sm">4</Tag>` count chip on the right. Demonstrates that the label slot accepts arbitrary nodes. |
| WithIcons | `WithIcons` | `WithIcons` | Each `<ContainedListItem renderIcon={Apple}>` / `<cds-contained-list-item>` with an `${iconLoader(…, { slot: 'icon' })}` carries a 16×16 icon in a CSS-Grid cell to the left of the label. Adds the `--with-icon` modifier class. |
| _WithLayer | `_WithLayer` | `_WithLayer` | Demonstrates the list against the three Carbon layer tiers (`layer-01` → `layer-02` → `layer-03`); the header background auto-promotes via `.cds--layer-two` / `.cds--layer-three` selectors. |
| UsageExamples | `UsageExamples` | `UsageExamples` | Three composed examples: (1) header action `Button` + per-item `OverflowMenu`; (2) header action ghost-icon `Button` + items with `<Description>` two-line layout; (3) items with a 3-column CSS-Grid of metadata. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `ContainedList.stories.js` on the Carbon `main` branch (`packages/react/src/components/ContainedList/ContainedList.stories.js`). Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2022
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useEffect } from 'react';

import { action } from 'storybook/actions';
import {
  Add,
  Apple,
  Fish,
  Strawberry,
  Close,
  Wheat,
} from '@carbon/icons-react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import Button from '../Button';
import Search from '../Search';
import OverflowMenu from '../OverflowMenu';
import OverflowMenuItem from '../OverflowMenuItem';
import Tag from '../Tag';

import mdx from './ContainedList.mdx';

import ContainedList, { ContainedListItem } from '.';
import ExpandableSearch from '../ExpandableSearch';

export default {
  title: 'Components/ContainedList',
  component: ContainedList,
  subcomponents: { ContainedListItem },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['action'],
    },
  },
};
```

**Variant: Default**

```jsx
const DefaultStory = (args) => (
  <>
    {[...Array(4)].map((_, i) => (
      <ContainedList key={i} {...args}>
        {[...Array(8)].map((_, j) => (
          <ContainedListItem key={`${i}-${j}`}>List item</ContainedListItem>
        ))}
      </ContainedList>
    ))}
  </>
);

export const Default = DefaultStory.bind({});

Default.args = {
  label: 'List title',
  kind: 'on-page',
  size: 'lg',
};
```

**Variant: Disclosed**

```jsx
export const Disclosed = () => {
  return (
    <>
      <ContainedList label="List title" kind="disclosed">
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
      </ContainedList>
      <ContainedList label="List title" kind="disclosed">
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
      </ContainedList>
    </>
  );
};
```

**Variant: WithInteractiveItems**

```jsx
export const WithInteractiveItems = () => {
  const onClick = action('onClick (ContainedListItem)');

  return (
    <ContainedList label="List title" kind="on-page">
      <ContainedListItem onClick={onClick}>List item</ContainedListItem>
      <ContainedListItem onClick={onClick} disabled>
        List item
      </ContainedListItem>
      <ContainedListItem onClick={onClick}>List item</ContainedListItem>
      <ContainedListItem onClick={onClick}>List item</ContainedListItem>
    </ContainedList>
  );
};
```

**Variant: WithActions**

```jsx
export const WithActions = () => {
  const itemAction = (
    <Button
      kind="ghost"
      iconDescription="Dismiss"
      hasIconOnly
      renderIcon={Close}
      aria-label="Dismiss"
    />
  );

  return (
    <ContainedList label="List title" kind="on-page" action={''}>
      <ContainedListItem action={itemAction}>List item</ContainedListItem>
      <ContainedListItem action={itemAction} disabled>
        List item
      </ContainedListItem>
      <ContainedListItem action={itemAction}>List item</ContainedListItem>
      <ContainedListItem action={itemAction}>List item</ContainedListItem>
    </ContainedList>
  );
};
```

**Variant: WithExpandableSearch**

```jsx
export const WithExpandableSearch = () => {
  const [searchTerm, setSearchTerm] = React.useState('');
  const [searchResults, setSearchResults] = React.useState([]);
  const handleChange = (event) => {
    setSearchTerm(event.target.value);
  };

  React.useEffect(() => {
    const listItems = [
      'List item 1',
      'List item 2',
      'List item 3',
      'List item 4',
    ];

    const results = listItems.filter((listItem) =>
      listItem.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setSearchResults(results);
  }, [searchTerm]);

  return (
    <ContainedList
      label="List title"
      kind="on-page"
      action={
        <ExpandableSearch
          placeholder="Filter"
          labelText="Search"
          value={searchTerm}
          onChange={handleChange}
          closeButtonLabelText="Clear search input"
          size="lg"
        />
      }>
      {searchResults.map((listItem, key) => (
        <ContainedListItem key={key}>{listItem}</ContainedListItem>
      ))}
    </ContainedList>
  );
};
```

**Variant: WithPersistentSearch**

```jsx
export const WithPersistentSearch = () => {
  const [searchTerm, setSearchTerm] = React.useState('');
  const [searchResults, setSearchResults] = React.useState([]);
  const handleChange = (event) => {
    setSearchTerm(event.target.value);
  };

  React.useEffect(() => {
    const listItems = [
      'List item 1',
      'List item 2',
      'List item 3',
      'List item 4',
    ];

    const results = listItems.filter((listItem) =>
      listItem.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setSearchResults(results);
  }, [searchTerm]);

  return (
    <ContainedList label="List title" kind="on-page" action={''}>
      <Search
        placeholder="Filter"
        value={searchTerm}
        onChange={handleChange}
        closeButtonLabelText="Clear search input"
        size="lg"
        labelText="Filter search"
      />
      {searchResults.map((listItem, key) => (
        <ContainedListItem key={key}>{listItem}</ContainedListItem>
      ))}
    </ContainedList>
  );
};
```

**Variant: WithInteractiveItemsAndActions**

```jsx
export const WithInteractiveItemsAndActions = () => {
  const onClick = action('onClick (ContainedListItem)');
  const itemAction = (
    <Button
      kind="ghost"
      iconDescription="Dismiss"
      hasIconOnly
      renderIcon={Close}
      aria-label="Dismiss"
    />
  );

  return (
    <ContainedList label="List title" kind="on-page" action={''}>
      <ContainedListItem action={itemAction} onClick={onClick}>
        List item
      </ContainedListItem>
      <ContainedListItem action={itemAction} onClick={onClick}>
        List item
      </ContainedListItem>
      <ContainedListItem action={itemAction} onClick={onClick}>
        List item
      </ContainedListItem>
      <ContainedListItem action={itemAction} onClick={onClick}>
        List item
      </ContainedListItem>
    </ContainedList>
  );
};
```

**Variant: WithListTitleDecorators**

```jsx
export const WithListTitleDecorators = () => {
  return (
    <ContainedList
      label={
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
          }}>
          <span>List title</span>
          <Tag size="sm" role="status" aria-label="4 items in list">
            4
          </Tag>
        </div>
      }
      kind="on-page">
      <ContainedListItem>List item</ContainedListItem>
      <ContainedListItem>List item</ContainedListItem>
      <ContainedListItem>List item</ContainedListItem>
      <ContainedListItem>List item</ContainedListItem>
    </ContainedList>
  );
};
```

**Variant: WithIcons**

```jsx
export const WithIcons = () => {
  return (
    <ContainedList label="List title" kind="on-page">
      <ContainedListItem renderIcon={Apple}>List item</ContainedListItem>
      <ContainedListItem renderIcon={Wheat}>List item</ContainedListItem>
      <ContainedListItem renderIcon={Strawberry}>List item</ContainedListItem>
      <ContainedListItem renderIcon={Fish}>List item</ContainedListItem>
    </ContainedList>
  );
};
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = () => {
  return (
    <WithLayer>
      <ContainedList label="List title" kind="on-page">
        <ContainedListItem>List item</ContainedListItem>
        <ContainedListItem>List item</ContainedListItem>
      </ContainedList>
    </WithLayer>
  );
};
```

**Variant: UsageExamples**

```jsx
export const UsageExamples = () => {
  const prefix = 'cds';

  return (
    <>
      <ContainedList
        label="List title"
        action={
          <Button
            hasIconOnly
            iconDescription="Add"
            renderIcon={Add}
            tooltipPosition="left"
          />
        }>
        {[...Array(3)].map((_, i) => (
          <ContainedListItem
            key={i}
            action={
              <OverflowMenu flipped size="lg" ariaLabel="List item options">
                <OverflowMenuItem itemText="View details" />
                <OverflowMenuItem itemText="Edit" />
                <OverflowMenuItem itemText="Remove" isDelete hasDivider />
              </OverflowMenu>
            }>
            List item
          </ContainedListItem>
        ))}
      </ContainedList>
      <ContainedList
        label="List title"
        action={
          <Button
            hasIconOnly
            iconDescription="Add"
            renderIcon={Add}
            tooltipPosition="left"
            kind="ghost"
          />
        }>
        {[...Array(3)].map((_, i) => (
          <ContainedListItem key={i}>
            List item
            <br />
            <span className={`${prefix}--label ${prefix}--label--no-margin`}>
              Description text
            </span>
          </ContainedListItem>
        ))}
      </ContainedList>
      <ContainedList label="List title">
        {[...Array(3)].map((_, i) => (
          <ContainedListItem key={i}>
            <div
              style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(3, 1fr)',
                columnGap: '1rem',
              }}>
              <span>List item</span>
              <span>List item details</span>
              <span>List item details</span>
            </div>
          </ContainedListItem>
        ))}
      </ContainedList>
    </>
  );
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `contained-list.stories.ts` on the Carbon `main` branch (`packages/web-components/src/components/contained-list/contained-list.stories.ts`). Use these for non-React projects.

**Imports + meta (from the top + bottom of the stories file):**

```ts
/**
 * Copyright IBM Corp. 2025, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import '../button/index';
import '../search/index';
import '../tag/index';
import '../overflow-menu/index';
import '../icon-button/index';
import storyDocs from './contained-list.mdx';
import { iconLoader } from '../../globals/internal/icon-loader';
import Add16 from '@carbon/icons/es/add/16.js';
import Close16 from '@carbon/icons/es/close/16.js';
import Apple16 from '@carbon/icons/es/apple/16.js';
import Fish16 from '@carbon/icons/es/fish/16.js';
import Strawberry16 from '@carbon/icons/es/strawberry/16.js';
import Wheat16 from '@carbon/icons/es/wheat/16.js';
import OverflowMenuVertical16 from '@carbon/icons/es/overflow-menu--vertical/16.js';
import { prefix } from '../../globals/settings';
import { withLayers } from '../../../.storybook/decorators/with-layers';

const kinds = ['on-page', 'disclosed'];
const sizes = ['sm', 'md', 'lg', 'xl'];

const defaultArgs = {
  label: 'List title',
  kind: 'on-page',
  size: 'lg',
  isInset: false,
};

const controls = {
  label: {
    control: 'text',
    description: 'A label describing the contained list',
  },
  kind: {
    control: 'select',
    options: kinds,
    description: 'The kind of contained list to display',
  },
  size: {
    control: 'select',
    options: sizes,
    description: 'Specify the size of the contained list',
  },
  isInset: {
    control: 'boolean',
    description:
      'Specify whether the dividing lines between list items should be inset',
  },
};
```

```ts
const meta = {
  title: 'Components/Contained list',
  decorators: [
    (story) => html`
      <style>
        cds-contained-list[kind='on-page']
          + cds-contained-list[kind='on-page'] {
          margin-block-start: 1rem;
        }
      </style>
      <div>${story()}</div>
    `,
  ],
  parameters: {
    docs: {
      page: storyDocs,
    },
  },
};

export default meta;
```

**Variant: Default**

```html
export const Default = {
  args: defaultArgs,
  argTypes: controls,
  render: ({ label, kind, size, isInset }) => html`
    ${Array.from({ length: 4 }).map(
      (_, i) => html`
        <cds-contained-list
          label="${label}"
          kind="${kind}"
          size="${ifDefined(size)}"
          ?is-inset="${isInset}">
          ${Array.from({ length: 8 }).map(
            (_, j) => html`
              <cds-contained-list-item key="${i}-${j}">
                List item
              </cds-contained-list-item>
            `
          )}
        </cds-contained-list>
      `
    )}
  `,
};
```

**Variant: Disclosed**

```html
export const Disclosed = {
  render: () => html`
    <cds-contained-list label="List title" kind="disclosed">
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
    </cds-contained-list>
    <cds-contained-list label="List title" kind="disclosed">
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: WithInteractiveItems**

```html
export const WithInteractiveItems = {
  render: () => html`
    <cds-contained-list label="List title" kind="on-page">
      <cds-contained-list-item clickable>List item</cds-contained-list-item>
      <cds-contained-list-item clickable disabled>
        List item
      </cds-contained-list-item>
      <cds-contained-list-item clickable>List item</cds-contained-list-item>
      <cds-contained-list-item clickable>List item</cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: WithActions**

```html
export const WithActions = {
  render: () => html`
    <cds-contained-list label="List title" kind="on-page">
      <cds-contained-list-item>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item disabled>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: WithExpandableSearch**

```html
export const WithExpandableSearch = {
  render: () => {
    const listId = 'list-expandable-search';
    const items = ['List item 1', 'List item 2', 'List item 3', 'List item 4'];

    return html`
      <cds-contained-list id="${listId}" label="List title" kind="on-page">
        <cds-search
          slot="action"
          expandable
          placeholder="Filter"
          label-text="Search"
          close-button-label-text="Clear search input"
          size="lg"
          @cds-search-input="${(e) => {
            const searchValue = e.detail.value.toLowerCase();
            const list = document.getElementById(listId);
            const listItems = list?.querySelectorAll('cds-contained-list-item');
            listItems?.forEach((item, index) => {
              const text = items[index].toLowerCase();
              item.style.display = text.includes(searchValue) ? '' : 'none';
            });
          }}">
        </cds-search>
        ${items.map(
          (item) => html`
            <cds-contained-list-item>${item}</cds-contained-list-item>
          `
        )}
      </cds-contained-list>
    `;
  },
};
```

**Variant: WithPersistentSearch**

```html
export const WithPersistentSearch = {
  render: () => {
    const listId = 'list-persistent-search';
    const items = ['List item 1', 'List item 2', 'List item 3', 'List item 4'];

    return html`
      <cds-contained-list id="${listId}" label="List title" kind="on-page">
        <cds-search
          placeholder="Filter"
          label-text="Filter search"
          close-button-label-text="Clear search input"
          size="lg"
          @cds-search-input="${(e) => {
            const searchValue = e.detail.value.toLowerCase();
            const list = document.getElementById(listId);
            const listItems = list?.querySelectorAll('cds-contained-list-item');
            listItems?.forEach((item, index) => {
              const text = items[index].toLowerCase();
              item.style.display = text.includes(searchValue) ? '' : 'none';
            });
          }}">
        </cds-search>
        ${items.map(
          (item) => html`
            <cds-contained-list-item>${item}</cds-contained-list-item>
          `
        )}
      </cds-contained-list>
    `;
  },
};
```

**Variant: WithInteractiveItemsAndActions**

```html
export const WithInteractiveItemsAndActions = {
  render: () => html`
    <cds-contained-list label="List title" kind="on-page">
      <cds-contained-list-item clickable>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item clickable>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item clickable>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
      <cds-contained-list-item clickable>
        List item
        <cds-icon-button slot="action" kind="ghost" size="lg">
          ${iconLoader(Close16, { slot: 'icon' })}
          <span slot="tooltip-content">Dismiss</span>
        </cds-icon-button>
      </cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: WithListTitleDecorators**

```html
export const WithListTitleDecorators = {
  render: () => html`
    <cds-contained-list kind="on-page">
      <div
        slot="label"
        style="display: flex; align-items: center; justify-content: space-between;">
        <span>List title</span>
        <cds-tag size="sm">4</cds-tag>
      </div>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: WithIcons**

```html
export const WithIcons = {
  render: () => html`
    <cds-contained-list label="List title" kind="on-page">
      <cds-contained-list-item>
        ${iconLoader(Apple16, { slot: 'icon' })} List item
      </cds-contained-list-item>
      <cds-contained-list-item>
        ${iconLoader(Wheat16, { slot: 'icon' })} List item
      </cds-contained-list-item>
      <cds-contained-list-item>
        ${iconLoader(Strawberry16, { slot: 'icon' })} List item
      </cds-contained-list-item>
      <cds-contained-list-item>
        ${iconLoader(Fish16, { slot: 'icon' })} List item
      </cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: _WithLayer**

```html
export const _WithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  render: () => html`
    <cds-contained-list label="List title" kind="on-page">
      <cds-contained-list-item>List item</cds-contained-list-item>
      <cds-contained-list-item>List item</cds-contained-list-item>
    </cds-contained-list>
  `,
};
```

**Variant: UsageExamples**

```html
export const UsageExamples = {
  render: () => html`
    <cds-contained-list label="List title">
      <cds-icon-button slot="action" kind="primary" align="left" size="lg">
        ${iconLoader(Add16, { slot: 'icon' })}
        <span slot="tooltip-content">Add</span>
      </cds-icon-button>
      ${[...Array(3)].map(
        () => html`
          <cds-contained-list-item>
            List item
            <cds-overflow-menu slot="action" size="lg">
              ${iconLoader(OverflowMenuVertical16, {
                class: `${prefix}--overflow-menu__icon`,
                slot: 'icon',
              })}
              <span slot="tooltip-content">Options</span>
              <cds-overflow-menu-body flipped>
                <cds-overflow-menu-item>View details</cds-overflow-menu-item>
                <cds-overflow-menu-item>Edit</cds-overflow-menu-item>
                <cds-overflow-menu-item danger>
                  <div class="${prefix}--overflow-menu-item__divider"></div>
                  Remove
                </cds-overflow-menu-item>
              </cds-overflow-menu-body>
            </cds-overflow-menu>
          </cds-contained-list-item>
        `
      )}
    </cds-contained-list>

    <cds-contained-list label="List title">
      <cds-icon-button slot="action" kind="ghost" size="lg" align="left">
        ${iconLoader(Add16, { slot: 'icon' })}
        <span slot="tooltip-content">Add</span>
      </cds-icon-button>
      ${[...Array(3)].map(
        () => html`
          <cds-contained-list-item>
            <div>
              List item<br />
              <cds-contained-list-description>
                Description text
              </cds-contained-list-description>
            </div>
          </cds-contained-list-item>
        `
      )}
    </cds-contained-list>

    <cds-contained-list label="List title">
      ${[...Array(3)].map(
        () => html`
          <cds-contained-list-item>
            <div
              style="display: grid; grid-template-columns: repeat(3, 1fr); column-gap: 1rem;">
              <span>List item</span>
              <span>List item details</span>
              <span>List item details</span>
            </div>
          </cds-contained-list-item>
        `
      )}
    </cds-contained-list>
  `,
};
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.disabled}` → `disabled` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. The custom elements still need to be registered (`import '@carbon/web-components/es/components/contained-list/index.js';`) — these are runtime tags, not styled `<div>`s.

**Variant: Default (lg, on-page, four lists × eight items)**

```html
<cds-contained-list label="List title" kind="on-page" size="lg">
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
</cds-contained-list>
<cds-contained-list label="List title" kind="on-page" size="lg">
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
</cds-contained-list>
<!-- ...repeat the <cds-contained-list> block twice more for the four-list Storybook layout. -->
```

**Variant: Disclosed**

```html
<cds-contained-list label="List title" kind="disclosed">
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
</cds-contained-list>
<cds-contained-list label="List title" kind="disclosed">
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithInteractiveItems**

```html
<cds-contained-list label="List title" kind="on-page">
  <cds-contained-list-item clickable>List item</cds-contained-list-item>
  <cds-contained-list-item clickable disabled>List item</cds-contained-list-item>
  <cds-contained-list-item clickable>List item</cds-contained-list-item>
  <cds-contained-list-item clickable>List item</cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithActions** (the `iconLoader` slot is replaced by a literal SVG; substitute any 16×16 SF/Carbon glyph)

```html
<cds-contained-list label="List title" kind="on-page">
  <cds-contained-list-item>
    List item
    <cds-icon-button slot="action" kind="ghost" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16z"/>
      </svg>
      <span slot="tooltip-content">Dismiss</span>
    </cds-icon-button>
  </cds-contained-list-item>
  <cds-contained-list-item disabled>
    List item
    <cds-icon-button slot="action" kind="ghost" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16z"/>
      </svg>
      <span slot="tooltip-content">Dismiss</span>
    </cds-icon-button>
  </cds-contained-list-item>
  <cds-contained-list-item>
    List item
    <cds-icon-button slot="action" kind="ghost" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16z"/>
      </svg>
      <span slot="tooltip-content">Dismiss</span>
    </cds-icon-button>
  </cds-contained-list-item>
  <cds-contained-list-item>
    List item
    <cds-icon-button slot="action" kind="ghost" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16z"/>
      </svg>
      <span slot="tooltip-content">Dismiss</span>
    </cds-icon-button>
  </cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithExpandableSearch** (filter logic is left to consumer JS — see WC story for the `cds-search-input` event handler)

```html
<cds-contained-list id="list-expandable-search" label="List title" kind="on-page">
  <cds-search
    slot="action"
    expandable
    placeholder="Filter"
    label-text="Search"
    close-button-label-text="Clear search input"
    size="lg">
  </cds-search>
  <cds-contained-list-item>List item 1</cds-contained-list-item>
  <cds-contained-list-item>List item 2</cds-contained-list-item>
  <cds-contained-list-item>List item 3</cds-contained-list-item>
  <cds-contained-list-item>List item 4</cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithPersistentSearch**

```html
<cds-contained-list id="list-persistent-search" label="List title" kind="on-page">
  <cds-search
    placeholder="Filter"
    label-text="Filter search"
    close-button-label-text="Clear search input"
    size="lg">
  </cds-search>
  <cds-contained-list-item>List item 1</cds-contained-list-item>
  <cds-contained-list-item>List item 2</cds-contained-list-item>
  <cds-contained-list-item>List item 3</cds-contained-list-item>
  <cds-contained-list-item>List item 4</cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithListTitleDecorators**

```html
<cds-contained-list kind="on-page">
  <div slot="label" style="display: flex; align-items: center; justify-content: space-between;">
    <span>List title</span>
    <cds-tag size="sm">4</cds-tag>
  </div>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
  <cds-contained-list-item>List item</cds-contained-list-item>
</cds-contained-list>
```

**Variant: WithIcons** (Apple, Wheat, Strawberry, Fish glyphs replaced with placeholder SVG slot — substitute the actual Carbon icon SVG paths)

```html
<cds-contained-list label="List title" kind="on-page">
  <cds-contained-list-item>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <!-- @carbon/icons/es/apple/16.js -->
    </svg>
    List item
  </cds-contained-list-item>
  <cds-contained-list-item>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <!-- @carbon/icons/es/wheat/16.js -->
    </svg>
    List item
  </cds-contained-list-item>
  <cds-contained-list-item>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <!-- @carbon/icons/es/strawberry/16.js -->
    </svg>
    List item
  </cds-contained-list-item>
  <cds-contained-list-item>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <!-- @carbon/icons/es/fish/16.js -->
    </svg>
    List item
  </cds-contained-list-item>
</cds-contained-list>
```

**Variant: UsageExamples — list 1 (header `Add` button + per-item OverflowMenu)**

```html
<cds-contained-list label="List title">
  <cds-icon-button slot="action" kind="primary" align="left" size="lg">
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <path d="M17 15V8h-2v7H8v2h7v7h2v-7h7v-2z"/>
    </svg>
    <span slot="tooltip-content">Add</span>
  </cds-icon-button>
  <cds-contained-list-item>
    List item
    <cds-overflow-menu slot="action" size="lg">
      <svg slot="icon" class="cds--overflow-menu__icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <circle cx="16" cy="8" r="2"/><circle cx="16" cy="16" r="2"/><circle cx="16" cy="24" r="2"/>
      </svg>
      <span slot="tooltip-content">Options</span>
      <cds-overflow-menu-body flipped>
        <cds-overflow-menu-item>View details</cds-overflow-menu-item>
        <cds-overflow-menu-item>Edit</cds-overflow-menu-item>
        <cds-overflow-menu-item danger>
          <div class="cds--overflow-menu-item__divider"></div>
          Remove
        </cds-overflow-menu-item>
      </cds-overflow-menu-body>
    </cds-overflow-menu>
  </cds-contained-list-item>
  <!-- repeat 2 more items -->
</cds-contained-list>
```

**Variant: UsageExamples — list 2 (description text under each item)**

```html
<cds-contained-list label="List title">
  <cds-icon-button slot="action" kind="ghost" size="lg" align="left">
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <path d="M17 15V8h-2v7H8v2h7v7h2v-7h7v-2z"/>
    </svg>
    <span slot="tooltip-content">Add</span>
  </cds-icon-button>
  <cds-contained-list-item>
    <div>
      List item<br />
      <cds-contained-list-description>
        Description text
      </cds-contained-list-description>
    </div>
  </cds-contained-list-item>
  <!-- repeat 2 more items -->
</cds-contained-list>
```

**Variant: UsageExamples — list 3 (3-column grid per item)**

```html
<cds-contained-list label="List title">
  <cds-contained-list-item>
    <div style="display: grid; grid-template-columns: repeat(3, 1fr); column-gap: 1rem;">
      <span>List item</span>
      <span>List item details</span>
      <span>List item details</span>
    </div>
  </cds-contained-list-item>
  <!-- repeat 2 more items -->
</cds-contained-list>
```

## Design Tokens (component-scoped)

ContainedList does not declare its own component-scoped CSS variables — it consumes Carbon's universal layer/border/text/motion tokens directly. The blocks below resolve those semantic tokens to literal hex per theme so consumers can drop them into a component-scoped fallback or a Tailwind palette without re-reading `overview.md`.

```css
/* White theme (light, default) */
[data-theme="white"] {
  --cds-contained-list-background: #ffffff;        /* $background */
  --cds-contained-list-header-bg: #ffffff;         /* $layer-background — base context resolves to $background */
  --cds-contained-list-header-bg-layer-two: #f4f4f4;   /* $layer-01 */
  --cds-contained-list-header-bg-layer-three: #ffffff; /* $layer-02 */
  --cds-contained-list-disclosed-header-bg: #f4f4f4;   /* $layer (disclosed kind) */
  --cds-contained-list-item-bg: transparent;       /* item is layered on the parent surface */
  --cds-contained-list-item-hover-bg: #e8e8e8;     /* $layer-hover */
  --cds-contained-list-item-active-bg: #c6c6c6;    /* $layer-active */
  --cds-contained-list-item-text: #161616;         /* $text-primary */
  --cds-contained-list-item-text-disabled: rgba(22, 22, 22, 0.25); /* $text-disabled */
  --cds-contained-list-disclosed-header-text: #525252; /* $text-secondary */
  --cds-contained-list-divider: #e0e0e0;           /* $border-subtle (subtle-00 in White) */
  --cds-contained-list-search-bg: #ffffff;         /* $background (rest) */
  --cds-contained-list-search-bg-expanded: #f4f4f4;/* $field (expandable, expanded) */
  --cds-contained-list-focus: #0f62fe;             /* $focus — blue-60 */
  --cds-contained-list-focus-inset: #ffffff;       /* $background — companion inset */
}

/* G10 theme (light, neutral grey base) */
[data-theme="g10"] {
  --cds-contained-list-background: #f4f4f4;        /* $background */
  --cds-contained-list-header-bg: #f4f4f4;
  --cds-contained-list-header-bg-layer-two: #ffffff;   /* $layer-01 in G10 */
  --cds-contained-list-header-bg-layer-three: #f4f4f4; /* $layer-02 in G10 */
  --cds-contained-list-disclosed-header-bg: #ffffff;
  --cds-contained-list-item-bg: transparent;
  --cds-contained-list-item-hover-bg: #e8e8e8;
  --cds-contained-list-item-active-bg: #c6c6c6;
  --cds-contained-list-item-text: #161616;
  --cds-contained-list-item-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-contained-list-disclosed-header-text: #525252;
  --cds-contained-list-divider: #c6c6c6;           /* border-subtle-00 in G10 */
  --cds-contained-list-search-bg: #f4f4f4;
  --cds-contained-list-search-bg-expanded: #ffffff;
  --cds-contained-list-focus: #0f62fe;
  --cds-contained-list-focus-inset: #f4f4f4;
}

/* G90 theme (dark, mid grey base) */
[data-theme="g90"] {
  --cds-contained-list-background: #262626;        /* $background */
  --cds-contained-list-header-bg: #262626;
  --cds-contained-list-header-bg-layer-two: #393939;   /* $layer-01 */
  --cds-contained-list-header-bg-layer-three: #525252; /* $layer-02 */
  --cds-contained-list-disclosed-header-bg: #393939;
  --cds-contained-list-item-bg: transparent;
  --cds-contained-list-item-hover-bg: #4c4c4c;     /* $layer-hover */
  --cds-contained-list-item-active-bg: #6f6f6f;    /* $layer-active */
  --cds-contained-list-item-text: #f4f4f4;         /* $text-primary */
  --cds-contained-list-item-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-contained-list-disclosed-header-text: #c6c6c6; /* $text-secondary */
  --cds-contained-list-divider: #525252;           /* border-subtle-00 in G90 */
  --cds-contained-list-search-bg: #262626;
  --cds-contained-list-search-bg-expanded: #393939;/* $field */
  --cds-contained-list-focus: #ffffff;
  --cds-contained-list-focus-inset: #262626;
}

/* G100 theme (darkest, near-black base) */
[data-theme="g100"],
.dark {
  --cds-contained-list-background: #161616;        /* $background */
  --cds-contained-list-header-bg: #161616;
  --cds-contained-list-header-bg-layer-two: #262626;   /* $layer-01 */
  --cds-contained-list-header-bg-layer-three: #393939; /* $layer-02 */
  --cds-contained-list-disclosed-header-bg: #262626;
  --cds-contained-list-item-bg: transparent;
  --cds-contained-list-item-hover-bg: #333333;     /* $layer-hover */
  --cds-contained-list-item-active-bg: #525252;    /* $layer-active */
  --cds-contained-list-item-text: #f4f4f4;
  --cds-contained-list-item-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-contained-list-disclosed-header-text: #c6c6c6;
  --cds-contained-list-divider: #393939;           /* border-subtle-00 in G100 */
  --cds-contained-list-search-bg: #161616;
  --cds-contained-list-search-bg-expanded: #262626;
  --cds-contained-list-focus: #ffffff;
  --cds-contained-list-focus-inset: #161616;
}

/* Dimensions (theme-invariant) */
:root {
  --cds-contained-list-row-height-sm: 2rem;        /* 32px */
  --cds-contained-list-row-height-md: 2.5rem;      /* 40px */
  --cds-contained-list-row-height-lg: 3rem;        /* 48px */
  --cds-contained-list-row-height-xl: 4rem;        /* 64px */
  --cds-contained-list-padding-inline-normal: 1rem;     /* 16px — $spacing-05 */
  --cds-contained-list-padding-inline-condensed: 0.5rem;/* 8px — $spacing-03 */
  --cds-contained-list-padding-inline-end-with-action: 4rem; /* 64px — $spacing-10 */
  --cds-contained-list-disclosed-header-height: 2rem;   /* 32px — $spacing-07 */
  --cds-contained-list-icon-gap: 0.75rem;          /* 12px — $spacing-04 column-gap */
  --cds-contained-list-icon-padding-block-start: 0.125rem; /* 2px — $spacing-01 */
  --cds-contained-list-divider-thickness: 1px;
  --cds-contained-list-corner-radius: 0;
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/contained-list/_contained-list.scss`. The SCSS file is the source of truth; the table below resolves Carbon's semantic tokens to White-theme and G100-theme literal hex.

### `<cds-contained-list>` (container — wraps `<ul>`)

| Property | Value | Source |
|---|---|---|
| Display | `block` (item children render as `<li>` inside `<ul>`) | `.cds--contained-list > ul { padding: 0; margin: 0; }` |
| Background | inherits from parent surface | implicit |
| Corner radius | `0` | n/a (Carbon: sharp by default) |
| Margin between two stacked `kind="on-page"` lists | `1rem` (16px / `$spacing-05`) top margin on the second list | `.cds--contained-list--on-page + .cds--contained-list--on-page { margin-block-start: $spacing-05; }` |

### `.cds--contained-list__header` — list title bar (sticky)

| State | Property | Value (White theme) | Value (G100 theme) | Source |
|---|---|---|---|---|
| Position | `position` | `sticky` | `sticky` | `.cds--contained-list__header { position: sticky; z-index: 1; inset-block-start: 0; }` |
| All | `display` | `flex` | `flex` | same selector |
| All | `align-items` | `center` | `center` | same selector |
| All | `padding-inline` | `16px` (normal) / `8px` (condensed) | same | `padding-inline: layout.density('padding-inline')` |
| `kind="on-page"` | `block-size` | `48px` (size=lg) — varies by `size` token | same | `.cds--contained-list--on-page .cds--contained-list__header { block-size: layout.size('height'); }` |
| `kind="on-page"` | `background-color` | `#ffffff` (`$layer-background` at base context) → `#f4f4f4` inside `.cds--layer-two` → `#ffffff` inside `.cds--layer-three` | `#161616` → `#262626` → `#393939` | `background-color: $layer-background;` + layer-two/three overrides |
| `kind="on-page"` | `border-block-end` | `1px solid #e0e0e0` (`$border-subtle`) | `1px solid #393939` | `border-block-end: 1px solid $border-subtle;` |
| `kind="on-page"` | `color` | `#161616` (`$text-primary`) | `#f4f4f4` | `color: $text-primary;` |
| `kind="on-page"` | `font` | `heading-compact-01` — 14px / 18px / 600 / 0.16px | same | `@include type-style('heading-compact-01');` |
| `kind="disclosed"` | `block-size` | `32px` (`$spacing-07`) — fixed | same | `.cds--contained-list--disclosed .cds--contained-list__header { block-size: $spacing-07; }` |
| `kind="disclosed"` | `background-color` | `#f4f4f4` (`$layer`) | `#262626` | `background-color: $layer;` |
| `kind="disclosed"` | `color` | `#525252` (`$text-secondary`) | `#c6c6c6` | `color: $text-secondary;` |
| `kind="disclosed"` | `font` | `label-01` — 12px / 16px / 400 / 0.32px | same | `@include type-style('label-01');` |

### `.cds--contained-list-item` — read-only row

| State | Property | Value (White theme) | Value (G100 theme) | Source |
|---|---|---|---|---|
| All | `display` | `list-item` (renders inside parent `<ul>`) | same | `.cds--contained-list-item { position: relative; display: list-item; list-style: none; }` |
| All (not first) | `margin-block-start` | `-1px` (overlaps the previous item's divider) | same | `.cds--contained-list-item:not(:first-of-type) { margin-block-start: -1px; }` |
| All (not last) `::before` divider | `block-size` | `1px` solid `#e0e0e0` (`$border-subtle`), absolute, `inset-block-end: 0`, `inset-inline: 0` | `1px` solid `#393939` | `.cds--contained-list-item:not(:last-of-type)::before { … background-color: $border-subtle; block-size: 1px; … }` |
| `is-inset` (or `--inset-rulers`) | divider `inset-inline` | `16px 16px` (matches `density.padding-inline`) | same | `.cds--contained-list--inset-rulers .cds--contained-list-item:not(:last-of-type)::before { inset-inline: layout.density('padding-inline') layout.density('padding-inline'); }` |

### `.cds--contained-list-item__content` — actual row body (the `<li>`'s only child)

| State | Property | Value (White theme) | Value (G100 theme) | Source |
|---|---|---|---|---|
| All | `min-block-size` | `48px` (size=lg) — matches container `size` | same | `min-block-size: layout.size('height');` |
| All | `padding` | `calc((48px − 1lh) / 2)` block × `16px` inline (centers single-line text vertically) | same | `padding: calc(calc((#{layout.size('height')} - var(--temp-1lh)) / 2)) layout.density('padding-inline');` |
| All | `color` | `#161616` (`$text-primary`) | `#f4f4f4` | `color: $text-primary;` |
| All | `font` | `body-01` — 14px / 20px / 400 / 0.16px | same | `@include type-style('body-01');` |
| `--with-action` modifier | `padding-inline-end` | `64px` (`$spacing-10`) — reserves space for the slotted action | same | `.cds--contained-list-item--with-action .cds--contained-list-item__content { padding-inline-end: $spacing-10; }` |

### `.cds--contained-list-item--clickable .cds--contained-list-item__content` — interactive row

| State | Property | Value (White theme) | Value (G100 theme) | Source |
|---|---|---|---|---|
| Reset | applies `button-reset.reset` mixin (removes default `<button>` chrome) | — | — | `@include button-reset.reset;` |
| Rest | `text-align` | `start` | same | `text-align: start;` |
| Rest | `transition` | `background-color 150ms cubic-bezier(0.2, 0, 0.38, 0.9)` | same | `transition: background-color $duration-moderate-01 motion(standard, productive);` |
| Hover (`:not(:disabled):hover`) | `background-color` | `#e8e8e8` (`$layer-hover`) | `#333333` | `… :hover { background-color: $layer-hover; }` |
| Active (`:not(:disabled):active`) | `background-color` | `#c6c6c6` (`$layer-active`) | `#525252` | `… :active { background-color: $layer-active; }` |
| Focus (visible) | `outline` | none on the content itself; `::after` pseudo with `inset: 0` paints `2px solid var(--cds-focus)` (`#0f62fe`) over the entire row | `2px solid #ffffff` | `… :focus::after { @include focus-outline('outline'); position: absolute; content: ''; inset: 0; }` |
| Disabled | `color` | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | `rgba(244, 244, 244, 0.25)` | `… :disabled { color: $text-disabled; }` |
| Disabled | `cursor` | `not-allowed` | same | `… :disabled { cursor: not-allowed; }` |

### `.cds--contained-list-item--with-icon .cds--contained-list-item__content` — icon + label row

| State | Property | Value | Source |
|---|---|---|---|
| All | `display` | `grid` | `.cds--contained-list-item--with-icon .cds--contained-list-item__content { display: grid; … }` |
| All | `grid-template-columns` | `1rem 1fr` (16px icon column + flexible label column) | same |
| All | `column-gap` | `12px` (`$spacing-04`) | same |
| Icon child | `padding-block-start` | `2px` (`$spacing-01`) — optical alignment with the first text line | `.cds--contained-list-item__icon { display: inline-flex; padding-block-start: $spacing-01; }` |

### `.cds--contained-list__action` / `.cds--contained-list-item__action` — slotted trailing button

| State | Property | Value | Source |
|---|---|---|---|
| All | `position` | `absolute` over the row, full bleed (`inset-block-start: 0; inset-inline: 0`) | `.cds--contained-list__action, .cds--contained-list-item__action { position: absolute; display: flex; justify-content: flex-end; inset-block-start: 0; inset-inline: 0; pointer-events: none; }` |
| All | `display` | `flex; justify-content: flex-end` (button hugs the right edge) | same |
| Container | `pointer-events` | `none` (let the row receive clicks) | same |
| Action child (`> *`) | `pointer-events` | `all` (the button itself still captures clicks) | `.cds--contained-list__action > *, .cds--contained-list-item__action > * { pointer-events: all; }` |

### Embedded `<cds-search>` (sticky filter)

| State | Property | Value (White theme) | Value (G100 theme) | Source |
|---|---|---|---|---|
| All | `position` | `sticky` | `sticky` | `.cds--contained-list .cds--search { position: sticky; z-index: 1; inset-block-start: layout.size('height'); }` |
| All | `inset-block-start` | matches container row-height (`48px` at lg) — sits flush below the sticky header | same | same |
| Persistent (rest) | input `background-color` | `#ffffff` (`$background`) | `#161616` | `.cds--contained-list .cds--search .cds--search-input { background-color: $background; }` |
| Persistent | input `border-block-end` | `1px solid #e0e0e0` (`$border-subtle`) | `1px solid #393939` | same selector |
| Expandable, expanded | input `background-color` | `#f4f4f4` (`$field`) | `#262626` | `&.cds--search--expandable .cds--search-input { background-color: $field; }` |
| Close button — focus | `outline` | `2px solid #0f62fe` (`focus-outline` mixin) | `2px solid #ffffff` | `.cds--contained-list .cds--search .cds--search-close:focus { @include focus-outline('outline'); }` |
| Close button — input focused + close hover | `border` | `2px solid #0f62fe` (no inline-start), `outline: none` | `2px solid #ffffff` | `… input:focus ~ .cds--search-close:hover { border: 2px solid $focus; border-inline-start: 0; outline: none; }` |

### Layer-tier inheritance

| Container ancestor | Header background resolves to (White theme) | Source |
|---|---|---|
| (none — base) | `#ffffff` (`$layer-background` → `$background`) | default selector |
| `.cds--layer-two` | `#f4f4f4` (`$layer-01`) | `.cds--layer-two .cds--contained-list--on-page .cds--contained-list__header { background-color: $layer-01; }` |
| `.cds--layer-three` | `#ffffff` (`$layer-02`) | `.cds--layer-three .cds--contained-list--on-page .cds--contained-list__header { background-color: $layer-02; }` |

## Animation & Motion

ContainedList uses two motion tokens, both surfaced through Carbon's productive motion family. The clickable row's hover/active background fade is the only animation in the component; all other state changes (focus, disabled, divider) are instantaneous.

```css
/* Verbatim from the SCSS — clickable row hover/active fade */
.cds--contained-list-item--clickable .cds--contained-list-item__content {
  transition:
    background-color var(--cds-duration-moderate-01) /* 150ms */
      cubic-bezier(0.2, 0, 0.38, 0.9); /* motion(standard, productive) */
}

/* Carbon motion tokens (resolved from overview.md) */
:root {
  --cds-duration-moderate-01: 150ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
}
```

The expanded form (recommended for production):

```css
.cds--contained-list-item--clickable .cds--contained-list-item__content {
  transition: background-color
    var(--cds-duration-moderate-01)
    var(--cds-easing-productive-standard);
}

.cds--contained-list-item--clickable .cds--contained-list-item__content:hover {
  background-color: var(--cds-layer-hover);
}

.cds--contained-list-item--clickable .cds--contained-list-item__content:active {
  background-color: var(--cds-layer-active);
}

@media (prefers-reduced-motion: reduce) {
  .cds--contained-list-item--clickable .cds--contained-list-item__content {
    transition: none;
  }
}
```

Sticky positioning (the only "kinetic" effect besides the hover fade) is not animated — the header pins instantly when the parent scroll container reaches its `inset-block-start: 0` threshold. Keep the parent container scrollable (`overflow-y: auto`) and tall enough that pinning is observable; otherwise the sticky behaviour is invisible.

## Accessibility (from Carbon's docs + source)

- **Semantic element** — Carbon renders the container as a `<div>` wrapping a `<ul>`; each `<cds-contained-list-item>` projects into a `<li>`. `kind="disclosed"` does **not** change the semantics — it's a visual style only. The list is announced by AT as a list.
- **Header / label** — the `label` prop (or `slot="label"` for the WC) renders inside `.cds--contained-list__header`. Because the header is sticky and visually distinct, Carbon ships it as a heading-styled element (`heading-compact-01` for `on-page`, `label-01` for `disclosed`) but doesn't auto-promote to `<h2>`/`<h3>`. If the list is one of several titled regions on the page, wrap the label in a heading element via the `label` slot/prop (e.g., `<div slot="label"><h3>List title</h3></div>`).
- **Clickable rows** — when an item carries `clickable` (WC) / `onClick` (React) the content element is rendered as a `<button type="button">` (Carbon applies `button-reset.reset` to remove default chrome and re-paint state). The whole row becomes a single click target with native keyboard semantics: `Enter` and `Space` activate it, `Tab` moves focus.
- **Disabled rows** — Carbon adds `disabled` to the underlying `<button>`. The row is removed from the focus order and the cursor becomes `not-allowed`. Don't use `aria-disabled` instead — keyboard users need `disabled` to skip the row.
- **Per-item action button** — the slotted action (`<cds-icon-button slot="action">` / React `action={…}`) is positioned absolutely and gets `pointer-events: all` while the surrounding container has `pointer-events: none`. This means: clicking the row's empty space activates the row; clicking the action button activates the button. Both must have their own `aria-label` (Carbon's stories use `aria-label="Dismiss"` and the WC `<span slot="tooltip-content">` for the icon button's accessible name and tooltip).
- **Focus management** — Carbon uses its signature double-ring on the clickable row: a `2px solid var(--cds-focus)` outline rendered as a `::after` pseudo with `inset: 0` so it covers the full row including the sliver where the divider sits. Focus on the embedded `<cds-search>` close button gets the same `focus-outline` mixin. **Never** suppress these — the outline is the primary affordance for keyboard nav.
- **Keyboard** — the container itself is not a `[role="listbox"]`/`[role="menu"]` — it's a static list. Tab order is therefore: header action button → embedded search input → search close button → first clickable row → second clickable row → … → last row's slotted action. Arrow keys do **not** move between rows (use a Menu, OverflowMenu, or ListBox if you need keyboard-driven row traversal).
- **Touch targets** — at the default `lg` size each row is 48px tall, comfortably above the 44px iOS / 48px Material minimum. `sm` (32px) is below this threshold; reserve `sm` for desktop pointer use only or wrap in a `@media (pointer: coarse) { .cds--contained-list { --cds-layout-size-height: 2.75rem; } }` query to bump to 44px on touch devices.
- **Sticky header + screen readers** — the sticky header stays visible while the list scrolls but does not re-announce on each scroll event. AT users hear the title once (when the list is entered) and then the list items in DOM order — exactly the behaviour you want.
- **Search filtering** — the WC stories filter by setting `style.display = 'none'` on non-matching items. Hidden items are removed from the AT tree as well. If you need them to remain announced (e.g. "showing 2 of 4 items") add an `aria-live="polite"` status region above the list.
- **`isInset` / `inset-rulers`** — purely visual. Inset dividers do not change semantics or focus order.
- **Layer tiers** — `.cds--layer-two` / `.cds--layer-three` only change the header background. Item text contrast against `$layer-01`/`$layer-02`/`$layer-03` has been validated against WCAG AA (4.5:1) by the Carbon team.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite the Carbon imports / story render functions |
| Use `kind="on-page"` when the list lives in the layout flow (sidebar, panel, settings page) | Don't use `kind="on-page"` inside a popover or dropdown — that's what `kind="disclosed"` exists for |
| Use `kind="disclosed"` when the list is revealed by an outer surface (popover, dropdown, accordion) | Don't combine `kind="disclosed"` with embedded `<cds-search>` — disclosed headers are too short to anchor a sticky search field |
| Default to `size="lg"` (48px row) — Storybook's `defaultArgs.size = 'lg'` and it matches the touch-target floor | Don't pick `size="sm"` (32px) for touch-first UIs — it's below the 44px iOS / 48px Material minimum |
| Add `clickable` / `onClick` when the entire row should route the user (navigation, selection in a settings page) | Don't add a separate `<Link>` inside a non-clickable row — wrap the whole row instead |
| Slot a `<cds-icon-button kind="ghost">` (or React `<Button kind="ghost" hasIconOnly>`) for per-item actions | Don't use `kind="primary"` for per-item actions — primary buttons are reserved for the page-level CTA |
| Combine `clickable` items with slotted actions when both row navigation and a secondary action are needed (UsageExamples pattern 1) | Don't nest a clickable element inside a clickable row — the focus order becomes ambiguous |
| Use the `action` slot on the list itself for header-level actions (Add, Sort, Filter) | Don't put the header action inside the first item — it should sit in the sticky header so it's always reachable while scrolling |
| Use `<ExpandableSearch>` (React) / `<cds-search expandable>` (WC) when the search is secondary and the list is short | Don't use expandable search when the user is expected to type immediately — a persistent `<Search>` is faster for the primary filter use case |
| Replace the plain `label="…"` string with a flex container when you need a count chip or status indicator (WithListTitleDecorators pattern) | Don't stack two `<Tag>`s inside the label — Carbon's spec only validates a single decorator |
| Use `<ContainedListItem renderIcon={Icon}>` (React) / `slot="icon"` (WC) for 16×16 leading glyphs | Don't substitute a 20×20 or 24×24 icon — the grid column is fixed at `1rem` (16px) and larger icons will overflow into the label |
| Use `data-layer` / `.cds--layer-two` to nest a list inside a layered surface (the header background auto-promotes) | Don't manually set the header `background` — Carbon's layer-tier selectors handle this |
| Set `is-inset` (WC) / `isInset` (React) when the list sits on a contrasting surface and the dividers should hug the content | Don't enable `is-inset` on a list with mixed-icon and no-icon rows — the divider offset is uniform and won't align with the icon column |
| Cap stacked `kind="on-page"` lists with a `1rem` (16px) gap (Carbon does this automatically via the `+` selector — don't override it) | Don't add `margin-bottom` to the first list — Carbon controls the gap via the `+ .cds--contained-list--on-page` adjacent selector |
| Wrap in `[data-theme="white"]` or `[data-theme="g100"]` (or `.cds--white` / `.cds--g100` legacy classes) | Don't define your own theme classes — Carbon's tokens are namespaced to `--cds-*` and bound to `[data-theme]` / `.cds--*` selectors |
| Add `aria-live="polite"` above a search-filtered list if you want item count changes announced | Don't rely on the visible "no results" state alone — AT users will not hear the empty list otherwise |
| Keep corners sharp (`border-radius: 0`) — Carbon's flat aesthetic is the brand signature | Don't add `border-radius` to soften the list — Carbon never rounds list surfaces |
