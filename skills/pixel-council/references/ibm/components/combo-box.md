---
name: combo-box
description: Carbon ComboBox — searchable single-select that combines a typeable text input with a layer-tinted listbox menu. Variants from Storybook — Default, AllowCustomValue, AutocompleteWithTypeahead, ExperimentalAutoAlign, _WithLayer (React) / WithLayer (WC), withAILabel / WithAILabel, Controlled. WC additionally exports the same set; React adds Disabled + Skeleton via `<ComboBox disabled />` and `<ComboBoxSkeleton />`.
metadata:
  tags: combo-box, combobox, autocomplete, typeahead, searchable-select, listbox, form, menu, ai-label, skeleton, ibm, carbon, react, web-components
---

# ComboBox -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`ComboBox.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ComboBox/ComboBox.stories.js)
> - **WC story:** [`combo-box.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/combo-box/combo-box.stories.ts)
> - **SCSS:** [`_combo-box.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/combo-box/_combo-box.scss) (delta on top of `list-box`, `text-input`, and `dropdown` SCSS — Carbon ComboBox inherits the bulk of its styling from `list-box.scss` and only overrides combo-specific behaviour like the editable input border and the menu-item highlight ring)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-combobox--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-combo-box--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/combo-box/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Trigger heights (sm / md / lg) | `32px` / `40px` / `48px` |
| Padding (text-input) | inline-start `16px` (`spacing-05`); inline-end reserves `42px` for the chevron + clear icons (`56px` when invalid, leaving `spacing-08` (`32px`) from the edge for the error icon) |
| Menu max-height (md) | `220px` (40px row × 5.5) — list scrolls beyond that |
| Menu max-height (sm) | `176px` (32px row × 5.5) |
| Menu width | `100%` of the trigger (`inline-size: 100%`) |
| Menu item height | `40px` (md) / `32px` (sm) — `padding: 11px 0` (md) / `padding-block: 7px 7px` (sm) inside a `margin: 0 16px` link; first-item highlighted state shifts to `border: 2px solid var(--cds-focus)` ring (see Carbon-only first-item override below) |
| Selected item indicator | `cds--list-box__menu-item__selected-icon` — a `Checkmark16` icon shown on the highlighted match while the menu is open |
| Corner radius | `border-radius: 0` (Carbon: sharp by default — no rounding on input, menu, or items) |
| Border treatment | **Bottom-only input**: `border-block-end: 1px solid var(--cds-border-strong-01)` at rest. Becomes `border-block-end: 1px solid var(--cds-border-subtle)` while the menu is open or while read-only. Invalid state replaces it with `2px solid var(--cds-support-error)`. |
| Input background (White, `field-01`) | `#f4f4f4` |
| Input background (G100, `field-01`) | `#262626` |
| Input background hover (White, `field-hover-01`) | `#e8e8e8` (Carbon scopes the hover via `.cds--combo-box:hover { background-color: $field; }` which collapses to the regular field colour while the menu is open) |
| Input background hover (G100, `field-hover-01`) | `#333333` |
| Input background — light variant (White, `field-02`) | `#ffffff` (used by `.cds--list-box--light` decorator) |
| Input background — light variant hover (White, `field-02`) | `#ffffff` (Carbon explicitly sets `background-color: $field-02;` on `.cds--combo-box.cds--list-box--light:hover`) |
| Menu background (White, `layer-01`) | `#f4f4f4` |
| Menu background (G100, `layer-01`) | `#262626` |
| Menu item hover (White, `layer-hover-01`) | `#e8e8e8` |
| Menu item hover (G100, `layer-hover-01`) | `#333333` |
| Highlighted item (White, `layer-selected-01`) | `#e0e0e0` |
| Highlighted item (G100, `layer-selected-01`) | `#393939` |
| Border-strong-01 (White) — input bottom border at rest | `#8d8d8d` |
| Border-strong-01 (G100) — input bottom border at rest | `#6f6f6f` |
| Border-subtle (White) — input bottom border while open / read-only | `#c6c6c6` (`border-subtle-00` / `border-subtle-01`) |
| Border-subtle (G100) — input bottom border while open / read-only | `#525252` |
| Focus ring (input) | `outline: 2px solid var(--cds-focus)` via Carbon's `focus-outline('outline')` mixin applied through `.cds--combo-box--input--focus.cds--text-input` |
| Focus ring (input — open with active descendant) | `outline-width: 1px`; `outline-offset: -1px` (Carbon collapses the input ring to a 1px inset while a menu item is highlighted via `aria-activedescendant`, so the highlight sits on the listbox item, not the input) |
| Focus ring (first menu item highlighted) | Carbon adds an explicit `border: 2px solid var(--cds-focus)` ring on the first item via the `::before` pseudo-element so the focus ring isn't clipped by the input's bottom border (`border-block-start: 1px solid var(--cds-focus)`) |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `border-color: var(--cds-support-error)` + `fill: var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes); warning triangle at `inset-inline-end: spacing-08` |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Input text color (rest, typed value) | `var(--cds-text-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Placeholder color | `var(--cds-text-placeholder)` — White: `#a8a8a8`, G100: `#6f6f6f` |
| Item link text color (rest) | `var(--cds-text-secondary)` — White: `#525252`, G100: `#c6c6c6` |
| Item link text color (hover / highlighted) | `var(--cds-text-primary)` |
| Disabled text | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Disabled chevron / clear icon | `var(--cds-icon-disabled)` |
| Read-only background | `transparent` (Carbon explicitly clears `.cds--combo-box--readonly` and its `:hover` to no fill so the field reads as flat) |
| Read-only chevron / clear icon | `var(--cds-icon-disabled)` (Carbon paints both the menu icon and the clear-selection icon as disabled while read-only) |
| Read-only cursor | `cursor: default` on the chevron + clear icons |
| Chevron position (md) | `position: absolute; inset-block-start: 13px; inset-inline-end: 16px`. Sm: `inset-block-start: 8px`. Lg: `inset-block-start: 16px`. Rotates `-180deg` while open. |
| Clear-selection icon | Same `cds--list-box__selection` element as Dropdown — appears once the input has a value; clicking it clears the input and re-opens the menu. Disabled / read-only: `pointer-events: none`. |
| Empty-state copy | `"No matching results"` rendered inside the `.cds--list-box__menu` when filtering returns zero items. The copy is hard-coded in Carbon's React source (translation-keyed via `translateWithId`). |
| Trigger transition | `background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` |
| Chevron transition | `transform var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` |
| Menu open transition | `max-height var(--cds-duration-fast-02) var(--cds-easing-productive-entrance)` (110ms expressive-entrance for the open animation) |
| Item transition | `visibility, opacity, background-color all var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` |
| Font | IBM Plex Sans — body-compact-01 (input, item links), helper-text-01 (helper / invalid / warn text), label-01 (titleText) |
| Element / role | `<div role="combobox">` wrapper, `<input role="combobox" aria-autocomplete="list" aria-expanded aria-controls aria-activedescendant>` editable input, `<ul role="listbox">` + `<li role="option">` items |
| z-index | `z('dropdown')` — Carbon's named z-index for popover-class surfaces (`9100` in v11) |
| React import | `import { ComboBox, ComboBoxSkeleton } from '@carbon/react';` (skeleton is the same `<DropdownSkeleton />` shape — Carbon does not export a separate `ComboBoxSkeleton`; pass `<DropdownSkeleton />` from `@carbon/react`) |
| WC import | `import '@carbon/web-components/es/components/combo-box/index.js';` |

## Variants (from Storybook story exports)

The 2026-04-25 plan task 3.12 lists Default, AllowCustomValue, WithLayer, Disabled, Skeleton as the floor. The verbatim Storybook fetch returns more — every story export found is embedded below.

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `ComboBox.stories.js` | Standard combo-box with `titleText` label, helper text, and a 6-item options array (one disabled). 300px wrapper. Renders `<ComboBox itemToString={item => item ? item.text : ''}>`. |
| AllowCustomValue | `AllowCustomValue` | `ComboBox.stories.js` | `allowCustomValue` flag — lets the user type and submit a value not present in the items array. Pairs with a `shouldFilterItem` callback that case-insensitively matches input substrings. 300px wrapper, fruit list. |
| AutocompleteWithTypeahead | `AutocompleteWithTypeahead` | `ComboBox.stories.js` | Experimental `typeahead` flag — Carbon completes the input with the longest matching item suggestion (highlighted text in the input). 300px wrapper, fruit list. |
| ExperimentalAutoAlign | `ExperimentalAutoAlign` | `ComboBox.stories.js` | `autoAlign={true}` — flips the menu above the input when there is no room below. Wrapped in 300px / 800px spacers to force the flip. 400px container. |
| _WithLayer | `_WithLayer` | `ComboBox.stories.js` | Wrapped in `<WithLayer>` storybook decorator — input swaps `field-01 → field-02 → field-03` and the menu swaps `layer-01 → layer-02 → layer-03` for each nested layer. 300px wrapper. |
| withAILabel | `withAILabel` | `ComboBox.stories.js` | Decorates the input with an `<AILabel>` containing confidence score, model type, and action buttons (View / Open Folder / Folders / View details). The input gains the aiAura gradient background. |
| Controlled | `Controlled` | `ComboBox.stories.js` | Controlled-component pattern — parent owns `selectedItem` via `useState`, with three buttons (Clear, Option 1, Option 2, Option 3) that mutate the value. Demonstrates passing `selectedItem` + `onChange` together. |
| Disabled (recipe) | `Default` w/ `args.disabled=true` | `ComboBox.stories.js` | Disabled state — `<ComboBox disabled />`. Carbon does not export a dedicated `Disabled` story for ComboBox in `main` (use the `disabled` arg control on `Default`). The DOM swaps to `cds--list-box--disabled` + `cds--combo-box--disabled` and clears all hover styles. |
| Skeleton (recipe) | n/a — render `<DropdownSkeleton />` | `ComboBox.stories.js` (no dedicated story) | Carbon does not export a separate `ComboBoxSkeleton`. The Carbon docs site demonstrates the loading state with `<DropdownSkeleton />`, since the skeleton dimensions are identical (`md` field, fixed width). 300px wrapper. |
| WC: Default | `Default` | `combo-box.stories.ts` | Renders `<cds-combo-box>` with all shared args plus 6 `<cds-combo-box-item>` children. Inputs are `inputProps={}` by default. |
| WC: AllowCustomValue | `AllowCustomValue` | `combo-box.stories.ts` | `?allow-custom-value=${allowCustomValue}` + `should-filter-item` boolean attribute — fruit list. |
| WC: AutocompleteWithTypeahead | `AutocompleteWithTypeahead` | `combo-box.stories.ts` | `?typeahead=${typeahead}` flag — fruit list with lowercase values. |
| WC: ExperimentalAutoAlign | `ExperimentalAutoAlign` | `combo-box.stories.ts` | Same auto-align demo as React, with 300px / 800px spacers. Defaults: `autoalign: true`, `direction: BOTTOM`. |
| WC: Controlled | `Controlled` | `combo-box.stories.ts` | Controlled pattern — listens on `cds-combo-box-beingselected` (preventDefault to inhibit Lit's reactive update) and `cds-combo-box-selected` to mirror state into the element's `value` attribute. Three buttons (Clear, Option 1, Option 2, Option 3) drive the value. |
| WC: WithAILabel | `WithAILabel` | `combo-box.stories.ts` | Slots a `<cds-ai-label alignment="bottom-left">` (with body content + 3 ghost icon buttons + an action button) inside `<cds-combo-box>`. |
| WC: WithLayer | `WithLayer` | `combo-box.stories.ts` | Same layer-swap demo as React, via the `withLayers` decorator. 300px width container. `parameters.layout = 'fullscreen'`. |

The Web Components story file also defines a `meta` object with a wrapping decorator that sets the trigger's container width: `300px` for everything except the layer + controlled stories (which set their own widths).

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `ComboBox.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `ComboBox.stories.js`):

```jsx
import React from 'react';
import { WithLayer } from '../../../.storybook/templates/WithLayer';
import ComboBox from '../ComboBox';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import { action } from 'storybook/actions';
import mdx from './ComboBox.mdx';
```

**Shared `items` array** (used by `_WithLayer`, `ExperimentalAutoAlign`; `Default` and `withAILabel` re-declare an identical local copy):

```jsx
const items = [
  {
    id: 'option-0',
    text: 'An example option that is really long to show what should be done to handle long text',
  },
  {
    id: 'option-1',
    text: 'Option 1',
  },
  {
    id: 'option-2',
    text: 'Option 2',
  },
  {
    id: 'option-3',
    text: 'Option 3',
    disabled: true,
  },
  {
    id: 'option-4',
    text: 'Option 4',
  },
  {
    id: 'option-5',
    text: 'Option 5',
  },
];
```

**Storybook default export** (title, component, argTypes, parameters):

```jsx
export default {
  title: 'Components/ComboBox',
  component: ComboBox,
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
    onChange: { action: 'onChange' },
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: [
        'aria-label',
        'id',
        'downshiftProps',
        'initialSelectedItem',
        'items',
        'itemToElement',
        'itemToString',
        'selectedItem',
        'shouldFilterItem',
        'translateWithId',
        'titleText',
        'type',
      ],
    },
  },
};
```

**Shared argTypes** (apply to every variant — `Default.argTypes = { ...sharedArgTypes };` etc.):

```jsx
const sharedArgTypes = {
  onChange: {
    action: 'onChange',
  },
  onToggleClick: {
    action: 'clicked',
  },
  invalidText: {
    control: 'text',
  },
  warnText: {
    control: 'text',
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const items = [
    {
      id: 'option-0',
      text: 'An example option that is really long to show what should be done to handle long text',
    },
    {
      id: 'option-1',
      text: 'Option 1',
    },
    {
      id: 'option-2',
      text: 'Option 2',
    },
    {
      id: 'option-3',
      text: 'Option 3',
      disabled: true,
    },
    {
      id: 'option-4',
      text: 'Option 4',
    },
    {
      id: 'option-5',
      text: 'Option 5',
    },
  ];
  return (
    <div style={{ width: 300 }}>
      <ComboBox
        id="carbon-combobox"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        titleText="Label"
        helperText="Helper text"
        invalidText="Error message goes here"
        warnText="Warning message goes here"
        onChange={action('onChange')}
        {...args}
      />
    </div>
  );
};

Default.argTypes = { ...sharedArgTypes };
```

**Variant: AllowCustomValue**

```jsx
export const AllowCustomValue = (args) => {
  const filterItems = (menu) => {
    return menu?.item?.toLowerCase().includes(menu?.inputValue?.toLowerCase());
  };
  return (
    <div style={{ width: 300 }}>
      <ComboBox
        allowCustomValue
        shouldFilterItem={filterItems}
        id="carbon-combobox"
        items={['Apple', 'Orange', 'Banana', 'Pineapple', 'Raspberry', 'Lime']}
        titleText="Label"
        helperText="Helper text"
        invalidText="Error message goes here"
        warnText="Warning message goes here"
        {...args}
      />
    </div>
  );
};

AllowCustomValue.argTypes = { ...sharedArgTypes };
```

**Variant: AutocompleteWithTypeahead**

```jsx
export const AutocompleteWithTypeahead = (args) => {
  return (
    <div style={{ width: 300 }}>
      <ComboBox
        helperText="Helper text"
        invalidText="Error message goes here"
        warnText="Warning message goes here"
        id="carbon-combobox"
        items={[
          'Apple',
          'Apricot',
          'Avocado',
          'Banana',
          'Blackberry',
          'Blueberry',
          'Cantaloupe',
        ]}
        titleText="Label"
        {...args}
        typeahead
      />
    </div>
  );
};

AutocompleteWithTypeahead.argTypes = {
  ...sharedArgTypes,
  onChange: { action: 'onChange' },
};
```

**Variant: ExperimentalAutoAlign**

```jsx
export const ExperimentalAutoAlign = (args) => (
  <div style={{ width: 400 }}>
    <div style={{ height: 300 }}></div>
    <ComboBox
      onChange={() => {}}
      id="carbon-combobox"
      invalidText="Error message goes here"
      warnText="Warning message goes here"
      items={items}
      itemToString={(item) => (item ? item.text : '')}
      titleText="Label"
      helperText="Helper text"
      autoAlign={true}
      {...args}
    />
    <div style={{ height: 800 }}></div>
  </div>
);

ExperimentalAutoAlign.argTypes = { ...sharedArgTypes };
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 300 }}>
        <ComboBox
          invalidText="Error message goes here"
          warnText="Warning message goes here"
          onChange={() => {}}
          id={`carbon-combobox-${layer}`}
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          titleText="Label"
          helperText="Helper text"
          {...args}
        />
      </div>
    )}
  </WithLayer>
);

