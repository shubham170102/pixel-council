---
name: search
description: Carbon Search — magnifier-prefixed input with NO border (background-only treatment) plus a built-in clear button and an Expandable variant that collapses to an icon-only square. Variants from Storybook — Default, Disabled (via arg), Expandable, Skeleton, _WithLayer, ExpandableWithLayer (React) and Default, Expandable, Skeleton, WithLayer, ExpandableWithLayer (Web Components).
metadata:
  tags: search, input, search-field, expandable, skeleton, ibm, carbon, react, web-components
---

# Search -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Search.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Search/Search.stories.js)
> - **WC story:** [`search.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/search/search.stories.ts)
> - **WC defs:** [`defs.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/search/defs.ts)
> - **Styles SCSS:** [`_search.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/search/_search.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-search--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-search--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/search/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (xs / sm / md / lg) | `24px` / `32px` / `40px` / `48px` (from `layout.use('size', $default: 'md', $min: 'xs', $max: 'lg')`) |
| Default size | `md` (40px) |
| Padding-inline | `0 layout.size('height')` — left/right padding equals the field height (so 0 40px on `md`), reserving space for the magnifier icon (left) and the clear button (right) |
| Magnifier icon size | `16px` (`1rem`) |
| Magnifier icon left offset | `calc((layout.size('height') - 1rem) / 2)` — 12px on `md`, 8px on `sm`, 16px on `lg`, 4px on `xs` |
| Clear button (`X`) size | Equal to field height (`24` / `32` / `40` / `48px` square) |
| Border treatment | **NONE on rest** (`border: none` on the input). Distinct from text-input — Search has no bottom border at rest. Hover on the clear button adds a 1px bottom border. |
| Background (White theme, `field-01`) | `#f4f4f4` |
| Background (G100 theme, `field-01`) | `#262626` |
| Background hover (White) | `#e8e8e8` (`field-hover-01`) — applies to clear / magnifier-button hover |
| Background hover (G100) | `#333333` (`field-hover-01`) |
| Light variant background (White, `field-02`) | `#ffffff` |
| Light variant background (G100, `field-02`) | `#393939` |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: -2px` on the input AND on the clear / expand buttons |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Magnifier fill (rest) | `var(--cds-icon-secondary)` — White: `#525252`, G100: `#c6c6c6` |
| Magnifier fill (Expandable, collapsed) | `var(--cds-icon-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Clear-button (`X`) fill | `var(--cds-icon-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Disabled icon fill | `var(--cds-icon-on-color-disabled)` — White: `#8d8d8d`, G100: `#6f6f6f` |
| Disabled text color | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Placeholder color | `var(--cds-text-placeholder)` — White: `#a8a8a8`, G100: `#6f6f6f` |
| Corner radius | `0` (sharp by default — Carbon never rounds the search field) |
| Font | IBM Plex Sans, `body-compact-01` (input value) |
| Expand transition (width) | `var(--cds-duration-fast-01)` 70ms with `productive-standard` easing on the wrapper; padding/placeholder fade `fast-01` 70ms on the input |
| Hover / focus transition | `background-color`, `outline` `var(--cds-duration-fast-02)` 110ms with `productive-standard` easing |
| Default Storybook width | `800px` (controlled by the `defaultWidth` arg, range 300-800) |
| React import | `import { Search, SearchSkeleton, ExpandableSearch } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/search/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `Search.stories.js` | Standard always-visible search field with magnifier on the left and a hidden clear button (revealed once a value is typed). |
| Disabled | (no dedicated export — toggle the `disabled` arg, default `false`) | `Search.stories.js` | Both `<Search>` and `<ExpandableSearch>` accept `disabled` as a story arg. |
| Expandable | `Expandable` | `Search.stories.js` | Renders `<ExpandableSearch>` — a 32×32 / 40×40 / 48×48 magnifier-only icon button that expands to full width on click and collapses when blurred. |
| WithLayer | `_WithLayer` | `Search.stories.js` | Demonstrates `field-01 / 02 / 03` token swap across nested `<Layer>` contexts. |
| ExpandableWithLayer | `ExpandableWithLayer` | `Search.stories.js` | The Expandable variant under the `<Layer>` decorator — verifies the field background steps through all three layer tiers. |
| Skeleton | `Skeleton` | `Search.stories.js` | `<SearchSkeleton size={size} />` — shimmer placeholder while content loads. |
| WC: Default | `Default` | `search.stories.ts` | Renders `<cds-search>` with all shared args. |
| WC: Expandable | `Expandable` | `search.stories.ts` | `<cds-search expandable ?expanded=...>` — the Web Components equivalent of `<ExpandableSearch>`. |
| WC: ExpandableWithLayer | `ExpandableWithLayer` | `search.stories.ts` | Expandable variant under the `withLayers` decorator. |
| WC: WithLayer | `WithLayer` | `search.stories.ts` | Layer-token swap via `withLayers` decorator. |
| WC: Skeleton | `Skeleton` | `search.stories.ts` | `<cds-search-skeleton size="...">` placeholder. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Search.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `Search.stories.js`):

```jsx
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import ExpandableSearch from '../ExpandableSearch';
import Search from '.';
import SearchSkeleton from './Search.Skeleton';
import mdx from './Search.mdx';
```

**Default args** (apply to every story unless overridden):

```jsx
args: {
  closeButtonLabelText: 'Clear search input',
  disabled: false,
  defaultWidth: 800,
  labelText: 'Search',
  placeholder: 'Placeholder text',
  size: 'md',
  type: 'search',
},
```

`size` is one of `'xs' | 'sm' | 'md' | 'lg'`.

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...searchArgs }) => (
  <div style={{ width: defaultWidth }}>
    <Search id="search-default-1" {...searchArgs} />
  </div>
);
Default.parameters = { ...defaultParameters };
```

Where `defaultParameters` excludes the `isExpanded`, `renderIcon`, and `role` controls:

```jsx
const defaultParameters = {
  controls: {
    exclude: ['isExpanded', 'renderIcon', 'role'],
  },
};
```

**Variant: Expandable** (renders `<ExpandableSearch>`, NOT `<Search expandable>`)

```jsx
export const Expandable = ({ defaultWidth, ...searchArgs }) => (
  <div style={{ marginTop: '25px', width: defaultWidth }}>
    <ExpandableSearch id="search-expandable-1" {...searchArgs} />
  </div>
);
Expandable.parameters = { ...expandableParameters };
```

Where `expandableParameters` keeps the `isExpanded` control visible:

```jsx
const expandableParameters = {
  controls: {
    exclude: ['renderIcon', 'role'],
  },
};
```

**Variant: WithLayer**

```jsx
export const _WithLayer = ({ defaultWidth, ...searchArgs }) => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: defaultWidth }}>
        <Search id={`search-${layer}`} {...searchArgs} />
      </div>
    )}
  </WithLayer>
);
_WithLayer.parameters = { ...defaultParameters };
```

**Variant: ExpandableWithLayer**

```jsx
export const ExpandableWithLayer = ({ defaultWidth, ...searchArgs }) => (
  <WithLayer>
    {(layer) => (
      <div style={{ marginTop: '25px', width: defaultWidth }}>
        <ExpandableSearch id={`search-expandable-${layer}`} {...searchArgs} />
      </div>
    )}
  </WithLayer>
);
ExpandableWithLayer.parameters = { ...expandableParameters };
```

**Variant: Skeleton**

```jsx
export const Skeleton = ({ size, defaultWidth }) => (
  <div style={{ width: defaultWidth }}>
    <SearchSkeleton size={size} />
  </div>
);
Skeleton.argTypes = {
  size: {
    description: 'Specify the size of the SearchSkeleton',
  },
};
Skeleton.parameters = {
  controls: {
    include: ['size', 'defaultWidth'],
  },
};
```

**Variant: Disabled** (no dedicated story export — set the `disabled` arg on any of the above; SCSS adds the `.cds--search--disabled` modifier class)

```jsx
<Search
  id="search-disabled-1"
  disabled
  labelText="Search"
  placeholder="Placeholder text"
  size="md"
  closeButtonLabelText="Clear search input"
/>
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `search.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `search.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { SEARCH_SIZE } from './defs';
import './search-skeleton';
import '../layer';
import './index';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Default args** (apply to every story unless overridden):

```ts
const args = {
  autoComplete: 'off',
  closeButtonLabelText: 'Clear search input',
  defaultWidth: 800,
  disabled: false,
  labelText: 'Search',
  placeholder: 'Placeholder text',
  role: 'searchbox',
  size: SEARCH_SIZE.MEDIUM, // 'md'
  type: 'text',
  value: '',
};
```

`SEARCH_SIZE` enum (from `defs.ts`):

```ts
export enum SEARCH_SIZE {
  EXTRA_SMALL = 'xs',
  SMALL       = 'sm',
  MEDIUM      = 'md',
  LARGE       = 'lg',
}
```

**Variant: Default**

```ts
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      autoComplete,
      closeButtonLabelText,
      colorScheme,
      disabled,
      labelText,
      placeholder,
      defaultWidth,
      size,
      role,
      type,
      value,
      onInput,
    } = args ?? {};
    return html`
      <div style="width: ${defaultWidth}px;">
        <cds-search
          autocomplete="${autoComplete}"
          close-button-label-text="${ifDefined(closeButtonLabelText)}"
          color-scheme="${ifDefined(colorScheme)}"
          ?disabled="${disabled}"
          label-text="${ifDefined(labelText)}"
          placeholder="${ifDefined(placeholder)}"
          size="${ifDefined(size)}"
          type="${ifDefined(type)}"
          role=${role}
          value="${ifDefined(value)}"
          @cds-search-input="${onInput}"></cds-search>
      </div>
    `;
  },
};
```

**Variant: Expandable** (single `<cds-search>` element with the `expandable` attribute — NOT a separate component on the WC side)

```ts
export const Expandable = {
  args: { ...args, expanded: false },
  argTypes,
  render: (args) => {
    const {
      autoComplete,
      closeButtonLabelText,
      colorScheme,
      disabled,
      labelText,
      placeholder,
      defaultWidth,
      expanded,
      size,
      role,
      type,
      value,
      onInput,
    } = args ?? {};
    return html`
      <div style="width: ${defaultWidth}px;">
        <cds-search
          autocomplete="${autoComplete}"
          close-button-label-text="${ifDefined(closeButtonLabelText)}"
          color-scheme="${ifDefined(colorScheme)}"
          ?disabled="${disabled}"
          label-text="${ifDefined(labelText)}"
          placeholder="${ifDefined(placeholder)}"
          size="${ifDefined(size)}"
          type="${ifDefined(type)}"
          role=${role}
          value="${ifDefined(value)}"
          @cds-search-input="${onInput}"
          expandable
          ?expanded=${expanded}></cds-search>
      </div>
    `;
  },
};
```

**Variant: ExpandableWithLayer** (identical render to `Expandable`, plus `decorators: [withLayers]` and `parameters: { layout: 'fullscreen' }` — the layer decorator wraps the same `<cds-search expandable>` in nested `<cds-layer>` containers so the field background steps through the three layer tiers).

**Variant: WithLayer** (identical render to `Default`, plus `decorators: [withLayers]` and `parameters: { layout: 'fullscreen' }` — same wrapping behavior as `ExpandableWithLayer` but without the `expandable` attribute).

**Variant: Skeleton**

```ts
export const Skeleton = {
  args,
  argTypes: {
    ...argTypes,
    size: {
      ...argTypes.size,
      description: 'Specify the size of the Search Skeleton.',
    },
  },
  parameters: {
    controls: {
      include: ['size', 'defaultWidth'],
    },
  },
  render: (args) => {
    const { size, defaultWidth } = args ?? {};
    return html` <div style="width: ${defaultWidth}px;">
      <cds-search-skeleton size="${size}"></cds-search-skeleton>
    </div>`;
  },
};
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?attr=${value}`, `${ifDefined(...)}`, `.value=${...}`) resolved to static attributes using the shared default args. Use this for hand-coded HTML without a component framework. The component itself is still a custom element — you must register `@carbon/web-components/es/components/search/index.js` for it to upgrade.

**Variant: Default** (size `md`, width `800px`)

```html
<div style="width: 800px;">
  <cds-search
    autocomplete="off"
    close-button-label-text="Clear search input"
    label-text="Search"
    placeholder="Placeholder text"
    size="md"
    type="text"
    role="searchbox"
    value="">
  </cds-search>
