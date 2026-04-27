---
name: tabs
description: Carbon Tabs — horizontal and vertical tab navigation with line (default), contained, icon-only, dismissable, and skeleton variants; supports automatic and manual selection modes, secondary labels, leading icons, and full-width grid layouts
metadata:
  tags: tabs, tablist, navigation, vertical-tabs, contained-tabs, icon-tabs, dismissable, skeleton, ibm, carbon, react, web-components
---

# Tabs -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Tabs.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Tabs/Tabs.stories.js)
> - **WC story:** [`tabs.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tabs/tabs.stories.ts)
> - **Core SCSS:** [`_tabs.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/tabs/_tabs.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-tabs--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-tabs--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/tabs/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Default height (line tabs, md) | 48px (`layout.size('height')` resolved at default `md` density) |
| Tall height (line + contained) | 64px (when `--cds-layout-size-height-xl` is in scope) |
| Vertical tab item height | 64px (`spacing-10`) |
| Icon-only tab dimensions | square — `block-size` and `inline-size` both equal `layout.size('height')` (48px md) |
| Horizontal padding per tab | `layout.density('padding-inline')` — 16px at default density |
| Tab gap (line) | 1px (`margin-inline-start: 1px` between adjacent items, drawn as the inter-tab seam) |
| Tab gap (contained) | 0 (uses `box-shadow: -1px 0 0 0 var(--cds-border-strong-01)` for the inter-tab divider) |
| Active indicator (line, horizontal) | `border-block-end: 2px solid var(--cds-border-interactive)` (`#0f62fe` light / `#4589ff` dark) |
| Active indicator (contained, horizontal) | `box-shadow: inset 0 2px 0 0 var(--cds-border-interactive)` (top edge) |
| Active indicator (vertical) | `box-shadow: inset 3px 0 0 0 var(--cds-border-interactive)` (left edge) |
| Inactive label color | `var(--cds-text-secondary)` (`#525252` light / `#c6c6c6` dark) |
| Active label color | `var(--cds-text-primary)` (`#161616` light / `#f4f4f4` dark) |
| Active label type style | `heading-compact-01` — 14px / 18px / 600 semibold / 0.16px |
| Rest label type style | `body-compact-01` — 14px / 18px / 400 regular / 0.16px |
| Hover (line) | `border-block-end: var(--cds-tab-underline-color-hover)` + color `var(--cds-text-primary)` |
| Hover (contained) | `background-color: var(--cds-layer-accent-hover-01)` + color `var(--cds-text-primary)` |
| Hover (vertical) | `background-color: var(--cds-layer-hover-01)` + `box-shadow: inset 3px 0 0 0 var(--cds-border-strong-01)` |
| Disabled label | `var(--cds-text-disabled)` (`rgba(22, 22, 22, 0.25)` light / `rgba(244, 244, 244, 0.25)` dark) |
| Disabled (contained) | `background-color: var(--cds-button-disabled)` (`#c6c6c6` light / `rgba(141,141,141,0.3)` dark), color `var(--cds-text-on-color-disabled)` (`#8d8d8d`) |
| Container background (rest, contained) | `var(--cds-layer-accent-01)` (`#e0e0e0` light / `#525252` dark) |
| Container background (selected, contained) | `var(--cds-layer-01)` (`#f4f4f4` White / `#ffffff` G10 / `#393939` G100) |
| Vertical rail background | `var(--cds-layer-01)` |
| Vertical rail right border | `box-shadow: inset -1px 0 var(--cds-border-subtle-00)` |
| Dismissable close button size | 24px × 24px button with 16px × 16px svg, padding `spacing-02` (4px) on both axes |
| Dismissable extra right padding | `spacing-08` (40px) line / `calc(spacing-09 - 1px)` (47px) contained |
| Icon (leading) gap | `padding-inline-start: spacing-03` (8px) |
| Icon-only icon size | 16px default / 20px when `iconSize="lg"` (`TABS_ICON_SIZE.LARGE`) |
| Corner radius | `0` (Carbon: sharp by default — tabs and indicators are rectangular) |
| Font | IBM Plex Sans |
| Focus ring | `outline: 2px solid var(--cds-focus)` (`#0f62fe` light / `#ffffff` dark), `outline-offset: -2px` (rendered via `focus-outline('outline')` mixin — inset on `--cds-background`) |
| Tab transition | `background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` (70ms) on item; `color`, `border-bottom-color`, `outline` `var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` on link |
| Selected transition | `color var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` |
| Vertical max width (lg breakpoint) | `grid-column: span 4` for the rail, `grid-column: 5/-1` for the panel |
| Vertical default span | `grid-column: span 2` for rail, `grid-column: 3/-1` for panel (mobile/tablet) |
| Skeleton tab width | `inline-size: 10rem` (160px) per skeleton tab |
| Skeleton inner bar | `block-size: 14px`, `inline-size: 100%` |
| Overflow nav button width (line) | `var(--cds-spacing-08)` (40px) |
| Overflow nav button width (contained) | `var(--cds-spacing-09)` (48px) |
| React import | `import { Tabs, TabsVertical, TabList, TabListVertical, Tab, TabPanels, TabPanel, IconTab, TabsSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/tabs/index.js';` |

## Variants (from Storybook story exports)

The React stories file exports nine product variants and two `!dev`-tagged visual-snapshot helpers. The WC stories file exports six variants. Embed every variant below — line (default) and contained are the two foundational shapes; everything else is a modifier on one of those.

| Variant | Story export (React) | Story export (WC) | Purpose |
|---|---|---|---|
| Default (line) | `Default` | `Default` | Standard horizontal tab strip with bottom-border active indicator. 4 tabs (Dashboard, Monitoring, Activity, Settings) on `--cds-background`. The default selection mode is `automatic` (arrow keys move focus AND switch panels). React's `Default` accepts `args.contained` so the same story can flip to contained via the Storybook control. |
| Dismissable | `Dismissable` | — (not exported in WC stories) | Each tab has a small × close button (16px svg in a 24px button). Closing a tab fires `onTabCloseRequest(tabIndex)`; the parent app removes the tab from state. Uses `dismissable` prop on `<Tabs>` and `onTabCloseRequest` callback. Disabled tabs cannot be closed. The `Reset` button rehydrates the original 4 tabs. |
| DismissableContained | `DismissableContained` | — | Same as Dismissable but with `<TabList contained>` — the dismiss × sits inside each container surface. Right padding shifts to `calc(spacing-09 - 1px)` (47px) to make room for the close button. |
| DismissableWithIcons | `DismissableWithIcons` | — | Dismissable variant with leading icons via `renderIcon={IconComponent}` per `<Tab>`. Accepts `contained` arg so the same story can render line+icon+dismiss or contained+icon+dismiss. |
| WithIcons | `WithIcons` | `WithIcons` | Each `<Tab>` has a leading 16px icon (`renderIcon` in React, `${iconLoader(Icon16)}` in WC). React example uses `activation="manual"` so arrow keys move focus only — Enter/Space activates. WC example uses `selection-mode="manual"`. |
| Manual | `Manual` | `Manual` | Same as Default but with `activation="manual"` (React) / `selection-mode="manual"` (WC). Required for tab panels containing forms (so arrow-key focus doesn't auto-switch panels and discard form state). Includes a 5th `disabled` tab and a `title="Tab label 4"` tooltip on the third tab. |
| Icon20Only | `Icon20Only` | `Icon20Only` | Icon-only tabs with the larger 20px icon set (`iconSize="lg"` / `icon-size="${TABS_ICON_SIZE.LARGE}"`). Each `<IconTab>` (React) / `<cds-tab icon-only>` (WC) takes a `label` (visible as a tooltip on hover) and an svg child with `aria-label`. The third tab demos `badgeIndicator` — an 8px dot at the top-right corner. |
| IconOnly | `IconOnly` | `IconOnly` | Same as Icon20Only but with the default 16px icon set (`iconSize="default"` / `icon-size="${TABS_ICON_SIZE.DEFAULT}"`). |
| Contained | `Contained` | `Contained` | Filled, surface-style tabs. Each tab is a `--cds-layer-accent-01` rectangle with a 1px inner divider (`box-shadow: -1px 0 0 0 var(--cds-border-strong-01)`). The selected tab fills with `--cds-layer-01` and gets a 2px top inset border in `--cds-border-interactive`. The `<TabPanels>` background also flips to `--cds-layer-01`. |
| ContainedWithIcons | `ContainedWithIcons` | — | Contained tabs with leading icons. |
| ContainedWithSecondaryLabels | `ContainedWithSecondaryLabels` | — | Contained tabs with a `secondaryLabel` prop showing `(21/25)` style metadata under the primary label. Secondary label uses `label-01` (12px) and has `min-block-size: 16px` so empty labels still preserve vertical rhythm. |
| ContainedWithSecondaryLabelsAndIcons | `ContainedWithSecondaryLabelsAndIcons` | — | Combines all three contained modifiers — fill, leading icon, secondary label. |
| ContainedFullWidth | `ContainedFullWidth` | — | Contained tabs that stretch edge-to-edge inside a `<Grid condensed><Column lg={16} md={8} sm={4}>`. Implemented in CSS as `display: grid; grid-template-columns: repeat(auto-fit, minmax(0, 1fr));` so each tab takes `1fr` of the row. Long labels truncate with `text-overflow: ellipsis`. |
| Vertical | `Vertical` | — (no WC export — use the line tabs in a vertical `<aside>` container) | Full-height left rail with right-side border indicator. Each item is 64px tall (`spacing-10`) with multi-line label clamped to 2 lines (`-webkit-line-clamp: 2`). Active item gets `box-shadow: inset 3px 0 0 0 var(--cds-border-interactive)`. The rail spans `grid-column: span 2` (mobile/tablet) or `span 4` (lg breakpoint); the panel spans `3/-1` or `5/-1` respectively. |
| Skeleton | `Skeleton` | `skeleton` (lowercase WC export) | Loading state — 4 (React) or 5 (WC) placeholder tab bars, each 160px wide, with a 14px tall animated `--cds-skeleton-element` rectangle inside. `cursor: default` and `pointer-events: none` while skeleton. |
| Icon20OnlyVisualSnapshots | `Icon20OnlyVisualSnapshots` | — | React-only visual-snapshot story (tagged `!dev`, `!autodocs`) that renders Icon20Only with a `play` function pressing Tab. Used by Carbon's regression suite. |
| IconOnlyVisualSnapshots | `IconOnlyVisualSnapshots` | — | Same as above but for the 16px icon variant. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Tabs.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import {
  Tabs,
  TabsVertical,
  TabList,
  TabListVertical,
  Tab,
  TabPanels,
  TabPanel,
  IconTab,
} from './Tabs';
import TextInput from '../TextInput';
import Checkbox from '../Checkbox';
import Button from '../Button';
import RadioButtonGroup from '../RadioButtonGroup';
import RadioButton from '../RadioButton';
import { Stack } from '../Stack';
import { Grid, Column } from '../Grid';
import { Layer } from '../Layer';
import mdx from './Tabs.mdx';

import TabsSkeleton from './Tabs.Skeleton';
import {
  Dashboard,
  Activity,
  CloudMonitoring,
  Settings,
  IbmWatsonDiscovery,
  Notification,
  Chat,
  Task,
  Restart,
  Icon,
} from '@carbon/icons-react';

export default {
  title: 'Components/Tabs',
  component: Tabs,
  subcomponents: {
    TabsVertical,
    TabList,
    TabListVertical,
    Tab,
    TabPanels,
    TabPanel,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
  argTypes: {
    light: {
      table: {
        disable: true,
      },
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <Tabs onTabCloseRequest={() => {}}>
      <TabList {...args}>
        <Tab>Dashboard</Tab>
        <Tab>Monitoring</Tab>
        <Tab>Activity</Tab>
        <Tab>Settings</Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>Tab Panel 2</TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
      </TabPanels>
    </Tabs>
  );
};

Default.args = {
  contained: false,
  dismissable: false,
  scrollDebounceWait: 200,
};

Default.argTypes = {
  activation: {
    control: { type: 'select' },
    options: ['automatic', 'manual'],
  },
  contained: {
    control: {
      type: 'boolean',
    },
  },
  dismissable: {
    control: false,
  },
  iconSize: {
    control: { type: 'select' },
    options: ['default', 'lg'],
  },
  leftOverflowButtonProps: {
    control: {
      type: 'object',
    },
  },
  rightOverflowButtonProps: {
    control: {
      type: 'object',
    },
  },
  scrollDebounceWait: {
    control: {
      type: 'number',
    },
  },
  scrollIntoView: {
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: Dismissable**

```jsx
export const Dismissable = () => {
  const tabs = [
    {
      label: 'Dashboard',
      panel: <TabPanel key={0}>Dashboard</TabPanel>,
    },
    {
      label: 'Monitoring',
      panel: <TabPanel key={1}>Monitoring</TabPanel>,
    },
    {
      label: 'Activity',
      panel: <TabPanel key={2}>Activity</TabPanel>,
    },
    {
      label: 'Settings',
      panel: <TabPanel key={3}>Settings</TabPanel>,
      disabled: true,
    },
  ];
  const [renderedTabs, setRenderedTabs] = React.useState(tabs);

  const [selectedIndex, setSelectedIndex] = React.useState(0);

  const handleTabChange = (evt) => {
    setSelectedIndex(evt.selectedIndex);
  };

  const handleCloseTabRequest = (tabIndex) => {
    if (renderedTabs[tabIndex].disabled) {
      return;
    }
    const selectedTab = renderedTabs[selectedIndex];

    const filteredTabs = renderedTabs.filter((_, index) => index !== tabIndex);
    if (tabIndex === selectedIndex) {
      const defaultTabIndex = filteredTabs.findIndex((tab) => !tab.disabled);
      setSelectedIndex(defaultTabIndex);
    } else {
      setSelectedIndex(filteredTabs.indexOf(selectedTab));
    }
    setRenderedTabs(filteredTabs);
  };

  const resetTabs = () => {
    setRenderedTabs(tabs);
  };

  return (
    <>
      <Button style={{ marginBottom: '3rem' }} onClick={resetTabs}>
        Reset
      </Button>
      <Tabs
        selectedIndex={selectedIndex}
        onChange={handleTabChange}
        dismissable
        onTabCloseRequest={handleCloseTabRequest}>
        <TabList>
          {renderedTabs.map((tab, index) => (
            <Tab key={index} disabled={tab.disabled}>
              {tab.label}
            </Tab>
          ))}
        </TabList>
        <TabPanels>{renderedTabs.map((tab) => tab.panel)}</TabPanels>
      </Tabs>
    </>
  );
};
```

**Variant: DismissableContained**

```jsx
export const DismissableContained = () => {
  const tabs = [
    {
      label: 'Dashboard',
      panel: <TabPanel key={0}>Dashboard</TabPanel>,
    },
    {
      label: 'Monitoring',
      panel: <TabPanel key={1}>Monitoring</TabPanel>,
    },
    {
      label: 'Activity',
      panel: <TabPanel key={2}>Activity</TabPanel>,
    },
    {
      label: 'Settings',
      panel: <TabPanel key={3}>Settings</TabPanel>,
      disabled: true,
    },
  ];
  const [renderedTabs, setRenderedTabs] = React.useState(tabs);

  const [selectedIndex, setSelectedIndex] = React.useState(0);

  const handleTabChange = (evt) => {
    setSelectedIndex(evt.selectedIndex);
  };

  const handleCloseTabRequest = (tabIndex) => {
    if (renderedTabs[tabIndex].disabled) {
      return;
    }
    const selectedTab = renderedTabs[selectedIndex];

    const filteredTabs = renderedTabs.filter((_, index) => index !== tabIndex);
    if (tabIndex === selectedIndex) {
      const defaultTabIndex = filteredTabs.findIndex((tab) => !tab.disabled);
      setSelectedIndex(defaultTabIndex);
    } else {
      setSelectedIndex(filteredTabs.indexOf(selectedTab));
    }
    setRenderedTabs(filteredTabs);
  };

  const resetTabs = () => {
    setRenderedTabs(tabs);
  };

  return (
    <>
      <Button style={{ marginBottom: '3rem' }} onClick={resetTabs}>
        Reset
      </Button>
      <Tabs
        selectedIndex={selectedIndex}
        onChange={handleTabChange}
        dismissable
        onTabCloseRequest={handleCloseTabRequest}>
        <TabList contained>
          {renderedTabs.map((tab, index) => (
            <Tab key={index} disabled={tab.disabled}>
              {tab.label}
            </Tab>
          ))}
        </TabList>
        <TabPanels>{renderedTabs.map((tab) => tab.panel)}</TabPanels>
      </Tabs>
    </>
  );
};
```

**Variant: DismissableWithIcons**

```jsx
export const DismissableWithIcons = ({ contained }) => {
  const tabs = [
    {
      label: 'Dashboard',
      panel: <TabPanel key={0}>Dashboard</TabPanel>,
    },
    {
      label: 'Monitoring',
      panel: <TabPanel key={1}>Monitoring</TabPanel>,
    },
    {
      label: 'Activity',
      panel: <TabPanel key={2}>Activity</TabPanel>,
    },
    {
      label: 'Settings',
      panel: <TabPanel key={3}>Settings</TabPanel>,
      disabled: true,
    },
  ];
  const [renderedTabs, setRenderedTabs] = React.useState(tabs);

  const [selectedIndex, setSelectedIndex] = React.useState(0);

  const handleTabChange = (evt) => {
    setSelectedIndex(evt.selectedIndex);
  };

  const handleCloseTabRequest = (tabIndex) => {
    if (renderedTabs[tabIndex].disabled) {
      return;
    }
    const selectedTab = renderedTabs[selectedIndex];

    const filteredTabs = renderedTabs.filter((_, index) => index !== tabIndex);
    if (tabIndex === selectedIndex) {
      const defaultTabIndex = filteredTabs.findIndex((tab) => !tab.disabled);
      setSelectedIndex(defaultTabIndex);
    } else {
      setSelectedIndex(filteredTabs.indexOf(selectedTab));
    }
    setRenderedTabs(filteredTabs);
  };

  const resetTabs = () => {
    setRenderedTabs(tabs);
  };

  const icons = [Dashboard, CloudMonitoring, Settings, Activity];

  return (
    <>
      <Button style={{ marginBottom: '3rem' }} onClick={resetTabs}>
        Reset
      </Button>
      <Tabs
        selectedIndex={selectedIndex}
        onChange={handleTabChange}
        dismissable
        onTabCloseRequest={handleCloseTabRequest}>
        <TabList contained={contained}>
          {renderedTabs.map((tab, index) => (
            <Tab key={index} disabled={tab.disabled} renderIcon={icons[index]}>
              {tab.label}
            </Tab>
          ))}
        </TabList>
        <TabPanels>{renderedTabs.map((tab) => tab.panel)}</TabPanels>
      </Tabs>
    </>
  );
};
```

**Variant: WithIcons**

```jsx
export const WithIcons = () => {
  return (
    <Tabs>
      <TabList activation="manual">
        <Tab renderIcon={Dashboard}>Dashboard</Tab>
        <Tab renderIcon={CloudMonitoring}>Monitoring</Tab>
        <Tab renderIcon={Activity}>Activity</Tab>
        <Tab renderIcon={IbmWatsonDiscovery}>Analyze</Tab>
        <Tab disabled renderIcon={Settings}>
          Settings
        </Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <form style={{ margin: '2em' }}>
            <legend className={`cds--label`}>Validation example</legend>
            <Checkbox id="cb" labelText="Accept privacy policy" />
            <Button
              style={{ marginTop: '1rem', marginBottom: '1rem' }}
              type="submit">
              Submit
            </Button>
            <TextInput
              type="text"
              labelText="Text input label"
              helperText="Optional help text"
              id="text-input-1"
            />
          </form>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: Manual**

```jsx
export const Manual = () => {
  return (
    <Tabs>
      <TabList activation="manual">
        <Tab>Dashboard</Tab>
        <Tab>Monitoring</Tab>
        <Tab title="Tab label 4">Activity</Tab>
        <Tab>Analyze</Tab>
        <Tab disabled>Settings</Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <form style={{ margin: '2em' }}>
            <legend className={`cds--label`}>Validation example</legend>
            <Checkbox id="cb" labelText="Accept privacy policy" />
            <Button
              style={{ marginTop: '1rem', marginBottom: '1rem' }}
              type="submit">
              Submit
            </Button>
            <TextInput
              type="text"
              labelText="Text input label"
              helperText="Optional help text"
              id="text-input-1"
            />
          </form>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: Icon20Only**

```jsx
export const Icon20Only = (args) => {
  return (
    <Tabs>
      <TabList iconSize="lg">
        <IconTab label="Analyze" disabled>
          <IbmWatsonDiscovery size={20} aria-label="Analyze" />
        </IconTab>
        <IconTab label="Activity">
          <Activity size={20} aria-label="Activity" />
        </IconTab>
        <IconTab label="New Notifications" {...args}>
          <Notification size={20} aria-label="Notification" />
        </IconTab>
        <IconTab label="Chat">
          <Chat size={20} aria-label="Chat" />
        </IconTab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>Tab Panel 2</TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
      </TabPanels>
    </Tabs>
  );
};

Icon20Only.argTypes = {
  badgeIndicator: {
    description: '**Experimental**: Display an empty dot badge on the Tab.',
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: IconOnly**

```jsx
export const IconOnly = (args) => {
  return (
    <Tabs>
      <TabList iconSize="default">
        <IconTab label="Analyze" disabled>
          <IbmWatsonDiscovery aria-label="Analyze" />
        </IconTab>
        <IconTab label="Activity">
          <Activity aria-label="Activity" />
        </IconTab>
        <IconTab label="New Notifications" {...args}>
          <Notification aria-label="Notification" />
        </IconTab>
        <IconTab label="Chat">
          <Chat aria-label="Chat" />
        </IconTab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>Tab Panel 2</TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
      </TabPanels>
    </Tabs>
  );
};

IconOnly.argTypes = {
  badgeIndicator: {
    description: '**Experimental**: Display an empty dot badge on the Tab.',
    control: {
      type: 'boolean',
    },
  },
};
```

**Variant: Contained**

```jsx
export const Contained = () => {
  return (
    <Tabs>
      <TabList contained>
        <Tab>Dashboard</Tab>
        <Tab>Monitoring</Tab>
        <Tab>Activity</Tab>
        <Tab>Analyze</Tab>
        <Tab disabled>Settings</Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <Layer>
            <form style={{ margin: '2em' }}>
              <legend className={`cds--label`}>Validation example</legend>
              <Checkbox id="cb" labelText="Accept privacy policy" />
              <Button
                style={{ marginTop: '1rem', marginBottom: '1rem' }}
                type="submit">
                Submit
              </Button>
              <TextInput
                type="text"
                labelText="Text input label"
                helperText="Optional help text"
              />
            </form>
          </Layer>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: ContainedWithIcons**

```jsx
export const ContainedWithIcons = () => {
  return (
    <Tabs>
      <TabList contained>
        <Tab renderIcon={Dashboard}>Dashboard</Tab>
        <Tab renderIcon={CloudMonitoring}>Monitoring</Tab>
        <Tab renderIcon={Activity}>Activity</Tab>
        <Tab renderIcon={IbmWatsonDiscovery}>Analyze</Tab>
        <Tab disabled renderIcon={Settings}>
          Settings
        </Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <Layer>
            <form style={{ margin: '2em' }}>
              <legend className={`cds--label`}>Validation example</legend>
              <Checkbox id="cb" labelText="Accept privacy policy" />
              <Button
                style={{ marginTop: '1rem', marginBottom: '1rem' }}
                type="submit">
                Submit
              </Button>
              <TextInput
                type="text"
                labelText="Text input label"
                helperText="Optional help text"
              />
            </form>
          </Layer>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: ContainedWithSecondaryLabels**

```jsx
export const ContainedWithSecondaryLabels = () => {
  return (
    <Tabs>
      <TabList contained>
        <Tab secondaryLabel="(21/25)">Engage</Tab>
        <Tab secondaryLabel="(12/16)">Analyze</Tab>
        <Tab secondaryLabel="(0/7)">Remediate</Tab>
        <Tab secondaryLabel="(4/12)">Assets</Tab>
        <Tab disabled secondaryLabel="(0/10)">
          Monitoring
        </Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <Layer>
            <form style={{ margin: '2em' }}>
              <legend className={`cds--label`}>Validation example</legend>
              <Checkbox id="cb" labelText="Accept privacy policy" />
              <Button
                style={{ marginTop: '1rem', marginBottom: '1rem' }}
                type="submit">
                Submit
              </Button>
              <TextInput
                type="text"
                labelText="Text input label"
                helperText="Optional help text"
              />
            </form>
          </Layer>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: ContainedWithSecondaryLabelsAndIcons**

```jsx
export const ContainedWithSecondaryLabelsAndIcons = () => {
  return (
    <Tabs>
      <TabList contained>
        <Tab renderIcon={Task} secondaryLabel="(21/25">
          Engage
        </Tab>
        <Tab renderIcon={IbmWatsonDiscovery} secondaryLabel="(12/16)">
          Analyze
        </Tab>
        <Tab renderIcon={Restart} disabled secondaryLabel="(0/7)">
          Remediate
        </Tab>
        <Tab renderIcon={Dashboard} secondaryLabel="(4/12)">
          Assets
        </Tab>
        <Tab renderIcon={CloudMonitoring} secondaryLabel="(1/23)">
          Monitoring
        </Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <Layer>
            <form style={{ margin: '2em' }}>
              <legend className={`cds--label`}>Validation example</legend>
              <Checkbox id="cb" labelText="Accept privacy policy" />
              <Button
                style={{ marginTop: '1rem', marginBottom: '1rem' }}
                type="submit">
                Submit
              </Button>
              <TextInput
                type="text"
                labelText="Text input label"
                helperText="Optional help text"
              />
            </form>
          </Layer>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
      </TabPanels>
    </Tabs>
  );
};
```

**Variant: ContainedFullWidth**

```jsx
export const ContainedFullWidth = () => {
  return (
    <Grid condensed>
      <Column lg={16} md={8} sm={4}>
        <Tabs>
          <TabList contained fullWidth>
            <Tab>TLS</Tab>
            <Tab>Origin</Tab>
            <Tab disabled>Rate limiting</Tab>
            <Tab>WAF</Tab>
            <Tab>IP Firewall</Tab>
            <Tab>Firewall rules</Tab>
            <Tab>Range</Tab>
            <Tab>Mutual TLS</Tab>
          </TabList>
          <TabPanels>
            <TabPanel>Tab Panel 1</TabPanel>
            <TabPanel>
              <Layer>
                <form style={{ margin: '2em' }}>
                  <legend className={`cds--label`}>Validation example</legend>
                  <Checkbox id="cb" labelText="Accept privacy policy" />
                  <Button
                    style={{ marginTop: '1rem', marginBottom: '1rem' }}
                    type="submit">
                    Submit
                  </Button>
                  <TextInput
                    type="text"
                    labelText="Text input label"
                    helperText="Optional help text"
                  />
                </form>
              </Layer>
            </TabPanel>
            <TabPanel>Tab Panel 3</TabPanel>
            <TabPanel>Tab Panel 4</TabPanel>
            <TabPanel>Tab Panel 5</TabPanel>
            <TabPanel>Tab Panel 6</TabPanel>
            <TabPanel>Tab Panel 7</TabPanel>
            <TabPanel>Tab Panel 8</TabPanel>
          </TabPanels>
        </Tabs>
      </Column>
    </Grid>
  );
};
```

**Variant: Vertical**

```jsx
export const Vertical = (args) => {
  return (
    <TabsVertical {...args}>
      <TabListVertical>
        <Tab>Dashboard</Tab>
        <Tab>
          Extra long label that will go two lines then truncate when it goes
          beyond the Tab length
        </Tab>
        <Tab>Activity</Tab>
        <Tab>Analyze</Tab>
        <Tab>Investigate </Tab>
        <Tab>Learn</Tab>
        <Tab disabled>Settings</Tab>
      </TabListVertical>
      <TabPanels>
        <TabPanel>Tab Panel 1</TabPanel>
        <TabPanel>
          <Layer>
            <form style={{ margin: '2em' }}>
              <Stack gap={7}>
                <TextInput id="one" labelText="First Name" />
                <TextInput id="three" labelText="Middle Initial" />
                <TextInput id="two" labelText="Last Name" />
                <RadioButtonGroup
                  legendText="Radio button heading"
                  name="formgroup-default-radio-button-group"
                  defaultSelected="radio-1">
                  <RadioButton
                    labelText="Option 1"
                    value="radio-1"
                    id="radio-1"
                  />
                  <RadioButton
                    labelText="Option 2"
                    value="radio-2"
                    id="radio-2"
                  />
                  <RadioButton
                    labelText="Option 3"
                    value="radio-3"
                    id="radio-3"
                  />
                </RadioButtonGroup>
                <Checkbox labelText={`Checkbox one`} id="checkbox-label-1" />
                <Checkbox labelText={`Checkbox two`} id="checkbox-label-2" />
                <Button>Submit</Button>
              </Stack>
            </form>
          </Layer>
        </TabPanel>
        <TabPanel>Tab Panel 3</TabPanel>
        <TabPanel>Tab Panel 4</TabPanel>
        <TabPanel>Tab Panel 5</TabPanel>
        <TabPanel>Tab Panel 6</TabPanel>
        <TabPanel>Tab Panel 7</TabPanel>
      </TabPanels>
    </TabsVertical>
  );
};

Vertical.args = {
  height: '',
};

Vertical.argTypes = {
  height: {
    control: {
      type: 'text',
    },
  },
};

Vertical.parameters = {
  controls: {
    exclude: ['dismissable'],
  },
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return (
    <div style={{ maxWidth: '100%' }}>
      <TabsSkeleton />
    </div>
  );
};
```

**Variants: `Icon20OnlyVisualSnapshots` + `IconOnlyVisualSnapshots`** (visual regression only)

These two exports are tagged `!dev` and `!autodocs` and are NOT surfaced in the public Storybook nav. Each is identical to its non-suffixed counterpart (`Icon20Only` / `IconOnly`) except for an attached `play({ userEvent }) => userEvent.keyboard('{Tab}')` that puts the first tab in a focused state for Carbon's visual regression suite. Use the `Icon20Only` / `IconOnly` blocks above for any product UI; if you need to mirror Carbon's regression baseline, render those blocks and call `userEvent.keyboard('{Tab}')` once after mount.

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `tabs.stories.ts` on the Carbon `main` branch. Use these for non-React projects. Note: the WC stories file uses `export default { title: 'Components/Tabs', ... }` at the **bottom** of the file — Carbon's WC stories follow this convention.

**Imports + shared args / actions** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { action } from 'storybook/actions';
import { TABS_ICON_SIZE, TABS_TYPE } from './tabs';
import styles from './tabs-story.scss?lit';
import { prefix } from '../../globals/settings';
import { iconLoader } from '../../globals/internal/icon-loader';
import Activity16 from '@carbon/icons/es/activity/16.js';
import Activity20 from '@carbon/icons/es/activity/20.js';
import Dashboard16 from '@carbon/icons/es/dashboard/16.js';
import CloudMonitoring16 from '@carbon/icons/es/cloud--monitoring/16.js';
import Settings16 from '@carbon/icons/es/settings/16.js';
import Notification16 from '@carbon/icons/es/notification/16.js';
import Notification20 from '@carbon/icons/es/notification/20.js';
import Chat16 from '@carbon/icons/es/chat/16.js';
import Chat20 from '@carbon/icons/es/chat/20.js';
import IbmWatsonDiscovery16 from '@carbon/icons/es/ibm-watson--discovery/16.js';
import IbmWatsonDiscovery20 from '@carbon/icons/es/ibm-watson--discovery/20.js';
import '../button';
import '../checkbox';
import './index';
import '../text-input';

const args = {
  contained: false,
  disabled: false,
  selectionMode: 'automatic',
};

const argTypes = {
  disabled: {
    control: 'boolean',
    description: 'Disable tab selection',
  },
  contained: {
    control: 'boolean',
    description: 'Container type styling for tabs',
  },
  selectionMode: {
    control: 'select',
    description:
      'Choose whether or not to automatically change selection on focus when left/right arrow pressed.',
    options: ['automatic', 'manual'],
  },
};

const onTabsBeingSelected = action('cds-tabs-beingselected');
const onTabsSelected = action('cds-tabs-selected');
const iconStoriesArgs = {
  badgeIndicator: false,
};

const iconStoriesArgTypes = {
  badgeIndicator: {
    description: '**Experimental**: Display an empty dot badge on the Tab.',
    control: 'boolean',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args,
  argTypes,
  render: ({ disabled, contained, selectionMode }) => {
    const handleBeforeSelected = (event: CustomEvent) => {
      onTabsBeingSelected(event);

      if (disabled) {
        event.preventDefault();
      }
    };

    return html`
      <style>
        ${styles}
      </style>
      <cds-tabs
        disabled="${disabled}"
        selection-mode="${selectionMode}"
        type="${ifDefined(contained && TABS_TYPE.CONTAINED)}"
        value="dashboard"
        @cds-tabs-beingselected="${handleBeforeSelected}"
        @cds-tabs-selected="${onTabsSelected}">
        <cds-tab id="tab-dashboard" target="panel-dashboard" value="dashboard">
          Dashboard
        </cds-tab>
        <cds-tab
          id="tab-monitoring"
          target="panel-monitoring"
          value="monitoring">
          Monitoring
        </cds-tab>
        <cds-tab id="tab-activity" target="panel-activity" value="activity">
          Activity
        </cds-tab>
        <cds-tab id="tab-settings" target="panel-settings" value="settings">
          Settings
        </cds-tab>
      </cds-tabs>
      <div
        id="panel-dashboard"
        class="${prefix}--tab-content"
        role="tabpanel"
        aria-labelledby="tab-dashboard"
        hidden>
        Tab Panel 1
      </div>
      <div
        id="panel-monitoring"
        class="${prefix}--tab-content"
        role="tabpanel"
        aria-labelledby="tab-monitoring"
        hidden>
        Tab Panel 2
      </div>
      <div
        id="panel-activity"
        class="${prefix}--tab-content"
        role="tabpanel"
        aria-labelledby="tab-activity"
        hidden>
        Tab Panel 3
      </div>
      <div
        id="panel-settings"
        class="${prefix}--tab-content"
        role="tabpanel"
        aria-labelledby="tab-settings"
        hidden>
        Tab Panel 4
      </div>
    `;
  },
};
```

**Variant: Contained**

```html
export const Contained = {
  render: () => html`
    <style>
      ${styles}
    </style>
    <cds-tabs
      value="all"
      type="${TABS_TYPE.CONTAINED}"
      @cds-tabs-beingselected="${onTabsBeingSelected}"
      @cds-tabs-selected="${onTabsSelected}">
      <cds-tab id="tab-all" target="panel-all" value="all">Tab label 1</cds-tab>
      <cds-tab
        id="tab-cloudFoundry"
        target="panel-cloudFoundry"
        value="cloudFoundry">
        Tab label 2
      </cds-tab>
      <cds-tab id="tab-staging" target="panel-staging" value="staging" disabled>
        Tab label 3
      </cds-tab>
      <cds-tab id="tab-dea" target="panel-dea" value="dea">Tab label 4</cds-tab>
      <cds-tab id="tab-five" target="panel-five" value="five">
        Tab label 5
      </cds-tab>
    </cds-tabs>
    <div class="${prefix}-ce-demo-devenv--tab-panels">
      <div id="panel-all" role="tabpanel" aria-labelledby="tab-all" hidden>
        Tab Panel 1
      </div>
      <div
        id="panel-cloudFoundry"
        role="tabpanel"
        aria-labelledby="tab-cloudFoundry"
        hidden>
        <form style="margin: 2em">
          <legend class="${prefix}--label">Validation example</legend>
          <cds-checkbox
            id="cb"
            label-text="Accept privacy policy"></cds-checkbox>
          <cds-button
            style="margin-top: 1rem; margin-bottom: 1rem"
            type="submit">
            Submit
          </cds-button>
          <cds-text-input
            type="text"
            label="Text input label"
            helper-text="Optional help text"
            id="text-input-1"></cds-text-input>
        </form>
      </div>
      <div
        id="panel-staging"
        role="tabpanel"
        aria-labelledby="tab-staging"
        hidden>
        Tab Panel 3
      </div>
      <div id="panel-dea" role="tabpanel" aria-labelledby="tab-dea" hidden>
        Tab Panel 4
      </div>
      <div id="panel-five" role="tabpanel" aria-labelledby="tab-five" hidden>
        Tab Panel 5
      </div>
    </div>
  `,
};
```

**Variant: Icon20Only**

```html
export const Icon20Only = {
  args: iconStoriesArgs,
  argTypes: iconStoriesArgTypes,
  render: ({ badgeIndicator }) => html`
    <style>
      ${styles}
    </style>
    <cds-tabs
      value="icon20-tab-2"
      icon-size="${TABS_ICON_SIZE.LARGE}"
      class="cds--layout--size-lg">
      <cds-tab
        id="icon20-tab-1"
        target="icon20-panel-1"
        value="icon20-tab-1"
        icon-only
        disabled
        aria-label="Analyze">
        ${iconLoader(IbmWatsonDiscovery20)}
      </cds-tab>
      <cds-tab
        id="icon20-tab-2"
        target="icon20-panel-2"
        value="icon20-tab-2"
        icon-only
        aria-label="Activity">
        ${iconLoader(Activity20)}
      </cds-tab>
      <cds-tab
        id="icon20-tab-3"
        target="icon20-panel-3"
        value="icon20-tab-3"
        icon-only
        ?badge-indicator="${badgeIndicator}"
        aria-label="New Notifications">
        ${iconLoader(Notification20)}
      </cds-tab>
      <cds-tab
        id="icon20-tab-4"
        target="icon20-panel-4"
        value="icon20-tab-4"
        icon-only
        aria-label="Chat">
        ${iconLoader(Chat20)}
      </cds-tab>
    </cds-tabs>
    <div class="${prefix}-ce-demo-devenv--tab-panels">
      <div
        id="icon20-panel-1"
        role="tabpanel"
        aria-labelledby="icon20-tab-1"
        hidden>
        Tab Panel 1
      </div>
      <div
        id="icon20-panel-2"
        role="tabpanel"
        aria-labelledby="icon20-tab-2"
        hidden>
        Tab Panel 2
      </div>
      <div
        id="icon20-panel-3"
        role="tabpanel"
        aria-labelledby="icon20-tab-3"
        hidden>
        Tab Panel 3
      </div>
      <div
        id="icon20-panel-4"
        role="tabpanel"
        aria-labelledby="icon20-tab-4"
        hidden>
        Tab Panel 4
      </div>
    </div>
  `,
};
```

**Variant: IconOnly**

```html
export const IconOnly = {
  args: iconStoriesArgs,
  argTypes: iconStoriesArgTypes,
  render: ({ badgeIndicator }) => html`
    <style>
      ${styles}
    </style>
    <cds-tabs value="icon-tab-2" icon-size="${TABS_ICON_SIZE.DEFAULT}">
      <cds-tab
        id="icon-tab-1"
        target="icon-panel-1"
        value="icon-tab-1"
        icon-only
        disabled
        aria-label="Analyze">
        ${iconLoader(IbmWatsonDiscovery16)}
      </cds-tab>
      <cds-tab
        id="icon-tab-2"
        target="icon-panel-2"
        value="icon-tab-2"
        icon-only
        aria-label="Activity">
        ${iconLoader(Activity16)}
      </cds-tab>
      <cds-tab
        id="icon-tab-3"
        target="icon-panel-3"
        value="icon-tab-3"
        icon-only
        ?badge-indicator="${badgeIndicator}"
        aria-label="New Notifications">
        ${iconLoader(Notification16)}
      </cds-tab>
      <cds-tab
        id="icon-tab-4"
        target="icon-panel-4"
        value="icon-tab-4"
        icon-only
        aria-label="Chat">
        ${iconLoader(Chat16)}
      </cds-tab>
    </cds-tabs>
    <div class="${prefix}-ce-demo-devenv--tab-panels">
      <div
        id="icon-panel-1"
        role="tabpanel"
        aria-labelledby="icon-tab-1"
        hidden>
        Tab Panel 1
      </div>
      <div
        id="icon-panel-2"
        role="tabpanel"
        aria-labelledby="icon-tab-2"
        hidden>
        Tab Panel 2
      </div>
      <div
        id="icon-panel-3"
        role="tabpanel"
        aria-labelledby="icon-tab-3"
        hidden>
        Tab Panel 3
      </div>
      <div
        id="icon-panel-4"
        role="tabpanel"
        aria-labelledby="icon-tab-4"
        hidden>
        Tab Panel 4
      </div>
    </div>
  `,
};
```

**Variant: Manual**

```html
export const Manual = {
  render: () => {
    return html`
      <style>
        ${styles}
      </style>
      <cds-tabs
        value="all"
        selection-mode="manual"
        @cds-tabs-beingselected="${onTabsBeingSelected}"
        @cds-tabs-selected="${onTabsSelected}">
        <cds-tab id="tab-all" target="panel-all" value="all">Dashboard</cds-tab>
        <cds-tab
          id="tab-cloudFoundry"
          target="panel-cloudFoundry"
          value="cloudFoundry">
          Monitoring
        </cds-tab>
        <cds-tab
          id="tab-staging"
          target="panel-staging"
          value="staging"
          title="Tab label 4">
          Activity
        </cds-tab>
        <cds-tab id="tab-dea" target="panel-dea" value="dea">Analyze</cds-tab>
        <cds-tab id="tab-five" target="panel-five" value="five" disabled>
          Settings
        </cds-tab>
      </cds-tabs>
      <div class="${prefix}-ce-demo-devenv--tab-panels">
        <div id="panel-all" role="tabpanel" aria-labelledby="tab-all" hidden>
          Tab Panel 1
        </div>
        <div
          id="panel-cloudFoundry"
          role="tabpanel"
          aria-labelledby="tab-cloudFoundry"
          hidden>
          <form style="margin: 2em">
            <legend class="cds--label">Validation example</legend>
            <cds-checkbox
              id="cb"
              label-text="Accept privacy policy"></cds-checkbox>
            <cds-button
              style="margin-top: 1rem; margin-bottom: 1rem"
              type="submit">
              Submit
            </cds-button>
            <cds-text-input
              type="text"
              label="Text input label"
              helper-text="Optional help text"
              id="text-input-1"></cds-text-input>
          </form>
        </div>
        <div
          id="panel-staging"
          role="tabpanel"
          aria-labelledby="tab-staging"
          hidden>
          Tab Panel 3
        </div>
        <div id="panel-dea" role="tabpanel" aria-labelledby="tab-dea" hidden>
          Tab Panel 4
        </div>
        <div id="panel-five" role="tabpanel" aria-labelledby="tab-five" hidden>
          Tab Panel 5
        </div>
      </div>
    `;
  },
};
```

**Variant: skeleton** (lowercase export name in WC source)

```html
export const skeleton = {
  render: () => html`
    <cds-tabs-skeleton>
      <cds-tab-skeleton></cds-tab-skeleton>
      <cds-tab-skeleton></cds-tab-skeleton>
      <cds-tab-skeleton></cds-tab-skeleton>
      <cds-tab-skeleton></cds-tab-skeleton>
      <cds-tab-skeleton></cds-tab-skeleton>
    </cds-tabs-skeleton>
  `,
};
```

**Variant: WithIcons**

```html
export const WithIcons = {
  render: () => {
    return html`
      <style>
        ${styles}
      </style>
      <cds-tabs
        selection-mode="manual"
        value="icon-tab-1"
        icon-size="${TABS_ICON_SIZE.DEFAULT}">
        <cds-tab id="icon-tab-1" target="icon-panel-1" value="icon-tab-1">
          Dashboard ${iconLoader(Dashboard16)}
        </cds-tab>
        <cds-tab id="icon-tab-2" target="icon-panel-2" value="icon-tab-2">
          Monitoring ${iconLoader(CloudMonitoring16)}
        </cds-tab>
        <cds-tab id="icon-tab-3" target="icon-panel-3" value="icon-tab-3">
          Activity ${iconLoader(Activity16)}
        </cds-tab>
        <cds-tab id="icon-tab-4" target="icon-panel-4" value="icon-tab-4">
          Analyze ${iconLoader(IbmWatsonDiscovery16)}
        </cds-tab>
        <cds-tab
          id="icon-tab-5"
          target="icon-panel-5"
          value="icon-tab-5"
          disabled>
          Settings ${iconLoader(Settings16)}
        </cds-tab>
      </cds-tabs>
      <div class="${prefix}-ce-demo-devenv--tab-panels">
        <div
          id="icon-panel-1"
          role="tabpanel"
          aria-labelledby="icon-tab-1"
          hidden>
          Tab Panel 1
        </div>
        <div
          id="icon-panel-2"
          role="tabpanel"
          aria-labelledby="icon-tab-2"
          hidden>
          <form style="margin: 2em;">
            <legend class="${prefix}--label">Validation example</legend>
            <cds-checkbox
              id="cb"
              label-text="Accept privacy policy"></cds-checkbox>
            <cds-button
              style="margin-top: 1rem; margin-bottom: 1rem;"
              type="submit">
              Submit
            </cds-button>
            <cds-text-input
              label="Text input label"
              helper-text="Optional help text"
              id="text-input-1">
            </cds-text-input>
          </form>
        </div>
        <div
          id="icon-panel-3"
          role="tabpanel"
          aria-labelledby="icon-tab-3"
          hidden>
          Tab Panel 3
        </div>
        <div
          id="icon-panel-4"
          role="tabpanel"
          aria-labelledby="icon-tab-4"
          hidden>
          Tab Panel 4
        </div>
        <div
          id="icon-panel-5"
          role="tabpanel"
          aria-labelledby="icon-tab-5"
          hidden>
          Tab Panel 5
        </div>
      </div>
    `;
  },
};

export default {
  title: 'Components/Tabs',
  actions: { argTypesRegex: '^on.*' },
};
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section above, but with lit-html bindings (`${prefix}` → `cds`, `${ifDefined(...)}` → literal attributes, `${iconLoader(IconN)}` → inline `<svg>`) resolved to static HTML. Use this for hand-coded HTML without a component framework. The class names below come from the SCSS source — wrap the whole thing in `<div data-theme="white">` or `<div data-theme="g100">` to get the right theme tokens.

**Variant: Default (line tabs, automatic activation)**

```html
<div class="cds--tabs" role="tablist" aria-label="Tabs">
  <ul class="cds--tab--list">
    <li class="cds--tabs__nav-item cds--tabs__nav-item--selected" role="presentation">
      <button type="button" role="tab" id="tab-dashboard" class="cds--tabs__nav-link" aria-controls="panel-dashboard" aria-selected="true" tabindex="0">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Dashboard</span>
        </div>
      </button>
    </li>
    <li class="cds--tabs__nav-item" role="presentation">
      <button type="button" role="tab" id="tab-monitoring" class="cds--tabs__nav-link" aria-controls="panel-monitoring" aria-selected="false" tabindex="-1">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Monitoring</span>
        </div>
      </button>
    </li>
    <li class="cds--tabs__nav-item" role="presentation">
      <button type="button" role="tab" id="tab-activity" class="cds--tabs__nav-link" aria-controls="panel-activity" aria-selected="false" tabindex="-1">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Activity</span>
        </div>
      </button>
    </li>
    <li class="cds--tabs__nav-item" role="presentation">
      <button type="button" role="tab" id="tab-settings" class="cds--tabs__nav-link" aria-controls="panel-settings" aria-selected="false" tabindex="-1">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Settings</span>
        </div>
      </button>
    </li>
  </ul>
</div>
<div id="panel-dashboard" class="cds--tab-content" role="tabpanel" aria-labelledby="tab-dashboard" tabindex="0">Tab Panel 1</div>
<div id="panel-monitoring" class="cds--tab-content" role="tabpanel" aria-labelledby="tab-monitoring" tabindex="0" hidden>Tab Panel 2</div>
<div id="panel-activity" class="cds--tab-content" role="tabpanel" aria-labelledby="tab-activity" tabindex="0" hidden>Tab Panel 3</div>
<div id="panel-settings" class="cds--tab-content" role="tabpanel" aria-labelledby="tab-settings" tabindex="0" hidden>Tab Panel 4</div>
```

**Variant: Contained** — same DOM as Default but the outer container gets the extra modifier class `cds--tabs--contained`. Each `<li class="cds--tabs__nav-item">` becomes a filled `--cds-layer-accent-01` surface; the selected item gets `cds--tabs__nav-item--selected` (which the SCSS turns into `--cds-layer-01` fill + 2px top inset border in `--cds-border-interactive`). Disabled items add `cds--tabs__nav-item--disabled` plus `aria-disabled="true"` on the inner button. See the WC `Contained` block above for the canonical 5-tab example.

**Variant: Contained with secondary labels** — same as Contained above but each `<button class="cds--tabs__nav-link">` gets a sibling `<span class="cds--tabs__nav-item-secondary-label">(21/25)</span>` after the `cds--tabs__nav-item-label-wrapper`. Secondary label uses `label-01` typography (12px) with `min-block-size: 16px`. See `ContainedWithSecondaryLabels` React block for the canonical structure.

**Variant: IconOnly (16px)**

```html
<div class="cds--tabs cds--tabs__icon--default" role="tablist" aria-label="Icon tabs">
  <ul class="cds--tab--list">
    <li class="cds--tabs__nav-item cds--tabs__nav-item--icon-only cds--tabs__nav-item--selected" role="presentation">
      <button type="button" role="tab" id="icon-tab-1" class="cds--tabs__nav-link" aria-controls="icon-panel-1" aria-selected="true" aria-label="Activity" tabindex="0">
        <span class="cds--tabs__nav-item-label">
          <svg focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
            <!-- Activity 16 svg path -->
          </svg>
        </span>
      </button>
    </li>
    <li class="cds--tabs__nav-item cds--tabs__nav-item--icon-only" role="presentation">
      <button type="button" role="tab" id="icon-tab-2" class="cds--tabs__nav-link" aria-controls="icon-panel-2" aria-selected="false" aria-label="New Notifications" tabindex="-1">
        <span class="cds--tabs__nav-item-label">
          <svg focusable="false" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true" fill="currentColor">
            <!-- Notification 16 svg path -->
          </svg>
        </span>
        <span class="cds--badge-indicator" aria-hidden="true"></span>
      </button>
    </li>
    <li class="cds--tabs__nav-item cds--tabs__nav-item--icon-only cds--tabs__nav-item--disabled" role="presentation">
      <button type="button" role="tab" id="icon-tab-3" class="cds--tabs__nav-link" aria-controls="icon-panel-3" aria-selected="false" aria-disabled="true" aria-label="Analyze" tabindex="-1">
        <span class="cds--tabs__nav-item-label">
          <svg focusable="false" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true" fill="currentColor">
            <!-- IbmWatsonDiscovery 16 svg path -->
          </svg>
        </span>
      </button>
    </li>
  </ul>
</div>
```

For the 20px variant, swap the outer `cds--tabs__icon--default` for `cds--tabs__icon--lg`, add `class="cds--layout--size-lg"` to the outer container, and use `width="20" height="20"` on each svg (paths still use the `0 0 32 32` viewBox).

**Variant: Vertical**

```html
<div class="cds--tabs cds--tabs--vertical" role="tablist" aria-orientation="vertical" aria-label="Vertical tabs">
  <ul class="cds--tab--list">
    <li class="cds--tabs__nav-item cds--tabs__nav-item--selected" role="presentation">
      <button type="button" role="tab" id="vtab-1" class="cds--tabs__nav-link" aria-controls="vpanel-1" aria-selected="true" tabindex="0">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Dashboard</span>
        </div>
      </button>
    </li>
    <li class="cds--tabs__nav-item" role="presentation">
      <button type="button" role="tab" id="vtab-2" class="cds--tabs__nav-link" aria-controls="vpanel-2" aria-selected="false" tabindex="-1">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Extra long label that will go two lines then truncate when it goes beyond the Tab length</span>
        </div>
      </button>
    </li>
    <li class="cds--tabs__nav-item" role="presentation">
      <button type="button" role="tab" id="vtab-3" class="cds--tabs__nav-link" aria-controls="vpanel-3" aria-selected="false" tabindex="-1">
        <div class="cds--tabs__nav-item-label-wrapper">
          <span class="cds--tabs__nav-item-label">Activity</span>
        </div>
      </button>
    </li>
    <!-- ...Analyze, Investigate, Learn, disabled Settings... -->
  </ul>
  <span class="cds--tab--list-gradient_top" aria-hidden="true"></span>
  <span class="cds--tab--list-gradient_bottom" aria-hidden="true"></span>
</div>
<div id="vpanel-1" class="cds--tab-content" role="tabpanel" aria-labelledby="vtab-1" tabindex="0">
  Tab Panel 1
</div>
```

**Variant: Dismissable** — add `cds--tabs--dismissable` to the outer `cds--tabs` div, then for every tab `<li>` insert a sibling `<li class="cds--tabs__nav-item--close" role="presentation"><button type="button" class="cds--tabs__nav-item--close-icon" aria-label="Close tab <name>"><svg width="16" height="16" viewBox="0 0 32 32" fill="currentColor"><!-- Close 16 path --></svg></button></li>`. Disabled tabs use `cds--tabs__nav-item--close-icon--disabled` on the inner button. The dismissable Tab link itself gets `padding-inline-end: var(--cds-spacing-08)` (40px) on line, or `calc(var(--cds-spacing-09) - 1px)` (47px) on contained.

**Variant: Skeleton**

```html
<div class="cds--tabs cds--skeleton">
  <ul class="cds--tab--list">
    <li class="cds--tabs__nav-item">
      <div class="cds--tabs__nav-link"><span></span></div>
    </li>
    <li class="cds--tabs__nav-item">
      <div class="cds--tabs__nav-link"><span></span></div>
    </li>
    <li class="cds--tabs__nav-item">
      <div class="cds--tabs__nav-link"><span></span></div>
    </li>
    <li class="cds--tabs__nav-item">
      <div class="cds--tabs__nav-link"><span></span></div>
    </li>
  </ul>
</div>
```

## Design Tokens (component-scoped)

These are the literal hex values pulled from `overview.md` for the tokens that `_tabs.scss` references (`$text-primary`, `$text-secondary`, `$layer-accent`, `$border-interactive`, etc.). Wrap your tabs in the appropriate `[data-theme="..."]` block to apply them.

```css
[data-theme="white"] {
  /* Tabs container */
  --cds-tabs-background: #ffffff;                /* $background */
  --cds-tabs-text-primary: #161616;              /* $text-primary — selected label */
  --cds-tabs-text-secondary: #525252;            /* $text-secondary — rest label */
  --cds-tabs-text-disabled: rgba(22, 22, 22, 0.25); /* $tab-text-disabled (resolves to text-disabled) */

  /* Borders & active indicator */
  --cds-tabs-border-interactive: #0f62fe;        /* $border-interactive — active 2px line */
  --cds-tabs-border-strong: #8d8d8d;             /* $border-strong-01 — contained inter-tab seam + vertical hover rail */
  --cds-tabs-border-subtle: #e0e0e0;             /* $border-subtle-00 — vertical rail right edge + disabled bottom border */
  --cds-tabs-tab-underline-rest: transparent;    /* $tab-underline-color (no rest underline by default — set transparent) */
  --cds-tabs-tab-underline-hover: #8d8d8d;       /* $tab-underline-color-hover (border-strong-01 in white) */

  /* Container fill (contained variant) */
  --cds-tabs-layer-accent-rest: #e0e0e0;         /* $layer-accent-01 — contained tab rest fill */
  --cds-tabs-layer-accent-hover: #d1d1d1;        /* $layer-accent-hover-01 (1 step darker than accent-01) */
  --cds-tabs-layer-accent-active: #a8a8a8;       /* $layer-accent-active-01 */
  --cds-tabs-layer-selected: #f4f4f4;            /* $layer-01 — selected contained fill + panel background */

  /* Vertical rail */
  --cds-tabs-vertical-bg: #f4f4f4;               /* $layer-01 (rail base — light bg behind dark border) */
  --cds-tabs-vertical-hover: #e8e8e8;            /* $layer-hover-01 */

  /* Disabled (contained) */
  --cds-tabs-disabled-bg: #c6c6c6;               /* $button-disabled */
  --cds-tabs-disabled-text: #8d8d8d;             /* $text-on-color-disabled */

  /* Dismissable close button */
  --cds-tabs-close-icon-fill: #525252;           /* $text-secondary (svg fill at rest) */
  --cds-tabs-close-icon-fill-hover: #161616;     /* $icon-primary (svg fill on hover) */
  --cds-tabs-close-icon-bg-hover: #e8e8e8;       /* $layer-hover (close button background on hover) */
  --cds-tabs-close-icon-fill-disabled: rgba(22, 22, 22, 0.25); /* $icon-disabled */

  /* Focus */
  --cds-tabs-focus: #0f62fe;                     /* $focus */
  --cds-tabs-focus-inset: #ffffff;               /* $focus-inset */

  /* Skeleton */
  --cds-tabs-skeleton-element: #c6c6c6;          /* $skeleton-element */
}

/* G10 theme: identical to White above except --cds-tabs-background: #f4f4f4,
   --cds-tabs-border-subtle: #c6c6c6, --cds-tabs-layer-selected: #ffffff,
   --cds-tabs-vertical-bg: #ffffff. All other tokens unchanged. */

[data-theme="g100"],
.dark {
  --cds-tabs-background: #262626;                /* $background G100 */
  --cds-tabs-text-primary: #f4f4f4;              /* $text-primary G100 */
  --cds-tabs-text-secondary: #c6c6c6;            /* $text-secondary G100 */
  --cds-tabs-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-tabs-border-interactive: #4589ff;        /* $border-interactive G100 */
  --cds-tabs-border-strong: #a8a8a8;             /* $border-strong-01 G100 */
  --cds-tabs-border-subtle: #525252;             /* $border-subtle-00 G100 */
  --cds-tabs-tab-underline-rest: transparent;
  --cds-tabs-tab-underline-hover: #a8a8a8;       /* border-strong-01 G100 */
  --cds-tabs-layer-accent-rest: #525252;         /* $layer-accent-01 G100 */
  --cds-tabs-layer-accent-hover: #636363;        /* $layer-accent-hover-01 G100 */
  --cds-tabs-layer-accent-active: #8d8d8d;       /* $layer-accent-active-01 G100 */
  --cds-tabs-layer-selected: #393939;            /* $layer-01 G100 */
  --cds-tabs-vertical-bg: #393939;
  --cds-tabs-vertical-hover: #4c4c4c;            /* $layer-hover-01 G100 */
  --cds-tabs-disabled-bg: rgba(141, 141, 141, 0.3);  /* $button-disabled G100 */
  --cds-tabs-disabled-text: #6f6f6f;             /* $text-on-color-disabled G100 */
  --cds-tabs-close-icon-fill: #c6c6c6;
  --cds-tabs-close-icon-fill-hover: #f4f4f4;
  --cds-tabs-close-icon-bg-hover: #4c4c4c;
  --cds-tabs-close-icon-fill-disabled: rgba(244, 244, 244, 0.25);
  --cds-tabs-focus: #ffffff;                     /* $focus G100 */
  --cds-tabs-focus-inset: #262626;               /* $focus-inset G100 */
  --cds-tabs-skeleton-element: #525252;          /* $skeleton-element G100 */
}
```

## States Reference (from `_tabs.scss`)

> Values below are extracted directly from lines in `packages/styles/scss/components/tabs/_tabs.scss` (linked above). Where Carbon's SCSS uses semantic tokens (`$text-primary`, `$layer-accent`), the literal hex is shown for the **White theme** in the table — switch the `[data-theme="..."]` to apply G10/G100 variants from the token block above.

### Line tabs (default — `cds--tabs` without `cds--tabs--contained`)

| State | Background | Color (label) | Border-block-end | Other |
|---|---|---|---|---|
| Rest | transparent (inherits `$background` `#ffffff`) | `#525252` (`$text-secondary`) | `transparent` (`$tab-underline-color`) | `body-compact-01` 14/18/400 |
| Hover (non-selected, non-disabled) | transparent | `#161616` (`$text-primary`) | `#8d8d8d` (`$tab-underline-color-hover`, border-strong-01 in white) | cursor: pointer |
| Active (mouse-down on link) | transparent | `#161616` | `#8d8d8d` | `outline: 2px solid #0f62fe` (focus mixin), `outline-offset: -2px` |
| Focus-visible | transparent | `#525252` | `transparent` | `outline: 2px solid #0f62fe`, `outline-offset: -2px` (focus-outline mixin), inset 1px `$focus-inset` (`#ffffff`) |
| Selected | transparent | `#161616` | `2px solid #0f62fe` (`$border-interactive`) | `heading-compact-01` 14/18/600 — Carbon switches type style on selection |
| Disabled | transparent | `rgba(22,22,22,0.25)` (`$tab-text-disabled`) | `2px solid #e0e0e0` (`$border-subtle`) | `cursor: not-allowed`, `outline: none`, `pointer-events` cleared |

### Contained tabs (`cds--tabs--contained`)

| State | Background | Color (label) | Border / Box-shadow | Other |
|---|---|---|---|---|
| Rest | `#e0e0e0` (`$layer-accent-01`) | `#525252` | `box-shadow: -1px 0 0 0 #8d8d8d` (`$border-strong-01`) — left seam between tabs | no `border-block-end` |
| Hover (non-selected, non-disabled) | `#d1d1d1` (`$layer-accent-hover-01`) | `#161616` | (rest seam) | — |
| Active | `#a8a8a8` (`$layer-accent-active-01`) | `#161616` | (rest seam) | — |
| Focus-visible | (rest) | (rest) | + `outline: 2px solid #0f62fe`, `outline-offset: -2px` | inset 1px `$focus-inset` |
| Selected | `#f4f4f4` (`$layer-01`) | `#161616` (heading-compact-01) | `box-shadow: inset 0 2px 0 0 #0f62fe` — top inset border in `$border-interactive`. Adjacent right tab loses its left seam (`box-shadow: -1px 0 0 0 transparent`) | line-height: `calc(48px - 16px)` = 32px |
| Disabled | `#c6c6c6` (`$button-disabled`) | `#8d8d8d` (`$text-on-color-disabled`) | no border-block-end | `cursor: not-allowed` |
| Selected (light variant `cds--tabs--light`) | `#ffffff` (`$background`) | `#161616` | (selected box-shadow) | — |

### Icon-only tabs (`cds--tabs__nav-item--icon-only`)

| State | Background | Icon fill | Other |
|---|---|---|---|
| Rest | transparent | `#525252` (currentColor → `$text-secondary`) | dimensions square, `block-size = inline-size = layout.size('height')` (48px md) |
| Hover | transparent | `#161616` | tooltip appears with `label` text |
| Selected | transparent | `#161616` | `border-block-end: 2px solid #0f62fe` (line behavior preserved on icon-only) |
| Focus | (rest) | (rest) | `outline: 2px solid #0f62fe`, `outline-offset: -2px` |
| Disabled | transparent | `rgba(22,22,22,0.25)` (`$icon-disabled`) | `cursor: not-allowed` |
| Badge (3rd story tab, `?badge-indicator`) | transparent | (rest) | 8px dot at `margin-block-start: 4px; margin-inline-end: 4px` (top-right) |

### Vertical tabs (`cds--tabs--vertical`)

| State | Background | Color | Box-shadow | Other |
|---|---|---|---|---|
| Rail container | `#f4f4f4` (`$layer-01`) | — | `inset -1px 0 #e0e0e0` (right edge — `$border-subtle`) | `grid-column: span 2` (sm/md), `span 4` (lg) |
| Rest item | `#f4f4f4` (`$layer-01`) | `#525252` | `inset 3px 0 0 0 #e0e0e0` (left edge — `$border-subtle`) | `block-size: 64px` (`spacing-10`), `border-block-end: 1px solid $border-subtle`, `border-inline-end: 1px solid $border-subtle` |
| Hover (non-selected) | `#e8e8e8` (`$layer-hover-01`) | `#161616` | `inset 3px 0 0 0 #8d8d8d` (`$border-strong-01`) | — |
| Selected | `#f4f4f4` | `#161616` (heading-compact-01) | `inset 3px 0 0 0 #0f62fe` (`$border-interactive`) | `border-inline: none` (replaces side borders with the indicator) |
| Disabled | `#f4f4f4` | `rgba(22,22,22,0.25)` | (rest) | `border-block-end: 1px solid #e0e0e0` |
| Long-label clamp | — | — | — | `display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; white-space: normal` |

### Dismissable extras

| Element | Property | Value |
|---|---|---|
| Tab link extra right padding (line) | `padding-inline-end` | `var(--cds-spacing-08)` = 40px |
| Tab link extra right padding (contained) | `padding-inline-end` | `calc(var(--cds-spacing-09) - 1px)` = 47px |
| Close button | `block-size` × `inline-size` | 24px × 24px |
| Close button padding | `padding-block` / `padding-inline` | `var(--cds-spacing-02)` = 4px both axes |
| Close icon svg size | `block-size` × `inline-size` | 16px × 16px |
| Close icon fill (rest) | `fill` | `$text-secondary` (`#525252` light / `#c6c6c6` dark) |
| Close icon fill (hover on tab or icon) | `fill` | `$icon-primary` (`#161616` light / `#f4f4f4` dark) |
| Close button hover bg | `background-color` | `$layer-hover` (`#e8e8e8` light / `#4c4c4c` dark) |
| Close icon (disabled) | `fill` | `$icon-disabled`; `cursor: not-allowed`; `background-color: inherit` |

### Overflow nav buttons (when tabs scroll horizontally)

| Variant | Width | Background (rest) | Background (hover) | Background (active) | Icon fill |
|---|---|---|---|---|---|
| Line | `var(--cds-spacing-08)` (40px) | `$background` (`#ffffff` white) | `$background-hover` (`rgba(141,141,141,0.12)`) | `$background-active` (`rgba(141,141,141,0.5)`) | `$icon-primary` |
| Contained | `var(--cds-spacing-09)` (48px) | `$layer-accent` (`#e0e0e0` white) | `$layer-accent-hover` (`#d1d1d1`) | `$layer-accent-active` (`#a8a8a8`) | `$icon-primary` |

### Skeleton

| Element | Property | Value |
|---|---|---|
| Container | `cursor` | `default` |
| Container | `pointer-events` | `none` |
| Tab link | `inline-size` | `10rem` (160px) |
| Tab link | `padding` | `0 var(--cds-layout-density-padding-inline)` (16px sides at default) |
| Inner span | `block-size` | `14px` |
| Inner span | `background` | `$skeleton-element` (`#c6c6c6` light / `#525252` dark) — animated by skeleton mixin |
| Underline (line, no contained) | `border-block-end` | `2px solid $skeleton-element` |

## Animation & Motion

Carbon's source uses these motion tokens for tabs (extracted from `_tabs.scss` lines 322–323 and 356–360):

```css
/* Item-level transition (background swap on hover/selection) */
.cds--tabs__nav-item {
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
  /* duration-fast-01 = 70ms; productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

/* Link-level transition (color, underline, focus outline) */
.cds--tabs__nav-item .cds--tabs__nav-link {
  transition:
    color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    border-bottom-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* When the tab becomes selected, color transitions in 70ms */
.cds--tabs__nav-item--selected {
  transition: color var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Link border + outline transitions (override on .cds--tabs__nav-link) */
.cds--tabs__nav-link {
  transition:
    border var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Vertical rail uses smooth scroll for keyboard nav */
.cds--tabs .cds--tab--list {
  scroll-behavior: smooth;
  will-change: scroll-position;
}

@media (prefers-reduced-motion: reduce) {
  .cds--tabs__nav-item,
  .cds--tabs__nav-item--selected,
  .cds--tabs__nav-link {
    transition: none;
  }
  .cds--tabs .cds--tab--list {
    scroll-behavior: auto;
  }
}
```

Carbon's tabs deliberately use Productive motion (fast feedback) — no expressive entrances. The 70ms duration matches the `Tab switch` row in the overview's motion table where it's noted as `moderate-01` 150ms for cross-panel transitions; the 70ms here covers the local hover/select feedback. Panel content does NOT animate in by default — appearance is instant on selection.

## Accessibility (from Carbon's docs + source)

- **Semantic structure:**
  - Outer container: `<div class="cds--tabs" role="tablist">` (or `<cds-tabs>` web component) — Carbon's source uses a `<ul class="cds--tab--list">` internally with `<li class="cds--tabs__nav-item" role="presentation">` wrappers so the `role="tab"` button is the focusable element.
  - Each tab: `<button type="button" role="tab" id="..." aria-controls="<panel-id>" aria-selected="true|false" tabindex="0|-1">`. Only the selected tab has `tabindex="0"`; all others have `tabindex="-1"` (single-tab-stop pattern).
  - Each panel: `<div role="tabpanel" id="..." aria-labelledby="<tab-id>" tabindex="0">`. Carbon makes panels focusable so screen-reader users can scroll/read them after activating the tab.
  - Vertical orientation: add `aria-orientation="vertical"` to the `tablist`. Carbon's `TabsVertical` does this automatically.

- **ARIA attributes Carbon's source applies:**
  - `aria-selected="true"` on the active tab; `"false"` on others.
  - `aria-disabled="true"` on disabled tabs (in addition to the visual `cds--tabs__nav-item--disabled` class).
  - `aria-controls="<panel-id>"` linking each tab to its panel.
  - `aria-labelledby="<tab-id>"` on each panel pointing back to its tab.
  - `aria-label` on icon-only tabs (the `label` prop in React's `<IconTab>` becomes `aria-label` on the `<button role="tab">`).
  - `aria-label` on overflow nav buttons (e.g., `aria-label="Scroll left"`).
  - `aria-label="Close tab <tab name>"` on dismissable close buttons.

- **Keyboard interaction (line + contained, horizontal):**
  - `Tab` — moves focus into the tablist (lands on the selected tab) and out of the tablist after the focused tab.
  - `Left arrow` / `Right arrow` — moves focus between tabs. With default `activation="automatic"` (React) / `selection-mode="automatic"` (WC), the panel switches as focus moves. With `activation="manual"`, focus moves but the panel does NOT switch — press `Enter` or `Space` to activate.
  - `Home` — focus the first tab (and activate if automatic).
  - `End` — focus the last tab (and activate if automatic).
  - `Enter` / `Space` — activate the focused tab (required only in manual mode; harmless in automatic).
  - `Delete` (dismissable) — closes the focused tab if `dismissable` is true.

- **Keyboard interaction (vertical):**
  - Same as above but `Up arrow` / `Down arrow` replace Left/Right.

- **Focus management:**
  - Carbon uses `:focus-visible` with the signature 2px outline in `--cds-focus` and an inset 1px `--cds-focus-inset` ring (via the `focus-outline('outline')` SCSS mixin). `outline-offset: -2px` puts the ring inside the tab's bounding box so adjacent tabs aren't visually shifted. **DO NOT remove the outline** — it's WCAG 2.1 AA required.
  - When a dismissable tab is closed and that tab was selected, Carbon's React handler picks the next non-disabled tab and moves focus + selection there in one step.

- **Touch target:** Carbon's default `md` density gives a 48px tab height — already meets the WCAG 2.5.5 (Target Size) 44×44px minimum. The dismissable close button is 24×24px (below 44px), so on touch devices wrap it in a `min-height: 44px; min-width: 44px` outer hit area or use the `lg` density for the whole tablist.

- **Screen reader behavior:**
  - The `cds--tabs__nav-item-secondary-label` is read inline after the primary label (e.g., "Engage 21 of 25"). Use parens like `(21/25)` and a punctuation pause — Carbon's storybook examples do this.
  - Skeleton tabs are silent (the inner `<span>` has no text content); pair the skeleton with a live region announcing "Loading tabs" if the load is more than ~500ms.
  - Icon-only tabs MUST have a `label` prop — otherwise the screen reader will announce nothing.

- **High-contrast mode (Windows HCM):** Carbon ships explicit `@include high-contrast-mode` blocks that map the selected tab to `SelectedItem` and disabled tabs to the system disabled colors — no extra work needed when using the source CSS.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs (use the verbatim React or WC blocks above) | Don't paraphrase or rewrite — use the embedded source |
| Pick `manual` activation when any panel contains a form, modal trigger, or non-trivial interactive content | Don't use `automatic` activation for forms — arrow-key focus changes will discard partially-entered state |
| Use the Carbon Vertical variant (`<TabsVertical>` / `cds--tabs--vertical`) when you have ≥ 6 tabs OR when tabs are a primary navigation rail | Don't squeeze 8+ tabs into a horizontal line tab strip — let it scroll OR switch to vertical |
| Use Contained tabs when each panel is its own surface (settings sub-page, dashboard tab) | Don't use Contained inside an already-contained card — the double surface creates ambiguous depth |
| Use Icon-only tabs (`<IconTab>` / `icon-only`) only with a `label` prop for the tooltip and screen reader | Don't omit `label` — icon-only tabs without labels are unusable for assistive tech |
| Use Dismissable tabs for browser-tab metaphor (transient document tabs) | Don't use Dismissable for navigation — settings panes, dashboard tabs, and primary nav should not be closable |
| Pair `secondaryLabel` with parens like `(21/25)` for screen-reader rhythm | Don't use a long secondary label — Carbon clamps it but the layout breaks past ~12 chars |
| Sharp corners (`border-radius: 0`) — the 2px active border is the only depth signal | Don't add `border-radius` to tabs |
| Use `cds--*` class names from the WC source verbatim | Don't invent your own classes (e.g., `tabs--active`) — the SCSS hooks expect Carbon's exact selectors |
| Wrap in `[data-theme="white"]` / `[data-theme="g10"]` / `[data-theme="g100"]` to switch themes | Don't define your own theme classes — Carbon's tokens key off `data-theme` |
| Set `aria-selected="true"` on exactly one tab at a time | Don't set `aria-selected` on multiple tabs — only one can be active |
| Use `tabindex="0"` only on the selected tab, `tabindex="-1"` on the rest (single-tab-stop pattern) | Don't make every tab tab-stoppable — that breaks the standard tablist keyboard pattern |
| For long horizontal tab strips, let Carbon's overflow nav buttons appear automatically (the SCSS handles it) | Don't manually wrap a tab strip in a scrolling div — Carbon's `cds--tab--overflow-nav-button` mechanism handles the gradient + chevron buttons |
| Use the `Vertical` variant inside a `<Grid>` with `grid-column: span 2` (or `span 4` at lg) for the rail | Don't fix a vertical tab rail to a px width — the SCSS uses CSS Grid spans so it adapts to breakpoints |
