---
name: multi-select
description: Carbon MultiSelect — JS-driven select-replacement that allows multiple options to be picked. Trigger shows a counter pill (`{n}` selected); menu items are checkboxes. Filterable variant turns the trigger into a search input that displays selected values as inline filter Tags. Variants from Storybook — Default, WithInitialSelectedItems, Filterable, FilterableWithSelectAll, _FilterableWithLayer, _Controlled, SelectAll, SelectAllWithDynamicItems, withAILabel, FilterableWithAILabel, ExperimentalAutoAlign, withToggletipLabel. WC also exports Controlled, FilterableWithLayer, WithAILabel, WithLayer, WithToggletipLabel.
metadata:
  tags: multi-select, multiselect, select, listbox, form, menu, checkbox, tag, counter, filterable, ai-label, ibm, carbon, react, web-components
---

# Multi-Select -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`MultiSelect.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/MultiSelect/MultiSelect.stories.js)
> - **WC story:** [`multi-select.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/multi-select/multi-select.stories.ts)
> - **SCSS (component):** [`_multiselect.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/multiselect/_multiselect.scss) (folder is `multiselect`, no hyphen — `_multi-select.scss` returns 404)
> - **SCSS (parent list-box):** [`_list-box.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/list-box/_list-box.scss) — MultiSelect inherits trigger / menu / counter chip styling from `cds--list-box`
> - **WC SCSS shim:** [`multi-select.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/multi-select/multi-select.scss) — re-exports the styles package and applies `:host` rules
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-multiselect--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-multi-select--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/multiselect/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Trigger heights (sm / md / lg) | `32px` / `40px` / `48px` (inherited from `.cds--list-box` — `block-size: convert.to-rem(40px)` rest, `32px` on `--sm`, `48px` on `--lg`) |
| Trigger padding-inline | `0 16px` (`spacing-05`) on the field label, `padding-inline-end` reserves room for chevron + (when items selected) the counter pill |
| Counter pill (selection--multi) | `block-size: 24px; border-radius: 12px; padding: 8px; padding-inline-end: 2px; margin-inline-end: 10px;` `background: var(--cds-background-inverse)`; `color: var(--cds-text-inverse)`; `@include type-style('label-01')` |
| Counter pill X icon | `block-size: 20px; inline-size: 20px; padding: 2px;` `fill: var(--cds-icon-inverse);` hover ring becomes `border-radius: 50%; background: var(--cds-button-secondary-hover)` |
| Filterable trigger inner padding | `padding: 0` on `.cds--list-box__field` (`.cds--multi-select--filterable .cds--list-box__field { padding: 0; }`) — the inner `.cds--text-input` carries its own padding |
| Filterable inline tag (Tag) | `margin: 0 spacing-03 0 spacing-05` (`0 8px 0 16px`) — tags are `.cds--tag.cds--tag--filter` Tags rendered inside the trigger field-wrapper |
| Filterable input border | `border: 2px solid transparent;` on `.cds--text-input` — the focus ring lives on the outer wrapper via `focus-outline('outline')` |
| Menu item height (md / sm / lg) | `40px` / `32px` / `48px` — `padding: 11px 0` (md), `padding-block: 7px` (sm), `padding-block: 15px` (lg) inside a link with `margin: 0 16px` |
| Menu item checkbox indent | `padding-inline-start: 28px` on `.cds--checkbox-label` (16px box + 12px gap) — the checkbox lives flush-left and the label text is offset right of it |
| Indeterminate dash position | `inset-block-start: 9px` on the `::after` pseudo of an indeterminate checkbox inside `.cds--list-box__menu-item__option` |
| Selected checkbox checkmark position | `inset-block-start: 5px` on the `::after` pseudo of a checked checkbox |
| Checked item label color | `color: var(--cds-text-primary)` (overrides the rest `text-secondary` on the link) |
| Select-all row treatment | First-child `.cds--list-box__menu-item__option` gets `padding: 11px spacing-05; margin: 0; border-block-end: 1px solid var(--cds-border-subtle-01)` — full-bleed divider that sits flush against the rest of the menu |
| Highlighted (keyboard) selected first item | `::before` overlay with `border: 2px solid var(--cds-focus); border-block-start: 1px solid var(--cds-focus)` — the focus ring wraps the row even when the row is also selected |
| Menu max-height | `220px` (md) — 5.5 rows × 40px; scrolls beyond that (inherited from `.cds--list-box__menu` in list-box.scss) |
| Read-only state | `background-color: transparent; border-block-end-color: var(--cds-border-subtle)` on the field; tags lose their hover style; chevron + tag close icons go `var(--cds-icon-disabled)` |
| Corner radius | `border-radius: 0` on the trigger and menu (Carbon: sharp by default — no rounding). The counter pill is the ONE exception: it carries `border-radius: 12px` (pill) |
| Background — trigger (White, `field-01`) | `#f4f4f4` |
| Background — trigger (G100, `field-01`) | `#262626` |
| Background — trigger hover (White, `field-hover-01`) | `#e8e8e8` |
| Background — trigger hover (G100, `field-hover-01`) | `#333333` |
| Background — menu (White, `layer-01`) | `#f4f4f4` |
| Background — menu (G100, `layer-01`) | `#262626` |
| Background — menu item hover (White, `layer-hover-01`) | `#e8e8e8` |
| Background — menu item hover (G100, `layer-hover-01`) | `#333333` |
| Background — selected item (White, `layer-selected-01`) | `#e0e0e0` |
| Background — selected item (G100, `layer-selected-01`) | `#393939` |
| Counter pill background (White, `background-inverse`) | `#393939` |
| Counter pill background (G100, `background-inverse`) | `#f4f4f4` |
| Counter pill text (White, `text-inverse`) | `#ffffff` |
| Counter pill text (G100, `text-inverse`) | `#161616` |
| Counter pill X-hover ring (White, `button-secondary-hover`) | `#4c4c4c` |
| Counter pill X-hover ring (G100, `button-secondary-hover`) | `#5e5e5e` |
| Border-strong-01 (White) — trigger bottom border (rest) | `#8d8d8d` |
| Border-strong-01 (G100) | `#6f6f6f` |
| Border-subtle-01 (White) — between menu items, select-all divider | `#c6c6c6` |
| Border-subtle-01 (G100) | `#525252` |
| Trigger text color (rest) | `var(--cds-text-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Item link text color (rest) | `var(--cds-text-secondary)` — White: `#525252`, G100: `#c6c6c6` |
| Item link text color (hover / checked) | `var(--cds-text-primary)` |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Disabled text | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Disabled chevron / tag svg | `var(--cds-icon-disabled)` |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Focus ring | `outline: 2px solid var(--cds-focus)` (`focus-outline('outline')` mixin) on `.cds--list-box__field--wrapper--input-focused` (filterable trigger) and on highlighted menu items |
| Selected-with-highlight overlay (filterable + select-all) | `position: absolute; border: 2px solid var(--cds-focus); border-block-start: 1px solid var(--cds-focus); inline-size: 100%; block-size: 100%;` — pseudo on the first highlighted item when the multi-select has a selection |
| Error border / icon | `border-color: var(--cds-support-error)` + icon `fill: var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes) |
| Filterable transition | `transition: outline-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive)` on `.cds--multi-select--filterable` |
| Item border / color transition | `border-color, color var(--cds-duration-fast-01) var(--cds-easing-standard-productive)` on `.cds--list-box__menu-item__option` |
| Counter pill X transition | `background-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive)` (inherited from `.cds--list-box__selection`) |
| Font | IBM Plex Sans — body-compact-01 (trigger label, item links), helper-text-01 (helper / invalid / warn text), label-01 (counter pill, titleText), label-01 (filter Tag text) |
| Element / role | `<button aria-haspopup="listbox">` (default trigger) or `<input role="combobox">` (filterable) + `<ul role="listbox" aria-multiselectable="true">` + `<li role="option" aria-selected>` items, each containing a `<input type="checkbox">` |
| z-index | `z('dropdown')` — Carbon's named z-index for popover-class surfaces |
| React import | `import { MultiSelect, FilterableMultiSelect } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/multi-select/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `MultiSelect.stories.js` | Standard multi-select with `titleText`, `helperText`, and a 6-item options list (one disabled). 300px wrapper. `selectionFeedback="top-after-reopen"`. |
| WithInitialSelectedItems | `WithInitialSelectedItems` | `MultiSelect.stories.js` | Same items, with `initialSelectedItems={[items[0], items[1]]}` — counter pill renders `2` on first paint. 300px wrapper. |
| Filterable | `Filterable` | `MultiSelect.stories.js` | Uses the `FilterableMultiSelect` component — trigger becomes a text input that filters the menu as you type. Selected items render as inline `Tag` chips with X buttons inside the trigger. 300px wrapper. |
| FilterableWithSelectAll | `FilterableWithSelectAll` | `MultiSelect.stories.js` | Filterable variant with an `itemsWithSelectAll` array (5 roles). The item flagged `isSelectAll: true` becomes a sticky first row that toggles every non-disabled item. 300px wrapper. |
| _FilterableWithLayer | `_FilterableWithLayer` | `MultiSelect.stories.js` | Filterable variant inside the `<WithLayer>` decorator — verifies the trigger reads correctly across `layer-01 / 02 / 03` tiers. 300px wrapper. |
| _Controlled | `_Controlled` | `MultiSelect.stories.js` | Selection lives in React state via `selectedItems` + `onChange`. Adds a Button-set with "Select all" (sets state to all non-disabled items) and "Clear" (sets state to `[]`). |
| WithLayerMultiSelect | `WithLayerMultiSelect` | `MultiSelect.stories.js` | Standard (non-filterable) multi-select inside the `<WithLayer>` decorator. Each layer index gets its own id. 300px wrapper. |
| SelectAll | `SelectAll` | `MultiSelect.stories.js` | Standard variant with the `itemsWithSelectAll` array. The label updates in `onChange` ("Choose options" → "Option selected" → "Options selected") based on `selectedItems.length`. |
| SelectAllWithDynamicItems | `SelectAllWithDynamicItems` | `MultiSelect.stories.js` | Same as SelectAll, plus a Button below the multi-select that pushes 2 timestamped items into the items state when clicked — verifies that the Select-all row continues to toggle the full (now expanded) list. |
| withAILabel | `withAILabel` | `MultiSelect.stories.js` | Standard variant decorated with `<AILabel>` (confidence score + model type body + 4 ghost icon buttons + "View details" action button). The trigger gains the aiAura gradient background. 400px wrapper. |
| FilterableWithAILabel | `FilterableWithAILabel` | `MultiSelect.stories.js` | Filterable variant decorated with the same `<AILabel>` slug. 400px wrapper. |
| ExperimentalAutoAlign | `ExperimentalAutoAlign` | `MultiSelect.stories.js` | Demonstrates `autoAlign` — wraps the multi-select in a 5000×5000px scroll surface, scrolls to center on mount, and lets the menu flip when the trigger is near a viewport edge. 300px wrapper. |
| withToggletipLabel | `withToggletipLabel` | `MultiSelect.stories.js` | Replaces `titleText` with a JSX node pairing `<ToggletipLabel>` + `<Toggletip>` (info icon button) — clicking the icon opens a popover with helper copy + a Link + a Button. |
| WC: Default | `Default` | `multi-select.stories.ts` | `<cds-multi-select>` with 6 `<cds-multi-select-item>` children. 300px wrapper. Default selection-feedback is `TOP_AFTER_REOPEN`, default direction is `BOTTOM`. |
| WC: Controlled | `Controlled` | `multi-select.stories.ts` | Two `<cds-button>`s call `toggleSelectAll(true/false)` which iterates the items via `document.querySelectorAll('cds-multi-select-item')` and toggles their `selected` attribute. 300px wrapper. |
| WC: Filterable | `Filterable` | `multi-select.stories.ts` | Sets `filterable="true"` — trigger renders an inline `<input>` that filters items. 300px wrapper. Uses the `filterableArgs` defaults (label cleared, titleText `'FilterableMultiSelect title'`). |
| WC: FilterableWithSelectAll | `FilterableWithSelectAll` | `multi-select.stories.ts` | `filterable="true" select-all` + a `<cds-multi-select-item is-select-all>` row. 300px wrapper. |
| WC: FilterableWithAILabel | `FilterableWithAILabel` | `multi-select.stories.ts` | Filterable trigger + slotted `<cds-ai-label alignment="bottom-left">` containing the shared body content + 4 ghost icon buttons + an action button. 400px wrapper. |
| WC: FilterableWithLayer | `FilterableWithLayer` | `multi-select.stories.ts` | Filterable variant under `withLayers` decorator. 300px wrapper, fullscreen layout. |
| WC: SelectAll | `SelectAll` | `multi-select.stories.ts` | `select-all` enabled. The `cds-multi-select-selected` event mutates `multiSelect.label` between "Choose Options" and "Options Selected". 400px wrapper. |
| WC: SelectAllWithDynamicItems | `SelectAllWithDynamicItems` | `multi-select.stories.ts` | Same as SelectAll plus a button that DOM-creates two new `<cds-multi-select-item>` children with timestamped values. 400px wrapper. |
| WC: WithAILabel | `WithAILabel` | `multi-select.stories.ts` | Slotted `<cds-ai-label alignment="bottom-left">` inside the standard (non-filterable) trigger. 400px wrapper. |
| WC: WithInitialSelectedItems | `WithInitialSelectedItems` | `multi-select.stories.ts` | Two of the items carry `selected` attribute on first render. 300px wrapper. |
| WC: WithLayer | `WithLayer` | `multi-select.stories.ts` | Standard (non-filterable) variant under `withLayers` decorator. 300px wrapper, fullscreen layout. |
| WC: WithToggletipLabel | `WithToggletipLabel` | `multi-select.stories.ts` | Replaces the `title-text` slot with a `<span>` containing the title + a `<cds-toggletip autoalign alignment="top">` (info icon + body copy + Link + Button). 400px wrapper. |

