---
name: button
description: Carbon Button — primary, secondary, tertiary, ghost, danger, danger-tertiary, danger-ghost, icon-only, icon-only-with-badge, and skeleton variants reproduced verbatim from Carbon Storybook
metadata:
  tags: button, cta, action, primary, secondary, tertiary, ghost, danger, ibm, carbon, react, web-components
---

# Button -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Button.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Button/Button.stories.js)
> - **WC story:** [`button.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/button/button.stories.ts)
> - **WC SCSS:** [`button.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/button/button.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-button--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-button--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/button/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg / xl / 2xl) | `32px` / `40px` / `48px` / `64px` / `80px` |
| Heights (xs — Action / DataTable batch) | `24px` |
| Padding (sm / md / lg) | `0 16px` (text), `0 12px 0 16px` (with icon) |
| Padding (xl / 2xl — productive) | `16px 16px 0 16px` (top-padded productive layout) |
| Icon-only padding (any size) | `padding: $spacing-03` (`8px`) when selected/expressive |
| Corner radius | `0` (Carbon: sharp by default — `border-radius: 0`) |
| Font | IBM Plex Sans, body-compact-01: `14px / 18px / 0.16px / 400` |
| Default color (White theme) | `#0f62fe` (`--cds-button-primary`) |
| Default color (G100 theme) | `#0f62fe` (`--cds-button-primary`) |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: -2px;` + inset `1px` of `--cds-background` for visual separation |
| Transition | `background var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70 ms) |
| React import | `import { Button, ButtonSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/button/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Purpose |
|---|---|---|
| Primary (Default) | `Default` | The single most important action on a page or section. One per primary intent. |
| Secondary | `Secondary` | Pair with a primary to provide an alternative action of equal weight (e.g., Cancel). |
| Tertiary | `Tertiary` | Lower-emphasis, outlined action used in dense or repeated contexts. |
| Ghost | `Ghost` | Lowest-emphasis text-only action; used in toolbars, tiles, and tables. |
| Danger | `Danger` | Destructive primary action (Delete, Remove). Triggers a confirmation pattern. |
| Danger Tertiary | `DangerTertiary` | Outlined destructive action paired with a tertiary primary (e.g., in a modal footer). |
| Danger Ghost | `DangerGhost` | Lowest-emphasis destructive action; used inline in tables and lists. |
| Icon Button | `IconButton` | Icon-only button with tooltip. Sizes follow text button heights; padding becomes `8px` square. |
| Icon Button With Badge | `IconButtonWithBadge` | Icon-only ghost (lg) with a `cds-badge-indicator` count slot for notification-style affordances. |
| Skeleton | `Skeleton` | Loading placeholder rendered while real button content is fetching. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Button.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. Output these as-is when generating Carbon React UI.

**Imports** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { action } from 'storybook/actions';
import { Add, Notification, Filter } from '@carbon/icons-react';
import { default as Button, ButtonSkeleton } from '../Button';
import { Stack } from '../Stack';
import mdx from './Button.mdx';
import './button-story.scss';

// Helper function to get icon component based on string option
const getIconFromString = (iconName) => {
  const icons = {
    Add: (props) => <Add {...props} />,
    Notification: (props) => <Notification {...props} />,
    Filter: (props) => <Filter {...props} />,
  };
  return icons[iconName];
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

Default.argTypes = {
  ...sharedArgTypes,
};

Default.parameters = {
  controls: { include: [...textButtonControls, 'dangerDescription'] },
};
```

**Variant: Secondary**

```jsx
export const Secondary = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

Secondary.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

Secondary.args = {
  kind: 'secondary',
};

Secondary.parameters = {
  controls: {
    include: textButtonControls,
  },
};
```

**Variant: Tertiary**

```jsx
export const Tertiary = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

Tertiary.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

Tertiary.args = {
  kind: 'tertiary',
};

Tertiary.parameters = {
  controls: {
    include: textButtonControls,
  },
};
```

**Variant: Ghost**

