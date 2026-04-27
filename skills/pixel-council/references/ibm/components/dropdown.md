---
name: dropdown
description: Carbon Dropdown — JS-driven select-replacement with bottom-border trigger and a layer-tinted listbox menu. Variants from Storybook — Default, ExperimentalAutoAlign, Inline, InlineWithLayer, _WithLayer, Skeleton, withAILabel, withToggletipLabel, plus a TestInvalidTextNoOverlap regression story. WC also exports WithLayer and WithAILabel and WithToggletipLabel.
metadata:
  tags: dropdown, select, listbox, form, menu, ai-label, skeleton, ibm, carbon, react, web-components
---

# Dropdown -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Dropdown.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Dropdown/Dropdown.stories.js)
> - **WC story:** [`dropdown.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts)
> - **SCSS:** [`_dropdown.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/dropdown/_dropdown.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-dropdown--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-dropdown--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/dropdown/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Trigger heights (sm / md / lg) | `32px` / `40px` / `48px` |
| Inline trigger height | `32px` (text padded `7px 32px 7px 16px`) |
| Trigger padding-inline | `0 16px` (`spacing-05`) on the label, `padding-inline-end: 42px` reserves room for the chevron |
| Trigger padding-inline-end (when invalid) | `56px` (`spacing-09`) — leaves room for the error icon at `spacing-08` (32px) from the edge |
| Menu max-height (md) | `220px` (40px row × 5.5) — list scrolls beyond that |
| Menu max-height (sm) | `176px` (32px row × 5.5) |
| Menu width | `100%` of the trigger (`inline-size: 100%`) |
| Menu item height | `40px` (md) / `32px` (sm) — `padding: 11px 0` (md) / `padding-block: 7px 7px` (sm) inside a `margin: 0 16px` link |
| Menu item link padding-inline | `0` (rest) — bumps to `0 16px` when the link itself receives `:focus` styles (focus ring negates the link margin) |
| Selected item indicator | `cds--list-box__menu-item__selected-icon` — a `Checkmark16` icon shown on `.cds--dropdown--show-selected .cds--dropdown--selected` |
| Corner radius | `border-radius: 0` (Carbon: sharp by default — no rounding on trigger or menu) |
| Border treatment | **Bottom-only trigger**: `border-block-end: 1px solid var(--cds-border-strong-01)` (rest); becomes `var(--cds-border-subtle-01)` while open. Inline variant: `transparent` border-block-end. |
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
| Background — selected item hover (White, `layer-selected-hover-01`) | `#cacaca` (resolved from gray-25 token via `layer-selected-hover-01`) |
| Background — selected item hover (G100, `layer-selected-hover-01`) | `#474747` |
| Border-strong-01 (White) | `#8d8d8d` |
| Border-strong-01 (G100) | `#6f6f6f` |
| Border-subtle-01 (White) — between menu items, and trigger when open | `#c6c6c6` |
| Border-subtle-01 (G100) | `#525252` |
| Focus ring | `outline: 2px solid var(--cds-focus)` on the trigger field (`focus-outline('outline')`); inset matches the trigger background tier |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `border-color: var(--cds-support-error)` + `fill: var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes) |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Trigger text color (rest) | `var(--cds-text-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Item link text color (rest) | `var(--cds-text-secondary)` — White: `#525252`, G100: `#c6c6c6` |
| Item link text color (hover) | `var(--cds-text-primary)` |
| Disabled text | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Disabled chevron | `var(--cds-icon-disabled)` |
| Chevron position | `position: absolute; inset-block-start: 13px; inset-inline-end: 16px` (md). Sm: `inset-block-start: 8px`. Lg: `inset-block-start: 16px`. Inline: `inset-block-start: 8px; inset-inline-end: 8px`. Rotates `-180deg` while open. |
| Trigger transition | `background-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive)` |
| Chevron transition | `transform var(--cds-duration-fast-02) var(--cds-easing-standard-productive)` |
| Menu open transition | `max-height var(--cds-duration-fast-02) var(--cds-easing-entrance-productive)` (110ms expressive-entrance for the open animation) |
| Item transition | `visibility, opacity, background-color all var(--cds-duration-fast-01) var(--cds-easing-standard-productive)` |
| Font | IBM Plex Sans — body-compact-01 (trigger label, item links), helper-text-01 (helper / invalid / warn text), label-01 (titleText) |
| Element / role | `<button aria-haspopup="listbox">` trigger + `<ul role="listbox">` + `<li role="option" aria-selected>` items |
| z-index | `z('dropdown')` — Carbon's named z-index for popover-class surfaces |
| React import | `import { Dropdown, DropdownSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/dropdown/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `Dropdown.stories.js` | Standard dropdown with `titleText` label, helper text, and a 9-item options list (one disabled). 400px wrapper. |
| ExperimentalAutoAlign | `ExperimentalAutoAlign` | `Dropdown.stories.js` | Demonstrates `autoAlign={true}` + `direction="top"` — flips menu above the trigger when there's no room below. Wrapped in 300px / 800px spacers to force the flip. |
| Inline | `Inline` | `Dropdown.stories.js` | `type="inline"` — trigger has no bottom border or field background; label sits to the left of the trigger on the same row. 600px wrapper. |
| _WithLayer | `_WithLayer` | `Dropdown.stories.js` | Wrapped in `<WithLayer>` storybook decorator — trigger swaps `field-01 → field-02 → field-03` and the menu swaps `layer-01 → layer-02 → layer-03` for each nested layer. |
| InlineWithLayer | `InlineWithLayer` | `Dropdown.stories.js` | Inline variant inside a `<WithLayer>` decorator — verifies inline trigger reads correctly across layer tiers. |
| Skeleton | `Skeleton` | `Dropdown.stories.js` | `<DropdownSkeleton />` placeholder — same dimensions as default trigger, animated shimmer. 300px wrapper. |
| withAILabel | `withAILabel` | `Dropdown.stories.js` | Decorates the trigger with an `<AILabel>` containing confidence score, model type, and action buttons (View / Open Folder / Folders / View details). The trigger gains the aiAura gradient background. |
| withToggletipLabel | `withToggletipLabel` | `Dropdown.stories.js` | Replaces `titleText` with a JSX node that pairs `<ToggletipLabel>` + `<Toggletip>` (info icon button) — clicking the icon opens a dismissible popover with helper copy. |
| TestInvalidTextNoOverlap | `TestInvalidTextNoOverlap` | `Dropdown.stories.js` | Hidden regression story (`tags: ['!dev', '!autodocs']`) — guards against bug #19960 where invalid-text overlapped the dropdown below it. |
| WC: Default | `Default` | `dropdown.stories.ts` | Renders `<cds-dropdown>` with all shared args plus 9 `<cds-dropdown-item>` children. |
| WC: ExperimentalAutoAlign | `ExperimentalAutoAlign` | `dropdown.stories.ts` | Same auto-align demo as React, with 300px / 800px spacers. Defaults: `autoalign: true`, `direction: TOP`, `value: 'option-1'`. |
| WC: Inline | `Inline` | `dropdown.stories.ts` | `type="inline"` (`DROPDOWN_TYPE.INLINE`). |
| WC: InlineWithLayer | `InlineWithLayer` | `dropdown.stories.ts` | Inline variant under `withLayers` decorator. |
| WC: Skeleton | `Skeleton` | `dropdown.stories.ts` | `<cds-dropdown-skeleton>` placeholder. |
| WC: WithAILabel | `WithAILabel` | `dropdown.stories.ts` | Slots a `<cds-ai-label alignment="bottom-left">` (with body content + 4 ghost icon buttons + an action button) inside `<cds-dropdown>`. |
| WC: WithLayer | `WithLayer` | `dropdown.stories.ts` | Same layer-swap demo as React, via `withLayers` decorator. |
| WC: WithToggletipLabel | `WithToggletipLabel` | `dropdown.stories.ts` | Replaces the title-text slot with `<cds-toggletip alignment="bottom">` containing body copy + a link + a button. |

The Web Components story file also defines a `meta` object with a wrapping decorator that sets the trigger's container width: `300px` for skeleton stories, omitted for layer stories, and `400px` for everything else.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Dropdown.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `Dropdown.stories.js`):

```jsx
import React from 'react';
import { FolderOpen, Folders, Information, View } from '@carbon/icons-react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import { default as Dropdown, DropdownSkeleton } from './';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import {
  Toggletip,
  ToggletipActions,
  ToggletipButton,
  ToggletipContent,
  ToggletipLabel,
} from '../Toggletip';
import { IconButton } from '../IconButton';
import mdx from './Dropdown.mdx';
import Link from '../Link';
```

**Storybook default export** (title, subcomponents, argTypes, parameters):

```jsx
export default {
  title: 'Components/Dropdown',
  component: Dropdown,
  subcomponents: {
    DropdownSkeleton,
  },
  argTypes: {
    light: {
      table: {
        disable: true,
      },
    },
    slug: {
      table: {
        disable: true,
      },
    },
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['items', 'initialSelectedItem', 'itemToElement', 'id'],
    },
  },
};
```

**Shared `items` array** (used by `_WithLayer` and `InlineWithLayer`; each story below also defines its own local `items` constant with identical contents — they are kept verbatim per Carbon source):

```jsx
const items = [
  {
    text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
  },
  {
    text: 'Option 1',
  },
  {
    text: 'Option 2',
  },
  {
    text: 'Option 3',
    disabled: true,
  },
  {
    text: 'Option 4',
  },
  {
    text: 'Option 5',
  },
  {
    text: 'Option 6',
  },
  {
    text: 'Option 7',
  },
  {
    text: 'Option 8',
  },
];
```

**Shared args + argTypes** (apply to most stories unless overridden):

```jsx
const sharedArgs = {
  invalid: false,
  invalidText: 'Error message goes here',
  disabled: false,
  hideLabel: false,
  label: 'Choose an option',
  warn: false,
  warnText: 'Warning message goes here',
  titleText: 'Label',
  type: 'default',
};