The Web Components story file also defines a default export `meta = { title: 'Components/Multi Select' }`. Wrapper widths come from per-story decorators rather than a meta-level decorator: `300px` for most, `400px` for the AI-label / toggletip / select-all stories.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `MultiSelect.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useEffect, useRef, useState } from 'react';
import { View, FolderOpen, Folders, Information } from '@carbon/icons-react';
import { action } from 'storybook/actions';
import { WithLayer } from '../../../.storybook/templates/WithLayer';
import mdx from './MultiSelect.mdx';

import { FilterableMultiSelect, MultiSelect } from '.';
import Button from '../Button';
import ButtonSet from '../ButtonSet';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import {
  Toggletip,
  ToggletipActions,
  ToggletipButton,
  ToggletipContent,
  ToggletipLabel,
} from '../Toggletip';
import Link from '../Link';
import TextInput from '../TextInput';
```

**Default export (story metadata + shared item arrays):**

```jsx
export default {
  title: 'Components/MultiSelect',
  component: MultiSelect,
  subcomponents: {
    FilterableMultiSelect,
  },
  argTypes: {
    size: {
      options: ['sm', 'md', 'lg'],
      control: { type: 'select' },
    },
    light: {
      table: {
        disable: true,
      },
    },
    selectionFeedback: {
      options: ['top', 'fixed', 'top-after-reopen'],
      control: { type: 'select' },
    },
    direction: {
      options: ['top', 'bottom'],
      control: { type: 'radio' },
    },
    type: {
      options: ['inline', 'default'],
      control: { type: 'radio' },
    },
    titleText: {
      control: {
        type: 'text',
      },
    },
    disabled: {
      control: {
        type: 'boolean',
      },
    },
    hideLabel: {
      control: {
        type: 'boolean',
      },
    },
    helperText: {
      control: {
        type: 'text',
      },
    },
    invalid: {
      control: {
        type: 'boolean',
      },
    },
    warn: {
      control: {
        type: 'boolean',
      },
    },
    warnText: {
      control: {
        type: 'text',
      },
    },
    invalidText: {
      control: {
        type: 'text',
      },
    },
    label: {
      control: {
        type: 'text',
      },
    },
    clearSelectionDescription: {
      control: {
        type: 'text',
      },
    },
    useTitleInItem: {
      control: {
        type: 'boolean',
      },
    },
    clearSelectionText: {
      control: {
        type: 'text',
      },
    },
    readOnly: {
      control: { type: 'boolean' },
    },
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: [
        'filterItems',
        'translateWithId',
        'titleText',
        'open',
        'selectedItems',
        'itemToString',
        'itemToElement',
        'locale',
        'items',
        'id',
        'initialSelectedItems',
        'sortItems',
        'compareItems',
        'downshiftProps',
      ],
    },
  },
};

const items = [
  {
    id: 'downshift-1-item-0',
    text: 'Option 1',
  },
  {
    id: 'downshift-1-item-1',
    text: 'Option 2',
  },
  {
    id: 'downshift-1-item-2',
    text: 'Option 3 - a disabled item',
    disabled: true,
  },
  {
    id: 'downshift-1-item-3',
    text: 'Option 4',
  },
  {
    id: 'downshift-1-item-4',
    text: 'An example option that is really long to show what should be done to handle long text',
  },
  {
    id: 'downshift-1-item-5',
    text: 'Option 5',
  },
];

const sharedArgs = {
  size: 'md',
  autoAlign: false,
  type: 'default',
  titleText: 'Label',
  disabled: false,
  hideLabel: false,
  invalid: false,
  warn: false,
  open: false,
  helperText: 'This is helper text',
  warnText: 'Warning message goes here',
  invalidText: 'Error message goes here',
  label: 'This is a label',
  clearSelectionDescription: 'Total items selected: ',
  useTitleInItem: false,
  clearSelectionText: 'To clear selection, press Delete or Backspace,',
};

const filterableArgTypes = {
  label: {
    control: false,
    table: {
      disable: true,
    },
  },
  placeholder: {
    control: {
      type: 'text',
    },
    description:
      'Generic `placeholder` that will be used as the textual representation of what this field is for',
    table: {
      type: { summary: 'string' },
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const items = [
    {
      id: 'downshift-1-item-0',
      text: 'Option 1',
    },
    {
      id: 'downshift-1-item-1',
      text: 'Option 2',
    },
    {
      id: 'downshift-1-item-2',
      text: 'Option 3 - a disabled item',
      disabled: true,
    },
    {
      id: 'downshift-1-item-3',
      text: 'Option 4',
    },
    {
      id: 'downshift-1-item-4',
      text: 'An example option that is really long to show what should be done to handle long text',
    },
    {
      id: 'downshift-1-item-5',
      text: 'Option 5',
    },
  ];
  return (
    <div
      style={{
        width: 300,
      }}>
      <MultiSelect
        label="Multiselect Label"
        id="carbon-multiselect-example"
        titleText="Multiselect title"
        helperText="This is helper text"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        {...args}
      />
    </div>
  );
};

Default.args = { ...sharedArgs };
```