_WithLayer.argTypes = { ...sharedArgTypes };
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => {
  const aiLabel = (
    <AILabel className="ai-label-container">
      <AILabelContent>
        <div>
          <p className="secondary">AI Explained</p>
          <h2 className="ai-label-heading">84%</h2>
          <p className="secondary bold">Confidence score</p>
          <p className="secondary">
            Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed
            do eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
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
  const items = [
    {
      id: 'option-0',
      text: 'An example option that is really long to show what should be done to handle long text',
    },
    {
      id: 'option-1',
      text: 'Option 1',
    },
    {
      id: 'option-2',
      text: 'Option 2',
    },
    {
      id: 'option-3',
      text: 'Option 3',
      disabled: true,
    },
    {
      id: 'option-4',
      text: 'Option 4',
    },
    {
      id: 'option-5',
      text: 'Option 5',
    },
  ];
  return (
    <div style={{ width: 300 }}>
      <ComboBox
        invalidText="Error message goes here"
        warnText="Warning message goes here"
        onChange={action('onChange')}
        id="carbon-combobox"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        titleText="Label"
        helperText="Helper text"
        decorator={aiLabel}
        {...args}
      />
    </div>
  );
};

withAILabel.argTypes = { ...sharedArgTypes };
```

**Variant: Controlled**

```jsx
export const Controlled = (args) => {
  const options = [
    {
      id: 'option-1',
      text: 'Option 1',
    },
    {
      id: 'option-2',
      text: 'Option 2',
    },
    {
      id: 'option-3',
      text: 'Option 3',
    },
  ];
  const [value, setValue] = React.useState(options[0]);
  const onChange = ({ selectedItem }) => {
    setValue(selectedItem);
  };

  return (
    <div>
      <ComboBox
        {...args}
        invalidText="Error message goes here"
        warnText="Warning message goes here"
        onChange={onChange}
        id="carbon-combobox"
        items={options}
        selectedItem={value}
        itemToString={(item) => (item ? item.text : '')}
        titleText="Label"
        helperText="Helper text"
      />
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
        }}>
        <Button onClick={() => setValue(null)}>Clear</Button>
        <Button onClick={() => setValue(options[0])}>Option 1</Button>
        <Button onClick={() => setValue(options[1])}>Option 2</Button>
        <Button onClick={() => setValue(options[2])}>Option 3</Button>
      </div>
    </div>
  );
};