```jsx
export const Ghost = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

Ghost.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

Ghost.args = {
  kind: 'ghost',
};

Ghost.parameters = {
  controls: {
    include: textButtonControls,
  },
};
```

**Variant: Danger**

```jsx
export const Danger = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

Danger.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

Danger.args = {
  kind: 'danger',
};

Danger.parameters = {
  controls: {
    include: [...textButtonControls, 'dangerDescription'],
  },
};
```

**Variant: DangerTertiary**

```jsx
export const DangerTertiary = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

DangerTertiary.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

DangerTertiary.args = {
  kind: 'danger--tertiary',
};

DangerTertiary.parameters = {
  controls: {
    include: [...textButtonControls, 'dangerDescription'],
  },
};
```

**Variant: DangerGhost**

```jsx
export const DangerGhost = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

DangerGhost.argTypes = {
  ...sharedArgTypes,
  kind: {
    table: { readonly: true },
  },
};

DangerGhost.args = {
  kind: 'danger--ghost',
};

DangerGhost.parameters = {
  controls: {
    include: [...textButtonControls, 'dangerDescription'],
  },
};
```

**Variant: IconButton**

```jsx
export const IconButton = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}
    />
  );
};

IconButton.argTypes = {
  ...sharedArgTypes,
  hasIconOnly: {
    table: { readonly: true },
  },
  renderIcon: {
    options: ['Add', 'Filter'],
  },
  badgeCount: {
    table: { readonly: true },
  },
};

IconButton.args = {
  hasIconOnly: true,
  renderIcon: 'Add',
  iconDescription: 'Icon Description',
};
```

**Variant: IconButtonWithBadge**

```jsx
export const IconButtonWithBadge = (args) => {
  const { renderIcon, ...rest } = args;
  return (
    <Button
      {...rest}
      renderIcon={
        renderIcon !== 'None' ? getIconFromString(renderIcon) : undefined
      }
      onClick={action('onClick')}>
      Button
    </Button>
  );
};

IconButtonWithBadge.argTypes = {
  ...sharedArgTypes,
  hasIconOnly: {
    description:
      'Specify if the button is an icon-only button. this control must be set to `true` if using the `badgeCount` prop.',
    table: { readonly: true },
  },
  kind: {
    description:
      'Specify the kind of Button you want to create. this control must be set to `ghost` if using the `badgeCount` prop.',
    table: { readonly: true },
  },
  size: {
    description:
      'Specify the size of the button, from the following list of sizes: `xs`, `sm`, `md`, `lg`, `xl`, `2xl`. this control must be set to `lg` if using the `badgeCount` prop',
    table: { readonly: true },
  },
  renderIcon: {
    options: ['Notification'],
  },
};
IconButtonWithBadge.parameters = {
  controls: {
    exclude: ['dangerDescription'],
  },
};

IconButtonWithBadge.args = {
  hasIconOnly: true,
  renderIcon: 'Notification',
  iconDescription: 'Notification',
  badgeCount: 4,
  kind: 'ghost',
  size: 'lg',
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => <ButtonSkeleton {...args} />;

Skeleton.parameters = {
  controls: {
    include: skeletonControls,
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `button.stories.ts` on the Carbon `main` branch. Use these for non-React projects. Lit-html `${expression}` bindings are preserved here — they are resolved to static attributes in the next section.

**Imports** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import '../badge-indicator/index';
import {
  BUTTON_KIND,
  BUTTON_TYPE,
  BUTTON_SIZE,
  BUTTON_TOOLTIP_ALIGNMENT,
  BUTTON_TOOLTIP_POSITION,
} from './button';
import './index';

import Add16 from '@carbon/icons/es/add/16.js';
import Notification16 from '@carbon/icons/es/notification/16.js';
import Filter16 from '@carbon/icons/es/filter/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';
```

**Shared render templates (`baseButtonTemplate` / `iconButtonTemplate`)** — every text-button variant below uses `baseButtonTemplate` and the icon variants use `iconButtonTemplate`:

```ts
const baseButtonTemplate = (args) => html`
  <cds-button
    @click=${args.onClick}
    danger-description=${ifDefined(args.dangerDescription)}
    ?disabled=${args.disabled}
    href=${ifDefined(args.href)}
    ?isExpressive=${args.isExpressive}
    kind=${ifDefined(args.kind)}
    rel=${ifDefined(args.rel)}
    link-role=${ifDefined(args.linkRole)}
    target=${ifDefined(args.target)}
    tabindex=${ifDefined(args.tabindex)}
    size=${ifDefined(args.size)}
    type=${ifDefined(args.type)}>
    Button ${args.icon?.({ slot: 'icon' })}
  </cds-button>
`;

const iconButtonTemplate = (args) => html`
  <cds-button
    @click=${args.onClick}
    danger-description=${ifDefined(args.dangerDescription)}
    ?disabled=${args.disabled}
    href=${ifDefined(args.href)}
    ?isExpressive=${args.isExpressive}
    ?isSelected=${args.isSelected}
    kind=${ifDefined(args.kind)}
    rel=${ifDefined(args.rel)}
    link-role=${ifDefined(args.linkRole)}
    target=${ifDefined(args.target)}
    tabindex=${ifDefined(args.tabindex)}
    size=${ifDefined(args.size)}
    tooltip-text=${ifDefined(args.tooltipText)}
    tooltip-alignment=${ifDefined(args.tooltipAlignment)}
    tooltip-position=${ifDefined(args.tooltipPosition)}
    type=${ifDefined(args.type)}>
    ${args.icon?.({ slot: 'icon' })}
    ${args.count === undefined
      ? null
      : args.count > 0
        ? html`<cds-badge-indicator count=${args.count}></cds-badge-indicator>`
        : html`<cds-badge-indicator></cds-badge-indicator>`}
  </cds-button>
`;
```

**Variant: Default** (uses `baseButtonTemplate`, default `kind="primary"`)

```ts
export const Default = {
  argTypes: {
    ...sharedArgTypes,
  },
  parameters: {
    controls: {
      include: [...textButtonControls, 'dangerDescription'],
    },
  },
};
```

**Variant: Secondary**

```ts
export const Secondary = {
  args: { kind: BUTTON_KIND.SECONDARY },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
};
```

**Variant: Tertiary**

```ts
export const Tertiary = {
  args: { kind: BUTTON_KIND.TERTIARY },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
};
```

**Variant: Ghost**

```ts
export const Ghost = {
  args: { kind: BUTTON_KIND.GHOST },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
};
```

**Variant: Danger**

```ts
export const Danger = {
  args: { kind: BUTTON_KIND.DANGER },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
  parameters: {
    controls: {
      include: [...textButtonControls, 'dangerDescription'],
    },
  },
};
```

**Variant: DangerTertiary**

```ts
export const DangerTertiary = {
  args: { kind: BUTTON_KIND.DANGER_TERTIARY },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
  parameters: {
    controls: {
      include: [...textButtonControls, 'dangerDescription'],
    },
  },
};
```

**Variant: DangerGhost**

```ts
export const DangerGhost = {
  args: { kind: BUTTON_KIND.DANGER_GHOST },
  argTypes: {
    ...sharedArgTypes,
    kind: {
      table: { readonly: true },
    },
  },
  parameters: {
    controls: {
      include: [...textButtonControls, 'dangerDescription'],
    },
  },
};
```

**Variant: IconButton** (renders with `iconButtonTemplate`)

```ts
export const IconButton = {
  render: iconButtonTemplate,
  parameters: {
    controls: { include: [...iconButtonControls, 'dangerDescription'] },
  },
  argTypes: {
    count: { table: { readonly: true } },
    icon: {
      options: ['Add', 'Filter'],
    },
  },
  args: {
    kind: BUTTON_KIND.PRIMARY,
    icon: 'Add',
    tooltipText: 'Icon Description',
  },
};
```

**Variant: IconButtonWithBadge** (renders with `iconButtonTemplate`, slots a `cds-badge-indicator`)