**Variant: WithInitialSelectedItems**

```jsx
export const WithInitialSelectedItems = (args) => {
  const items = [
    {
      id: 'downshift-1-item-0',
      text: 'Option 1',
    },
    {
      id: 'downshift-1-item-1',
      text: 'Option 2',
    },
    {
      id: 'downshift-1-item-2',
      text: 'Option 3 - a disabled item',
      disabled: true,
    },
    {
      id: 'downshift-1-item-3',
      text: 'Option 4',
    },
    {
      id: 'downshift-1-item-4',
      text: 'An example option that is really long to show what should be done to handle long text',
    },
    {
      id: 'downshift-1-item-5',
      text: 'Option 5',
    },
  ];
  return (
    <div
      style={{
        width: 300,
      }}>
      <MultiSelect
        label="Multiselect Label"
        id="carbon-multiselect-example-2"
        titleText="Multiselect title"
        helperText="This is helper text"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        initialSelectedItems={[items[0], items[1]]}
        selectionFeedback="top-after-reopen"
        {...args}
      />
    </div>
  );
};

WithInitialSelectedItems.args = { ...sharedArgs };
```

**Variant: Filterable**

```jsx
export const Filterable = (args) => {
  const items = [
    {
      id: 'downshift-1-item-0',
      text: 'Option 1',
    },
    {
      id: 'downshift-1-item-1',
      text: 'Option 2',
    },
    {
      id: 'downshift-1-item-2',
      text: 'Option 3 - a disabled item',
      disabled: true,
    },
    {
      id: 'downshift-1-item-3',
      text: 'Option 4',
    },
    {
      id: 'downshift-1-item-4',
      text: 'An example option that is really long to show what should be done to handle long text',
    },
    {
      id: 'downshift-1-item-5',
      text: 'Option 5',
    },
  ];

  return (
    <div
      style={{
        width: 300,
      }}>
      <FilterableMultiSelect
        id="carbon-multiselect-example-3"
        titleText="FilterableMultiSelect title"
        helperText="This is helper text"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        {...args}
      />
    </div>
  );
};

Filterable.args = { ...sharedArgs };
```

**Variant: FilterableWithSelectAll**

```jsx
export const FilterableWithSelectAll = (args) => {
  return (
    <div
      style={{
        width: 300,
      }}>
      <FilterableMultiSelect
        id="carbon-multiselect-example-3"
        titleText="FilterableMultiSelect title"
        helperText="This is helper text"
        items={itemsWithSelectAll}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        {...args}
      />
    </div>
  );
};

FilterableWithSelectAll.args = { ...sharedArgs };

FilterableWithSelectAll.argTypes = {
  ...filterableArgTypes,
};
Filterable.argTypes = {
  ...filterableArgTypes,
  onChange: {
    action: 'onChange',
  },
  onMenuChange: {
    action: 'onMenuChange',
  },
};
```

**Variant: WithLayerMultiSelect**

```jsx
export const WithLayerMultiSelect = (args) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 300 }}>
        <MultiSelect
          label="Multiselect Label"
          id={`carbon-multiselect-example-${layer}`}
          titleText="Multiselect title"
          helperText="This is helper text"
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          selectionFeedback="top-after-reopen"
          {...args}
        />
      </div>
    )}
  </WithLayer>
);
WithLayerMultiSelect.args = { ...sharedArgs };
```

**Variant: _FilterableWithLayer**

```jsx
export const _FilterableWithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 300 }}>
        <FilterableMultiSelect
          id={`carbon-multiselect-example-${layer}`}
          titleText="Multiselect title"
          helperText="This is helper text"
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          selectionFeedback="top-after-reopen"
          {...args}
        />
      </div>
    )}
  </WithLayer>
);

_FilterableWithLayer.args = { ...sharedArgs };

_FilterableWithLayer.argTypes = {
  ...filterableArgTypes,
};
```

**Variant: _Controlled**

```jsx
export const _Controlled = (args) => {
  const [selectedItems, setSelectedItems] = useState(
    items.filter((item) => item.id === 'downshift-1-item-0')
  );

  const onSelectionChanged = (value) => {
    action('changed items')(value);
    setSelectedItems(value);
  };

  return (
    <div style={{ width: 300 }}>
      <MultiSelect
        id="carbon-multiselect-example-controlled"
        titleText="Multiselect title"
        label="Multiselect label"
        items={items}
        selectedItems={selectedItems}
        onChange={(data) => onSelectionChanged(data.selectedItems)}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        {...args}
      />
      <br />
      <ButtonSet>
        <Button
          id="all"
          onClick={() =>
            setSelectedItems(items.filter((item) => !item.disabled))
          }>
          Select all
        </Button>
        <Button
          id="clear"
          kind="secondary"
          onClick={() => setSelectedItems([])}>
          Clear
        </Button>
      </ButtonSet>
    </div>
  );
};

_Controlled.args = { ...sharedArgs };
```

**Variant: SelectAll** (uses the `itemsWithSelectAll` helper defined just above):

```jsx
const itemsWithSelectAll = [
  {
    id: 'downshift-1-item-0',
    text: 'Editor',
  },
  {
    id: 'downshift-1-item-1',
    text: 'Owner',
  },
  {
    id: 'downshift-1-item-2',
    text: 'Uploader',
  },
  {
    id: 'downshift-1-item-3',
    text: 'Reader - a disabled item',
    disabled: true,
  },
  {
    id: 'select-all',
    text: 'All roles',
    isSelectAll: true,
  },
];

export const SelectAll = (args) => {
  const [label, setLabel] = useState('Choose options');

  const onChange = (value) => {
    if (value.selectedItems.length == 1) {
      setLabel('Option selected');
    } else if (value.selectedItems.length > 1) {
      setLabel('Options selected');
    } else {
      setLabel('Choose options');
    }
  };

  return (
    <div style={{ width: 300 }}>
      <MultiSelect
        label={label}
        id="carbon-multiselect-example"
        titleText="Multiselect title"
        helperText="This is helper text"
        items={itemsWithSelectAll}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        onChange={onChange}
        {...args}
      />
    </div>
  );
};

SelectAll.args = { ...sharedArgs };
```

**AI label slug** (shared by `withAILabel` and `FilterableWithAILabel`):