Controlled.argTypes = { ...sharedArgTypes };
```

**Recipe: Disabled** (Carbon does not export a dedicated `Disabled` story for ComboBox — render the `Default` story with the `disabled` arg)

```jsx
<div style={{ width: 300 }}>
  <ComboBox
    id="carbon-combobox"
    items={items}
    itemToString={(item) => (item ? item.text : '')}
    titleText="Label"
    helperText="Helper text"
    disabled
  />
</div>
```

**Recipe: Skeleton** (Carbon ships no `ComboBoxSkeleton`. Reuse `DropdownSkeleton` — same dimensions, animated shimmer)

```jsx
import { DropdownSkeleton } from '@carbon/react';

<div style={{ width: 300 }}>
  <DropdownSkeleton />
</div>
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `combo-box.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `combo-box.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { DROPDOWN_DIRECTION, DROPDOWN_SIZE } from './combo-box';
import './index';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../ai-label/index';
import '../button/index';
import { iconLoader } from '../../globals/internal/icon-loader';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Constants (items, direction, sizes, defaultArgs, controls)**:

```ts
const items = [
  {
    value: 'option-0',
    text: 'An example option that is really long to show what should be done to handle long text',
  },
  {
    value: 'option-1',
    text: 'Option 1',
  },
  {
    value: 'option-2',
    text: 'Option 2',
  },
  {
    value: 'option-3',
    text: 'Option 3',
    disabled: true,
  },
  {
    value: 'option-4',
    text: 'Option 4',
  },
  {
    value: 'option-5',
    text: 'Option 5',
  },
];

const directionOptions = {
  [`Top`]: DROPDOWN_DIRECTION.TOP,
  [`Bottom`]: DROPDOWN_DIRECTION.BOTTOM,
};

const sizes = {
  [`Small size (${DROPDOWN_SIZE.SMALL})`]: DROPDOWN_SIZE.SMALL,
  'Regular size': null,
  [`Large size (${DROPDOWN_SIZE.LARGE})`]: DROPDOWN_SIZE.LARGE,
};

const defaultArgs = {
  direction: DROPDOWN_DIRECTION.BOTTOM,
  autoalign: false,
  allowCustomValue: false,
  disabled: false,
  helperText: 'Helper text',
  invalid: false,
  invalidText: 'Error message goes here',
  label: '',
  readOnly: false,
  size: null,
  titleText: 'Label',
  typeahead: false,
  value: '',
  warn: false,
  warnText: 'Warning message goes here',
  inputProps: undefined,
};

const controls = {
  autoalign: {
    control: 'boolean',
    description:
      'Will auto-align the combo box. This attribute is currently experimental and is subject to future changes.',
  },
  allowCustomValue: {
    control: 'boolean',
    description: `Specify whether or not the ComboBox should allow a value that is not in the list to be entered in the input.`,
  },
  disabled: {
    control: 'boolean',
    description: `Specify if the control should be disabled, or not.`,
  },
  direction: {
    control: 'select',
    options: directionOptions,
    description: `Specify the direction of the combobox dropdown. Can be either top or bottom.`,
  },
  helperText: {
    control: 'text',
    description: `Provide helper text that is used alongside the control label for additional help.`,
  },
  invalid: {
    control: 'boolean',
    description: `Specify if the currently selected value is invalid.`,
  },
  invalidText: {
    control: 'text',
    description: `Message which is displayed if the value is invalid.`,
  },
  inputProps: {
    control: 'object',
    description: `Specify native input attributes to place on the internal input, for example \`{ maxlength: 5, autocomplete: 'off'}\`.`,
  },
  label: {
    control: 'text',
    description: `The default content of the trigger button.`,
  },
  readOnly: {
    control: 'boolean',
    description: `Specify whether or not the component is read-only.`,
  },
  size: {
    control: 'select',
    options: sizes,
    description: `Specify the size of the ListBox. Currently supports either \`sm\`, \`md\` or \`lg\` as an option.`,
  },
  titleText: {
    control: 'text',
    description: `Provide text to be used in a <label> element that is tied to the combobox via ARIA attributes.`,
  },
  typeahead: {
    control: 'boolean',
    description: `**Experimental**: will enable autocomplete and typeahead for the input field.`,
  },
  value: {
    control: 'text',
    description: `The value of the selected item.`,
  },
  warn: {
    control: 'boolean',
    description: `Specify whether the control is currently in warning state.`,
  },
  warnText: {
    control: 'text',
    description: `Provide the text that is displayed when the control is in warning state.`,
  },
};
```

**Variant: Default**

```ts
export const Default = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
    inputProps: {},
  },
  render: (args) => {
    const {
      autoalign,
      allowCustomValue,
      disabled,
      helperText,
      invalid,
      titleText,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <cds-combo-box
        .inputProps=${inputProps}
        ?disabled=${disabled}
        ?autoalign=${autoalign}
        helper-text=${ifDefined(helperText)}
        ?invalid=${invalid}
        invalid-text=${ifDefined(invalidText)}
        direction=${ifDefined(direction)}
        ?read-only=${readOnly}
        ?allow-custom-value=${allowCustomValue}
        title-text=${ifDefined(titleText)}
        size=${ifDefined(size)}
        type=${ifDefined(type)}
        value=${ifDefined(value)}
        label=${ifDefined(label)}
        ?warn=${warn}
        warn-text=${ifDefined(warnText)}
        ?typeahead=${typeahead}>
        ${items.map(
          (elem) => html`
            <cds-combo-box-item ?disabled=${elem.disabled} value="${elem.value}"
              >${elem.text}</cds-combo-box-item
            >
          `
        )}
      </cds-combo-box>
    `;
  },
};
```

**AI label slot content + actions used by `WithAILabel`**:

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
```

**Variant: AllowCustomValue**

```ts
export const AllowCustomValue = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
    allowCustomValue: true,
  },
  render: (args) => {
    const {
      allowCustomValue,
      autoalign,
      disabled,
      helperText,
      invalid,
      titleText,
      hideLabel,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <cds-combo-box
        .inputProps=${inputProps}
        direction=${ifDefined(direction)}
        ?disabled=${disabled}
        ?autoalign=${autoalign}
        helper-text=${ifDefined(helperText)}
        ?hide-label=${hideLabel}
        ?invalid=${invalid}
        invalid-text=${ifDefined(invalidText)}
        ?read-only=${readOnly}
        ?allow-custom-value=${allowCustomValue}
        title-text=${ifDefined(titleText)}
        size=${ifDefined(size)}
        type=${ifDefined(type)}
        value=${ifDefined(value)}
        label=${ifDefined(label)}
        ?warn=${warn}
        warn-text=${ifDefined(warnText)}
        ?typeahead=${typeahead}
        should-filter-item>
        <cds-combo-box-item value="Apple">Apple</cds-combo-box-item>
        <cds-combo-box-item value="Orange">Orange</cds-combo-box-item>
        <cds-combo-box-item value="Banana">Banana</cds-combo-box-item>
        <cds-combo-box-item value="Pineapple">Pineapple</cds-combo-box-item>
        <cds-combo-box-item value="Raspberry">Raspberry</cds-combo-box-item>
        <cds-combo-box-item value="Lime">Lime</cds-combo-box-item>
      </cds-combo-box>
    `;
  },
};
```

**Variant: AutocompleteWithTypeahead**

```ts
export const AutocompleteWithTypeahead = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
    typeahead: true,
  },
  render: (args) => {
    const {
      allowCustomValue,
      autoalign,
      disabled,
      helperText,
      invalid,
      titleText,
      hideLabel,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <cds-combo-box
        .inputProps=${inputProps}
        direction=${ifDefined(direction)}
        ?disabled=${disabled}
        ?autoalign=${autoalign}
        helper-text=${ifDefined(helperText)}
        ?hide-label=${hideLabel}
        ?invalid=${invalid}
        invalid-text=${ifDefined(invalidText)}
        ?read-only=${readOnly}
        ?allow-custom-value=${allowCustomValue}
        title-text=${ifDefined(titleText)}
        size=${ifDefined(size)}
        type=${ifDefined(type)}
        value=${ifDefined(value)}
        label=${ifDefined(label)}
        ?warn=${warn}
        warn-text=${ifDefined(warnText)}
        ?typeahead=${typeahead}>
        <cds-combo-box-item value="apple">Apple</cds-combo-box-item>
        <cds-combo-box-item value="apricot">Apricot</cds-combo-box-item>
        <cds-combo-box-item value="avocado">Avocado</cds-combo-box-item>
        <cds-combo-box-item value="banana">Banana</cds-combo-box-item>
        <cds-combo-box-item value="blackberry">Blackberry</cds-combo-box-item>
        <cds-combo-box-item value="blueberry">Blueberry</cds-combo-box-item>
        <cds-combo-box-item value="cantaloupe">Cantaloupe</cds-combo-box-item>
      </cds-combo-box>
    `;
  },
};
```

**Variant: ExperimentalAutoAlign**

```ts
export const ExperimentalAutoAlign = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    autoalign: true,
    direction: DROPDOWN_DIRECTION.BOTTOM,
    helperText: 'Combobox helper text',
    titleText: 'ComboBox title',
  },
  render: (args) => {
    const {
      autoalign,
      allowCustomValue,
      disabled,
      helperText,
      invalid,
      titleText,
      hideLabel,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <div style="width:400px">
        <div style="height: 300px"></div>
        <cds-combo-box
          .inputProps=${inputProps}
          ?autoalign=${autoalign}
          direction=${ifDefined(direction)}
          ?disabled=${disabled}
          helper-text=${ifDefined(helperText)}
          ?hide-label=${hideLabel}
          ?invalid=${invalid}
          invalid-text=${ifDefined(invalidText)}
          ?read-only=${readOnly}
          ?allow-custom-value=${allowCustomValue}
          title-text=${ifDefined(titleText)}
          size=${ifDefined(size)}
          type=${ifDefined(type)}
          value=${ifDefined(value)}
          label=${ifDefined(label)}
          ?warn=${warn}
          warn-text=${ifDefined(warnText)}
          ?typeahead=${typeahead}>
          ${items.map(
            (elem) => html`
              <cds-combo-box-item
                ?disabled=${elem.disabled}
                value="${elem.value}"
                >${elem.text}</cds-combo-box-item
              >
            `
          )}
        </cds-combo-box>
        <div style="height: 800px"></div>
      </div>
    `;
  },
};
```

**Variant: Controlled**

```ts
export const Controlled = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
    value: 'option-1',
  },
  render: (args) => {
    const {
      autoalign,
      allowCustomValue,
      disabled,
      direction,
      helperText,
      invalid,
      invalidText,
      label,
      readOnly,
      size,
      titleText,
      type,
      typeahead,
      inputProps,
      value,
      warn,
      warnText,
    } = args ?? {};

    const setValue = (nextValue: string) => {
      const comboBox = document.querySelector('cds-combo-box[controlled]') as
        | (HTMLElement & { value: string })
        | null;
      if (comboBox) {
        comboBox.value = nextValue;
      }
    };

    const handleBeforeSelected = (event: CustomEvent) => {
      event.preventDefault();

      const { item } = event?.detail ?? {};
      const nextValue = item?.getAttribute?.('value') ?? item?.value ?? '';

      const comboBox = event.currentTarget as
        | (HTMLElement & { value: string; open: boolean })
        | null;
      if (comboBox) {
        comboBox.value = nextValue;
        comboBox.open = false;
      }
    };

    const handleSelected = (event: CustomEvent) => {
      const { item, value: detailValue } = event?.detail ?? {};
      if (item) return;
      const comboBox = event.currentTarget as
        | (HTMLElement & { value: string })
        | null;
      if (comboBox) {
        comboBox.value = typeof detailValue === 'string' ? detailValue : '';
      }
    };

    return html`
      <cds-combo-box
        .inputProps=${inputProps}
        controlled
        direction=${ifDefined(direction)}
        ?autoalign=${autoalign}
        ?disabled=${disabled}
        helper-text=${ifDefined(helperText)}
        ?invalid=${invalid}
        invalid-text=${ifDefined(invalidText)}
        ?read-only=${readOnly}
        ?allow-custom-value=${allowCustomValue}
        title-text=${ifDefined(titleText)}
        size=${ifDefined(size)}
        type=${ifDefined(type)}
        value=${ifDefined(value)}
        label=${ifDefined(label)}
        ?warn=${warn}
        warn-text=${ifDefined(warnText)}
        ?typeahead=${typeahead}
        @cds-combo-box-beingselected=${handleBeforeSelected}
        @cds-combo-box-selected=${handleSelected}>
        <cds-combo-box-item value="option-1">Option 1</cds-combo-box-item>
        <cds-combo-box-item value="option-2">Option 2</cds-combo-box-item>
        <cds-combo-box-item value="option-3">Option 3</cds-combo-box-item>
      </cds-combo-box>

      <div
        style="display: flex; align-items: center; justify-content: space-between;">
        <cds-button @click=${() => setValue('')}> Clear </cds-button>
        <cds-button @click=${() => setValue('option-1')}> Option 1 </cds-button>
        <cds-button @click=${() => setValue('option-2')}> Option 2 </cds-button>
        <cds-button @click=${() => setValue('option-3')}> Option 3 </cds-button>
      </div>
    `;
  },
};
```

**Variant: WithAILabel**

```ts
export const WithAILabel = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
  },
  render: (args) => {
    const {
      allowCustomValue,
      autoalign,
      disabled,
      helperText,
      invalid,
      titleText,
      hideLabel,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <cds-combo-box
        .inputProps=${inputProps}
        ?disabled=${disabled}
        ?autoalign=${autoalign}
        ?hide-label=${hideLabel}
        helper-text=${ifDefined(helperText)}
        ?invalid=${invalid}
        invalid-text=${ifDefined(invalidText)}
        direction=${ifDefined(direction)}
        ?read-only=${readOnly}
        ?allow-custom-value=${allowCustomValue}
        title-text=${ifDefined(titleText)}
        size=${ifDefined(size)}
        type=${ifDefined(type)}
        value=${ifDefined(value)}
        label=${ifDefined(label)}
        ?warn=${warn}
        warn-text=${ifDefined(warnText)}
        ?typeahead=${typeahead}>
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >

        ${items.map(
          (elem) => html`
            <cds-combo-box-item ?disabled=${elem.disabled} value="${elem.value}"
              >${elem.text}</cds-combo-box-item
            >
          `
        )}
      </cds-combo-box>
    `;
  },
};
```

**Variant: WithLayer**

```ts
export const WithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    titleText: 'Label',
  },
  render: (args) => {
    const {
      allowCustomValue,
      autoalign,
      disabled,
      helperText,
      invalid,
      titleText,
      hideLabel,
      direction,
      readOnly,
      warn,
      warnText,
      size,
      label,
      type,
      invalidText,
      value,
      typeahead,
      inputProps,
    } = args ?? {};
    return html`
      <div style="width:300px">
        <cds-combo-box
          .inputProps=${inputProps}
          direction=${ifDefined(direction)}
          ?autoalign=${autoalign}
          ?disabled=${disabled}
          helper-text=${ifDefined(helperText)}
          ?hide-label=${hideLabel}
          ?invalid=${invalid}
          invalid-text=${ifDefined(invalidText)}
          ?read-only=${readOnly}
          ?allow-custom-value=${allowCustomValue}
          title-text=${ifDefined(titleText)}
          size=${ifDefined(size)}
          type=${ifDefined(type)}
          value=${ifDefined(value)}
          label=${ifDefined(label)}
          ?warn=${warn}
          warn-text=${ifDefined(warnText)}
          ?typeahead=${typeahead}>
          ${items.map(
            (elem) => html`
              <cds-combo-box-item
                ?disabled=${elem.disabled}
                value="${elem.value}"
                >${elem.text}</cds-combo-box-item
              >
            `
          )}
        </cds-combo-box>
      </div>
    `;
  },
};
```

**Storybook meta wrapper** (sets the container width per story):

```ts
const meta = {
  title: 'Components/Combo box',
  decorators: [
    (story, { name }) => {
      const storyName = name.toLowerCase();
      const width =
        !storyName.includes('layer') && !storyName.includes('controlled')
          ? `width:300px`
          : ``;
      return html` <div style="${width}">${story()}</div> `;
    },
  ],
};