</div>
```

**Variant: Expandable** (collapsed by default — 40×40 magnifier square that expands on focus)

```html
<div style="width: 800px;">
  <cds-search
    autocomplete="off"
    close-button-label-text="Clear search input"
    label-text="Search"
    placeholder="Placeholder text"
    size="md"
    type="text"
    role="searchbox"
    value=""
    expandable>
  </cds-search>
</div>
```

**Variant: Expandable (expanded state)** (toggle the `expanded` attribute to start in the open state)

```html
<div style="width: 800px;">
  <cds-search
    autocomplete="off"
    close-button-label-text="Clear search input"
    label-text="Search"
    placeholder="Placeholder text"
    size="md"
    type="text"
    role="searchbox"
    value=""
    expandable
    expanded>
  </cds-search>
</div>
```

**Variant: Disabled**

```html
<div style="width: 800px;">
  <cds-search
    disabled
    autocomplete="off"
    close-button-label-text="Clear search input"
    label-text="Search"
    placeholder="Placeholder text"
    size="md"
    type="text"
    role="searchbox"
    value="">
  </cds-search>
</div>
```

**Variant: Skeleton** (size `md`, width `800px`)

```html
<div style="width: 800px;">
  <cds-search-skeleton size="md"></cds-search-skeleton>
</div>
```

**Other sizes** — swap the `size` attribute on any of the markup above to one of `xs` (24px), `sm` (32px), `md` (40px, default), or `lg` (48px). The magnifier icon stays at 16px on all sizes; only the field height and the inset of the magnifier change.

## Design Tokens (component-scoped, resolved from overview.md)

The Storybook source uses semantic tokens (`$field`, `$field-02`, `$field-hover`, `$icon-primary`, `$icon-secondary`, `$icon-on-color-disabled`, `$icon-disabled`, `$text-primary`, `$text-disabled`, `$border-strong`, `$background-hover`, `$background-selected`, `$focus`). Below are those tokens resolved to literal hex for the two canonical themes (White and G100).

```css
[data-theme="white"] {
  /* Field background — flat, NO border at rest (this is what makes Search distinct from text-input) */
  --cds-search-background:        #f4f4f4; /* field-01 */
  --cds-search-background-light:  #ffffff; /* field-02 — used by .cds--search--light modifier */
  --cds-search-background-hover:  #e8e8e8; /* field-hover-01 — applies to clear button + magnifier-button hover */

  /* Border treatment — Search has NO rest border. The clear button picks up a 1px bottom border on hover only. */
  --cds-search-border-bottom-hover: #8d8d8d; /* border-strong-01 — appears under .cds--search-close on :hover */

  /* Focus ring (outline overlays input + clear button + expandable magnifier) */
  --cds-search-focus:             #0f62fe; /* focus */
  --cds-search-focus-inset:       #ffffff; /* focus-inset */

  /* Text */
  --cds-search-color:             #161616; /* text-primary — typed value */
  --cds-search-placeholder:       #a8a8a8; /* text-placeholder */

  /* Icons */
  --cds-search-magnifier:         #525252; /* icon-secondary — magnifier on the default variant (rest) */
  --cds-search-magnifier-expandable-rest: #161616; /* icon-primary — magnifier on the EXPANDABLE collapsed state */
  --cds-search-magnifier-expandable-expanded: #525252; /* icon-secondary — magnifier on the EXPANDABLE expanded state */
  --cds-search-close-fill:        #161616; /* icon-primary — clear (X) button glyph */

  /* Disabled */
  --cds-search-disabled-bg:       #f4f4f4;                    /* field-01 unchanged */
  --cds-search-disabled-color:    rgba(22, 22, 22, 0.25);     /* text-disabled */
  --cds-search-disabled-icon:     #8d8d8d;                    /* icon-on-color-disabled — applies to non-expandable disabled state */
  --cds-search-disabled-icon-expandable: rgba(22, 22, 22, 0.25); /* icon-disabled — applies to expandable disabled state */

  /* Skeleton */
  --cds-search-skeleton-bg:       #e8e8e8; /* skeleton-background */
  --cds-search-skeleton-element:  #c6c6c6; /* skeleton-element */
}