```jsx
const aiLabel = (
  <AILabel className="ai-label-container">
    <AILabelContent>
      <div>
        <p className="secondary">AI Explained</p>
        <h2 className="ai-label-heading">84%</h2>
        <p className="secondary bold">Confidence score</p>
        <p className="secondary">
          Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
        </p>
        <hr />
        <p className="secondary">Model type</p>
        <p className="bold">Foundation model</p>
      </div>
      <AILabelActions>
        <IconButton kind="ghost" label="View">
          <View />
        </IconButton>
        <IconButton kind="ghost" label="Open Folder">
          <FolderOpen />
        </IconButton>
        <IconButton kind="ghost" label="Folders">
          <Folders />
        </IconButton>
        <Button>View details</Button>
      </AILabelActions>
    </AILabelContent>
  </AILabel>
);
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => (
  <div style={{ width: 400 }}>
    <MultiSelect
      label="Multiselect Label"
      id="carbon-multiselect-example"
      titleText="Multiselect title"
      helperText="This is helper text"
      items={items}
      itemToString={(item) => (item ? item.text : '')}
      selectionFeedback="top-after-reopen"
      decorator={aiLabel}
      {...args}
    />
  </div>
);

withAILabel.args = { ...sharedArgs };
```

**Variant: FilterableWithAILabel**

```jsx
export const FilterableWithAILabel = (args) => (
  <div style={{ width: 400 }}>
    <FilterableMultiSelect
      label="Multiselect Label"
      id="carbon-multiselect-example"
      titleText="Multiselect title"
      helperText="This is helper text"
      items={items}
      itemToString={(item) => (item ? item.text : '')}
      selectionFeedback="top-after-reopen"
      decorator={aiLabel}
      {...args}
    />
  </div>
);

FilterableWithAILabel.args = { ...sharedArgs };
FilterableWithAILabel.argTypes = {
  ...filterableArgTypes,
};
```

**Variant: ExperimentalAutoAlign**

```jsx
export const ExperimentalAutoAlign = (args) => {
  const ref = useRef();
  useEffect(() => {
    ref?.current?.scrollIntoView({ block: 'center', inline: 'center' });
  });
  return (
    <div style={{ width: '5000px', height: '5000px' }}>
      <div
        style={{
          position: 'absolute',
          top: '2500px',
          left: '2500px',
          width: 300,
        }}>
        <MultiSelect
          label="Multiselect Label"
          id="carbon-multiselect-example"
          titleText="Multiselect title"
          helperText="This is helper text"
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          selectionFeedback="top-after-reopen"
          ref={ref}
          autoAlign
          {...args}
        />
      </div>
    </div>
  );
};

ExperimentalAutoAlign.argTypes = {
  autoAlign: {
    control: false,
  },
};

ExperimentalAutoAlign.args = { ...sharedArgs, autoAlign: true };
```

**Variant: withToggletipLabel**

```jsx
export const withToggletipLabel = (args) => {
  return (
    <div>
      <MultiSelect
        label="Multiselect Label"
        id="carbon-multiselect-example"
        titleText={
          <div style={{ display: 'flex', alignItems: 'center' }}>
            <ToggletipLabel>Multiselect title</ToggletipLabel>
            <Toggletip>
              <ToggletipButton label="Show information">
                <Information />
              </ToggletipButton>
              <ToggletipContent>
                <p>
                  Lorem ipsum dolor sit amet, di os consectetur adipiscing elit,
                  sed do eiusmod tempor incididunt ut fsil labore et dolore
                  magna aliqua.
                </p>
                <ToggletipActions>
                  <Link href="#">Link action</Link>
                  <Button size="sm">Button</Button>
                </ToggletipActions>
              </ToggletipContent>
            </Toggletip>
          </div>
        }
        helperText="This is helper text"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        {...args}
      />
    </div>
  );
};

withToggletipLabel.args = { ...sharedArgs };
```

**Variant: SelectAllWithDynamicItems**

```jsx
export const SelectAllWithDynamicItems = (args) => {
  const [label, setLabel] = useState('Choose options');
  const [items, setItems] = useState(itemsWithSelectAll);

  const onChange = (value) => {
    if (value.selectedItems.length == 1) {
      setLabel('Option selected');
    } else if (value.selectedItems.length > 1) {
      setLabel('Options selected');
    } else {
      setLabel('Choose options');
    }
  };

  function addItems() {
    setItems((prevItems) => {
      const now = Date.now();
      return [
        ...prevItems,
        {
          id: `item-added-via-button-1${now}`,
          text: `item-added-via-button-1${now}`,
        },
        {
          id: `item-added-via-button-2${now}`,
          text: `item-added-via-button-2${now}`,
        },
      ];
    });
  }

  return (
    <div style={{ width: 300 }}>
      <MultiSelect
        label={label}
        id="carbon-multiselect-example"
        titleText="Multiselect title"
        helperText="This is helper text"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        selectionFeedback="top-after-reopen"
        onChange={onChange}
        {...args}
      />
      <Button onClick={addItems}>Add 2 items to the list</Button>
    </div>
  );
};

SelectAllWithDynamicItems.args = { ...sharedArgs };
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `multi-select.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import {
  DROPDOWN_SIZE,
  DROPDOWN_TYPE,
  DROPDOWN_DIRECTION,
  SELECTION_FEEDBACK_OPTION,
} from './multi-select';
import './multi-select-item';
import '../layer/index';
import '../ai-label';
import '../button';
import '../toggle-tip';
import '../icon-button';
import '../link';
import { iconLoader } from '../../globals/internal/icon-loader';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Shared template fragments** (used by AI-label stories):

```ts
const content = html`
  <div slot="body-text">
    <p class="secondary">AI Explained</p>
    <h2 class="ai-label-heading">84%</h2>
    <p class="secondary bold">Confidence score</p>
    <p class="secondary">
      Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
      eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
    </p>
    <hr />
    <p class="secondary">Model type</p>
    <p class="bold">Foundation model</p>
  </div>
`;

const actions = html`
  <cds-icon-button kind="ghost" slot="actions" size="lg">
    ${iconLoader(View16, { slot: 'icon' })}
    <span slot="tooltip-content"> View </span>
  </cds-icon-button>
  <cds-icon-button kind="ghost" slot="actions" size="lg">
    ${iconLoader(FolderOpen16, { slot: 'icon' })}
    <span slot="tooltip-content"> Open folder</span>
  </cds-icon-button>
  <cds-icon-button kind="ghost" slot="actions" size="lg">
    ${iconLoader(Folders16, { slot: 'icon' })}
    <span slot="tooltip-content"> Folders </span>
  </cds-icon-button>
  <cds-ai-label-action-button>View details</cds-ai-label-action-button>
`;

const sizes = {
  [`Small size (${DROPDOWN_SIZE.SMALL})`]: DROPDOWN_SIZE.SMALL,
  [`Medium size (${DROPDOWN_SIZE.MEDIUM})`]: DROPDOWN_SIZE.MEDIUM,
  [`Large size (${DROPDOWN_SIZE.LARGE})`]: DROPDOWN_SIZE.LARGE,
};

const directionOptions = {
  [`Top`]: DROPDOWN_DIRECTION.TOP,
  [`Bottom`]: DROPDOWN_DIRECTION.BOTTOM,
};

const types = {
  Default: null,
  [`Inline (${DROPDOWN_TYPE.INLINE})`]: DROPDOWN_TYPE.INLINE,
};

const selectionFeedbackOptions = {
  [`Top (${SELECTION_FEEDBACK_OPTION.TOP})`]: SELECTION_FEEDBACK_OPTION.TOP,
  [`Fixed (${SELECTION_FEEDBACK_OPTION.FIXED})`]:
    SELECTION_FEEDBACK_OPTION.FIXED,
  [`Top-after-reopen (${SELECTION_FEEDBACK_OPTION.TOP_AFTER_REOPEN})`]:
    SELECTION_FEEDBACK_OPTION.TOP_AFTER_REOPEN,
};

const args = {
  clearSelectionDescription: 'Total items selected: ',
  clearSelectionText: 'To clear selection, press Delete or Backspace.',
  disabled: false,
  direction: DROPDOWN_DIRECTION.BOTTOM,
  helperText: 'This is helper text',
  hideLabel: false,
  locale: 'en',
  invalid: false,
  invalidText: 'Error message goes here',
  warnText: 'Warning message goes here',
  titleText: 'Label',
  label: 'This is a label',
  size: DROPDOWN_SIZE.MEDIUM,
  selectionFeedback: SELECTION_FEEDBACK_OPTION.TOP_AFTER_REOPEN,
  readOnly: false,
  type: null,
  warn: false,
};

const filterableArgs = {
  clearSelectionDescription: 'Total items selected: ',
  clearSelectionText: 'To clear selection, press Delete or Backspace.',
  disabled: false,
  direction: DROPDOWN_DIRECTION.BOTTOM,
  helperText: 'This is helper text',
  hideLabel: false,
  locale: 'en',
  invalid: false,
  invalidText: 'Error message goes here',
  warnText: 'Warning message goes here',
  titleText: 'FilterableMultiSelect title',
  label: '',
  size: DROPDOWN_SIZE.MEDIUM,
  selectionFeedback: SELECTION_FEEDBACK_OPTION.TOP_AFTER_REOPEN,
  readOnly: false,
  type: null,
  warn: false,
};

// argTypes config (Storybook controls only — does not affect render output) omitted here.
```

