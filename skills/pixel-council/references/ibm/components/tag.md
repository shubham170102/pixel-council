---
name: tag
description: Carbon Tag — pill-shaped categorisation chips. Variants ReadOnly, Dismissible, Selectable, Operational, Skeleton across 12 colour types (red/magenta/purple/blue/cyan/teal/green/gray/cool-gray/warm-gray/high-contrast/outline) at sm/md/lg sizes
metadata:
  tags: tag, chip, label, badge, filter, dismissible, selectable, operational, ibm, carbon, react, web-components
---

# Tag -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Tag.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Tag/Tag.stories.js)
> - **WC story:** [`tag.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tag/tag.stories.ts)
> - **WC SCSS:** [`tag.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tag/tag.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-tag--read-only
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-tag--read-only
> - **Docs page:** https://v11.carbondesignsystem.com/components/tag/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg) | `18px` / `24px` (`$spacing-06`) / `32px` (`$spacing-07`) |
| Padding inline (sm-md / lg) | `$spacing-03` = 8px / `$spacing-04` = 12px (`$spacing-02` = 4px inline-start when custom icon present) |
| Min × max inline-size | `32px` × `208px` (keeps pill shape, truncates with `text-overflow: ellipsis`) |
| **Corner radius** | **`border-radius: 2px`** — **CARBON EXCEPTION** (not `0`). Tag is one of 3 components (Tag / Tooltip / Popover) that intentionally break the sharp-corner rule. |
| Type style | `label-01` — IBM Plex Sans, `12px` / `16px`, weight `400`, letter-spacing `0.16px` |
| Close-icon hit-area (sm) | `18px × 18px`, `margin-inline-start: 5px` |
| Color variants (12) | red, magenta, purple, blue, cyan, teal, green, gray, cool-gray, warm-gray, high-contrast, outline |
| Default `gray` (White / G100) | bg `#e0e0e0` text `#161616` / bg `#525252` text `#f4f4f4` |
| Outline outline (both themes) | `1px solid var(--cds-background-inverse)`, `outline-offset: -1px` |
| Focus ring (interactive variants) | `2px solid var(--cds-focus)`, `outline-offset: 1px` |
| Imports | React: `import { Tag, DismissibleTag, SelectableTag, OperationalTag, TagSkeleton } from '@carbon/react';` — WC: `import '@carbon/web-components/es/components/tag/index.js';` |

## Variants (from Storybook story exports)

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| Read-only | `ReadOnly` | `ReadOnly` | Informational tag — no interaction. The 12-colour rainbow. |
| Dismissible | (composed via `DismissibleTag` component, exposed in `withAILabel`) | `Dismissible` | Tag with a close (`X`) icon-button. Click to remove. |
| Selectable | (component `SelectableTag`) | `Selectable` | Toggleable filter chip. Renders a `<button aria-pressed>`. |
| Operational | (component `OperationalTag`) | `Operational` | Clickable tag that triggers an action (often opens a popover). |
| Skeleton | `Skeleton` | `Skeleton` | Loading placeholder. |
| With AI label | `withAILabel` | `WithAILabel` | Tag composed with `<AILabel>` decorator (AI provenance badge). |
| Filter (read-only `filter` prop) | (`ReadOnly` w/ `filter: true` arg) | (`ReadOnly` w/ `filter` arg) | Read-only tag with an inline X. Used for active-filter chips. |

## React (verbatim from Storybook)

> The code below is copied verbatim from `Tag.stories.js` on the Carbon `main` branch. Do NOT edit it — the Carbon source is the truth.

**Imports** (top of `Tag.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { default as Tag } from '../Tag';
import TagSkeleton from '../Tag/Tag.Skeleton';
import DismissibleTag from '../Tag/DismissibleTag';
import { Asleep, View, FolderOpen, Folders } from '@carbon/icons-react';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import '../AILabel/ailabel-story.scss';
import mdx from './Tag.mdx';
import './story.scss';

export default {
  title: 'Components/Tag',
  component: Tag,
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: ReadOnly** (the 12-colour rainbow — covers every supported `type`)

```jsx
export const ReadOnly = (args) => {
  return (
    <>
      <Tag className="some-class" type="red" {...args}>
        {'Tag content with a long text description'}
      </Tag>
      <Tag className="some-class" type="magenta" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="purple" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="blue" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="cyan" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="teal" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="green" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="gray" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="cool-gray" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="warm-gray" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="high-contrast" {...args}>
        {'Tag content'}
      </Tag>
      <Tag className="some-class" type="outline" {...args}>
        {'Tag content'}
      </Tag>
    </>
  );
};

ReadOnly.args = { disabled: false, filter: false, size: 'md', title: 'Clear filter' };
ReadOnly.argTypes = {
  children: { control: false }, className: { control: false },
  disabled: { control: { type: 'boolean' } }, filter: { control: { type: 'boolean' } },
  id: { control: false }, renderIcon: { control: false },
  size: { options: ['sm', 'md', 'lg'], control: { type: 'select' } },
  title: { control: { type: 'text' } },
  type: { options: ['red','blue','cyan','teal','green','gray','high-contrast','outline'], control: { type: 'select' } },
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => (
  <div>
    <TagSkeleton {...args} />
  </div>
);

Skeleton.args = { size: 'md' };
Skeleton.parameters = { controls: { exclude: ['disabled', 'filter', 'id', 'renderIcon', 'title', 'type'] } };
Skeleton.argTypes = { size: { options: ['sm', 'md', 'lg'], control: { type: 'select' } } };
```

**Variant: withAILabel** (composes `Tag` and `DismissibleTag` with an `<AILabel>` decorator)

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
    <div style={{ marginBottom: '4rem' }}>
      <Tag
        decorator={aiLabel}
        className="some-class"
        type="red"
        title="Clear Filter"
        {...args}>
        {args.text}
      </Tag>

      <DismissibleTag
        decorator={aiLabel}
        className="some-class"
        type="purple"
        title="Clear Filter"
        {...args}></DismissibleTag>

      <Tag
        renderIcon={Asleep}
        decorator={aiLabel}
        className="some-class"
        type="blue"
        title="Clear Filter"
        {...args}>
        {args.text}
      </Tag>

      <DismissibleTag
        renderIcon={Asleep}
        decorator={aiLabel}
        className="some-class"
        type="green"
        title="Clear Filter"
        {...args}></DismissibleTag>
    </div>
  );
};

withAILabel.args = { disabled: false, size: 'md', text: 'Tag content' };
withAILabel.argTypes = {
  children: { control: false }, className: { control: false },
  decorator: { control: false }, disabled: { control: { type: 'boolean' } },
  filter: { control: false }, id: { control: false }, renderIcon: { control: false },
  size: { options: ['sm', 'md', 'lg'], control: { type: 'select' } },
  title: { control: { type: 'text' } },
  type: { options: ['red','blue','cyan','teal','green','gray','high-contrast','outline'], control: { type: 'select' } },
  text: { control: { type: 'text' } },
};
withAILabel.parameters = { controls: { exclude: ['filter'] } };
```

> Note: the React stories file does not include explicit `Dismissible`, `Selectable`, or `Operational` story exports (those exist as separate components — `DismissibleTag`, `SelectableTag`, `OperationalTag`). The Web Components story file (next section) covers them as dedicated story exports — use the WC source for those variants.

## Web Components (verbatim from Storybook)

> The code below is copied verbatim from `tag.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (top of `tag.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2019, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { TAG_SIZE } from './tag';
import './index';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import Asleep16 from '@carbon/icons/es/asleep/16.js';
import '../popover';
import '../ai-label';
import '../button';
import '../icon-button';
import { POPOVER_ALIGNMENT } from '../popover/defs';

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
  [`sm`]: TAG_SIZE.SMALL,
  [`md`]: TAG_SIZE.MEDIUM,
  [`lg`]: TAG_SIZE.LARGE,
};

const types = [
  'red',
  'magenta',
  'purple',
  'blue',
  'cyan',
  'teal',
  'green',
  'gray',
  'cool-gray',
  'warm-gray',
  'high-contrast',
  'outline',
];

const tooltipAlignments = {
  [`top`]: POPOVER_ALIGNMENT.TOP,
  [`top-left`]: POPOVER_ALIGNMENT.TOP_LEFT,
  [`top-right`]: POPOVER_ALIGNMENT.TOP_RIGHT,
  [`bottom`]: POPOVER_ALIGNMENT.BOTTOM,
  [`bottom-left`]: POPOVER_ALIGNMENT.BOTTOM_LEFT,
  [`bottom-right`]: POPOVER_ALIGNMENT.BOTTOM_RIGHT,
  [`left`]: POPOVER_ALIGNMENT.LEFT,
  [`left-bottom`]: POPOVER_ALIGNMENT.LEFT_BOTTOM,
  [`left-top`]: POPOVER_ALIGNMENT.LEFT_TOP,
  [`right`]: POPOVER_ALIGNMENT.RIGHT,
  [`right-bottom`]: POPOVER_ALIGNMENT.RIGHT_BOTTOM,
  [`right-top`]: POPOVER_ALIGNMENT.RIGHT_TOP,
};

const defaultArgs = {
  disabled: false,
  size: TAG_SIZE.MEDIUM,
};

const controls = {
  disabled: {
    control: 'boolean',
    description: 'Specify if the Tag is disabled',
  },
  size: {
    control: 'select',
    description:
      'Specify the size of the Tag. Currently supports either `sm`, `md` (default) or `lg` sizes.',
    options: sizes,
  },
};
```

**Variant: ReadOnly**

```ts
export const ReadOnly = {
  argTypes: {
    ...controls,
    title: {
      control: 'text',
      description: 'Text to show on clear filters',
    },
    text: {
      control: 'text',
      description: 'Provide text to be rendered inside of a the tag.',
    },
    filter: {
      control: 'boolean',
      description: 'Determine if `Tag` is a filter/chip',
    },
  },
  args: {
    ...defaultArgs,
    filter: false,
    title: 'Clear filters',
    text: 'Tag content',
  },
  render: ({ filter, title, size, disabled, text }) =>
    html` <cds-tag
        type="red"
        ?filter="${filter}"
        title="${title}"
        size="${size}"
        ?disabled="${disabled}">
        ${text}
      </cds-tag>
      ${types
        .slice(1)
        .map(
          (e) =>
            html`<cds-tag
              type="${e}"
              ?filter="${filter}"
              title="${title}"
              size="${size}"
              ?disabled="${disabled}"
              >${text}</cds-tag
            >`
        )}`,
};
```

**Variant: Dismissible**

```ts
export const Dismissible = {
  argTypes: {
    ...controls,
    text: {
      control: 'text',
      description: 'Provide text to be rendered inside of a the tag.',
    },
    dismissTooltipAlignment: {
      control: 'select',
      options: tooltipAlignments,
      description: 'Specify the tooltip alignment for the dismiss button',
      table: {
        defaultValue: { summary: 'bottom' },
      },
    },
    dismissTooltipLabel: {
      control: 'text',
      description: 'Text to show on clear filters',
    },
  },
  args: {
    ...defaultArgs,
    dismissTooltipAlignment: 'bottom',
    dismissTooltipLabel: 'Dismiss',
  },
  render: ({
    disabled,
    size,
    text,
    dismissTooltipAlignment,
    dismissTooltipLabel,
  }) => {
    const tags = [
      {
        type: 'red',
        text: 'Tag content with a long text description',
        tagTitle: 'Provide a custom title to the tag',
      },
      {
        type: 'magenta',
        text: 'Tag content 1',
      },
      {
        type: 'purple',
        text: 'Tag content 2',
      },
      {
        type: 'blue',
        text: 'Tag content 3',
      },
      {
        type: 'cyan',
        text: 'Tag content 4',
      },
      {
        type: 'teal',
        text: 'Tag content 5',
      },
      {
        type: 'green',
        text: 'Tag content 6',
      },
      {
        type: 'gray',
        text: 'Tag content 7',
      },
      {
        type: 'cool-gray',
        text: 'Tag content 8',
      },
      {
        type: 'warm-gray',
        text: 'Tag content 9',
      },
      {
        type: 'high-contrast',
        text: 'Tag content 10',
      },
      {
        type: 'outline',
        text: 'Tag content 11',
      },
    ];

    const resetTags = () => {
      const dismissibleTags = document.querySelectorAll('cds-dismissible-tag');
      const tags = [...dismissibleTags];
      tags.map((tag) => tag?.setAttribute('open', 'true'));
    };

    return html` <div style="margin-bottom: 3rem">
        <cds-button @click="${resetTags}">Reset</cds-button>
      </div>
      ${tags.map(
        (tag) =>
          html`<cds-dismissible-tag
            ?disabled="${disabled}"
            text="${text || tag.text}"
            tag-title="${tag.tagTitle}"
            type="${tag.type}"
            size="${size}"
            dismiss-tooltip-label="${dismissTooltipLabel}"
            dismiss-tooltip-alignment="${dismissTooltipAlignment}"
            >${iconLoader(Asleep16, { slot: 'icon' })}
          </cds-dismissible-tag>`
      )}`;
  },
};
```

**Variant: Selectable**

```ts
export const Selectable = {
  argTypes: {
    ...controls,
    text: {
      control: 'text',
      description: 'Provide text to be rendered inside of a the tag.',
    },
  },
  args: {
    ...defaultArgs,
  },
  render: ({ disabled, size, text }) => {
    const tags = [
      {
        id: 1,
        text: 'Tag content with a long text description',
        selected: false,
      },
      {
        id: 2,
        text: 'Tag content 1',
        selected: true,
      },
      {
        id: 3,
        text: 'Tag content 2',
        selected: false,
      },
      {
        id: 4,
        text: 'Tag content 3',
        selected: false,
      },
    ];

    return html` <div aria-label="Selectable tags" role="group">
      ${tags.map(
        (tag) =>
          html`<cds-selectable-tag
            ?disabled="${disabled}"
            ?selected="${tag.selected}"
            id="${tag.id}"
            text="${text || tag.text}"
            size="${size}"
            >${iconLoader(Asleep16, { slot: 'icon' })}
          </cds-selectable-tag>`
      )}
    </div>`;
  },
};
```

**Variant: Operational** (includes interactive examples with `cds-popover`)

```ts
export const Operational = {
  argTypes: {
    ...controls,
    text: {
      control: 'text',
      description: 'Provide text to be rendered inside of a the tag.',
    },
  },
  args: {
    ...defaultArgs,
  },
  render: ({ disabled, size, text }) => {
    const togglePopover = (e) => {
      if (e instanceof PointerEvent) {
        const popoverElement = (e.target as HTMLElement)?.parentElement
          ?.parentElement;
        popoverElement?.toggleAttribute('open');
      }
      if (e instanceof KeyboardEvent) {
        if (e.key === ' ' || e.key === 'Enter') {
          const popoverElement = (e.target as HTMLElement)?.parentElement
            ?.parentElement;
          popoverElement?.toggleAttribute('open');
        }
      }
    };

    const tags = [
      {
        type: 'red',
        text: 'Tag content with a long text description',
      },
      {
        type: 'magenta',
        text: 'Tag content',
      },
      {
        type: 'purple',
        text: 'Tag content',
      },
      {
        type: 'blue',
        text: 'Tag content',
      },
      {
        type: 'cyan',
        text: 'Tag content',
      },
      {
        type: 'teal',
        text: 'Tag content',
      },
      {
        type: 'green',
        text: 'Tag content',
      },
      {
        type: 'gray',
        text: 'Tag content',
      },
      {
        type: 'cool-gray',
        text: 'Tag content',
      },
      {
        type: 'warm-gray',
        text: 'Tag content',
      },
    ];

    return html`
      <div
        aria-label="Operational tags"
        role="group"
        style="margin-bottom:1rem">
        ${tags.map(
          (tag) =>
            html`<cds-operational-tag
              ?disabled="${disabled}"
              type=${tag.type}
              text="${text || tag.text}"
              size="${size}"
              >${iconLoader(Asleep16, { slot: 'icon' })}
            </cds-operational-tag>`
        )}
      </div>
      <h4>Interactive examples</h4>
      <div
        id="operational-tag"
        style="display:flex; justify-content:flex-start; margin-top:1rem"
        aria-label="Operational tags with Popover"
        role="group">
        <cds-popover highContrast>
          <div class="playground-trigger">
            <cds-operational-tag
              @click="${togglePopover}"
              @keydown="${togglePopover}"
              ?disabled="${disabled}"
              text="${text || `Tag content`}">
              ${iconLoader(Asleep16, { slot: 'icon' })}
            </cds-operational-tag>
          </div>
          <cds-popover-content class="popover-content">
            <div style="line-height: 0; padding: 1rem">
              <p style="font-size: 14px">Tag 1 name</p>
              <p style="font-size: 14px">Tag 2 name</p>
              <p style="font-size: 14px">Tag 3 name</p>
              <p style="font-size: 14px">Tag 4 name</p>
              <p style="font-size: 14px">Tag 5 name</p>
            </div>
          </cds-popover-content>
        </cds-popover>

        <cds-popover>
          <div class="playground-trigger">
            <cds-operational-tag
              @click="${togglePopover}"
              @keydown="${togglePopover}"
              ?disabled="${disabled}"
              text="${text || `Tag content`}">
              ${iconLoader(Asleep16, { slot: 'icon' })}
            </cds-operational-tag>
          </div>
          <cds-popover-content>
            <div style="display:flex; flex-direction: column; padding:1rem">
              <cds-tag type="blue">Tag 1 name</cds-tag>
              <cds-tag type="blue">Tag 2 name</cds-tag>
              <cds-tag type="blue">Tag 3 name</cds-tag>
              <cds-tag type="blue">Tag 4 name</cds-tag>
              <cds-tag type="blue">Tag 5 name</cds-tag>
            </div>
          </cds-popover-content>
        </cds-popover>
      </div>
    `;
  },
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  argTypes: {
    size: {
      control: 'select',
      description:
        'Specify the size of the Tag. Currently supports either `sm`, `md` (default) or `lg` sizes.',
      options: sizes,
    },
  },
  args: {
    size: TAG_SIZE.MEDIUM,
  },
  render: ({ size }) =>
    html`<cds-tag-skeleton size="${size}">Tag content</cds-tag-skeleton>`,
};
```

**Variant: WithAILabel**

```ts
export const WithAILabel = {
  argTypes: {
    ...controls,
    dismissTooltipLabel: {
      control: 'text',
      description: 'Text to show on clear filters',
    },
    text: {
      control: 'text',
      description: 'Provide text to be rendered inside of a the tag.',
    },
  },
  args: {
    ...defaultArgs,
    text: 'Tag content',
    dismissTooltipLabel: 'Dismiss',
  },
  render: ({ disabled, size, text, dismissTooltipLabel }) =>
    html`<cds-tag type="red" ?disabled="${disabled}" size="${size}"
        >${text}
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >
      </cds-tag>

      <cds-dismissible-tag
        type="purple"
        ?disabled="${disabled}"
        size="${size}"
        dismiss-tooltip-label="${dismissTooltipLabel}"
        text="${text}">
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >
      </cds-dismissible-tag>

      <cds-tag type="blue" ?disabled="${disabled}" size="${size}">
        ${iconLoader(Asleep16, { slot: 'icon' })} ${text}
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >
      </cds-tag>
      <cds-dismissible-tag
        type="green"
        ?disabled="${disabled}"
        size="${size}"
        dismiss-tooltip-label="${dismissTooltipLabel}"
        text="${text}">
        ${iconLoader(Asleep16, { slot: 'icon' })}
        <cds-ai-label alignment="bottom-left">
          ${content}${actions}</cds-ai-label
        >
      </cds-dismissible-tag>`,
};

const meta = {
  title: 'Components/Tag',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`${expression}`) resolved to literal attributes. Use this for hand-coded HTML without a component framework. The `cds-*` custom elements still require `@carbon/web-components` to be loaded on the page.

**Variant: ReadOnly — single example; emit one per `type` (12 colours)**

```html
<cds-tag type="red" title="Clear filters" size="md">Tag content with a long text description</cds-tag>
<cds-tag type="blue" title="Clear filters" size="md">Tag content</cds-tag>
<!-- Repeat with type="magenta|purple|cyan|teal|green|gray|cool-gray|warm-gray|high-contrast|outline" -->
```

**Variant: ReadOnly — `filter` chip (read-only with X)**

```html
<cds-tag type="blue" filter title="Clear filter" size="md" open>
  Status: Active
</cds-tag>
```

**Variant: Dismissible — colour rainbow with leading icon** (one example shown; repeat per `type`)

```html
<cds-dismissible-tag
  type="red"
  text="Tag content with a long text description"
  tag-title="Provide a custom title to the tag"
  size="md"
  dismiss-tooltip-label="Dismiss"
  dismiss-tooltip-alignment="bottom"
  open>
  <svg slot="icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
    <!-- @carbon/icons asleep 16 — fetch from @carbon/icons/svg/16/asleep.svg -->
    <path d="M6 13.5C3.4 13.5 1.3 11.4 1.3 8.8c0-2.1 1.4-3.9 3.4-4.5C4.6 4.6 4.5 4.9 4.5 5.3 4.5 7.6 6.4 9.5 8.7 9.5c.4 0 .7-.1 1-.2C9.1 11.3 7.4 13.5 6 13.5z"/>
  </svg>
</cds-dismissible-tag>

<!-- Repeat with type="magenta|purple|blue|cyan|teal|green|gray|cool-gray|warm-gray|high-contrast|outline" -->
<cds-dismissible-tag type="blue" text="Tag content" size="md" dismiss-tooltip-label="Dismiss" open></cds-dismissible-tag>
```

**Variant: Selectable** (filter-chip pattern)

```html
<div aria-label="Selectable tags" role="group">
  <cds-selectable-tag id="1" text="Tag content with a long text description" size="md"></cds-selectable-tag>
  <cds-selectable-tag id="2" text="Tag content 1" size="md" selected></cds-selectable-tag>
  <cds-selectable-tag id="3" text="Tag content 2" size="md"></cds-selectable-tag>
  <cds-selectable-tag id="4" text="Tag content 3" size="md"></cds-selectable-tag>
</div>
```

**Variant: Operational** (clickable; opens action / popover)

```html
<div aria-label="Operational tags" role="group">
  <cds-operational-tag type="red"       text="Tag content" size="md"></cds-operational-tag>
  <cds-operational-tag type="blue"      text="Tag content" size="md"></cds-operational-tag>
  <cds-operational-tag type="gray"      text="Tag content" size="md"></cds-operational-tag>
  <!-- Repeat for magenta | purple | cyan | teal | green | cool-gray | warm-gray (10 colour types — high-contrast and outline are not used for Operational) -->
</div>
```

**Variant: Skeleton**

```html
<cds-tag-skeleton size="md">Tag content</cds-tag-skeleton>
```

## Design Tokens (component-scoped, literal hex per colour variant)

> Carbon names tag colour tokens `--cds-tag-{role}-{colour}` where `role ∈ {background, color, hover, border}`. White and G10 share the same scales (`-20` background, `-70` text); G90 and G100 invert them (`-70` background, `-20` text). High-contrast uses `background-inverse / text-inverse`; outline uses `background / text-primary` plus a 1px `background-inverse` outline. Source: `packages/themes/src/component-tokens/tag/tokens.js`.

**Light themes — `[data-theme="white"]` and `[data-theme="g10"]`:**

| Type | background | color | hover | border |
|---|---|---|---|---|
| red | `#ffd7d9` (red-20) | `#a2191f` (red-70) | `#ffc2c5` (red-20-hover) | `#ff8389` (red-40) |
| magenta | `#ffd6e8` (magenta-20) | `#9f1853` (magenta-70) | `#ffbdda` (magenta-20-hover) | `#ff7eb6` (magenta-40) |
| purple | `#e8daff` (purple-20) | `#6929c4` (purple-70) | `#dcc7ff` (purple-20-hover) | `#be95ff` (purple-40) |
| blue | `#d0e2ff` (blue-20) | `#0043ce` (blue-70) | `#b8d3ff` (blue-20-hover) | `#78a9ff` (blue-40) |
| cyan | `#bae6ff` (cyan-20) | `#00539a` (cyan-70) | `#99daff` (cyan-20-hover) | `#33b1ff` (cyan-40) |
| teal | `#9ef0f0` (teal-20) | `#005d5d` (teal-70) | `#57e5e5` (teal-20-hover) | `#08bdba` (teal-40) |
| green | `#a7f0ba` (green-20) | `#0e6027` (green-70) | `#74e792` (green-20-hover) | `#42be65` (green-40) |
| gray | `#e0e0e0` (gray-20) | `#161616` (gray-100) | `#d1d1d1` (gray-20-hover) | `#a8a8a8` (gray-40) |
| cool-gray | `#dde1e6` (cool-gray-20) | `#121619` (cool-gray-100) | `#cdd3da` (cool-gray-20-hover) | `#a2a9b0` (cool-gray-40) |
| warm-gray | `#e5e0df` (warm-gray-20) | `#171414` (warm-gray-100) | `#d8d0cf` (warm-gray-20-hover) | `#ada8a8` (warm-gray-40) |
| high-contrast | `#393939` (bg-inverse) | `#ffffff` (text-inverse) | `#4c4c4c` (bg-inverse-hover) | — |
| outline | `#ffffff` (background) | `#161616` (text-primary) | `#e8e8e8` (layer-hover-01) | `1px solid #393939` (bg-inverse), offset `−1px` |

**Dark themes — `[data-theme="g90"]`, `[data-theme="g100"]`, and `.dark`:**

| Type | background | color | hover | border |
|---|---|---|---|---|
| red | `#a2191f` (red-70) | `#ffd7d9` (red-20) | `#c21e25` (red-70-hover) | `#fa4d56` (red-50) |
| magenta | `#9f1853` (magenta-70) | `#ffd6e8` (magenta-20) | `#bf1d63` (magenta-70-hover) | `#ee5396` (magenta-50) |
| purple | `#6929c4` (purple-70) | `#e8daff` (purple-20) | `#7c3dd6` (purple-70-hover) | `#a56eff` (purple-50) |
| blue | `#0043ce` (blue-70) | `#d0e2ff` (blue-20) | `#0053ff` (blue-70-hover) | `#4589ff` (blue-50) |
| cyan | `#00539a` (cyan-70) | `#bae6ff` (cyan-20) | `#0066bd` (cyan-70-hover) | `#1192e8` (cyan-50) |
| teal | `#005d5d` (teal-70) | `#9ef0f0` (teal-20) | `#007070` (teal-70-hover) | `#009d9a` (teal-50) |
| green | `#0e6027` (green-70) | `#a7f0ba` (green-20) | `#11742f` (green-70-hover) | `#24a148` (green-50) |
| gray | `#525252` (gray-70) | `#f4f4f4` (gray-10) | `#636363` (gray-70-hover) | `#8d8d8d` (gray-50) |
| cool-gray | `#4d5358` (cool-gray-70) | `#f2f4f8` (cool-gray-10) | `#5d646a` (cool-gray-70-hover) | `#878d96` (cool-gray-50) |
| warm-gray | `#565151` (warm-gray-70) | `#f7f3f2` (warm-gray-10) | `#696363` (warm-gray-70-hover) | `#8f8b8b` (warm-gray-50) |
| high-contrast | `#f4f4f4` (bg-inverse on G100) | `#161616` (text-inverse on G100) | `#e8e8e8` (bg-inverse-hover on G100) | — |
| outline | `#161616` (background) | `#f4f4f4` (text-primary) | `#333333` (layer-hover-01) | `1px solid #f4f4f4` (bg-inverse), offset `−1px` |

Emit these as `--cds-tag-{role}-{type}` custom properties on `[data-theme="white"]` / `[data-theme="g10"]` (light pair) and `[data-theme="g90"]` / `[data-theme="g100"]` / `.dark` (dark pair). The Complete CSS section below references them.

## Complete CSS (derived from `tag.scss` + `_tag.scss`)

> The selectors below mirror Carbon's source. Sizes and the `tag-theme` mixin pattern come straight from `packages/web-components/src/components/tag/tag.scss` and `packages/styles/scss/components/tag/_tag.scss`.

```css
.cds--tag,
cds-tag,
cds-dismissible-tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
  /* CARBON EXCEPTION: Tag uses border-radius: 2px (not 0). */
  border-radius: 2px;
  border: 0;
  cursor: default;
  font-family: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  font-size: 0.75rem;       /* 12px — label-01 */
  line-height: 1rem;        /* 16px */
  font-weight: 400;
  letter-spacing: 0.16px;
  vertical-align: middle;
  word-break: break-word;
  /* size defaults to md */
  min-block-size: 1.5rem;   /* 24px */
  min-inline-size: 2rem;    /* 32px — keeps the pill shape */
  max-inline-size: 13rem;   /* 208px — restricts contained content */
  padding-inline: 0.5rem;   /* $spacing-03 = 8px */
  background-color: var(--cds-tag-background-gray);
  color: var(--cds-tag-color-gray);
  transition:
    background-color var(--cds-duration-fast-01, 70ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9)),
    color            var(--cds-duration-fast-01, 70ms) var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}

/* SIZES — heights from tag.scss layout overrides */
.cds--tag--sm,
cds-tag[size='sm'],
cds-dismissible-tag[size='sm'] {
  min-block-size: 1.125rem; /* 18px */
}

.cds--tag--lg,
cds-tag[size='lg'],
cds-dismissible-tag[size='lg'] {
  min-block-size: 2rem;     /* 32px = $spacing-07 */
  padding-inline: 0.75rem;  /* $spacing-04 = 12px */
}

/* CUSTOM ICON adjusts inline-start padding */
cds-tag[has-custom-icon],
cds-dismissible-tag[has-custom-icon] {
  padding-inline-start: 0.25rem; /* $spacing-02 = 4px */
}

cds-tag[size='lg'][has-custom-icon],
cds-dismissible-tag[size='lg'][has-custom-icon] {
  padding-inline-start: 0.5rem;  /* $spacing-03 = 8px */
}

/* COLOUR VARIANTS — repeat the pattern below for each of the 10 colour types
   (red, magenta, purple, blue, cyan, teal, green, gray, cool-gray, warm-gray) */
cds-tag[type='red']:not([disabled]),
cds-dismissible-tag[type='red']:not([disabled]),
cds-operational-tag[type='red']:not([disabled]) cds-tag {
  background-color: var(--cds-tag-background-red);
  color: var(--cds-tag-color-red);
}
cds-tag[type='red']:not([disabled]):hover,
cds-dismissible-tag[type='red']:not([disabled]):hover,
cds-operational-tag[type='red']:not([disabled]) cds-tag:hover {
  background-color: var(--cds-tag-hover-red);
}
/* …same selector pattern for magenta / purple / blue / cyan / teal / green
   / gray / cool-gray / warm-gray, each pulling its own --cds-tag-{background|color|hover}-{type} token. */

/* HIGH-CONTRAST — uses background-inverse + text-inverse */
cds-tag[type='high-contrast']:not([disabled]),
cds-dismissible-tag[type='high-contrast']:not([disabled]) {
  background-color: var(--cds-background-inverse);
  color: var(--cds-text-inverse);
}
cds-tag[type='high-contrast']:not([disabled]):hover {
  background-color: var(--cds-background-inverse-hover);
}

/* OUTLINE — transparent fill, 1px outline of background-inverse */
cds-tag[type='outline']:not([disabled]),
cds-dismissible-tag[type='outline']:not([disabled]) {
  background-color: var(--cds-background);
  color: var(--cds-text-primary);
  outline: 1px solid var(--cds-background-inverse);
  outline-offset: -1px;
}
cds-tag[type='outline']:not([disabled]):hover {
  background-color: var(--cds-layer-hover-01);
}

/* FILTER + DISMISSIBLE — hidden until [open]; close-icon sized 18×18 on sm */
cds-tag[filter],
cds-dismissible-tag {
  display: none;
  padding-block: 0;
  padding-inline-end: 0;
}
cds-tag[filter][open],
cds-dismissible-tag[open] { display: inline-flex; }

cds-tag[size='sm'] .cds--tag__close-icon,
cds-dismissible-tag[size='sm'] .cds--tag__close-icon {
  block-size: 1.125rem;           /* 18px */
  inline-size: 1.125rem;
  margin-inline-start: 0.3125rem; /* 5px */
}

/* SELECTABLE — toggleable filter chip */
.cds--tag--selectable,
cds-selectable-tag cds-tag {
  border: 1px solid var(--cds-border-inverse);
  background-color: var(--cds-layer-01);
  color: var(--cds-text-primary);
  cursor: pointer;
}
.cds--tag--selectable:hover { background-color: var(--cds-layer-hover-01); outline: none; }
.cds--tag--selectable-selected,
cds-selectable-tag[selected] cds-tag {
  background-color: var(--cds-layer-selected-inverse);
  color: var(--cds-text-inverse);
}

/* OPERATIONAL — clickable; hover follows the colour variant tokens above */
.cds--tag--operational,
cds-operational-tag cds-tag { cursor: pointer; }

/* FOCUS — interactive variants only */
.cds--tag--interactive:focus,
cds-selectable-tag:focus,
cds-operational-tag:focus,
cds-dismissible-tag:focus,
cds-tag[filter]:focus {
  outline: 2px solid var(--cds-focus);
  outline-offset: 1px;
}

/* DISABLED — overrides every type variant */
cds-tag[disabled],
cds-dismissible-tag[disabled],
cds-operational-tag[disabled] cds-tag,
cds-selectable-tag[disabled] cds-tag {
  border: 1px solid var(--cds-border-disabled);
  background-color: var(--cds-layer-01);
  color: var(--cds-text-disabled);
  cursor: not-allowed;
}
cds-tag[disabled]:hover,
cds-dismissible-tag[disabled]:hover,
cds-operational-tag[disabled] cds-tag:hover,
cds-selectable-tag[disabled] cds-tag:hover { background-color: var(--cds-layer-01); cursor: not-allowed; }
cds-tag[filter][disabled] .cds--tag__close-icon,
cds-dismissible-tag[disabled] .cds--tag__close-icon { cursor: not-allowed; background-color: transparent; }

/* SKELETON */
cds-tag-skeleton,
.cds--tag.cds--skeleton {
  background-color: var(--cds-skeleton-background);
  color: transparent;
  pointer-events: none;
  animation: skeleton 3000ms ease-in-out infinite;
}

/* LABEL ellipsis + CUSTOM ICON (16px, 4px gap to label) */
.cds--tag--operational > span,
.cds--tag--selectable > span,
.cds--tag__label { display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

.cds--tag__custom-icon,
[slot='icon'] {
  block-size: 1rem; inline-size: 1rem; /* 16px */
  margin-inline-end: 0.25rem;          /* 4px */
  fill: currentColor;
  flex-shrink: 0;
}
```

## States Reference (per variant × per state)

> Hex values are White theme unless noted. For G100, swap to the dark-theme tokens in the Design Tokens section above. Source: `tag.scss` + the resolved tokens above.

**Read-only colour tag** (e.g. `type="blue"`): **Rest** = `--cds-tag-background-{type}` / `--cds-tag-color-{type}` (e.g. `#d0e2ff` / `#0043ce`). No hover (`cursor: default`). **Disabled** = `#f4f4f4` background, `rgba(22,22,22,0.25)` text, `1px solid #c6c6c6` border, `cursor: not-allowed`.

**Filter / Dismissible tag** (`type="blue"` with X):

| State | Background | Color | Other |
|---|---|---|---|
| Rest | `#d0e2ff` | `#0043ce` | close-icon visible at right |
| Hover (chip) | `#b8d3ff` (blue-20-hover) | `#0043ce` | — |
| Hover (close-icon) | transparent → `var(--cds-layer-hover-01)` | inherit | square 18×18 hit-area on `sm` |
| Focus-visible | (rest) | (rest) | `outline: 2px solid var(--cds-focus); outline-offset: 1px` |
| Disabled | `#f4f4f4` | `rgba(22,22,22,0.25)` | `1px solid` border-disabled, no hover bg, close-icon `cursor: not-allowed` |

**Selectable tag**:

| State | Background | Color | Border |
|---|---|---|---|
| Unselected rest | `#f4f4f4` (layer-01) | `#161616` (text-primary) | `1px solid #161616` (border-inverse) |
| Unselected hover | `#e8e8e8` (layer-hover-01) | `#161616` | (rest) |
| Selected | `#161616` (layer-selected-inverse) | `#ffffff` (text-inverse) | (rest) |
| Focus | (rest) | (rest) | `outline: 2px solid #0f62fe; outline-offset: 1px` |
| Disabled | `#f4f4f4` | `rgba(22,22,22,0.25)` | `1px solid #c6c6c6`, `cursor: not-allowed` |

**Operational tag** (`type="blue"`): same colour rest/hover as read-only blue (`#d0e2ff` → `#b8d3ff`), but with `cursor: pointer`, focus ring `2px solid #0f62fe / offset 1`, and the disabled style above.

**High-contrast** rest = `#393939` bg / `#ffffff` text (White) or `#f4f4f4` / `#161616` (G100); hover (interactive variants) swaps to `#4c4c4c` (White) or `#e8e8e8` (G100).

**Outline** rest = `#ffffff` bg / `#161616` text + `1px solid #393939` outline (offset `−1px`) on White; `#161616` / `#f4f4f4` + `1px solid #f4f4f4` on G100. Hover (interactive) swaps bg to `#e8e8e8` (White) or `#333333` (G100).

## Animation & Motion

Carbon's source uses these tokens for tag transitions (extracted from the SCSS):

```css
.cds--tag,
cds-tag,
cds-dismissible-tag,
cds-operational-tag cds-tag,
cds-selectable-tag cds-tag {
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    color            var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline-color    var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Skeleton shimmer (inherited from .cds--skeleton) */
@keyframes skeleton {
  0%, 100% { opacity: 0.3; }
  50%      { opacity: 1; }
}

cds-tag-skeleton,
.cds--tag.cds--skeleton {
  animation: skeleton 3000ms ease-in-out infinite;
}

@media (prefers-reduced-motion: reduce) {
  .cds--tag,
  cds-tag,
  cds-dismissible-tag,
  cds-operational-tag cds-tag,
  cds-selectable-tag cds-tag,
  cds-tag-skeleton,
  .cds--tag.cds--skeleton {
    transition: none;
    animation: none;
  }
}
```

Token values (resolved from `overview.md`): `--cds-duration-fast-01: 70ms`, `--cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9)`.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Read-only `cds-tag` renders as a `<span>` (no role). `cds-dismissible-tag` renders the X as a `<button aria-label="{dismissTooltipLabel}">` (default `"Dismiss"`). `cds-selectable-tag` renders a `<button aria-pressed="true|false">`. `cds-operational-tag` renders a `<button>` — pair with `aria-haspopup="dialog"` + `aria-expanded` if it opens a popover.
- **ARIA:** Always provide a meaningful `dismissTooltipLabel` (WC) / `title` (React) — never ship the literal `"Dismiss"`. Wrap interactive tag groups in `<div role="group" aria-label="…">` (the Storybook source does this for Selectable and Operational). Use `tag-title` / `title` to surface the full label when text is truncated by `text-overflow: ellipsis`.
- **Keyboard:** `Tab` focuses the next interactive tag (read-only tags are not tabbable). `Enter` / `Space` activates the focused button — toggles `SelectableTag`, fires onClick on `OperationalTag`, removes the tag on the dismiss icon. `Esc` closes any popover triggered by an Operational tag.
- **Touch target:** `sm` (18px) is below the 44px touch minimum — reserve it for desktop / dense filter panels. Use `md` (24px) inside a 44-px-tall container, or `lg` (32px), for touch surfaces. The 18×18 close-icon on `sm` dismissible tags also fails touch.
- **Focus management:** Carbon emits `outline: 2px solid var(--cds-focus); outline-offset: 1px` on every interactive variant. **Do not remove it.** The 1px offset (different from Carbon's usual 0) clears the 2px corner radius. When a `DismissibleTag` is removed, move focus to the next sibling tag or the filter group's heading so keyboard users are not stranded.

## Responsive behaviour

Tags wrap naturally because they are `display: inline-flex` — no media-query work required for filter rails. Truncation is built-in via `text-overflow: ellipsis` + `max-inline-size: 208px`; the `title` attribute exposes the full text on hover/focus. Use `lg` (32px) on touch breakpoints (`sm` 320px, `md` 672px) and `md` (24px) on desktop (`lg` 1056+). `sm` (18px) is desktop-only / data-table-row context. For wrapping filter panels, set `gap: 0.25rem 0.5rem` (4px row, 8px column) on the parent — Carbon ships no default gap because tags are layout-agnostic.

## Do / Don't

| Do | Don't |
|---|---|
| **Use `border-radius: 2px` for Tag** — one of three Carbon exceptions (Tag / Tooltip / Popover) to the sharp-corner rule. | Don't change Tag to `border-radius: 0` "for consistency". The 2px is intentional — it separates the pill from sharp adjacent UI. |
| Use the verbatim `<cds-tag>` / `<Tag>` element from the Storybook source. | Don't substitute a generic `<span class="badge">` — you lose tokens, focus styles, and dismiss behaviour. |
| Set colour with `type="{colour}"` (12 values) so dark-mode tokens kick in. | Don't override `background-color` directly — that bypasses `--cds-tag-background-{colour}` and breaks theming. |
| Pick `gray` for neutral metadata; semantic colours for status; `cool-gray` / `warm-gray` for editorial categorisation. | Don't use colour for decoration — Carbon's rainbow conveys category, not flair. |
| Use `DismissibleTag` for removable filter chips, `SelectableTag` (`aria-pressed`) for toggle pickers, `OperationalTag` for chips that fire actions or open popovers. | Don't conflate them — each maps to different ARIA + UX expectations. |
| Provide a meaningful `dismissTooltipLabel` / `title` (e.g. "Remove status: active") and wrap interactive groups in `<div role="group" aria-label="…">`. | Don't ship the bare string `"Dismiss"` and don't omit the group wrapper — both leave assistive tech with no context. |
| Keep tag labels short (≤ 25 characters); Carbon truncates at `max-inline-size: 208px`. | Don't put paragraph text in a tag. If it doesn't fit, you want a different component. |
| Use `sm` (18px) only in desktop / data-dense contexts; honour `prefers-reduced-motion`. | Don't use `sm` on touch surfaces (under 44px target); don't add custom animations without a `prefers-reduced-motion: no-preference` guard. |
| Output the Storybook code **as-is** when generating Carbon UI. | Don't paraphrase or rewrite — Carbon's source is the truth. |
