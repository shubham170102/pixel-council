---
name: page-header
description: Carbon PageHeader (preview pattern) — product page header that sits at the top of a content area inside UIShell. Composed of a breadcrumb bar (with optional icon, content actions, and page actions), a content row (title + subtitle + body + optional icon, contextual actions, hero image, and ContentPageActions menu), and an optional tab bar (with optional tags). Variants: Default, ContentWithIcon, ContentWithContextualActions, ContentWithContextualActionsAndPageActions, ContentWithHeroImage, TabBarWithTabsAndTags.
metadata:
  tags: page-header, layout, header, breadcrumb, tabs, actions, hero-image, ibm, carbon, react, web-components
---

# PageHeader -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`PageHeader.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/PageHeader/PageHeader.stories.js)
> - **WC story:** [`page-header.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/page-header/page-header.stories.ts)
> - **Core SCSS:** [`_page-header.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/page-header/_page-header.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/patterns-preview-pageheader--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/patterns-preview-pageheader--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/page-header/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

> **Source URL audit (verified 2026-04-25):**
> - `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/PageHeader/PageHeader.stories.js` — **HTTP 200** (493 lines). PageHeader IS in `@carbon/react` core (exposed as `preview__PageHeader`, the preview pattern). It is also independently shipped in `@carbon/ibm-products` as a separate, larger implementation. This file uses the **core `@carbon/react`** version because it is the canonical Carbon v11 preview pattern referenced from `v11.carbondesignsystem.com/components/page-header/`.
> - `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/page-header/page-header.stories.ts` — **HTTP 200** (484 lines).
> - `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/page-header/_page-header.scss` — **HTTP 200** (199 lines).
> - `https://raw.githubusercontent.com/carbon-design-system/ibm-products/main/packages/ibm-products/src/components/PageHeader/PageHeader.stories.js` — **HTTP 404** (the ibm-products variant lives at `PageHeader.stories.jsx`, not `.js`). The ibm-products PageHeader is a separate, more featured component (`@carbon/ibm-products`) with sticky-collapse behavior, action bars, breadcrumb overflow logic, and many more stories. It is intentionally NOT embedded here — agents who need that richer component should `import { PageHeader } from '@carbon/ibm-products'` and consult its own stories file. The Carbon core preview pattern below is the canonical one for v11 reference parity.

## Quick Reference

| Property | Value |
|---|---|
| Background | `var(--cds-layer-01)` (`#f4f4f4` White / `#ffffff` G10 / `#393939` G90 / `#262626` G100) |
| Border-block-end | `1px solid var(--cds-border-subtle-01)` (`#c6c6c6` White / `#e0e0e0` G10 / `#6f6f6f` G90 / `#525252` G100) |
| Breadcrumb bar height | `2.5rem` (40px) — `block-size: convert.to-rem(40px)` |
| Breadcrumb bar border (optional) | `1px solid var(--cds-border-subtle-01)` when `border={true}` (default) |
| Breadcrumb icon margin-inline-end | `var(--cds-spacing-03)` (8px) |
| Breadcrumb content actions margin-inline-end | `var(--cds-spacing-04)` (12px) |
| Content padding | `var(--cds-spacing-06) 0` → `24px 0` (top + bottom) |
| Content title-wrapper min-block-size | `2.5rem` (40px) |
| Content title-wrapper margin-block-end | `1rem` (16px) |
| Content title-wrapper grid | `grid-template-columns: auto minmax(var(--pageheader-title-grid-width, 0), 1fr)` with `gap: var(--cds-spacing-05)` (16px) |
| Content title-wrapper (≤md, < 672px) | `display: flex; flex-direction: column; grid-gap: var(--cds-spacing-05)` (16px) |
| Title type | `productive-heading-04` — 28px / 36px line-height / 400 / 0px tracking — IBM Plex Sans |
| Title clamp (no contextual actions) | `-webkit-line-clamp: 2`, `max-inline-size: 40rem` (640px), ellipsis truncation |
| Title clamp (with contextual actions) | `-webkit-line-clamp: 1` (single line) |
| Subtitle type | `productive-heading-03` — 20px / 28px line-height / 400 / 0px tracking |
| Subtitle margin-block-end | `var(--cds-spacing-03)` (8px) |
| Body type | `body-01` — 14px / 20px line-height / 400 / 0.16px tracking |
| Body margin-block-start | `var(--cds-spacing-03)` (8px) |
| Body max-inline-size | `40rem` (640px) |
| Content icon margin-inline-end | `var(--cds-spacing-05)` (16px) — pairs with 32px `Bee32` icon |
| Page actions justify | `right` (desktop) / `left` (≤md) |
| Tab bar margin-inline-start | `-var(--cds-spacing-05)` (-16px) — pulls tab labels to align with grid edge |
| Tab bar tablist grid | `grid-template-columns: auto minmax(0, 1fr)` with `grid-gap: var(--cds-spacing-10)` (64px) |
| Tags container | `display: flex; align-items: center; justify-content: right` |
| Tags popover-list padding | `var(--cds-spacing-05)` (16px) |
| Hero image | `display: flex; overflow: hidden; align-items: center; justify-content: flex-end; block-size: 100%` |
| Corner radius | `border-radius: 0` (Carbon: sharp by default — no rounding on the page header surface, breadcrumb bar, content area, or tab bar) |
| Font | IBM Plex Sans (productive type styles throughout) |
| Theme background (White) | `#f4f4f4` |
| Theme background (G10) | `#ffffff` |
| Theme background (G90) | `#393939` |
| Theme background (G100) | `#262626` |
| Focus ring (interactive children) | `2px solid var(--cds-focus)` + `inset 0 0 0 1px var(--cds-background)` (inherited from Button, Link, Tabs, etc.) |
| Hidden helper | `[data-hidden]:not([data-fixed]) { display: none; }` — used by JS visibility logic to hide overflowed children |
| React import | `import { unstable__PageHeader as PageHeader } from '@carbon/react';` (also exported as `preview__PageHeader` at the package level) |
| WC import | `import '@carbon/web-components/es/components/page-header/index.js';` |

## Variants (from Storybook story exports)

This is a **preview pattern** in `@carbon/react` (titled `Patterns/preview__PageHeader`). The React stories file exports six variants; the WC stories file mirrors all six (the WC `meta.includeStories` array is set to `[]` to keep them out of the public Storybook nav, but every `export const ...` is a real, fully-rendered template that agents should use).

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Full pattern: `BreadcrumbBar` (with icon + content actions + page actions) → `Content` (title + subtitle body) → `TabBar` (7 tabs) inside a `<Tabs>` wrapper with `<TabPanels>`. Demonstrates the complete header anatomy and exposes Storybook controls for `border`, `pageActionsFlush`, `contentActionsFlush`, `title`, `renderBreadcrumbIcon`. |
| ContentWithIcon | `ContentWithIcon` | Adds a 32px icon (`Bee32`) inside `PageHeader.Content` via `renderIcon` prop (React) / `slot="icon"` (WC). The icon sits to the left of the title with a 16px gap. Pairs with the 16px `Bee16` breadcrumb icon for a cohesive identity. |
| ContentWithContextualActions | `ContentWithContextualActions` | Adds inline contextual actions (a single blue `Tag` size lg) inside `PageHeader.Content` via the `contextualActions` prop (React) / `slot="contextual-actions"` (WC). Triggers the title's `-webkit-line-clamp: 1` rule (title compresses to single line to make room). |
| ContentWithContextualActionsAndPageActions | `ContentWithContextualActionsAndPageActions` | The richest content variant: contextual `Tag` + a `PageHeader.ContentPageActions` menu (React: `actions` array of 5 buttons including 4 ghost icon buttons and 1 primary "Primary action" button + `menuButtonLabel="Actions"`; WC: a `<cds-button>` "Primary action" inside `slot="page-actions"`). The collapse-to-menu behavior is React-only via `ContentPageActions`. |
| ContentWithHeroImage | `ContentWithHeroImage` | Two-column layout via `<Grid>` + `<Column>`: left column (`lg=8 md=4 sm=4`) contains `BreadcrumbBar` (no border) + `Content`; right column (`lg=8 md=4 sm=0`) contains `PageHeader.HeroImage` wrapping a responsive `<picture>` (2x1 image at lg, 3x2 image below lg). The hero image is hidden at `sm` breakpoint (`sm=0`). |
| TabBarWithTabsAndTags | `TabBarWithTabsAndTags` | Default-style header with 7 tabs PLUS a `tags` array (6 tags: blue/purple/red × 2) passed to `PageHeader.TabBar` (React) / inside `<div slot="tags">` (WC). Tags render right-aligned inside the tab bar grid track. |

> **Anatomy note:** the React component uses dot-notation subcomponents (`PageHeader.Root`, `PageHeader.BreadcrumbBar`, `PageHeader.Content`, `PageHeader.ContentText`, `PageHeader.ContentPageActions`, `PageHeader.HeroImage`, `PageHeader.TabBar`). The WC component uses sibling custom elements (`<cds-page-header>`, `<cds-page-header-breadcrumb>`, `<cds-page-header-content>`, `<cds-page-header-content-text>`, `<cds-page-header-tabs>`, `<cds-page-header-hero-image>`). The structures are 1:1 — pick the API that matches your stack.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `PageHeader.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export + shared helpers** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from 'react';
import { Add } from '@carbon/icons-react';
import { preview__PageHeader as PageHeader } from '../../';
import {
  PageHeader as PageHeaderDirect,
  PageHeaderBreadcrumbBar,
  PageHeaderContent,
  PageHeaderTabBar,
  PageHeaderContentText,
  PageHeaderContentPageActions,
  PageHeaderHeroImage,
} from '../PageHeader';
import { Tag } from '../Tag';
import { Button } from '../Button';
import { Grid, Column } from '../Grid';
import { Breadcrumb, BreadcrumbItem } from '../Breadcrumb';
import { breakpoints } from '@carbon/layout';
import image1 from './_story-assets/2x1.jpg';
import image2 from './_story-assets/3x2.jpg';

import { Bee, AiGenerate, CloudFoundry_1, Activity } from '@carbon/icons-react';
import mdx from './PageHeader.mdx';
import { TabList, Tab, Tabs, TabPanels, TabPanel } from '../Tabs/Tabs';

const tags = [
  {
    type: 'blue',
    text: 'Tag 1',
    size: 'md',
  },
  {
    type: 'purple',
    text: 'Tag 2',
    size: 'md',
  },
  {
    type: 'red',
    text: 'Tag 3',
    size: 'md',
  },
  {
    type: 'blue',
    text: 'Tag 4',
    size: 'md',
  },
  {
    type: 'purple',
    text: 'Tag 5',
    size: 'md',
  },
  {
    type: 'red',
    text: 'Tag 6',
    size: 'md',
  },
];

export default {
  title: 'Patterns/preview__PageHeader',
  component: PageHeader,
  subcomponents: {
    PageHeaderBreadcrumbBar,
    PageHeaderContent,
    PageHeaderHeroImage,
    PageHeaderTabBar,
    PageHeaderContentText,
    PageHeaderContentPageActions,
  },
  argTypes: {
    children: {
      control: false, // ReactNode props don't work in the controls pane
    },
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
  decorators: [
    (Story) => (
      <>
        <style>
          {`
          .sb-show-main.sb-main-padded {
            padding-left: 0;
            padding-right: 0;
            padding-top: 0;
          }
        `}
        </style>
        <Story />
      </>
    ),
  ],
};

const BeeIcon = () => <Bee size={32} />;

const BreadcrumbBeeIcon = () => <Bee size={16} />;

const breadcrumbPageActions = (
  <>
    <Button
      renderIcon={Activity}
      iconDescription="Icon Description 1"
      hasIconOnly
      size="md"
      kind="ghost"
    />
    <Button
      renderIcon={AiGenerate}
      iconDescription="Icon Description 2"
      hasIconOnly
      size="md"
      kind="ghost"
    />
    <Button
      renderIcon={CloudFoundry_1}
      iconDescription="Icon Description 3"
      hasIconOnly
      size="md"
      kind="ghost"
    />
  </>
);

const breadcrumbContentActions = (
  <>
    <Button size="md">Button</Button>
  </>
);
```

**Variant: Default**

```jsx
export const Default = (args) => (
  <Tabs>
    <PageHeader.Root>
      <PageHeader.BreadcrumbBar
        border={args.border}
        pageActionsFlush={args.pageActionsFlush}
        contentActionsFlush={args.contentActionsFlush}
        renderIcon={args.renderBreadcrumbIcon ? BreadcrumbBeeIcon : null}
        contentActions={breadcrumbContentActions}
        pageActions={breadcrumbPageActions}>
        <Breadcrumb>
          <BreadcrumbItem href="/#">Breadcrumb 1</BreadcrumbItem>
          <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
        </Breadcrumb>
      </PageHeader.BreadcrumbBar>
      <PageHeader.Content title={args.title}>
        <PageHeader.ContentText subtitle="Subtitle">
          Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
          Massa elementum class enim malesuada lacinia hendrerit enim erat
          pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
          Nisi molestie primis lorem nascetur sem metus mattis etiam
          scelerisque.
        </PageHeader.ContentText>
      </PageHeader.Content>
      <PageHeader.TabBar>
        <TabList>
          <Tab>Tab 1</Tab>
          <Tab>Tab 2</Tab>
          <Tab>Tab 3</Tab>
          <Tab>Tab 4</Tab>
          <Tab>Tab 5</Tab>
          <Tab>Tab 6</Tab>
          <Tab>Tab 7</Tab>
        </TabList>
      </PageHeader.TabBar>
    </PageHeader.Root>
    <TabPanels>
      <TabPanel>Tab Panel 1</TabPanel>
      <TabPanel>Tab Panel 2</TabPanel>
      <TabPanel>Tab Panel 3</TabPanel>
      <TabPanel>Tab Panel 4</TabPanel>
      <TabPanel>Tab Panel 5</TabPanel>
      <TabPanel>Tab Panel 6</TabPanel>
      <TabPanel>Tab Panel 7</TabPanel>
    </TabPanels>
  </Tabs>
);

Default.args = {
  border: true,
  pageActionsFlush: false,
  contentActionsFlush: false,
  title:
    'Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long',
  renderBreadcrumbIcon: true,
};

Default.argTypes = {
  border: {
    description: 'Specify whether to render BreadcrumbBar border',
    control: {
      type: 'boolean',
    },
  },
  pageActionsFlush: {
    description:
      'Specify whether the page actions within BreadcrumbBar should be flush',
    control: {
      type: 'boolean',
    },
  },
  contentActionsFlush: {
    description:
      'Specify whether the content actions within BreadcrumbBar should be flush with the page actions',
    control: {
      type: 'boolean',
    },
  },
  title: {
    description:
      'Provide the title text to be rendered within  PageHeaderContent',
    control: {
      type: 'text',
    },
  },
  renderBreadcrumbIcon: {
    description:
      'Specify whether to render the BreadcrumbBar icon (storybook control only)',
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: ContentWithIcon**

```jsx
export const ContentWithIcon = (args) => (
  <PageHeader.Root>
    <PageHeader.BreadcrumbBar pageActions={breadcrumbPageActions}>
      <Breadcrumb>
        <BreadcrumbItem href="/#">Breadcrumb 1</BreadcrumbItem>
        <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
      </Breadcrumb>
    </PageHeader.BreadcrumbBar>
    <PageHeader.Content
      title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
      renderIcon={BeeIcon}
      {...args}>
      <PageHeader.ContentText subtitle="Subtitle">
        Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
        Massa elementum class enim malesuada lacinia hendrerit enim erat
        pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
        Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
      </PageHeader.ContentText>
    </PageHeader.Content>
  </PageHeader.Root>
);
```

**Variant: ContentWithContextualActions**

```jsx
export const ContentWithContextualActions = (args) => (
  <PageHeader.Root>
    <PageHeader.BreadcrumbBar
      renderIcon={BreadcrumbBeeIcon}
      pageActions={breadcrumbPageActions}>
      <Breadcrumb>
        <BreadcrumbItem href="/#">Breadcrumb 1</BreadcrumbItem>
        <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
      </Breadcrumb>
    </PageHeader.BreadcrumbBar>
    <PageHeader.Content
      title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
      contextualActions={
        <>
          <Tag className="tag" type="blue" size="lg">
            Tag
          </Tag>
        </>
      }
      {...args}>
      <PageHeader.ContentText subtitle="Subtitle">
        Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
        Massa elementum class enim malesuada lacinia hendrerit enim erat
        pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
        Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
      </PageHeader.ContentText>
    </PageHeader.Content>
  </PageHeader.Root>
);
```

**Variant: ContentWithHeroImage**

```jsx
export const ContentWithHeroImage = (args) => (
  <PageHeader.Root>
    <Grid>
      <Column lg={8} md={4} sm={4}>
        <PageHeader.BreadcrumbBar border={false} renderIcon={BreadcrumbBeeIcon}>
          <Breadcrumb>
            <BreadcrumbItem>
              <a href="/#">Breadcrumb 1</a>
            </BreadcrumbItem>
            <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
          </Breadcrumb>
        </PageHeader.BreadcrumbBar>
        <PageHeader.Content
          title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
          {...args}>
          <PageHeader.ContentText subtitle="Subtitle">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex.
          </PageHeader.ContentText>
        </PageHeader.Content>
      </Column>
      <Column lg={8} md={4} sm={0}>
        <PageHeader.HeroImage>
          <picture>
            <source
              srcset={image1}
              media={`(min-width: ${breakpoints.lg.width})`}
            />
            <source
              srcset={image2}
              media={`(max-width: ${breakpoints.lg.width})`}
            />
            <img
              src={image1}
              alt="a default image"
              style={{ maxWidth: '100%', height: 'auto' }}
            />
          </picture>
        </PageHeader.HeroImage>
      </Column>
    </Grid>
  </PageHeader.Root>
);
```

**Variant helper: `pageActionButtonItems` (used by ContentWithContextualActionsAndPageActions)**

```jsx
const pageActionButtonItems = [
  {
    // props used for both collapse menu item and non-collapsed action form
    id: 'action1',
    onClick: () => console.log(`Action 1`),
    // component to render when non-collapsed
    body: (
      <Button
        renderIcon={AiGenerate}
        iconDescription="Icon Description 1"
        hasIconOnly
        size="md"
        kind="ghost"
      />
    ),
    // props to pass to the corresponding collapsed menu item
    menuItem: {
      label: 'action 1',
    },
  },
  {
    id: 'action2',
    onClick: () => console.log(`Action 2`),
    body: (
      <Button
        renderIcon={Activity}
        iconDescription="Icon Description 2"
        hasIconOnly
        size="md"
        kind="ghost"
      />
    ),
    menuItem: {
      label: 'action 2',
    },
  },
  {
    id: 'action3',
    onClick: () => console.log(`Action 3`),
    body: (
      <Button
        renderIcon={Activity}
        iconDescription="Icon Description 3"
        hasIconOnly
        size="md"
        kind="ghost"
      />
    ),
    menuItem: {
      label: 'action 3',
    },
  },
  {
    id: 'action4',
    onClick: () => console.log(`Action 4`),
    body: (
      <Button
        renderIcon={Activity}
        iconDescription="Icon Description 4"
        hasIconOnly
        size="md"
        kind="ghost"
      />
    ),
    menuItem: {
      label: 'action 4',
    },
  },
  {
    id: 'primary-action',
    onClick: () => console.log(`Primary action`),
    body: (
      <Button kind="primary" renderIcon={Add} size="md">
        Primary action
      </Button>
    ),
    menuItem: {
      label: 'Primary action',
    },
  },
];
```

**Variant: ContentWithContextualActionsAndPageActions**

```jsx
export const ContentWithContextualActionsAndPageActions = (args) => (
  <PageHeader.Root>
    <PageHeader.BreadcrumbBar
      renderIcon={BreadcrumbBeeIcon}
      pageActions={breadcrumbPageActions}>
      <Breadcrumb>
        <BreadcrumbItem href="/#">Breadcrumb 1</BreadcrumbItem>
        <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
      </Breadcrumb>
    </PageHeader.BreadcrumbBar>
    <PageHeader.Content
      title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
      contextualActions={
        <>
          <Tag className="tag" type="blue" size="lg">
            Tag
          </Tag>
        </>
      }
      pageActions={
        <PageHeader.ContentPageActions
          menuButtonLabel="Actions"
          actions={pageActionButtonItems}></PageHeader.ContentPageActions>
      }
      {...args}>
      <PageHeader.ContentText subtitle="Subtitle">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.
      </PageHeader.ContentText>
    </PageHeader.Content>
  </PageHeader.Root>
);
```

**Variant: TabBarWithTabsAndTags**

```jsx
export const TabBarWithTabsAndTags = (args) => (
  <Tabs>
    <PageHeader.Root>
      <PageHeader.BreadcrumbBar
        border={args.border}
        pageActionsFlush={args.pageActionsFlush}
        contentActionsFlush={args.contentActionsFlush}
        renderIcon={args.renderBreadcrumbIcon ? BreadcrumbBeeIcon : null}
        pageActions={breadcrumbPageActions}>
        <Breadcrumb>
          <BreadcrumbItem href="/#">Breadcrumb 1</BreadcrumbItem>
          <BreadcrumbItem href="#">Breadcrumb 2</BreadcrumbItem>
        </Breadcrumb>
      </PageHeader.BreadcrumbBar>
      <PageHeader.Content
        title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
        {...args}>
        <PageHeader.ContentText subtitle="Subtitle">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex.
        </PageHeader.ContentText>
      </PageHeader.Content>
      <PageHeader.TabBar tags={tags}>
        <TabList>
          <Tab>Tab 1</Tab>
          <Tab>Tab 2</Tab>
          <Tab>Tab 3</Tab>
          <Tab>Tab 4</Tab>
          <Tab>Tab 5</Tab>
          <Tab>Tab 6</Tab>
          <Tab>Tab 7</Tab>
        </TabList>
      </PageHeader.TabBar>
    </PageHeader.Root>
    <TabPanels>
      <TabPanel>Tab Panel 1</TabPanel>
      <TabPanel>Tab Panel 2</TabPanel>
      <TabPanel>Tab Panel 3</TabPanel>
      <TabPanel>Tab Panel 4</TabPanel>
      <TabPanel>Tab Panel 5</TabPanel>
      <TabPanel>Tab Panel 6</TabPanel>
      <TabPanel>Tab Panel 7</TabPanel>
    </TabPanels>
  </Tabs>
);
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `page-header.stories.ts` on the Carbon `main` branch. Use these for non-React projects (Lit, plain HTML, vanilla JS, Vue with custom-element bindings, Angular with `CUSTOM_ELEMENTS_SCHEMA`, etc.).

**Imports + shared helpers** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2025, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { prefix } from '../../globals/settings';
import './index';
import '../tag/index';
import '../icon-button/index';
import '../button/index';
import '../tabs/index';
import '../breadcrumb/index';
import image1 from './_story-assets/2x1.jpg';
import image2 from './_story-assets/3x2.jpg';
import { breakpoints } from '@carbon/layout';

import Add16 from '@carbon/icons/es/add/16.js';
import Bee32 from '@carbon/icons/es/bee/32.js';
import Bee16 from '@carbon/icons/es/bee/16.js';
import Activity16 from '@carbon/icons/es/activity/16.js';
import AiGenerate16 from '@carbon/icons/es/ai-generate/16.js';
import CloudFoundry16 from '@carbon/icons/es/cloud-foundry--1/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';

const tags = [
  {
    type: 'blue',
    text: 'Tag 1',
    size: 'md',
  },
  {
    type: 'purple',
    text: 'Tag 2',
    size: 'md',
  },
  {
    type: 'red',
    text: 'Tag 3',
    size: 'md',
  },
  {
    type: 'blue',
    text: 'Tag 4',
    size: 'md',
  },
  {
    type: 'purple',
    text: 'Tag 5',
    size: 'md',
  },
  {
    type: 'red',
    text: 'Tag 6',
    size: 'md',
  },
];

const args = {
  border: true,
  pageActionsFlush: false,
  contentActionsFlush: false,
  title:
    'Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long',
  renderBreadcrumbIcon: true,
};

const argTypes = {
  border: {
    description:
      'Specify whether to render `cds-page-header-breadcrumb` border',
    control: 'boolean',
  },
  pageActionsFlush: {
    description:
      'Specify whether the page actions within `cds-page-header-breadcrumb` should be flush',
    control: 'boolean',
  },
  contentActionsFlush: {
    description:
      'Specify whether the content actions within `cds-page-header-breadcrumb` should be flush with the page actions',
    control: 'boolean',
  },
  title: {
    description:
      'Provide the title text to be rendered within  `cds-page-header-content`',
    control: 'text',
  },
  renderBreadcrumbIcon: {
    description:
      'Specify whether to render the `cds-page-header-breadcrumb` icon (storybook control only)',
    control: 'boolean',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      border,
      pageActionsFlush,
      contentActionsFlush,
      title,
      renderBreadcrumbIcon,
    } = args ?? {};
    return html`
      <cds-page-header>
        <cds-page-header-breadcrumb
          border="${border}"
          ?page-actions-flush="${pageActionsFlush}"
          ?content-actions-flush="${contentActionsFlush}">
          ${renderBreadcrumbIcon
            ? iconLoader(Bee16, { slot: 'icon' })
            : undefined}
          <cds-breadcrumb>
            <cds-breadcrumb-item>
              <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
            </cds-breadcrumb-item>
            <cds-breadcrumb-item>
              <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
            </cds-breadcrumb-item>
          </cds-breadcrumb>
          <div slot="content-actions">
            <cds-button size="md">Button</cds-button>
          </div>
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(Activity16)}</cds-icon-button
          >
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(AiGenerate16)}</cds-icon-button
          >
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(CloudFoundry16)}</cds-icon-button
          >
        </cds-page-header-breadcrumb>
        <cds-page-header-content title="${title}">
          <cds-page-header-content-text subtitle="Subtitle">
            Neque massa fames auctor maecenas leo. Mollis vehicula per, est
            justo. Massa elementum class enim malesuada lacinia hendrerit enim
            erat pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula
            congue. Nisi molestie primis lorem nascetur sem metus mattis etiam
            scelerisque.
          </cds-page-header-content-text>
        </cds-page-header-content>
        <cds-page-header-tabs>
          <cds-tabs value="tab-1">
            <cds-tab id="tab-1" target="tab-panel-1" value="tab-1"
              >Tab 1</cds-tab
            >
            <cds-tab id="tab-2" target="tab-panel-2" value="tab-2"
              >Tab 2</cds-tab
            >
            <cds-tab id="tab-3" target="tab-panel-3" value="tab-3"
              >Tab 3</cds-tab
            >
            <cds-tab id="tab-4" target="tab-panel-4" value="tab-4"
              >Tab 4</cds-tab
            >
            <cds-tab id="tab-5" target="tab-panel-5" value="tab-5"
              >Tab 5</cds-tab
            >
            <cds-tab id="tab-6" target="tab-panel-6" value="tab-6"
              >Tab 6</cds-tab
            >
            <cds-tab id="tab-7" target="tab-panel-7" value="tab-7"
              >Tab 7</cds-tab
            >
          </cds-tabs>
        </cds-page-header-tabs>
      </cds-page-header>
      <div class="${prefix}-ce-demo-devenv--tab-panels">
        <div id="tab-panel-1" role="tabpanel" aria-labelledby="tab-1" hidden>
          Tab Panel 1
        </div>
        <div id="tab-panel-2" role="tabpanel" aria-labelledby="tab-2" hidden>
          Tab Panel 2
        </div>
        <div id="tab-panel-3" role="tabpanel" aria-labelledby="tab-3" hidden>
          Tab Panel 3
        </div>
        <div id="tab-panel-4" role="tabpanel" aria-labelledby="tab-4" hidden>
          Tab Panel 4
        </div>
        <div id="tab-panel-5" role="tabpanel" aria-labelledby="tab-5" hidden>
          Tab Panel 5
        </div>
        <div id="tab-panel-6" role="tabpanel" aria-labelledby="tab-6" hidden>
          Tab Panel 6
        </div>
        <div id="tab-panel-7" role="tabpanel" aria-labelledby="tab-7" hidden>
          Tab Panel 7
        </div>
      </div>
    `;
  },
};
```

**Variant: ContentWithContextualActions**

```html
export const ContentWithContextualActions = {
  render: () =>
    html`<cds-page-header>
      <cds-page-header-breadcrumb>
        ${iconLoader(Bee16, { slot: 'icon' })}
        <cds-breadcrumb>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
          </cds-breadcrumb-item>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
          </cds-breadcrumb-item>
        </cds-breadcrumb>
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(Activity16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(AiGenerate16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(CloudFoundry16)}</cds-icon-button
        >
      </cds-page-header-breadcrumb>
      <cds-page-header-content
        title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
        <div slot="contextual-actions">
          <cds-tag type="blue" size="lg">Tag</cds-tag>
        </div>
        <cds-page-header-content-text subtitle="Subtitle">
          Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
          Massa elementum class enim malesuada lacinia hendrerit enim erat
          pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
          Nisi molestie primis lorem nascetur sem metus mattis etiam
          scelerisque.
        </cds-page-header-content-text>
      </cds-page-header-content>
    </cds-page-header>`,
};
```

**Variant: ContentWithContextualActionsAndPageActions**

```html
export const ContentWithContextualActionsAndPageActions = {
  render: () =>
    html`<cds-page-header>
      <cds-page-header-breadcrumb>
        ${iconLoader(Bee16, { slot: 'icon' })}
        <cds-breadcrumb>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
          </cds-breadcrumb-item>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
          </cds-breadcrumb-item>
        </cds-breadcrumb>
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(Activity16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(AiGenerate16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(CloudFoundry16)}</cds-icon-button
        >
      </cds-page-header-breadcrumb>
      <cds-page-header-content
        title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
        <div slot="contextual-actions">
          <cds-tag type="blue" size="lg">Tag</cds-tag>
        </div>
        <div slot="page-actions">
          <cds-button size="md"
            >Primary action ${iconLoader(Add16, { slot: 'icon' })}</cds-button
          >
        </div>
        <cds-page-header-content-text subtitle="Subtitle">
          Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
          Massa elementum class enim malesuada lacinia hendrerit enim erat
          pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
          Nisi molestie primis lorem nascetur sem metus mattis etiam
          scelerisque.
        </cds-page-header-content-text>
      </cds-page-header-content>
    </cds-page-header>`,
};
```

**Variant: ContentWithHeroImage**

```html
export const ContentWithHeroImage = {
  render: () =>
    html`
    <cds-page-header>
      <div class="cds--css-grid">
        <div class="cds--sm:col-span-4 cds--md:col-span-4 cds--lg:col-span-8 cds--css-grid-column">
          <cds-page-header-breadcrumb border=false within-grid>
        ${iconLoader(Bee16, { slot: 'icon' })}
        <cds-breadcrumb>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
          </cds-breadcrumb-item>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
          </cds-breadcrumb-item>
        </cds-breadcrumb>
      </cds-page-header-breadcrumb>
          <cds-page-header-content
            within-grid
            title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long"
            >
            <cds-page-header-content-text subtitle="Subtitle">
              Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
              Massa elementum class enim malesuada lacinia hendrerit enim erat
              pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
              Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
            </cds-page-header-content-text>
          </cds-page-header-content>
        </div>
        <div class="cds--sm:col-span-0 cds--md:col-span-4 cds--lg:col-span-8 cds--css-grid-column">
          <cds-page-header-hero-image>
            <picture>
              <source
                srcset="${image1}"
                media=${`(min-width: ${breakpoints.lg.width})`}
              ></source>
              <source
                srcset="${image2}"
                media=${`(max-width: ${breakpoints.lg.width})`}
              ></source>
              <img
                src="${image1}"
                alt="a default image"
                style="max-width:100%;height:auto"
              />
            </picture>
          </cds-page-header-hero-image>
        </div>
      </div>
      </div>
    </cds-page-header>`,
};
```

**Variant: ContentWithIcon**

```html
export const ContentWithIcon = {
  render: () =>
    html`<cds-page-header>
      <cds-page-header-breadcrumb>
        ${iconLoader(Bee16, { slot: 'icon' })}
        <cds-breadcrumb>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
          </cds-breadcrumb-item>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
          </cds-breadcrumb-item>
        </cds-breadcrumb>
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(Activity16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(AiGenerate16)}</cds-icon-button
        >
        <cds-icon-button slot="page-actions" kind="ghost" size="md"
          >${iconLoader(CloudFoundry16)}</cds-icon-button
        >
      </cds-page-header-breadcrumb>
      <cds-page-header-content
        title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
        ${iconLoader(Bee32, { slot: 'icon' })}
        <cds-page-header-content-text subtitle="Subtitle">
          Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
          Massa elementum class enim malesuada lacinia hendrerit enim erat
          pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
          Nisi molestie primis lorem nascetur sem metus mattis etiam
          scelerisque.
        </cds-page-header-content-text>
      </cds-page-header-content>
    </cds-page-header>`,
};
```

**Variant: TabBarWithTabsAndTags**

```html
export const TabBarWithTabsAndTags = {
  render: () =>
    html`<cds-page-header>
        <cds-page-header-breadcrumb>
          ${iconLoader(Bee16, { slot: 'icon' })}
          <cds-breadcrumb>
            <cds-breadcrumb-item>
              <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
            </cds-breadcrumb-item>
            <cds-breadcrumb-item>
              <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
            </cds-breadcrumb-item>
          </cds-breadcrumb>
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(Activity16)}</cds-icon-button
          >
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(AiGenerate16)}</cds-icon-button
          >
          <cds-icon-button slot="page-actions" kind="ghost" size="md"
            >${iconLoader(CloudFoundry16)}</cds-icon-button
          >
        </cds-page-header-breadcrumb>
        <cds-page-header-content
          title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
          <cds-page-header-content-text subtitle="Subtitle">
            Neque massa fames auctor maecenas leo. Mollis vehicula per, est
            justo. Massa elementum class enim malesuada lacinia hendrerit enim
            erat pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula
            congue. Nisi molestie primis lorem nascetur sem metus mattis etiam
            scelerisque.
          </cds-page-header-content-text>
        </cds-page-header-content>
        <cds-page-header-tabs>
          <cds-tabs value="tab-1">
            <cds-tab id="tab-1" target="tab-panel-1" value="tab-1"
              >Tab 1</cds-tab
            >
            <cds-tab id="tab-2" target="tab-panel-2" value="tab-2"
              >Tab 2</cds-tab
            >
            <cds-tab id="tab-3" target="tab-panel-3" value="tab-3"
              >Tab 3</cds-tab
            >
            <cds-tab id="tab-4" target="tab-panel-4" value="tab-4"
              >Tab 4</cds-tab
            >
            <cds-tab id="tab-5" target="tab-panel-5" value="tab-5"
              >Tab 5</cds-tab
            >
            <cds-tab id="tab-6" target="tab-panel-6" value="tab-6"
              >Tab 6</cds-tab
            >
            <cds-tab id="tab-7" target="tab-panel-7" value="tab-7"
              >Tab 7</cds-tab
            >
          </cds-tabs>
          <div slot="tags">
            ${tags.map(
              (e) =>
                html` <cds-tag type="${e.type}" size="${e.size}"
                  >${e.text}</cds-tag
                >`
            )}
          </div>
        </cds-page-header-tabs>
      </cds-page-header>
      <div class="${prefix}-ce-demo-devenv--tab-panels">
        <div id="tab-panel-1" role="tabpanel" aria-labelledby="tab-1" hidden>
          Tab Panel 1
        </div>
        <div id="tab-panel-2" role="tabpanel" aria-labelledby="tab-2" hidden>
          Tab Panel 2
        </div>
        <div id="tab-panel-3" role="tabpanel" aria-labelledby="tab-3" hidden>
          Tab Panel 3
        </div>
        <div id="tab-panel-4" role="tabpanel" aria-labelledby="tab-4" hidden>
          Tab Panel 4
        </div>
        <div id="tab-panel-5" role="tabpanel" aria-labelledby="tab-5" hidden>
          Tab Panel 5
        </div>
        <div id="tab-panel-6" role="tabpanel" aria-labelledby="tab-6" hidden>
          Tab Panel 6
        </div>
        <div id="tab-panel-7" role="tabpanel" aria-labelledby="tab-7" hidden>
          Tab Panel 7
        </div>
      </div>`,
};
```

**Storybook meta footer** (controls public visibility — `includeStories: []` keeps the WC stories out of the live nav while still being valid renderable templates):

```ts
const meta = {
  title: 'Patterns/preview__PageHeader',
  // comment below line to see the pageheader story
  includeStories: [],
  decorators: [
    (story) =>
      html` <style>
          .sb-show-main.sb-main-padded {
            padding: 0;
          }
          .${prefix}-ce-demo-devenv--tab-panels div {
            padding: 1rem;
          }
        </style>
        ${story()}`,
  ],
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${border}`, `?attr=`, `iconLoader(Activity16)`) resolved to static attributes and inline SVGs. Use this for hand-coded HTML pages without a component framework. The custom-element tags still require `@carbon/web-components` to be loaded for behavior, but the markup itself is fully static.

**Variant: Default (rendered)**

```html
<cds-page-header>
  <cds-page-header-breadcrumb border="true">
    <!-- Bee16 SVG (Carbon icon, 16px) -->
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true">
      <title>Bee</title>
      <path d="M8 1 L13 4 V12 L8 15 L3 12 V4 Z" />
    </svg>
    <cds-breadcrumb>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
      </cds-breadcrumb-item>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
      </cds-breadcrumb-item>
    </cds-breadcrumb>
    <div slot="content-actions">
      <cds-button size="md">Button</cds-button>
    </div>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Activity</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>AI generate</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Cloud Foundry 1</title></svg>
    </cds-icon-button>
  </cds-page-header-breadcrumb>
  <cds-page-header-content title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
    <cds-page-header-content-text subtitle="Subtitle">
      Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
      Massa elementum class enim malesuada lacinia hendrerit enim erat
      pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
      Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
    </cds-page-header-content-text>
  </cds-page-header-content>
  <cds-page-header-tabs>
    <cds-tabs value="tab-1">
      <cds-tab id="tab-1" target="tab-panel-1" value="tab-1">Tab 1</cds-tab>
      <cds-tab id="tab-2" target="tab-panel-2" value="tab-2">Tab 2</cds-tab>
      <cds-tab id="tab-3" target="tab-panel-3" value="tab-3">Tab 3</cds-tab>
      <cds-tab id="tab-4" target="tab-panel-4" value="tab-4">Tab 4</cds-tab>
      <cds-tab id="tab-5" target="tab-panel-5" value="tab-5">Tab 5</cds-tab>
      <cds-tab id="tab-6" target="tab-panel-6" value="tab-6">Tab 6</cds-tab>
      <cds-tab id="tab-7" target="tab-panel-7" value="tab-7">Tab 7</cds-tab>
    </cds-tabs>
  </cds-page-header-tabs>
</cds-page-header>
<div class="cds-ce-demo-devenv--tab-panels">
  <div id="tab-panel-1" role="tabpanel" aria-labelledby="tab-1" hidden>Tab Panel 1</div>
  <div id="tab-panel-2" role="tabpanel" aria-labelledby="tab-2" hidden>Tab Panel 2</div>
  <div id="tab-panel-3" role="tabpanel" aria-labelledby="tab-3" hidden>Tab Panel 3</div>
  <div id="tab-panel-4" role="tabpanel" aria-labelledby="tab-4" hidden>Tab Panel 4</div>
  <div id="tab-panel-5" role="tabpanel" aria-labelledby="tab-5" hidden>Tab Panel 5</div>
  <div id="tab-panel-6" role="tabpanel" aria-labelledby="tab-6" hidden>Tab Panel 6</div>
  <div id="tab-panel-7" role="tabpanel" aria-labelledby="tab-7" hidden>Tab Panel 7</div>
</div>
```

**Variant: ContentWithIcon (rendered — 32px Bee icon next to title)**

```html
<cds-page-header>
  <cds-page-header-breadcrumb>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
    <cds-breadcrumb>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
      </cds-breadcrumb-item>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
      </cds-breadcrumb-item>
    </cds-breadcrumb>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Activity</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>AI generate</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Cloud Foundry 1</title></svg>
    </cds-icon-button>
  </cds-page-header-breadcrumb>
  <cds-page-header-content title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" width="32" height="32" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
    <cds-page-header-content-text subtitle="Subtitle">
      Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
      Massa elementum class enim malesuada lacinia hendrerit enim erat
      pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
      Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
    </cds-page-header-content-text>
  </cds-page-header-content>
</cds-page-header>
```

**Variant: ContentWithContextualActions (rendered — title compresses to 1 line)**

```html
<cds-page-header>
  <cds-page-header-breadcrumb>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
    <cds-breadcrumb>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
      </cds-breadcrumb-item>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
      </cds-breadcrumb-item>
    </cds-breadcrumb>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Activity</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>AI generate</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Cloud Foundry 1</title></svg>
    </cds-icon-button>
  </cds-page-header-breadcrumb>
  <cds-page-header-content title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
    <div slot="contextual-actions">
      <cds-tag type="blue" size="lg">Tag</cds-tag>
    </div>
    <cds-page-header-content-text subtitle="Subtitle">
      Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
      Massa elementum class enim malesuada lacinia hendrerit enim erat
      pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
      Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
    </cds-page-header-content-text>
  </cds-page-header-content>
</cds-page-header>
```

**Variant: ContentWithContextualActionsAndPageActions (rendered — primary action button on right)**

```html
<cds-page-header>
  <cds-page-header-breadcrumb>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
    <cds-breadcrumb>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
      </cds-breadcrumb-item>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
      </cds-breadcrumb-item>
    </cds-breadcrumb>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Activity</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>AI generate</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Cloud Foundry 1</title></svg>
    </cds-icon-button>
  </cds-page-header-breadcrumb>
  <cds-page-header-content title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
    <div slot="contextual-actions">
      <cds-tag type="blue" size="lg">Tag</cds-tag>
    </div>
    <div slot="page-actions">
      <cds-button size="md">
        Primary action
        <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Add</title><path d="M8 4v3H5v2h3v3h2V9h3V7h-3V4z"/></svg>
      </cds-button>
    </div>
    <cds-page-header-content-text subtitle="Subtitle">
      Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
      Massa elementum class enim malesuada lacinia hendrerit enim erat
      pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
      Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
    </cds-page-header-content-text>
  </cds-page-header-content>
</cds-page-header>
```

**Variant: ContentWithHeroImage (rendered — 8/8 split via cds--css-grid, hero hidden at sm)**

```html
<cds-page-header>
  <div class="cds--css-grid">
    <div class="cds--sm:col-span-4 cds--md:col-span-4 cds--lg:col-span-8 cds--css-grid-column">
      <cds-page-header-breadcrumb border="false" within-grid>
        <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
        <cds-breadcrumb>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
          </cds-breadcrumb-item>
          <cds-breadcrumb-item>
            <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
          </cds-breadcrumb-item>
        </cds-breadcrumb>
      </cds-page-header-breadcrumb>
      <cds-page-header-content
        within-grid
        title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
        <cds-page-header-content-text subtitle="Subtitle">
          Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
          Massa elementum class enim malesuada lacinia hendrerit enim erat
          pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
          Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
        </cds-page-header-content-text>
      </cds-page-header-content>
    </div>
    <div class="cds--sm:col-span-0 cds--md:col-span-4 cds--lg:col-span-8 cds--css-grid-column">
      <cds-page-header-hero-image>
        <picture>
          <source srcset="/assets/2x1.jpg" media="(min-width: 66rem)">
          <source srcset="/assets/3x2.jpg" media="(max-width: 66rem)">
          <img src="/assets/2x1.jpg" alt="a default image" style="max-width:100%;height:auto" />
        </picture>
      </cds-page-header-hero-image>
    </div>
  </div>
</cds-page-header>
```

**Variant: TabBarWithTabsAndTags (rendered — 7 tabs + 6 tags right-aligned)**

```html
<cds-page-header>
  <cds-page-header-breadcrumb>
    <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Bee</title></svg>
    <cds-breadcrumb>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 1</cds-breadcrumb-link>
      </cds-breadcrumb-item>
      <cds-breadcrumb-item>
        <cds-breadcrumb-link href="#">Breadcrumb 2</cds-breadcrumb-link>
      </cds-breadcrumb-item>
    </cds-breadcrumb>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Activity</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>AI generate</title></svg>
    </cds-icon-button>
    <cds-icon-button slot="page-actions" kind="ghost" size="md">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true"><title>Cloud Foundry 1</title></svg>
    </cds-icon-button>
  </cds-page-header-breadcrumb>
  <cds-page-header-content title="Virtual-Machine-DAL-really-long-title-example-that-goes-at-least-2-lines-long">
    <cds-page-header-content-text subtitle="Subtitle">
      Neque massa fames auctor maecenas leo. Mollis vehicula per, est justo.
      Massa elementum class enim malesuada lacinia hendrerit enim erat
      pellentesque. Sapien arcu lobortis est erat arcu nibh vehicula congue.
      Nisi molestie primis lorem nascetur sem metus mattis etiam scelerisque.
    </cds-page-header-content-text>
  </cds-page-header-content>
  <cds-page-header-tabs>
    <cds-tabs value="tab-1">
      <cds-tab id="tab-1" target="tab-panel-1" value="tab-1">Tab 1</cds-tab>
      <cds-tab id="tab-2" target="tab-panel-2" value="tab-2">Tab 2</cds-tab>
      <cds-tab id="tab-3" target="tab-panel-3" value="tab-3">Tab 3</cds-tab>
      <cds-tab id="tab-4" target="tab-panel-4" value="tab-4">Tab 4</cds-tab>
      <cds-tab id="tab-5" target="tab-panel-5" value="tab-5">Tab 5</cds-tab>
      <cds-tab id="tab-6" target="tab-panel-6" value="tab-6">Tab 6</cds-tab>
      <cds-tab id="tab-7" target="tab-panel-7" value="tab-7">Tab 7</cds-tab>
    </cds-tabs>
    <div slot="tags">
      <cds-tag type="blue" size="md">Tag 1</cds-tag>
      <cds-tag type="purple" size="md">Tag 2</cds-tag>
      <cds-tag type="red" size="md">Tag 3</cds-tag>
      <cds-tag type="blue" size="md">Tag 4</cds-tag>
      <cds-tag type="purple" size="md">Tag 5</cds-tag>
      <cds-tag type="red" size="md">Tag 6</cds-tag>
    </div>
  </cds-page-header-tabs>
</cds-page-header>
```

## Design Tokens (component-scoped)

> The Carbon SCSS uses three semantic theme tokens (`$layer-01`, `$border-subtle-01`, type-style mixins). All other surface, text, and interactive colors come from the *children* (Breadcrumb, Button, Tag, Tabs) — the page header itself is intentionally minimal. Below are the resolved literal hex values for both canonical themes.

```css
/* WHITE THEME (default light) */
[data-theme="white"] {
  /* PageHeader surface */
  --cds-page-header-background: #f4f4f4;        /* layer-01 */
  --cds-page-header-border-block-end: #c6c6c6;  /* border-subtle-01 */
  --cds-page-header-breadcrumb-border: #c6c6c6; /* border-subtle-01 (only when border={true}) */

  /* Title + subtitle + body text (inherit from page) */
  --cds-page-header-title-color: #161616;       /* text-primary */
  --cds-page-header-subtitle-color: #161616;    /* text-primary */
  --cds-page-header-body-color: #161616;        /* text-primary */
  --cds-page-header-icon-color: #161616;        /* icon-primary */

  /* Breadcrumb children */
  --cds-page-header-breadcrumb-link: #0f62fe;   /* link-primary */
  --cds-page-header-breadcrumb-link-hover: #0050e6; /* link-primary-hover */
  --cds-page-header-breadcrumb-current: #161616;    /* text-primary */

  /* Buttons inside the header */
  --cds-page-header-button-primary: #0f62fe;          /* button-primary */
  --cds-page-header-button-primary-hover: #0050e6;    /* button-primary-hover */
  --cds-page-header-button-primary-active: #002d9c;   /* button-primary-active */
  --cds-page-header-button-secondary: #393939;        /* button-secondary */
  --cds-page-header-button-ghost-hover: rgba(141, 141, 141, 0.12); /* background-hover */
  --cds-page-header-button-ghost-active: rgba(141, 141, 141, 0.5); /* background-active */

  /* Focus (interactive children inherit) */
  --cds-page-header-focus: #0f62fe;             /* focus */
  --cds-page-header-focus-inset: #ffffff;       /* focus-inset */
}

/* G100 THEME (default dark) — also activated by `.dark` class */
[data-theme="g100"],
.dark {
  /* PageHeader surface */
  --cds-page-header-background: #262626;        /* layer-01 */
  --cds-page-header-border-block-end: #525252;  /* border-subtle-01 */
  --cds-page-header-breadcrumb-border: #525252; /* border-subtle-01 (only when border={true}) */

  /* Title + subtitle + body text */
  --cds-page-header-title-color: #f4f4f4;       /* text-primary */
  --cds-page-header-subtitle-color: #f4f4f4;    /* text-primary */
  --cds-page-header-body-color: #f4f4f4;        /* text-primary */
  --cds-page-header-icon-color: #f4f4f4;        /* icon-primary */

  /* Breadcrumb children */
  --cds-page-header-breadcrumb-link: #78a9ff;   /* link-primary */
  --cds-page-header-breadcrumb-link-hover: #a6c8ff; /* link-primary-hover */
  --cds-page-header-breadcrumb-current: #f4f4f4;    /* text-primary */

  /* Buttons inside the header */
  --cds-page-header-button-primary: #0f62fe;          /* button-primary */
  --cds-page-header-button-primary-hover: #0353e9;    /* button-primary-hover */
  --cds-page-header-button-primary-active: #002d9c;   /* button-primary-active */
  --cds-page-header-button-secondary: #6f6f6f;        /* button-secondary */
  --cds-page-header-button-ghost-hover: rgba(141, 141, 141, 0.16); /* background-hover */
  --cds-page-header-button-ghost-active: rgba(141, 141, 141, 0.4); /* background-active */

  /* Focus (interactive children inherit) — pure white in G100 */
  --cds-page-header-focus: #ffffff;             /* focus */
  --cds-page-header-focus-inset: #161616;       /* focus-inset */
}

/* G10 THEME (alt light) */
[data-theme="g10"] {
  --cds-page-header-background: #ffffff;        /* layer-01 in G10 */
  --cds-page-header-border-block-end: #e0e0e0;  /* border-subtle-01 in G10 */
  --cds-page-header-title-color: #161616;
  --cds-page-header-breadcrumb-link: #0f62fe;
  --cds-page-header-focus: #0f62fe;
}

/* G90 THEME (alt dark) */
[data-theme="g90"] {
  --cds-page-header-background: #393939;        /* layer-01 in G90 */
  --cds-page-header-border-block-end: #6f6f6f;  /* border-subtle-01 in G90 */
  --cds-page-header-title-color: #f4f4f4;
  --cds-page-header-breadcrumb-link: #78a9ff;
  --cds-page-header-focus: #ffffff;
}
```

## States Reference (from .scss)

> Pulled directly from `_page-header.scss` on the Carbon `main` branch. The PageHeader surface itself has only ONE state — there is no rest/hover/active/focus/disabled cascade on the page header element. Interactivity belongs to the children (BreadcrumbItem, Button, IconButton, Tab, Tag), each of which carries its own state styling. The values below describe the page header's static structural styling per region.

| Region | Property | Value (verbatim from .scss) | Resolved literal |
|---|---|---|---|
| `.cds--page-header` (root) | `background-color` | `$layer-01` | `#f4f4f4` (W) / `#ffffff` (G10) / `#393939` (G90) / `#262626` (G100) |
| `.cds--page-header` (root) | `border-block-end` | `1px solid $border-subtle-01` | `1px solid #c6c6c6` (W) / `1px solid #e0e0e0` (G10) / `1px solid #6f6f6f` (G90) / `1px solid #525252` (G100) |
| `.cds--page-header__breadcrumb-bar` | `block-size` | `convert.to-rem(40px)` | `2.5rem` (40px) |
| `.cds--page-header__breadcrumb-bar` (subgrid) | `block-size` | `100%` | 40px |
| `.cds--page-header__breadcrumb-container` | `display` / `align-items` / `justify-content` | `inline-flex` / `center` / `space-between` | — |
| `.cds--page-header__breadcrumb-container` | `block-size` / `inline-size` | `100%` / `100%` | — |
| `.cds--page-header__breadcrumb__actions-flush .cds--css-grid` | `padding-inline-end` | `0` | 0 |
| `.cds--page-header__breadcrumb__actions-flush .cds--css-grid-column` | `margin-inline-end` | `0` | 0 |
| `.cds--page-header__breadcrumb-bar-border` | `border-block-end` | `1px solid $border-subtle-01` | `1px solid #c6c6c6` (W) / etc. |
| `.cds--page-header__breadcrumb__icon` | `margin-inline-end` | `$spacing-03` | `0.5rem` (8px) |
| `.cds--page-header__breadcrumb__actions` | `display` | `inline-flex` | — |
| `.cds--page-header__breadcrumb__content-actions` | `margin-inline-end` | `$spacing-04` | `0.75rem` (12px) |
| `.cds--page-header__breadcrumb-wrapper` | `display` | `inline-flex` | — |
| `.cds--page-header__content` | `padding` | `$spacing-06 0` | `1.5rem 0` (24px top + bottom) |
| `.cds--page-header__content__title-wrapper` (≤md, ≤671px) | `display` / `flex-direction` / `grid-gap` | `flex` / `column` / `$spacing-05` | `1rem` (16px) |
| `.cds--page-header__content__title-wrapper` (>md) | `display` / `gap` | `grid` / `$spacing-05` | `1rem` (16px) |
| `.cds--page-header__content__title-wrapper` | `grid-template-columns` | `auto minmax(var(--pageheader-title-grid-width, 0), 1fr)` | — |
| `.cds--page-header__content__title-wrapper` | `margin-block-end` | `1rem` | 16px |
| `.cds--page-header__content__title-wrapper` | `min-block-size` | `convert.to-rem(40px)` | `2.5rem` (40px) |
| `.cds--page-header__content__start` | `display` / `flex-wrap` / `gap` | `flex` / `wrap` / `$spacing-05` | gap 16px |
| `.cds--page-header__content__title-container` | `display` | `flex` | — |
| `.cds--page-header__content__title-container .cds--definition-term` | `border-block-end` | `none` | — |
| `.cds--page-header__content__contextual-actions` | `display` | `flex` | — |
| `.cds--page-header__content__title` | `@include type-style('productive-heading-04')` | 28px / 36px / 400 / 0px tracking | — |
| `.cds--page-header__content__title` | `display` / `overflow` | `-webkit-box` / `hidden` | — |
| `.cds--page-header__content__title` | `-webkit-box-orient` / `-webkit-line-clamp` | `vertical` / `2` | — |
| `.cds--page-header__content__title` | `max-inline-size` | `convert.to-rem(640px)` | `40rem` (640px) |
| `.cds--page-header__content__title` | `text-overflow` / `white-space` | `ellipsis` / `normal` | — |
| `.cds--page-header__content:has(.cds--page-header__content__contextual-actions) .cds--page-header__content__title` | `-webkit-line-clamp` | `1` | — |
| `.cds--page-header__content__icon` | `margin-inline-end` | `$spacing-05` | `1rem` (16px) |
| `.cds--page-header__content__page-actions` | `display` / `justify-content` | `flex` / `right` | — |
| `.cds--page-header__content__page-actions` (≤md) | `justify-content` / `margin-block-start` | `left` / `0` | — |
| `.cds--page-header__content__page-actions .cds--menu-button__trigger:not(.cds--btn--ghost)` | `min-inline-size` | `0` | 0 |
| `.cds--page-header__content__subtitle` | `@include type-style('productive-heading-03')` | 20px / 28px / 400 / 0px tracking | — |
| `.cds--page-header__content__subtitle` | `margin-block-end` | `$spacing-03` | `0.5rem` (8px) |
| `.cds--page-header__content__body` | `@include type-style('body-01')` | 14px / 20px / 400 / 0.16px tracking | — |
| `.cds--page-header__content__body` | `margin-block-start` | `$spacing-03` | `0.5rem` (8px) |
| `.cds--page-header__content__body` | `max-inline-size` | `convert.to-rem(640px)` | `40rem` (640px) |
| `[data-hidden]:not([data-fixed])` | `display` | `none` | — (visibility helper) |
| `.cds--page-header__hero-image` | `display` / `overflow` / `align-items` / `justify-content` | `flex` / `hidden` / `center` / `flex-end` | — |
| `.cds--page-header__hero-image` | `block-size` | `100%` | full column height |
| `.cds--page-header__tab-bar` | `margin-inline-start` | `-$spacing-05` | `-1rem` (-16px) |
| `.cds--page-header__tab-bar--tablist` | `display` / `grid-gap` | `grid` / `$spacing-10` | gap `4rem` (64px) |
| `.cds--page-header__tab-bar--tablist` | `grid-template-columns` | `auto minmax(0, 1fr)` | — |
| `.cds--page-header__tags` | `display` / `align-items` / `justify-content` | `flex` / `center` / `right` | — |
| `.cds--page-header__tags-popover-list` | `display` / `flex-direction` / `padding` | `flex` / `column` / `$spacing-05` | padding 16px |
| `.cds--page-header__tag-item` | `flex-shrink` | `0` | — (tags don't compress) |

> **State summary:** the page header surface is *always* `layer-01` background + `border-subtle-01` block-end border; it never changes color on hover/focus/active/disabled. The breadcrumb bar's optional border (`border-subtle-01`) is the only switchable visual on the chrome itself. ALL hover/focus/active/disabled state styling lives in the embedded children — see `breadcrumb.md`, `button.md`, `tabs.md`, `tag.md` for those state tables.

## Animation & Motion

The Carbon SCSS does NOT define any transitions or keyframes on the PageHeader root, breadcrumb bar, content area, tab bar, or hero image. Motion is entirely inherited from the children (Button, Link, Tab, Tag, Breadcrumb), each of which uses the standard Carbon motion tokens.

```css
/* Inherited child motion (verbatim Carbon defaults from button/link/tab SCSS): */
.cds--btn,
.cds--link,
.cds--tabs__nav-link,
.cds--tag {
  transition:
    background var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    border-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}
/*
  --cds-duration-fast-01     = 70ms       (Carbon "fast" — for state changes)
  --cds-easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9)
*/

/* The optional sticky-collapse behavior (when the PageHeader compresses on scroll past
   its full height into a thin persistent header) is implemented via a JS scroll observer
   in @carbon/ibm-products' PageHeader (NOT in @carbon/react's preview pattern). Carbon
   core's preview__PageHeader does not implement collapse/sticky scroll — the SCSS has
   no sticky positioning, no compressed-title rules, and no scroll listeners.

   If sticky-collapse is required, switch to @carbon/ibm-products' PageHeader, which
   exposes a `collapseHeader` prop and uses CSS custom property `--pageheader-title-grid-width`
   to drive the collapsed layout. */

@media (prefers-reduced-motion: reduce) {
  .cds--btn,
  .cds--link,
  .cds--tabs__nav-link,
  .cds--tag {
    transition: none;
  }
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic structure:** the WC root `<cds-page-header>` is a generic block container (no implicit landmark). The React preview pattern likewise renders a `<div>` for the root. For accessibility, wrap the page header inside a `<header>` landmark or assign `role="banner"` IF it is the page-level banner (typically only inside a UIShell, NOT for every panel header).
- **Breadcrumb landmark:** the embedded `<cds-breadcrumb>` / `<Breadcrumb>` automatically renders `<nav aria-label="Breadcrumb">` per the Breadcrumb component spec — see `breadcrumb.md`.
- **Title:** the title is rendered as a plain `<span>` or `<div>` (NOT an `<h1>`/`<h2>`). For document outline correctness, ensure the page itself supplies the appropriate heading level — wrap the title node in `<h1>` via the React `as` pattern or render an outer `<h1>` with `aria-hidden` decorations. This is a known limitation of Carbon's preview PageHeader (the title is layout chrome, not the document heading).
- **Subtitle:** rendered with `productive-heading-03` (20px) — purely visual; not an `<h2>`. Same caveat applies.
- **Tabs landmark:** the embedded `<cds-tabs>` / `<Tabs>` renders a `<div role="tablist">` with proper `role="tab"` / `role="tabpanel"` / `aria-selected` / `aria-controls` wiring per the Tabs component spec — see `tabs.md`.
- **Page-action icon buttons:** every `<cds-icon-button>` / `<Button hasIconOnly>` requires `iconDescription` (React) or `tooltip-text` (WC) — the stories use `"Icon Description 1"`, `"Icon Description 2"`, etc. as placeholders. In production, supply meaningful action labels (e.g., "View activity", "Generate with AI", "Cloud Foundry settings").
- **Hero image:** the `<picture>` element MUST include a meaningful `alt` on its inner `<img>`. The stories use `alt="a default image"` as a placeholder — replace with a description of the imagery.
- **Keyboard:**
  - `Tab` moves focus through breadcrumb links → page-actions icon buttons → content-actions buttons → contextual-action tags → page-actions menu (or primary button) → tab list (single tab stop, then arrow keys within).
  - `Enter` / `Space` activates the focused control.
  - Within the tab list: `←`/`→` move tab focus, `Home`/`End` jump to first/last, `Enter`/`Space` activate (if `Manual` activation), or auto-activate on focus (default). See `tabs.md` for the full tab keyboard model.
  - Inside `PageHeader.ContentPageActions`'s collapsed menu: `Esc` closes, `↑`/`↓` move within menu items.
- **Touch target:** every embedded interactive (Button md = 40px, IconButton md = 32px wide × 32px tall, Tab = 48px tall) meets or exceeds 32px. For mobile/touch contexts, force `min-height: 44px` on icon buttons via a media query — Carbon defaults assume desktop pointer input.
- **Focus management:** all interactive children inherit the standard Carbon `:focus-visible` ring (`outline: 2px solid var(--cds-focus)` + `outline-offset: -2px` for inset rendering, plus `box-shadow: inset 0 0 0 1px var(--cds-background)` on dark surfaces). DO NOT remove or override these — they are required for WCAG 2.4.7 (Focus Visible).
- **Color contrast:** the `text-primary` token (`#161616` light / `#f4f4f4` dark) on `layer-01` (`#f4f4f4` light / `#262626` dark) achieves 19.0:1 in White and 13.6:1 in G100 — both well above WCAG AAA (7:1 large text, 4.5:1 normal text).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase, shorten, or rewrite — the verbatim source is the contract |
| Use `<cds-page-header>` (WC) or `PageHeader.Root` + dot subcomponents (React) | Don't substitute a generic `<header>` or hand-roll a div tree — Carbon's slots/props drive the breakpoint behavior |
| Set `border-radius: 0` (Carbon: sharp corners on every region) | Don't add rounding to the page header surface, breadcrumb bar, content area, tab bar, or hero image |
| Use `productive-heading-04` (28px) for the title via `cds-page-header-content title="..."` | Don't pick `expressive-heading-05` or marketing display sizes — those are for `page-patterns.md` (marketing hero), not product PageHeader |
| Wrap page-action icon buttons in `slot="page-actions"` (WC) or pass via `pageActions` prop (React) | Don't drop free-floating `<button>`s into the breadcrumb bar — they break the flex layout and lose the right-justified alignment |
| Wrap in `[data-theme="white"]` (or `g10`/`g90`/`g100`) on a parent | Don't define your own theme classes — Carbon's `[data-theme="..."]` selector is what cascades to children |
| Use `PageHeader.ContentPageActions` (React) for the collapse-to-menu primary action pattern | Don't manually implement collapse logic — the component handles overflow detection via ResizeObserver |
| For sticky-collapse on scroll, switch to `@carbon/ibm-products` PageHeader | Don't try to add sticky positioning to `@carbon/react`'s preview PageHeader — the SCSS doesn't support compressed-title states |
| Provide meaningful `iconDescription` (React) / `tooltip-text` (WC) on every icon button | Don't ship `"Icon Description 1"` placeholders to production — they fail screen-reader review |
| Keep title under 640px max-inline-size (Carbon truncates with ellipsis at this width) | Don't fight the truncation by removing `max-inline-size` — long titles wrap to 2 lines (or 1 with contextual actions) by design |
| Wrap with `<Tabs>` outer container + `<TabPanels>` sibling when using `PageHeader.TabBar` (React) | Don't put `<TabPanels>` inside `PageHeader.Root` — the example puts panels OUTSIDE so they don't inherit header chrome styles |
| Pair the 16px breadcrumb icon (`Bee16`) with the 32px content icon (`Bee32`) for visual consistency | Don't mix sizes inconsistently (e.g., 24px breadcrumb icon + 48px content icon) — Carbon's icon scale is 16/20/24/32 |
| Use `border={false}` on `PageHeader.BreadcrumbBar` when followed by hero image (the image provides its own visual divider) | Don't double-up borders — the page header root already has `border-block-end: 1px solid border-subtle-01` |
| Keep contextual actions to 1-3 small chips/tags (lg size max) | Don't pack the contextual-actions slot — the title compresses to single-line as soon as the slot has any content |
| Provide a meaningful `alt` on the hero `<img>` describing the imagery | Don't leave `alt="a default image"` (Carbon's placeholder) — accessibility audit will flag it |