**Variant: Default**

```html
<!-- export const Default — render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done to
      handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: Controlled**

```html
<!-- export const Controlled — toggleSelectAll() runs document.querySelectorAll('cds-multi-select-item').forEach(...) on click; render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done to
      handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all" selected
      >Option 1</cds-multi-select-item
    >
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>

  <br />
  <cds-button-set>
    <cds-button
      kind="primary"
      id="all"
      @click="${() => {
        toggleSelectAll(true);
      }}">
      Select All
    </cds-button>
    <cds-button
      kind="secondary"
      id="clear"
      @click="${() => {
        toggleSelectAll(false);
      }}">
      Clear
    </cds-button>
  </cds-button-set>
</div>
```

**Variant: Filterable**

```html
<!-- export const Filterable — render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    filterable="true">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done to
      handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: FilterableWithSelectAll**

```html
<!-- export const FilterableWithSelectAll — render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    filterable="true"
    select-all>
    <cds-multi-select-item is-select-all>All roles</cds-multi-select-item>

    <cds-multi-select-item value="editor">Editor</cds-multi-select-item>
    <cds-multi-select-item value="owner">Owner</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging"
      >Reader - a disabled itme</cds-multi-select-item
    >
    <cds-multi-select-item value="uploader">Uploader</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: FilterableWithAILabel**

```html
<!-- export const FilterableWithAILabel — render(args) returns: -->
<div style="width: 400px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    filterable="true">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}</cds-ai-label
    >
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done
      to handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: FilterableWithLayer**

```html
<!-- export const FilterableWithLayer — decorators: [withLayers]; parameters.layout: 'fullscreen'; render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    filterable="true">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done
      to handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: SelectAll**

```html
<!-- export const SelectAll — updateLabel(e) sets multiSelect.label between 'Choose Options' and 'Options Selected'; render(args) returns: -->
<div style="width:400px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    id="multiselect-selectall"
    label="Choose Options"
    select-all
    @cds-multi-select-selected=${updateLabel}>
    <cds-multi-select-item is-select-all>All roles</cds-multi-select-item>
    <cds-multi-select-item value="editor">Editor</cds-multi-select-item>
    <cds-multi-select-item value="owner">Owner</cds-multi-select-item>
    <cds-multi-select-item disabled value="Reader"
      >Reader - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="uploader">Uploader</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: SelectAllWithDynamicItems**

```html
<!-- export const SelectAllWithDynamicItems — click handler does document.createElement('cds-multi-select-item'); item.setAttribute('value', val); item.textContent = val; multiSelect?.appendChild(item); for two new timestamped values; render(args) returns: -->
<div style="width:400px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}"
    label="Choose Options"
    select-all
    @cds-multi-select-selected=${updateLabel}>
    <cds-multi-select-item is-select-all> All roles </cds-multi-select-item>
    <cds-multi-select-item value="editor">Editor</cds-multi-select-item>
    <cds-multi-select-item value="owner">Owner</cds-multi-select-item>
    <cds-multi-select-item disabled value="Reader"
      >Reader - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="uploader">Uploader</cds-multi-select-item>
  </cds-multi-select>
  <cds-button
    kind="primary"
    id="all"
    @click=${() => {
      const multiSelect = document.querySelector('cds-multi-select');
      const now = Date.now();
      [
        `item-added-via-button-1-${now}`,
        `item-added-via-button-2-${now}`,
      ].forEach((val) => {
        const item = document.createElement('cds-multi-select-item');
        item.setAttribute('value', val);
        item.textContent = val;
        multiSelect?.appendChild(item);
      });
    }}>
    Add 2 items to the list
  </cds-button>
</div>
```

**Variant: WithAILabel**

```html
<!-- export const WithAILabel — render(args) returns: -->
<div style="width: 400px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}</cds-ai-label
    >
    <cds-multi-select-item value="example">
      An example option that is really long to show what should be done to
      handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: WithInitialSelectedItems**

```html
<!-- export const WithInitialSelectedItems — render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done to
      handle long text</cds-multi-select-item
    >
    <cds-multi-select-item selected value="all"
      >Option 1</cds-multi-select-item
    >
    <cds-multi-select-item selected value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: WithLayer**

```html
<!-- export const WithLayer — decorators: [withLayers]; parameters.layout: 'fullscreen'; render(args) returns: -->
<div style="width:300px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done
      to handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: WithToggletipLabel**

```html
<!-- export const WithToggletipLabel — render(args) returns: -->
<div style="width: 400px">
  <cds-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    helper-text=${ifDefined(helperText)}
    ?hide-label=${hideLabel}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    type=${ifDefined(type)}
    value="${ifDefined(value)}">
    <span
      slot="title-text"
      style="display: inline-flex; align-items: center; gap: 0.25rem;">
      Multiselect title
      <cds-toggletip autoalign alignment="top">
        <p slot="body-text">
          Lorem ipsum dolor sit amet, di os consectetur adipiscing elit,
          sed do eiusmod tempor incididunt ut fsil labore et dolore magna
          aliqua.
        </p>
        <cds-link href="#" slot="actions">Test</cds-link>
        <cds-button slot="actions">Button</cds-button>
      </cds-toggletip>
    </span>

    <cds-multi-select-item value="example">
      An example option that is really long to show what should be done to
      handle long text
    </cds-multi-select-item>
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Default export:**

```ts
const meta = {
  title: 'Components/Multi Select',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> Lit bindings resolved to each story's `args` defaults: `direction="bottom"`, `helper-text="This is helper text"`, `invalid-text="Error message goes here"`, `warn-text="Warning message goes here"`, `title-text="Label"` (Filterable: `"FilterableMultiSelect title"`), `label="This is a label"` (Filterable: `""`), `selection-feedback="top-after-reopen"`. No `disabled`/`invalid`/`warn`/`hide-label`/`read-only`/`type`/`size` (uses `md` default).

**Variant: Default (closed, nothing selected)**

```html
<div style="width:300px">
  <cds-multi-select
    direction="bottom"
    helper-text="This is helper text"
    invalid-text="Error message goes here"
    title-text="Label"
    selection-feedback="top-after-reopen"
    warn-text="Warning message goes here"
    label="This is a label"
    locale="en">
    <cds-multi-select-item value="example">An example option that is really long to show what should be done to handle long text</cds-multi-select-item>
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry">Option 2</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Option 3 - a disabled item</cds-multi-select-item>
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: WithInitialSelectedItems (closed, 2 selected — counter pill renders `2`)**

```html
<div style="width:300px">
  <cds-multi-select
    direction="bottom"
    helper-text="This is helper text"
    invalid-text="Error message goes here"
    title-text="Label"
    selection-feedback="top-after-reopen"
    warn-text="Warning message goes here"
    label="This is a label"
    locale="en">
    <cds-multi-select-item value="example">An example option that is really long to show what should be done to handle long text</cds-multi-select-item>
    <cds-multi-select-item selected value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item selected value="cloudFoundry">Option 2</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Option 3 - a disabled item</cds-multi-select-item>
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: Filterable (closed, 0 selected)**

```html
<div style="width:300px">
  <cds-multi-select
    direction="bottom"
    helper-text="This is helper text"
    invalid-text="Error message goes here"
    title-text="FilterableMultiSelect title"
    selection-feedback="top-after-reopen"
    warn-text="Warning message goes here"
    locale="en"
    filterable="true">
    <cds-multi-select-item value="example">An example option that is really long to show what should be done to handle long text</cds-multi-select-item>
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry">Option 2</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Option 3 - a disabled item</cds-multi-select-item>
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

**Variant: FilterableWithSelectAll (closed, 0 selected)**

