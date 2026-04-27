---
name: select
description: Carbon Select — native HTML `<select>` styled to match Carbon text-input (bottom-only border, sharp corners, 32/40/48 heights). Variants from Storybook — Default, Inline, Skeleton, _WithLayer, withAILabel (React); Default, Inline, Skeleton, WithAILabel, WithLayer (WC). Wraps `<option>` via SelectItem and `<optgroup>` via SelectItemGroup.
metadata:
  tags: select, dropdown, native-select, form, inline, skeleton, ai-label, layer, ibm, carbon, react, web-components
---

# Select -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Select.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Select/Select.stories.js)
> - **WC story:** [`select.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/select/select.stories.ts)
> - **SCSS source (canonical):** [`packages/styles/scss/components/select/_select.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/select/_select.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-select--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-select--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/select/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Underlying element | Native `<select>` (Carbon styles it; the chevron and label are siblings) |
| Heights (sm / md / lg) | `32px` / `40px` / `48px` (matches text-input) |
| Padding-inline (md / lg) | `padding-inline: 16px 48px` (`spacing-05` left, `spacing-09` right — leaves room for the chevron at `spacing-05` from the right edge) |
| Padding-inline (sm) | Inherits md padding (`spacing-05 / spacing-09`); only the block-size shrinks |
| Padding-inline-end (with invalid OR warn icon) | `64px` (`spacing-10`) — adds room for the validation icon at `spacing-08` (40px) from the right edge |
| Padding-inline-end (inline + invalid) | `56px` (`3.5rem`) — chevron at `spacing-03` (8px), invalid icon at `spacing-07` (32px) |
| Inline variant: padding-inline | `padding-inline: 8px 48px` (`spacing-03` left, `spacing-09` right) |
| Caret icon | `chevron-down` 16px (`@carbon/icons` 16px set) — positioned absolute, `inset-inline-end: 16px` (`spacing-05`); inline variant moves it to `inset-inline-end: 8px` (`spacing-03`) |
| Caret fill | `var(--cds-icon-primary)` — White: `#161616`, G100: `#f4f4f4`; disabled fades to `var(--cds-icon-disabled)` |
| Corner radius | `0` (Carbon: sharp by default — `border-radius: 0` is set explicitly in `_select.scss`) |
| Border treatment | **Bottom-only**: `border-block-end: 1px solid var(--cds-border-strong-01)` — no top/left/right border on rest. Inline variant has NO bottom border (`border-block-end: none`). |
| Background (White theme, `field`) | `#f4f4f4` (`field-01`) |
| Background (G100 theme, `field`) | `#393939` (`field-01`) |
| Background (inline variant) | `transparent` on rest; `var(--cds-field-hover)` on hover; `var(--cds-background)` on focus |
| Border-strong (White) | `#8d8d8d` (`border-strong-01`) |
| Border-strong (G100) | `#a8a8a8` (`border-strong-01`) |
| Focus ring | Bottom border becomes `2px solid var(--cds-focus)` plus `outline: 2px solid var(--cds-focus); outline-offset: -2px` (Carbon's `focus-outline('outline')` mixin) |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` (icon positioned at `inset-inline-end: 40px` / `spacing-08`) |
| Warning icon | `var(--cds-support-warning)` `#f1c21b` (both themes) — note: the warning triangle's interior `path[fill]` is overridden to `var(--cds-black-100)` (`#000000`) with `opacity: 1` |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Disabled text color | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Disabled bottom border | `transparent` (border is hidden, NOT colored — distinct from Read-only which uses `border-subtle`) |
| Read-only bottom border | `var(--cds-border-subtle)` — White: `#c6c6c6`, G100: `#6f6f6f` |
| Read-only background | `transparent` |
| Skeleton block-size | `2.5rem` (40px — matches `md`) |
| Option / optgroup background | `var(--cds-layer-hover)` — used as fallback for IE11; modern browsers render the native popover via OS chrome |
| Font | IBM Plex Sans, body-compact-01 (input value), label-01 (label above), helper-text-01 (helper / invalid / warn text) |
| Transition | `outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70ms / cubic-bezier(0.2, 0, 0.38, 0.9)) |
| AI-label / decorator slot offset | `inset-inline-end: calc(var(--cds-spacing-08) + 8px + 1px)` — i.e. `49px` from right; `transform: translateY(-50%)` to vertically center; padding-inline-end of the input grows to `spacing-10` (64px) when slot is present, or `spacing-12` (96px) when both validation icon AND slot are present |
| React import | `import { Select, SelectItem, SelectItemGroup, SelectSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/select/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `Select.stories.js` | Standard select with label above + helper text below; chevron caret on the right. |
| Inline | `Inline` | `Select.stories.js` | Label sits on the same row as the select; no bottom border, transparent background. For dense rows / toolbar contexts. |
| Skeleton | `Skeleton` | `Select.stories.js` | `<SelectSkeleton>` placeholder while content loads — fixed `2.5rem` height, no inner input rendered. |
| _WithLayer | `_WithLayer` | `Select.stories.js` | Demonstrates `field-01 / 02 / 03` token swap across nested `<Layer>` contexts. |
| withAILabel | `withAILabel` | `Select.stories.js` | Embeds an `<AILabel>` decorator with aiAura gradient background; padding-inline-end grows to make room. |
| WC: Default | `Default` | `select.stories.ts` | `<cds-select>` renders an `<option>`-list inside `<cds-form-item>`. |
| WC: Inline | `Inline` | `select.stories.ts` | Inline variant via `?inline="true"`. |
| WC: Skeleton | `Skeleton` | `select.stories.ts` | `<cds-select-skeleton>` placeholder. |
| WC: WithAILabel | `WithAILabel` | `select.stories.ts` | Slots `<cds-ai-label alignment="bottom-left">` into the select. |
| WC: WithLayer | `WithLayer` | `select.stories.ts` | Demonstrates layer-token swap via the `withLayers` decorator. |

`SelectItem` wraps a single `<option>`; `SelectItemGroup` wraps `<optgroup>` (each `<SelectItemGroup>` contains nested `<SelectItem>` children that become `<option>` elements inside the OS-rendered popover).

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Select.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**File header + imports** (top of `Select.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import { default as Select, SelectSkeleton } from '../Select';
import SelectItem from '../SelectItem';
import SelectItemGroup from '../SelectItemGroup';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './Select.mdx';
```

**Default args + meta** (apply to every story unless overridden):

```jsx
export default {
  title: 'Components/Select',
  component: Select,
  args: {
    disabled: false,
    inline: false,
    noLabel: false,
    hideLabel: false,
    invalid: false,
    warn: false,
    size: 'md',
  },
  argTypes: {
    light: {
      table: {
        disable: true,
      },
    },
  },
  decorators: [(story) => <div style={{ width: '400px' }}>{story()}</div>],
  subcomponents: {
    SelectItem,
    SelectItemGroup,
    SelectSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['id', 'defaultValue'],
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <div>
      <Select
        id="select-1"
        labelText="Select an option"
        helperText="Optional helper text"
        {...args}>
        <SelectItem value="" text="" />
        <SelectItem
          value="An example option that is really long to show what should be done to handle long text"
          text="An example option that is really long to show what should be done to handle long text"
        />
        <SelectItem value="option-2" text="Option 2" />
        <SelectItem value="option-3" text="Option 3" />
        <SelectItem value="option-4" text="Option 4" />
      </Select>
    </div>
  );
};

Default.argTypes = {
  helperText: {
    control: 'text',
  },
  invalidText: { control: 'text' },
  labelText: { control: 'text' },
  warnText: { control: 'text' },
};
```

**Variant: Inline**

```jsx
export const Inline = (args) => {
  return (
    <div>
      <Select
        inline
        id="select-1"
        labelText="Select an option"
        helperText="Optional helper text"
        {...args}>
        <SelectItem value="" text="" />
        <SelectItem value="option-1" text="Option 1" />
        <SelectItem value="option-2" text="Option 2" />
        <SelectItem value="option-3" text="Option 3" />
        <SelectItem value="option-4" text="Option 4" />
      </Select>
    </div>
  );
};

Inline.args = {
  inline: true,
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <SelectSkeleton />;
};
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <Select
        id={`select-${layer}`}
        labelText=""
        helperText="Optional helper text"
        {...args}>
        <SelectItem value="" text="" />
        <SelectItem
          value="An example option that is really long to show what should be done to handle long text"
          text="An example option that is really long to show what should be done to handle long text"
        />
        <SelectItem value="option-2" text="Option 2" />
      </Select>
    )}
  </WithLayer>
);

_WithLayer.argTypes = {
  inline: {
    control: false,
  },
};
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

  return (
    <div>
      <Select
        id="select-1"
        labelText="Select an option"
        helperText="Optional helper text"
        decorator={aiLabel}
        {...args}>
        <SelectItem value="" text="" />
        <SelectItem
          value="An example option that is really long to show what should be done to handle long text"
          text="An example option that is really long to show what should be done to handle long text"
        />
        <SelectItem value="option-2" text="Option 2" />
        <SelectItem value="option-3" text="Option 3" />
        <SelectItem value="option-4" text="Option 4" />
      </Select>
    </div>
  );
};

withAILabel.argTypes = {
  inline: {
    control: false,
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `select.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**File header + imports** (top of `select.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2020, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
// Below path will be there when an application installs `carbon-web-components` package.
// In our dev env, we auto-generate the file and re-map below path to to point to the generated file.
// eslint-disable-next-line @typescript-eslint/ban-ts-comment -- https://github.com/carbon-design-system/carbon/issues/20452
// @ts-ignore
import { prefix } from '../../globals/settings';
import { INPUT_SIZE } from '../text-input/text-input';
import './index';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../form/form-item';
import '../layer';
import '../ai-label';
import '../icon-button';
import { iconLoader } from '../../globals/internal/icon-loader';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**AI-label slot helpers** (used by `WithAILabel`):

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

**Shared args + argTypes** (used by every story):

```ts
const sizes = {
  [`Small size (${INPUT_SIZE.SMALL})`]: INPUT_SIZE.SMALL,
  [`Medium size (${INPUT_SIZE.MEDIUM})`]: INPUT_SIZE.MEDIUM,
  [`Large size (${INPUT_SIZE.LARGE})`]: INPUT_SIZE.LARGE,
};

const args = {
  disabled: false,
  helperText: 'Optional helper text',
  hideLabel: false,
  id: 'select',
  inline: false,
  invalid: false,
  invalidText: 'Error message',
  labelStylesDisable: false,
  labelText: 'Select an option',
  placeholder: '',
  size: INPUT_SIZE.MEDIUM,
  readOnly: false,
  warn: false,
  warnText: 'Warning message',
  value: '',
  children: html`
    <cds-select-item value=""></cds-select-item>
    <cds-select-item value="all"
      >An example option that is really long to show what should be done to
      handle long text</cds-select-item
    >
    <cds-select-item value="cloudFoundry">Option 2</cds-select-item>
    <cds-select-item value="staging">Option 3</cds-select-item>
    <cds-select-item value="dea">Option 4</cds-select-item>
  `,
};

const argTypes = {
  disabled: {
    control: 'boolean',
    description: 'Specify whether the control is disabled.',
  },
  helperText: {
    control: 'text',
    description:
      'Provide text that is used alongside the control label for additional help.',
  },
  hideLabel: {
    control: 'boolean',
    description: 'Specify whether the label should be hidden, or not.',
  },
  inline: {
    control: 'boolean',
    description: 'Specify whether you want the inline version of this control.',
  },
  id: {
    control: 'text',
    description: 'Specify the id for the label.',
  },
  invalid: {
    control: 'boolean',
    description: 'Specify if the currently value is invalid.',
  },
  invalidText: {
    control: 'text',
    description: 'Message which is displayed if the value is invalid.',
  },
  labelStylesDisable: {
    control: 'boolean',
    description: 'Specify if you want to disable the default label styling',
  },
  labelText: {
    control: 'text',
    description:
      'Provide label text to be read by screen readers when interacting with the control.',
  },
  placeholder: {
    control: 'text',
    description:
      'Placeholder text to be used with the <code>&lt;input&gt;</code>.',
  },
  size: {
    control: 'select',
    description: 'Specify the size of the Select Input.',
    options: sizes,
  },
  readOnly: {
    control: 'boolean',
    description: 'Whether the select should be read-only.',
  },
  warn: {
    control: 'boolean',
    description: 'Specify whether the control is currently in warning state.',
  },
  warnText: {
    control: 'text',
    description:
      'Provide the text that is displayed when the control is in warning state.',
  },
  value: {
    control: 'text',
    description: 'The value of the selected item.',
  },
  onInput: {
    action: `${prefix}-select-selected`,
  },
};
```

**Variant: Default**

> Note: the Carbon source verbatim contains a stray text fragment after `${children}` (`helper-text="Optional helper text" label-text="Select an option">`) followed by a second hard-coded list of `<cds-select-item>` children — this is preserved here exactly as it appears in the upstream file (it appears to be a Storybook author copy-paste residue but is the canonical text on `main`).

```ts
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      disabled,
      helperText,
      hideLabel,
      id,
      inline,
      invalid,
      invalidText,
      labelStylesDisable,
      labelText,
      name,
      placeholder,
      size,
      readOnly,
      warn,
      warnText,
      value,
      children,
      onInput,
    } = args ?? {};
    return html`
      <cds-form-item>
        <cds-select
          id="${id}"
          ?inline="${inline}"
          ?disabled="${disabled}"
          helper-text="${ifDefined(helperText)}"
          ?hide-label="${hideLabel}"
          ?invalid="${invalid}"
          invalid-text="${ifDefined(invalidText)}"
          ?label-styles-disable="${labelStylesDisable}"
          label-text="${ifDefined(labelText)}"
          name="${ifDefined(name)}"
          placeholder="${ifDefined(placeholder)}"
          size="${ifDefined(size)}"
          ?readonly="${readOnly}"
          ?warn="${warn}"
          warn-text="${ifDefined(warnText)}"
          value="${ifDefined(value)}"
          @cds-select-selected="${ifDefined(onInput)}">
          ${children} helper-text="Optional helper text" label-text="Select an
          option">
          <cds-select-item
            value="An example option that is really long to show what should be done to handle long text"
            >An example option that is really long to show what should be done
            to handle long text</cds-select-item
          >
          <cds-select-item selected value="option-2">Option 2</cds-select-item>
          <cds-select-item value="option-3">Option 3</cds-select-item>
          <cds-select-item value="option-4">Option 4</cds-select-item>
        </cds-select>
      </cds-form-item>
    `;
  },
};
```

**Variant: Inline**

```ts
export const Inline = {
  args: {
    ...args,
    inline: true,
  },
  argTypes,
  render: (args) => {
    const {
      disabled,
      helperText,
      hideLabel,
      id,
      inline,
      invalid,
      invalidText,
      labelStylesDisable,
      labelText,
      name,
      placeholder,
      size,
      readOnly,
      warn,
      warnText,
      value,
      children,
      onInput,
    } = args ?? {};
    return html`
      <cds-form-item>
        <cds-select
          id="${id}"
          ?inline="${inline}"
          ?disabled="${disabled}"
          helper-text="${ifDefined(helperText)}"
          ?hide-label="${hideLabel}"
          ?invalid="${invalid}"
          invalid-text="${ifDefined(invalidText)}"
          ?label-styles-disable="${labelStylesDisable}"
          label-text="${ifDefined(labelText)}"
          name="${ifDefined(name)}"
          placeholder="${ifDefined(placeholder)}"
          size="${ifDefined(size)}"
          ?readonly="${readOnly}"
          ?warn="${warn}"
          warn-text="${ifDefined(warnText)}"
          value="${ifDefined(value)}"
          @cds-select-selected="${ifDefined(onInput)}">
          ${children}
        </cds-select>
      </cds-form-item>
    `;
  },
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  render: () => html` <cds-select-skeleton></cds-select-skeleton> `,
};
```

**Variant: WithAILabel**

```ts
export const WithAILabel = {
  args,
  argTypes: {
    ...argTypes,
    inline: {
      ...argTypes.inline,
      control: false,
    },
  },
  render: (args) => {
    const {
      disabled,
      helperText,
      hideLabel,
      id,
      invalid,
      invalidText,
      labelStylesDisable,
      labelText,
      name,
      placeholder,
      size,
      readOnly,
      warn,
      warnText,
      value,
      children,
      onInput,
    } = args ?? {};

    return html` <div style="width: 400px">
      <cds-select
        id="${id}"
        ?inline="${false}"
        ?disabled="${disabled}"
        helper-text="${ifDefined(helperText)}"
        ?hide-label="${hideLabel}"
        ?invalid="${invalid}"
        invalid-text="${ifDefined(invalidText)}"
        ?label-styles-disable="${labelStylesDisable}"
        label-text="${ifDefined(labelText)}"
        name="${ifDefined(name)}"
        placeholder="${ifDefined(placeholder)}"
        size="${ifDefined(size)}"
        ?readonly="${readOnly}"
        ?warn="${warn}"
        warn-text="${ifDefined(warnText)}"
        value="${ifDefined(value)}"
        @cds-select-selected="${ifDefined(onInput)}">
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >
        ${children}
      </cds-select>
    </div>`;
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
  args,
  argTypes: {
    ...argTypes,
    inline: {
      ...argTypes.inline,
      control: false,
    },
  },
  render: (args) => {
    const {
      disabled,
      helperText,
      hideLabel,
      id,
      invalid,
      invalidText,
      labelStylesDisable,
      labelText,
      name,
      placeholder,
      size,
      readOnly,
      warn,
      warnText,
      value,
      children,
      onInput,
    } = args ?? {};

    return html`
      <cds-select
        id="${id}"
        ?inline="${false}"
        ?disabled="${disabled}"
        helper-text="${ifDefined(helperText)}"
        ?hide-label="${hideLabel}"
        ?invalid="${invalid}"
        invalid-text="${ifDefined(invalidText)}"
        ?label-styles-disable="${labelStylesDisable}"
        label-text="${ifDefined(labelText)}"
        name="${ifDefined(name)}"
        placeholder="${ifDefined(placeholder)}"
        size="${ifDefined(size)}"
        ?readonly="${readOnly}"
        ?warn="${warn}"
        warn-text="${ifDefined(warnText)}"
        value="${ifDefined(value)}"
        @cds-select-selected="${ifDefined(onInput)}">
        ${children}
      </cds-select>
    `;
  },
};

const meta = {
  decorators: [
    (story) => {
      return html`<div style="width: 400px">${story()}</div>`;
    },
  ],
  title: 'Components/Select',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?attr=${value}`, `${ifDefined(...)}`, `.value=${...}`) resolved to static attributes using the shared default args. Use this for hand-coded HTML without a component framework. The component itself is still a custom element — you must register `@carbon/web-components/es/components/select/index.js` for it to upgrade.

**Variant: Default** (size `md`, width `400px`)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      helper-text="Optional helper text"
      invalid-text="Error message"
      label-text="Select an option"
      size="md"
      warn-text="Warning message"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="all">An example option that is really long to show what should be done to handle long text</cds-select-item>
      <cds-select-item value="cloudFoundry">Option 2</cds-select-item>
      <cds-select-item value="staging">Option 3</cds-select-item>
      <cds-select-item value="dea">Option 4</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: Inline** (label sits on the same row as the select)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      inline
      helper-text="Optional helper text"
      label-text="Select an option"
      size="md"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
      <cds-select-item value="option-2">Option 2</cds-select-item>
      <cds-select-item value="option-3">Option 3</cds-select-item>
      <cds-select-item value="option-4">Option 4</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: Skeleton** (40px-tall shimmer placeholder)

```html
<cds-select-skeleton></cds-select-skeleton>
```

**Variant: With error** (`invalid` flag — bottom border becomes `2px support-error`, error icon appears at `inset-inline-end: 40px`, invalid-text replaces helper-text below)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      invalid
      invalid-text="Error message"
      label-text="Select an option"
      size="md"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
      <cds-select-item value="option-2">Option 2</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: With warning** (`warn` flag — bottom border stays `1px border-strong`, yellow triangle icon appears at `inset-inline-end: 40px`, warn-text replaces helper-text below)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      warn
      warn-text="Warning message"
      label-text="Select an option"
      size="md"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
      <cds-select-item value="option-2">Option 2</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: Disabled** (`disabled` flag — text and chevron fade to `text-disabled` / `icon-disabled`, bottom border becomes transparent, cursor becomes `not-allowed`)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      disabled
      helper-text="Optional helper text"
      label-text="Select an option"
      size="md"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: Read-only** (`readonly` flag — background becomes transparent, bottom border becomes `border-subtle`, chevron uses `icon-disabled`, cursor stays `default`)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      readonly
      helper-text="Optional helper text"
      label-text="Select an option"
      size="md"
      value="option-1">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
      <cds-select-item value="option-2">Option 2</cds-select-item>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: With option group** (renders an `<optgroup>` so the OS popover groups items)

```html
<div style="width: 400px;">
  <cds-form-item>
    <cds-select
      id="select"
      helper-text="Optional helper text"
      label-text="Select a category"
      size="md"
      value="">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item-group label="Category 1">
        <cds-select-item value="opt-1a">Option 1A</cds-select-item>
        <cds-select-item value="opt-1b">Option 1B</cds-select-item>
      </cds-select-item-group>
      <cds-select-item-group label="Category 2">
        <cds-select-item value="opt-2a">Option 2A</cds-select-item>
        <cds-select-item value="opt-2b">Option 2B</cds-select-item>
      </cds-select-item-group>
    </cds-select>
  </cds-form-item>
</div>
```

**Variant: Sizes (sm / md / lg)**

```html
<cds-select id="select-sm" size="sm" label-text="Small (32px)" value="">
  <cds-select-item value=""></cds-select-item>
  <cds-select-item value="opt-1">Option 1</cds-select-item>
</cds-select>

<cds-select id="select-md" size="md" label-text="Medium (40px)" value="">
  <cds-select-item value=""></cds-select-item>
  <cds-select-item value="opt-1">Option 1</cds-select-item>
</cds-select>

<cds-select id="select-lg" size="lg" label-text="Large (48px)" value="">
  <cds-select-item value=""></cds-select-item>
  <cds-select-item value="opt-1">Option 1</cds-select-item>
</cds-select>
```

## Design Tokens (component-scoped, resolved from overview.md)

The Storybook source uses semantic tokens (`$field`, `$field-hover`, `$border-strong`, `$border-subtle`, `$focus`, `$support-error`, `$support-warning`, `$text-primary`, `$text-disabled`, `$icon-primary`, `$icon-disabled`, `$layer-hover`, `$background`, `$black-100`). Below are those tokens resolved to literal hex for the two canonical themes (White and G100).

```css
[data-theme="white"] {
  /* Field background — flat, no top/left/right border */
  --cds-select-background:        #f4f4f4; /* field-01 */
  --cds-select-background-hover:  #e8e8e8; /* field-hover-01 */

  /* Bottom border (the Carbon-distinctive treatment) */
  --cds-select-border-bottom:     #8d8d8d; /* border-strong-01 */
  --cds-select-border-bottom-w:   1px;
  --cds-select-border-bottom-w-focus: 2px;

  /* Read-only state border */
  --cds-select-border-readonly:   #c6c6c6; /* border-subtle-01 */

  /* Focus ring (outline overlays the input on :focus-visible) */
  --cds-select-focus:             #0f62fe; /* focus */
  --cds-select-focus-inset:       #ffffff; /* focus-inset */

  /* Text */
  --cds-select-color:             #161616; /* text-primary — selected value */
  --cds-select-label:             #525252; /* text-secondary — label above input */
  --cds-select-helper:            #6f6f6f; /* text-helper — line below input */
  --cds-select-error-text:        #da1e28; /* text-error — invalid-text content color */

  /* Caret (chevron-down) */
  --cds-select-chevron:           #161616; /* icon-primary */
  --cds-select-chevron-disabled:  rgba(22, 22, 22, 0.25); /* icon-disabled */

  /* Validation states */
  --cds-select-error:             #da1e28; /* support-error — bottom border + icon */
  --cds-select-warning:           #f1c21b; /* support-warning — icon */
  --cds-select-warning-fill:      #000000; /* black-100 — interior of warning triangle */

  /* Disabled */
  --cds-select-disabled-color:    rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-select-disabled-bg:       #f4f4f4;                /* field-01 unchanged */
  --cds-select-border-disabled:   transparent;            /* bottom border hides on disabled */

  /* Inline variant */
  --cds-select-inline-bg:         transparent;
  --cds-select-inline-bg-hover:   #e8e8e8;                /* field-hover-01 */
  --cds-select-inline-bg-focus:   #ffffff;                /* background */

  /* AI-label / decorator slot divider */
  --cds-select-divider:           #c6c6c6;                /* border-subtle-01 */
}

[data-theme="g100"],
.dark {
  --cds-select-background:        #393939; /* field-01 (G100) */
  --cds-select-background-hover:  #4c4c4c; /* field-hover-01 (G100) */

  --cds-select-border-bottom:     #a8a8a8; /* border-strong-01 (G100) */
  --cds-select-border-bottom-w:   1px;
  --cds-select-border-bottom-w-focus: 2px;

  --cds-select-border-readonly:   #6f6f6f; /* border-subtle-01 (G100) */

  --cds-select-focus:             #ffffff; /* focus inverts on dark */
  --cds-select-focus-inset:       #161616; /* focus-inset */

  --cds-select-color:             #f4f4f4; /* text-primary (G100) */
  --cds-select-label:             #c6c6c6; /* text-secondary (G100) */
  --cds-select-helper:            #c6c6c6; /* text-helper (G100) */
  --cds-select-error-text:        #ff8389; /* text-error (G100) */

  --cds-select-chevron:           #f4f4f4; /* icon-primary (G100) */
  --cds-select-chevron-disabled:  rgba(244, 244, 244, 0.25); /* icon-disabled */

  --cds-select-error:             #fa4d56; /* support-error (G100) */
  --cds-select-warning:           #f1c21b;
  --cds-select-warning-fill:      #000000;

  --cds-select-disabled-color:    rgba(244, 244, 244, 0.25);
  --cds-select-disabled-bg:       #393939;
  --cds-select-border-disabled:   transparent;

  --cds-select-inline-bg:         transparent;
  --cds-select-inline-bg-hover:   #4c4c4c;                /* field-hover-01 (G100) */
  --cds-select-inline-bg-focus:   #262626;                /* background (G100) */

  --cds-select-divider:           #525252;                /* border-subtle-01 (G100) */
}

/* Sharp corners — Carbon's default. NEVER round a select. */
.cds--select,
.cds--select-input,
cds-select {
  border-radius: 0;
}
```

## States Reference (from `_select.scss` and Carbon styles)

> The shipped `packages/styles/scss/components/select/_select.scss` is the canonical source. The state values below resolve those Carbon styles to literal hex per theme.

| State | Background | Text color | Bottom border | Outline | Other |
|---|---|---|---|---|---|
| Rest (White) | `#f4f4f4` (`field-01`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong-01`) | none | chevron `#161616`; label above `#525252`; helper below `#6f6f6f` |
| Rest (G100) | `#393939` (`field-01`) | `#f4f4f4` | `1px solid #a8a8a8` | none | chevron `#f4f4f4`; label `#c6c6c6`; helper `#c6c6c6` |
| Hover (White) | `#e8e8e8` (`field-hover-01`) | `#161616` | `1px solid #8d8d8d` | none | `cursor: pointer` |
| Hover (G100) | `#4c4c4c` (`field-hover-01`) | `#f4f4f4` | `1px solid #a8a8a8` | none | `cursor: pointer` |
| Focus-visible (White) | (rest bg) | `#161616` | `2px solid #0f62fe` (`focus`) | `outline: 2px solid #0f62fe; outline-offset: -2px` | inset focus ring `0 0 0 1px #ffffff` (Carbon's double-ring style) |
| Focus-visible (G100) | (rest bg) | `#f4f4f4` | `2px solid #ffffff` (`focus`) | `outline: 2px solid #ffffff; outline-offset: -2px` | inset focus ring `0 0 0 1px #161616` |
| Active / open (popover from OS) | (focus bg) | `text-primary` | (focus border) | (focus outline) | OS-rendered popover; Carbon does NOT theme it |
| Invalid (White) | `#f4f4f4` | `#161616` | (Carbon's invalid-state CSS keeps the rest border on `<select>` itself; the wrapper sets `data-invalid` and the icon is the visual signal) | none on rest; focus shows blue outline | error icon `#da1e28` at `inset-inline-end: 40px` (`spacing-08`); invalid-text `#da1e28` (`text-error`) below; `padding-inline-end: 64px` (`spacing-10`) |
| Invalid (G100) | `#393939` | `#f4f4f4` | — | — | error icon `#fa4d56`; invalid-text `#ff8389` |
| Warn (White) | `#f4f4f4` | `#161616` | `1px solid #8d8d8d` | none | warning triangle icon `#f1c21b` at `inset-inline-end: 40px`; interior `path[fill]` overridden to `#000000` `opacity: 1`; warn-text `#525252` (`text-secondary`); `padding-inline-end: 64px` |
| Warn (G100) | `#393939` | `#f4f4f4` | `1px solid #a8a8a8` | — | warning icon `#f1c21b`; warn-text `#c6c6c6` |
| Read-only (White) | `transparent` | `#161616` | `1px solid #c6c6c6` (`border-subtle`) | none | chevron `rgba(22, 22, 22, 0.25)` (`icon-disabled`); `cursor: default`; hover keeps `transparent` (no hover on inline-readonly either) |
| Read-only (G100) | `transparent` | `#f4f4f4` | `1px solid #6f6f6f` | — | chevron `rgba(244, 244, 244, 0.25)` |
| Disabled (White) | `#f4f4f4` (unchanged on hover too) | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | `transparent` (border hidden — Carbon-specific) | none | chevron `rgba(22, 22, 22, 0.25)` (`icon-disabled`); `cursor: not-allowed`; label & helper-text also fade to `text-disabled` |
| Disabled (G100) | `#393939` (unchanged) | `rgba(244, 244, 244, 0.25)` | `transparent` | — | chevron `rgba(244, 244, 244, 0.25)`; `cursor: not-allowed` |
| Inline rest (White) | `transparent` | `#161616` | none (inline removes bottom border) | none | chevron at `inset-inline-end: 8px` (`spacing-03`); label `#525252` to the LEFT |
| Inline rest (G100) | `transparent` | `#f4f4f4` | none | — | — |
| Inline hover (White) | `#e8e8e8` (`field-hover-01`) | `#161616` | none | none | — |
| Inline focus (White) | `#ffffff` (`background`) | `#161616` | none (inline) | `outline: 2px solid #0f62fe; outline-offset: -2px` | option / optgroup background swaps to `#ffffff` while focus is held |
| Inline focus (G100) | `#262626` (`background`) | `#f4f4f4` | none | `outline: 2px solid #ffffff; outline-offset: -2px` | — |
| Inline disabled (White) | `#ffffff` (`background`) | `rgba(22, 22, 22, 0.25)` | none | none | `cursor: not-allowed` (also applied to direct sibling elements) |
| Inline invalid (White) | `transparent` | `#161616` | none | none | invalid icon `#da1e28` at `inset-inline-end: 32px` (`spacing-07`); `padding-inline-end: 56px` (`3.5rem`); chevron at `8px` (`spacing-03`) |
| Skeleton (White) | `#e8e8e8` shimmer (`skeleton-background`) | n/a | none | none | `block-size: 2.5rem` (40px); inner `<select>` is hidden (`display: none`); `@keyframes skeleton` 3s `cubic-bezier(.4, .14, .3, 1)` infinite |
| Skeleton (G100) | `#292929` (`skeleton-background`) | n/a | none | none | — |
| Option / optgroup (rest) | `#e8e8e8` (`layer-hover` — IE11 fallback; modern browsers use OS chrome) | `#161616` (`text-primary`) | n/a | n/a | `:disabled` option text fades to `text-disabled` |

### Padding & icon-position rules (verbatim from `_select.scss`)

```scss
.#{$prefix}--select-input {
  block-size: convert.to-rem(40px);                            // md default
  border-block-end: 1px solid $border-strong;
  padding-block: 0;
  padding-inline: $spacing-05 $spacing-09;                     // 16px / 48px
  transition: outline $duration-fast-01 motion(standard, productive);
}

.#{$prefix}--select-input--sm { block-size: convert.to-rem(32px); max-block-size: convert.to-rem(32px); }
.#{$prefix}--select-input--lg { block-size: convert.to-rem(48px); max-block-size: convert.to-rem(48px); }

// Bigger right padding when invalid OR warn icon is present
.#{$prefix}--select-input__wrapper[data-invalid] .#{$prefix}--select-input,
.#{$prefix}--select--warning .#{$prefix}--select-input {
  padding-inline-end: $spacing-10;                             // 64px
}

// Caret position
.#{$prefix}--select__arrow {
  position: absolute;
  block-size: 100%;
  fill: $icon-primary;
  inset-block-start: 0;
  inset-inline-end: $spacing-05;                               // 16px from right edge
  pointer-events: none;
}

// Invalid icon position
.#{$prefix}--select__invalid-icon {
  position: absolute;
  inset-inline-end: $spacing-08;                               // 40px from right edge
}
.#{$prefix}--select-input__wrapper[data-invalid]
  .#{$prefix}--select-input
  ~ .#{$prefix}--select__invalid-icon { fill: $support-error; }

.#{$prefix}--select__invalid-icon--warning            { fill: $support-warning; }
.#{$prefix}--select__invalid-icon--warning path[fill] { fill: $black-100; opacity: 1; }

// Inline variant
.#{$prefix}--select--inline .#{$prefix}--select-input {
  background-color: transparent;
  border-block-end: none;
  padding-inline: $spacing-03 $spacing-09;                     // 8px / 48px
}
.#{$prefix}--select--inline .#{$prefix}--select__arrow {
  inset-inline-end: $spacing-03;                               // 8px from right edge
}
.#{$prefix}--select--inline.#{$prefix}--select--invalid .#{$prefix}--select-input {
  padding-inline-end: convert.to-rem(56px);                    // 3.5rem
}
.#{$prefix}--select--inline.#{$prefix}--select--invalid
  .#{$prefix}--select-input ~ .#{$prefix}--select__invalid-icon,
.#{$prefix}--select--inline.#{$prefix}--select--warning
  .#{$prefix}--select-input ~ .#{$prefix}--select__invalid-icon--warning {
  inset-inline-end: $spacing-07;                               // 32px
}

// Read-only
.#{$prefix}--select--readonly .#{$prefix}--select-input {
  background-color: transparent;
  border-block-end-color: $border-subtle;
  cursor: default;
}
.#{$prefix}--select--readonly .#{$prefix}--select__arrow { fill: $icon-disabled; }

// Disabled
.#{$prefix}--select-input:disabled,
.#{$prefix}--select-input:hover:disabled {
  background-color: $field;
  border-block-end-color: transparent;
  color: $text-disabled;
  cursor: not-allowed;
}
.#{$prefix}--select-input:disabled ~ .#{$prefix}--select__arrow { fill: $icon-disabled; }

// AI-label / decorator slot
.#{$prefix}--select--decorator
  .#{$prefix}--select__inner-wrapper--decorator > * ,
.#{$prefix}--select--slug .#{$prefix}--ai-label,
.#{$prefix}--select--slug .#{$prefix}--slug {
  position: absolute;
  inset-block-start: 50%;
  inset-inline-end: calc($spacing-08 + 8px + 1px);             // 49px from right
  margin-block-start: convert.to-rem(0.5px);
  transform: translateY(-50%);
}

// Padding when AI-label is present
.#{$prefix}--select--decorator
  .#{$prefix}--select-input:has(~ .#{$prefix}--select__inner-wrapper--decorator),
.#{$prefix}--select--slug .#{$prefix}--select-input:has(~ .#{$prefix}--ai-label),
.#{$prefix}--select--slug .#{$prefix}--select-input:has(~ .#{$prefix}--slug) {
  padding-inline-end: $spacing-10;                             // 64px
}

// Padding when both invalid icon AND AI-label are present
.#{$prefix}--select--decorator:has(.#{$prefix}--select__invalid-icon)
  .#{$prefix}--select-input:has(~ .#{$prefix}--select__inner-wrapper--decorator),
.#{$prefix}--select--slug:has(.#{$prefix}--select__invalid-icon)
  .#{$prefix}--select-input:has(~ .#{$prefix}--ai-label),
.#{$prefix}--select--slug:has(.#{$prefix}--select__invalid-icon)
  .#{$prefix}--select-input:has(~ .#{$prefix}--slug) {
  padding-inline-end: $spacing-12;                             // 96px
}

// Skeleton
.#{$prefix}--select.#{$prefix}--skeleton {
  @include skeleton;
  block-size: 2.5rem;
  inline-size: 100%;
}
.#{$prefix}--select.#{$prefix}--skeleton .#{$prefix}--select-input { display: none; }
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `@carbon/styles/scss/components/select/_select.scss`):

```css
.cds--select-input,
cds-select::part(input) {
  /* Carbon explicitly uses ONLY `outline` for the transition (not background-color)
     to avoid the bug documented in carbon-design-system/carbon#4464 */
  transition: outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Skeleton shimmer (shared keyframes from utilities/skeleton) */
@keyframes skeleton {
  0%   { transform: scaleX(0); transform-origin: left;  }
  20%  { transform: scaleX(1); transform-origin: left;  }
  28%  { transform: scaleX(1); transform-origin: right; }
  51%  { transform: scaleX(0); transform-origin: right; }
  58%  { transform: scaleX(0); transform-origin: right; }
  82%  { transform: scaleX(1); transform-origin: right; }
  83%  { transform: scaleX(1); transform-origin: left;  }
  96%  { transform: scaleX(0); transform-origin: left;  }
  100% { transform: scaleX(0); transform-origin: left;  }
}
.cds--skeleton.cds--select { animation: skeleton 3s cubic-bezier(0.4, 0.14, 0.3, 1) infinite; }

@media (prefers-reduced-motion: reduce) {
  .cds--select-input,
  cds-select::part(input) { transition: none; }
  .cds--skeleton.cds--select { animation: none; }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms`
- `--cds-duration-moderate-01` = `150ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`

The actual popover (the dropdown of options) is rendered by the OS / browser — Carbon does NOT animate or theme it. That is a deliberate trade-off in favor of using a native `<select>` for accessibility and form-submission semantics. If a fully themable popover is required, use the **Dropdown** or **Combo Box** component instead.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** the underlying form control is a native `<select>`. Carbon's `<cds-select>` is a custom element shadow-rooted around that native select — screen readers see and announce the native control. This is the principal reason to use Select over Dropdown / Combo Box: form-association, keyboard model, and AT support are all OS-native.
- **Label association:** Carbon ALWAYS renders a `<label>` element wired by `id` / `for` (React: `labelText` prop; WC: `label-text` attribute). The label sits above the select (or to the left in the inline variant), NOT as a placeholder. `hide-label` / `hideLabel` keeps the label in the accessibility tree but visually hides it (`cds--visually-hidden`).
- **Helper text:** rendered in a sibling `<div class="cds--form__helper-text">` that is wired via `aria-describedby` on the `<select>`.
- **Error / warn text:** when `invalid` or `warn` is set, the text moves into `<div class="cds--form-requirement" role="alert">` and gains `id` linkage via `aria-describedby`. The icon (`AlertFilled` for invalid, `WarningAltFilled` for warn) is `aria-hidden="true"` because the message text already conveys state.
- **Empty / placeholder option:** every story includes an empty `<SelectItem value="" text="" />` (React) or `<cds-select-item value=""></cds-select-item>` (WC) as the first child. This gives the user a "no selection" state and surfaces the `placeholder` text. If the field is required, set `required` on the underlying `<select>` so the empty option triggers HTML5 form validation.
- **`readonly`:** Carbon's `<select>` uses a CSS-driven read-only state (the underlying `<select>` does NOT support the `readonly` attribute natively); the wrapper's `cds--select--readonly` class disables `cursor` and styles the border but the select is still focusable. To prevent value changes you should ALSO wire `disabled` or trap `change` events.
- **`disabled`:** sets `disabled` on the native `<select>` — removes from tab order and announces "dimmed / disabled". Disabled inputs MUST NOT have helper / invalid text used to convey required information.
- **`option` and `optgroup`:** `<SelectItemGroup>` becomes `<optgroup label="…">` in the DOM, which screen readers announce as a group heading. Use it for >5 options that fall into clear categories.
- **Keyboard:**
  - `Tab` / `Shift+Tab` — focus the `<select>`, then move on.
  - `Space` / `Enter` / `Alt+Down` — open the OS popover (browser-dependent).
  - `Up` / `Down` — change selection while closed; navigate while open.
  - First-letter type-ahead jumps to the matching option.
  - `Enter` inside a `<form>` submits, per the platform default — Carbon does not intercept it.
- **Focus management:** Carbon ships a `:focus-visible` rule that combines a `2px solid var(--cds-focus)` outline with the bottom border growing from `1px` → `2px` so users in high-contrast mode still see the focus indication if the outline is suppressed. Carbon also includes a `-moz-focusring` reset to remove Firefox's dotted inner focus ring (replaces it with `text-shadow: 0 0 0 #000000` to keep the value visible).
- **High Contrast Mode:** Carbon scopes a special rule for the chevron (`@media (-ms-high-contrast: active), (prefers-contrast)`) where `path { fill: ButtonText; }` — i.e. the chevron uses the OS HCM ButtonText color instead of the `icon-primary` token.
- **Touch target:** `md` (40px) clears the WCAG 2.1 Level AAA 44×44 target only at `lg` (48px). For touch-first UI, prefer `size="lg"` or wrap the select row in `min-height: 44px`.
- **Color contrast:** label `#525252` on `#ffffff` is 7.46:1 (AAA). Helper `#6f6f6f` on `#ffffff` is 5.31:1 (AA). The selected value `#161616` on `#f4f4f4` is 16.05:1 (AAA).

## Responsive

- **Width:** the `_select.scss` rule `inline-size: 100%` is applied to both `.cds--select` and `.cds--select-input__wrapper`. The `<select>` fills its container width — the canonical Storybook decorator wraps the component in `width: 400px` for demo purposes only. In real layouts, set the parent's width / use the 2x grid columns.
- **Inline variant breakpoint behavior:** the inline variant assumes there is enough horizontal room for `[label] [select] [helper]`. On narrow viewports (typically <`md` / 672px), switch to the default vertical layout — there is no automatic wrapping.
- **Sizes by surface:**
  - `sm` (32px) — dense data tables, inline filters, advanced settings panels. NOT for primary forms; below WCAG touch target on mobile.
  - `md` (40px) — default for product UI forms (the canonical Storybook size).
  - `lg` (48px) — touch-first UI, expressive marketing forms, the FluidForm context.
- **Long option text:** the `text-overflow: ellipsis` rule on `.cds--select-input` clips the displayed value when it overflows, but the OS popover shows the full string (the Storybook story explicitly demos a 90-character option to show this behavior).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Use `<Select>` (React) / `<cds-select>` (WC) when you need native `<select>` semantics: form-association, OS popover, free keyboard model | Don't use Select for non-native richness (icons in options, multi-select, async loading) — use **Dropdown**, **Multi-select**, or **Combo Box** instead |
| Sharp corners (`border-radius: 0`) on every select | Don't round the corners — that's Material / Apple, not Carbon |
| Apply the bottom-only border (`border-block-end: 1px solid border-strong-01`) and KEEP top / left / right borderless | Don't draw a 4-sided box — that's the v9-and-earlier Carbon style and it breaks the visual rhythm of forms |
| Render the `<label>` as a SEPARATE element above the select (or to the left for inline) | Don't use a floating-label / Material-style placeholder substitute — Carbon labels are static |
| Always include an empty first `<SelectItem value="" text="" />` so the user has a "no selection" starting state | Don't pre-select an arbitrary option just to avoid the empty state — the empty option is the canonical placeholder mechanism |
| Use `<SelectItemGroup>` to wrap `<optgroup>` when you have 5+ options across categories | Don't put 30 ungrouped options in a single Select — switch to **Combo Box** with type-ahead instead |
| Put helper text in a sibling node tied via `aria-describedby` | Don't merge helper, error, and warn text into the same node — Carbon swaps them per state |
| Pad to `spacing-10` (64px) on the right when invalid OR warn is set | Don't let the validation icon overlap the chevron or the value — the SCSS already handles the padding offset |
| Use the inline variant for dense rows (toolbars, table headers) | Don't combine inline + helper text below — the inline variant pushes the helper text inline (margin-inline-start: `spacing-03`) and only one line fits |
| Use `size="lg"` (48px) on touch-first surfaces and inside `<FluidForm>` | Don't ship `size="sm"` (32px) on mobile — it is below the WCAG touch-target threshold |
| Wrap pages in `[data-theme="white"]` or `[data-theme="g100"]` so token values resolve correctly | Don't define your own `--cds-*` overrides — let the theme cascade do its job |
| Use `<cds-form-item>` as the wrapping element (per Storybook) | Don't omit `<cds-form-item>` in WC — it provides the form-row spacing and helper-text margins Carbon's CSS expects |