[data-theme="g100"],
.dark {
  --cds-search-background:        #262626; /* field-01 (G100) */
  --cds-search-background-light:  #393939; /* field-02 (G100) */
  --cds-search-background-hover:  #333333; /* field-hover-01 (G100) */

  --cds-search-border-bottom-hover: #6f6f6f; /* border-strong-01 (G100) */

  --cds-search-focus:             #ffffff; /* focus inverts on dark */
  --cds-search-focus-inset:       #161616; /* focus-inset */

  --cds-search-color:             #f4f4f4; /* text-primary (G100) */
  --cds-search-placeholder:       #6f6f6f; /* text-placeholder (G100) */

  --cds-search-magnifier:         #c6c6c6; /* icon-secondary (G100) */
  --cds-search-magnifier-expandable-rest: #f4f4f4; /* icon-primary (G100) */
  --cds-search-magnifier-expandable-expanded: #c6c6c6; /* icon-secondary (G100) */
  --cds-search-close-fill:        #f4f4f4; /* icon-primary (G100) */

  --cds-search-disabled-bg:       #262626;
  --cds-search-disabled-color:    rgba(244, 244, 244, 0.25);
  --cds-search-disabled-icon:     #6f6f6f;                       /* icon-on-color-disabled (G100) */
  --cds-search-disabled-icon-expandable: rgba(244, 244, 244, 0.25); /* icon-disabled (G100) */

  --cds-search-skeleton-bg:       #292929;
  --cds-search-skeleton-element:  #393939;
}

