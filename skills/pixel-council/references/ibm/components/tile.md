---
name: tile
description: Carbon Tile — sharp-cornered surface container for grouping related content. Variants: Default, Clickable, Selectable, MultiSelect, Radio, Expandable (with above/below-the-fold content), plus Layer-aware and AI-Label-decorated variations.
metadata:
  tags: tile, card, surface, container, clickable, selectable, expandable, radio, multi-select, layer, ai-label, ibm, carbon, react, web-components
---

# Tile -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Tile.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Tile/Tile.stories.js)
> - **WC story:** [`tile.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tile/tile.stories.ts)
> - **SCSS source:** [`tile.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tile/tile.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-tile--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-tile--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/tile/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

Tile is Carbon's foundational surface container — the system's equivalent of a "card", but flat by design. Tiles never use shadow for elevation; they communicate depth via the layer-tier system (`layer-01` → `layer-02` → `layer-03`). Tile is also Carbon's only multi-mode interactive surface: a single visual primitive that adapts to read-only display (`Tile`), navigation (`ClickableTile`), single-pick selection (`RadioTile` inside `TileGroup`), multi-pick selection (`SelectableTile`), or progressive disclosure (`ExpandableTile`).

## Quick Reference

| Property | Value |
|---|---|
| Padding (default) | `16px` (`$spacing-05`) |
| Padding (sm / md / lg compact options) | `16px` / `24px` / `32px` (consumer-controlled, density-aware) |
| Min height | content-driven (no fixed minimum — Tile sizes to children) |
| Corner radius | `0` (Carbon: sharp by default — see Shape Rules) |
| Border (rest) | `1px solid transparent` (AI-labeled) / no border (default) |
| Border (selected, AI) | `1px solid var(--cds-layer-selected-inverse)` |
| Outline (focus baseline) | `2px solid transparent` (replaced by `2px solid var(--cds-focus)` on focus) |
| Font | IBM Plex Sans, body-compact-01 (14px / 18px line-height / 400 weight) |
| Default background (White theme) | `#f4f4f4` (`--cds-layer-01`) |
| Default background (G10 theme) | `#ffffff` (`--cds-layer-01`) |
| Default background (G90 theme) | `#393939` (`--cds-layer-01`) |
| Default background (G100 theme) | `#262626` (`--cds-layer-01`) |
| Hover background (White theme) | `#e8e8e8` (`--cds-layer-hover-01`) |
| Hover background (G100 theme) | `#333333` (`--cds-layer-hover-01`) |
| Selected background (White theme) | `#e0e0e0` (`--cds-layer-selected-01`) |
| Selected background (G100 theme) | `#393939` (`--cds-layer-selected-01`) |
| Hover border tile (White theme) | `#c6c6c6` (`--cds-border-tile-01`) |
| Hover border tile (G100 theme) | `#525252` (`--cds-border-tile-01`) |
| Box shadow | **none** (Carbon never uses shadow on tiles — use Layer tiers for depth) |
| Transition (clickable) | `var(--cds-duration-moderate-01)` (`150ms`) `var(--cds-easing-productive-standard)` |
| Transition (expandable height) | `var(--cds-duration-fast-02)` (`110ms`) `var(--cds-easing-productive-standard)` |
| Focus ring | `2px solid var(--cds-focus)` outline, with `inset 0 0 0 1px var(--cds-background)` companion |
| React import | `import { Tile, ClickableTile, SelectableTile, ExpandableTile, TileAboveTheFoldContent, TileBelowTheFoldContent } from '@carbon/react';` |
| RadioTile import (React) | `import { RadioTile } from '@carbon/react';` (also `TileGroup` from `'@carbon/react'`) |
| WC import | `import '@carbon/web-components/es/components/tile/index.js';` |

## Variants (from Storybook story exports)

Tile is unusual among Carbon components — its "variants" are not just visual states but distinct sub-components (each exported individually from `@carbon/react`). The story file ships **eleven** named exports across React, and **twelve** across Web Components.

| Variant | React story export | WC story export | Sub-component / element | Purpose |
|---|---|---|---|---|
| Default | `Default` | `Default` | `<Tile>` / `<cds-tile>` | Read-only surface with arbitrary content + links |
| Default with Layer | `DefaultWithLayer` | `DefaultWithLayer` | `<Tile>` / `<cds-tile>` | Same as Default, demonstrated against the 3 layer tiers (`layer-01` → `layer-02` → `layer-03`) |
| Clickable | `Clickable` | `clickable` | `<ClickableTile>` / `<cds-clickable-tile>` | Entire tile is a navigation link (`<a>`), with hover + focus states |
| Clickable with custom icon | `ClickableWithCustomIcon` | `clickableWithCustomIcon` | `<ClickableTile renderIcon={Launch}>` / `<cds-clickable-tile>` with `${iconLoader(Launch16, ...)}` | Adds a trailing icon (defaults to ArrowRight on `cds-clickable-tile`; React lets you pass any `@carbon/icons-react` glyph via `renderIcon`) |
| Clickable with Layer | `ClickableWithLayer` | `ClickableWithLayer` | `<ClickableTile>` / `<cds-clickable-tile>` | Clickable variant demonstrated across all layer tiers |
| Selectable | `Selectable` | `Selectable` | `<SelectableTile>` / `<cds-selectable-tile>` | Single tile that toggles a checkmark in the top-right corner; behaves like a checkbox you click anywhere on |
| MultiSelect | `MultiSelect` | `MultiSelect` | Group of `<SelectableTile>` / `<cds-selectable-tile>` siblings inside `<cds-tile-group>` | Multiple selectable tiles share a `name` attribute so consumers can submit them as a multi-value form group |
| Radio | `Radio` | `Radio` | `<TileGroup>` containing `<RadioTile>` / `<cds-tile-group>` containing `<cds-radio-tile>` | Mutually-exclusive tile selection (one selected at a time); `legend` slot/prop announces the group |
| Radio with Layer | `RadioWithLayer` | `RadioWithLayer` | `<TileGroup><RadioTile/></TileGroup>` / `<cds-tile-group><cds-radio-tile>` | Radio variant demonstrated across layer tiers |
| Expandable | `Expandable` | `expandable` | `<ExpandableTile><TileAboveTheFoldContent/><TileBelowTheFoldContent/></ExpandableTile>` / `<cds-expandable-tile>` with same slotted children | Tile with a chevron in the bottom-right that toggles a hidden region (`TileBelowTheFoldContent`) into view |
| Expandable with Interactive | `ExpandableWithInteractive` | `ExpandableWithInteractive` | `<ExpandableTile>` containing focusable children (`Button`, `TextInput`) — WC variant uses the `with-interactive` attribute | When the tile contains its own focusable children, the chevron becomes a separate `<button>` in the corner instead of the entire tile being clickable |
| Expandable with Layer | `ExpandableWithLayer` | `ExpandableWithLayer` | `<ExpandableTile>` / `<cds-expandable-tile>` | Expandable variant demonstrated across layer tiers |
| With AI Label | `withAILabel` | `WithAILabel` | All five sub-components paired with `<AILabel>` / `<cds-ai-label>` decorator | Exercises Carbon's AI-augmented surface affordance — the AI gradient outline appears on hover, and the AI Label popover anchors to a corner of the tile |

The Default, Layer, and AI-label variants share the same components — they exercise different visual contexts, not different APIs.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Tile.stories.js` on the Carbon `main` branch (`packages/react/src/components/Tile/Tile.stories.js`). Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './tile-story.scss';
import '../AILabel/ailabel-story.scss';
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import Link from '../Link';
import Button from '../Button';
import { default as TextInput } from '../TextInput';
import { default as RadioTile } from '../RadioTile';
import {
  ClickableTile,
  ExpandableTile,
  SelectableTile,
  Tile,
  TileAboveTheFoldContent,
  TileBelowTheFoldContent,
} from './';
import { TileGroup } from '../TileGroup';
import {
  Launch,
  ArrowRight,
  View,
  FolderOpen,
  Folders,
  Information,
} from '@carbon/icons-react';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { Tooltip } from '../Tooltip';

import mdx from './Tile.mdx';

export default {
  title: 'Components/Tile',
  component: Tile,
  subcomponents: {
    ClickableTile,
    SelectableTile,
    ExpandableTile,
    RadioTile,
    TileGroup,
    TileAboveTheFoldContent,
    TileBelowTheFoldContent,
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
  },
};
```

**Variant: Default**

```jsx
export const Default = () => {
  return (
    <Tile id="tile-1">
      Default tile
      <br />
      <br />
      <Link href="https://www.carbondesignsystem.com">Link</Link>
    </Tile>
  );
};
```

**Variant: DefaultWithLayer** — identical to `Default` but wrapped in `<WithLayer>{(layer) => ...}</WithLayer>`. The `<WithLayer>` Storybook helper renders three nested layer surfaces so you can see Tile's `--cds-layer-01` adapt to each tier (`layer-01` → `layer-02` → `layer-03`). Same pattern applies to `ClickableWithLayer`, `RadioWithLayer`, and `ExpandableWithLayer` below.

**Variant: Clickable**

```jsx
export const Clickable = (args) => {
  return (
    <ClickableTile
      id="clickable-tile-1"
      href="https://www.carbondesignsystem.com/"
      {...args}>
      Clickable Tile
    </ClickableTile>
  );
};

Clickable.args = {
  disabled: false,
};

Clickable.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: ClickableWithCustomIcon**

```jsx
export const ClickableWithCustomIcon = (args) => {
  return (
    <ClickableTile
      id="clickable-tile-1"
      href="https://www.carbondesignsystem.com/"
      renderIcon={Launch}
      {...args}>
      Clickable Tile
    </ClickableTile>
  );
};

ClickableWithCustomIcon.args = {
  disabled: false,
};

ClickableWithCustomIcon.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: ClickableWithLayer** — `<ClickableTile>` wrapped in `<WithLayer>` (see `DefaultWithLayer` note for the pattern).

**Variant: Selectable**

```jsx
export const Selectable = (args) => {
  return (
    <SelectableTile id="selectable-tile-1" {...args}>
      Selectable
    </SelectableTile>
  );
};

Selectable.args = {
  disabled: false,
};

Selectable.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: MultiSelect**

```jsx
export const MultiSelect = (args) => {
  return (
    <div role="group" aria-label="selectable tiles">
      <SelectableTile id="selectable-tile-1" name="tiles" {...args}>
        Option 1
      </SelectableTile>
      <SelectableTile id="selectable-tile-2" name="tiles" {...args}>
        Option 2
      </SelectableTile>
      <SelectableTile id="selectable-tile-3" name="tiles" {...args}>
        Option 3
      </SelectableTile>
    </div>
  );
};

MultiSelect.args = {
  disabled: false,
};

MultiSelect.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: Radio**

```jsx
export const Radio = (args) => {
  return (
    <TileGroup
      defaultSelected="default-selected"
      legend="Radio Tile Group"
      name="radio tile group"
      {...args}>
      <RadioTile
        id="radio-tile-1"
        value="standard"
        style={{ marginBottom: '.5rem' }}
        {...args}>
        Option 1
      </RadioTile>
      <RadioTile
        id="radio-tile-2"
        value="default-selected"
        style={{ marginBottom: '.5rem' }}
        {...args}>
        Option 2
      </RadioTile>
      <RadioTile id="radio-tile-3" value="selected" {...args}>
        Option 3
      </RadioTile>
    </TileGroup>
  );
};

Radio.args = {
  disabled: false,
};

Radio.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: RadioWithLayer** — `<TileGroup>` of `<RadioTile>` wrapped in `<WithLayer>` (see `DefaultWithLayer` note).

**Variant: Expandable**

```jsx
export const Expandable = () => {
  return (
    <div style={{ width: '400px' }}>
      <ExpandableTile
        id="expandable-tile-1"
        tileCollapsedIconText="Interact to Expand tile"
        tileExpandedIconText="Interact to Collapse tile">
        <TileAboveTheFoldContent>
          <div style={{ height: '200px' }}>Above the fold content here</div>
        </TileAboveTheFoldContent>
        <TileBelowTheFoldContent>
          <div style={{ height: '400px' }}>Below the fold content here</div>
        </TileBelowTheFoldContent>
      </ExpandableTile>
    </div>
  );
};
```

**Variant: ExpandableWithInteractive**

```jsx
export const ExpandableWithInteractive = () => {
  return (
    <div style={{ width: '400px' }}>
      <ExpandableTile
        onClick={() => console.log('click')}
        id="expandable-tile-1"
        tileCollapsedIconText="Interact to Expand tile"
        tileExpandedIconText="Interact to Collapse tile">
        <TileAboveTheFoldContent>
          <div style={{ height: '200px', width: '200px' }}>
            Above the fold content here
            <div style={{ paddingTop: '1rem' }}>
              <Button>Example</Button>
            </div>
          </div>
        </TileAboveTheFoldContent>
        <TileBelowTheFoldContent>
          <div style={{ height: '200px', width: '200px' }}>
            Below the fold content here
            <TextInput id="test2" invalidText="A valid value is required" />
          </div>
        </TileBelowTheFoldContent>
      </ExpandableTile>
    </div>
  );
};
```

**Variant: ExpandableWithLayer** — `<ExpandableTile>` wrapped in `<WithLayer>` (see `DefaultWithLayer` note).

**Variant: withAILabel** (verbatim source omitted for brevity — fetch from the React stories file linked at the top of this document; it spans ~190 lines and exercises every Tile sub-component paired with `<AILabel>`. The `aiLabel` JSX helper, plus the `<Tile decorator={aiLabel}>`, `<ClickableTile decorator>`, `<ExpandableTile decorator={aiLabel}>`, `<SelectableTile decorator={aiLabel}>` (×3), and `<RadioTile decorator={aiLabel}>` (×3) instances are defined inline. The pattern to replicate:

```jsx
import { AILabel, AILabelContent, AILabelActions } from '@carbon/react';

const aiLabel = (
  <AILabel className="ai-label-container">
    <AILabelContent>{/* ... explanation copy ... */}</AILabelContent>
    <AILabelActions>{/* ... IconButton + Button actions ... */}</AILabelActions>
  </AILabel>
);

export const withAILabel = {
  argTypes: { hasRoundedCorners: { control: { type: 'boolean' } } },
  render: (args) => (
    <>
      {/* Tile, ClickableTile, ExpandableTile each pass `decorator={aiLabel}` */}
      {/* Followed by a TileGroup of three SelectableTiles, each with decorator={aiLabel} */}
      {/* Followed by a TileGroup of three RadioTiles, each with decorator={aiLabel} */}
      {/* Full source: see Tile.stories.js link at top of this file */}
    </>
  ),
};
```

The decorator prop is **Experimental** — its description from the source: *"Provide a `decorator` component to be rendered inside the component"*. When `<AILabel>` is passed via `decorator`, the tile gains the AI gradient outline on hover and the AILabel popover anchors to the corner. The optional `hasRoundedCorners` arg is **AI-only** — it's the single legitimate exception to Carbon's sharp-corner rule, and even then only when `decorator` is set.

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `tile.stories.ts` on the Carbon `main` branch (`packages/web-components/src/components/tile/tile.stories.ts`). Use these for non-React projects. The lit-html `${expression}` bindings are preserved — the next section ("Plain HTML") resolves them.

**Imports + helpers + meta (from the top of the stories file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import ArrowRight16 from '@carbon/icons/es/arrow--right/16.js';
import Launch16 from '@carbon/icons/es/launch/16.js';
import './index';
import '../ai-label';
import '../icon-button';
import '../link';
import { iconLoader } from '../../globals/internal/icon-loader';
import storyDocs from './tile.mdx';
import styles from './tile-story.scss?lit';
import { withLayers } from '../../../.storybook/decorators/with-layers';

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

const defaultControls = {
  args: {
    disabled: false,
  },
  argTypes: {
    disabled: {
      control: 'boolean',
    },
  },
};

const meta = {
  title: 'Components/Tile',
  decorators: [(story) => html` <div>${story()}</div> `],
  parameters: {
    actions: { argTypesRegex: '^on.*' },
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
  render: () => html`
    <cds-tile>
      Default tile
      <br />
      <br />
      <cds-link href="https://carbondesignsystem.com">Link</cds-link>
    </cds-tile>
  `,
};
```

**Variant: DefaultWithLayer** — same template as `Default`, but with `decorators: [withLayers]` and `parameters: { layout: 'fullscreen' }` to demonstrate Tile across the three layer tiers. The `withLayers` Storybook decorator nests the component inside `layer-01` → `layer-02` → `layer-03` parents. Same wrapping applies to `ClickableWithLayer`, `ExpandableWithLayer`, and `RadioWithLayer` below.

**Variant: clickable**

```html
export const clickable = {
  ...defaultControls,
  render: ({ disabled }) => html`
    <cds-clickable-tile
      ?disabled="${disabled}"
      href="https://www.carbondesignsystem.com/">
      Clickable tile
    </cds-clickable-tile>
  `,
};
```

**Variant: clickableWithCustomIcon**

```html
export const clickableWithCustomIcon = {
  ...defaultControls,
  render: ({ disabled }) => html`
    <cds-clickable-tile
      ?disabled=${disabled}
      href="https://www.carbondesignsystem.com/">
      Clickable tile ${iconLoader(Launch16, { slot: 'icon' })}
    </cds-clickable-tile>
  `,
};
```

**Variant: ClickableWithLayer** — `<cds-clickable-tile>` with `decorators: [withLayers]` (see `DefaultWithLayer` note).

**Variant: expandable**

```html
export const expandable = {
  render: ({ expanded, disableChange, onBeforeChange, onChange }) => {
    const handleBeforeChanged = (event: CustomEvent) => {
      onBeforeChange(event);
      if (disableChange) {
        event.preventDefault();
      }
    };
    return html`
      <div style="width: 400px">
        <cds-expandable-tile
          ?expanded="${expanded}"
          @cds-expandable-tile-beingchanged=${handleBeforeChanged}
          @cds-expandable-tile-changed=${onChange}>
          <cds-tile-above-the-fold-content
            slot="above-the-fold-content"
            style="height: 200px">
            Above the fold content here
          </cds-tile-above-the-fold-content>
          <cds-tile-below-the-fold-content style="height: 300px">
            Below the fold content here
          </cds-tile-below-the-fold-content>
        </cds-expandable-tile>
      </div>
    `;
  },
};
```

**Variant: ExpandableWithInteractive**

```html
export const ExpandableWithInteractive = {
  render: ({ expanded, disableChange, onBeforeChange, onChange }) => {
    const handleBeforeChanged = (event: CustomEvent) => {
      onBeforeChange(event);
      if (disableChange) {
        event.preventDefault();
      }
    };
    return html`
      <div style="width: 400px">
        <cds-expandable-tile
          with-interactive
          ?expanded="${expanded}"
          @cds-expandable-tile-beingchanged=${handleBeforeChanged}
          @cds-expandable-tile-changed=${onChange}>
          <cds-tile-above-the-fold-content
            slot="above-the-fold-content"
            style="height: 200px; width: 200px">
            Above the fold content here
            <div style="padding-top:1rem;">
              <cds-button>Example</cds-button>
            </div>
          </cds-tile-above-the-fold-content>
          <cds-tile-below-the-fold-content style="height: 200px; width: 200px">
            Below the fold content here
            <cds-text-input></cds-text-input>
          </cds-tile-below-the-fold-content>
        </cds-expandable-tile>
      </div>
    `;
  },
};
```

**Variant: ExpandableWithLayer** — `<cds-expandable-tile>` with `decorators: [withLayers]` (see `DefaultWithLayer` note).

**Variant: MultiSelect**

```html
export const MultiSelect = {
  ...defaultControls,
  render: ({
    checkmarkLabel,
    disabled,
    name,
    selected,
    value,
    onInput,
  }) => html`
    <style>
      ${styles}
    </style>
    <cds-tile-group>
      <cds-selectable-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        ?selected="${selected}"
        value="${ifDefined(value)}"
        @input="${onInput}"
        ?disabled=${disabled}>
        Option 1
      </cds-selectable-tile>
      <cds-selectable-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        ?selected="${selected}"
        value="${ifDefined(value)}"
        @input="${onInput}"
        ?disabled=${disabled}>
        Option 2
      </cds-selectable-tile>
      <cds-selectable-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        ?selected="${selected}"
        value="${ifDefined(value)}"
        @input="${onInput}"
        ?disabled=${disabled}>
        Option 3
      </cds-selectable-tile>
    </cds-tile-group>
  `,
};
```

**Variant: Radio**

```html
export const Radio = {
  ...defaultControls,
  render: ({ checkmarkLabel, disabled, name, value }) => html`
    <cds-tile-group>
      <legend slot="legend">Radio tile group</legend>
      <cds-radio-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        value="${ifDefined(value)}"
        ?disabled=${disabled}>
        Option 1
      </cds-radio-tile>
      <cds-radio-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        value="${ifDefined(value)}"
        ?disabled=${disabled}
        selected>
        Option 2
      </cds-radio-tile>
      <cds-radio-tile
        checkmark-label="${ifDefined(checkmarkLabel)}"
        name="${ifDefined(name)}"
        value="${ifDefined(value)}"
        ?disabled=${disabled}>
        Option 3
      </cds-radio-tile>
    </cds-tile-group>
  `,
};
```

**Variant: RadioWithLayer** — `<cds-tile-group>` of `<cds-radio-tile>` with `decorators: [withLayers]` (see `DefaultWithLayer` note).

**Variant: Selectable**

```html
export const Selectable = {
  ...defaultControls,
  render: (args) => html`
    <cds-selectable-tile ?disabled=${args.disabled}>
      Selectable
    </cds-selectable-tile>
  `,
};
```

**Variant: WithAILabel** (verbatim source omitted for brevity — fetch from the WC stories file linked at the top of this document; it spans ~155 lines and exercises every Tile sub-element paired with `<cds-ai-label>`. The `${content}` and `${actions}` lit-html helpers (defined at the top of the imports block) get slotted into each `<cds-ai-label>` instance. The pattern to replicate:

```html
export const WithAILabel = {
  argTypes: { hasRoundedCorners: { control: 'boolean' } },
  render: (args) => {
    const { hasRoundedCorners } = args ?? {};
    return html`
      <!-- Three columns: <cds-tile>, <cds-clickable-tile ai-label>, <cds-expandable-tile with-interactive>
           Each receives ?has-rounded-corners and a <cds-ai-label slot="decorator"> child
           containing ${content}${actions}.
           Below: a <cds-tile-group> of three <cds-selectable-tile> with <cds-ai-label> child each.
           Below: a <cds-tile-group> of three <cds-radio-tile> with <cds-ai-label> child each. -->
      <div class="ai-label-tile-container">
        <cds-tile ?has-rounded-corners="${hasRoundedCorners}">
          <!-- title, copy, ai-data block -->
          <cds-ai-label alignment="bottom-left" slot="decorator">
            ${content}${actions}</cds-ai-label>
        </cds-tile>
        <!-- ... matching <cds-clickable-tile ai-label> and <cds-expandable-tile with-interactive> ... -->
      </div>
      <!-- TileGroup of three SelectableTiles, each with <cds-ai-label> child -->
      <!-- TileGroup of three RadioTiles, each with <cds-ai-label> child -->`;
  },
};
```

The `?has-rounded-corners` boolean attribute on `<cds-tile>`, `<cds-clickable-tile>`, `<cds-selectable-tile>`, and `<cds-radio-tile>` is the AI-only opt-in for radius. On a non-AI tile it is a no-op — keep it off. The `ai-label` boolean attribute on `<cds-clickable-tile>` toggles the AI gradient outline regardless of decorator slot content.

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?disabled="${disabled}"`, `${ifDefined(...)}`) resolved to static attributes. Use this for hand-coded HTML without a framework. The custom-element tags (`<cds-tile>`, `<cds-clickable-tile>`, etc.) only render once the `@carbon/web-components` package has been registered in the page (`<script type="module" src=".../tile/index.js">`).

**Variant: Default**

```html
<cds-tile>
  Default tile
  <br />
  <br />
  <cds-link href="https://carbondesignsystem.com">Link</cds-link>
</cds-tile>
```

**Variant: Clickable** (`disabled` shown both omitted and present)

```html
<!-- Enabled -->
<cds-clickable-tile href="https://www.carbondesignsystem.com/">
  Clickable tile
</cds-clickable-tile>

<!-- Disabled -->
<cds-clickable-tile disabled href="https://www.carbondesignsystem.com/">
  Clickable tile
</cds-clickable-tile>
```

**Variant: Clickable with custom icon** (icon slotted in via `slot="icon"`; the SVG below is the resolved output of `iconLoader(Launch16, ...)`)

```html
<cds-clickable-tile href="https://www.carbondesignsystem.com/">
  Clickable tile
  <svg
    slot="icon"
    xmlns="http://www.w3.org/2000/svg"
    width="16"
    height="16"
    viewBox="0 0 32 32"
    fill="currentColor"
    aria-hidden="true">
    <path d="M26 28H6a2.0021 2.0021 0 0 1-2-2V6a2.0021 2.0021 0 0 1 2-2h10v2H6v20h20V16h2v10A2.0021 2.0021 0 0 1 26 28Z"></path>
    <path d="M20 2v2h6.586L18 12.586 19.414 14 28 5.414V12h2V2Z"></path>
  </svg>
</cds-clickable-tile>
```

**Variant: Selectable** (single)

```html
<cds-selectable-tile>
  Selectable
</cds-selectable-tile>
```

**Variant: MultiSelect** (no `legend` — `<cds-tile-group>` only; selected state shown on Option 2)

```html
<cds-tile-group>
  <cds-selectable-tile name="tiles" value="opt-1">
    Option 1
  </cds-selectable-tile>
  <cds-selectable-tile name="tiles" value="opt-2" selected>
    Option 2
  </cds-selectable-tile>
  <cds-selectable-tile name="tiles" value="opt-3">
    Option 3
  </cds-selectable-tile>
</cds-tile-group>
```

**Variant: Radio** (`<cds-tile-group>` with `<legend slot="legend">`; one tile pre-`selected`)

```html
<cds-tile-group>
  <legend slot="legend">Radio tile group</legend>
  <cds-radio-tile name="options" value="standard">
    Option 1
  </cds-radio-tile>
  <cds-radio-tile name="options" value="default-selected" selected>
    Option 2
  </cds-radio-tile>
  <cds-radio-tile name="options" value="selected">
    Option 3
  </cds-radio-tile>
</cds-tile-group>
```

**Variant: Expandable** (collapsed by default — add the `expanded` attribute on `<cds-expandable-tile>` to start open)

```html
<div style="width: 400px">
  <cds-expandable-tile>
    <cds-tile-above-the-fold-content
      slot="above-the-fold-content"
      style="height: 200px">
      Above the fold content here
    </cds-tile-above-the-fold-content>
    <cds-tile-below-the-fold-content style="height: 300px">
      Below the fold content here
    </cds-tile-below-the-fold-content>
  </cds-expandable-tile>
</div>
```

**Variant: Expandable with interactive children** (note `with-interactive` attribute — chevron becomes a separate button so inner controls remain focusable)

```html
<div style="width: 400px">
  <cds-expandable-tile with-interactive>
    <cds-tile-above-the-fold-content
      slot="above-the-fold-content"
      style="height: 200px; width: 200px">
      Above the fold content here
      <div style="padding-top:1rem;">
        <cds-button>Example</cds-button>
      </div>
    </cds-tile-above-the-fold-content>
    <cds-tile-below-the-fold-content style="height: 200px; width: 200px">
      Below the fold content here
      <cds-text-input></cds-text-input>
    </cds-tile-below-the-fold-content>
  </cds-expandable-tile>
</div>
```

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by Tile's SCSS to the literal hex values defined in the four-theme system in `overview.md`.

```css
[data-theme="white"] {
  /* Surface — non-interactive Tile + Clickable rest */
  --cds-tile-background: #f4f4f4;            /* layer-01 */
  --cds-tile-background-layer-02: #ffffff;   /* layer-02 — when nested in a layer-01 parent */
  --cds-tile-background-layer-03: #f4f4f4;   /* layer-03 — when nested two deep */
  --cds-tile-text: #161616;                  /* text-primary */
  --cds-tile-text-secondary: #525252;        /* text-secondary */

  /* Interactive — ClickableTile, SelectableTile, RadioTile, ExpandableTile */
  --cds-tile-hover-background: #e8e8e8;      /* layer-hover-01 */
  --cds-tile-active-background: #c6c6c6;     /* layer-active-01 */
  --cds-tile-selected-background: #e0e0e0;   /* layer-selected-01 */
  --cds-tile-selected-hover-background: #c6c6c6; /* layer-selected-hover-01 */

  /* Borders */
  --cds-tile-border-rest: transparent;
  --cds-tile-border-hover: #c6c6c6;          /* border-tile-01 (visible only on AI-decorated tiles per SCSS) */
  --cds-tile-border-selected-ai: #161616;    /* layer-selected-inverse — used for the selected AI-tile border */

  /* Focus */
  --cds-tile-focus: #0f62fe;                 /* focus (blue-60) */
  --cds-tile-focus-inset: #ffffff;           /* background — inset companion ring */

  /* Disabled */
  --cds-tile-disabled-background: #f4f4f4;   /* layer-01 stays the same; only text dims */
  --cds-tile-disabled-text: #c6c6c6;         /* text-disabled */

  /* Expandable chevron */
  --cds-tile-icon: #161616;                  /* icon-primary */
}

[data-theme="g10"] {
  --cds-tile-background: #ffffff;            /* layer-01 inverts vs. White (white surface on gray body) */
  --cds-tile-background-layer-02: #f4f4f4;
  --cds-tile-background-layer-03: #ffffff;
  --cds-tile-text: #161616;
  --cds-tile-text-secondary: #525252;
  --cds-tile-hover-background: #e8e8e8;
  --cds-tile-active-background: #c6c6c6;
  --cds-tile-selected-background: #e0e0e0;
  --cds-tile-selected-hover-background: #c6c6c6;
  --cds-tile-border-rest: transparent;
  --cds-tile-border-hover: #c6c6c6;
  --cds-tile-border-selected-ai: #161616;
  --cds-tile-focus: #0f62fe;
  --cds-tile-focus-inset: #f4f4f4;           /* background of g10 body */
  --cds-tile-disabled-background: #ffffff;
  --cds-tile-disabled-text: #c6c6c6;
  --cds-tile-icon: #161616;
}

[data-theme="g90"] {
  --cds-tile-background: #393939;            /* layer-01 */
  --cds-tile-background-layer-02: #525252;
  --cds-tile-background-layer-03: #6f6f6f;
  --cds-tile-text: #f4f4f4;                  /* text-primary inverts in dark themes */
  --cds-tile-text-secondary: #c6c6c6;
  --cds-tile-hover-background: #4c4c4c;      /* layer-hover-01 */
  --cds-tile-active-background: #6f6f6f;     /* layer-active-01 */
  --cds-tile-selected-background: #525252;   /* layer-selected-01 */
  --cds-tile-selected-hover-background: #636363;
  --cds-tile-border-rest: transparent;
  --cds-tile-border-hover: #6f6f6f;          /* border-tile-01 */
  --cds-tile-border-selected-ai: #f4f4f4;    /* layer-selected-inverse */
  --cds-tile-focus: #ffffff;                 /* focus inverts to white in dark themes */
  --cds-tile-focus-inset: #262626;
  --cds-tile-disabled-background: #393939;
  --cds-tile-disabled-text: #6f6f6f;
  --cds-tile-icon: #f4f4f4;
}

[data-theme="g100"],
.dark {
  --cds-tile-background: #262626;            /* layer-01 */
  --cds-tile-background-layer-02: #393939;
  --cds-tile-background-layer-03: #525252;
  --cds-tile-text: #f4f4f4;
  --cds-tile-text-secondary: #c6c6c6;
  --cds-tile-hover-background: #333333;      /* layer-hover-01 */
  --cds-tile-active-background: #525252;     /* layer-active-01 */
  --cds-tile-selected-background: #393939;   /* layer-selected-01 */
  --cds-tile-selected-hover-background: #474747;
  --cds-tile-border-rest: transparent;
  --cds-tile-border-hover: #525252;          /* border-tile-01 */
  --cds-tile-border-selected-ai: #f4f4f4;
  --cds-tile-focus: #ffffff;
  --cds-tile-focus-inset: #161616;           /* background */
  --cds-tile-disabled-background: #262626;
  --cds-tile-disabled-text: #525252;
  --cds-tile-icon: #f4f4f4;
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/tile/tile.scss`. Carbon's SCSS uses semantic tokens (`$layer`, `$layer-hover`, `$layer-selected-inverse`); the hex values below are resolved against the **White theme** (substitute the matching value from the Design Tokens block above for other themes).

### Default `<cds-tile>` (read-only)

| State | Background | Color | Border / Outline | Other |
|---|---|---|---|---|
| Rest | `#f4f4f4` (`$layer`) | `#161616` (`$text-primary`) | `outline: 2px solid transparent` (Carbon's `$spacing-01 solid transparent`) | `padding: 16px` (`$spacing-05`); no shadow |
| Hover | (no change — non-interactive) | (no change) | (no change) | — |
| Focus | (no change — non-focusable by default) | — | — | — |
| Disabled | (n/a — non-interactive variant has no disabled state) | — | — | — |
| AI-decorated rest | `#f4f4f4` | `#161616` | `1px solid transparent` (per SCSS `border: 1px solid transparent;` for AI tiles) | gradient `::before` overlay at `opacity: 0` |
| AI-decorated hover | `#f4f4f4` | `#161616` | `1px solid transparent` | gradient `::before` `opacity: 1` (the AI aura) |

### `<cds-clickable-tile>`

| State | Background | Color | Outline | Other |
|---|---|---|---|---|
| Rest | `#f4f4f4` (`$layer`) | `#161616` | `2px solid transparent` | `cursor: pointer`; `transition: 150ms` (`$duration-moderate-01 motion(standard, productive)`) |
| Hover | `#e8e8e8` (`$layer-hover`) | `#161616` | `2px solid transparent` | — |
| Active | `#c6c6c6` (`$layer-active`) | `#161616` | `2px solid transparent` | — |
| Focus-visible | (rest bg) | `#161616` | `2px solid #0f62fe` (`$focus`), with `inset 0 0 0 1px #ffffff` (`$background`) | from SCSS `&:focus { @include focus-outline('outline'); }` |
| Disabled | `#f4f4f4` | `#c6c6c6` (`$text-disabled`) | `2px solid transparent` | `cursor: not-allowed`; navigation link is rendered as a disabled `<a>` per SCSS `.#{$prefix}--link--disabled` block |

### `<cds-selectable-tile>` and `<cds-radio-tile>` (and their multi-select grouping)

| State | Background | Color | Outline | Checkmark / Indicator |
|---|---|---|---|---|
| Rest | `#f4f4f4` (`$layer`) | `#161616` | `2px solid transparent` | checkmark `opacity: 0` (top-right corner, per SCSS `.cds--tile__checkmark`) |
| Hover (unselected) | `#e8e8e8` (`$layer-hover`) | `#161616` | `2px solid transparent` | `opacity: 0` |
| Selected | `#e0e0e0` (`$layer-selected`) | `#161616` | `2px solid transparent` | checkmark `opacity: 1` (per SCSS `.cds--tile-input:checked ~ .cds--tile--selectable .cds--tile__checkmark { opacity: 1; }`) |
| Selected hover | `#c6c6c6` (`$layer-selected-hover`) | `#161616` | `2px solid transparent` | `opacity: 1` |
| Focus-visible | (current bg) | `#161616` | `2px solid #0f62fe` + inset `1px #ffffff` | (current) |
| Disabled | `#f4f4f4` | `#c6c6c6` | `2px solid transparent` | dimmed; `cursor: not-allowed` |
| Selected + disabled | `#e0e0e0` | `#c6c6c6` | `2px solid transparent` | visible but desaturated |

### `<cds-expandable-tile>`

| State | Background | Color | Outline | Below-fold height |
|---|---|---|---|---|
| Collapsed (rest) | `#f4f4f4` (`$layer`) | `#161616` | `2px solid transparent` | `max-height: 0`; `transition: max-height 110ms` (`$duration-fast-02`) |
| Collapsed hover | `#e8e8e8` (`$layer`) | `#161616` | `2px solid transparent` | `max-height: 0` |
| Expanded | `#f4f4f4` | `#161616` | `2px solid transparent` | `max-height: <child-height>`; `opacity` fade-in via `transition: 110ms motion(standard, productive)` |
| Focus-within (no `with-interactive`) | (current bg) | `#161616` | `2px solid #0f62fe` + inset `1px #ffffff` | per SCSS `:host(cds-expandable-tile:not([with-interactive]):focus-within) { @include focus-outline('outline'); }` |
| `with-interactive` chevron focus | (current bg) | `#161616` | chevron button gets the focus ring; the tile itself does not | the inner `<button>` for the chevron has its own `2px solid #0f62fe` focus ring |
| Disabled | (n/a — Expandable does not expose a disabled state) | — | — | — |

**Critical Carbon constraints** (from SCSS — never override these):
- `border-radius: 0` — Tile is sharp-cornered. The `has-rounded-corners` attribute is **AI-only** (it pairs with the AI gradient outline). For non-AI Tiles, never apply a radius.
- `box-shadow: none` — Tile never uses drop shadow. Depth comes from the layer-tier system. Wrap a Tile in a `data-layer="01"` parent to nudge it onto `layer-02`.
- The `outline` rather than `border` is intentional — Carbon uses outlines so the focus ring does not change layout (no `1px` shift on focus).

## Animation & Motion

Carbon's source uses these motion tokens for Tile (extracted from `tile.scss`):

```css
/* Clickable tile — hover/active background fade */
.cds--tile--clickable {
  transition: var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);
  /* duration-moderate-01 = 150ms; easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

/* Expandable tile — height + opacity reveal of below-the-fold content */
.cds--tile-content__below-the-fold {
  max-height: 0;
  opacity: 0;
  transition:
    max-height var(--cds-duration-fast-02) var(--cds-easing-productive-standard),
    opacity   var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* duration-fast-02 = 110ms */
}

.cds--tile--is-expanded .cds--tile-content__below-the-fold {
  max-height: var(--cds-expandable-tile-below-fold-height, none);
  opacity: 1;
}

/* AI-labeled tile — gradient aura fade-in on hover */
.cds--tile[ai-label]::before {
  opacity: 0;
  transition: opacity var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
}
.cds--tile[ai-label]:hover::before {
  opacity: 1;
}

/* AI Label decorator slot — slides toward the corner on hover */
.cds--tile [slot="decorator"] {
  transition: inset-inline-end var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
}

/* Reduced-motion override — Carbon respects user preference */
@media (prefers-reduced-motion: reduce) {
  .cds--tile--clickable,
  .cds--tile-content__below-the-fold,
  .cds--tile[ai-label]::before,
  .cds--tile [slot="decorator"] {
    transition: none;
  }
}
```

The two duration tokens you will see Tile use are `--cds-duration-fast-02` (`110ms`) and `--cds-duration-moderate-01` (`150ms`). Both ride the `--cds-easing-productive-standard` curve (`cubic-bezier(0.2, 0, 0.38, 0.9)`) — the productive ladder is the right choice because Tile is a product-UI surface, not a marketing/expressive one.

## Accessibility (from Carbon's docs + source)

- **Semantic elements:**
  - `<cds-tile>` renders a `<div role="region">` (when given a label) or a plain `<div>` (read-only).
  - `<cds-clickable-tile>` renders an internal `<a href="...">` so it behaves like a real link — keyboard `Enter` activates, `Tab` includes it in tab order, screen readers announce it as a link.
  - `<cds-selectable-tile>` renders a hidden `<input type="checkbox">` paired with a `<label>` — entire tile is the click target via the label.
  - `<cds-radio-tile>` renders a hidden `<input type="radio">` paired with a `<label>`, grouped by `name="..."`. Inside `<cds-tile-group>`, `<legend slot="legend">` provides the group label.
  - `<cds-expandable-tile>` renders a `<button aria-expanded="..." aria-controls="...">` for the chevron (or wraps the entire tile in that button when `with-interactive` is *absent*).

- **ARIA Carbon's source applies:**
  - `aria-label` / `aria-labelledby` — pass via `aria-label` attr on `<cds-tile>` and on the selectable/radio/clickable variants. Required when the tile's text content is not enough to identify it.
  - `aria-expanded` — set automatically on the expandable tile's chevron button.
  - `aria-controls` — links the chevron button to the below-the-fold content region.
  - `aria-disabled` (mirror of `disabled`) — applied automatically when `disabled` attribute is present.
  - `checkmark-label` (WC) / `checkmarkLabel` (React) — accessible label for the visual checkmark in selectable/radio tiles. **Always provide this** so screen readers announce "selected" / "not selected" state.
  - For grouped selectable tiles, the React example wraps them in `<div role="group" aria-label="selectable tiles">`. Provide an equivalent `aria-label` or use `<cds-tile-group>` (which sets `role="group"` + `<legend>`) in WC.

- **Keyboard:**
  - `Tab` / `Shift+Tab` — moves focus to the next focusable tile (or to the chevron button on an interactive expandable tile).
  - `Enter` — activates a Clickable tile (follows `href`); toggles a Selectable tile; toggles an Expandable tile's chevron.
  - `Space` — toggles a Selectable tile (checkbox semantics); toggles an Expandable tile.
  - `Arrow Up` / `Arrow Down` — within a `<cds-tile-group>` of `<cds-radio-tile>` siblings, navigates between options (radio-group semantics).
  - When `with-interactive` is set on `<cds-expandable-tile>`, focus enters the inner controls (Button, TextInput) on Tab — the chevron is a separate focus stop.

- **Touch target:** Tile's default padding (`$spacing-05` = `16px`) plus content provides comfortable click targets. The smallest touch target on a Tile is the chevron button on `<cds-expandable-tile>`, which is `32px × 32px` in Carbon's source — meets WCAG 2.5.5 minimum (24px) but consider wrapping mobile-only tiles in a `min-height: 44px` rule for richer touch targets.

- **Focus management:** Carbon's CSS provides `:focus-visible` with the signature double-ring (outer `2px solid var(--cds-focus)` + inner `inset 0 0 0 1px var(--cds-background)`). **DO NOT remove it.** Removing the inset companion ring breaks contrast on light surfaces. The focus styling is applied via the SCSS mixin `@include focus-outline('outline');` — do not override `outline-color` or `outline-offset` without recreating both rings.

- **Color contrast:** Default Tile text (`#161616` on `#f4f4f4`) is 16.05:1 — passes WCAG AAA. In G100, text (`#f4f4f4` on `#262626`) is 14.32:1 — passes AAA. The hover and selected backgrounds were chosen so the contrast stays above 4.5:1 even with `text-secondary` content.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — copy the imports, copy the `(args) =>` signatures, copy the prop bindings | Don't paraphrase or rewrite — the verbatim Storybook code IS the spec; modifications drift away from Carbon |
| Sharp corners (`border-radius: 0`) on every Tile variant | Don't add `border-radius: 4px` / `8px` — that's Material/Apple, not Carbon. The only legitimate radius on a Tile is via the AI-only `has-rounded-corners` attribute, and only when the tile carries an `<cds-ai-label>` |
| Communicate depth with **layer tiers** — wrap a Tile in `data-layer="01"` to push it onto `layer-02`, or use `<WithLayer>` (React) / `withLayers` decorator (WC) | Don't apply `box-shadow` — Carbon Tiles are flat. Shadow is the single biggest tell that a "Carbon" output isn't really Carbon |
| Use `<ClickableTile>` / `<cds-clickable-tile>` for navigation that takes the user somewhere new (renders a real `<a href>`) | Don't put a `<button>` or `<Link>` inside a `<Tile>` and call it clickable — the entire-tile-as-target affordance only comes from the dedicated variant |
| Use `<SelectableTile>` for multi-pick (sibling tiles share a `name`) and `<RadioTile>` inside `<TileGroup>` for single-pick (mutually exclusive) | Don't mix `RadioTile` and `SelectableTile` in the same group — the keyboard semantics differ (radios use arrow keys, checkboxes use Space) |
| Use `<ExpandableTile with-interactive>` (WC) when the tile body contains its own focusable controls — this scopes the chevron as a separate button so Tab order works | Don't put a `<Button>` inside a plain `<ExpandableTile>` (no `with-interactive`) — the entire tile becomes one click target and the inner button gets swallowed |
| Provide `checkmarkLabel` / `checkmark-label` on every `<SelectableTile>` and `<RadioTile>` | Don't rely on the visual checkmark alone — screen readers need the label to announce selection state |
| Use `cds--*` class names from the WC source (or rely on the React shadow-DOM styling) | Don't invent your own classes (`.my-tile`, `.card-rounded`) — Carbon's tokens won't bind to them |
| Wrap your page in `[data-theme="white"]`, `[data-theme="g10"]`, `[data-theme="g90"]`, or `[data-theme="g100"]` | Don't define your own theme classes — the four official themes are all Carbon ships, and the `--cds-*` tokens already invert correctly inside them |
| Keep the focus ring intact (`2px solid var(--cds-focus)` + inset `1px var(--cds-background)`) | Don't `outline: none` on focus — you'll fail WCAG 2.4.7 |
| Honor `prefers-reduced-motion: reduce` — the SCSS already does this for the expandable transition | Don't add custom `transform`, `scale`, or `translate` animations on Tile — Carbon's productive motion is restricted to opacity, background, and max-height |