```html
<div style="width:300px">
  <cds-multi-select
    direction="bottom"
    helper-text="This is helper text"
    invalid-text="Error message goes here"
    title-text="FilterableMultiSelect title"
    selection-feedback="top-after-reopen"
    warn-text="Warning message goes here"
    locale="en"
    filterable="true"
    select-all>
    <cds-multi-select-item is-select-all>All roles</cds-multi-select-item>
    <cds-multi-select-item value="editor">Editor</cds-multi-select-item>
    <cds-multi-select-item value="owner">Owner</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Reader - a disabled itme</cds-multi-select-item>
    <cds-multi-select-item value="uploader">Uploader</cds-multi-select-item>
  </cds-multi-select>
</div>
```

> The remaining variants (SelectAll, WithLayer, WithAILabel, ExperimentalAutoAlign, _Controlled, SelectAllWithDynamicItems) are mechanically derived from the WC source above the same way: drop the `${ifDefined(...)}` bindings, replace boolean prop bindings (`?disabled=${disabled}` etc.) with either the literal attribute (when truthy) or omit it (when falsy), and substitute the per-story `args` literals listed in the story header. For `WithLayer`, wrap the `<div>` in `<div class="cds--layer-two">` (or `cds--layer-three`) to opt the multi-select into the deeper layer tier.

**Variant: WithToggletipLabel (closed, 0 selected)**

```html
<div style="width: 400px">
  <cds-multi-select
    direction="bottom"
    helper-text="This is helper text"
    invalid-text="Error message goes here"
    title-text="Label"
    selection-feedback="top-after-reopen"
    warn-text="Warning message goes here"
    label="This is a label"
    locale="en">
    <span slot="title-text" style="display: inline-flex; align-items: center; gap: 0.25rem;">
      Multiselect title
      <cds-toggletip autoalign alignment="top">
        <p slot="body-text">
          Lorem ipsum dolor sit amet, di os consectetur adipiscing elit,
          sed do eiusmod tempor incididunt ut fsil labore et dolore magna
          aliqua.
        </p>
        <cds-link href="#" slot="actions">Test</cds-link>
        <cds-button slot="actions">Button</cds-button>
      </cds-toggletip>
    </span>

    <cds-multi-select-item value="example">An example option that is really long to show what should be done to handle long text</cds-multi-select-item>
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry">Option 2</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Option 3 - a disabled item</cds-multi-select-item>
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-multi-select>
</div>
```

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  /* Trigger surface (uses field-01 from list-box.scss line 88) */
  --cds-multi-select-background: #f4f4f4;
  --cds-multi-select-background-hover: #e8e8e8;
  --cds-multi-select-text: #161616;
  --cds-multi-select-helper-text: #6f6f6f;
  --cds-multi-select-border-bottom: #8d8d8d;       /* border-strong-01, rest */
  --cds-multi-select-border-bottom-open: #c6c6c6;  /* border-subtle-01, when expanded */
  --cds-multi-select-border-bottom-readonly: #c6c6c6; /* border-subtle */

  /* Counter pill (selection--multi from list-box.scss line 467) */
  --cds-multi-select-counter-bg: #393939;          /* background-inverse */
  --cds-multi-select-counter-text: #ffffff;        /* text-inverse */
  --cds-multi-select-counter-icon: #ffffff;        /* icon-inverse */
  --cds-multi-select-counter-icon-hover-bg: #4c4c4c; /* button-secondary-hover */

  /* Filter Tag chips (cds--tag--filter inside the trigger field) */
  --cds-multi-select-tag-bg: #e0e0e0;              /* layer-selected-01 (gray-20) */
  --cds-multi-select-tag-text: #161616;            /* text-primary */
  --cds-multi-select-tag-close-icon: #161616;
  --cds-multi-select-tag-close-hover-bg: #c6c6c6;  /* layer-active-01 ring */

  /* Menu surface */
  --cds-multi-select-menu-bg: #f4f4f4;             /* layer-01 */
  --cds-multi-select-menu-item-text: #525252;      /* text-secondary, rest */
  --cds-multi-select-menu-item-text-hover: #161616;
  --cds-multi-select-menu-item-divider: #c6c6c6;   /* border-subtle-01 */
  --cds-multi-select-menu-item-hover-bg: #e8e8e8;  /* layer-hover-01 */

  /* Selected item (when an item is checked AND highlighted as the active row) */
  --cds-multi-select-menu-item-selected-bg: #e0e0e0;        /* layer-selected-01 */
  --cds-multi-select-menu-item-selected-hover-bg: #cacaca;  /* layer-selected-hover, gray-25 */
  --cds-multi-select-menu-item-selected-text: #161616;

  /* Checkbox inside a menu item — checked state uses brand */
  --cds-multi-select-checkbox-checked-bg: #0f62fe;
  --cds-multi-select-checkbox-checked-icon: #ffffff;

  /* Focus + validation */
  --cds-multi-select-focus: #0f62fe;
  --cds-multi-select-error: #da1e28;               /* support-error */
  --cds-multi-select-warning: #f1c21b;             /* support-warning */

  /* Disabled */
  --cds-multi-select-disabled-text: rgba(22, 22, 22, 0.25);
  --cds-multi-select-disabled-icon: rgba(22, 22, 22, 0.25);
}

