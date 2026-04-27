---
name: content-switcher
description: Carbon ContentSwitcher — Carbon's segmented-control equivalent for switching between related views; supports text labels (Default), icon-only buttons (IconOnly), low-contrast variant, and Layer-aware nesting (WithLayer, IconOnlyWithLayer); sizes sm/md/lg; selection-mode automatic or manual
metadata:
  tags: content-switcher, segmented-control, tabs, view-switcher, toggle-group, low-contrast, layer, icon-only, ibm, carbon, react, web-components
---

# Content Switcher -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`ContentSwitcher.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ContentSwitcher/ContentSwitcher.stories.js)
> - **WC story:** [`content-switcher.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/content-switcher/content-switcher.stories.ts)
> - **Core SCSS:** [`_content-switcher.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/content-switcher/_content-switcher.scss)
> - **Token SCSS:** [`_tokens.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/content-switcher/_tokens.scss)
> - **WC SCSS shim:** [`content-switcher.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/content-switcher/content-switcher.scss)
> - **WC element:** [`content-switcher.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/content-switcher/content-switcher.ts)
> - **WC defs (size enum):** [`defs.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/content-switcher/defs.ts)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-contentswitcher--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-content-switcher--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/content-switcher/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm/md/lg) | `32px` / `40px` / `48px` (resolved from `layout.size('height')` at `sm` / `md` / `lg` density tokens — `--cds-layout-size-height-sm`, `--cds-layout-size-height-md`, `--cds-layout-size-height-lg`) |
| Container width | `inline-size: 100%` (text variant) / `inline-size: fit-content` (icon-only variant) |
| Per-button padding (text) | `padding: $spacing-03 layout.density('padding-inline')` → `8px 16px` at default `normal` density (`--cds-layout-density-padding-inline-normal: 16px`) |
| Per-button padding (lg, icon-only) | `padding-inline: 14px 14px` (offsets the larger 20px icon to keep the switcher at 48px) |
| Icon-only button size | square — `block-size` and `inline-size` track `layout.size('height')` (32 / 40 / 48px) |
| Icon size (default) | 16px × 16px |
| Icon size (lg variant) | 20px × 20px (set via SCSS `.cds--content-switcher--lg .cds--content-switcher-btn svg { block-size: 20px; inline-size: 20px; }`) |
| Corner radius | `0` (Carbon: sharp by default per the overview shape rules — Accordion / Tabs / ContentSwitcher are listed as `0`. Note: the current `main`-branch SCSS source applies `border-radius: convert.to-rem(4px)` to the container outline, the selected pill `::after`, and the first/last buttons' outer corners — the spec value is `0` and the rendered curve is the 4px implementation detail. Do NOT add additional `border-radius` beyond what the Carbon SCSS emits.) |
| Container outline | `outline: 1px solid var(--cds-border-inverse)` (`#161616` light / `#f4f4f4` dark), `outline-offset: -1px` |
| Container outline (disabled) | `outline-color: var(--cds-border-disabled)` (`#c6c6c6` light / `rgba(141,141,141,0.5)` dark) — applied via `:has(.cds--content-switcher-btn:disabled)` selector |
| Inter-button divider | 16px-tall, 1px-wide bar in `var(--cds-border-subtle)` rendered via `::before` pseudo-element at `inset-inline-start: 0` of each button (hidden on first child, hidden adjacent to focused/hovered/selected items) |
| Font (rest) | IBM Plex Sans, `body-compact-01` — 14px / 18px / 400 regular / 0.16px |
| Font (selected, low-contrast) | IBM Plex Sans, `heading-compact-01` — 14px / 18px / 600 semibold / 0.16px (only the low-contrast variant restyles the selected label; the high-contrast default keeps `body-compact-01`) |
| Rest text color | `var(--cds-text-secondary)` (`#525252` White / `#c6c6c6` G100) |
| Hover text color | `var(--cds-text-primary)` (`#161616` White / `#f4f4f4` G100) |
| Selected text color (default high-contrast) | `var(--cds-text-inverse)` (`#ffffff` White / `#161616` G100) — sits on top of the `--cds-layer-selected-inverse` pill |
| Selected text color (low-contrast) | `var(--cds-text-primary)` |
| Selected pill background (default) | `var(--cds-layer-selected-inverse)` (`#161616` White / `#f4f4f4` G100) — drawn as a `::after` rectangle with `transform: scaleY(1)` when selected |
| Selected pill background (low-contrast) | `var(--cds-content-switcher-selected)` (`#ffffff` White / `#393939` G100 — component-scoped token) |
| Hover background | `var(--cds-layer-hover)` (`#e8e8e8` White / `#333333` G100) — applied to the button itself, not the `::after` |
| Disabled background | `transparent` (default) / `var(--cds-button-disabled)` (`#c6c6c6` light / `rgba(141,141,141,0.3)` dark) on the selected disabled item |
| Disabled text color | `var(--cds-text-disabled)` (`rgba(22,22,22,0.25)` light / `rgba(244,244,244,0.25)` dark) |
| Icon (rest) fill | `var(--cds-icon-secondary)` (`#525252` light / `#c6c6c6` dark) |
| Icon (hover, focus) fill | `var(--cds-icon-primary)` (`#161616` light / `#f4f4f4` dark) |
| Icon (selected) fill | `var(--cds-icon-inverse)` (`#ffffff` light / `#161616` dark) — for default high-contrast; low-contrast keeps `--cds-icon-primary` |
| Icon (disabled) fill | `var(--cds-icon-disabled)` (`rgba(22,22,22,0.25)` light / `rgba(244,244,244,0.25)` dark) |
| Focus ring (selected button) | `inset 0 0 0 2px var(--cds-focus)` + `inset 0 0 0 3px var(--cds-focus-inset)` (double-ring on the `::after` pill) |
| Focus ring (unselected button) | `inset 0 0 0 2px var(--cds-focus)` on `::before` + `::after` repurposed as a `--cds-focus-inset` overlay (`scaleY(1)`) |
| Focus colors | `--cds-focus`: `#0f62fe` light / `#ffffff` dark · `--cds-focus-inset`: `#ffffff` light / `#262626` dark |
| Low-contrast container background | `var(--cds-content-switcher-background)` (`#f4f4f4` White / `#262626` G100 — component-scoped token) |
| Low-contrast container outline | `var(--cds-border-strong)` (`#8d8d8d` White / `#8d8d8d` G100) |
| Low-contrast hover background | `var(--cds-content-switcher-background-hover)` (`#e5e5e5` White / `#333333` G100) |
| Selected pill border (low-contrast) | `inset 0 0 0 1px var(--cds-border-inverse)` (`#161616` light / `#f4f4f4` dark) |
| Item transition (text variant) | inherits Carbon button motion — `background var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70ms / `cubic-bezier(0.2, 0, 0.38, 0.9)`) |
| Item transition (icon-only) | `transition: none` (icon-only buttons are instantaneous to keep tooltip choreography crisp) |
| ARIA pattern | container `<div role="tablist">`, each item `<button role="tab" aria-selected="…">`; icon-only items expose `aria-label` from the slot text |
| Selection mode | `automatic` (default — arrow keys move focus AND select) or `manual` (arrow keys move focus only; Enter/Space selects). Set via React `onChange` semantics (selection happens on click) or WC `selection-mode` attribute |
| Sizes | `sm` (32px), `md` (40px, default), `lg` (48px). The deprecated `xl` value still appears in the WC `CONTENT_SWITCHER_SIZE` enum but is marked `@deprecated` — do not emit. |
| React import | `import { ContentSwitcher, Switch, IconSwitch } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/content-switcher/index.js';` |

## Variants (from Storybook story exports)

The React stories file exports six product variants (`Default`, `_WithLayer`, `IconOnly`, `IconOnlyWithLayer`, `lowContrast`, `lowContrastIconOnly`). The WC stories file exports six (`Default`, `IconOnly`, `IconOnlyWithLayer`, `LowContrast`, `lowContrastIconOnly`, `WithLayer`). Embed every variant below — text and icon-only are the two foundational shapes; low-contrast and Layer-nested variants are surface modifiers on top of either.

| Variant | Story export (React) | Story export (WC) | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Three text-label `<Switch>` items rendered as a horizontal segmented control on `--cds-background`. Default size is `md` (40px), default `selectionMode` is `automatic`. The whole row uses `inline-size: 100%` and divides space evenly via `justify-content: space-evenly`. Each `<Switch>` accepts `name` (used for the value emitted by `onChange`) and `text` (visible label). Disabled state can be applied per-item via `disabled={args.disabled}`. |
| WithLayer | `_WithLayer` (note the underscore — it's an `_`-prefixed story to avoid conflicting with the `WithLayer` template helper) | `WithLayer` | Same as Default but wrapped in `<WithLayer>` (React) or with `withLayers` decorator (WC). Demonstrates Layer-aware token swapping: nested copies sit on `layer-01`, `layer-02`, `layer-03` so the container outline + selected-pill colors visibly differentiate per nesting level. Use this variant inside Tile, Modal, or any other surface that nests below `--cds-background`. |
| IconOnly | `IconOnly` | `IconOnly` | Three `<IconSwitch>` items with `<TableOfContents />`, `<Workspace />`, `<ViewMode_2 />` icons (16px). The container drops to `inline-size: fit-content` and `justify-content: flex-start`. Each item is a square sized to `layout.size('height')` (32 / 40 / 48px). Tooltips appear on hover (label text in React's `text` prop, `<span slot="tooltip-content">…</span>` in WC). Padding is set to `0` on the button — the icon centers within the square via `align-items: center`. |
| IconOnlyWithLayer | `IconOnlyWithLayer` | `IconOnlyWithLayer` | IconOnly nested in a Layer wrapper. Combines the icon-only modifier with the Layer-tier surface swap. Storybook parameter `layout: 'fullscreen'` removes the canvas padding for visual snapshot. |
| LowContrast (text) | `lowContrast` (lowercase first letter) | `LowContrast` | Lower-contrast skin: container background flips to `--cds-content-switcher-background` (`#f4f4f4` White / `#262626` G100) instead of transparent, outline uses `--cds-border-strong` instead of `--cds-border-inverse`, and the selected pill uses `--cds-content-switcher-selected` (`#ffffff` White / `#393939` G100) with a 1px inset border in `--cds-border-inverse` plus a `heading-compact-01` (semibold) label. Use this skin when the switcher sits on a coloured/tonal surface where the inverse pill would over-pop. |
| LowContrastIconOnly | `lowContrastIconOnly` | `lowContrastIconOnly` | Low-contrast skin combined with the icon-only modifier. Selected icon flips to `--cds-icon-primary` (instead of `--cds-icon-inverse`) because the pill background is light, not inverse. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `ContentSwitcher.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';
import { ContentSwitcher } from './ContentSwitcher';
import { Switch, IconSwitch } from '../Switch';
import mdx from './ContentSwitcher.mdx';
import { TableOfContents, Workspace, ViewMode_2 } from '@carbon/icons-react';

export default {
  title: 'Components/ContentSwitcher',
  component: ContentSwitcher,
  subcomponents: {
    IconSwitch,
    Switch,
  },
  argTypes: {
    light: {
      table: {
        disable: true,
      },
    },
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  children: {
    control: false,
  },
  className: {
    control: false,
  },
  onChange: {
    action: 'onChange',
  },
  size: {
    options: ['sm', 'md', 'lg'],
  },
  disabled: {
    table: {
      type: { summary: 'bool' },
      defaultValue: { summary: false },
    },
    description: 'Specify disabled attribute to true to disable a button.',
    control: 'boolean',
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => (
  <ContentSwitcher {...args}>
    <Switch name="one" text="First section" disabled={args.disabled} />
    <Switch name="two" text="Second section" disabled={args.disabled} />
    <Switch name="three" text="Third section" disabled={args.disabled} />
  </ContentSwitcher>
);

Default.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = (args) => (
  <WithLayer>
    <ContentSwitcher onChange={() => {}} {...args}>
      <Switch name="one" text="First section" disabled={args.disabled} />
      <Switch name="two" text="Second section" disabled={args.disabled} />
      <Switch name="three" text="Third section" disabled={args.disabled} />
    </ContentSwitcher>
  </WithLayer>
);

_WithLayer.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: IconOnly**

```jsx
export const IconOnly = (args) => (
  <ContentSwitcher onChange={() => {}} {...args}>
    <IconSwitch name="one" text="Table of Contents" disabled={args.disabled}>
      <TableOfContents />
    </IconSwitch>
    <IconSwitch name="two" text="Workspace Test" disabled={args.disabled}>
      <Workspace />
    </IconSwitch>
    <IconSwitch name="three" text="View Mode" disabled={args.disabled}>
      <ViewMode_2 />
    </IconSwitch>
  </ContentSwitcher>
);

IconOnly.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: IconOnlyWithLayer**

```jsx
export const IconOnlyWithLayer = (args) => (
  <WithLayer>
    <ContentSwitcher onChange={() => {}} {...args}>
      <IconSwitch name="one" text="Table of Contents" disabled={args.disabled}>
        <TableOfContents />
      </IconSwitch>
      <IconSwitch name="two" text="Workspace Test" disabled={args.disabled}>
        <Workspace />
      </IconSwitch>
      <IconSwitch name="three" text="View Mode" disabled={args.disabled}>
        <ViewMode_2 />
      </IconSwitch>
    </ContentSwitcher>
  </WithLayer>
);
```

**Variant: lowContrast**

```jsx
export const lowContrast = (args) => (
  <ContentSwitcher lowContrast {...args}>
    <Switch name="one" text="First section" disabled={args.disabled} />
    <Switch name="two" text="Second section" disabled={args.disabled} />
    <Switch name="three" text="Third section" disabled={args.disabled} />
  </ContentSwitcher>
);
lowContrast.argTypes = {
  ...sharedArgTypes,
};
```

**Variant: lowContrastIconOnly**

```jsx
export const lowContrastIconOnly = (args) => (
  <ContentSwitcher lowContrast onChange={() => {}} {...args}>
    <IconSwitch name="one" text="Table of Contents" disabled={args.disabled}>
      <TableOfContents />
    </IconSwitch>
    <IconSwitch name="two" text="Workspace Test" disabled={args.disabled}>
      <Workspace />
    </IconSwitch>
    <IconSwitch name="three" text="View Mode" disabled={args.disabled}>
      <ViewMode_2 />
    </IconSwitch>
  </ContentSwitcher>
);
lowContrastIconOnly.argTypes = {
  ...sharedArgTypes,
};
IconOnlyWithLayer.argTypes = {
  ...sharedArgTypes,
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `content-switcher.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports + shared `args` / `argTypes`** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './index';
import { prefix } from '../../globals/settings';
import { iconLoader } from '../../globals/internal/icon-loader';
import TableOfContents16 from '@carbon/icons/es/table-of-contents/16.js';
import Workspace16 from '@carbon/icons/es/workspace/16.js';
import ViewMode2_16 from '@carbon/icons/es/view--mode-2/16.js';
import { withLayers } from '../../../.storybook/decorators/with-layers';

import { CONTENT_SWITCHER_SIZE } from './content-switcher';
import { html } from 'lit';

const forwardEventDetail = (handler) => (event) => {
  handler?.(event.detail);
};

const sizes = {
  [`Small (${CONTENT_SWITCHER_SIZE.SMALL})`]: CONTENT_SWITCHER_SIZE.SMALL,
  'Medium (md - default)': null,
  [`Large (${CONTENT_SWITCHER_SIZE.LARGE})`]: CONTENT_SWITCHER_SIZE.LARGE,
};

const args = {
  size: null,
  selectionMode: 'automatic',
  selectedIndex: 0,
  lowContrast: false,
  disabled: false,
};

const argTypes = {
  selectedIndex: {
    control: 'number',
    description: 'Specify a selected index for the initially selected content',
  },
  selectionMode: {
    control: 'radio',
    options: ['automatic', 'manual'],
    description:
      'Choose whether or not to automatically change selection on focus when left/right arrow pressed. Defaults to `automatic`',
  },
  size: {
    control: 'radio',
    options: sizes,
    description:
      'Specify the size of the Content Switcher. Currently supports either sm, md (default) or lg as an option.',
  },
  onBeforeSelect: {
    action: `${prefix}-content-switcher-beingselected`,
  },
  onChange: {
    action: `${prefix}-content-switcher-selected`,
  },
  lowContrast: {
    control: 'boolean',
    description: '`true` to use the low contrast version.',
  },
  disabled: {
    control: 'boolean',
    description: 'Specify disabled attribute to `true` to disable a button.',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args,
  argTypes,
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => {
    return html`
      <cds-content-switcher
        selection-mode="${selectionMode}"
        selected-index="${selectedIndex}"
        size="${size}"
        ?low-contrast="${lowContrast}"
        @cds-content-switcher-beingselected="${forwardEventDetail(
          onBeforeSelect
        )}"
        @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
        <cds-content-switcher-item
          value="all"
          name="one"
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}">
          First section
        </cds-content-switcher-item>
        <cds-content-switcher-item
          value="cloudFoundry"
          name="two"
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}">
          Second section
        </cds-content-switcher-item>
        <cds-content-switcher-item
          value="staging"
          name="three"
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}">
          Third section
        </cds-content-switcher-item>
      </cds-content-switcher>
    `;
  },
};
```

**Variant: IconOnly**

```html
export const IconOnly = {
  args,
  argTypes,
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => html`
    <cds-content-switcher
      size="${size}"
      selection-mode="${selectionMode}"
      selected-index="${selectedIndex}"
      ?low-contrast="${lowContrast}"
      @cds-content-switcher-beingselected="${forwardEventDetail(
        onBeforeSelect
      )}"
      @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
      <cds-content-switcher-item
        icon
        value="all"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(TableOfContents16)}
        <span slot="tooltip-content">Table of Contents</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="cloudFoundry"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(Workspace16)}
        <span slot="tooltip-content">Workspace Test</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="staging"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(ViewMode2_16)}
        <span slot="tooltip-content">View Mode</span>
      </cds-content-switcher-item>
    </cds-content-switcher>
  `,
};
```

**Variant: IconOnlyWithLayer**

```html
export const IconOnlyWithLayer = {
  args,
  argTypes,
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => html`
    <cds-content-switcher
      size="${size}"
      selection-mode="${selectionMode}"
      selected-index="${selectedIndex}"
      ?low-contrast="${lowContrast}"
      @cds-content-switcher-beingselected="${forwardEventDetail(
        onBeforeSelect
      )}"
      @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
      <cds-content-switcher-item
        icon
        value="all"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(TableOfContents16)}
        <span slot="tooltip-content">Table of Contents</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="cloudFoundry"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(Workspace16)}
        <span slot="tooltip-content">Workspace Test</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="staging"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(ViewMode2_16)}
        <span slot="tooltip-content">View Mode</span>
      </cds-content-switcher-item>
    </cds-content-switcher>
  `,
};
```

**Variant: LowContrast**

```html
export const LowContrast = {
  args: {
    ...args,
    lowContrast: true,
  },
  argTypes,
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => {
    return html`
      <cds-content-switcher
        selection-mode="${selectionMode}"
        selected-index="${selectedIndex}"
        size="${size}"
        ?low-contrast="${lowContrast}"
        @cds-content-switcher-beingselected="${forwardEventDetail(
          onBeforeSelect
        )}"
        @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
        <cds-content-switcher-item
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}"
          value="all"
          name="one">
          First section
        </cds-content-switcher-item>
        <cds-content-switcher-item
          value="cloudFoundry"
          name="two"
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}">
          Second section
        </cds-content-switcher-item>
        <cds-content-switcher-item
          name="three"
          ?disabled="${disabled}"
          ?low-contrast="${lowContrast}"
          value="staging">
          Third section
        </cds-content-switcher-item>
      </cds-content-switcher>
    `;
  },
};
```

**Variant: lowContrastIconOnly**

```html
export const lowContrastIconOnly = {
  args: {
    ...args,
    lowContrast: true,
  },
  argTypes,
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => html`
    <cds-content-switcher
      size="${size}"
      selection-mode="${selectionMode}"
      selected-index="${selectedIndex}"
      ?low-contrast="${lowContrast}"
      @cds-content-switcher-beingselected="${forwardEventDetail(
        onBeforeSelect
      )}"
      @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
      <cds-content-switcher-item
        icon
        value="all"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(TableOfContents16)}
        <span slot="tooltip-content">Table of Contents</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="cloudFoundry"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(Workspace16)}
        <span slot="tooltip-content">Workspace Test</span>
      </cds-content-switcher-item>
      <cds-content-switcher-item
        icon
        value="staging"
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}">
        ${iconLoader(ViewMode2_16)}
        <span slot="tooltip-content">View Mode</span>
      </cds-content-switcher-item>
    </cds-content-switcher>
  `,
};
```

**Variant: WithLayer**

```html
export const WithLayer = {
  args,
  argTypes,
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  render: ({
    onBeforeSelect,
    onChange,
    size,
    selectionMode,
    selectedIndex,
    lowContrast,
    disabled,
  }) => html`
    <cds-content-switcher
      size="${size}"
      selection-mode="${selectionMode}"
      selected-index="${selectedIndex}"
      ?low-contrast="${lowContrast}"
      @cds-content-switcher-beingselected="${forwardEventDetail(
        onBeforeSelect
      )}"
      @cds-content-switcher-selected="${forwardEventDetail(onChange)}">
      <cds-content-switcher-item
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}"
        value="all"
        name="one">
        First section
      </cds-content-switcher-item>
      <cds-content-switcher-item
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}"
        value="cloudFoundry"
        name="two">
        Second section
      </cds-content-switcher-item>
      <cds-content-switcher-item
        ?disabled="${disabled}"
        ?low-contrast="${lowContrast}"
        value="staging"
        name="three">
        Third section
      </cds-content-switcher-item>
    </cds-content-switcher>
  `,
};

const meta = {
  title: 'Components/Content switcher',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `?disabled="${disabled}"`) resolved to static attributes. Use this for hand-coded HTML without a component framework. Class names mirror the SCSS source — `cds--content-switcher`, `cds--content-switcher-btn`, `cds--content-switcher--selected`, `cds--content-switcher--icon-only`, `cds--content-switcher--low-contrast`, `cds--content-switcher--sm` / `cds--content-switcher--lg`.

**Variant: Default (size md, first item selected)**

```html
<div
  class="cds--content-switcher"
  role="tablist"
  aria-label="Switch between sections">
  <button
    type="button"
    role="tab"
    aria-selected="true"
    tabindex="0"
    class="cds--content-switcher-btn cds--content-switcher--selected">
    <span class="cds--content-switcher__label">First section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Second section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Third section</span>
  </button>
</div>
```

**Variant: Default with WithLayer wrapper (layer-01 nesting)**

```html
<div class="cds--layer-one">
  <div
    class="cds--content-switcher"
    role="tablist"
    aria-label="Switch between sections">
    <button
      type="button"
      role="tab"
      aria-selected="true"
      tabindex="0"
      class="cds--content-switcher-btn cds--content-switcher--selected">
      <span class="cds--content-switcher__label">First section</span>
    </button>
    <button
      type="button"
      role="tab"
      aria-selected="false"
      tabindex="-1"
      class="cds--content-switcher-btn">
      <span class="cds--content-switcher__label">Second section</span>
    </button>
    <button
      type="button"
      role="tab"
      aria-selected="false"
      tabindex="-1"
      class="cds--content-switcher-btn">
      <span class="cds--content-switcher__label">Third section</span>
    </button>
  </div>
</div>
```

**Variant: IconOnly (size md, first item selected)**

```html
<div
  class="cds--content-switcher cds--content-switcher--icon-only"
  role="tablist"
  aria-label="Switch view mode">
  <button
    type="button"
    role="tab"
    aria-selected="true"
    tabindex="0"
    aria-label="Table of Contents"
    class="cds--content-switcher-btn cds--content-switcher--selected">
    <svg
      class="cds--content-switcher__icon"
      focusable="false"
      preserveAspectRatio="xMidYMid meet"
      xmlns="http://www.w3.org/2000/svg"
      width="16"
      height="16"
      viewBox="0 0 32 32"
      aria-hidden="true">
      <path d="M28 24v2H10v-2zm0-7v2H10v-2zm0-7v2H10v-2zm0-7v2H10V3zM6 23v3a1 1 0 1 1-2 0v-3a1 1 0 0 1 2 0zm0-7v3a1 1 0 1 1-2 0v-3a1 1 0 0 1 2 0zm0-7v3a1 1 0 0 1-2 0V9a1 1 0 0 1 2 0zm0-7v3a1 1 0 1 1-2 0V2a1 1 0 0 1 2 0z" />
    </svg>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    aria-label="Workspace Test"
    class="cds--content-switcher-btn">
    <svg
      class="cds--content-switcher__icon"
      focusable="false"
      preserveAspectRatio="xMidYMid meet"
      xmlns="http://www.w3.org/2000/svg"
      width="16"
      height="16"
      viewBox="0 0 32 32"
      aria-hidden="true">
      <path d="M28 6v18H4V6h24m0-2H4a2 2 0 0 0-2 2v18a2 2 0 0 0 2 2h11v2H8v2h16v-2h-7v-2h11a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z" />
    </svg>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    aria-label="View Mode"
    class="cds--content-switcher-btn">
    <svg
      class="cds--content-switcher__icon"
      focusable="false"
      preserveAspectRatio="xMidYMid meet"
      xmlns="http://www.w3.org/2000/svg"
      width="16"
      height="16"
      viewBox="0 0 32 32"
      aria-hidden="true">
      <path d="M28 4H4c-1.1 0-2 .9-2 2v20c0 1.1.9 2 2 2h24c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 8H10V6h18v6zM8 6v6H4V6h4zM4 14h4v6H4v-6zm6 12v-6h18v6H10zm0-8v-4h18v4H10z" />
    </svg>
  </button>
</div>
```

**Variant: IconOnly nested in Layer (sm size, second item selected)**

```html
<div class="cds--layer-one">
  <div
    class="cds--content-switcher cds--content-switcher--icon-only cds--content-switcher--sm"
    role="tablist"
    aria-label="Switch view mode">
    <button
      type="button"
      role="tab"
      aria-selected="false"
      tabindex="-1"
      aria-label="Table of Contents"
      class="cds--content-switcher-btn">
      <svg class="cds--content-switcher__icon" focusable="false" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 24v2H10v-2zm0-7v2H10v-2zm0-7v2H10v-2zm0-7v2H10V3z"/></svg>
    </button>
    <button
      type="button"
      role="tab"
      aria-selected="true"
      tabindex="0"
      aria-label="Workspace Test"
      class="cds--content-switcher-btn cds--content-switcher--selected">
      <svg class="cds--content-switcher__icon" focusable="false" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 6v18H4V6h24m0-2H4a2 2 0 0 0-2 2v18a2 2 0 0 0 2 2h11v2H8v2h16v-2h-7v-2h11a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"/></svg>
    </button>
    <button
      type="button"
      role="tab"
      aria-selected="false"
      tabindex="-1"
      aria-label="View Mode"
      class="cds--content-switcher-btn">
      <svg class="cds--content-switcher__icon" focusable="false" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 4H4c-1.1 0-2 .9-2 2v20c0 1.1.9 2 2 2h24c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2z"/></svg>
    </button>
  </div>
</div>
```

**Variant: LowContrast (text, size md, first item selected)**

```html
<div
  class="cds--content-switcher cds--content-switcher--low-contrast"
  role="tablist"
  aria-label="Switch between sections">
  <button
    type="button"
    role="tab"
    aria-selected="true"
    tabindex="0"
    class="cds--content-switcher-btn cds--content-switcher--selected">
    <span class="cds--content-switcher__label">First section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Second section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Third section</span>
  </button>
</div>
```

**Variant: LowContrastIconOnly (size lg, third item selected)**

```html
<div
  class="cds--content-switcher cds--content-switcher--low-contrast cds--content-switcher--icon-only cds--content-switcher--lg"
  role="tablist"
  aria-label="Switch view mode">
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    aria-label="Table of Contents"
    class="cds--content-switcher-btn">
    <svg class="cds--content-switcher__icon" focusable="false" width="20" height="20" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 24v2H10v-2zm0-7v2H10v-2zm0-7v2H10v-2zm0-7v2H10V3z"/></svg>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    aria-label="Workspace Test"
    class="cds--content-switcher-btn">
    <svg class="cds--content-switcher__icon" focusable="false" width="20" height="20" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 6v18H4V6z"/></svg>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="true"
    tabindex="0"
    aria-label="View Mode"
    class="cds--content-switcher-btn cds--content-switcher--selected">
    <svg class="cds--content-switcher__icon" focusable="false" width="20" height="20" viewBox="0 0 32 32" aria-hidden="true"><path d="M28 4H4c-1.1 0-2 .9-2 2v20c0 1.1.9 2 2 2h24c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2z"/></svg>
  </button>
</div>
```

**Variant: Default with disabled state (entire switcher disabled — outline color flips to border-disabled)**

```html
<div
  class="cds--content-switcher"
  role="tablist"
  aria-label="Switch between sections">
  <button
    type="button"
    role="tab"
    aria-selected="true"
    tabindex="0"
    disabled
    class="cds--content-switcher-btn cds--content-switcher--selected">
    <span class="cds--content-switcher__label">First section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    disabled
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Second section</span>
  </button>
  <button
    type="button"
    role="tab"
    aria-selected="false"
    tabindex="-1"
    disabled
    class="cds--content-switcher-btn">
    <span class="cds--content-switcher__label">Third section</span>
  </button>
</div>
```

## Design Tokens (component-scoped)

ContentSwitcher reads from a mix of system tokens (`--cds-layer-*`, `--cds-text-*`, `--cds-icon-*`, `--cds-border-*`, `--cds-focus*`) and three component-scoped tokens generated by `_tokens.scss`:

- `--cds-content-switcher-background` — low-contrast container fill
- `--cds-content-switcher-background-hover` — low-contrast hover fill
- `--cds-content-switcher-selected` — low-contrast selected pill fill

The values resolved from Carbon's per-theme component-token map are reproduced literally below.

```css
[data-theme="white"] {
  /* System tokens used by ContentSwitcher */
  --cds-background: #ffffff;
  --cds-layer-01: #f4f4f4;
  --cds-layer-hover: #e8e8e8;
  --cds-layer-selected-inverse: #161616;
  --cds-border-inverse: #161616;
  --cds-border-strong: #8d8d8d;
  --cds-border-subtle: #c6c6c6;
  --cds-border-disabled: #c6c6c6;
  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-inverse: #ffffff;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-primary: #161616;
  --cds-icon-secondary: #525252;
  --cds-icon-inverse: #ffffff;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-button-disabled: #c6c6c6;
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;

  /* Component-scoped (low-contrast variant) */
  --cds-content-switcher-background: #f4f4f4;
  --cds-content-switcher-background-hover: #e5e5e5;
  --cds-content-switcher-selected: #ffffff;
}

[data-theme="g10"] {
  --cds-background: #f4f4f4;
  --cds-layer-01: #ffffff;
  --cds-layer-hover: #e8e8e8;
  --cds-layer-selected-inverse: #161616;
  --cds-border-inverse: #161616;
  --cds-border-strong: #8d8d8d;
  --cds-border-subtle: #c6c6c6;
  --cds-border-disabled: #c6c6c6;
  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-inverse: #ffffff;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-primary: #161616;
  --cds-icon-secondary: #525252;
  --cds-icon-inverse: #ffffff;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-button-disabled: #c6c6c6;
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;

  /* Component-scoped (low-contrast variant) */
  --cds-content-switcher-background: #ffffff;
  --cds-content-switcher-background-hover: #e5e5e5;
  --cds-content-switcher-selected: #f4f4f4;
}

[data-theme="g90"] {
  --cds-background: #262626;
  --cds-layer-01: #393939;
  --cds-layer-hover: #4c4c4c;
  --cds-layer-selected-inverse: #f4f4f4;
  --cds-border-inverse: #f4f4f4;
  --cds-border-strong: #8d8d8d;
  --cds-border-subtle: #525252;
  --cds-border-disabled: rgba(141, 141, 141, 0.5);
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-inverse: #161616;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-inverse: #161616;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-button-disabled: rgba(141, 141, 141, 0.3);
  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;

  /* Component-scoped (low-contrast variant) */
  --cds-content-switcher-background: #525252;
  --cds-content-switcher-background-hover: #636363;
  --cds-content-switcher-selected: #6f6f6f;
}

[data-theme="g100"],
.dark {
  --cds-background: #161616;
  --cds-layer-01: #262626;
  --cds-layer-hover: #333333;
  --cds-layer-selected-inverse: #f4f4f4;
  --cds-border-inverse: #f4f4f4;
  --cds-border-strong: #8d8d8d;
  --cds-border-subtle: #393939;
  --cds-border-disabled: rgba(141, 141, 141, 0.5);
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-inverse: #161616;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-inverse: #161616;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-button-disabled: rgba(141, 141, 141, 0.3);
  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;

  /* Component-scoped (low-contrast variant) */
  --cds-content-switcher-background: #262626;
  --cds-content-switcher-background-hover: #333333;
  --cds-content-switcher-selected: #393939;
}
```

## States Reference (from .scss)

> Values pulled from `_content-switcher.scss` (linked above) and resolved through `overview.md`'s `[data-theme="white"]` and `[data-theme="g100"]` blocks. Light column = White theme; Dark column = G100 theme. The "Default skin" rows describe the high-contrast (default) container; the "Low-contrast skin" rows describe behaviour under the `lowContrast` prop / `.cds--content-switcher--low-contrast` modifier.

### Default (high-contrast) skin — text item

| State | Background | Color | Border / outline | Other |
|---|---|---|---|---|
| Container, rest | `transparent` | — | `outline: 1px solid #161616` (light) / `#f4f4f4` (dark), `outline-offset: -1px` | container `inline-size: 100%`, `display: flex`, `justify-content: space-evenly` |
| Container, all-disabled | `transparent` | — | `outline-color: #c6c6c6` (light) / `rgba(141,141,141,0.5)` (dark) | applied via `:has(.cds--content-switcher-btn:disabled)` |
| Item, rest | `transparent` | `#525252` (light) / `#c6c6c6` (dark) | `border-block-start/end: 1px solid #161616` (light) / `#f4f4f4` (dark) | `body-compact-01`, `padding: 8px 16px`, `cursor: default` |
| Item, hover (unselected) | `#e8e8e8` (light) / `#333333` (dark) — `--cds-layer-hover` | `#161616` (light) / `#f4f4f4` (dark) | (rest borders) | `cursor: pointer`, `z-index: 3` |
| Item, focus-visible (unselected) | `transparent` (button itself) — `::after` repurposed as `--cds-focus-inset` (`#ffffff` / `#262626`) overlay | (rest) | `::before` `box-shadow: inset 0 0 0 2px #0f62fe` (light) / `inset 0 0 0 2px #ffffff` (dark) | the `::after` pill scales up to fill the slot in `--cds-focus-inset`, drawing a tinted rectangle *behind* a 2px focus ring |
| Item, focus + hover (unselected) | `#e8e8e8` (light) / `#333333` (dark) | (hover) | `border-block-start/end: 1px solid var(--cds-border-inverse)`; `box-shadow: none` (focus ring removed; hover state takes over) | `::after` reverts to `--cds-layer-hover` |
| Item, active (unselected) | `#e8e8e8` (light) / `#333333` (dark) | `#161616` (light) / `#f4f4f4` (dark) | (rest) | `z-index: 3` (raises above inter-item dividers) |
| Item, selected (rest) | `transparent` (button) — `::after` filled with `#161616` (light) / `#f4f4f4` (dark) `--cds-layer-selected-inverse`, `transform: scaleY(1)` | `#ffffff` (light) / `#161616` (dark) — `--cds-text-inverse` | `border: 0` | `z-index: 3`, hover background goes back to transparent |
| Item, selected + focus | (selected) | (selected) | `::after` `box-shadow: inset 0 0 0 2px #0f62fe + inset 0 0 0 3px #ffffff` (light) / `inset 0 0 0 2px #ffffff + inset 0 0 0 3px #262626` (dark) — Carbon's signature double-ring inside the inverse pill | — |
| Item, disabled (unselected) | `transparent` | `rgba(22,22,22,0.25)` (light) / `rgba(244,244,244,0.25)` (dark) | `border-color: #c6c6c6` (light) / `rgba(141,141,141,0.5)` (dark) | `cursor: not-allowed` on hover; `::after` `display: none` |
| Item, disabled (selected) | `#c6c6c6` (light) / `rgba(141,141,141,0.3)` (dark) — `--cds-button-disabled` | `rgba(22,22,22,0.25)` (light) / `rgba(244,244,244,0.25)` (dark) | `border-radius: 4px` (matches the pill geometry) | — |

### Default (high-contrast) skin — icon-only item

Adds `.cds--content-switcher--icon-only` modifier; container collapses to `inline-size: fit-content`, `justify-content: flex-start`. Per-button changes only:

| State | Background | Icon fill | Border / outline | Other |
|---|---|---|---|---|
| Item, rest | `transparent` | `#525252` (light) / `#c6c6c6` (dark) — `--cds-icon-primary` *(via `.cds--content-switcher--icon-only … svg { z-index: 1; fill: $icon-primary; }`)* | (default rest) | `padding: 0`, `transition: none` (icon-only is instantaneous) |
| Item, hover | `#e8e8e8` (light) / `#333333` (dark) | `#161616` (light) / `#f4f4f4` (dark) — `--cds-icon-primary` | (rest) | tooltip slot reveals on hover |
| Item, focus | (rest) | (hover) | `box-shadow: none` (icon-only suppresses the text-variant focus rectangle; relies on the system `:focus-visible` outline drawn by `focus-outline`) | — |
| Item, selected | `#161616` (light) / `#f4f4f4` (dark) — `::after` `--cds-layer-selected-inverse` | `#ffffff` (light) / `#161616` (dark) — `--cds-icon-inverse` | `border: 0` | — |
| Item, disabled | `transparent` | `rgba(22,22,22,0.25)` (light) / `rgba(244,244,244,0.25)` (dark) — `--cds-icon-disabled` | (disabled border) | hover `::before` returns to `--cds-border-subtle` |
| Item, lg-icon size | (per-state) | (per-state) | (per-state) | svg `block-size: 20px; inline-size: 20px;`, button `padding-inline: 14px 14px` |

### Low-contrast skin (text item)

| State | Background | Color | Border / outline | Other |
|---|---|---|---|---|
| Container, rest | `#f4f4f4` (light) / `#262626` (dark) — `--cds-content-switcher-background` | — | `outline-color: #8d8d8d` (light & dark) — `--cds-border-strong` | — |
| Item, rest | (container) | `#525252` (light) / `#c6c6c6` (dark) | `border-color: #8d8d8d` (light & dark) | `body-compact-01` |
| Item, hover (unselected) | `#e5e5e5` (light) / `#333333` (dark) — `--cds-content-switcher-background-hover` | `#161616` (light) / `#f4f4f4` (dark) | (rest) | — |
| Item, focus (unselected) | `::after` `#f4f4f4` (light) / `#262626` (dark) — `--cds-content-switcher-background` | (rest) | `box-shadow: inset 0 0 0 2px #0f62fe` (light) / `inset 0 0 0 2px #ffffff` (dark) on `::after`; `::before` background `transparent` | — |
| Item, selected (rest) | `::after` `#ffffff` (White) / `#393939` (G100) — `--cds-content-switcher-selected`, `border-radius: 4px`, `box-shadow: inset 0 0 0 1px var(--cds-border-inverse)` | `#161616` (light) / `#f4f4f4` (dark) — `--cds-text-primary` | (rest) | `heading-compact-01` (semibold) — only low-contrast restyles the selected label |
| Item, selected + focus | (selected) | (selected) | `::after` `box-shadow: inset 0 0 0 2px #0f62fe` (light) / `inset 0 0 0 2px #ffffff` (dark) | — |
| Item, disabled (unselected) | `transparent` | `rgba(22,22,22,0.25)` (light) / `rgba(244,244,244,0.25)` (dark) | `border-color: #c6c6c6` (light) / `rgba(141,141,141,0.5)` (dark) | `cursor: not-allowed` |
| Item, disabled (selected) | `#ffffff` (White) / `#393939` (G100) — `--cds-content-switcher-selected` | `rgba(22,22,22,0.25)` (light) / `rgba(244,244,244,0.25)` (dark) | `border: 1px solid var(--cds-border-disabled)`, `border-radius: 4px` | — |

### Inter-item divider behaviour

The 1px vertical divider between buttons is drawn as a `::before` pseudo-element on every button (block-size 16px, inline-size 1px, background `--cds-border-subtle`). It is automatically suppressed in these conditions (per the SCSS):

- the first button (`first-of-type::before { background-color: transparent; }`)
- buttons immediately following or preceding a focused / hovered / selected button
- both adjacent buttons of a focused / hovered / selected pair

Disabled neighbours change the divider colour to `--cds-border-disabled` instead of suppressing it.

## Animation & Motion

ContentSwitcher's text variant inherits Carbon's productive button motion; the icon-only variant explicitly sets `transition: none` so tooltip choreography stays crisp.

```css
/* Text variant — inherits Carbon's productive button motion */
.cds--content-switcher-btn {
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    box-shadow var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Icon-only variant — instant, no transition */
.cds--content-switcher--icon-only .cds--content-switcher-btn {
  transition: none;
}

/* The selected-pill `::after` animates via transform: scaleY(0 → 1)
   to "grow" the pill from the bottom edge when first selected. */
.cds--content-switcher-btn::after {
  transform: scaleY(0);
  transform-origin: bottom;
  transition: transform var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}
.cds--content-switcher-btn.cds--content-switcher--selected::after {
  transform: scaleY(1);
}

/* Token resolutions:
   --cds-duration-fast-01:           70ms
   --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9)
*/

@media (prefers-reduced-motion: reduce) {
  .cds--content-switcher-btn,
  .cds--content-switcher-btn::after {
    transition: none;
  }
}
```

The selected-pill `transform: scaleY(0 → 1)` choreography is the single piece of motion that makes ContentSwitcher feel different from a plain `<button>` row. It "grows" the inverse rectangle from the bottom edge over 70ms when an item becomes selected. Do not remove this transition — it is the shape of Carbon's segmented control.

## Accessibility (from Carbon's docs + source)

- **Semantic structure:** the container renders as `<div role="tablist">` (`<cds-content-switcher>` in WC). Each item is a `<button role="tab">` (`<cds-content-switcher-item>` in WC).
- **Selection state:** the selected item carries `aria-selected="true"` plus the `cds--content-switcher--selected` class; unselected items carry `aria-selected="false"`. Only the selected item has `tabindex="0"` — others are `tabindex="-1"`. This is the canonical APG tablist pattern: one tab stop, arrow keys move focus inside the group.
- **Selection mode:**
  - `automatic` (default) — left/right arrow keys move focus AND switch the selected item. Use for switchers that gate purely visual content (charts, layouts).
  - `manual` — arrow keys move focus only; Enter or Space activates the focused item. Use when each panel contains forms or stateful content (so arrow-key focus doesn't auto-discard form state).
- **Keyboard:**
  - `Tab` / `Shift+Tab` — enter or leave the entire switcher (one tab stop)
  - `←` / `→` — move focus across items, wrapping past the ends (`capIndex` in `content-switcher.ts` handles the wrap)
  - `Enter` / `Space` — activate the focused item (relevant only in `manual` mode)
  - `Home` / `End` — Carbon's WC implementation does not currently bind these; arrow-only navigation is the documented pattern
- **Icon-only items:** each `<IconSwitch>` (React) takes a `text` prop that is rendered as a tooltip on hover/focus and exposed as the button's accessible name. WC uses `<span slot="tooltip-content">…</span>` plus the slot text becomes the accessible name via the WC element's internal label-setting logic. Always provide a meaningful label — never rely on the icon alone.
- **Disabled state:** apply `disabled` per-item via `<Switch disabled />` (React) or `?disabled` (WC). When every item is disabled, the container's outline flips to `--cds-border-disabled` automatically (via the `:has()` selector in the SCSS).
- **Focus management:** Carbon's CSS draws a 2px `--cds-focus` ring as `box-shadow: inset 0 0 0 2px var(--cds-focus)` (plus `inset 0 0 0 3px var(--cds-focus-inset)` for the selected variant). Do NOT remove this — it is the only visible focus indicator. The icon-only variant suppresses the text-variant focus rectangle and relies on `focus-outline('reset')` from `focus-outline` mixin to draw a system outline instead.
- **Touch target:** Carbon defaults to 32 / 40 / 48px desktop heights. For mobile, prefer the `lg` size (48px) — it meets the 44px minimum touch target. If you must ship `sm` or `md` on mobile, wrap each button in a touch-friendly `min-block-size: 44px` query.
- **Tooltip on icon-only:** the WC element renders `<span slot="tooltip-content">` via an internal popover wrapper (`cds--content-switcher-popover__wrapper`), so tooltips appear on hover *and* focus. The tooltip text is also wired to `aria-label` on the underlying button.
- **High-contrast mode:** the SCSS includes `@include high-contrast-mode('focus')` on the focused button, which emits a `forced-color-adjust` block so Windows HCM users still see the focus ring.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Use `<ContentSwitcher>` + `<Switch>` (React) or `<cds-content-switcher>` + `<cds-content-switcher-item>` (WC) — never substitute a generic `<div>` row of `<button>`s | Don't roll your own segmented control out of buttons + flex; you'll lose the `::after` pill animation, the inter-item divider logic, and the keyboard handler |
| Use `cds--content-switcher`, `cds--content-switcher-btn`, `cds--content-switcher--selected`, `cds--content-switcher--icon-only`, `cds--content-switcher--low-contrast`, `cds--content-switcher--sm` / `--lg` class names from the SCSS source | Don't invent your own classes (`.segmented`, `.tab-group`, `.toggle`) |
| Wrap in `[data-theme="white"]` / `[data-theme="g10"]` / `[data-theme="g90"]` / `[data-theme="g100"]` to flip themes | Don't define your own theme classes — Carbon's theme tokens already know how to flip |
| Use `selectionMode="manual"` (React) / `selection-mode="manual"` (WC) when items gate forms or stateful panels | Don't use `automatic` (default) when arrow-key focus would discard unsaved form state in the active panel |
| Include `aria-label` (via `text` prop in React, `<span slot="tooltip-content">` in WC) for every icon-only item | Don't ship icon-only switchers without per-item accessible names — screen readers will announce "button" only |
| Keep the selected pill `::after` `scaleY(0 → 1)` transition — it is the component's signature motion | Don't remove the transition or set `transform: scaleY(1)` permanently — you'll lose the grow-from-bottom choreography |
| Keep `transition: none` on icon-only buttons (matches Carbon's source) | Don't add hover/focus transitions to icon-only items — they need to feel instantaneous to keep tooltip choreography crisp |
| Use `lowContrast` when the switcher sits on a tonal / coloured surface where the inverse pill (`#161616`) would over-pop | Don't use `lowContrast` for the marquee switcher on a white page — the inverse pill is the higher-impact default |
| Use `sm` (32px) for dense data tables, `md` (40px) as the everyday default, `lg` (48px) for marketing pages and large icon-only triggers | Don't use the deprecated `xl` size — the WC enum still exposes `EXTRA_LARGE = 'xl'` but it is marked `@deprecated`. Use `lg` instead. |
| Place ContentSwitcher inside `<WithLayer>` / Layer wrapper when nested in a Tile, Modal, or panel | Don't place it directly on `--cds-background` when it's nested in a card — the outline will visually disappear into the surrounding stroke |
| Keep one tab stop (selected item `tabindex="0"`, others `tabindex="-1"`) per the APG tablist pattern | Don't make every item tabbable — that violates the tablist contract and creates 3+ tab stops where there should be one |
| Honour `border-radius: 0` per the Carbon shape rules in `overview.md` (the SCSS source uses `border-radius: 4px` on the container outline + selected pill — that is Carbon's accepted exception, do not add additional rounding on top) | Don't add `border-radius: 8px` or higher — that pulls the component into Material / Apple territory |