/* Sharp corners — Carbon's default. NEVER round a Search field. */
.cds--search,
.cds--search-input,
cds-search {
  border-radius: 0;
}
```

## States Reference (from `_search.scss` and Carbon styles)

> The shipped `packages/styles/scss/components/search/_search.scss` is the single source of truth for every variant. The state values below resolve those styles to literal hex per theme. Note the magnifier sits on `position: absolute` with `pointer-events: none` on the default variant — it is decorative; the input itself receives the click.

| State | Background | Text color | Border | Outline | Icon fills |
|---|---|---|---|---|---|
| Rest (White) | `#f4f4f4` (`field-01`) | `#161616` | NONE on input; clear button has `border: 0 0 1px solid transparent` | none | magnifier `#525252`; clear `#161616` |
| Rest (G100) | `#262626` | `#f4f4f4` | NONE on input; clear button has `0 0 1px solid transparent` | none | magnifier `#c6c6c6`; clear `#f4f4f4` |
| Hover on input area (White) | `#f4f4f4` (input itself does NOT change bg on hover; only the clear / magnifier button buttons do) | `#161616` | unchanged | none | unchanged |
| Hover on clear button (White) | `#e8e8e8` (`field-hover-01`) | `#161616` | clear button bottom border becomes `1px solid #8d8d8d` (`border-strong-01`) | none | clear `#161616` |
| Hover on clear button (G100) | `#333333` | `#f4f4f4` | clear button bottom border becomes `1px solid #6f6f6f` | none | clear `#f4f4f4` |
| Focus on input (White) | `#f4f4f4` | `#161616` | input has none | `outline: 2px solid #0f62fe; outline-offset: -2px` (focus ring sits inside the field) | unchanged |
| Focus on input (G100) | `#262626` | `#f4f4f4` | none | `outline: 2px solid #ffffff; outline-offset: -2px` | unchanged |
| Focus on clear button (White) | `#f4f4f4` (rest bg) | n/a | none | `outline: 2px solid #0f62fe; outline-offset: -2px` | clear `#161616` |
| Focus on clear button (G100) | `#262626` | n/a | none | `outline: 2px solid #ffffff; outline-offset: -2px` | clear `#f4f4f4` |
| Active on clear button (White) | `#e0e0e0` (`background-selected`) | n/a | none | `outline: 2px solid #0f62fe; outline-offset: -2px` | clear `#161616` |
| Active on clear button (G100) | `rgba(141, 141, 141, 0.24)` (`background-selected`) | n/a | none | `outline: 2px solid #ffffff; outline-offset: -2px` | clear `#f4f4f4` |
| Disabled (White, default variant) | `#f4f4f4` (unchanged) | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | input `border-block-end: 1px solid transparent`; placeholder color matches `field-01` so it visually disappears | none | magnifier + clear `#8d8d8d` (`icon-on-color-disabled`) |
| Disabled (G100, default variant) | `#262626` | `rgba(244, 244, 244, 0.25)` | `1px solid transparent` | none | icons `#6f6f6f` |
| Disabled (White, expandable) | `#f4f4f4` | n/a | none | none | magnifier `rgba(22, 22, 22, 0.25)` (`icon-disabled`) — the expandable variant uses a different disabled icon token |
| Disabled (G100, expandable) | `#262626` | n/a | none | none | magnifier `rgba(244, 244, 244, 0.25)` |
| Light variant (White, `--light` modifier) | `#ffffff` (`field-02`) — for use on tinted page backgrounds where `field-01` would blend in | `#161616` | none | (focus ring same as default) | unchanged |
| Light variant (G100) | `#393939` (`field-02`) | `#f4f4f4` | none | (focus ring same) | unchanged |
| With value (clear button shown) | (rest bg) | `#161616` (White) / `#f4f4f4` (G100) | none | none | clear visible at `opacity: 1; visibility: visible` |
| Without value (clear button hidden) | (rest bg) | placeholder visible | none | none | clear at `opacity: 0; visibility: hidden` (`.cds--search-close--hidden`) |
| Expandable, collapsed | (rest bg) on a square equal to height | n/a | none | none | magnifier `#161616` (White) / `#f4f4f4` (G100) at `icon-primary` strength to read as a button affordance |
| Expandable, collapsed, hover | `#e8e8e8` (`background-hover` 12% gray-50) (White) / `rgba(141, 141, 141, 0.16)` (G100) on the magnifier square | n/a | none | none | magnifier unchanged |
| Expandable, collapsed, focus | rest bg | n/a | none | `outline: 2px solid var(--cds-focus)` directly on the magnifier square | magnifier unchanged |
| Expandable, expanded | (rest bg, full width) | typed value `#161616` / `#f4f4f4` | none | (focus same as default) | magnifier weakens to `icon-secondary` (`#525252` / `#c6c6c6`) and `pointer-events: none` (the field itself owns the click area now) |
| Skeleton | `#e8e8e8` shimmer (White) / `#292929` (G100), `#c6c6c6` / `#393939` element bar | n/a | none | none | placeholder color forced to `transparent` |