export default meta;
```

## Plain HTML (derived from Web Components)

> For hand-coded HTML without a framework, copy the Web Components markup verbatim from the section above — `<cds-combo-box>` and `<cds-combo-box-item>` are real custom elements that render natively once `@carbon/web-components` is loaded via CDN or bundler. The lit-html bindings (`${ifDefined(...)}`, `?disabled=${...}`) resolve to standard HTML attributes (`size="md"`, `disabled`, etc.) that mirror each story's `args` defaults. Default + Disabled + Skeleton + the open-state DOM (the runtime listbox structure Carbon produces internally, which the SCSS in section 9 styles) are reproduced here as standalone references; for every other variant (AllowCustomValue, AutocompleteWithTypeahead, ExperimentalAutoAlign, Controlled, WithAILabel, WithLayer) use the corresponding WC block above and substitute the literal attributes shown in each story's `args`.

**Variant: Default** (`label=""`, `helperText="Helper text"`, no preselected value, menu collapsed)

```html
<div style="width:300px">
  <cds-combo-box
    helper-text="Helper text"
    invalid-text="Error message goes here"
    direction="bottom"
    title-text="Label"
    warn-text="Warning message goes here">
    <cds-combo-box-item value="option-0">An example option that is really long to show what should be done to handle long text</cds-combo-box-item>
    <cds-combo-box-item value="option-1">Option 1</cds-combo-box-item>
    <cds-combo-box-item value="option-2">Option 2</cds-combo-box-item>
    <cds-combo-box-item disabled value="option-3">Option 3</cds-combo-box-item>
    <cds-combo-box-item value="option-4">Option 4</cds-combo-box-item>
    <cds-combo-box-item value="option-5">Option 5</cds-combo-box-item>
  </cds-combo-box>
