---
name: overflow-menu
description: Carbon OverflowMenu (3-dot trigger + floating action list) plus the related Menu and MenuButton primitives that share the same menu surface. OverflowMenu variants Default (six-item action list with disabled + danger items) and RenderCustomIcon (Filter-icon trigger). Menu variants Default (full-feature menu with submenu, divider, group, selectable, radio-group, danger). MenuButton variants Default, ExperimentalAutoAlign, WithDanger, WithDividers, WithIcons, WithNestedMenu, WithMenuAlignment. Tokenised on `--cds-layer-01` background, `--cds-layer-hover` item hover, sharp `border-radius: 0`, IBM Plex Sans body-compact-01.
metadata:
  tags: overflow-menu, menu, menu-button, context-menu, action-list, three-dot, kebab, dropdown, danger, divider, submenu, ibm, carbon, react, web-components
---

# Overflow Menu -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (OverflowMenu):** [`OverflowMenu.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/OverflowMenu/OverflowMenu.stories.js)
> - **React story (Menu):** [`Menu.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Menu/Menu.stories.js)
> - **React story (MenuButton):** [`MenuButton.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/MenuButton/MenuButton.stories.js)
> - **WC story (overflow-menu):** [`overflow-menu.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/overflow-menu/overflow-menu.stories.ts)
> - **WC story (menu):** [`menu.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/menu/menu.stories.ts)
> - **WC story (menu-button):** [`menu-button.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/menu-button/menu-button.stories.ts)
> - **Styles SCSS:** [`_overflow-menu.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/overflow-menu/_overflow-menu.scss) (398 lines) — declares the `overflow-menu` mixin, all size modifiers, the four `data-floating-menu-direction` carets, item btn `body-compact-01` type, danger / disabled / divider modifiers.
> - **WC raw SCSS (host bindings):** [`overflow-menu.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/overflow-menu/overflow-menu.scss) (247 lines) — maps host attributes (`size`, `open`, `disabled`, `danger`, `divider`) onto the styles mixin and applies the breadcrumb-overflow special case.
> - **Storybook live (OverflowMenu, React):** https://react.carbondesignsystem.com/?path=/story/components-overflowmenu--default
> - **Storybook live (OverflowMenu, WC):** https://web-components.carbondesignsystem.com/?path=/story/components-overflow-menu--default
> - **Storybook live (Menu, React):** https://react.carbondesignsystem.com/?path=/story/components-menu--default
> - **Storybook live (MenuButton, React):** https://react.carbondesignsystem.com/?path=/story/components-menubutton--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/overflow-menu/usage/ — and https://v11.carbondesignsystem.com/components/menu-button/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license.
>
> **Story-export inventory (truth from source):** OverflowMenu's `OverflowMenu.stories.js` ships exactly **two** exports — `Default` and `RenderCustomIcon`. **There is no `WithLinks` export at v11**; the legacy v10 `WithLinks` story was retired when the team consolidated link-style overflow items into a generic `<OverflowMenuItem href="...">` prop (the `<a>` element is a render-time choice on `OverflowMenuItem`, not a separate story). To cover the "menu items as anchor links" pattern, see the **Plain HTML — Variant: WithLinks (derived)** section below, which renders the Default item list with `href` instead of `onClick`.

## Quick Reference

| Property | Value |
|---|---|
| **Corner radius** | **`border-radius: 0`** — Carbon's sharp-by-default rule applies. Overflow menus, menu items, dividers, and the trigger button are all rectangular. (Compare with Popover / Toggletip / Tag, which are the only Carbon components that intentionally break the sharp-corner rule with `border-radius: 2px`.) |
| Trigger size — md (default) | **40 × 40 px** (`block-size: $spacing-08`, `inline-size: $spacing-08`, `min-block-size: $spacing-08`). |
| Trigger size — xs / sm / lg | **24 × 24 px** (`$spacing-06`) / **32 × 32 px** (`$spacing-07`) / **48 × 48 px** (`$spacing-09`). Set via `size="xs"`, `size="sm"`, `size="lg"` (md is the default and emits no modifier class). |
| Trigger icon | `OverflowMenuVertical16` (3 vertical dots) — **16 × 16 px** (`$spacing-05`), `fill: var(--cds-icon-primary)`. Loaded by `iconLoader(OverflowMenuVertical16, { class: 'cds--overflow-menu__icon', slot: 'icon' })` in WC, or `<OverflowMenu>`'s default `renderIcon` in React. Custom icon via `renderIcon={Filter}` (React) or `iconLoader(Filter16, …)` (WC) — see the `RenderCustomIcon` story. |
| Trigger background — rest | `transparent`. |
| Trigger background — hover | `var(--cds-background-hover)` = `rgba(141, 141, 141, 0.12)` (light themes) / `rgba(141, 141, 141, 0.16)` (dark themes). |
| Trigger background — open | `var(--cds-layer-01)` = `#f4f4f4` (White) / `#ffffff` (G10) / `#393939` (G90) / `#262626` (G100). The trigger swaps to the same surface tier as the menu so the two read as one shape. |
| Trigger drop shadow — open | `box-shadow: 0 $spacing-01 6px 0 rgba(0, 0, 0, 0.3)` = **`0 2px 6px 0 rgba(0,0,0,0.3)`** (set by the WC SCSS `:host([open])` block). The styles mixin uses the shared `@include box-shadow` utility for the same visual on the React build. |
| Menu surface (`cds-overflow-menu-body`) | `position: absolute`, `z-index: var(--cds-z-floating)` (≈ `8000`), `background-color: var(--cds-layer-01)`, `display: none` until `[open]` (then `display: flex; flex-direction: column`). |
| Menu width | **`inline-size: $spacing-13`** = **`10rem`** = **160 px**. Items can be wider via the inner btn's `max-inline-size: 11.25rem` (180 px) ellipsis cap. |
| Menu offset (gap to trigger, md) | `inset-block-start: $spacing-07` = **32 px** (the trigger and menu are flush — the `::after` pseudo-element draws a 3-px wide background patch at the join so the trigger's bottom edge merges into the menu top). |
| Item height — md (default) | **40 px** (`block-size: $spacing-08`). Matches the trigger height so the trigger reads as the first row of the menu when open. |
| Item height — xs / sm / lg | **24 px** (`$spacing-06`) / **32 px** (`$spacing-07`) / **48 px** (`$spacing-09`). |
| Item padding | **`0 $spacing-05`** = **`0 16px`** on the inner button (`.cds--overflow-menu-options__btn`). The `<li>` (`.cds--overflow-menu-options__option`) has `padding: 0` — all horizontal inset comes from the button. |
| Item type | **`body-compact-01`** = `0.875rem / 1.125rem` (**14px / 18px**) IBM Plex Sans 400, letter-spacing `0.16px` (set via `@include type-style('body-compact-01')`). |
| Item color — rest | `var(--cds-text-secondary)` = `#525252` (light) / `#c6c6c6` (dark). |
| Item color — hover | `var(--cds-text-primary)` = `#161616` (light) / `#f4f4f4` (dark). |
| Item background — hover | `var(--cds-layer-hover-01)` = `#e8e8e8` (White, G10) / `#4c4c4c` (G90) / `#333333` (G100). |
| Item icon (when present, via WC slot or React `renderIcon`) | **16 × 16 px**, `fill: var(--cds-icon-secondary)` (`#525252` light / `#c6c6c6` dark) at rest, `fill: var(--cds-icon-primary)` on hover. 16-px gap to label is achieved via the inner button's `justify-content: space-between` (WC) — leading icon → label → trailing area. |
| Disabled item | Color `var(--cds-text-disabled)` = `rgba(22, 22, 22, 0.25)` (light) / `rgba(244, 244, 244, 0.25)` (dark); icon `var(--cds-icon-disabled)` (same alpha-25 token); `cursor: not-allowed`; hover/focus background reverts to the menu's `var(--cds-layer-01)` so no visual change. |
| Danger item — rest | Inherits `var(--cds-text-secondary)` like a normal item. |
| Danger item — hover / focus | Background `var(--cds-button-danger-primary)` = **`#da1e28`** (red-60), color `var(--cds-text-on-color)` = `#ffffff`, icon `fill: currentColor` (also white). The danger swap fires on **`:hover` AND `:focus`** of the inner btn — keyboard focus alone shows the red bg. |
| Divider | `border-block-start: 1px solid var(--cds-border-subtle-01)` = `1px solid #c6c6c6` (White) / `#e0e0e0` (G10) / `#6f6f6f` (G90) / `#525252` (G100). The `<li>` carries the modifier `.cds--overflow-menu--divider` (React) or `divider` attribute (WC `<cds-overflow-menu-item divider …>`). |
| Focus ring | `outline: 2px solid var(--cds-focus)` (`#0f62fe` light / `#ffffff` dark) with `outline-offset: -2px` (the `focus-outline('outline')` mixin's signature inset). Applied to **trigger** and to **inner option btn** on `:focus`. |
| Open transitions | `transition: outline $duration-fast-02 motion(entrance, productive), background-color $duration-fast-02 motion(entrance, productive)` on the trigger; `transition: background-color $duration-fast-02 motion(entrance, productive)` on each `__option` and on the option `__btn` (also color). When the menu opens the trigger sets `transition: none` so the swap to `var(--cds-layer-01)` is instant. |
| 4 directions | `data-floating-menu-direction="bottom"` (default), `"top"`, `"left"`, `"right"` — the `::after` pseudo-element is positioned to bridge the trigger-menu gap from the corresponding side. With `flipped` (or `align="*-end"`) the menu and `::after` shift to the opposite inline edge. |
| ARIA — trigger | `<button aria-haspopup="true" aria-expanded="false|true" aria-controls="<menu-id>">`. Trigger also wears the icon-tooltip `tooltip-content` slot for the screen-reader / hover label. |
| ARIA — menu surface | `<ul role="menu">` (rendered as `<cds-overflow-menu-body>` in WC, which extends the same `__options` list). |
| ARIA — menu item | `<li role="menuitem">` for click items. The Menu primitive supports `role="menuitemcheckbox"` (`MenuItemSelectable`) and `role="menuitemradio"` (inside `MenuItemRadioGroup`) variants — both apply `aria-checked`. Disabled items add `aria-disabled="true"`. |
| Touch target | Default md trigger is **40 px** square ≥ Carbon's mobile floor; for the xs (24 px) and sm (32 px) sizes wrap in `min-height: 44px` if the menu is the primary action target on mobile. |
| Imports | React: `import { OverflowMenu } from '@carbon/react';` + `import OverflowMenuItem from '@carbon/react/lib/components/OverflowMenuItem';` (or via `import { OverflowMenu, OverflowMenuItem } from '@carbon/react';`). Menu primitives: `import { Menu, MenuItem, MenuItemSelectable, MenuItemGroup, MenuItemRadioGroup, MenuItemDivider } from '@carbon/react';` — and `import { MenuButton } from '@carbon/react';`. WC: `import '@carbon/web-components/es/components/overflow-menu/index.js';` (registers `<cds-overflow-menu>`, `<cds-overflow-menu-body>`, `<cds-overflow-menu-item>`); `import '@carbon/web-components/es/components/menu/index.js';` (registers `<cds-menu>`, `<cds-menu-item>`, `<cds-menu-item-divider>`, `<cds-menu-item-group>`, `<cds-menu-item-selectable>`, `<cds-menu-item-radio-group>`); `import '@carbon/web-components/es/components/menu-button/index.js';` (registers `<cds-menu-button>`). |

## Variants (from Storybook story exports)

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| **OverflowMenu — Default** | `Default` (in `OverflowMenu.stories.js`) | `Default` (in `overflow-menu.stories.ts`) | Six-item action list with `aria-label="overflow-menu"`. Demonstrates the **disabled** modifier (`Clone and move app`), the **requireTitle** prop (truncation tooltip on `Edit routes and access`), and the **danger + divider** combo on the last item (`Delete app` — separated by a 1-px subtle border, swaps to red-60 on hover/focus). Default trigger icon is `OverflowMenuVertical16` (3 dots vertical). |
| **OverflowMenu — RenderCustomIcon** | `RenderCustomIcon` | `RenderCustomIcon` | Replaces the default 3-dot trigger with a custom icon (`Filter` from `@carbon/icons-react`). Two short items (`Filter A`, `Filter B`). React passes the icon as `renderIcon={Filter}`; WC passes `iconLoader(Filter16, { class: 'cds--overflow-menu__icon', slot: 'icon' })`. Use this whenever the trigger needs to communicate a specific action (filter, settings, sort) instead of the generic "more" affordance. |
| **OverflowMenu — WithLinks** (derived) | n/a — no v11 story | n/a — no v11 story | The legacy v10 "menu items as anchor links" pattern. Render the Default item list using `<OverflowMenuItem href="…">` (React) or `<cds-overflow-menu-item href="…">` (WC) — the underlying btn renders as an `<a>` instead of a `<button>` and the `a.cds--overflow-menu-options__btn::before` SCSS rule provides the inline-block height padding so anchor items align with click items. See the **Plain HTML (derived)** section for the exact markup. |
| **Menu — Default** | `Default` (in `Menu.stories.js`) | `Default` (in `menu.stories.ts`) | Full-feature menu primitive — the underlying surface that powers OverflowMenu, MenuButton, and ContextMenu. Shows **every** subcomponent: a label item with **submenu** (`Share with` → `MenuItemRadioGroup`), **MenuItemDivider**, click items with **shortcut** strings (`⌘X`, `⌘C`, `⌘V`) and `renderIcon`, a **disabled** click item, a **MenuItemGroup** (`Font style`) wrapping two **MenuItemSelectable** (`role="menuitemcheckbox"`) items with `defaultSelected`, a top-level **MenuItemRadioGroup** (`Text decoration`), and a final `kind="danger"` item (`Delete` with `⌫` shortcut). Use this when you need a context-menu / right-click menu — the OverflowMenu doesn't expose submenu, group, or selectable rows. |
| **MenuButton — Default** | `Default` (in `MenuButton.stories.js`) | `Default` (in `menu-button.stories.ts`) | Carbon's "primary action + dropdown" pattern. Renders a labelled button (`label="Actions"`) that opens a Menu on click. Three items, the third disabled. Use whenever you need a labelled trigger (vs the icon-only OverflowMenu). |
| **MenuButton — ExperimentalAutoAlign** | `ExperimentalAutoAlign` | `ExperimentalAutoAlign` | Same as Default wrapped in a 5000×5000 px scrolling container. The menu auto-flips position when it would clip the viewport (Floating UI under the hood). |
| **MenuButton — WithDanger** | `WithDanger` | `withDanger` | Adds a `MenuItemDivider` followed by a `kind="danger"` item (`Danger action`) at the bottom of the menu — the standard pattern for destructive actions in a MenuButton. |
| **MenuButton — WithDividers** | `WithDividers` | `withDividers` | Three groups of items separated by `MenuItemDivider`s — `[Create service request, Create work order]` / `[Add plan, Add flag]` / `[Edit source location, Recalculate source]`. Use to chunk long menus into related sections. |
| **MenuButton — WithIcons** | `WithIcons` | `withIcons` | Three items with leading icons (`Asset`, `User`, `User group` from `@carbon/react/icons`). The label changes to `Add` to reinforce the additive intent. Demonstrates the icon column that `MenuItem` provides via `renderIcon`. |
| **MenuButton — WithNestedMenu** | `WithNestedMenu` | `withNestedMenu` | Nested submenu via children: `Save`, `Save as`, `Export as` (which contains `PDF`, `JPG`, `PNG`), divider, `Delete` (danger). The submenu opens on hover / right-arrow keypress. |
| **MenuButton — WithMenuAlignment** | `WithMenuAlignment` | `withMenuAlignment` | Six MenuButtons demonstrating all six menu-alignment positions: `bottom`, `bottom-start`, `bottom-end`, `top`, `top-start`, `top-end`. Use to choose the correct alignment when the trigger is near a viewport / container edge. |

## React (verbatim from Storybook)

> The blocks below are copied **verbatim** from `OverflowMenu.stories.js`, `Menu.stories.js`, and `MenuButton.stories.js` on the Carbon `main` branch. Do **not** edit them — Carbon's source is the truth. The agent should output these as-is when generating Carbon UI.

### OverflowMenu

**Imports** (top of `packages/react/src/components/OverflowMenu/OverflowMenu.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { OverflowMenu } from './OverflowMenu';
import { default as OverflowMenuItem } from '../OverflowMenuItem';
import { Filter } from '@carbon/icons-react';
import mdx from './OverflowMenu.mdx';

export default {
  title: 'Components/OverflowMenu',
  component: OverflowMenu,
  subcomponents: {
    OverflowMenuItem,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: RenderCustomIcon**

```jsx
export const RenderCustomIcon = () => {
  return (
    <OverflowMenu flipped={document?.dir === 'rtl'} renderIcon={Filter}>
      <OverflowMenuItem itemText="Filter A" />
      <OverflowMenuItem itemText="Filter B" />
    </OverflowMenu>
  );
};
```

**Variant: Default** (with the `args`, `argTypes`, and `parameters` blocks that follow the export, also verbatim):

```jsx
export const Default = (args) => (
  <OverflowMenu aria-label="overflow-menu" {...args}>
    <OverflowMenuItem itemText="Stop app" />
    <OverflowMenuItem itemText="Restart app" />
    <OverflowMenuItem itemText="Rename app" />
    <OverflowMenuItem itemText="Clone and move app" disabled requireTitle />
    <OverflowMenuItem itemText="Edit routes and access" requireTitle />
    <OverflowMenuItem hasDivider isDelete itemText="Delete app" />
  </OverflowMenu>
);

Default.args = {
  flipped: document?.dir === 'rtl',
  focusTrap: false,
  open: false,
};

Default.argTypes = {
  align: {
    options: [
      'top',
      'top-start',
      'top-end',

      'bottom',
      'bottom-start',
      'bottom-end',

      'left',
      'left-end',
      'left-start',

      'right',
      'right-end',
      'right-start',
    ],
  },
  flipped: {
    control: {
      type: 'boolean',
    },
  },
  focusTrap: {
    control: {
      type: 'boolean',
    },
  },
  iconDescription: {
    control: { type: 'text' },
  },
  open: {
    control: {
      type: 'boolean',
    },
  },
  size: {
    options: ['xs', 'sm', 'md', 'lg'],
    control: { type: 'select' },
  },
};

Default.parameters = {
  controls: {
    exclude: [
      'direction',
      'iconClass',
      'id',
      'light',
      'menuOffset',
      'menuOffsetFlip',
      'menuOptionsClass',
      'renderIcon',
    ],
  },
};
```

### Menu

**Imports** (top of `packages/react/src/components/Menu/Menu.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { action } from 'storybook/actions';

import {
  Copy,
  Cut,
  FolderShared,
  Paste,
  TextBold,
  TextItalic,
  TrashCan,
} from '@carbon/icons-react';

import {
  Menu,
  MenuItem,
  MenuItemSelectable,
  MenuItemGroup,
  MenuItemRadioGroup,
  MenuItemDivider,
} from './';
import mdx from './Menu.mdx';

export default {
  title: 'Components/Menu',
  component: Menu,
  subcomponents: {
    MenuItem,
    MenuItemSelectable,
    MenuItemGroup,
    MenuItemRadioGroup,
    MenuItemDivider,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['target'],
    },
  },
  argTypes: {
    mode: {
      control: false,
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const itemOnClick = action('onClick (MenuItem)');
  const selectableOnChange = action('onChange (MenuItemSelectable)');
  const radioOnChange = action('onChange (MenuItemRadioGroup)');

  const target = document.getElementById('storybook-root');

  return (
    <Menu {...args} target={target} x={document?.dir === 'rtl' ? 250 : 0}>
      <MenuItem label="Share with" renderIcon={FolderShared}>
        <MenuItemRadioGroup
          label="Share with"
          items={['None', 'Product team', 'Organization', 'Company']}
          defaultSelectedItem="Product team"
          onChange={radioOnChange}
        />
      </MenuItem>
      <MenuItemDivider />
      <MenuItem
        label="Cut"
        shortcut="⌘X"
        onClick={itemOnClick}
        renderIcon={Cut}
      />
      <MenuItem
        label="Copy"
        shortcut="⌘C"
        onClick={itemOnClick}
        renderIcon={Copy}
      />
      <MenuItem
        label="Paste"
        shortcut="⌘V"
        disabled
        onClick={itemOnClick}
        renderIcon={Paste}
      />
      <MenuItemDivider />
      <MenuItemGroup label="Font style">
        <MenuItemSelectable
          label="Bold"
          shortcut="⌘B"
          defaultSelected
          onChange={selectableOnChange}
          renderIcon={TextBold}
        />
        <MenuItemSelectable
          label="Italic"
          shortcut="⌘I"
          onChange={selectableOnChange}
          renderIcon={TextItalic}
        />
      </MenuItemGroup>
      <MenuItemDivider />
      <MenuItemRadioGroup
        label="Text decoration"
        items={['None', 'Overline', 'Line-through', 'Underline']}
        defaultSelectedItem="None"
        onChange={radioOnChange}
      />
      <MenuItemDivider />
      <MenuItem
        label="Delete"
        shortcut="⌫"
        kind="danger"
        onClick={itemOnClick}
        renderIcon={TrashCan}
      />
    </Menu>
  );
};

Default.args = {
  onClose: action('onClose'),
  open: true,
};
```

### MenuButton

**Imports** (top of `packages/react/src/components/MenuButton/MenuButton.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { action } from 'storybook/actions';

import { MenuItem, MenuItemDivider } from '../Menu';

import { Asset, User, Group } from '@carbon/react/icons';

import { MenuButton } from './';
import mdx from './MenuButton.mdx';

export default {
  title: 'Components/MenuButton',
  component: MenuButton,
  subcomponents: {
    MenuItem,
    MenuItemDivider,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['menuTarget'],
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <MenuButton {...args} onClick={action('onClick')} label="Actions">
      <MenuItem
        label="First action with a long label description"
        onClick={action('onClick')}
      />
      <MenuItem label="Second action" onClick={action('onClick')} />
      <MenuItem label="Third action" onClick={action('onClick')} disabled />
    </MenuButton>
  );
};

Default.args = { label: 'Actions' };
```

**Variant: ExperimentalAutoAlign**

```jsx
export const ExperimentalAutoAlign = (args) => (
  <div style={{ width: '5000px', height: '5000px' }}>
    <div
      style={{
        position: 'absolute',
        bottom: '20px',
      }}>
      <MenuButton label="Actions" {...args}>
        <MenuItem label="First action" />
        <MenuItem label="Second action that is a longer item to test overflow and title." />
        <MenuItem label="Third action" disabled />
      </MenuButton>
    </div>
  </div>
);
```

**Variant: WithDanger**

```jsx
export const WithDanger = (args) => {
  return (
    <MenuButton label="Actions" {...args}>
      <MenuItem label="First action" />
      <MenuItem label="Second action" />
      <MenuItem label="Third action" />
      <MenuItemDivider />
      <MenuItem label="Danger action" kind="danger" />
    </MenuButton>
  );
};
```

**Variant: WithDividers**

```jsx
export const WithDividers = (args) => {
  return (
    <MenuButton label="Actions" {...args}>
      <MenuItem label="Create service request" />
      <MenuItem label="Create work order" />
      <MenuItemDivider />
      <MenuItem label="Add plan" />
      <MenuItem label="Add flag" />
      <MenuItemDivider />
      <MenuItem label="Edit source location" />
      <MenuItem label="Recalculate source" />
    </MenuButton>
  );
};
```

**Variant: WithIcons**

```jsx
export const WithIcons = (args) => {
  return (
    <MenuButton label="Add" {...args}>
      <MenuItem label="Asset" renderIcon={Asset} />
      <MenuItem label="User" renderIcon={User} />
      <MenuItem label="User group" renderIcon={Group} />
    </MenuButton>
  );
};
```

**Variant: WithNestedMenu**

```jsx
export const WithNestedMenu = (args) => (
  <MenuButton label="Actions" {...args}>
    <MenuItem label="Save" shortcut="⌘S" />
    <MenuItem label="Save as" shortcut="⌥⌘S" />
    <MenuItem label="Export as">
      <MenuItem label="PDF" />
      <MenuItem label="JPG" />
      <MenuItem label="PNG" />
    </MenuItem>
    <MenuItemDivider />
    <MenuItem label="Delete" kind="danger" />
  </MenuButton>
);
```

**Variant: WithMenuAlignment**

```jsx
export const WithMenuAlignment = () => {
  return (
    <>
      <div style={{ display: 'flex', justifyContent: 'space-between' }}>
        <MenuButton label="Bottom" menuAlignment="bottom">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>

        <MenuButton label="Bottom start" menuAlignment="bottom-start">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>

        <MenuButton label="Bottom end" menuAlignment="bottom-end">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>
      </div>

      <div
        style={{
          display: 'flex',
          marginTop: '15rem',
          justifyContent: 'space-between',
        }}>
        <MenuButton label="Top" menuAlignment="top">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>

        <MenuButton label="Top start" menuAlignment="top-start">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>

        <MenuButton label="Top end" menuAlignment="top-end">
          <MenuItem label="First action" />
          <MenuItem label="Second action that is a longer item to test overflow and title." />
          <MenuItem label="Third action" disabled />
        </MenuButton>
      </div>
    </>
  );
};
```

## Web Components (verbatim from Storybook)

> The blocks below are copied **verbatim** from `overflow-menu.stories.ts`, `menu.stories.ts`, and `menu-button.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

### overflow-menu

**Imports** (top of `packages/web-components/src/components/overflow-menu/overflow-menu.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { OVERFLOW_MENU_SIZE } from './overflow-menu';
import './overflow-menu-body';
import './overflow-menu-item';
import { prefix } from '../../globals/settings';
import OverflowMenuVertical16 from '@carbon/icons/es/overflow-menu--vertical/16.js';
import Filter16 from '@carbon/icons/es/filter/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';

const sizes = {
  [`Extra small size (${OVERFLOW_MENU_SIZE.EXTRA_SMALL})`]:
    OVERFLOW_MENU_SIZE.EXTRA_SMALL,
  [`Small size (${OVERFLOW_MENU_SIZE.SMALL})`]: OVERFLOW_MENU_SIZE.SMALL,
  [`Medium size (default) (${OVERFLOW_MENU_SIZE.MEDIUM})`]:
    OVERFLOW_MENU_SIZE.MEDIUM,
  [`Lg size (${OVERFLOW_MENU_SIZE.LARGE})`]: OVERFLOW_MENU_SIZE.LARGE,
};

const args = {
  flipped: false,
  iconDescription: 'Options',
  open: false,
  index: 1,
  size: OVERFLOW_MENU_SIZE.MEDIUM,
};

const argTypes = {
  flipped: {
    control: 'boolean',
    description: '<code>true</code> if the menu alignment should be flipped.',
  },
  iconDescription: {
    control: 'text',
    description: 'The icon description.',
  },
  open: {
    control: 'boolean',
    description: '<code>true</code> if the menu should be open.\n',
  },
  index: {
    control: 'number',
    description: 'The index for the item which should be focused in the menu.',
  },
  size: {
    control: 'select',
    description:
      'Specify the size of the OverflowMenu. Currently supports either <code>xs</code>, <code>sm</code>, <code>md</code> (default) or <code>lg</code> as an option.',
    options: sizes,
  },
};
```

**Variant: Default**

```ts
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const { flipped, iconDescription, open, index, size } = args ?? {};
    return html`
      <cds-overflow-menu ?open="${open}" size="${size}" index=${index}>
        ${iconLoader(OverflowMenuVertical16, {
          class: `${prefix}--overflow-menu__icon`,
          slot: 'icon',
        })}
        <span slot="tooltip-content"> ${iconDescription} </span>
        <cds-overflow-menu-body ?flipped="${ifDefined(flipped)}">
          <cds-overflow-menu-item>Stop app</cds-overflow-menu-item>
          <cds-overflow-menu-item>Restart app</cds-overflow-menu-item>
          <cds-overflow-menu-item>Rename app</cds-overflow-menu-item>
          <cds-overflow-menu-item disabled
            >Clone and move app</cds-overflow-menu-item
          >
          <cds-overflow-menu-item
            >Edit routes and access</cds-overflow-menu-item
          >
          <cds-overflow-menu-item divider danger>
            Delete app
          </cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
    `;
  },
};
```

**Variant: RenderCustomIcon**

```ts
export const RenderCustomIcon = {
  render: () => {
    return html`
      <cds-overflow-menu>
        ${iconLoader(Filter16, {
          class: `${prefix}--overflow-menu__icon`,
          slot: 'icon',
        })}
        <span slot="tooltip-content">Options</span>
        <cds-overflow-menu-body>
          <cds-overflow-menu-item>Filter A</cds-overflow-menu-item>
          <cds-overflow-menu-item>Filter B</cds-overflow-menu-item>
        </cds-overflow-menu-body>
      </cds-overflow-menu>
    `;
  },
};

const meta = {
  title: 'Components/Overflow Menu',
};

export default meta;
```

### menu

**Imports** (top of `packages/web-components/src/components/menu/menu.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './index';
import FolderShared16 from '@carbon/icons/es/folder--shared/16.js';
import Cut16 from '@carbon/icons/es/cut/16.js';
import Copy16 from '@carbon/icons/es/copy/16.js';
import TrashCan16 from '@carbon/icons/es/trash-can/16.js';
import TextItalic16 from '@carbon/icons/es/text--italic/16.js';
import TextBold16 from '@carbon/icons/es/text--bold/16.js';
import Paste16 from '@carbon/icons/es/paste/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';
import CDSMenu from './menu';
import MDXContent from './menu.mdx';
import CDSmenuItem from './menu-item';
import CDSmenuItemSelectable from './menu-item-selectable';
import CDSmenuItemGroup from './menu-item-group';
import CDSmenuItemRadioGroup from './menu-item-radio-group';
import CDSmenuItemDivider from './menu-item-divider';
import { MENU_BACKGROUND_TOKEN } from './defs';

const args = {
  backgroundToken: MENU_BACKGROUND_TOKEN.LAYER,
  border: false,
  size: 'sm',
  open: true,
};

const argTypes = {
  backgroundToken: {
    control: { type: 'radio' },
    description: 'Specify the background token to use. Default is "layer".',
    options: [MENU_BACKGROUND_TOKEN.LAYER, MENU_BACKGROUND_TOKEN.BACKGROUND],
  },
  border: {
    control: 'boolean',
    description: 'Specify whether a border should be rendered on the menu.',
  },
  label: {
    control: 'text',
    description: 'A label describing the Menu.',
  },
  menuAlignment: {
    control: 'text',
    description: 'Specify how the menu should align with the button element',
  },
  open: {
    control: 'boolean',
    description: `Whether the Menu is open or not.`,
  },
  size: {
    control: { type: 'radio' },
    description: `Specify the size of the Menu. 
    'xs'
    'sm'
    'md'
    'lg'`,
    options: ['xs', 'sm', 'md', 'lg'],
  },
  x: {
    control: 'number',
    description: `Specify the x position of the Menu. Either pass a single number or an array with two numbers describing your activator's boundaries ([x1, x2]).`,
  },
  y: {
    control: 'number',
    description: `Specify the y position of the Menu. Either pass a single number or an array with two numbers describing your activator's boundaries ([y1, y2])`,
  },
};
```

**Variant: Default**

```ts
export const Default = {
  title: 'Components/Menu',
  component: CDSMenu,
  subcomponents: {
    CDSmenuItem,
    CDSmenuItemSelectable,
    CDSmenuItemGroup,
    CDSmenuItemRadioGroup,
    CDSmenuItemDivider,
  },
  parameters: {
    docs: {
      page: MDXContent,
    },
  },
  args,
  argTypes,
  render: ({ open, size, backgroundToken, border, label }) => {
    return html`
      <cds-menu
        ?open=${open}
        size=${size}
        menuAlignment="bottom"
        label=${label}
        background-token=${backgroundToken}
        ?border=${border}>
        <cds-menu-item label="Share with">
          ${iconLoader(FolderShared16, { slot: 'render-icon' })}
          <cds-menu-item-radio-group slot="submenu" label="Share with list">
            <cds-menu-item label="None"></cds-menu-item>
            <cds-menu-item selected="true" label="Product team"></cds-menu-item>
            <cds-menu-item label="Organization"></cds-menu-item>
            <cds-menu-item label="Company"></cds-menu-item>
          </cds-menu-item-radio-group>
        </cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Cut" shortcut="⌘X">
          ${iconLoader(Cut16, { slot: 'render-icon' })}
        </cds-menu-item>
        <cds-menu-item label="Copy" shortcut="⌘C">
          ${iconLoader(Copy16, { slot: 'render-icon' })}
        </cds-menu-item>
        <cds-menu-item label="Paste" shortcut="⌘V" disabled>
          ${iconLoader(Paste16, { slot: 'render-icon' })}
        </cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item-group>
          <cds-menu-item-selectable selected="true" label="Bold" shortcut="⌘B">
            ${iconLoader(TextBold16, { slot: 'render-icon' })}
          </cds-menu-item-selectable>
          <cds-menu-item-selectable label="Italic" shortcut="⌘I">
            ${iconLoader(TextItalic16, { slot: 'render-icon' })}
          </cds-menu-item-selectable>
        </cds-menu-item-group>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item-radio-group label="samples">
          <cds-menu-item selected="true" label="None"></cds-menu-item>
          <cds-menu-item label="Overline"></cds-menu-item>
          <cds-menu-item label="Line-through"></cds-menu-item>
          <cds-menu-item label="Underline"></cds-menu-item>
        </cds-menu-item-radio-group>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Delete" shortcut="⌫" kind="danger">
          ${iconLoader(TrashCan16, { slot: 'render-icon' })}
        </cds-menu-item>
      </cds-menu>
    `;
  },
};

const meta = {
  title: 'Components/Menu',
};

export default meta;
```

### menu-button

**Imports** (top of `packages/web-components/src/components/menu-button/menu-button.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2025, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */
import { html } from 'lit';
import './index';
import Asset16 from '@carbon/icons/es/asset/16.js';
import User16 from '@carbon/icons/es/user/16.js';
import Group16 from '@carbon/icons/es/group/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';

const args = {
  label: 'Actions',
  kind: 'primary',
  size: 'lg',
  menuAlignment: 'bottom',
  menuBackgroundToken: 'layer',
  menuBorder: false,
};

const argTypes = {
  disabled: {
    control: 'boolean',
    description: 'Specify whether the MenuButton should be disabled, or not.',
  },
  kind: {
    control: 'radio',
    description:
      'Specify the type of button to be used as the base for the trigger button.',
    options: ['primary', 'tertiary', 'ghost'],
  },
  label: {
    control: 'text',
    description: `Provide the label to be rendered on the trigger button.`,
  },
  menuAlignment: {
    control: 'select',
    description: `Experimental property. Specify how the menu should align with the button element`,
    options: [
      'top',
      'top-start',
      'top-end',
      'bottom',
      'bottom-start',
      'bottom-end',
    ],
  },
  menuBackgroundToken: {
    control: 'select',
    description:
      'Specify the background token to use for the menu. Default is "layer".',
    options: ['layer', 'background'],
  },
  menuBorder: {
    control: 'boolean',
    description: 'Specify whether a border should be rendered on the menu.',
  },
  size: {
    control: 'radio',
    description: `Specify the size of the button and menu.
'xs'
'sm'
'md'
'lg'`,
    options: ['xs', 'sm', 'md', 'lg'],
  },
  tabIndex: {
    control: 'number',
    description: `Specify the tabIndex of the button.`,
  },
};
```

**Variant: Default**

```ts
export const Default = {
  argTypes: argTypes,
  args: args,
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <cds-menu-button
      label="${label}"
      kind=${kind}
      menu-alignment=${menuAlignment}
      menu-background-token=${menuBackgroundToken}
      ?menu-border=${menuBorder}
      size=${size}
      ?disabled=${disabled}
      tab-index=${tabIndex}>
      <cds-menu>
        <cds-menu-item
          label="First action with a long label description"></cds-menu-item>
        <cds-menu-item label="Second action"></cds-menu-item>
        <cds-menu-item label="Third action" disabled></cds-menu-item>
      </cds-menu>
    </cds-menu-button>
  `,
};
```

**Variant: ExperimentalAutoAlign**

```ts
export const ExperimentalAutoAlign = {
  argTypes: argTypes,
  args: args,
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <div style="width: 5000px; height: 5000px;">
      <div style="position: absolute; bottom: 20px">
        <cds-menu-button
          label="${label}"
          kind=${kind}
          menu-alignment=${menuAlignment}
          menu-background-token=${menuBackgroundToken}
          ?menu-border=${menuBorder}
          size=${size}
          ?disabled=${disabled}
          tab-index=${tabIndex}>
          <cds-menu>
            <cds-menu-item label="First action"></cds-menu-item>
            <cds-menu-item
              label="Second action that is a longer item to test overflow and title."></cds-menu-item>
            <cds-menu-item label="Third action" disabled></cds-menu-item>
          </cds-menu>
        </cds-menu-button>
      </div>
    </div>
  `,
};
```

**Variant: withDanger**

```ts
export const withDanger = {
  argTypes: argTypes,
  args: args,
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <cds-menu-button
      label="${label}"
      kind=${kind}
      menu-alignment=${menuAlignment}
      menu-background-token=${menuBackgroundToken}
      ?menu-border=${menuBorder}
      size=${size}
      ?disabled=${disabled}
      tab-index=${tabIndex}>
      <cds-menu>
        <cds-menu-item label="First action"></cds-menu-item>
        <cds-menu-item label="Second action"></cds-menu-item>
        <cds-menu-item label="Third action"></cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Danger action" kind="danger"></cds-menu-item>
      </cds-menu>
    </cds-menu-button>
  `,
};
```

**Variant: withDividers**

```ts
export const withDividers = {
  argTypes: argTypes,
  args: args,
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <cds-menu-button
      label="${label}"
      kind=${kind}
      menu-alignment=${menuAlignment}
      menu-background-token=${menuBackgroundToken}
      ?menu-border=${menuBorder}
      size=${size}
      ?disabled=${disabled}
      tab-index=${tabIndex}>
      <cds-menu>
        <cds-menu-item label="Create service request"></cds-menu-item>
        <cds-menu-item label="Create work order"></cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Add plan"></cds-menu-item>
        <cds-menu-item label="Add flag"></cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Edit source location"></cds-menu-item>
        <cds-menu-item label="Recalculate source"></cds-menu-item>
      </cds-menu>
    </cds-menu-button>
  `,
};
```

**Variant: withIcons**

```ts
export const withIcons = {
  argTypes: argTypes,
  args: {
    label: 'Add',
    kind: 'primary',
    size: 'lg',
    menuAlignment: 'bottom',
  },
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <cds-menu-button
      label="${label}"
      kind=${kind}
      menu-alignment=${menuAlignment}
      menu-background-token=${menuBackgroundToken}
      ?menu-border=${menuBorder}
      size=${size}
      ?disabled=${disabled}
      tab-index=${tabIndex}>
      <cds-menu>
        <cds-menu-item label="Asset">
          ${iconLoader(Asset16, { slot: 'render-icon' })}
        </cds-menu-item>
        <cds-menu-item label="User">
          ${iconLoader(User16, { slot: 'render-icon' })}
        </cds-menu-item>
        <cds-menu-item label="User group">
          ${iconLoader(Group16, { slot: 'render-icon' })}
        </cds-menu-item>
      </cds-menu>
    </cds-menu-button>
  `,
};
```

**Variant: withNestedMenu**

```ts
export const withNestedMenu = {
  argTypes: argTypes,
  args: args,
  render: ({
    disabled,
    kind,
    label,
    menuAlignment,
    menuBackgroundToken,
    menuBorder,
    size,
    tabIndex,
  }) => html`
    <cds-menu-button
      label="${label}"
      kind=${kind}
      menu-alignment=${menuAlignment}
      menu-background-token=${menuBackgroundToken}
      ?menu-border=${menuBorder}
      size=${size}
      ?disabled=${disabled}
      tab-index=${tabIndex}>
      <cds-menu>
        <cds-menu-item label="Save" shortcut="⌘S"></cds-menu-item>
        <cds-menu-item label="Save as" shortcut="⌥⌘S"></cds-menu-item>
        <cds-menu-item label="Export as">
          <cds-menu-item-group slot="submenu">
            <cds-menu-item label="PDF"></cds-menu-item>
            <cds-menu-item label="JPG"></cds-menu-item>
            <cds-menu-item label="PNG"></cds-menu-item>
          </cds-menu-item-group>
        </cds-menu-item>
        <cds-menu-item-divider></cds-menu-item-divider>
        <cds-menu-item label="Delete" kind="danger"></cds-menu-item>
      </cds-menu>
    </cds-menu-button>
  `,
};
```

**Variant: withMenuAlignment**

```ts
export const withMenuAlignment = {
  argTypes: argTypes,
  args: args,
  render: ({ menuBackgroundToken, menuBorder }) => html`
    <div style="display: flex; justify-content: space-between;">
      <cds-menu-button
        label="Bottom"
        menu-alignment="bottom"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>

      <cds-menu-button
        label="Bottom start"
        menu-alignment="bottom-start"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>

      <cds-menu-button
        label="Bottom end"
        menu-alignment="bottom-end"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>
    </div>

    <div
      style="display: flex; justify-content: space-between; margin-top: 15rem">
      <cds-menu-button
        label="Top"
        menu-alignment="top"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>

      <cds-menu-button
        label="Top start"
        menu-alignment="top-start"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>

      <cds-menu-button
        label="Top end"
        menu-alignment="top-end"
        menu-background-token=${menuBackgroundToken}
        ?menu-border=${menuBorder}>
        <cds-menu>
          <cds-menu-item label="first"></cds-menu-item>
          <cds-menu-item
            label="second action with a really long text"></cds-menu-item>
          <cds-menu-item label="Third action" disabled></cds-menu-item>
        </cds-menu>
      </cds-menu-button>
    </div>
  `,
};

const meta = {
  title: 'Components/Menu Button',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> Static HTML with all `${args.*}` lit-html bindings resolved to literal attributes. The `<cds-overflow-menu>`, `<cds-overflow-menu-body>`, and `<cds-overflow-menu-item>` custom elements are still required (registered by `import '@carbon/web-components/es/components/overflow-menu/index.js';`). The inline SVG below is the actual `OverflowMenuVertical16` glyph that `iconLoader` would mount.

**Variant: Default** (open state, md size, six items including disabled, divider, danger):

```html
<cds-overflow-menu open size="md" index="1">
  <svg
    slot="icon"
    class="cds--overflow-menu__icon"
    xmlns="http://www.w3.org/2000/svg"
    width="16"
    height="16"
    viewBox="0 0 32 32"
    fill="currentColor"
    aria-hidden="true">
    <circle cx="16" cy="8" r="2"></circle>
    <circle cx="16" cy="16" r="2"></circle>
    <circle cx="16" cy="24" r="2"></circle>
  </svg>
  <span slot="tooltip-content">Options</span>
  <cds-overflow-menu-body open>
    <cds-overflow-menu-item>Stop app</cds-overflow-menu-item>
    <cds-overflow-menu-item>Restart app</cds-overflow-menu-item>
    <cds-overflow-menu-item>Rename app</cds-overflow-menu-item>
    <cds-overflow-menu-item disabled>Clone and move app</cds-overflow-menu-item>
    <cds-overflow-menu-item>Edit routes and access</cds-overflow-menu-item>
    <cds-overflow-menu-item divider danger>Delete app</cds-overflow-menu-item>
  </cds-overflow-menu-body>
</cds-overflow-menu>
```

**Variant: RenderCustomIcon** (closed state — default; trigger uses Filter icon):

```html
<cds-overflow-menu>
  <svg
    slot="icon"
    class="cds--overflow-menu__icon"
    xmlns="http://www.w3.org/2000/svg"
    width="16"
    height="16"
    viewBox="0 0 32 32"
    fill="currentColor"
    aria-hidden="true">
    <path d="M18 28h-4a2 2 0 0 1-2-2v-7.59L4.59 11A2 2 0 0 1 4 9.59V6a2 2 0 0 1 2-2h20a2 2 0 0 1 2 2v3.59A2 2 0 0 1 27.41 11L20 18.41V26a2 2 0 0 1-2 2ZM6 6v3.59l8 8V26h4v-8.41l8-8V6Z"></path>
  </svg>
  <span slot="tooltip-content">Options</span>
  <cds-overflow-menu-body>
    <cds-overflow-menu-item>Filter A</cds-overflow-menu-item>
    <cds-overflow-menu-item>Filter B</cds-overflow-menu-item>
  </cds-overflow-menu-body>
</cds-overflow-menu>
```

**Variant: WithLinks** (derived — items render as `<a href>` instead of `<button>`):

```html
<cds-overflow-menu open size="md">
  <svg
    slot="icon"
    class="cds--overflow-menu__icon"
    xmlns="http://www.w3.org/2000/svg"
    width="16"
    height="16"
    viewBox="0 0 32 32"
    fill="currentColor"
    aria-hidden="true">
    <circle cx="16" cy="8" r="2"></circle>
    <circle cx="16" cy="16" r="2"></circle>
    <circle cx="16" cy="24" r="2"></circle>
  </svg>
  <span slot="tooltip-content">Options</span>
  <cds-overflow-menu-body open>
    <cds-overflow-menu-item href="/learn-more">Learn more</cds-overflow-menu-item>
    <cds-overflow-menu-item href="/docs">Documentation</cds-overflow-menu-item>
    <cds-overflow-menu-item href="/support">Support</cds-overflow-menu-item>
  </cds-overflow-menu-body>
</cds-overflow-menu>
```

**Variant: Menu — Default** (full primitive surface, all subcomponents):

```html
<cds-menu open size="sm" menuAlignment="bottom" label="Edit menu" background-token="layer">
  <cds-menu-item label="Share with">
    <svg slot="render-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
      <path d="M16 18a5 5 0 1 1 5-5 5 5 0 0 1-5 5Zm0-8a3 3 0 1 0 3 3 3 3 0 0 0-3-3Zm10 22h-2v-3a4 4 0 0 0-4-4h-8a4 4 0 0 0-4 4v3H6v-3a6 6 0 0 1 6-6h8a6 6 0 0 1 6 6Z"></path>
    </svg>
    <cds-menu-item-radio-group slot="submenu" label="Share with list">
      <cds-menu-item label="None"></cds-menu-item>
      <cds-menu-item selected label="Product team"></cds-menu-item>
      <cds-menu-item label="Organization"></cds-menu-item>
      <cds-menu-item label="Company"></cds-menu-item>
    </cds-menu-item-radio-group>
  </cds-menu-item>
  <cds-menu-item-divider></cds-menu-item-divider>
  <cds-menu-item label="Cut" shortcut="⌘X"></cds-menu-item>
  <cds-menu-item label="Copy" shortcut="⌘C"></cds-menu-item>
  <cds-menu-item label="Paste" shortcut="⌘V" disabled></cds-menu-item>
  <cds-menu-item-divider></cds-menu-item-divider>
  <cds-menu-item-group>
    <cds-menu-item-selectable selected label="Bold" shortcut="⌘B"></cds-menu-item-selectable>
    <cds-menu-item-selectable label="Italic" shortcut="⌘I"></cds-menu-item-selectable>
  </cds-menu-item-group>
  <cds-menu-item-divider></cds-menu-item-divider>
  <cds-menu-item-radio-group label="samples">
    <cds-menu-item selected label="None"></cds-menu-item>
    <cds-menu-item label="Overline"></cds-menu-item>
    <cds-menu-item label="Line-through"></cds-menu-item>
    <cds-menu-item label="Underline"></cds-menu-item>
  </cds-menu-item-radio-group>
  <cds-menu-item-divider></cds-menu-item-divider>
  <cds-menu-item label="Delete" shortcut="⌫" kind="danger"></cds-menu-item>
</cds-menu>
```

**Variant: MenuButton — Default** (labelled trigger, three-item menu):

```html
<cds-menu-button
  label="Actions"
  kind="primary"
  menu-alignment="bottom"
  menu-background-token="layer"
  size="lg"
  tab-index="0">
  <cds-menu>
    <cds-menu-item label="First action with a long label description"></cds-menu-item>
    <cds-menu-item label="Second action"></cds-menu-item>
    <cds-menu-item label="Third action" disabled></cds-menu-item>
  </cds-menu>
</cds-menu-button>
```

**Variant: MenuButton — WithDanger** (danger row after divider):

```html
<cds-menu-button label="Actions" kind="primary" menu-alignment="bottom" size="lg">
  <cds-menu>
    <cds-menu-item label="First action"></cds-menu-item>
    <cds-menu-item label="Second action"></cds-menu-item>
    <cds-menu-item label="Third action"></cds-menu-item>
    <cds-menu-item-divider></cds-menu-item-divider>
    <cds-menu-item label="Danger action" kind="danger"></cds-menu-item>
  </cds-menu>
</cds-menu-button>
```

**Variant: MenuButton — WithIcons** (leading icons on each item):

```html
<cds-menu-button label="Add" kind="primary" menu-alignment="bottom" size="lg">
  <cds-menu>
    <cds-menu-item label="Asset">
      <svg slot="render-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M27 28H5a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h22a2 2 0 0 1 2 2v20a2 2 0 0 1-2 2ZM5 6v20h22V6Z"></path>
      </svg>
    </cds-menu-item>
    <cds-menu-item label="User">
      <svg slot="render-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M16 4a5 5 0 1 0 5 5 5 5 0 0 0-5-5Zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3Zm8 16h-2v-3a4 4 0 0 0-4-4h-4a4 4 0 0 0-4 4v3H8v-3a6 6 0 0 1 6-6h4a6 6 0 0 1 6 6Z"></path>
      </svg>
    </cds-menu-item>
    <cds-menu-item label="User group">
      <svg slot="render-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" fill="currentColor" aria-hidden="true">
        <path d="M22 11a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm0-6a2 2 0 1 1-2 2 2 2 0 0 1 2-2Zm-12 6a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm0-6a2 2 0 1 1-2 2 2 2 0 0 1 2-2Zm6 16a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm0-6a2 2 0 1 1-2 2 2 2 0 0 1 2-2Z"></path>
      </svg>
    </cds-menu-item>
  </cds-menu>
</cds-menu-button>
```

**Variant: MenuButton — WithNestedMenu** (Export as → submenu group):

```html
<cds-menu-button label="Actions" kind="primary" menu-alignment="bottom" size="lg">
  <cds-menu>
    <cds-menu-item label="Save" shortcut="⌘S"></cds-menu-item>
    <cds-menu-item label="Save as" shortcut="⌥⌘S"></cds-menu-item>
    <cds-menu-item label="Export as">
      <cds-menu-item-group slot="submenu">
        <cds-menu-item label="PDF"></cds-menu-item>
        <cds-menu-item label="JPG"></cds-menu-item>
        <cds-menu-item label="PNG"></cds-menu-item>
      </cds-menu-item-group>
    </cds-menu-item>
    <cds-menu-item-divider></cds-menu-item-divider>
    <cds-menu-item label="Delete" kind="danger"></cds-menu-item>
  </cds-menu>
</cds-menu-button>
```

## Design Tokens (component-scoped)

> Resolved from `overview.md` for all four themes. The `_overflow-menu.scss` mixin uses the unsuffixed `$layer`, `$layer-hover`, `$border-subtle`, `$icon-secondary`, `$text-secondary` token aliases — these resolve to the `-01` tier of each theme block (`--cds-layer` is an alias for `--cds-layer-01`, etc.). The CSS custom properties below name the resolved values for clarity.

```css
[data-theme="white"] {
  /* Trigger surface */
  --cds-overflow-menu-trigger-background: transparent;
  --cds-overflow-menu-trigger-background-hover: rgba(141, 141, 141, 0.12); /* --cds-background-hover */
  --cds-overflow-menu-trigger-background-open: #f4f4f4;                    /* --cds-layer-01 */
  --cds-overflow-menu-trigger-icon: #161616;                               /* --cds-icon-primary */
  --cds-overflow-menu-trigger-icon-disabled: rgba(22, 22, 22, 0.25);       /* --cds-icon-disabled */
  --cds-overflow-menu-trigger-shadow-open: 0 2px 6px 0 rgba(0, 0, 0, 0.3); /* WC :host([open]) */

  /* Menu surface */
  --cds-overflow-menu-surface-background: #f4f4f4;                         /* --cds-layer-01 */
  --cds-overflow-menu-surface-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.3);
  --cds-overflow-menu-surface-z-index: 8000;                               /* --cds-z-floating */
  --cds-overflow-menu-surface-inline-size: 10rem;                          /* $spacing-13 = 160px */
  --cds-overflow-menu-surface-inset-block-start: 2rem;                     /* $spacing-07 = 32px */

  /* Item — rest */
  --cds-overflow-menu-item-background: transparent;
  --cds-overflow-menu-item-color: #525252;                                 /* --cds-text-secondary */
  --cds-overflow-menu-item-icon: #525252;                                  /* --cds-icon-secondary */
  --cds-overflow-menu-item-padding-inline: 1rem;                           /* $spacing-05 = 16px */
  --cds-overflow-menu-item-block-size: 2.5rem;                             /* $spacing-08 = 40px (md) */
  --cds-overflow-menu-item-max-inline-size: 11.25rem;                      /* 180px ellipsis cap */

  /* Item — hover */
  --cds-overflow-menu-item-background-hover: #e8e8e8;                      /* --cds-layer-hover-01 */
  --cds-overflow-menu-item-color-hover: #161616;                           /* --cds-text-primary */
  --cds-overflow-menu-item-icon-hover: #161616;                            /* --cds-icon-primary */

  /* Item — focus (uses focus-outline 'outline' mixin) */
  --cds-overflow-menu-item-focus-outline: 2px solid #0f62fe;               /* --cds-focus */
  --cds-overflow-menu-item-focus-outline-offset: -2px;

  /* Item — disabled */
  --cds-overflow-menu-item-background-disabled: #f4f4f4;                   /* --cds-layer-01 (no change from rest) */
  --cds-overflow-menu-item-color-disabled: rgba(22, 22, 22, 0.25);         /* --cds-text-disabled */
  --cds-overflow-menu-item-icon-disabled: rgba(22, 22, 22, 0.25);          /* --cds-icon-disabled */
  --cds-overflow-menu-item-cursor-disabled: not-allowed;

  /* Item — danger (hover & focus) */
  --cds-overflow-menu-item-background-danger: #da1e28;                     /* --cds-button-danger-primary */
  --cds-overflow-menu-item-color-danger: #ffffff;                          /* --cds-text-on-color */

  /* Divider */
  --cds-overflow-menu-divider-color: #c6c6c6;                              /* --cds-border-subtle-01 */
  --cds-overflow-menu-divider-block-size: 1px;
}

[data-theme="g10"] {
  --cds-overflow-menu-trigger-background-hover: rgba(141, 141, 141, 0.12);
  --cds-overflow-menu-trigger-background-open: #ffffff;                    /* --cds-layer-01 */
  --cds-overflow-menu-trigger-icon: #161616;
  --cds-overflow-menu-trigger-icon-disabled: rgba(22, 22, 22, 0.25);

  --cds-overflow-menu-surface-background: #ffffff;
  --cds-overflow-menu-item-color: #525252;
  --cds-overflow-menu-item-icon: #525252;
  --cds-overflow-menu-item-background-hover: #e8e8e8;
  --cds-overflow-menu-item-color-hover: #161616;
  --cds-overflow-menu-item-icon-hover: #161616;
  --cds-overflow-menu-item-color-disabled: rgba(22, 22, 22, 0.25);
  --cds-overflow-menu-item-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-overflow-menu-item-background-danger: #da1e28;
  --cds-overflow-menu-item-color-danger: #ffffff;
  --cds-overflow-menu-divider-color: #e0e0e0;                              /* --cds-border-subtle-01 (G10 inverts) */
  --cds-overflow-menu-item-focus-outline: 2px solid #0f62fe;
}

[data-theme="g90"] {
  --cds-overflow-menu-trigger-background-hover: rgba(141, 141, 141, 0.16);
  --cds-overflow-menu-trigger-background-open: #393939;                    /* --cds-layer-01 (G90) */
  --cds-overflow-menu-trigger-icon: #f4f4f4;                               /* --cds-icon-primary */
  --cds-overflow-menu-trigger-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-overflow-menu-surface-background: #393939;
  --cds-overflow-menu-item-color: #c6c6c6;                                 /* --cds-text-secondary */
  --cds-overflow-menu-item-icon: #c6c6c6;                                  /* --cds-icon-secondary */
  --cds-overflow-menu-item-background-hover: #4c4c4c;                      /* --cds-layer-hover-01 (G90) */
  --cds-overflow-menu-item-color-hover: #f4f4f4;                           /* --cds-text-primary */
  --cds-overflow-menu-item-icon-hover: #f4f4f4;
  --cds-overflow-menu-item-color-disabled: rgba(244, 244, 244, 0.25);
  --cds-overflow-menu-item-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-overflow-menu-item-background-danger: #da1e28;
  --cds-overflow-menu-item-color-danger: #ffffff;
  --cds-overflow-menu-divider-color: #6f6f6f;                              /* --cds-border-subtle-01 (G90) */
  --cds-overflow-menu-item-focus-outline: 2px solid #ffffff;               /* --cds-focus (dark) */
}

[data-theme="g100"],
.dark {
  --cds-overflow-menu-trigger-background-hover: rgba(141, 141, 141, 0.16);
  --cds-overflow-menu-trigger-background-open: #262626;                    /* --cds-layer-01 (G100) */
  --cds-overflow-menu-trigger-icon: #f4f4f4;
  --cds-overflow-menu-trigger-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-overflow-menu-surface-background: #262626;
  --cds-overflow-menu-item-color: #c6c6c6;
  --cds-overflow-menu-item-icon: #c6c6c6;
  --cds-overflow-menu-item-background-hover: #333333;                      /* --cds-layer-hover-01 (G100) */
  --cds-overflow-menu-item-color-hover: #f4f4f4;
  --cds-overflow-menu-item-icon-hover: #f4f4f4;
  --cds-overflow-menu-item-color-disabled: rgba(244, 244, 244, 0.25);
  --cds-overflow-menu-item-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-overflow-menu-item-background-danger: #da1e28;
  --cds-overflow-menu-item-color-danger: #ffffff;
  --cds-overflow-menu-divider-color: #525252;                              /* --cds-border-subtle-01 (G100) */
  --cds-overflow-menu-item-focus-outline: 2px solid #ffffff;
}
```

## States Reference (from `_overflow-menu.scss`)

> Pulled directly from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/overflow-menu/_overflow-menu.scss` (398 lines) and `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/overflow-menu/overflow-menu.scss` (247 lines). Hex values are the **White theme** resolutions; G10 / G90 / G100 swap per the Design Tokens block above.

### Trigger button (`.cds--overflow-menu`, `.cds--overflow-menu__trigger`)

| State | Background | Icon fill | Border / outline | Other |
|---|---|---|---|---|
| Rest | `transparent` | `#161616` (`$icon-primary`) | `none` | `block-size: 40px` (md) · `transition: outline 110ms productive-entrance, background-color 110ms productive-entrance` |
| Hover | `rgba(141, 141, 141, 0.12)` (`$background-hover`) | `#161616` | `none` | — |
| Focus-visible | `transparent` (or hover bg) | `#161616` | `outline: 2px solid #0f62fe` (`$focus`) with `outline-offset: -2px` (`focus-outline('outline')`) | Inner `<svg>` gets `outline: none` so the ring sits on the trigger only. |
| Open (`.cds--overflow-menu--open`) | `#f4f4f4` (`$layer`) | `#161616` | `none` | `box-shadow: 0 2px 6px 0 rgba(0,0,0,0.3)` (WC `:host([open])`) · `transition: none` (instant swap on open) · `:hover` while open keeps the `$layer` background (no second hover overlay) |
| Disabled (WC `[disabled]`) | `transparent` (hover bg suppressed) | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`) | `none` | `cursor: not-allowed` on host and on the inner `<svg>` |

### Menu surface (`.cds--overflow-menu-options`, `cds-overflow-menu-body`)

| State | Background | Display | Position | Other |
|---|---|---|---|---|
| Closed | `#f4f4f4` (`$layer`) | `none` | `position: absolute` | List collapsed; trigger has no shadow. |
| Open (`.cds--overflow-menu-options--open`, `[open]`) | `#f4f4f4` | `flex` (column, `align-items: flex-start`) | `position: absolute; z-index: var(--cds-z-floating)` (≈ 8000) · `inset-block-start: 32px` (`$spacing-07`) · `inset-inline-start: 0` | `inline-size: 10rem` (`$spacing-13` = 160px) · `box-shadow: 0 2px 6px 0 rgba(0,0,0,0.3)` (`@include box-shadow`) · `list-style: none` |
| Light variant (`--light`) | `#e8e8e8` (`$layer-hover`) — kept for v10 back-compat; do not use in new code | (same) | (same) | `::after` background also `$layer` |
| Direction `bottom` `::after` | `#f4f4f4` | block | `inset-block-start: -3px; inset-inline-start: 0; block-size: 3px; inline-size: 40px` (`$spacing-08`) | Bridges the 3-px hairline between trigger bottom and menu top. |
| Direction `top` `::after` | `#f4f4f4` | block | `inset-block-end: -8px; inset-inline-start: 0; block-size: 8px` (`$spacing-03`) `; inline-size: 40px` | Bridges the 8-px gap when menu opens above. |
| Direction `left` `::after` | `#f4f4f4` | block | `inset-block-start: 0; inset-inline-end: -6px; inline-size: 6px; block-size: 40px` | — |
| Direction `right` `::after` | `#f4f4f4` | block | `inset-block-start: 0; inset-inline-start: -6px; inline-size: 6px; block-size: 40px` | — |
| Flipped (`--flip` / `align="*-end"`) | (same) | (same) | `inset-inline-start: -140px` (offsets the 160-px menu so its right edge aligns with the trigger right edge) · `::after` `inset-inline: auto 0` so the bridge moves to the right side. | The `::before` pseudo (caret hairline) shifts to `inset-inline-start: 145px`. |

### Menu item (`<li>` `.cds--overflow-menu-options__option`)

| State | Background | Color | Cursor | Other |
|---|---|---|---|---|
| Rest | `transparent` | (inherit) | (inherit) | `padding: 0` · `block-size: 40px` (md) · `inline-size: 100%` · `transition: background-color 110ms productive-entrance` |
| Hover | `#e8e8e8` (`$layer-hover`) | (inherit) | (inherit) | — |

### Menu item inner button (`.cds--overflow-menu-options__btn`)

| State | Background | Color | SVG fill | Border / outline | Other |
|---|---|---|---|---|---|
| Rest | `transparent` | `#525252` (`$text-secondary`) | `#525252` (`$icon-secondary`) | `border: none` (and `focus-outline('reset')`) | `padding: 0 16px` (`0 $spacing-05`) · `block-size: 100%` · `inline-size: 100%` · `max-inline-size: 11.25rem` (180px ellipsis cap) · `font-family: inherit; font-weight: 400` · type `body-compact-01` (14/18, letter-spacing 0.16px) · `text-align: start` · `transition: outline 110ms, background-color 110ms, color 110ms` (all productive-entrance) |
| Hover | (parent `<li>` provides bg) | `#161616` (`$text-primary`) | `#161616` (`$icon-primary`) | `border: none` | — |
| Focus-visible | `transparent` (parent `<li>` may have hover bg) | (rest) | (rest) | `outline: 2px solid #0f62fe` with `outline-offset: -2px` (`focus-outline('outline')`) | Windows HCM mode: `outline-color: Highlight` |
| Active (mouse down) | `#e8e8e8` (carries hover bg) | `#161616` | `#161616` | (focus ring) | — |
| Disabled (`<li>.cds--overflow-menu-options__option--disabled`) | parent `<li>:hover` bg = `$layer` (no change), btn hover/active/focus all reset to `$layer` bg via `focus-outline('reset')` | `rgba(22, 22, 22, 0.25)` (`$text-disabled`) | `rgba(22, 22, 22, 0.25)` (`$icon-disabled`) | `border: none` | `cursor: not-allowed` on host and btn |
| Danger (`<li>.cds--overflow-menu-options__option--danger`) — rest | (inherits from parent) | `#525252` | `#525252` | — | — |
| Danger — hover **AND** focus | `#da1e28` (`button.$button-danger-primary`) | `#ffffff` (`$text-on-color`) | `currentColor` (= `#ffffff`) | (focus ring still applies) | This swap fires on **either** `:hover` or `:focus` of the inner btn — keyboard focus alone shows the red bg. |

### Anchor item (`a.cds--overflow-menu-options__btn`)

| Selector / state | Special rule |
|---|---|
| `a.cds--overflow-menu-options__btn::before` | `display: inline-block; block-size: 100%; vertical-align: middle; content: ''` — provides the inline-block height padding so anchor items align with click items in the same list. |

### Divider (`.cds--overflow-menu--divider` modifier on the `<li>`)

| Property | Value |
|---|---|
| `border-block-start` | `1px solid var(--cds-border-subtle-01)` = `1px solid #c6c6c6` (White) / `#e0e0e0` (G10) / `#6f6f6f` (G90) / `#525252` (G100). |

### Size modifiers (apply to trigger AND each item)

| Size | Trigger / item `block-size` | SCSS rule |
|---|---|---|
| `xs` | `1.5rem` = **24px** (`$spacing-06`) | `.cds--overflow-menu--xs` and `.cds--overflow-menu-options--xs .cds--overflow-menu-options__option` |
| `sm` | `2rem` = **32px** (`$spacing-07`) | `.cds--overflow-menu--sm` and `.cds--overflow-menu-options--sm .cds--overflow-menu-options__option` |
| `md` (default — no class added) | `2.5rem` = **40px** (`$spacing-08`) | base `.cds--overflow-menu` rule |
| `lg` | `3rem` = **48px** (`$spacing-09`) | `.cds--overflow-menu--lg` and `.cds--overflow-menu-options--lg .cds--overflow-menu-options__option` |

The `::after` bridge also resizes per size variant (`bottom`/`top` directions get `inline-size: $spacing-{06|07|09}`; `left`/`right` get `block-size: $spacing-{06|07|09}`).

### Top-positioned popover offset

When `data-floating-menu-direction="top"` and the menu is using `align="top-start"` or `align="top-end"`:

```css
.cds--overflow-menu__top-start,
.cds--overflow-menu__top-end {
  transform: translate(0, calc(-100% - var(--popover-offset, 2.5rem)));
}
```

`--popover-offset` defaults to `2.5rem` (40px) — set on the host or container to override the gap to the trigger.

## Animation & Motion

Carbon's source uses these motion tokens for OverflowMenu (extracted from `_overflow-menu.scss` and the WC SCSS):

```css
/* Trigger — outline + bg fade in/out. 110ms is "fast-02"; productive-entrance is the standard
   easing for UI feedback that must feel instant. The transition is suppressed when [open] so the
   trigger swap to $layer is instantaneous (the menu surface is the actual entrance). */
.cds--overflow-menu,
.cds--overflow-menu__trigger {
  transition:
    outline var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9)),
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9));
}

.cds--overflow-menu.cds--overflow-menu--open,
.cds--overflow-menu.cds--overflow-menu--open .cds--overflow-menu__trigger {
  transition: none; /* instant swap to $layer when the menu opens */
}

/* Menu surface ::after — only the bridge patch animates (the surface itself flips
   display: none ↔ flex with no transition, matching the popover pattern). */
.cds--overflow-menu-options::after {
  transition: background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9));
}

/* Menu item <li> — bg fade on hover. */
.cds--overflow-menu-options__option {
  transition: background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9));
}

/* Menu item inner btn — three properties fade together on hover/focus. */
.cds--overflow-menu-options__btn {
  transition:
    outline var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9)),
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9)),
    color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9));
}

/* Breadcrumb-overflow underline animation (link-style trigger inside <Breadcrumb>) — uses
   fast-01 (70ms) and the standard (not entrance) productive easing because it's a hover
   feedback, not an entrance. */
@keyframes cds--overflow-menu-breadcrumb-underline {
  from { opacity: 0; }
  to   { opacity: 1; }
}

/* Reduced motion — the SCSS only suppresses the ::after transition explicitly, but
   prefers-reduced-motion users should disable all four animation rules. */
@media (prefers-reduced-motion: reduce) {
  .cds--overflow-menu,
  .cds--overflow-menu__trigger,
  .cds--overflow-menu-options::after,
  .cds--overflow-menu-options__option,
  .cds--overflow-menu-options__btn {
    transition: none;
  }
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic structure (OverflowMenu):**
  - Trigger: `<button>` inside the icon-tooltip wrapper (`.cds--tooltip__trigger`). The visible label comes from the tooltip's `tooltip-content` slot (WC) or `iconDescription` prop (React) — read by screen readers via `aria-describedby`.
  - Surface: `<ul role="menu">` (the `.cds--overflow-menu-options` element). Renders only when `[open]`.
  - Items: `<li role="menuitem">` wrapping a `<button class="cds--overflow-menu-options__btn">`. Anchor items use `<a class="cds--overflow-menu-options__btn">` and the `::before` pseudo restores the inline alignment.
- **Semantic structure (Menu primitive):**
  - Surface: `<ul role="menu">` with `aria-label="<label>"` and `aria-orientation="vertical"`.
  - Click items: `<li role="menuitem">` wrapping `<div class="cds--menu-item">`.
  - Selectable items (`MenuItemSelectable`): `<li role="menuitemcheckbox" aria-checked="true|false">`.
  - Radio items (inside `MenuItemRadioGroup`): `<li role="menuitemradio" aria-checked="true|false">` and the group wrapper carries `role="group"` with `aria-label`.
  - Group (`MenuItemGroup`): `<li role="group" aria-label="<label>">`.
  - Divider (`MenuItemDivider`): `<li role="separator">`.
  - Submenu: parent item gains `aria-haspopup="menu" aria-expanded="false|true"`; the nested `<ul>` lives in a portal but is `aria-controls`-linked to the parent.
- **ARIA on the trigger:**
  - `aria-haspopup="true"` on the trigger button (Menu's surface uses `aria-haspopup="menu"` — both are valid for `role="menu"` targets).
  - `aria-expanded="false"` (default) → `aria-expanded="true"` while `[open]`. Carbon's `OverflowMenu.tsx` toggles this on the `<button>`.
  - `aria-controls="<menu-id>"` linking the trigger to the surface (`id` is auto-generated by Carbon's `useId` hook).
  - `aria-label` (or `aria-labelledby` if a separate label exists) — required on the icon-only trigger to convey purpose. The Default story uses `aria-label="overflow-menu"`.
- **Disabled item:** parent `<li>` adds `aria-disabled="true"`; the inner btn becomes non-tabbable (`tabindex="-1"`) but stays in the DOM so screen readers still announce it as part of the menu.
- **Keyboard:**
  - **Trigger** focused → `Enter` / `Space` opens the menu and moves focus to the first non-disabled item (or to the item at `index` prop if set).
  - **Inside the menu:**
    - `↓` / `↑` — move focus to next / previous non-disabled item (wraps at top/bottom).
    - `Home` / `End` — jump to first / last item.
    - `Enter` / `Space` — activate the focused item (fires `onClick` on the underlying btn or anchor; Selectable items toggle `aria-checked`).
    - `Tab` — moves focus **out** of the menu (Carbon does not trap focus by default; pass `focusTrap={true}` on `OverflowMenu` to opt in).
    - `Esc` — closes the menu and returns focus to the trigger.
    - `→` (Menu primitive) — opens a submenu if the focused item has one.
    - `←` (Menu primitive) — closes the current submenu and returns to the parent menu.
    - Type-ahead: typing a character moves focus to the next item whose label starts with that character (Menu / MenuButton only — not OverflowMenu).
  - **Outside click** closes the menu and returns focus to the trigger.
- **Touch target:** The default md trigger is **40 × 40 px**, which exceeds Carbon's mobile floor (40 px) and meets WCAG 2.5.5 Level AAA target size (44 × 44 px is recommended; 40 px meets the AA exception for interactive controls in dense lists). For the **xs** (24 px) and **sm** (32 px) sizes — used inside data tables and toolbars — wrap in a `min-height: 44px` query if the menu is the **primary** mobile action.
- **Focus management:**
  - Carbon's CSS provides `:focus` (== `:focus-visible` for keyboard navigation) with the signature **2px solid `var(--cds-focus)` outline + `outline-offset: -2px`**. **DO NOT remove this** — it's the only focus indicator on the trigger and on each item btn.
  - In dark themes (G90, G100) `--cds-focus` resolves to `#ffffff` (pure white) — the same 2-px ring.
  - Windows High Contrast Mode (WHCM): the `high-contrast-mode('focus')` mixin maps `outline` to `Highlight` system colour so the ring stays visible.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — both React `<OverflowMenu>` and WC `<cds-overflow-menu>` are first-party. | Don't paraphrase, summarise, or rewrite the imports / render bodies. Carbon's source is the truth. |
| Sharp corners — the trigger, surface, items, and dividers all use `border-radius: 0`. | Don't add `border-radius: 4px` (or any radius) to the trigger or menu — Carbon explicitly uses sharp corners. (Popover and Toggletip get the `2px` exception, not OverflowMenu.) |
| Use the `cds-` element names: `<cds-overflow-menu>`, `<cds-overflow-menu-body>`, `<cds-overflow-menu-item>` (and `<cds-menu>`, `<cds-menu-button>`, `<cds-menu-item>`, `<cds-menu-item-divider>`, `<cds-menu-item-selectable>`, `<cds-menu-item-group>`, `<cds-menu-item-radio-group>`). | Don't substitute generic `<button>` + `<ul>` markup — the custom elements own the open/close state, focus management, keyboard handling, and direction-aware `::after` bridge. Skipping them breaks the menu. |
| Use `iconLoader(OverflowMenuVertical16, { class: 'cds--overflow-menu__icon', slot: 'icon' })` for the trigger icon (or `renderIcon={OverflowMenuVertical}` in React). | Don't inline a generic `<svg>` without the `cds--overflow-menu__icon` class — the SCSS scopes the 16-px sizing and `$icon-primary` fill to that class. |
| Use the trigger size that matches the surrounding control: `xs`/`sm` inside data tables (24/32 px), `md` (40 px) for general purposes, `lg` (48 px) for spacious layouts (e.g., empty-state action overflow). | Don't mix sizes — when a row uses 32-px buttons, the row's overflow trigger should also be 32 px so vertical alignment holds. |
| Mark destructive items with `danger` (WC) / `isDelete` or `kind="danger"` (React). The hover/focus swap to red-60 + white text is the Carbon convention for destructive intent. | Don't colour your own item red — the danger swap **only** applies on hover/focus, so a red-coloured rest state breaks the convention and reduces affordance. |
| Use a `divider` (WC `divider` attribute / React `hasDivider` prop) **above** the destructive item to visually separate it from the safe items. The Default story does exactly this on `Delete app`. | Don't put the destructive item flush with the safe items — the divider is the visual cue that the next action carries different consequences. |
| Use the `disabled` attribute on items that are temporarily unavailable, with a reason exposed via tooltip or helper text outside the menu. | Don't hide items the user might expect to see — disabling preserves the menu's information architecture; hiding makes features feel "missing". |
| Use **OverflowMenu** for icon-only "more actions" affordances inside data tables, cards, list rows, toolbars. | Don't use OverflowMenu for primary navigation or the only action on a screen — its trigger is intentionally low-affordance. Use **MenuButton** (labelled trigger) for primary "Actions" / "Add" patterns. |
| Use **MenuButton** (labelled trigger) when the dropdown is a primary action — e.g., `[Actions ▾]` on a detail page header, `[Add ▾]` on a list view. | Don't use MenuButton for icon-only triggers — that's OverflowMenu's job. The two are complementary, not interchangeable. |
| Use **Menu** (the primitive) when you need a context menu (right-click), a submenu, a checkbox/radio group inside a menu, or any combination OverflowMenu/MenuButton don't expose. | Don't reach into the Menu primitive when OverflowMenu or MenuButton already covers the use case — those wrappers handle trigger styling, ARIA wiring, and `aria-controls` for you. |
| Wrap your usage in `[data-theme="white"]` / `[data-theme="g10"]` / `[data-theme="g90"]` / `[data-theme="g100"]` (or use the `.dark` class) so all four themes resolve correctly. | Don't define your own `--cds-overflow-menu-*` overrides — change the theme tokens (`--cds-layer-01`, `--cds-layer-hover-01`, `--cds-text-secondary`, `--cds-button-danger-primary`) instead so the overflow menu stays consistent with the rest of your Carbon UI. |
| For "menu items as anchor links" (the legacy v10 `WithLinks` pattern), pass `href="…"` to `OverflowMenuItem` / `cds-overflow-menu-item`. The `a.cds--overflow-menu-options__btn::before` SCSS rule provides the inline-block height padding so anchor items align with click items. | Don't rebuild link items as bare `<a>` tags inside the menu — you'll lose the alignment, hover, focus, and danger styling that the inner btn provides. |