### Padding rules (verbatim from `_search.scss`)

```scss
.#{$prefix}--search-input {
  // Padding equals the field height on both sides — leaves square gutters
  // for the magnifier (left) and the clear button (right).
  padding: 0 layout.size('height');
}

.#{$prefix}--search-magnifier-icon {
  // 16px square icon, vertically centered, horizontally inset by half of
  // the height-minus-icon — produces 12px on `md`, 8px on `sm`, 16px on `lg`.
  block-size: convert.to-rem(16px);
  inline-size: convert.to-rem(16px);
  inset-block-start: 50%;
  inset-inline-start: calc((layout.size('height') - 1rem) / 2);
  pointer-events: none;          // magnifier on the DEFAULT variant is decorative
  transform: translateY(-50%);
}

.#{$prefix}--search-close,
~ .#{$prefix}--search-button {
  // Clear button + adjacent button are square (height x height)
  block-size: layout.size('height');
  inline-size: layout.size('height');
}

.#{$prefix}--search--expandable .#{$prefix}--search-input {
  // Expandable collapsed: the input shrinks to 0 width and loses padding
  padding: 0;
  inline-size: 0;
  transition: transform var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

.#{$prefix}--search--expandable.#{$prefix}--search--expanded .#{$prefix}--search-input {
  // Expandable expanded: padding + width restored
  padding: 0 layout.size('height');
  inline-size: 100%;
  transition: padding var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `_search.scss`):

```css
.cds--search-input,
cds-search::part(input) {
  /* Background + outline fade on hover/focus */
  transition:
    background-color var(--cds-duration-fast-02) var(--cds-easing-productive-standard),
    outline           var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
}