</div>
```

**Variant: AllowCustomValue** (input accepts values not in the items list)

```html
<div style="width:300px">
  <cds-combo-box
    direction="bottom"
    helper-text="Helper text"
    invalid-text="Error message goes here"
    title-text="Label"
    warn-text="Warning message goes here"
    allow-custom-value
    should-filter-item>
    <cds-combo-box-item value="Apple">Apple</cds-combo-box-item>
    <cds-combo-box-item value="Orange">Orange</cds-combo-box-item>
    <cds-combo-box-item value="Banana">Banana</cds-combo-box-item>
    <cds-combo-box-item value="Pineapple">Pineapple</cds-combo-box-item>
    <cds-combo-box-item value="Raspberry">Raspberry</cds-combo-box-item>
    <cds-combo-box-item value="Lime">Lime</cds-combo-box-item>
  </cds-combo-box>
</div>
```

**Variant: Disabled** (`disabled` attribute on the combo-box element)

```html
<div style="width:300px">
  <cds-combo-box
    disabled
    helper-text="Helper text"
    invalid-text="Error message goes here"
    title-text="Label"
    warn-text="Warning message goes here">
    <cds-combo-box-item value="option-0">An example option that is really long to show what should be done to handle long text</cds-combo-box-item>
    <cds-combo-box-item value="option-1">Option 1</cds-combo-box-item>
    <cds-combo-box-item value="option-2">Option 2</cds-combo-box-item>
    <cds-combo-box-item disabled value="option-3">Option 3</cds-combo-box-item>
    <cds-combo-box-item value="option-4">Option 4</cds-combo-box-item>
    <cds-combo-box-item value="option-5">Option 5</cds-combo-box-item>
  </cds-combo-box>
</div>
```

**Variant: Skeleton** (Carbon ships no `<cds-combo-box-skeleton>` — reuse the dropdown skeleton, dimensions are identical)

```html
<div style="width:300px">
  <cds-dropdown-skeleton></cds-dropdown-skeleton>
</div>
```

**Reference: open-state DOM** (the menu is hidden by default; when the user focuses the input + types or presses the arrow keys, the listbox renders below the input as `<ul role="listbox">` with one `<li role="option">` per item — this is what Carbon produces internally and what the SCSS in section 9 styles)

```html
<div class="cds--list-box__wrapper">
  <label id="combobox-label" class="cds--label">Label</label>
  <div class="cds--combo-box cds--dropdown cds--list-box cds--list-box--md cds--list-box--expanded">
    <div class="cds--list-box__field" role="combobox" aria-expanded="true" aria-owns="combobox-menu" aria-haspopup="listbox">
      <input
        type="text"
        class="cds--text-input cds--combo-box--input--focus"
        autocomplete="off"
        role="combobox"
        aria-autocomplete="list"
        aria-controls="combobox-menu"
        aria-activedescendant="combobox-menu-item-1"
        aria-labelledby="combobox-label"
        id="combobox-input"
        placeholder=""
        value="Op" />
      <div role="button" class="cds--list-box__selection" tabindex="0" title="Clear selected item">
        <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M24 9.4L22.6 8 16 14.6 9.4 8 8 9.4 14.6 16 8 22.6 9.4 24 16 17.4 22.6 24 24 22.6 17.4 16 24 9.4z"></path></svg>
      </div>
      <div class="cds--list-box__menu-icon cds--list-box__menu-icon--open" role="button" tabindex="-1" title="Close menu">
        <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M8 11L3 6 3.7 5.3 8 9.6 12.3 5.3 13 6z"></path></svg>
      </div>
    </div>
    <ul
      id="combobox-menu"
      role="listbox"
      aria-label="Choose an item"
      class="cds--list-box__menu">
      <li role="option" tabindex="-1" aria-selected="false" id="combobox-menu-item-0" class="cds--list-box__menu-item">
        <div class="cds--list-box__menu-item__option">Option 1</div>
      </li>
      <li role="option" tabindex="-1" aria-selected="true" id="combobox-menu-item-1" class="cds--list-box__menu-item cds--list-box__menu-item--active cds--list-box__menu-item--highlighted">
        <div class="cds--list-box__menu-item__option">
          Option 2
          <div class="cds--list-box__menu-item__selected-icon">
            <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M13 24L4 15 5.4143 13.5858 13 21.1716 26.5858 7.5858 28 9z"></path></svg>
          </div>
        </div>
      </li>
      <li role="option" tabindex="-1" aria-selected="false" aria-disabled="true" id="combobox-menu-item-2" class="cds--list-box__menu-item cds--list-box__menu-item--disabled">
        <div class="cds--list-box__menu-item__option">Option 3</div>
      </li>
      <!-- ...remaining options... -->
    </ul>
  </div>
  <div class="cds--form__helper-text">Helper text</div>
</div>
```

**Reference: empty-state DOM** (the input has typed text but no items match the filter — Carbon renders a single non-selectable row with the `"No matching results"` copy; the copy itself is translation-keyed so locales can override it via `translateWithId`)

```html
<ul id="combobox-menu" role="listbox" aria-label="Choose an item" class="cds--list-box__menu">
  <li role="option" tabindex="-1" aria-selected="false" class="cds--list-box__menu-item">
    <div class="cds--list-box__menu-item__option">No matching results</div>
  </li>
</ul>
```

## Design Tokens (component-scoped)

These tokens resolve the semantic Carbon tokens used by `_combo-box.scss` (a thin delta on top of `_list-box.scss` + `_text-input.scss` + `_dropdown.scss`) — `$field`, `$field-02`, `$field-hover`, `$layer`, `$layer-hover`, `$layer-selected`, `$layer-selected-hover`, `$border-strong`, `$border-subtle`, `$text-primary`, `$text-secondary`, `$text-placeholder`, `$text-disabled`, `$text-helper`, `$icon-primary`, `$icon-disabled`, `$support-error`, `$support-warning`, `$focus` — to literal hex values for both default themes.

```css
[data-theme="white"] {
  /* Editable input field */
  --cds-combo-box-input-background: #f4f4f4;             /* field-01 */
  --cds-combo-box-input-background-hover: #e8e8e8;       /* field-hover-01 — Carbon collapses to $field while open */
  --cds-combo-box-input-background-light: #ffffff;       /* field-02 (--light variant) */
  --cds-combo-box-input-background-light-hover: #ffffff; /* Carbon explicitly suppresses hover on the light variant */
  --cds-combo-box-input-text: #161616;                   /* text-primary */
  --cds-combo-box-input-placeholder: #a8a8a8;            /* text-placeholder */
  --cds-combo-box-input-border-rest: #8d8d8d;            /* border-strong-01 (1px bottom) */
  --cds-combo-box-input-border-open: #c6c6c6;            /* border-subtle (1px bottom while menu open) */
  --cds-combo-box-input-border-readonly: #c6c6c6;        /* border-subtle (1px bottom while readonly) */
  --cds-combo-box-input-border-disabled: transparent;    /* border-block-end cleared */
  --cds-combo-box-input-text-disabled: rgba(22, 22, 22, 0.25); /* text-disabled */

  /* Icons (chevron + clear) */
  --cds-combo-box-icon: #161616;                         /* icon-primary */
  --cds-combo-box-icon-disabled: rgba(22, 22, 22, 0.25); /* icon-disabled — also used for read-only */

  /* Menu surface */
  --cds-combo-box-menu-background: #f4f4f4;              /* layer-01 */
  --cds-combo-box-menu-divider: #c6c6c6;                 /* border-subtle-01 (between items) */
  --cds-combo-box-menu-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.20); /* box-shadow utility */

  /* Menu items */
  --cds-combo-box-item-text: #525252;                    /* text-secondary (link rest) */
  --cds-combo-box-item-text-hover: #161616;              /* text-primary */
  --cds-combo-box-item-background-hover: #e8e8e8;        /* layer-hover-01 */
  --cds-combo-box-item-background-highlighted: #e0e0e0;  /* layer-selected-01 */
  --cds-combo-box-item-background-highlighted-hover: #cacaca; /* layer-selected-hover-01 */
  --cds-combo-box-item-text-highlighted: #161616;        /* text-primary */
  --cds-combo-box-item-text-disabled: rgba(22, 22, 22, 0.25);

  /* Helper / validation */
  --cds-combo-box-text-helper: #6f6f6f;                  /* text-helper */
  --cds-combo-box-text-error: #da1e28;                   /* text-error */
  --cds-combo-box-icon-error: #da1e28;                   /* support-error */
  --cds-combo-box-icon-warning: #f1c21b;                 /* support-warning */

  /* Focus */
  --cds-combo-box-focus: #0f62fe;                        /* focus */
  --cds-combo-box-focus-inset: #ffffff;                  /* focus-inset (background colour for the 1px inner ring) */
}

