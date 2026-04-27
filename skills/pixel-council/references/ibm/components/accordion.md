---
name: accordion
description: Carbon Accordion — vertically stacked, expandable list of headings (start / end alignment, sm/md/lg sizes, default + flush variants); embeds verbatim Storybook source for Default, Controlled, WithLayer, and Skeleton variants
metadata:
  tags: accordion, disclosure, expand, collapse, list, ibm, carbon, react, web-components
---

# Accordion -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Accordion.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Accordion/Accordion.stories.js)
> - **WC story:** [`accordion.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/accordion/accordion.stories.ts)
> - **SCSS source:** [`_accordion.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/accordion/_accordion.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-accordion--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-accordion--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/accordion/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

> **Note on story exports:** the Phase 3 plan lists `NoAlign` and `NoTitle` as expected story exports. Neither exists in the current `Accordion.stories.js` or `accordion.stories.ts` on the `main` branch. The actual story exports are: **React** = `Default`, `Controlled`, `_WithLayer`, `Skeleton` (4 stories); **Web Components** = `Default`, `Controlled`, `Skeleton`, `WithLayer` (4 stories). The "no-align" and "no-title" cases are covered by toggling the `align` / `alignment` arg and omitting the `title` prop on individual `AccordionItem`s — both behaviours are demonstrated below in the Plain HTML section.

## Quick Reference

| Property | Value |
|---|---|
| Sizes (sm / md / lg heights) | `40px` / `48px` / `64px` (`min-block-size: layout.size('height')` in `_accordion.scss`) |
| Heading padding-inline-end | `layout.density('padding-inline')` — `16px` at `normal` density (`$spacing-05`) |
| Default alignment | `end` (chevron RIGHT, title LEFT) — Carbon v11 default. `start` reverses to chevron LEFT, title RIGHT |
| Title type style | `body-01` — IBM Plex Sans 14px / 20px line-height / 0.16px letter-spacing / weight 400 |
| Title inline-padding-start | `$spacing-05` (`16px`) — gap between chevron and title text |
| Content padding-inline | `layout.density('padding-inline')` (`16px`); `padding-inline-end` widens to `$spacing-09` (`48px`) ≥ 480px and `25%` ≥ 640px |
| Content active block padding | `$spacing-03` block-start (`8px`), `$spacing-06` block-end (`24px`) |
| Item border (top + last bottom) | `1px solid var(--cds-border-subtle-01)` (= `#c6c6c6` White, `#525252` G100) |
| Border radius | `0` (Carbon: sharp by default — applies to heading, item, content) |
| Chevron size | `1rem` × `1rem` (`16px` × `16px`); `flex: 0 0 1rem` |
| Chevron rest rotation | `rotate(-270deg)` (chevron points DOWN — collapsed state) |
| Chevron active rotation | `rotate(-90deg)` (chevron points UP — expanded state) — net 180° transform |
| Chevron transition | `all var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` (110ms) |
| Heading hover background | `var(--cds-layer-hover-01)` (= `#e8e8e8` White, `#333333` G100) |
| Heading hover transition | `background-color var(--cds-easing-productive-standard) var(--cds-duration-fast-02)` (110ms) |
| Heading focus | 6-shadow ring in `var(--cds-focus)` (top/right/bottom/left + inset top/right/bottom/left) — see Animation section |
| Title color (rest) | `var(--cds-text-primary)` (= `#161616` White, `#f4f4f4` G100) |
| Disabled color | `var(--cds-text-disabled)` (= `rgba(22,22,22,0.25)` White, `rgba(244,244,244,0.25)` G100) |
| Disabled chevron | `fill: var(--cds-icon-disabled)` (same alpha as text-disabled) |
| Wrapper open transition | `all var(--cds-duration-fast-02) var(--cds-easing-productive-entrance)` (110ms) with `allow-discrete` |
| Flush variant | Borders move to `::before` / `::after` pseudo-elements with `inline-size: calc(100% - $spacing-05 - $spacing-05)` and `margin-inline-start: $spacing-05` |
| React import | `import { Accordion, AccordionItem, AccordionSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/accordion/index.js';` |

## Variants (from Storybook story exports)

Every story export found in `Accordion.stories.js` (React) and `accordion.stories.ts` (WC):

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Four `AccordionItem`s with text titles (one with a JSX node title). Demonstrates the standard `end`-aligned chevron, `md` size, non-flush layout |
| Controlled | `Controlled` | `Controlled` | Same four items wrapped in a `ButtonSet` of "Click to expand all" / "Click to collapse all" buttons. Drives each item's `open` prop (React) or `open` attribute (WC) |
| WithLayer | `_WithLayer` | `WithLayer` | Same Default markup nested inside `<WithLayer>` (React) or the `withLayers` decorator (WC) — shows how the `--cds-layer-*` token tier shifts the heading hover / item border colors when nested in `layer-02` / `layer-03` |
| Skeleton | `Skeleton` | `Skeleton` | Loading placeholder — `<AccordionSkeleton open count={4} />` (React) or `<cds-accordion-skeleton>` (WC). Renders gray skeleton bars in place of titles |

> The React story file also exports `Default`, `Controlled`, `_WithLayer`, `Skeleton`; the underscore prefix on `_WithLayer` keeps Storybook's auto-naming as "With Layer". The WC file exports `Default`, `Controlled`, `Skeleton`, `WithLayer` (no underscore).

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Accordion.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable no-console */

import React from 'react';
import { action } from 'storybook/actions';
import './story.scss';
import { default as Accordion, AccordionItem, AccordionSkeleton } from '.';
import Button from '../Button';
import ButtonSet from '../ButtonSet';
import mdx from './Accordion.mdx';
import { WithLayer } from '../../../.storybook/templates/WithLayer';
```

**Story metadata** (default export from the stories file):

```jsx
export default {
  title: 'Components/Accordion',
  component: Accordion,
  subcomponents: {
    AccordionItem,
    AccordionSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const sharedArgTypes = {
  align: {
    options: ['start', 'end'],
    control: { type: 'select' },
  },
  children: {
    control: false,
  },
  className: {
    control: false,
  },
  disabled: {
    control: {
      type: 'boolean',
    },
  },
  ordered: {
    control: {
      type: 'boolean',
    },
  },
  isFlush: {
    control: {
      type: 'boolean',
    },
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
  onHeadingClick: {
    action: 'onHeadingClick',
    control: false,
  },
};

const sharedArgs = {
  align: 'end',
  disabled: false,
  isFlush: false,
  ordered: false,
  size: 'md',
  onHeadingClick: ({ isOpen, event }) => {
    action('onHeadingClick')({
      isOpen,
      type: event.type,
    });
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const { onHeadingClick, ...restArgs } = args;
  return (
    <Accordion {...restArgs}>
      <AccordionItem title="Choose your plan" onHeadingClick={onHeadingClick}>
        <p>
          Compare plan features and select the option that best matches your
          team&apos;s expected usage.
        </p>
      </AccordionItem>
      <AccordionItem title="Add team members" onHeadingClick={onHeadingClick}>
        <p>
          Invite collaborators by email and assign their workspace roles before
          launch.
        </p>
      </AccordionItem>
      <AccordionItem
        title="Set payment details"
        onHeadingClick={onHeadingClick}>
        <p>
          Add billing information and choose whether to receive invoices by
          email.
        </p>
      </AccordionItem>
      <AccordionItem
        onHeadingClick={onHeadingClick}
        title={
          <span>
            Review and confirm (<em>title can be a node</em>)
          </span>
        }>
        <p>
          Check your setup summary, then confirm to create the workspace for
          your team.
        </p>
      </AccordionItem>
    </Accordion>
  );
};

Default.args = { ...sharedArgs };

Default.argTypes = { ...sharedArgTypes };
```

**Variant: Controlled**

```jsx
export const Controlled = (args) => {
  const [expandAll, setExpandAll] = React.useState(false);
  const { onHeadingClick, ...restArgs } = args;

  return (
    <>
      <ButtonSet className={'controlled-accordion-btnset'}>
        <Button
          className={'controlled-accordion-btn'}
          onClick={() => {
            expandAll === true ? setExpandAll(1) : setExpandAll(true);
          }}>
          Click to expand all
        </Button>
        <Button
          className={'controlled-accordion-btn'}
          onClick={() => {
            expandAll || expandAll === null
              ? setExpandAll(false)
              : setExpandAll(null);
          }}>
          Click to collapse all
        </Button>
      </ButtonSet>

      <Accordion {...restArgs}>
        <AccordionItem
          title="Choose your plan"
          open={expandAll}
          onHeadingClick={onHeadingClick}>
          <p>
            Compare plan features and select the option that best matches your
            team&apos;s expected usage.
          </p>
        </AccordionItem>
        <AccordionItem
          title="Add team members"
          open={expandAll}
          onHeadingClick={onHeadingClick}>
          <p>
            Invite collaborators by email and assign their workspace roles
            before launch.
          </p>
        </AccordionItem>
        <AccordionItem
          title="Set payment details"
          open={expandAll}
          onHeadingClick={onHeadingClick}>
          <p>
            Add billing information and choose whether to receive invoices by
            email.
          </p>
        </AccordionItem>
        <AccordionItem
          title="Review and confirm"
          open={expandAll}
          onHeadingClick={onHeadingClick}>
          <p>
            Check your setup summary, then confirm to create the workspace for
            your team.
          </p>
        </AccordionItem>
      </Accordion>
    </>
  );
};

Controlled.args = { ...sharedArgs };

Controlled.argTypes = { ...sharedArgTypes };
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = (args) => {
  const { onHeadingClick, ...restArgs } = args;

  return (
    <WithLayer>
      <Accordion {...restArgs}>
        <AccordionItem title="Choose your plan" onHeadingClick={onHeadingClick}>
          <p>
            Compare plan features and select the option that best matches your
            team&apos;s expected usage.
          </p>
        </AccordionItem>
        <AccordionItem title="Add team members" onHeadingClick={onHeadingClick}>
          <p>
            Invite collaborators by email and assign their workspace roles
            before launch.
          </p>
        </AccordionItem>
        <AccordionItem
          title="Set payment details"
          onHeadingClick={onHeadingClick}>
          <p>
            Add billing information and choose whether to receive invoices by
            email.
          </p>
        </AccordionItem>
        <AccordionItem
          title="Review and confirm"
          onHeadingClick={onHeadingClick}>
          <p>
            Check your setup summary, then confirm to create the workspace for
            your team.
          </p>
        </AccordionItem>
      </Accordion>
    </WithLayer>
  );
};

_WithLayer.args = { ...sharedArgs };

_WithLayer.argTypes = { ...sharedArgTypes };
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => (
  <AccordionSkeleton open count={4} {...args} />
);

Skeleton.decorators = [
  (story) => <div style={{ width: '500px' }}>{story()}</div>,
];

Skeleton.args = {
  align: 'end',
  isFlush: false,
  ordered: false,
};

Skeleton.argTypes = {
  align: {
    options: ['start', 'end'],
    control: { type: 'select' },
  },
  children: {
    control: false,
  },
  className: {
    control: false,
  },
  disabled: {
    table: {
      disable: true,
    },
  },
  isFlush: {
    control: {
      type: 'boolean',
    },
  },
  size: {
    table: {
      disable: true,
    },
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `accordion.stories.ts` on the Carbon `main` branch. Use these for non-React projects. lit-html `${expression}` bindings are preserved as-is.

**Imports** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { prefix } from '../../globals/settings';
import { ACCORDION_SIZE } from './accordion';
import './index';
import '../layer/index';
import styles from './accordion.scss?lit';
import { withLayers } from '../../../.storybook/decorators/with-layers';

const sizes = {
  [`Small size (${ACCORDION_SIZE.SMALL})`]: ACCORDION_SIZE.SMALL,
  [`Medium size (${ACCORDION_SIZE.MEDIUM})`]: ACCORDION_SIZE.MEDIUM,
  [`Large size (${ACCORDION_SIZE.LARGE})`]: ACCORDION_SIZE.LARGE,
};

const args = {
  alignment: 'END',
  disabled: false,
  isFlush: false,
  size: ACCORDION_SIZE.MEDIUM,
};

const argTypes = {
  alignment: {
    control: 'select',
    description:
      'Specify the alignment of the accordion heading title and chevron.',
    options: ['start', 'END'],
  },
  disabled: {
    control: 'boolean',
    description:
      'Specify whether an individual AccordionItem should be disabled.',
  },
  isFlush: {
    control: 'boolean',
    description:
      'Specify whether Accordion text should be flush, default is false, does not work with align="start".',
  },
  size: {
    control: 'select',
    description: 'Specify the size of the Accordion.',
    options: sizes,
  },
  onBeforeToggle: {
    action: `${prefix}-accordion-item-beingtoggled`,
    table: {
      disable: true,
    },
  },
  onToggle: {
    action: `${prefix}-accordion-item-toggled`,
    table: {
      disable: true,
    },
  },
};
```

**Variant: Default**

```html
export const Default = {
  args,
  argTypes,
  render: ({
    alignment,
    isFlush,
    size,
    disabled,
    onBeforeToggle,
    onToggle,
  }) => {
    return html`
      <cds-accordion
        alignment="${alignment}"
        size="${size}"
        ?isFlush="${isFlush}"
        ?disabled="${disabled}">
        <cds-accordion-item
          title="Choose your plan"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Compare plan features and select the option that best matches your
            team's expected usage.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          title="Add team members"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Invite collaborators by email and assign their workspace roles
            before launch.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          title="Set payment details"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Add billing information and choose whether to receive invoices by
            email.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          title="Review and confirm"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Check your setup summary, then confirm to create the workspace for
            your team.
          </p>
        </cds-accordion-item>
      </cds-accordion>
    `;
  },
};
```

**Variant: Controlled**

```html
export const Controlled = {
  // This story doesn't accept any args.
  args,
  argTypes,
  render: ({
    alignment,
    isFlush,
    size,
    disabled,
    onBeforeToggle,
    onToggle,
  }) => {
    const toggleItems = (isOpen: boolean) => {
      document
        .querySelectorAll('cds-accordion-item[controlled]')
        .forEach((item) => {
          if (isOpen) {
            item.setAttribute('open', '');
          } else {
            item.removeAttribute('open');
          }
        });
    };

    return html`
      <style>
        ${styles}
      </style>
      <cds-button-set>
        <cds-button
          class="controlled-accordion-btn"
          @click=${() => toggleItems(true)}>
          Click to expand all
        </cds-button>
        <cds-button
          class="controlled-accordion-btn"
          @click=${() => toggleItems(false)}>
          Click to collapse all
        </cds-button>
      </cds-button-set>

      <cds-accordion
        alignment="${alignment}"
        size="${size}"
        ?isFlush="${isFlush}"
        ?disabled="${disabled}">
        <cds-accordion-item
          controlled
          title="Choose your plan"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Compare plan features and select the option that best matches your
            team's expected usage.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          controlled
          title="Add team members"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Invite collaborators by email and assign their workspace roles
            before launch.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          controlled
          title="Set payment details"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Add billing information and choose whether to receive invoices by
            email.
          </p>
        </cds-accordion-item>
        <cds-accordion-item
          controlled
          title="Review and confirm"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          <p>
            Check your setup summary, then confirm to create the workspace for
            your team.
          </p>
        </cds-accordion-item>
      </cds-accordion>
    `;
  },
};
```

**Variant: Skeleton**

```html
export const Skeleton = {
  decorators: [(story) => html`<div style="width: 500px">${story()}</div>`],
  args: {
    alignment: 'END',
    isFlush: false,
  },
  argTypes: {
    alignment: {
      control: 'select',
      description:
        'Specify the alignment of the accordion heading title and chevron.',
      options: ['start', 'END'],
    },
    isFlush: {
      control: 'boolean',
      description:
        'Specify whether Accordion text should be flush, default is false, does not work with align="start".',
    },
  },
  render: ({ alignment, isFlush }) => {
    return html`<cds-accordion-skeleton
      alignment="${alignment}"
      ?isFlush="${isFlush}"></cds-accordion-skeleton>`;
  },
};
```

**Variant: WithLayer**

```html
export const WithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args,
  argTypes,
  render: ({
    alignment,
    isFlush,
    size,
    disabled,
    onBeforeToggle,
    onToggle,
  }) => {
    return html`
      <cds-accordion
        alignment="${alignment}"
        size="${size}"
        ?isFlush="${isFlush}"
        ?disabled="${disabled}">
        <cds-accordion-item
          title="Choose your plan"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          Compare plan features and select the option that best matches your
          team's expected usage.
        </cds-accordion-item>
        <cds-accordion-item
          title="Add team members"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          Invite collaborators by email and assign their workspace roles before
          launch.
        </cds-accordion-item>
        <cds-accordion-item
          title="Set payment details"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          Add billing information and choose whether to receive invoices by
          email.
        </cds-accordion-item>
        <cds-accordion-item
          title="Review and confirm"
          @cds-accordion-item-beingtoggled="${onBeforeToggle}"
          @cds-accordion-item-toggled="${onToggle}">
          Check your setup summary, then confirm to create the workspace for
          your team.
        </cds-accordion-item>
      </cds-accordion>
    `;
  },
};

const meta = {
  title: 'Components/Accordion',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same `<cds-accordion>` markup as Section 6, with lit-html `${...}` bindings resolved to literal attribute values. Use these for hand-coded HTML projects after loading the WC bundle (`<script type="module" src="https://cdn.jsdelivr.net/npm/@carbon/web-components/es/components/accordion/index.min.js"></script>`).

**Variant: Default — `end` alignment (chevron right), `md` size, non-flush**

```html
<cds-accordion alignment="end" size="md">
  <cds-accordion-item title="Choose your plan">
    <p>Compare plan features and select the option that best matches your team's expected usage.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Add team members">
    <p>Invite collaborators by email and assign their workspace roles before launch.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Set payment details">
    <p>Add billing information and choose whether to receive invoices by email.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Review and confirm">
    <p>Check your setup summary, then confirm to create the workspace for your team.</p>
  </cds-accordion-item>
</cds-accordion>
```

**Variant: Default — `start` alignment (chevron LEFT, title RIGHT)**

```html
<cds-accordion alignment="start" size="md">
  <cds-accordion-item title="Choose your plan">
    <p>Compare plan features and select the option that best matches your team's expected usage.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Add team members">
    <p>Invite collaborators by email and assign their workspace roles before launch.</p>
  </cds-accordion-item>
</cds-accordion>
```

**Variant: Flush — borders span full container width, content is flush-left to the parent**

```html
<cds-accordion alignment="end" size="md" isFlush>
  <cds-accordion-item title="Choose your plan">
    <p>Compare plan features and select the option that best matches your team's expected usage.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Add team members">
    <p>Invite collaborators by email and assign their workspace roles before launch.</p>
  </cds-accordion-item>
</cds-accordion>
```

> Note: per Carbon's argType docs, `isFlush` "does not work with `align='start'`." Always pair `isFlush` with `alignment="end"` (the default).

**Variant: Sizes — `sm` (40px), `md` (48px), `lg` (64px)**

```html
<cds-accordion alignment="end" size="sm">
  <cds-accordion-item title="Small heading row (40px)"><p>Body content.</p></cds-accordion-item>
</cds-accordion>

<cds-accordion alignment="end" size="md">
  <cds-accordion-item title="Medium heading row (48px — default)"><p>Body content.</p></cds-accordion-item>
</cds-accordion>

<cds-accordion alignment="end" size="lg">
  <cds-accordion-item title="Large heading row (64px)"><p>Body content.</p></cds-accordion-item>
</cds-accordion>
```

**Variant: Item open by default — set the `open` attribute on the item, NOT on the wrapper**

```html
<cds-accordion alignment="end" size="md">
  <cds-accordion-item title="Pre-expanded by default" open>
    <p>This item renders in the expanded state on first paint.</p>
  </cds-accordion-item>
  <cds-accordion-item title="Collapsed by default">
    <p>This item starts collapsed.</p>
  </cds-accordion-item>
</cds-accordion>
```

**Variant: Disabled — entire accordion or per-item**

```html
<!-- Whole accordion disabled (every heading non-interactive): -->
<cds-accordion alignment="end" size="md" disabled>
  <cds-accordion-item title="Choose your plan"><p>Body content.</p></cds-accordion-item>
  <cds-accordion-item title="Add team members"><p>Body content.</p></cds-accordion-item>
</cds-accordion>

<!-- Single item disabled inside an enabled accordion: -->
<cds-accordion alignment="end" size="md">
  <cds-accordion-item title="Choose your plan"><p>Body content.</p></cds-accordion-item>
  <cds-accordion-item title="Add team members" disabled><p>Body content.</p></cds-accordion-item>
</cds-accordion>
```

**Variant: Skeleton — loading placeholder**

```html
<div style="width: 500px;">
  <cds-accordion-skeleton alignment="end"></cds-accordion-skeleton>
</div>
```

**Variant: NoTitle — item without a `title` attribute (the heading row collapses to chevron-only)**

```html
<cds-accordion alignment="end" size="md">
  <cds-accordion-item>
    <p>This item omits the title attribute. The heading row still renders (chevron only) and remains keyboard-focusable. Provide an `aria-label` on the item for screen readers when no title is present.</p>
  </cds-accordion-item>
</cds-accordion>
```

> The Phase-3 plan calls out `NoTitle` and `NoAlign` as variants. Carbon does not ship dedicated story exports for these — they are simply states of the Default story, demonstrated above (`NoTitle` = omit `title`; `NoAlign` = omit `alignment` to fall back to the `END` default).

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by `_accordion.scss` (`$border-subtle`, `$layer-hover`, `$text-primary`, `$text-disabled`, `$icon-primary`, `$icon-disabled`, `$focus`) to their literal hex values per theme.

```css
[data-theme="white"] {
  /* Item borders */
  --cds-border-subtle-01: #c6c6c6;     /* item top + last-child bottom */
  --cds-border-subtle-00: #e0e0e0;     /* alternative subtle on white surface */

  /* Heading hover surface */
  --cds-layer-hover-01: #e8e8e8;       /* heading hover background */

  /* Text */
  --cds-text-primary: #161616;          /* title rest color */
  --cds-text-disabled: rgba(22, 22, 22, 0.25); /* disabled heading + chevron */

  /* Chevron icon */
  --cds-icon-primary: #161616;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  /* Focus ring (used by the 6-shadow heading focus rule) */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;

  /* Motion + spacing */
  --cds-duration-fast-02: 110ms;        /* chevron rotation, wrapper open, hover bg */
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-easing-productive-entrance: cubic-bezier(0, 0, 0.38, 0.9);
  --cds-spacing-03: 0.5rem;             /*  8px — open wrapper block-start padding */
  --cds-spacing-05: 1rem;               /* 16px — title inline-padding-start, heading padding-inline-end @ normal density */
  --cds-spacing-06: 1.5rem;             /* 24px — open wrapper block-end padding */
  --cds-spacing-09: 3rem;               /* 48px — content padding-inline-end ≥ 480px */
}

[data-theme="g10"] {
  --cds-border-subtle-01: #e0e0e0;
  --cds-border-subtle-00: #e0e0e0;

  --cds-layer-hover-01: #e8e8e8;

  --cds-text-primary: #161616;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  --cds-icon-primary: #161616;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
}

[data-theme="g90"] {
  --cds-border-subtle-01: #6f6f6f;
  --cds-border-subtle-00: #525252;

  --cds-layer-hover-01: #4c4c4c;

  --cds-text-primary: #f4f4f4;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  --cds-icon-primary: #f4f4f4;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;
}

[data-theme="g100"],
.dark {
  /* Item borders */
  --cds-border-subtle-01: #525252;
  --cds-border-subtle-00: #393939;

  /* Heading hover surface */
  --cds-layer-hover-01: #333333;

  /* Text */
  --cds-text-primary: #f4f4f4;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  /* Chevron icon */
  --cds-icon-primary: #f4f4f4;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  /* Focus ring */
  --cds-focus: #ffffff;
  --cds-focus-inset: #161616;

  /* Motion + spacing — same in all themes */
  --cds-duration-fast-02: 110ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-easing-productive-entrance: cubic-bezier(0, 0, 0.38, 0.9);
  --cds-spacing-03: 0.5rem;
  --cds-spacing-05: 1rem;
  --cds-spacing-06: 1.5rem;
  --cds-spacing-09: 3rem;
}
```

## States Reference (from .scss)

> Pulled from `packages/styles/scss/components/accordion/_accordion.scss` (the cross-package source, identical to the WC's `accordion.scss`). All hex values resolved against the `[data-theme="white"]` and `[data-theme="g100"]` blocks in `overview.md`.

White theme — `.cds--accordion__heading` (the focusable button row):

| State | Background | Color | Chevron fill | Border (item top) | Outline / box-shadow |
|---|---|---|---|---|---|
| Rest | `transparent` | `#161616` (text-primary) | `#161616` (icon-primary) | `1px solid #c6c6c6` (border-subtle-01) | `none` |
| Hover | `#e8e8e8` (layer-hover-01) | `#161616` | `#161616` | `1px solid #c6c6c6` (item itself); the hover also blends the next item's top border to `#e8e8e8` via `border-block-start-color: $layer-hover` | `none` |
| Focus (`:focus`) | (rest) | `#161616` | `#161616` | (rest) | 6-shadow ring: `0 -1px 0 0 #0f62fe, inset 0 1px 0 0 #0f62fe, inset 2px 0 0 0 #0f62fe, 0 1px 0 0 #0f62fe, inset 0 -1px 0 0 #0f62fe, inset -2px 0 0 0 #0f62fe` (top + right-inset + bottom + left-inset, all in `--cds-focus`) |
| Active (item expanded — `.cds--accordion__item--active`) | `transparent` (heading itself); the wrapper below is `display: block` with `padding-block: 8px 24px` | `#161616` | `#161616` | (rest) | (none on heading) — chevron rotates from `-270deg` to `-90deg` |
| Disabled (`[disabled]`) | `transparent` | `rgba(22,22,22,0.25)` (text-disabled) | `rgba(22,22,22,0.25)` (icon-disabled) | `1px solid #c6c6c6` (kept; per the v10-parity comment in source) | `cursor: not-allowed` |

G100 theme — same structure, dark values:

| State | Background | Color | Chevron fill | Border (item top) | Outline |
|---|---|---|---|---|---|
| Rest | `transparent` | `#f4f4f4` | `#f4f4f4` | `1px solid #525252` | `none` |
| Hover | `#333333` (layer-hover-01) | `#f4f4f4` | `#f4f4f4` | `1px solid #525252` (next item top blends to `#333333`) | `none` |
| Focus | (rest) | `#f4f4f4` | `#f4f4f4` | (rest) | 6-shadow ring in `#ffffff` (focus token) |
| Active | `transparent` (heading); open wrapper visible | `#f4f4f4` | `#f4f4f4` | (rest) | chevron rotates |
| Disabled | `transparent` | `rgba(244,244,244,0.25)` | `rgba(244,244,244,0.25)` | `1px solid #525252` | `cursor: not-allowed` |

Sizes (all themes — affect heading row height only):

| Size class | `min-block-size` (heading) | Use case |
|---|---|---|
| `.cds--accordion--sm` | `40px` | Compact data dashboards, tightly stacked panels |
| `.cds--accordion--md` (default) | `48px` | Standard product UI, settings panes |
| `.cds--accordion--lg` | `64px` | Marketing pages, FAQ sections, expressive surfaces |

Variants (all themes):

| Variant class | Behaviour |
|---|---|
| `.cds--accordion--end` (default in v11) | Chevron RIGHT, title LEFT. `flex-direction: row-reverse` (the SCSS default). Title `padding-inline-start: 16px` |
| `.cds--accordion--start` | Chevron LEFT, title RIGHT. `flex-direction: row` (overrides the default). Chevron `margin: 2px 0 0 16px`. Content `margin-inline-start: calc(16px + 16px)` so body copy aligns under the title, not under the chevron |
| `.cds--accordion--flush` | Borders move from the item's `border-block-start` to `::before` / `::after` pseudo-elements with `inline-size: calc(100% - 32px)` and `margin-inline-start: 16px` — produces flush-left content with shorter borders. Heading hover background extends the full row width still. **Cannot be combined with `--start`** per Carbon's docs |
| `.cds--accordion__item--active` | Item expanded — wrapper becomes `display: block`, `max-block-size: fit-content`, `opacity: 1`, padding-block `8px 24px`. Chevron rotates from `-270deg` to `-90deg` |
| `.cds--accordion__item--collapsing` / `--expanding` | Transient classes added during the toggle transition. Set `display: block` on the content during the 110ms animation |

## Animation & Motion

Carbon's accordion uses **only productive motion tokens** (110ms — fast enough to feel instant, slow enough to communicate the transition direction). There are three animated properties; nothing else animates.

```css
/* 1. Chevron rotation (110ms productive standard) */
.cds--accordion__arrow {
  transition: all var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* duration-fast-02 = 110ms */
  /* easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
  transform: rotate(-270deg); /* rest — chevron points down */
}

.cds--accordion__item--active > .cds--accordion__heading > .cds--accordion__arrow {
  transform: rotate(-90deg); /* expanded — chevron points up */
}

/* 2. Heading hover background (110ms productive standard) */
.cds--accordion__heading {
  transition: background-color var(--cds-easing-productive-standard) var(--cds-duration-fast-02);
}

.cds--accordion__heading:hover {
  background-color: var(--cds-layer-hover-01);
}

/* 3. Content wrapper expand/collapse (110ms productive ENTRANCE — note: entrance, not standard) */
.cds--accordion__wrapper {
  display: none;            /* closed */
  overflow: hidden;
  padding: 0;
  max-block-size: 0;
  opacity: 0;
  transition: all var(--cds-duration-fast-02) var(--cds-easing-productive-entrance) allow-discrete;
  /* easing-productive-entrance = cubic-bezier(0, 0, 0.38, 0.9) */
}

.cds--accordion__item--active > .cds--accordion__wrapper {
  display: block;           /* open */
  overflow: visible;
  max-block-size: fit-content;
  opacity: 1;
  padding-block: var(--cds-spacing-03);     /* 8px top */
  padding-block-end: var(--cds-spacing-06); /* 24px bottom */
}

/* @starting-style for the expand entry — opacity / max-block-size / padding all start at 0 */
@starting-style {
  .cds--accordion__item--active > .cds--accordion__wrapper {
    padding: 0;
    max-block-size: 0;
    opacity: 0;
  }
}

/* 4. Item border-color (110ms productive standard) — used so the hover blend feels smooth */
.cds--accordion__item {
  transition: border-color var(--cds-easing-productive-standard) var(--cds-duration-fast-02);
}

/* 5. Flush variant border pseudo-elements also transition */
.cds--accordion--flush .cds--accordion__item::before,
.cds--accordion--flush .cds--accordion__item::after {
  transition: background var(--cds-easing-productive-standard) var(--cds-duration-fast-02);
}

@media (prefers-reduced-motion: reduce) {
  .cds--accordion__arrow,
  .cds--accordion__heading,
  .cds--accordion__item,
  .cds--accordion__wrapper,
  .cds--accordion--flush .cds--accordion__item::before,
  .cds--accordion--flush .cds--accordion__item::after {
    transition: none;
  }
}
```

> The `allow-discrete` value on `.cds--accordion__wrapper` lets the `display: none → display: block` transition animate (instead of jumping). Combined with `@starting-style`, the open animation actually plays from a 0-height collapsed state. Browser support for `@starting-style` is partial as of 2024 (see https://caniuse.com/mdn-css_at-rules_starting-style); in non-supporting browsers the wrapper still toggles, just without the easing curve on the entry frame.

## Accessibility (from Carbon's docs + source)

- **Semantic markup:** Carbon renders `<ul class="cds--accordion">` with `<li class="cds--accordion__item">` children (`display: list-item; list-style: none;` per the source). The interactive heading row is a real `<button>` (Carbon's `button-reset.reset` mixin neutralises browser styling). The expandable region is a sibling `<div class="cds--accordion__wrapper">` after the button — NOT a child, so the button stays focusable independently.
- **ARIA:** Carbon's React `AccordionItem` sets `aria-expanded` on the heading button (toggling between `true` / `false`) and gives the wrapper an `id` referenced by `aria-controls`. The WC `<cds-accordion-item>` mirrors this: its shadow DOM emits `aria-expanded`, `aria-controls`, and a generated id. Don't add your own `aria-expanded` outside Carbon's markup — the framework already manages it.
- **Heading semantics:** Carbon does NOT auto-wrap each item in an `<h3>` / `<h4>`. If you place an Accordion inside a section that needs a heading hierarchy (e.g., FAQ), wrap the item label inside the `title` prop with the appropriate heading element: `title={<h3>Question text</h3>}` (React) / nest `<h3 slot="title">Question text</h3>` inside `<cds-accordion-item>` (WC).
- **Keyboard:**
  - **Tab / Shift-Tab** — moves focus into / between heading buttons (each heading is tabbable; the wrapper content is also tabbable when its interactive children are present).
  - **Enter** — toggles the focused item open / closed.
  - **Space** — same as Enter (toggles the focused item).
  - **Arrow Up / Arrow Down** — Carbon does NOT add roving-tabindex arrow navigation; each heading is a standalone button. Use Tab to move between items.
- **Focus visualisation:** the 6-shadow box-shadow ring on `:focus` produces a `2px` blue outline that wraps the entire heading row (top + right + bottom + left, with two of those edges as inset shadows so the ring stays crisp at item boundaries). DO NOT remove this — it is the keyboard-only focus indicator. The standard `outline: none` is intentional because the box-shadow is doing the focus job.
- **Touch target:** `sm` size = `40px` heading row (below the WCAG 2.1 SC 2.5.5 `44px` minimum); `md` = `48px` (passes); `lg` = `64px` (passes). For mobile-first deployments use `size="md"` or larger. If you must use `sm`, wrap the accordion in a context that does not require the AAA target (e.g., densely-packed dashboard sidebar where each row is reachable but not the primary action).
- **Disabled:** the React `<Accordion disabled>` prop and the WC `disabled` attribute set `[disabled]` on every heading button. The CSS applies `color: var(--cds-text-disabled)`, `cursor: not-allowed`, and removes hover background. Per-item disable: pass `disabled` on a single `<AccordionItem>` / `<cds-accordion-item>`.
- **`isFlush` constraint:** the SCSS source enforces "flush does not work with `align='start'`" via the cascade — the flush `::before` / `::after` borders are positioned for the `end` (default) flex-direction only. Pair `isFlush` with `alignment="end"` always.
- **Color contrast (White theme):** title `#161616` on `#ffffff` background = 21:1 (AAA). Title `#161616` on `#e8e8e8` (hover) = 13.6:1 (AAA). Disabled `rgba(22,22,22,0.25)` on `#ffffff` resolves to roughly `#bfbfbf` = 1.78:1 — fails AA, but Carbon's design intent is that disabled controls are not meant to be readable as primary content (WCAG SC 1.4.3 explicitly excludes disabled UI components).
- **Color contrast (G100 theme):** title `#f4f4f4` on `#161616` = 16.7:1 (AAA). Title `#f4f4f4` on `#333333` (hover) = 11.7:1 (AAA).
- **RTL:** the SCSS has explicit `[dir='rtl']` overrides for `.cds--accordion--start` (swaps `padding-inline` direction and removes the title's `padding-inline-start`). The `end` (default) variant works in RTL without overrides because it uses logical properties (`inline-size`, `block-size`, `padding-inline-*`).

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5 & 6 when generating Carbon Accordion | Don't paraphrase, rename props, or rewrite render functions — the Carbon source IS the spec |
| Default to `alignment="end"` (chevron RIGHT) — Carbon v11's deliberate change from v10's `start` default | Don't use `alignment="start"` unless the design specifically calls for left-aligned chevrons (e.g., file-tree-style mental model) |
| Pair `isFlush` with `alignment="end"` only — Carbon's source enforces this constraint | Don't combine `isFlush` with `alignment="start"`; the flush border positioning breaks (the SCSS comment + argType description both call this out) |
| Use `border-radius: 0` on every part of the component (heading, item, content wrapper) | Don't add `border-radius` to soften corners — sharp edges are Carbon's signature; rounded accordions read as Material or Apple |
| Use `size="md"` (48px heading) for general product UI, `size="lg"` (64px) for FAQs and marketing accordions, `size="sm"` (40px) only for compact dashboards where the touch target is less critical | Don't manually override `min-block-size` on the heading — change `size` instead so the type style stays coordinated |
| Wrap the item label in a heading element (`<h3>title</h3>`) when the accordion lives inside a content hierarchy (e.g., FAQ section) | Don't rely on Carbon to inject heading semantics — the bare `title` is rendered as plain text inside a `<button>` |
| Let Carbon's `:focus` 6-shadow ring stand — it provides the full-row keyboard focus indicator | Don't replace the box-shadow ring with a single `outline` rule — the inset shadows are required so the ring doesn't get clipped at item borders |
| Use `disabled` at the `<Accordion>` level for "entire region not actionable" cases (e.g., gated content) | Don't disable individual items as a way to communicate "completed" state — use a different visual marker (icon, color) and keep the item interactive |
| Open items by default with `open` on the `AccordionItem` (React) or `<cds-accordion-item open>` (WC) when one panel is the obvious starting point | Don't start with all items collapsed when the user always needs to read panel #1 first — pre-expand it |
| Use `--cds-layer-hover-01` (theme-aware) for the heading hover background — Carbon's source already does this | Don't hardcode `#e8e8e8` for hover — it'll be wrong in G90 / G100 themes (where it should be `#4c4c4c` / `#333333`) |
| Wrap the accordion in `[data-theme="white"]` or `[data-theme="g100"]` so all `--cds-*` tokens resolve correctly | Don't ship an accordion outside a theme scope — the `--cds-border-subtle-01`, `--cds-layer-hover-01`, etc. won't have values |
| Trust Carbon's `prefers-reduced-motion` handling — the SCSS already drops every transition under that media query | Don't add your own motion overrides — you'll either double-disable or fight Carbon's defaults |
| For the "no title" case, omit the `title` attribute / prop AND add `aria-label` on the item so screen readers announce something | Don't leave a chevron-only item with no `title` and no `aria-label` — the heading button has no accessible name |