const sharedArgTypes = {
  invalid: {
    control: {
      type: 'boolean',
    },
  },
  invalidText: {
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
  label: {
    control: {
      type: 'text',
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
  titleText: {
    control: {
      type: 'text',
    },
    type: {
      required: true,
    },
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
  type: {
    control: { type: 'select' },
    options: ['default', 'inline'],
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const items = [
    {
      text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
    },
    {
      text: 'Option 1',
    },
    {
      text: 'Option 2',
    },
    {
      text: 'Option 3',
      disabled: true,
    },
    {
      text: 'Option 4',
    },
    {
      text: 'Option 5',
    },
    {
      text: 'Option 6',
    },
    {
      text: 'Option 7',
    },
    {
      text: 'Option 8',
    },
  ];

  return (
    <div style={{ width: 400 }}>
      <Dropdown
        id="default"
        titleText="Label"
        helperText="Helper text"
        label="Choose an option"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        {...args}
      />
    </div>
  );
};

Default.args = {
  ...sharedArgs,
};

Default.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: ExperimentalAutoAlign**

```jsx
export const ExperimentalAutoAlign = (args) => {
  const items = [
    {
      text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
    },
    {
      text: 'Option 1',
    },
    {
      text: 'Option 2',
    },
    {
      text: 'Option 3',
      disabled: true,
    },
    {
      text: 'Option 4',
    },
    {
      text: 'Option 5',
    },
    {
      text: 'Option 6',
    },
    {
      text: 'Option 7',
    },
    {
      text: 'Option 8',
    },
  ];
  return (
    <div style={{ width: 400 }}>
      <div style={{ height: 300 }}></div>
      <Dropdown
        autoAlign={true}
        id="default"
        titleText="Label"
        helperText="Helper text"
        initialSelectedItem={items[1]}
        label="Option 1"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        direction="top"
        {...args}
      />
      <div style={{ height: 800 }}></div>
    </div>
  );
};

ExperimentalAutoAlign.argTypes = {
  ...sharedArgTypes,
};

ExperimentalAutoAlign.args = {
  invalid: false,
  invalidText: 'Error message goes here',
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: Inline**

```jsx
export const Inline = (args) => {
  const items = [
    {
      text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
    },
    {
      text: 'Option 1',
    },
    {
      text: 'Option 2',
    },
    {
      text: 'Option 3',
      disabled: true,
    },
    {
      text: 'Option 4',
    },
    {
      text: 'Option 5',
    },
    {
      text: 'Option 6',
    },
    {
      text: 'Option 7',
    },
    {
      text: 'Option 8',
    },
  ];
  return (
    <div style={{ width: 600 }}>
      <Dropdown
        id="inline"
        titleText="Label"
        initialSelectedItem={items[1]}
        label="Option 1"
        type="inline"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        {...args}
      />
    </div>
  );
};

Inline.argTypes = {
  ...sharedArgTypes,
};

Inline.args = {
  invalid: false,
  invalidText: 'Error message goes here',
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: _WithLayer** (the React export name is `_WithLayer` — Storybook strips the leading underscore in the sidebar):

```jsx
export const _WithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 400 }}>
        <Dropdown
          id={`default-${layer}`}
          titleText="Label"
          helperText="Helper text"
          initialSelectedItem={items[1]}
          label="Option 1"
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          {...args}
        />
      </div>
    )}
  </WithLayer>
);

_WithLayer.argTypes = {
  ...sharedArgTypes,
};

_WithLayer.args = {
  invalid: false,
  invalidText: 'Error message goes here',
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: InlineWithLayer**

```jsx
export const InlineWithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 600 }}>
        <Dropdown
          id={`inline-${layer}`}
          titleText="Label"
          initialSelectedItem={items[1]}
          label="Option 1"
          type="inline"
          items={items}
          itemToString={(item) => (item ? item.text : '')}
          {...args}
        />
      </div>
    )}
  </WithLayer>
);

InlineWithLayer.argTypes = {
  ...sharedArgTypes,
};

InlineWithLayer.args = {
  invalid: false,
  invalidText: 'Error message goes here',
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return (
    <div style={{ width: 300 }}>
      <DropdownSkeleton />
    </div>
  );
};
```

**Variant: withAILabel** — condensed for brevity (less-essential variant). Same structure as `Default` (uses the same 9-item `items` array as the canonical `items` declared above, wrapped in `<div style={{ width: 400 }}>`) but with `id="default"`, `helperText="Helper text"`, `initialSelectedItem={items[1]}`, `label="Option 1"`, and a `decorator={aiLabel}` prop where `aiLabel` is `<AILabel className="ai-label-container"><AILabelContent>...</AILabelContent></AILabel>` containing: a `<div>` with `<p className="secondary">AI Explained</p><h2 className="ai-label-heading">84%</h2><p className="secondary bold">Confidence score</p><p className="secondary">Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.</p><hr /><p className="secondary">Model type</p><p className="bold">Foundation model</p></div>`, then `<AILabelActions>` with `<IconButton kind="ghost" label="View"><View /></IconButton>`, `<IconButton kind="ghost" label="Open Folder"><FolderOpen /></IconButton>`, `<IconButton kind="ghost" label="Folders"><Folders /></IconButton>`, and `<Button>View details</Button>`. `withAILabel.argTypes = { ...sharedArgTypes }`; `withAILabel.args = { invalid: false, invalidText: 'Error message goes here', warn: false, warnText: 'Warning message goes here' }`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Dropdown/Dropdown.stories.js

**Variant: withToggletipLabel**

```jsx
export const withToggletipLabel = () => {
  return (
    <div style={{ width: 400 }}>
      <Dropdown
        label="placeholder"
        id="dropdown"
        items={[]}
        titleText={
          <div style={{ display: 'flex', alignItems: 'center' }}>
            <ToggletipLabel>Label</ToggletipLabel>
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
      />
    </div>
  );
};
```

**Variant: TestInvalidTextNoOverlap** (hidden regression story — `tags: ['!dev', '!autodocs']` excludes it from docs and the sidebar but keeps the visual-regression coverage):

```jsx
// Hidden Test-Only Story. This story tests for a bug where the invalid-text would overlap with components below it. #19960
export const TestInvalidTextNoOverlap = () => {
  const items = [
    {
      text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
    },
  ];

  return (
    <div style={{ width: 400 }}>
      <Dropdown
        id="test-1"
        titleText="Label"
        helperText="Helper text"
        label="Choose an option"
        items={items}
        itemToString={(item) => (item ? item.text : '')}
        invalid
        invalidText="Error message goes here"
      />
      <Dropdown
        titleText="Label"
        label="Choose an option"
        itemToString={(item) => (item ? item.text : '')}
        id="test-2"
        items={items}
      />
    </div>
  );
};
/*
 * This story will:
 * - Be excluded from the docs page
 * - Removed from the sidebar navigation
 * - Still be a tested variant
 */
TestInvalidTextNoOverlap.tags = ['!dev', '!autodocs'];
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `dropdown.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `dropdown.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { DROPDOWN_DIRECTION, DROPDOWN_SIZE, DROPDOWN_TYPE } from './dropdown';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './dropdown-item';
import './dropdown-skeleton';
import '../ai-label';
import '../toggle-tip';
import '../link';
import '../button';
import '../icon-button';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Constants (direction, size, type, items, defaultArgs, controls)**:

```ts
const directionOptions = {
  [`Top`]: DROPDOWN_DIRECTION.TOP,
  [`Bottom`]: DROPDOWN_DIRECTION.BOTTOM,
};

const sizes = {
  [`Small size (${DROPDOWN_SIZE.SMALL})`]: DROPDOWN_SIZE.SMALL,
  [`Medium size (${DROPDOWN_SIZE.MEDIUM})`]: DROPDOWN_SIZE.MEDIUM,
  [`Large size (${DROPDOWN_SIZE.LARGE})`]: DROPDOWN_SIZE.LARGE,
};

const types = {
  Default: null,
  [`Inline (${DROPDOWN_TYPE.INLINE})`]: DROPDOWN_TYPE.INLINE,
};

const items = [
  {
    value: 'option-0',
    text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
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
  {
    value: 'option-6',
    text: 'Option 6',
  },
  {
    value: 'option-7',
    text: 'Option 7',
  },
  {
    value: 'option-8',
    text: 'Option 8',
  },
];

const defaultArgs = {
  ariaLabel: '',
  autoalign: false,
  direction: DROPDOWN_DIRECTION.BOTTOM,
  disabled: false,
  hideLabel: false,
  helperText: '',
  invalid: false,
  invalidText: 'Error message goes here',
  label: 'Choose an option',
  open: false,
  readOnly: false,
  size: null,
  titleText: 'Label',
  type: null,
  value: '',
  warn: false,
  warnText: 'Warning message goes here',
};

const controls = {
  ariaLabel: {
    control: 'text',
    description:
      'Specify a label to be read by screen readers on the container node.',
  },
  autoalign: {
    control: 'boolean',
    description:
      'Will auto-align the dropdown. This attribute is currently experimental and is subject to future changes.',
  },
  direction: {
    control: 'select',
    options: directionOptions,
    description: `Specify the direction of the dropdown. Can be either 'top' or 'bottom'.`,
  },
  disabled: {
    control: 'boolean',
    description: `Disable the control.`,
  },
  helperText: {
    control: 'text',
    description: `Provide helper text that is used alongside the control label for additional help.`,
  },
  hideLabel: {
    control: 'boolean',
    description: `Specify whether the title text should be hidden or not.`,
  },
  invalid: {
    control: 'boolean',
    description: `Specify if the currently selected value is invalid.`,
  },
  invalidText: {
    control: 'text',
    description: `Message which is displayed if the value is invalid.`,
  },
  label: {
    control: 'text',
    description: `The default content of the trigger button.`,
  },
  open: {
    control: 'boolean',
    description: `Specify if the dropdown should be open, or not.`,
  },
  readOnly: {
    control: 'boolean',
    description: `Whether or not the Dropdown is readonly.`,
  },
  size: {
    control: 'select',
    options: sizes,
    description: `Specify the size of the ListBox. Currently supports either 'sm', 'md' or 'lg' as an option.`,
  },
  titleText: {
    control: 'text',
    description: `Text that will be read by a screen reader when visiting this control.`,
  },
  type: {
    control: 'select',
    options: types,
    description: `The dropdown type, 'default' or 'inline'`,
  },
  value: {
    control: 'text',
    description: `The value of the selected item.`,
  },
  warn: {
    control: 'boolean',
    description: `Specify whether the control is currently in warning state`,
  },
  warnText: {
    control: 'text',
    description: `Provide the text that is displayed when the control is in warning state`,
  },
};
```

**Variant: Default**

```html
export const Default = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    helperText: 'Helper text',
    invalidText: 'Error message goes here',
    warnText: 'Warning message goes here',
  },
  render: ({
    ariaLabel,
    autoalign,
    open,
    direction,
    disabled,
    helperText,
    hideLabel,
    invalid,
    invalidText,
    titleText,
    readOnly,
    size,
    type,
    value,
    label,
    warn,
    warnText,
  }) => html`
    <cds-dropdown
      aria-label=${ariaLabel}
      ?autoalign=${autoalign}
      ?open=${open}
      ?disabled="${disabled}"
      ?hide-label=${hideLabel}
      helper-text=${helperText}
      ?invalid=${invalid}
      ?read-only=${readOnly}
      invalid-text=${invalidText}
      direction="${direction}"
      title-text=${ifDefined(titleText)}
      size="${ifDefined(size)}"
      type="${ifDefined(type)}"
      value=${ifDefined(value)}
      label=${ifDefined(label)}
      ?warn=${warn}
      warn-text=${warnText}>
      ${items.map(
        (elem) => html`
          <cds-dropdown-item ?disabled=${elem.disabled} value="${elem.value}"
            >${elem.text}</cds-dropdown-item
          >
        `
      )}
    </cds-dropdown>
  `,
};
```

**Variant: ExperimentalAutoAlign** — condensed for brevity (less-essential variant). Same `render` template as `Default` (identical Lit binding signature, identical `${items.map(...)}` body), but: (a) wrapped in `<div style="width:400px">` with sibling `<div style="height: 300px"></div>` above + `<div style="height: 800px"></div>` below to force the menu to flip, and (b) `args` overrides `autoalign: true`, `direction: DROPDOWN_DIRECTION.TOP`, `helperText: 'Helper text'`, `label: 'Option 1'`, `value: 'option-1'`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts

**Variant: Inline**

```html
export const Inline = {
  argTypes: controls,
  args: {
    ...defaultArgs,
    label: 'Option 1',
    titleText: 'Label',
    type: DROPDOWN_TYPE.INLINE,
    value: 'option-1',
  },
  render: ({
    ariaLabel,
    autoalign,
    open,
    direction,
    disabled,
    helperText,
    hideLabel,
    invalid,
    invalidText,
    titleText,
    readOnly,
    size,
    type,
    value,
    label,
    warn,
    warnText,
  }) => html`
    <cds-dropdown
      aria-label=${ariaLabel}
      ?autoalign=${autoalign}
      ?open=${open}
      ?disabled="${disabled}"
      ?hide-label=${hideLabel}
      helper-text=${helperText}
      ?invalid=${invalid}
      ?read-only=${readOnly}
      invalid-text=${invalidText}
      direction="${direction}"
      title-text=${ifDefined(titleText)}
      size="${ifDefined(size)}"
      type="${ifDefined(type)}"
      value=${ifDefined(value)}
      label=${ifDefined(label)}
      ?warn=${warn}
      warn-text=${warnText}>
      ${items.map(
        (elem) => html`
          <cds-dropdown-item ?disabled=${elem.disabled} value="${elem.value}"
            >${elem.text}</cds-dropdown-item
          >
        `
      )}
    </cds-dropdown>
  `,
};
```

**Variant: InlineWithLayer** — condensed for brevity (less-essential variant). `decorators: [withLayers]`, `parameters: { layout: 'fullscreen' }`, `argTypes: controls`. Same `render` template as the `Inline` variant above (wrapped in `<div style="width:400px">`, identical Lit binding signature, identical `${items.map(...)}` body) — the `withLayers` decorator (`'../../../.storybook/decorators/with-layers'`) wraps the rendered output in three `<cds-layer>` tiers so the trigger reads `field-01 → 02 → 03` and menu reads `layer-01 → 02 → 03`. `args` overrides `label: 'Option 1'`, `type: DROPDOWN_TYPE.INLINE`, `value: 'option-1'`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts

**Variant: Skeleton**

```html
export const Skeleton = {
  argTypes: controls,
  args: defaultArgs,
  render: () => html` <cds-dropdown-skeleton></cds-dropdown-skeleton> `,
};
```

**WithAILabel content + actions templates** (used by the `WithAILabel` story):

```html
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

**Variant: WithAILabel** — condensed for brevity (less-essential variant). Same `render` template as `Default` (identical Lit binding signature, identical `${items.map(...)}` body) but slots `<cds-ai-label alignment="bottom-left"> ${content}${actions}</cds-ai-label>` (using the `content` + `actions` templates declared above) inside `<cds-dropdown>` ahead of the items. `args` overrides `helperText: 'Helper text'`, `label: 'Option 1'`, `value: 'option-1'`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts

**Variant: WithLayer** — condensed for brevity (less-essential variant). `decorators: [withLayers]`, `parameters: { layout: 'fullscreen' }`, `argTypes: controls`. Same `render` template as `Default` wrapped in `<div style="width:400px">` (identical Lit binding signature, identical `${items.map(...)}` body) — the `withLayers` decorator wraps the rendered output in three `<cds-layer>` tiers so trigger reads `field-01 → 02 → 03` and menu reads `layer-01 → 02 → 03`. `args` overrides `helperText: 'Helper text'`, `label: 'Option 1'`, `value: 'option-1'`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts

**Variant: WithToggletipLabel** — condensed for brevity (less-essential variant). Same `render` template signature as `Default` (no `helperText` arg) but: (a) replaces the `title-text` slot with `<span slot="title-text" style="display: flex; align-items: center;">${titleText}<cds-toggletip alignment="bottom"><p slot="body-text">Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.</p><cds-link href="#" slot="actions">Link action</cds-link><cds-button size="sm" slot="actions">Button</cds-button></cds-toggletip></span>`, and (b) passes an empty items array (`${[]}`). `args` overrides `label: 'placeholder'`, `value: 'placeholder'`. Full source: https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/dropdown/dropdown.stories.ts

**Storybook meta** (default export — title + per-story decorator that sizes the wrapper):

```ts
const meta = {
  title: 'Components/Dropdown',
  decorators: [
    (story, { name }) => {
      const isLayerStory = name.toLowerCase().includes('layer');
      const isSkeletonStory = name.toLowerCase().includes('skeleton');

      const width = isLayerStory
        ? ''
        : isSkeletonStory
          ? 'width:300px'
          : 'width:400px';

      return html` <div style="${width}">${story()}</div> `;
    },
  ],
};

export default meta;
```

## Plain HTML (derived from Web Components)

> For hand-coded HTML without a framework, copy the Web Components markup verbatim from the section above — `<cds-dropdown>` and `<cds-dropdown-item>` are real custom elements that render natively once `@carbon/web-components` is loaded via CDN or bundler. The lit-html bindings (`${ifDefined(...)}`, `?disabled=${...}`) resolve to standard HTML attributes (`size="md"`, `disabled`, etc.) that mirror each story's `args` defaults. Only Default + Skeleton + the open-state DOM (the runtime listbox structure Carbon produces internally, which the SCSS in section 9 styles) are reproduced here as standalone references; for every other variant (ExperimentalAutoAlign, Inline, InlineWithLayer, WithAILabel, WithLayer, WithToggletipLabel) use the corresponding WC block above and substitute the literal attributes shown in each story's `args`.

**Variant: Default** (`label="Choose an option"`, `helperText="Helper text"`, no preselected value, menu collapsed)

```html
<div style="width:400px">
  <cds-dropdown
    aria-label=""
    helper-text="Helper text"
    invalid-text="Error message goes here"
    direction="bottom"
    title-text="Label"
    label="Choose an option"
    warn-text="Warning message goes here">
    <cds-dropdown-item value="option-0">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</cds-dropdown-item>
    <cds-dropdown-item value="option-1">Option 1</cds-dropdown-item>
    <cds-dropdown-item value="option-2">Option 2</cds-dropdown-item>
    <cds-dropdown-item disabled value="option-3">Option 3</cds-dropdown-item>
    <cds-dropdown-item value="option-4">Option 4</cds-dropdown-item>
    <cds-dropdown-item value="option-5">Option 5</cds-dropdown-item>
    <cds-dropdown-item value="option-6">Option 6</cds-dropdown-item>
    <cds-dropdown-item value="option-7">Option 7</cds-dropdown-item>
    <cds-dropdown-item value="option-8">Option 8</cds-dropdown-item>
  </cds-dropdown>
</div>
```

**Variant: Skeleton**

```html
<div style="width:300px">
  <cds-dropdown-skeleton></cds-dropdown-skeleton>
</div>
```

**Reference: open-state DOM** (the menu is hidden by default; when the user opens the dropdown the listbox renders below the trigger as `<ul role="listbox">` with one `<li role="option">` per item — this is what Carbon produces internally and what the SCSS in section 9 styles)

```html
<div class="cds--dropdown__wrapper cds--list-box__wrapper">
  <label id="dropdown-label" class="cds--label">Label</label>
  <div class="cds--dropdown cds--dropdown--md cds--dropdown--open cds--list-box cds--list-box--md">
    <button
      type="button"
      class="cds--list-box__field"
      aria-haspopup="listbox"
      aria-expanded="true"
      aria-labelledby="dropdown-label dropdown-trigger"
      aria-controls="dropdown-menu">
      <span id="dropdown-trigger" class="cds--list-box__label">Option 1</span>
      <div class="cds--list-box__menu-icon cds--list-box__menu-icon--open">
        <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M8 11L3 6 3.7 5.3 8 9.6 12.3 5.3 13 6z"></path></svg>
      </div>
    </button>
    <ul
      id="dropdown-menu"
      role="listbox"
      aria-label="Choose an option"
      class="cds--list-box__menu">
      <li role="option" tabindex="-1" aria-selected="false" class="cds--list-box__menu-item">
        <div class="cds--list-box__menu-item__option">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</div>
      </li>
      <li role="option" tabindex="-1" aria-selected="true" class="cds--list-box__menu-item cds--list-box__menu-item--active cds--list-box__menu-item--highlighted">
        <div class="cds--list-box__menu-item__option">
          Option 1
          <div class="cds--list-box__menu-item__selected-icon">
            <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M13 24L4 15 5.4143 13.5858 13 21.1716 26.5858 7.5858 28 9z"></path></svg>
          </div>
        </div>
      </li>
      <li role="option" tabindex="-1" aria-selected="false" class="cds--list-box__menu-item">
        <div class="cds--list-box__menu-item__option">Option 2</div>
      </li>
      <li role="option" tabindex="-1" aria-selected="false" aria-disabled="true" class="cds--list-box__menu-item cds--list-box__menu-item--disabled">
        <div class="cds--list-box__menu-item__option">Option 3</div>
      </li>
      <!-- ...remaining options... -->
    </ul>
  </div>
  <div class="cds--form__helper-text">Helper text</div>
</div>
```

## Design Tokens (component-scoped)

These tokens resolve the semantic Carbon tokens used by `_dropdown.scss` (`$field`, `$field-hover`, `$layer`, `$layer-hover`, `$layer-selected`, `$layer-selected-hover`, `$border-strong`, `$border-subtle`, `$text-primary`, `$text-secondary`, `$text-disabled`, `$text-helper`, `$icon-primary`, `$icon-disabled`, `$support-error`, `$support-warning`, `$focus`) to literal hex values for both default themes.

```css
[data-theme="white"] {
  /* Trigger field */
  --cds-dropdown-trigger-background: #f4f4f4;            /* field-01 */
  --cds-dropdown-trigger-background-hover: #e8e8e8;      /* field-hover-01 */
  --cds-dropdown-trigger-background-light: #ffffff;      /* field-02 (--light variant) */
  --cds-dropdown-trigger-text: #161616;                  /* text-primary */
  --cds-dropdown-trigger-border-rest: #8d8d8d;           /* border-strong-01 */
  --cds-dropdown-trigger-border-open: #c6c6c6;           /* border-subtle-01 */
  --cds-dropdown-trigger-border-disabled: transparent;
  --cds-dropdown-trigger-text-disabled: rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-dropdown-chevron: #161616;                       /* icon-primary */
  --cds-dropdown-chevron-disabled: rgba(22, 22, 22, 0.25); /* icon-disabled */

  /* Menu surface */
  --cds-dropdown-menu-background: #f4f4f4;               /* layer-01 */
  --cds-dropdown-menu-divider: #c6c6c6;                  /* border-subtle-01 (between items) */
  --cds-dropdown-menu-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.20); /* box-shadow utility */

  /* Menu items */
  --cds-dropdown-item-text: #525252;                     /* text-secondary (link rest) */
  --cds-dropdown-item-text-hover: #161616;               /* text-primary */
  --cds-dropdown-item-background-hover: #e8e8e8;         /* layer-hover-01 */
  --cds-dropdown-item-background-selected: #e0e0e0;      /* layer-selected-01 */
  --cds-dropdown-item-background-selected-hover: #cacaca; /* layer-selected-hover-01 */
  --cds-dropdown-item-text-selected: #161616;            /* text-primary */
  --cds-dropdown-item-text-disabled: rgba(22, 22, 22, 0.25);

  /* Helper / validation */
  --cds-dropdown-text-helper: #6f6f6f;                   /* text-helper */
  --cds-dropdown-text-error: #da1e28;                    /* text-error */
  --cds-dropdown-icon-error: #da1e28;                    /* support-error */
  --cds-dropdown-icon-warning: #f1c21b;                  /* support-warning */

  /* Focus */
  --cds-dropdown-focus: #0f62fe;                         /* focus */
  --cds-dropdown-focus-inset: #ffffff;                   /* focus-inset */
}

[data-theme="g100"],
.dark {
  /* Trigger field */
  --cds-dropdown-trigger-background: #262626;            /* field-01 */
  --cds-dropdown-trigger-background-hover: #333333;      /* field-hover-01 */
  --cds-dropdown-trigger-background-light: #393939;      /* field-02 */
  --cds-dropdown-trigger-text: #f4f4f4;                  /* text-primary */
  --cds-dropdown-trigger-border-rest: #6f6f6f;           /* border-strong-01 */
  --cds-dropdown-trigger-border-open: #525252;           /* border-subtle-01 */
  --cds-dropdown-trigger-border-disabled: transparent;
  --cds-dropdown-trigger-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-dropdown-chevron: #f4f4f4;                       /* icon-primary */
  --cds-dropdown-chevron-disabled: rgba(244, 244, 244, 0.25);

  /* Menu surface */
  --cds-dropdown-menu-background: #262626;               /* layer-01 */
  --cds-dropdown-menu-divider: #525252;                  /* border-subtle-01 */
  --cds-dropdown-menu-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.50); /* box-shadow utility */

  /* Menu items */
  --cds-dropdown-item-text: #c6c6c6;                     /* text-secondary */
  --cds-dropdown-item-text-hover: #f4f4f4;               /* text-primary */
  --cds-dropdown-item-background-hover: #333333;         /* layer-hover-01 */
  --cds-dropdown-item-background-selected: #393939;      /* layer-selected-01 */
  --cds-dropdown-item-background-selected-hover: #474747; /* layer-selected-hover-01 */
  --cds-dropdown-item-text-selected: #f4f4f4;            /* text-primary */
  --cds-dropdown-item-text-disabled: rgba(244, 244, 244, 0.25);

  /* Helper / validation */
  --cds-dropdown-text-helper: #c6c6c6;                   /* text-helper */
  --cds-dropdown-text-error: #ff8389;                    /* text-error */
  --cds-dropdown-icon-error: #fa4d56;                    /* support-error */
  --cds-dropdown-icon-warning: #f1c21b;                  /* support-warning */

  /* Focus — pure white in dark themes */
  --cds-dropdown-focus: #ffffff;                         /* focus */
  --cds-dropdown-focus-inset: #161616;                   /* focus-inset */
}
```

## States Reference (from .scss)

> Values pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/dropdown/_dropdown.scss`. Hex values resolved against the White theme; G100 substitutes follow the token table in section 8.