```ts
export const IconButtonWithBadge = {
  render: iconButtonTemplate,
  parameters: {
    controls: { include: iconButtonControls },
  },
  argTypes: {
    icon: {
      options: ['Notification'],
      description:
        'Icon to display in the button with badge. Choose between Notification and Filter icons.',
    },
    kind: {
      table: { readonly: true },
      description:
        'Specify the kind of Button you want to create. This control must be set to `ghost` if using the `cds-badge-indicator`.',
    },
    size: {
      table: { readonly: true },
      description:
        'Specify the size of the button. This control must be set to `lg` if using the `cds-badge-indicator`.',
    },
  },
  args: {
    count: 4,
    kind: BUTTON_KIND.GHOST,
    icon: 'Notification',
    tooltipText: 'Notification',
    size: BUTTON_SIZE.LARGE,
  },
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  argTypes: {
    size: { options: sizes, control: 'select' },
    href: { control: 'text' },
  },
  parameters: {
    controls: {
      include: ['size', 'href'],
    },
  },
  render: (args) =>
    html`<cds-button-skeleton
      size=${ifDefined(args.size)}
      href=${ifDefined(args.href)}>
    </cds-button-skeleton>`,
};
```

## Plain HTML (derived from Web Components)

> Same `cds-button` element used by the WC stories, but with lit-html bindings resolved to literal attributes. Use this for hand-coded HTML without lit-html. Default `size` is `lg` (Carbon's documented default).

**Variant: Default** (primary)

```html
<cds-button kind="primary" size="lg" type="button">Button</cds-button>
```

**Variant: Secondary**

```html
<cds-button kind="secondary" size="lg" type="button">Button</cds-button>
```

**Variant: Tertiary**

```html
<cds-button kind="tertiary" size="lg" type="button">Button</cds-button>
```

**Variant: Ghost**

```html
<cds-button kind="ghost" size="lg" type="button">Button</cds-button>
```

**Variant: Danger**

```html
<cds-button
  kind="danger"
  size="lg"
  type="button"
  danger-description="danger">
  Button
</cds-button>
```

**Variant: DangerTertiary**

```html
<cds-button
  kind="danger-tertiary"
  size="lg"
  type="button"
  danger-description="danger">
  Button
</cds-button>
```

**Variant: DangerGhost**

```html
<cds-button
  kind="danger-ghost"
  size="lg"
  type="button"
  danger-description="danger">
  Button
</cds-button>
```

**Variant: IconButton** (icon-only with tooltip)

```html
<cds-button
  kind="primary"
  size="lg"
  type="button"
  tooltip-text="Icon Description"
  tooltip-alignment="center"
  tooltip-position="top">
  <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
    <path d="M8 1v6h6v2H8v6H6V9H0V7h6V1z"/>
  </svg>
</cds-button>
```

**Variant: IconButtonWithBadge** (ghost / lg / count slot)

```html
<cds-button
  kind="ghost"
  size="lg"
  type="button"
  tooltip-text="Notification"
  tooltip-alignment="center"
  tooltip-position="top">
  <svg slot="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
    <path d="M14 11.17V8a6 6 0 1 0-12 0v3.17L0 13v1h16v-1zM7 16h2a2 2 0 0 1-2 0z"/>
  </svg>
  <cds-badge-indicator count="4"></cds-badge-indicator>
</cds-button>
```

**Variant: Skeleton**

```html
<cds-button-skeleton size="lg"></cds-button-skeleton>
```

## Design Tokens (component-scoped)

Resolved hex values cross-referenced from `references/ibm/overview.md` (`[data-theme="white"]` and `[data-theme="g100"]` blocks). All values are literal — do not substitute generic colors.

```css
[data-theme="white"] {
  /* Primary */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0050e6;
  --cds-button-primary-active: #002d9c;

  /* Secondary */
  --cds-button-secondary: #393939;
  --cds-button-secondary-hover: #4c4c4c;
  --cds-button-secondary-active: #6f6f6f;

  /* Tertiary */
  --cds-button-tertiary: #0f62fe;
  --cds-button-tertiary-hover: #0050e6;
  --cds-button-tertiary-active: #002d9c;

  /* Danger (primary, secondary outline, hover, active) */
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #da1e28;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;

  /* States shared across kinds */
  --cds-button-disabled: #c6c6c6;
  --cds-button-separator: #e0e0e0;

  /* Focus ring + text-on-color */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #8d8d8d;
}

[data-theme="g100"],
.dark {
  /* Primary */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0353e9;
  --cds-button-primary-active: #002d9c;

  /* Secondary */
  --cds-button-secondary: #6f6f6f;
  --cds-button-secondary-hover: #5e5e5e;
  --cds-button-secondary-active: #393939;

  /* Tertiary (inverts to white on dark) */
  --cds-button-tertiary: #ffffff;
  --cds-button-tertiary-hover: #f4f4f4;
  --cds-button-tertiary-active: #c6c6c6;

  /* Danger (note: secondary outline lifts to red-40 on dark for AA contrast) */
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #fa4d56;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;

  /* States shared across kinds */
  --cds-button-disabled: rgba(141, 141, 141, 0.3);
  --cds-button-separator: #000000;

  /* Focus ring + text-on-color */
  --cds-focus: #ffffff;
  --cds-focus-inset: #161616;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #6f6f6f;
}

/* All Carbon buttons: sharp corners, never rounded */
.cds--btn,
cds-button::part(button) {
  border-radius: 0;
}
```

## States Reference (from `.scss` + token map)

> White-theme literals; G100 shown when it differs. All values resolved from the token block above and `web-components/button.scss`.

| Variant | Rest bg / fg | Hover bg / fg | Active bg / fg | Focus | Disabled |
|---|---|---|---|---|---|
| Primary | `#0f62fe` / `#ffffff` | `#0050e6` (W) `#0353e9` (G100) / `#ffffff` | `#002d9c` / `#ffffff` | `outline:2px solid #0f62fe` + `inset 0 0 0 1px #ffffff` | bg `#c6c6c6` (W) `rgba(141,141,141,.3)` (G100) / fg `#8d8d8d` (W) `#6f6f6f` (G100), `cursor:not-allowed` |
| Secondary | `#393939` (W) `#6f6f6f` (G100) / `#ffffff` | `#4c4c4c` (W) `#5e5e5e` (G100) / `#ffffff` | `#6f6f6f` (W) `#393939` (G100) / `#ffffff` | same focus pattern | same disabled pattern |
| Tertiary | `transparent` / `#0f62fe` (W) `#ffffff` (G100); `1px` border in fg color | `#0050e6` (W) `#f4f4f4` (G100) / `#ffffff` (W) `#161616` (G100) | `#002d9c` (W) `#c6c6c6` (G100) / `#ffffff` (W) `#161616` (G100) | same focus pattern | same disabled pattern |
| Ghost | `transparent` / `#0f62fe` (W) `#ffffff` (G100); no border | `#e8e8e8` (`--cds-background-hover`) / fg unchanged | `#c6c6c6` (`--cds-background-active`) / fg unchanged | same focus pattern; SCSS: `:host([kind='ghost']) { &:hover, &:active { outline: none; } }` | same disabled pattern |
| Danger (primary) | `#da1e28` / `#ffffff` | `#b81921` / `#ffffff` | `#750e13` / `#ffffff` | same focus pattern | same disabled pattern |
| Danger Tertiary | `transparent` / `#da1e28` (W) `#fa4d56` (G100); `1px` border in fg color | `#b81921` / `#ffffff` | `#750e13` / `#ffffff` | same focus pattern | same disabled pattern |
| Danger Ghost | `transparent` / `#da1e28` (W) `#fa4d56` (G100); no border | `#b81921` / `#ffffff` | `#750e13` / `#ffffff` | same focus pattern | same disabled pattern |
| Icon Button | inherits parent kind / `#161616` (W) `#f4f4f4` (G100); `padding:8px` square | inherits | inherits | `outline:2px solid var(--cds-focus); outline-offset:-2px;` | inherits |
| Skeleton | `#e8e8e8` (`--cds-skeleton-background`) | n/a | n/a | n/a | shimmer via `@keyframes skeleton` |

Verbatim SCSS rules that drive the states above (from `web-components/button.scss`):

```scss
&:focus {
  outline: $spacing-01 solid $focus;          /* $spacing-01 = 2px */
  outline-offset: -#{$spacing-01};
  transition: opacity $duration-fast-02 motion(standard, productive);
}
:host(#{$prefix}-button[kind='ghost']) {
  &:hover, &:active { outline: none; }
  &:not(:focus)     { box-shadow: none; }
  &.#{$prefix}--btn--icon-only {
    padding-block-start: 0;
    &.#{$prefix}--btn--selected,
    &.#{$prefix}--btn--expressive { padding: $spacing-03; /* 8px */ }
  }
}
```

## Animation & Motion

Carbon uses **fast-01 (70 ms) / productive-standard** for background+color+border transitions and **fast-02 (110 ms)** for the focus outline. `prefers-reduced-motion` disables both.

```css
.cds--btn,
cds-button::part(button) {
  transition:
    background var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    color      var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    border     var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline    var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
}

@keyframes skeleton {
  0%   { opacity: 0.3; }
  20%  { opacity: 1; transform: scaleX(1); }
  100% { transform: scaleX(0); }
}
.cds--skeleton__placeholder,
cds-button-skeleton::part(skeleton) {
  animation: 3000ms ease-in-out skeleton 1000ms infinite;
}

@media (prefers-reduced-motion: reduce) {
  .cds--btn, cds-button::part(button),
  .cds--skeleton__placeholder, cds-button-skeleton::part(skeleton) {
    transition: none;
    animation: none;
  }
}
```

Resolved token values: `--cds-duration-fast-01: 70ms`, `--cds-duration-fast-02: 110ms`, `--cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9)`.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon's React `<Button>` renders a native `<button>` (or `<a>` when `href` is set). `cds-button` exposes the same via `::part(button)`. Never use a `<div>`.
- **ARIA:** `aria-pressed` for the icon-only ghost toggle (when `isSelected`); `aria-disabled` (instead of `disabled`) on focusable-disabled buttons so SRs still announce them; `aria-label` required on icon-only buttons (sourced from `iconDescription` / `tooltipText`); `aria-describedby` ties `danger-description` to danger kinds.
- **Keyboard:** `Enter` / `Space` activate; `Tab` / `Shift+Tab` traverse. The **2px solid `--cds-focus` outline + 1px `--cds-background` inset** is the keyboard affordance — never remove it with `outline: none`.
- **Touch target:** Carbon's smallest is `sm` = 32px. Use `md` (40px) on mobile, or wrap in a `min-height: 44px` tap target per WCAG 2.5.5.
- **Tooltip:** `IconButton` / `IconButtonWithBadge` use the `tooltip-text` value as both the visible tooltip and the underlying `aria-label`.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS | Don't paraphrase, shorten, or "clean up" the verbatim source |
| Sharp corners — `border-radius: 0` on every Carbon button | Don't add rounded corners |
| Use `cds--btn`, `cds--btn--primary`, etc. from the WC source | Don't invent class names like `.btn-primary` |
| Use `<cds-button>` in HTML / non-React | Don't substitute a generic `<button>` when source uses `<cds-button>` |
| Wrap scope in `[data-theme="white"]` or `[data-theme="g100"]` | Don't define your own theme classes |
| Keep `outline: 2px solid var(--cds-focus)` + `1px` inset | Don't apply `outline: none` on `:focus` |
| Use `kind="ghost"` + `size="lg"` for badged icon buttons | Don't put a badge on `kind="primary"` or non-`lg` sizes |
| Add `aria-label` / `iconDescription` / `tooltipText` to icon-only buttons | Don't ship icon-only buttons without an SR label |
| Pair one Primary with a Secondary (or Tertiary) | Don't stack two Primary buttons in the same action group |
| Use Danger only for destructive actions | Don't use Danger as a generic "important" color |