[data-theme="g100"],
.dark {
  /* Editable input field */
  --cds-combo-box-input-background: #262626;             /* field-01 */
  --cds-combo-box-input-background-hover: #333333;       /* field-hover-01 */
  --cds-combo-box-input-background-light: #393939;       /* field-02 */
  --cds-combo-box-input-background-light-hover: #393939; /* Carbon suppresses hover on the light variant */
  --cds-combo-box-input-text: #f4f4f4;                   /* text-primary */
  --cds-combo-box-input-placeholder: #6f6f6f;            /* text-placeholder */
  --cds-combo-box-input-border-rest: #6f6f6f;            /* border-strong-01 */
  --cds-combo-box-input-border-open: #525252;            /* border-subtle */
  --cds-combo-box-input-border-readonly: #525252;        /* border-subtle */
  --cds-combo-box-input-border-disabled: transparent;
  --cds-combo-box-input-text-disabled: rgba(244, 244, 244, 0.25);

  /* Icons */
  --cds-combo-box-icon: #f4f4f4;                         /* icon-primary */
  --cds-combo-box-icon-disabled: rgba(244, 244, 244, 0.25);

  /* Menu surface */
  --cds-combo-box-menu-background: #262626;              /* layer-01 */
  --cds-combo-box-menu-divider: #525252;                 /* border-subtle-01 */
  --cds-combo-box-menu-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.50); /* box-shadow utility */

  /* Menu items */
  --cds-combo-box-item-text: #c6c6c6;                    /* text-secondary */
  --cds-combo-box-item-text-hover: #f4f4f4;              /* text-primary */
  --cds-combo-box-item-background-hover: #333333;        /* layer-hover-01 */
  --cds-combo-box-item-background-highlighted: #393939;  /* layer-selected-01 */
  --cds-combo-box-item-background-highlighted-hover: #474747; /* layer-selected-hover-01 */
  --cds-combo-box-item-text-highlighted: #f4f4f4;        /* text-primary */
  --cds-combo-box-item-text-disabled: rgba(244, 244, 244, 0.25);

  /* Helper / validation */
  --cds-combo-box-text-helper: #c6c6c6;                  /* text-helper */
  --cds-combo-box-text-error: #ff8389;                   /* text-error */
  --cds-combo-box-icon-error: #fa4d56;                   /* support-error */
  --cds-combo-box-icon-warning: #f1c21b;                 /* support-warning */

  /* Focus — pure white in dark themes */
  --cds-combo-box-focus: #ffffff;                        /* focus */
  --cds-combo-box-focus-inset: #161616;                  /* focus-inset */
}
```

## States Reference (from .scss)

> Values pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/combo-box/_combo-box.scss` — combined with the inherited rules from `_list-box.scss`, `_text-input.scss`, and `_dropdown.scss`. The combo-box-only SCSS file is intentionally tiny (94 lines): it defines the input hover, the first-item highlight ring, the open-state border swap, the read-only treatment, and the IE/Edge clear-button reset. Everything else is inherited.

### Editable input (`.cds--combo-box .cds--text-input`)

| State | Background | Text color | Border-block-end | Other |
|---|---|---|---|---|
| Rest | `#f4f4f4` (`$field`) | `#161616` (`$text-primary`) | `1px solid #8d8d8d` (`$border-strong`, inherited from `text-input.scss`) | `block-size: 40px` (md); `padding: 0 16px`; `cursor: text`; native IE clear button hidden via `.cds--text-input::-ms-clear { display: none }` |
| Hover | `#f4f4f4` (`$field` — Carbon's `_combo-box.scss` line 18 explicitly sets `.cds--combo-box:hover { background-color: $field; }`, which OVERRIDES the inherited `$field-hover` from `text-input.scss`. Net: combo-box has NO visible hover background swap) | `#161616` | `1px solid #8d8d8d` | — |
| Light variant hover | `#ffffff` (`$field-02` — `.cds--combo-box.cds--list-box--light:hover { background-color: $field-02; }`) | `#161616` | `1px solid #8d8d8d` | Marked "V11: Possibly deprecate" in the source — still ships in `main` |
| Open (menu expanded) | `#f4f4f4` (`$field`) | `#161616` | `1px solid #c6c6c6` (`$border-subtle`) — see SCSS rule on `.cds--combo-box.cds--list-box--expanded .cds--text-input { border-block-end-color: $border-subtle; }` | Chevron rotates `-180deg`; menu visible below |
| Focus-visible (menu closed) | `#f4f4f4` | `#161616` | `1px solid #8d8d8d` | `outline: 2px solid #0f62fe` via `.cds--combo-box--input--focus.cds--text-input { @include focus-outline('outline'); }` (full 2px ring sits on top of the input) |
| Focus-visible (menu open + active descendant on a menu item) | `#f4f4f4` | `#161616` | `1px solid #c6c6c6` | `outline-width: 1px; outline-offset: -1px` — Carbon collapses the input ring to a 1px inset so the highlight on the listbox item reads as the primary focus indicator. Selector: `.cds--combo-box.cds--list-box--expanded:has(input[aria-activedescendant]:not([aria-activedescendant=""])) .cds--combo-box--input--focus.cds--text-input` |
| Invalid | `#f4f4f4` | `#161616` | `2px solid #da1e28` (`$support-error`) via `focus-outline('invalid')` | Trigger text `padding-inline-end: 56px`; error icon at `inset-inline-end: spacing-08` (`32px`) |
| Warn | `#f4f4f4` | `#161616` | `1px solid #f1c21b` (`$support-warning`) | Warning triangle icon at `inset-inline-end: spacing-08` |
| Disabled | `#f4f4f4` (`$field` — hover suppressed) | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | `1px solid transparent` | Chevron + clear icons get `fill: $icon-disabled`; cursor: `not-allowed` |
| Read-only | `transparent` (`.cds--combo-box--readonly { background-color: transparent; }` + `.cds--combo-box--readonly:hover { background-color: transparent; }`) | `#161616` | `1px solid #c6c6c6` (`$border-subtle` via `.cds--combo-box--readonly .cds--text-input { border-block-end-color: $border-subtle; }`) | Chevron + clear icons: `cursor: default`; `fill: $icon-disabled` (both `$icon-disabled` per the SCSS) |

### Field padding (the `.cds--list-box__field` wrapper inside combo-box)

Carbon zeroes the inner field padding for the combo-box variant — the editable `<input>` carries the padding instead. The relevant rule (lines 63-73 of `_combo-box.scss`):

```scss
.cds--combo-box .cds--list-box__field,
.cds--combo-box.cds--list-box[data-invalid] .cds--list-box__field,
.cds--combo-box.cds--list-box--warning .cds--list-box__field,
.cds--combo-box.cds--list-box--disabled.cds--list-box[data-invalid] .cds--list-box__field,
.cds--combo-box.cds--list-box--disabled.cds--list-box--warning .cds--list-box__field {
  padding: 0;
}
```

| State | `.cds--list-box__field` padding |
|---|---|
| Rest | `0` |
| Invalid | `0` |
| Warn | `0` |
| Disabled + invalid | `0` |
| Disabled + warn | `0` |

(All other Carbon list-box variants — Dropdown, Select, MultiSelect — keep the default `padding: 0 var(--cds-spacing-05)` on `.cds--list-box__field`. ComboBox is the exception.)

### Menu (`.cds--list-box__menu`)

Menu styling is inherited verbatim from `_list-box.scss` — no combo-box-specific overrides. Values shown below for reference.

| State | Background | Notes |
|---|---|---|
| Closed (default) | `$layer` | `max-block-size: 0`; items have `visibility: hidden; opacity: 0` |
| Open (md) | `#f4f4f4` (`$layer`) | `max-block-size: 220px` (40px × 5.5); transition `max-height $duration-fast-02 motion(entrance, productive)` (110ms) |
| Open (sm) | `#f4f4f4` | `max-block-size: 176px` (32px × 5.5) |
| Position (default) | — | `position: absolute; z-index: z('dropdown')`; `inset-block-start: 100%` (under input) |
| Position (`--up`) | — | `inset-block-end: 2rem` (above input); set by `direction="top"` and the auto-align logic |
| Shadow | — | `box-shadow` utility — `0 2px 6px 0 rgba(0, 0, 0, 0.20)` (light) / `rgba(0, 0, 0, 0.50)` (dark) |

### Menu item (`.cds--list-box__menu-item`)

| State | Background | Text color | Border-block-start | Other |
|---|---|---|---|---|
| Rest (md) | (inherits menu) `#f4f4f4` | `#525252` (`$text-secondary`) | `1px solid #c6c6c6` (`$border-subtle` divider above link) | `block-size: 40px`; `padding: 11px 0`; `margin: 0 16px`; `opacity: 0` while menu closed, `1` while open |
| Rest (sm) | (inherits menu) | `#525252` | `1px solid #c6c6c6` | `block-size: 32px`; `padding-block: 7px 7px` |
| Hover | `#e8e8e8` (`$layer-hover`) | `#161616` (`$text-primary`) | `transparent` | `border-block-end-color: $layer-hover` on the hovered link; sibling row's top border collapses |
| Highlighted (`.cds--list-box__menu-item--highlighted`, set as keyboard moves through items) | `#e0e0e0` (`$layer-selected`) | `#161616` | `transparent` | Default focus styling — no extra outline (because `aria-activedescendant` tracks focus on the input) |
| Highlighted — first item | `#e0e0e0` | `#161616` | (handled by override) | Carbon adds an explicit `border: 2px solid var(--cds-focus)` ring on the first item so the focus ring isn't clipped by the input's bottom border. Source: `_combo-box.scss` lines 22-30 — `.cds--combo-box .cds--list-box__menu-item:first-child.cds--list-box__menu-item--highlighted::before { position: absolute; border: 2px solid $focus; block-size: 100%; border-block-start: 1px solid $focus; content: ''; inline-size: 100%; }`. The same selector also resets the inherited focus outline via `@include focus-outline('reset')` so it doesn't double up. |
| Highlighted + hover | `#cacaca` (`$layer-selected-hover`) | `#161616` | `transparent` | — |
| Active (`:active`) | `#e0e0e0` (`$layer-selected`) | `#161616` | `transparent` | (Suppressed inside lists with `aria-activedescendant` so only the highlighted row reads as selected) |
| Disabled item (`disabled` flag on `<cds-combo-box-item>`) | (inherits menu) | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | (inherits) | `cursor: not-allowed`; `aria-disabled="true"`; not interactive |
| Empty state ("No matching results") | (inherits menu) | `#525252` (`$text-secondary`) | `transparent` | Single non-interactive row; copy is translatable via `translateWithId` |

### Chevron + clear-selection icons (`.cds--list-box__menu-icon`, `.cds--list-box__selection`)

Inherited from `_list-box.scss` — combo-box-specific overrides only set `cursor: default` + `fill: $icon-disabled` while read-only.

| State | Fill | Position | Transform | Cursor |
|---|---|---|---|---|
| Chevron — rest (md) | `#161616` (`$icon-primary`) | `inset-block-start: 13px; inset-inline-end: 16px` | `none` | `pointer` |
| Chevron — rest (sm) | `#161616` | `inset-block-start: 8px; inset-inline-end: 16px` | `none` | `pointer` |
| Chevron — rest (lg) | `#161616` | `inset-block-start: 16px; inset-inline-end: 16px` | `none` | `pointer` |
| Chevron — open | (inherits) | (inherits) | `rotate(-180deg)` | `pointer` |
| Chevron — disabled | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`) | (inherits) | (inherits) | `not-allowed` |
| Chevron — read-only | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`, per `_combo-box.scss` lines 90-93) | (inherits) | (inherits) | `default` (per `_combo-box.scss` lines 85-88) |
| Clear icon (`.cds--list-box__selection`) — rest (visible only when input has a value) | `#161616` (`$icon-primary`) | absolutely positioned to the LEFT of the chevron (`inset-inline-end: 32px` md) | `none` | `pointer` |
| Clear icon — disabled | `rgba(22, 22, 22, 0.25)` | (inherits) | (inherits) | `not-allowed` |
| Clear icon — read-only | `rgba(22, 22, 22, 0.25)` | (inherits) | (inherits) | `default` |
| Transition | — | — | `transform var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` | — |