[data-theme="g100"],
.dark {
  /* Trigger surface */
  --cds-multi-select-background: #262626;          /* field-01 (G100) */
  --cds-multi-select-background-hover: #333333;    /* field-hover-01 */
  --cds-multi-select-text: #f4f4f4;                /* text-primary */
  --cds-multi-select-helper-text: #c6c6c6;         /* text-helper */
  --cds-multi-select-border-bottom: #6f6f6f;       /* border-strong-01 */
  --cds-multi-select-border-bottom-open: #525252;  /* border-subtle-01 */
  --cds-multi-select-border-bottom-readonly: #525252;

  /* Counter pill — inverts in dark */
  --cds-multi-select-counter-bg: #f4f4f4;          /* background-inverse */
  --cds-multi-select-counter-text: #161616;        /* text-inverse */
  --cds-multi-select-counter-icon: #161616;        /* icon-inverse */
  --cds-multi-select-counter-icon-hover-bg: #5e5e5e; /* button-secondary-hover (G100) */

  /* Filter Tag chips */
  --cds-multi-select-tag-bg: #525252;              /* layer-selected-01 (G100) is #393939 but tag inside dark trigger uses gray-70 */
  --cds-multi-select-tag-text: #f4f4f4;
  --cds-multi-select-tag-close-icon: #f4f4f4;
  --cds-multi-select-tag-close-hover-bg: #6f6f6f;

  /* Menu surface */
  --cds-multi-select-menu-bg: #262626;             /* layer-01 */
  --cds-multi-select-menu-item-text: #c6c6c6;      /* text-secondary, rest */
  --cds-multi-select-menu-item-text-hover: #f4f4f4;
  --cds-multi-select-menu-item-divider: #525252;   /* border-subtle-01 */
  --cds-multi-select-menu-item-hover-bg: #333333;  /* layer-hover-01 */

  /* Selected item */
  --cds-multi-select-menu-item-selected-bg: #393939;        /* layer-selected-01 */
  --cds-multi-select-menu-item-selected-hover-bg: #474747;  /* layer-selected-hover */
  --cds-multi-select-menu-item-selected-text: #f4f4f4;

  /* Checkbox — same blue-60 in both themes */
  --cds-multi-select-checkbox-checked-bg: #0f62fe;
  --cds-multi-select-checkbox-checked-icon: #ffffff;

  /* Focus + validation */
  --cds-multi-select-focus: #ffffff;               /* focus inverts to white in G100 */
  --cds-multi-select-error: #fa4d56;
  --cds-multi-select-warning: #f1c21b;

  /* Disabled */
  --cds-multi-select-disabled-text: rgba(244, 244, 244, 0.25);
  --cds-multi-select-disabled-icon: rgba(244, 244, 244, 0.25);
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/multiselect/_multiselect.scss` and the parent `_list-box.scss` (multi-select inherits the trigger / menu / counter chip styling). Hex values are White-theme literals; G100 equivalents are in the Quick Reference + Design Tokens blocks above.

### Trigger field (`.cds--multi-select` / `.cds--list-box__field`)

| State | Background | Text | Bottom border | Other |
|---|---|---|---|---|
| Rest (closed, no selection) | `#f4f4f4` (`field`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong`) | `block-size: 40px`; `padding: 0 16px`; chevron `fill: #161616` |
| Hover | `#e8e8e8` (`field-hover`) | `#161616` | `1px solid #8d8d8d` | — |
| Open / expanded | `#f4f4f4` | `#161616` | `1px solid #c6c6c6` (`border-subtle`) | chevron rotates `180deg`; menu visibility flips on (`.cds--list-box--expanded`) |
| Open + has activedescendant | `#f4f4f4` | `#161616` | `1px solid #c6c6c6` | `outline-offset: -1px; outline-width: 1px` (focus ring tightens to 1px when keyboard is on a row) |
| Filterable + input-focused | `#f4f4f4` (input bg) | `#161616` | `border: 2px solid transparent` on the inner `.cds--text-input` | `focus-outline('outline')` lives on `.cds--list-box__field--wrapper--input-focused` (outer wrapper) — `outline: 2px solid #0f62fe` |
| Disabled | `#f4f4f4` | `rgba(22, 22, 22, 0.25)` | `transparent` (`border-block-end-color: transparent`) | `cursor: not-allowed`; chevron `fill: rgba(22, 22, 22, 0.25)` |
| Read-only | `transparent` | `#161616` | `1px solid #c6c6c6` (`border-subtle`) | tags lose hover bg, tag close icon is `cursor: default`, chevron `fill: rgba(22, 22, 22, 0.25)` |
| Invalid | `#f4f4f4` | `#161616` | `1px solid #da1e28` (`support-error`) | error icon `fill: #da1e28`; trigger `padding-inline-end: 56px` (room for icon at `spacing-08` from edge) |
| Warning | `#f4f4f4` | `#161616` | `1px solid #f1c21b` (`support-warning`) | warning icon `fill: #f1c21b` |
| With AI label | trigger gains aiAura gradient (see `--cds-ai-aura-start` / `--cds-ai-aura-end`) | `#161616` | `1px solid #8d8d8d` | inner shadow `var(--cds-ai-inner-shadow)` |

### Counter pill (`.cds--list-box__selection--multi` — appears when ≥1 item is selected on non-filterable variants)

| State | Background | Text/Icon | Other |
|---|---|---|---|
| Rest | `#393939` (`background-inverse`) | text `#ffffff` (`text-inverse`); X icon `fill: #ffffff` | `block-size: 24px; border-radius: 12px; padding: 8px; padding-inline-end: 2px; margin-inline-end: 10px;` `@include type-style('label-01')` |
| Hover (the pill itself) | `#393939` | `#ffffff` | `outline: none` |
| X icon hover (inside pill) | ring `#4c4c4c` (`button-secondary-hover`); icon stays `#ffffff` | — | `border-radius: 50%` ring around the 20×20 icon |
| Disabled (whole multiselect disabled) | `tag-theme($text-disabled, $layer)` — chip background `var(--cds-layer-01)` (`#f4f4f4`) and text `rgba(22, 22, 22, 0.25)` | X icon `fill: rgba(22, 22, 22, 0.25)`; X hover bg removed | — |
| Read-only | unchanged background | text + icon `cursor: default` | `box-shadow: 0 0 0 1px var(--cds-border-subtle)` on `.cds--tag--filter` (filterable variant), tag close hover ring is suppressed |

### Filter Tag chips (`.cds--multi-select .cds--tag` — only on the **filterable** variant; one chip per selected value, rendered inside the trigger before the input)

| State | Background | Text | Spacing | Other |
|---|---|---|---|---|
| Rest | `#e0e0e0` (`layer-selected-01` Tag default) | `#161616` (`text-primary`) | `margin: 0 8px 0 16px` (`0 spacing-03 0 spacing-05`); `min-inline-size: auto` | inherits `.cds--tag--filter` close-button styling |
| Hover (X icon hover on chip) | unchanged chip bg | text unchanged | — | X-button hover ring; chip itself doesn't change |
| Disabled (multiselect disabled) | unchanged chip bg | `rgba(22, 22, 22, 0.25)` | — | X icon `fill: rgba(22, 22, 22, 0.25)` |
| Read-only | unchanged chip bg | `#161616` | — | `box-shadow: 0 0 0 1px var(--cds-border-subtle)` ring on chip; X close icon is `cursor: default`; X-hover bg suppressed |

### Menu items (`.cds--list-box__menu-item__option` — the `<a>`/link inside each `<li role="option">`)

| State | Background | Text color | Border | Other |
|---|---|---|---|---|
| Rest | menu bg (`#f4f4f4`) | `#525252` (`text-secondary`) | `border-block-start: 1px solid #c6c6c6` (between items); first item `border-block-start-color: transparent` | `padding: 11px 0; margin: 0 16px;` `block-size: 40px`; `padding-inline-end: 24px` (`spacing-06`) |
| Hover | `#e8e8e8` (`layer-hover-01`) on the `<li>`; link `border-color: transparent` | `#161616` (`text-primary`) | dividers above & below collapse to transparent for visual continuity | — |
| Highlighted (keyboard `aria-activedescendant`) | bg unchanged | `#161616` | `focus-outline('outline')` — `outline: 2px solid #0f62fe; outline-offset: -2px` | `padding: 11px 16px` (link absorbs the link margin so the ring sits flush against the menu edges) |
| Active (selected — checkbox checked) | `#e0e0e0` (`layer-selected-01`) on `.cds--list-box__menu-item--active` | `#161616` (`text-primary`) | `border-block-end-color: #e0e0e0` | label text picks up `color: var(--cds-text-primary)` via `.cds--checkbox:checked ~ .cds--checkbox-label-text` |
| Active + Hover | `#cacaca` (`layer-selected-hover`) | `#161616` | `border-block-end-color: #cacaca` | — |
| Disabled item (`<li>[disabled]`) | revert / no hover | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | dividers continue with `border-subtle-01` | `cursor: not-allowed; outline: none`; checkbox box border = `text-disabled` |
| Filterable + select-all + first-item-highlighted-while-selected | bg unchanged | `#161616` | `::before` overlay: `border: 2px solid #0f62fe; border-block-start: 1px solid #0f62fe; inset: 0 0 0 0; block-size: 100%; inline-size: 100%` | `focus-outline('reset')` on the link (the `::before` carries the focus ring instead) |

### Checkbox inside a menu item (`.cds--list-box__menu-item__option .cds--checkbox` — driven by the standard Carbon checkbox styles in `_checkbox.scss`)

| State | Box bg | Box border | Checkmark / dash | Position |
|---|---|---|---|---|
| Unchecked, rest | `transparent` | `1px solid var(--cds-icon-primary)` (White: `#161616`) | hidden | `padding-inline-start: 28px` on label (16px box + 12px gap); checkbox label `::before` is the box, `::after` is the checkmark |
| Unchecked, hover | `transparent` | `#161616` | hidden | — |
| Checked | `#0f62fe` (`support-info`/checkbox-checked) | `transparent` (subsumed by bg) | `var(--cds-icon-inverse)` checkmark; `inset-block-start: 5px` on `.cds--checkbox-label::after` | label text becomes `color: var(--cds-text-primary)` |
| Indeterminate | `#0f62fe` | `transparent` | dash; `inset-block-start: 9px` on `.cds--checkbox-label::after` | only used by the Select-all row when SOME (not all) items are picked |
| Disabled | `transparent` | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | hidden / `text-disabled` if checked | `cursor: not-allowed` |

### Select-all row (`.cds--multi-select--selectall .cds--list-box__menu-item:first-child .cds--list-box__menu-item__option`)

| Property | Value |
|---|---|
| Padding | `0.6875rem var(--cds-spacing-05)` (`11px 16px`) — full-bleed left/right |
| Margin | `0` (overrides the `margin: 0 16px` inherited from `__menu-item__option`) |
| Bottom border | `1px solid var(--cds-border-subtle-01)` — `#c6c6c6` (White), `#525252` (G100) — divides Select-all from the rest of the list |
| Second item top-border override | `border-block-start: none` on `.cds--list-box__menu-item:nth-child(2) .cds--list-box__menu-item__option` (avoids a double-rule against the Select-all divider) |

### Filterable input (`.cds--multi-select--filterable.cds--combo-box .cds--text-input`)

| State | Background | Border | Other |
|---|---|---|---|
| Rest | inherits trigger field bg | `border: 2px solid transparent; background-clip: padding-box; outline: none;` | input is the editable text element; chips render before it |
| Focused (input itself) | inherits | `border` stays `transparent` | `focus-outline('outline')` applied to outer wrapper `.cds--list-box__field--wrapper--input-focused` — `outline: 2px solid #0f62fe; outline-offset: -2px` |
| Disabled (wrapper disabled-hover) | `var(--cds-field)` | — | inherits global disabled treatment |
| Filterable + Inline | `transparent` background; `border-block-end: 0` on both `.cds--multi-select--filterable.cds--multi-select--inline` and the inner `.cds--text-input` | — | inline removes the bottom border entirely |
| Filterable + selected items present | left padding collapses: `padding-inline-start: 0` on `.cds--text-input` (so the leading Tag chip can sit flush) | — | — |

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `_multiselect.scss` lines 121-123 and `_list-box.scss` lines 419, 583, 685-687):