### Trigger (`.cds--dropdown`)

| State | Background | Text color | Border-block-end | Other |
|---|---|---|---|---|
| Rest | `#f4f4f4` (`$field`) | `#161616` (`$text-primary`) | `1px solid #8d8d8d` (`$border-strong`) | `outline: 2px solid transparent`; `cursor: pointer`; `block-size: 40px` |
| Hover | `#e8e8e8` (`$field-hover`) | `#161616` | `1px solid #8d8d8d` | — |
| Open | `#f4f4f4` (`$field` — hover suppressed when open) | `#161616` | `1px solid #c6c6c6` (`$border-subtle`) | Menu visible; chevron rotates `-180deg` |
| Open + hover | `#f4f4f4` (`.cds--dropdown--open:hover` reverts to `$field`) | `#161616` | `1px solid #c6c6c6` | — |
| Focus-visible | (inherits state above) | (inherits) | (inherits) | `outline: 2px solid #0f62fe` via `focus-outline('outline')` mixin (focus ring on the inner `.cds--list-box__field`) |
| Open + focus | `#f4f4f4` | `#161616` | `1px solid #c6c6c6` | `outline: 1px solid transparent` (Carbon explicitly clears the trigger's outline once the menu is open — focus moves into the listbox items) |
| Invalid | `#f4f4f4` | `#161616` | `2px solid #da1e28` (`$support-error`) via `focus-outline('invalid')` | Trigger text padding-inline-end becomes `56px`; error icon at `inset-inline-end: spacing-08` (`32px`) |
| Warn | `#f4f4f4` | `#161616` | `1px solid #f1c21b` (`$support-warning`) | Warning triangle icon at `inset-inline-end: spacing-08` |
| Disabled | `#f4f4f4` (hover suppressed: `&:hover { background-color: $field; }`) | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | `1px solid transparent` | Chevron `fill: $icon-disabled`; cursor: `not-allowed`; outline cleared on focus |
| Read-only | `transparent` | `#161616` | `1px solid #c6c6c6` (`$border-subtle`) | `cursor: default`; chevron `fill: $icon-disabled` |
| Light variant | `#ffffff` (`$field-02`) | `#161616` | `1px solid #8d8d8d` | Menu background remains `$layer` |

### Trigger — Inline (`.cds--dropdown--inline`)

| State | Background | Text color | Border-block-end | Other |
|---|---|---|---|---|
| Rest | `transparent` | `#161616` (`$text-primary`) | `transparent` | `display: inline-block`; `block-size: 32px` (text); padding `7px 32px 7px 16px` |
| Hover | `#e8e8e8` (`$layer-hover`) | `#161616` | `transparent` | `transition: background var(--cds-duration-fast-01) motion(entrance, productive)` |
| Open | `transparent` | `#161616` | `transparent` | `.cds--dropdown--inline.cds--dropdown--open { background-color: transparent }` (no field highlight when open) |
| Open + focus | `transparent` | `#161616` | `transparent` | Menu receives `box-shadow` mixin |
| Disabled | `transparent` | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | `transparent` | Hover suppressed; outline cleared on focus |
| Invalid | (inherits) | `#161616` | (inherits) | Invalid icon at `inset-inline-end: 32px`; trigger text padding-inline-end `56px` |
| Read-only | `transparent` | `#161616` | `transparent` | `border-block-end-color: transparent` (overrides default read-only styling) |

### Menu (`.cds--dropdown-list`)

| State | Background | Notes |
|---|---|---|
| Closed (default) | `$layer` | `max-block-size: 0`; items have `visibility: hidden; opacity: 0` |
| Open (md) | `#f4f4f4` (`$layer`) | `max-block-size: 220px` (40px × 5.5); transition `max-height $duration-fast-02 motion(entrance, productive)` (110ms) |
| Open (sm) | `#f4f4f4` | `max-block-size: 176px` (32px × 5.5) |
| Light variant menu | `#f4f4f4` (`$layer`) | Identical to default — `--light` only changes the trigger field |
| Position (default) | — | `position: absolute; z-index: z('dropdown')`; `inset-block-start: 100%` (under trigger) |
| Position (`--up`) | — | `inset-block-end: 2rem` (above trigger); set by `direction="top"` and the auto-align logic |
| Shadow | — | `box-shadow` utility — `0 2px 6px 0 rgba(0, 0, 0, 0.20)` (light) / `rgba(0, 0, 0, 0.50)` (dark) |

### Menu item (`.cds--dropdown-item` + `.cds--dropdown-link`)

| State | Background | Text color | Border-block-start | Other |
|---|---|---|---|---|
| Rest (md) | (inherits menu) `#f4f4f4` | `#525252` (`$text-secondary`) | `1px solid #c6c6c6` (`$border-subtle` divider above link) | `block-size: 40px`; `padding: 11px 0`; `margin: 0 16px`; `opacity: 0` while menu closed, `1` while open |
| Rest (sm) | (inherits menu) | `#525252` | `1px solid #c6c6c6` | `block-size: 32px`; `padding-block: 7px 7px` |
| Hover | `#e8e8e8` (`$layer-hover`) | `#161616` (`$text-primary`) | `transparent` (sibling link border collapses to remove the hairline above the hovered row) | `border-block-end-color: $layer-hover` on the hovered link itself |
| Active (`:active`) | `#e0e0e0` (`$layer-selected`) | `#161616` | `transparent` | (Suppressed inside lists with `aria-activedescendant` so only one row reads as selected) |
| Focus (link) | (inherits hover/rest) | `#161616` | (inherits) | `outline: 2px solid #0f62fe` via `focus-outline('outline')`; padding becomes `11px 16px`; margin → `0` (focus ring spans full row) |
| Focus inside `aria-activedescendant` list | (inherits) | (inherits) | (inherits) | Padding/margin reset to default (Carbon doesn't double-apply focus visuals when the highlighted row is tracked via aria-activedescendant) |
| Selected (`.cds--dropdown--show-selected .cds--dropdown--selected`) | `#e0e0e0` (`$layer-selected`) | `#161616` (`$text-primary`) | `transparent` (selected row's link border + the next sibling's border are both cleared) | `.cds--list-box__menu-item__selected-icon` (Checkmark16) becomes `display: block` |
| Selected + hover | `#cacaca` (`$layer-selected-hover`) | `#161616` | `transparent` | — |
| Disabled item (`disabled` flag on `<cds-dropdown-item>`) | (inherits menu) | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | (inherits) | `cursor: not-allowed`; not interactive |
| First item | (inherits) | (inherits) | `transparent` (no top divider) | `:first-of-type .cds--dropdown-link { border-block-start-color: transparent }` |
| Last item | (inherits) | (inherits) | (inherits) | `:last-of-type .cds--dropdown-link { border-block-end: none }` |

### Chevron (`.cds--dropdown__arrow`)

| State | Fill | Position | Transform |
|---|---|---|---|
| Rest (md) | `#161616` (`$icon-primary`) | `inset-block-start: 13px; inset-inline-end: 16px` | `none` |
| Rest (sm) | `#161616` | `inset-block-start: 8px; inset-inline-end: 16px` | `none` |
| Rest (lg) | `#161616` | `inset-block-start: 16px; inset-inline-end: 16px` | `none` |
| Rest (inline) | `#161616` | `inset-block-start: 8px; inset-inline-end: 8px` | `none` |
| Open | (inherits) | (inherits) | `rotate(-180deg)` |
| Disabled | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`) | (inherits) | (inherits) |
| Read-only | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`) | (inherits) | (inherits) |
| Transition | — | — | `transform var(--cds-duration-fast-02) var(--cds-easing-standard-productive)` |

## Animation & Motion

Carbon's `_dropdown.scss` declares these transitions (all using motion tokens — no custom timings):

```css
.cds--dropdown {
  transition: background-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive); /* 70ms */
}

.cds--dropdown__arrow {
  transition: transform var(--cds-duration-fast-02) var(--cds-easing-standard-productive); /* 110ms */
}

.cds--dropdown-list {
  /* Closed → open: max-height grows from 0 to 220px (md) / 176px (sm) */
  transition: max-height var(--cds-duration-fast-02) var(--cds-easing-standard-productive); /* 110ms */
}

.cds--dropdown--open .cds--dropdown-list {
  /* When fully open: re-applies the same property with the entrance easing for the open feel */
  transition: max-height var(--cds-duration-fast-02) var(--cds-easing-entrance-productive); /* 110ms — expressive entrance curve */
}

.cds--dropdown-item {
  transition:
    visibility var(--cds-duration-fast-01) var(--cds-easing-standard-productive),
    opacity    var(--cds-duration-fast-01) var(--cds-easing-standard-productive),
    background-color var(--cds-duration-fast-01) var(--cds-easing-standard-productive); /* 70ms each */
}

.cds--dropdown--inline {
  /* Inline trigger uses the entrance curve for the hover background swap */
  transition: background var(--cds-duration-fast-01) var(--cds-easing-entrance-productive); /* 70ms */
}

@media (prefers-reduced-motion: reduce) {
  .cds--dropdown,
  .cds--dropdown__arrow,
  .cds--dropdown-list,
  .cds--dropdown-item,
  .cds--dropdown--inline {
    transition: none;
  }
}
```

**Token resolution** (from `overview.md`):
- `--cds-duration-fast-01` = `70ms`
- `--cds-duration-fast-02` = `110ms`
- `--cds-easing-standard-productive` = `cubic-bezier(0.2, 0, 0.38, 0.9)`
- `--cds-easing-entrance-productive` = `cubic-bezier(0, 0, 0.38, 0.9)` (asymmetric — slower out, faster in; reads as "expressive" arrival)

**Sequence of an open animation:**
1. User clicks the trigger button (or presses Space / Enter / Down).
2. `.cds--dropdown` gains `--open` class → `border-block-end-color` swaps from `$border-strong` to `$border-subtle` instantly.
3. `.cds--dropdown__arrow` rotates `-180deg` over 110ms (standard productive curve).
4. `.cds--dropdown-list` `max-block-size` animates `0 → 220px` over 110ms (entrance productive curve — slower at start, faster at end).
5. Each `.cds--dropdown-item` transitions `opacity 0 → 1` and `visibility hidden → inherit` over 70ms (standard productive curve).
6. Focus moves to the first item (or the `initialSelectedItem` if provided) — Carbon manages this via Downshift internally.

## Accessibility (from Carbon's docs + source)

**Semantic structure** (the runtime DOM Carbon's React component renders, mirrored by the WC implementation):

- `<button type="button" aria-haspopup="listbox" aria-expanded={open} aria-labelledby="…" aria-controls="…">` — the trigger, NOT a native `<select>`. Carbon uses a custom popup so it can fully style the menu surface (native `<select>` cannot be styled across browsers).
- `<ul role="listbox" aria-label="…">` — the menu, mounted as a sibling of the trigger inside `.cds--dropdown` (or portalled via `autoAlign`).
- `<li role="option" tabindex="-1" aria-selected={isSelected} aria-disabled={disabled}>` — each item; `tabindex` stays `-1` because the trigger keeps DOM focus and the listbox tracks the highlighted row via `aria-activedescendant`.
- The `cds--list-box__menu-item__selected-icon` (Checkmark16) is rendered for the selected option only. It carries `aria-hidden="true"` since the visual indicator duplicates the `aria-selected` state.

**ARIA attributes Carbon's source applies:**

- Trigger: `aria-haspopup="listbox"`, `aria-expanded`, `aria-labelledby` (binds `<label for>` to the title-text + the current value), `aria-controls` (points at the listbox `id`), and `aria-describedby` for helper / invalid / warn text.
- Listbox: `role="listbox"`, `aria-label` (defaults to the `label` prop / "Choose an option"), `aria-activedescendant` (points at the currently-highlighted option `id`), `aria-multiselectable="false"`.
- Options: `role="option"`, `aria-selected`, optional `aria-disabled`.
- Invalid state adds `aria-invalid="true"` to the trigger; the invalid-text container has `id` referenced by `aria-describedby`.

**Keyboard interaction** (Carbon's source delegates to Downshift's `useSelect` reducer for React; the WC implementation re-implements the same model):

| Key | Action |
|---|---|
| `Tab` | Move focus to / from the trigger button (the listbox itself is never focused) |
| `Space` / `Enter` | Toggle the menu open/closed; when an option is highlighted, selects it and closes the menu |
| `Down Arrow` | Open the menu (if closed) and highlight the first option, OR move highlight down by one |
| `Up Arrow` | Move highlight up by one (does not loop past the first item) |
| `Home` | Highlight the first option |
| `End` | Highlight the last option |
| `Escape` | Close the menu without changing selection; focus returns to the trigger |
| `A`–`Z` (typeahead) | Highlight the next option whose text starts with the typed character; subsequent presses cycle through matches |

**Touch target:** Default trigger is `40px` (`md`) / `48px` (`lg`) — both meet the 44px WCAG 2.5.5 target on `lg` and the `40px` industry-standard floor on `md`. For mobile-first product UI prefer `size="lg"` to clear 44px. The `sm` (`32px`) variant is reserved for high-density desktop tables / toolbars and should not be used for primary touch surfaces.

**Focus management:**

- The Carbon `focus-outline('outline')` mixin paints a `2px solid var(--cds-focus)` ring on the inner `.cds--list-box__field` (light themes: `#0f62fe`, dark themes: `#ffffff`).
- While the menu is open, the trigger's outline is intentionally cleared (`outline: 1px solid transparent`) and visual focus moves into the listbox via `aria-activedescendant`. Do NOT remove either rule.
- When the menu closes, focus returns to the trigger.
- The invalid state colors the bottom border `var(--cds-support-error)` and replaces the focus ring with the invalid focus ring via `focus-outline('invalid')`.

**Screen-reader announcements:**

- On open: SR announces "expanded, list of {n} items".
- On highlight change: SR announces the highlighted option's text + its position ("Option 1, 2 of 9").
- On selection: SR announces the selected option's text. If the trigger has `helperText`, helper content is also announced because of `aria-describedby`.

**Windows High Contrast Mode (HCM):** Carbon's `_dropdown.scss` runs the `.cds--list-box__field` through a `high-contrast-mode('outline')` mixin so the trigger gains a system `WindowText` outline; menu items clear their hover outlines (`outline: none`) to avoid double rings.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — the verbatim React / WC blocks above are the source of truth | Don't paraphrase, "modernize", or rewrite the source — the Carbon library is the design spec |
| Use `<Dropdown>` from `@carbon/react` or `<cds-dropdown>` from `@carbon/web-components` | Don't substitute a native `<select>` — Carbon dropdown exists specifically because `<select>` cannot be fully styled across browsers |
| Keep the bottom-border-only treatment on the default trigger | Don't add a full border, rounded corners, or a drop shadow on the trigger — Carbon is sharp + flat |
| Keep `border-radius: 0` on every dropdown surface (trigger + menu + items) — Carbon's design language is unambiguously sharp-cornered | Don't add `border-radius` — Carbon dropdowns are sharp-cornered by default; any rounding (even `2px`) reads as off-brand |
| Use `type="inline"` for compact toolbar / setting rows where the label sits beside the trigger | Don't use `type="inline"` inside long forms — the missing field background hurts scannability |
| Use `[data-theme="white"]` / `[data-theme="g100"]` (or pair with `.dark`) to scope themes | Don't define your own theme classes — Carbon's tokens are namespaced under `--cds-*` and the data-theme selectors are required for the cascade |
| Provide `helperText` for any non-obvious dropdown so screen readers get context via `aria-describedby` | Don't replace `helperText` with placeholder copy — `placeholder` disappears on selection, helper text persists |
| Use `invalid` + `invalidText` together — they pair via `aria-describedby` and `aria-invalid` | Don't toggle `invalid` without `invalidText` — the support icon will appear with no announcement for SRs |
| Use `_WithLayer` / `WithLayer` patterns when nesting dropdowns inside cards or panels — the `field-01 → 02 → 03` and `layer-01 → 02 → 03` swaps are designed to keep contrast across nesting | Don't override `--cds-field-*` per-instance — let the surrounding `<Layer>` decorator (or `<cds-layer>` in WC) control the tier |
| Keep the chevron's `transform: rotate(-180deg)` on open — it's part of Carbon's affordance vocabulary | Don't replace the chevron with a "+/-" or other glyph — Carbon's caret is the canonical dropdown indicator |
| Wrap the trigger in a fixed-width container (Storybook uses `400px` for default, `600px` for inline, `300px` for skeleton) when laying out forms | Don't make the trigger `width: auto` unless using the `cds--dropdown--auto-width` modifier — Carbon defaults to `inline-size: 100%` and that's what every story relies on |
| Use `size="lg"` (`48px`) on touch primary surfaces; `size="md"` (`40px`) is the default; reserve `size="sm"` (`32px`) for desktop density | Don't go below `sm` (`32px`) — Carbon does not ship a smaller variant and shrinking the trigger breaks the type-style + touch-target alignment |
| When using `withAILabel`, decorate the trigger with an `<AILabel>` so the trigger's background picks up the aiAura gradient (`--cds-ai-aura-*` tokens) | Don't put an `<AILabel>` on a dropdown that doesn't actually use AI — the aura gradient is a meaningful affordance, not decoration |
| Respect `prefers-reduced-motion` — Carbon's source disables every dropdown transition under the media query | Don't re-implement the open animation with custom keyframes — the Carbon transitions are tuned to the productive motion token system |