## Animation & Motion

Combo-box uses the same motion tokens as Dropdown — Carbon's `_combo-box.scss` declares no transitions of its own; everything is inherited from `_list-box.scss`, `_text-input.scss`, and `_dropdown.scss`. The relevant inherited transitions:

```css
.cds--combo-box .cds--text-input {
  /* From text-input.scss */
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard), /* 70ms */
    outline           var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

.cds--combo-box .cds--list-box__menu-icon {
  /* Chevron rotation (from list-box.scss) */
  transition: transform var(--cds-duration-fast-02) var(--cds-easing-productive-standard); /* 110ms */
}

.cds--combo-box .cds--list-box__menu {
  /* Menu open/close — inherited from list-box.scss */
  transition: max-height var(--cds-duration-fast-02) var(--cds-easing-productive-standard); /* 110ms */
}

.cds--combo-box.cds--list-box--expanded .cds--list-box__menu {
  /* When fully open: re-applies the same property with the entrance easing for the open feel */
  transition: max-height var(--cds-duration-fast-02) var(--cds-easing-productive-entrance); /* 110ms — expressive entrance curve */
}

.cds--combo-box .cds--list-box__menu-item {
  /* Item visibility/opacity/background swap */
  transition:
    visibility       var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    opacity          var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard); /* 70ms each */
}

@media (prefers-reduced-motion: reduce) {
  .cds--combo-box .cds--text-input,
  .cds--combo-box .cds--list-box__menu-icon,
  .cds--combo-box .cds--list-box__menu,
  .cds--combo-box .cds--list-box__menu-item {
    transition: none;
  }
}
```

**Token resolution** (from `overview.md`):
- `--cds-duration-fast-01` = `70ms`
- `--cds-duration-fast-02` = `110ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`
- `--cds-easing-productive-entrance` = `cubic-bezier(0, 0, 0.38, 0.9)` (asymmetric — slower out, faster in; reads as "expressive" arrival)