.cds--search--expandable {
  /* Wrapper width animates as the field expands */
  transition: width var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

.cds--search--expandable .cds--search-input {
  /* Input slides / shrinks during the collapsed state */
  transition: transform var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

.cds--search--expandable .cds--search-input::placeholder {
  /* Placeholder fades in/out during expand/collapse so it never appears mid-animation */
  transition-duration: var(--cds-duration-fast-01);
  transition-property: padding, opacity;
  transition-timing-function: var(--cds-easing-productive-standard);
}

.cds--search--expandable.cds--search--expanded .cds--search-input {
  /* When the field opens, padding animates from 0 to layout.size('height') */
  transition: padding var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Skeleton shimmer (shared with all Carbon skeletons) */
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
.cds--skeleton .cds--search-input { animation: skeleton 3s cubic-bezier(0.4, 0.14, 0.3, 1) infinite; }

@media (prefers-reduced-motion: reduce) {
  .cds--search-input,
  cds-search::part(input),
  .cds--search--expandable,
  .cds--search--expandable .cds--search-input { transition: none; }
  .cds--skeleton .cds--search-input { animation: none; }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms` — used for the expand/collapse choreography (snappy, productive)
- `--cds-duration-fast-02` = `110ms` — used for hover/focus fades on the input + buttons
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`

Note that the Carbon docs reference a 240ms expressive entrance for some motion narratives, but the **actual shipped Search source uses 70ms (`fast-01`) productive-standard** for the expand animation — Search is a productive UI element, not an expressive marketing surface. Use the source values above.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** the underlying form control is a native `<input>` — the React `Search` defaults to `type="search"`, the WC default is `type="text"` with `role="searchbox"`. Either form is announced as a search field by screen readers.
- **Label association:** Carbon ALWAYS renders a `<label>` element wired by `id` / `for` (React: `labelText` prop; WC: `label-text` attribute). The label is **visually hidden by default** (`@include visually-hidden`) but kept in the accessibility tree so screen readers announce it. The visible affordance is the magnifier icon plus the placeholder text.
- **Magnifier icon:** rendered as an inline SVG with `aria-hidden="true"` — it carries no semantic value beyond decoration. On the **default** variant the magnifier has `pointer-events: none`, so it does not steal clicks from the input. On the **expandable** variant the magnifier IS the click target while collapsed (it is rendered as an actual `<button>` and receives focus).
- **Clear button:** rendered as a `<button type="button" aria-label="${closeButtonLabelText}">` (default `"Clear search input"`, customizable per locale). It is hidden via `opacity: 0; visibility: hidden` (the `.cds--search-close--hidden` class) when the input value is empty so screen readers do not announce it; it becomes visible and tabbable as soon as the user types. Clicking it clears the value AND restores focus to the input.
- **Expandable variant:**
  - Collapsed: only the magnifier square is in the tab order. It uses `aria-expanded="false"` and toggles to `aria-expanded="true"` on activation. The collapsed magnifier carries the visible label text via `aria-label`.
  - Expanded: the input gains focus and the magnifier becomes decorative (`pointer-events: none`). Blurring the input collapses the field IF the value is empty.
- **`disabled`:** sets `disabled` on the native input and on the clear/magnifier buttons. Removes them from the tab order. Applies `cursor: not-allowed` and the disabled icon fill (`#8d8d8d` White / `#6f6f6f` G100 on the default variant; `rgba(...,0.25)` on expandable).
- **Keyboard:**
  - `Tab` — focus the input, then the clear button (only when value is non-empty).
  - `Esc` (Expandable variant) — collapse the field if the value is empty (Carbon's `<ExpandableSearch>` handles this; the WC equivalent listens for the same key).
  - `Enter` inside a `<form>` submits per the platform default.
- **Focus management:** Carbon ships a `:focus-visible` rule that places `2px solid var(--cds-focus)` outline with `outline-offset: -2px` so the ring sits flush inside the field and inside the clear button. DO NOT remove either — combined with the lack of a rest border, the focus ring IS the only visible state indicator on the input.
- **Touch target:** medium (`md`, 40px) clears WCAG 2.1 Level AAA only at `lg` (48px). For touch-first UI, prefer `size="lg"`.
- **Color contrast:** placeholder text `#a8a8a8` on `#f4f4f4` (White theme) is 2.4:1 — below WCAG AA. Carbon documents this and explicitly forbids using placeholder text to communicate required information; the visible label (`labelText`) is what carries semantics, even when it is `cds--visually-hidden`.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Use background-only treatment — `background: var(--cds-field-01)` and NO border on the input at rest | Don't add a bottom border on Search at rest — that's text-input. Search reads as a *surface*, not a field. |
| Sharp corners (`border-radius: 0`) on every Search field | Don't round the corners — that's Material / Apple, not Carbon |
| Use `<Search>` for always-visible search rows (top-of-page filter bars, list filters, omnibox) | Don't use `<Search>` inside narrow toolbars where space is precious — use `<ExpandableSearch>` instead |
| Use `<ExpandableSearch>` (React) or `<cds-search expandable>` (WC) for icon-bar surfaces (header chrome, dense toolbars) | Don't roll your own collapse animation — Carbon's `width` + `transform` + `padding` choreography is tuned to land at exactly 70ms with productive-standard easing |
| Pass `closeButtonLabelText` so the clear button has an accessible name in the user's locale | Don't omit `closeButtonLabelText` — the default English string is the only fallback and it's not auto-translated |
| Pass `labelText` even though it's visually hidden — the magnifier icon is decorative for screen readers | Don't rely on `placeholder` to label the field — placeholder text disappears when typing and fails WCAG contrast for body text |
| Set `size="lg"` (48px) on touch-first surfaces | Don't ship `size="xs"` (24px) on touch — it is well below the WCAG touch-target threshold |
| Render magnifier with `pointer-events: none` on the default variant so the input owns the click area | Don't make the magnifier clickable on the default variant — that's the expandable variant's behavior, and conflating them confuses users |
| Use the `.cds--search--light` modifier when placing Search on a tinted page background where `field-01` would blend in | Don't manually swap the background hex — let the modifier class flip `field-01 → field-02` so theme switching still works |
| Wrap pages in `[data-theme="white"]` or `[data-theme="g100"]` so token values resolve correctly | Don't hard-code `--cds-*` overrides — let the theme cascade do its job |
| Hide the clear button (`opacity: 0; visibility: hidden`) when value is empty so screen readers don't announce a useless control | Don't render an always-visible clear button — Carbon explicitly hides it until there is something to clear |