```css
.cds--multi-select--filterable {
  transition: outline-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive);
}

.cds--list-box__menu-icon {
  /* chevron rotation when trigger opens / closes */
  transition: transform var(--cds-duration-fast-01) var(--cds-easing-standard-productive);
}

.cds--list-box__selection {
  /* counter pill / clear button background fade */
  transition: background-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive);
}

.cds--list-box__menu-item__option {
  transition:
    border-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive),
    color var(--cds-duration-fast-01) var(--cds-easing-standard-productive);
}

@media (prefers-reduced-motion: reduce) {
  .cds--multi-select,
  .cds--multi-select--filterable,
  .cds--list-box__menu-icon,
  .cds--list-box__selection,
  .cds--list-box__menu-item__option {
    transition: none;
  }
}
```

Resolved motion token values from `overview.md`:

- `--cds-duration-fast-01` = `70ms` (snap, productive)
- `--cds-easing-standard-productive` = `cubic-bezier(0.2, 0, 0.38, 0.9)` (Carbon Productive Standard)

The menu open/close animation itself is governed by the JS controller toggling visibility (`.cds--multi-select:not(.cds--list-box--expanded) .cds--list-box__menu { visibility: hidden }`) — there is no max-height transition on the menu surface (unlike the filterable Combo-Box's expand). The chevron rotation and the focus-ring outline-color are the only animated properties.

## Accessibility (from Carbon's docs + source)

- **Semantic root:** `<cds-multi-select>` custom element (renders an internal `<button aria-haspopup="listbox" aria-expanded>` for the default variant, or `<input role="combobox" aria-autocomplete="list" aria-controls aria-expanded aria-activedescendant>` for the filterable variant). React `<MultiSelect>` follows the same DOM pattern via Downshift.
- **List markup:** menu is a `<ul role="listbox" aria-multiselectable="true">`; each option is `<li role="option" aria-selected="true|false">` containing a Carbon Checkbox (`<input type="checkbox">` + label). The checkbox is what conveys the selected state visually; `aria-selected` on the `<li>` conveys it programmatically.
- **Counter pill:** the `.cds--list-box__selection--multi` chip is a `<button>` with an accessible name combining `clearSelectionDescription` ("Total items selected: ") + count + `clearSelectionText` ("To clear selection, press Delete or Backspace,"). Activating it (Enter / Space, or Delete / Backspace from the field) clears all selections.
- **Filter Tag chips (filterable):** each selected item shows as a Carbon Tag with a close button. `aria-label` on each close button reads "Clear filter for {item.text}". Activating clears just that one selection.
- **Select-all row:** the `is-select-all` item carries a checkbox that is `checked` when every non-disabled item is selected, `indeterminate` when some-but-not-all are selected, and `unchecked` when none are. Toggling it selects/deselects every non-disabled item. Disabled items are NEVER toggled by Select-all (matching the SCSS `&:hover` exclusion and the JS guard `!item.hasAttribute('disabled')`).
- **Keyboard (default trigger):**
  - `Tab` / `Shift+Tab` — focus enters / leaves the trigger
  - `Space` / `Enter` / `↓` / `↑` — open the menu
  - `↓` / `↑` — move `aria-activedescendant` between items inside the open menu
  - `Space` / `Enter` — toggle the highlighted item's checkbox (does NOT close the menu — that's the multi-select difference vs Dropdown)
  - `Esc` — close the menu and return focus to the trigger
  - `Delete` / `Backspace` — clear all selections (when the counter pill is part of the field)
  - `Home` / `End` — jump to first / last item
- **Keyboard (filterable trigger):** same as default plus typing in the input filters items; `Backspace` on an empty input deletes the rightmost selected Tag chip.
- **Focus management:** opening the menu does NOT move keyboard focus into the menu — focus stays on the trigger and `aria-activedescendant` walks the items. Closing returns no focus change. The `.cds--list-box__menu-item__option:focus` rule (`focus-outline('outline')`) is for the rare case of mouse-clicking an item; the keyboard path uses the highlighted-row pseudo overlay.
- **Touch target:** medium trigger is `40px` tall; large is `48px` (meets the WCAG 2.2 AA 24×24 target and approaches the AAA 44×44 target). For mobile-first surfaces, prefer `size="lg"`.
- **Screen reader announcements:** Carbon's React implementation (Downshift) live-region-announces "{count} items selected" via `clearSelectionDescription`. The WC implementation announces via `aria-activedescendant` and `aria-selected` on each `<li>` — make sure your screen reader is in a mode that re-reads `aria-selected` changes on the focused descendant.
- **Reduced motion:** Carbon's transitions (chevron rotate, menu item color/border, filterable outline-color) are short (`70ms`) but should still be suppressed under `prefers-reduced-motion: reduce` (the override above does this).
- **Color contrast:** rest text on field (`#161616` on `#f4f4f4`) = 16.8:1; helper text (`#6f6f6f` on `#ffffff` page) = 4.83:1; counter pill (`#ffffff` on `#393939`) = 12.6:1 — all pass WCAG AA. G100 equivalents are calibrated to the same minima.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — copy the `<cds-multi-select>` template, the items, AND the wrapper `<div style="width:300px">` | Don't paraphrase or rewrite the markup — Carbon's source is the truth |
| Sharp corners (`border-radius: 0`) on the trigger and menu | Don't round the trigger or the menu — the ONLY rounded surface is the counter pill (`border-radius: 12px`) |
| Use `<cds-multi-select>` + `<cds-multi-select-item>` (WC) or `<MultiSelect>` / `<FilterableMultiSelect>` (React) — they are TWO React components | Don't substitute a native `<select multiple>` — it loses the counter pill, Tag chips, Select-all row, and aiAura support |
| Use `selectionFeedback="top-after-reopen"` for most flows (the Storybook default) — selected items move to the top only after the user closes & reopens the menu, so the active row doesn't jump under the cursor | Don't default to `"top"` — it pulls items out from under the user mid-click |
| Show the counter pill only when ≥1 item is selected (Carbon does this automatically); place it INSIDE the trigger field, before the chevron | Don't put a separate "Selected: 3" line below the field — Carbon's pattern keeps the count inside the trigger |
| Use the **Filterable** variant when the list has >10 items OR users will know the value they want | Don't use Filterable for short lists (<6 items) — the search input is overkill and the standard variant's checkbox menu is more direct |
| For filterable + many possible selections, enable `select-all` and put the Select-all row first (Carbon enforces this with `:first-child` SCSS) | Don't put Select-all in the middle of the list, and don't add a Clear button next to it — Carbon's pattern uses Select-all as the toggle (checked → all selected; unchecked → none selected; indeterminate → some selected) |
| Use Carbon's per-item Tag chips (filterable) when each selection needs a remove affordance (e.g., a multi-tag editor) | Don't render Tag chips OUTSIDE the filterable trigger — Carbon places them inline so the input always shows the full state |
| Wrap in `[data-theme="white"]` (light) or `[data-theme="g100"]` (dark) — both blocks are defined in overview.md | Don't define your own theme classes; Carbon's tokens already cover light + dark |
| Keep `clearSelectionDescription` and `clearSelectionText` props set — they generate the screen-reader copy on the counter pill | Don't omit them; the counter pill becomes silent for AT users |
| Use `decorator={aiLabel}` (React) or slot `<cds-ai-label>` (WC) for AI-confidence surfaces — the trigger inherits the aiAura gradient automatically | Don't manually add a gradient to the trigger; Carbon's AI integration handles the surface treatment |
| Set a fixed `width` on the wrapping `<div>` (Storybook uses `300px` for default, `400px` for AI/select-all) — the multi-select fills its container | Don't let the trigger collapse to its content width — the counter pill and tag chips need room to breathe |
| Place helper text BELOW the trigger (`helper-text` attr / `helperText` prop) using Carbon's `helper-text-01` type style — `#6f6f6f` (White), `#c6c6c6` (G100) | Don't use generic `<small>` text — it won't pick up `text-helper` color tokens or the responsive `0.75rem` size |