**Sequence of an open animation:**
1. User focuses the input (`Tab` or click) — input gains the 2px focus ring (70ms `outline` transition).
2. User types a character (or presses `Down Arrow`) — Carbon opens the menu and runs the filter callback against `items`.
3. `.cds--combo-box.cds--list-box--expanded` is toggled on the wrapper → `border-block-end-color` swaps from `$border-strong` (`#8d8d8d` light) to `$border-subtle` (`#c6c6c6` light) instantly.
4. `.cds--list-box__menu-icon` chevron rotates `-180deg` over 110ms (productive standard curve).
5. `.cds--list-box__menu` `max-block-size` animates `0 → 220px` over 110ms (productive entrance curve — slower at start, faster at end).
6. Each `.cds--list-box__menu-item` transitions `opacity 0 → 1` and `visibility hidden → inherit` over 70ms (productive standard curve).
7. The first matching item gains `cds--list-box__menu-item--highlighted` and the input's `aria-activedescendant` points at its `id`.
8. As the user types more characters, items not matching the filter are removed from the DOM (Carbon's React component re-renders the list); the highlighted item index resets.
9. On `Enter` / item click, Carbon fires `onChange` (`cds-combo-box-selected` in WC), populates the input with the item's stringified value, closes the menu, and the chevron animates back to `0deg`.

## Accessibility (from Carbon's docs + source)

**Semantic structure** (the runtime DOM Carbon's React component renders, mirrored by the WC implementation):

- `<div class="cds--list-box__field" role="combobox" aria-haspopup="listbox" aria-expanded={open} aria-owns={listboxId}>` — the field wrapper.
- `<input type="text" role="combobox" aria-autocomplete="list" aria-controls={listboxId} aria-activedescendant={highlightedItemId} aria-labelledby={labelId} autocomplete="off">` — the editable input. ComboBox is the only Carbon list-box variant where the focusable element is an `<input>` (Dropdown / Select use `<button>`).
- `<div role="button" class="cds--list-box__selection" tabindex="0" title="Clear selected item">` — the clear-selection icon. Visible whenever the input has a value.
- `<div role="button" class="cds--list-box__menu-icon" tabindex="-1" title="Open/Close menu">` — the chevron icon. Click toggles the menu; the icon is not in the tab order (the input handles keyboard interaction).
- `<ul role="listbox" aria-label="…">` — the menu, mounted as a sibling of the field inside `.cds--combo-box` (or portalled via `autoAlign`).
- `<li role="option" tabindex="-1" aria-selected={isHighlighted} aria-disabled={disabled}>` — each item; `tabindex` stays `-1` because the input keeps DOM focus and the listbox tracks the highlighted row via `aria-activedescendant`.
- The `cds--list-box__menu-item__selected-icon` (Checkmark16) is rendered for the highlighted option only. It carries `aria-hidden="true"` since the visual indicator duplicates the `aria-selected` state.

**ARIA attributes Carbon's source applies:**

- Field: `role="combobox"`, `aria-haspopup="listbox"`, `aria-expanded`, `aria-owns` (points at the listbox `id`).
- Input: `role="combobox"` (yes, both the field wrapper and the input carry the role — Carbon mirrors W3C ARIA 1.2 combobox pattern), `aria-autocomplete="list"` (or `"both"` when `typeahead`), `aria-controls` (listbox id), `aria-activedescendant` (currently-highlighted option id), `aria-labelledby` (binds `<label for>` to the title-text + the current value), `aria-describedby` for helper / invalid / warn text, `autocomplete="off"` (disables the browser's native autofill so it doesn't conflict with the menu).
- Listbox: `role="listbox"`, `aria-label` (defaults to the `label` prop / "Choose an item"), `aria-multiselectable="false"`.
- Options: `role="option"`, `aria-selected`, optional `aria-disabled`.
- Invalid state adds `aria-invalid="true"` to the input; the invalid-text container has `id` referenced by `aria-describedby`.
- Clear button: `role="button"`, `tabindex="0"`, `title="Clear selected item"`, `aria-label="Clear selected item"`.

**Keyboard interaction** (Carbon's source delegates to Downshift's `useCombobox` reducer for React; the WC implementation re-implements the same model):

| Key | Action |
|---|---|
| `Tab` | Move focus to / from the input (the listbox itself is never focused; the clear button is in the tab order after the input) |
| `Type` (any printable character) | Filters the menu items by `shouldFilterItem` (default: case-insensitive substring match against `itemToString(item)`); opens the menu if closed |
| `Down Arrow` | Open the menu (if closed) and highlight the first option, OR move highlight down by one |
| `Up Arrow` | Move highlight up by one (does not loop past the first item); opens menu if closed |
| `Home` | Highlight the first option |
| `End` | Highlight the last option |
| `Enter` | Select the highlighted item (populates the input with the stringified value) and close the menu. With `allowCustomValue` and no highlighted item, accepts the typed string as the value. |
| `Escape` | Close the menu without changing selection; focus stays on the input. Press `Escape` a second time with no menu open → clears the input. |
| `Backspace` / `Delete` | Edit the typed text — re-runs the filter |

**Touch target:** Default input is `40px` (`md`) / `48px` (`lg`) — both meet the 44px WCAG 2.5.5 target on `lg` and the `40px` industry-standard floor on `md`. For mobile-first product UI prefer `size="lg"` to clear 44px. The `sm` (`32px`) variant is reserved for high-density desktop tables / toolbars and should not be used for primary touch surfaces. The clear button on the right of the input is a `24px` square hit area at md — it does NOT clear 44px on its own; use `size="lg"` if the clear interaction is a primary use case on mobile.

**Focus management:**

- The Carbon `focus-outline('outline')` mixin paints a `2px solid var(--cds-focus)` ring on the inner `.cds--combo-box--input--focus.cds--text-input` (light themes: `#0f62fe`, dark themes: `#ffffff`).
- While the menu is open AND a menu item is highlighted (input has a non-empty `aria-activedescendant`), Carbon collapses the input ring to `outline-width: 1px; outline-offset: -1px` so the highlighted-item background reads as the primary focus indicator. Do NOT remove either rule.
- The first menu item gets a special `::before` pseudo-element ring (2px solid focus colour) when it's the highlighted item — Carbon adds this because the input's bottom border would otherwise clip the item's focus ring (the input and the menu sit flush against each other).
- When the menu closes (Escape, Enter on empty, or click outside), focus stays on the input.
- The invalid state colors the bottom border `var(--cds-support-error)` and replaces the focus ring with the invalid focus ring via `focus-outline('invalid')`.

**Screen-reader announcements:**

- On open: SR announces "expanded, list of {n} items".
- On highlight change: SR announces the highlighted option's text + its position ("Option 1, 2 of 6"). Carbon uses Downshift's a11y messages, which include the count after each filter.
- On selection: SR announces the selected option's text. If the input has `helperText`, helper content is also announced because of `aria-describedby`.
- On no matches: SR announces "No matching results" (the menu's single non-selectable row is announced as a regular option for the count).
- On clear: SR announces "Selection cleared".

**Windows High Contrast Mode (HCM):** Carbon's `_list-box.scss` (inherited) runs the field through a `high-contrast-mode('outline')` mixin so the input gains a system `WindowText` outline; menu items clear their hover outlines (`outline: none`) to avoid double rings.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — the verbatim React / WC blocks above are the source of truth | Don't paraphrase, "modernize", or rewrite the source — the Carbon library is the design spec |
| Use `<ComboBox>` from `@carbon/react` or `<cds-combo-box>` from `@carbon/web-components` | Don't substitute a native `<input list>` + `<datalist>` — the styling, filtering, and a11y wiring won't match Carbon and the menu cannot be themed cross-browser |
| Provide `itemToString={(item) => item ? item.text : ''}` whenever items are objects (not strings) — the input shows the stringified value | Don't pass mixed item shapes (some strings, some objects) to a single ComboBox — write two ComboBoxes or normalize the array first |
| Provide a custom `shouldFilterItem` callback if you need fuzzy / token / abbreviation matching — Carbon's default is case-insensitive substring match against `itemToString` | Don't try to filter the items array yourself outside the component (`items={items.filter(…)}`) — Carbon re-renders on every keystroke and your filter will race the controlled value |
| Use `allowCustomValue` whenever the user might submit a value not in the items list (tagging, free-text autocomplete) | Don't enable `allowCustomValue` on enums where only the listed values are valid — the helper / validation copy then has to handle the "what does this typed string mean" case manually |
| Use `typeahead` (experimental) for type-to-complete UX — Carbon completes the input with the longest-matching item suggestion as the user types | Don't combine `typeahead` + `allowCustomValue` — the autocomplete preview will fight the freeform input; pick one model |
| Keep the bottom-border-only treatment on the default input — it's Carbon's signature form-field style | Don't add a full border, rounded corners, or a drop shadow on the input — Carbon is sharp + flat |
| Keep `border-radius: 0` on every combo-box surface (input + menu + items) — Carbon's design language is unambiguously sharp-cornered | Don't add `border-radius` — Carbon combo-boxes are sharp-cornered by default; any rounding (even `2px`) reads as off-brand |
| Use `[data-theme="white"]` / `[data-theme="g100"]` (or pair with `.dark`) to scope themes | Don't define your own theme classes — Carbon's tokens are namespaced under `--cds-*` and the data-theme selectors are required for the cascade |
| Provide `helperText` for any non-obvious combo-box so screen readers get context via `aria-describedby` | Don't replace `helperText` with placeholder copy — `placeholder` disappears the moment the user types, helper text persists |
| Use `invalid` + `invalidText` together — they pair via `aria-describedby` and `aria-invalid` | Don't toggle `invalid` without `invalidText` — the support icon will appear with no announcement for SRs |
| Use the `_WithLayer` / `WithLayer` patterns when nesting combo-boxes inside cards or panels — the `field-01 → 02 → 03` and `layer-01 → 02 → 03` swaps are designed to keep contrast across nesting | Don't override `--cds-field-*` per-instance — let the surrounding `<Layer>` decorator (or `<cds-layer>` in WC) control the tier |
| Keep the chevron's `transform: rotate(-180deg)` on open — it's part of Carbon's affordance vocabulary | Don't replace the chevron with a search icon — that signals "this is a Search component, not a ComboBox"; if you want a search-first UX use `<Search>` instead |
| Show the `cds--list-box__selection` (clear) icon whenever the input has a value — Carbon ships it because users need a way to clear without manually backspacing | Don't hide the clear icon — losing it forces keyboard-only users into a `Cmd+A → Delete` ritual |
| Wrap the input in a fixed-width container (Storybook uses `300px` for default + skeleton, `400px` for auto-align) when laying out forms | Don't make the input `width: auto` — Carbon defaults to `inline-size: 100%` and that's what every story relies on; `auto` produces a 0-width flash on mount |
| Use `size="lg"` (`48px`) on touch primary surfaces; `size="md"` (`40px`) is the default; reserve `size="sm"` (`32px`) for desktop density | Don't go below `sm` (`32px`) — Carbon does not ship a smaller variant and shrinking the input breaks the type-style + touch-target alignment |
| When using `withAILabel`, decorate the input with an `<AILabel>` so the input's background picks up the aiAura gradient (`--cds-ai-aura-*` tokens) | Don't put an `<AILabel>` on a combo-box that doesn't actually use AI — the aura gradient is a meaningful affordance, not decoration |
| Reuse `<DropdownSkeleton />` (`<cds-dropdown-skeleton>`) for the loading state — Carbon ships no `ComboBoxSkeleton` because the dimensions match | Don't render a `<TextInputSkeleton />` instead — it's the same height but lacks the chevron column, which makes the layout shift on load |
| Ship the empty-state copy ("No matching results") in your locale via `translateWithId` for non-English locales | Don't hard-code English fallback in the rendered DOM — Carbon's `translateWithId` is the integration point for i18n |
| Respect `prefers-reduced-motion` — Carbon's source disables every combo-box transition under the media query | Don't re-implement the open animation with custom keyframes — the Carbon transitions are tuned to the productive motion token system |
