---
name: tree-view
description: Carbon TreeView — hierarchical, navigable list of collapsible parent / leaf nodes (xs / sm sizes; optional per-node icons; optional links variant; selection + active "rail" indicator); embeds verbatim Storybook source for Default, WithIcons, WithControlledExpansion, WithLinks, and WithComplexNesting variants
metadata:
  tags: tree-view, tree, treeview, hierarchy, navigation, sidebar, file-tree, ibm, carbon, react, web-components
---

# Tree View -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Treeview.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TreeView/Treeview.stories.js) (note: filename uses lowercase `v` — `Treeview`, not `TreeView`)
> - **WC story:** [`tree-view.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/tree-view/tree-view.stories.ts)
> - **SCSS source:** [`_treeview.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/treeview/_treeview.scss) (note: SCSS folder is `treeview` — no hyphen — even though the WC tag is `cds-tree-view`)
> - **React component:** [`TreeView.tsx`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TreeView/TreeView.tsx) + [`TreeNode.tsx`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TreeView/TreeNode.tsx)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-treeview--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-treeview--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/tree-view/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

> **Note on story exports:** Phase 4 plan lists `Default`, `WithIcons`, `WithControlledExpansion` as expected exports. The current `Treeview.stories.js` on `main` exports **5 stories** (`Default`, `WithIcons`, `WithLinks`, `WithControlledExpansion`, `WithComplexNesting`). The current `tree-view.stories.ts` (WC) exports **4 stories** (`Default`, `withControlledExpansion`, `withIcons`, `withLinks`). Both extra React stories (`WithLinks`, `WithComplexNesting`) and the WC `withLinks` are documented below for completeness.

> **Note on token naming:** Carbon's token files (`overview.md` and the runtime CSS) emit `--cds-*` custom properties (e.g., `--cds-layer-01`). The component SCSS in `_treeview.scss` references SCSS variables (`$layer-01`, `$text-secondary`, etc.) that compile to the same `--cds-*` tokens. This file uses the `--cds-*` prefix everywhere because that is what consumers see in the rendered DOM.

## Quick Reference

| Property | Value |
|---|---|
| Sizes (xs / sm row height — `min-block-size` on `.cds--tree-node__label`) | `24px` (xs) / `32px` (sm — default) |
| Default size | `sm` (`32px` row) — `size = 'sm'` in `TreeView.tsx`; WC default also `sm` |
| Per-level indent (default, no icons) | `$spacing-05` = `16px` (`padding-inline-start` on `.cds--tree-node`); leaf nodes get `$spacing-08` = `40px` so leaf labels align under parent labels |
| Per-level indent (with icons) | First-level nodes still `$spacing-05` = `16px`; children of an icon-bearing parent shift by `$spacing-03` = `8px` (`margin-inline-start` on `.cds--tree-node--with-icon .cds--tree-node`); leaf-with-icon padding `$spacing-07` = `32px`; leaf-with-icon nested under leaf-with-icon `$spacing-06` = `24px` |
| Chevron toggle button | `24px` × `24px` (`block-size: 1.5rem; inline-size: 1.5rem`); `margin-inline: -$spacing-02 $spacing-02` (= `-4px` start / `8px` end); `padding-inline-start: $spacing-02` (`4px`) |
| Chevron icon | `16px` × `16px` chevron-right SVG (`@carbon/icons` `chevron--right` 16); fill = `var(--cds-icon-secondary)` rest, `var(--cds-icon-primary)` hover, `var(--cds-icon-disabled)` disabled |
| Chevron rotation (collapsed) | `transform: rotate(-90deg)` (chevron points RIGHT) — class `.cds--tree-parent-node__toggle-icon` |
| Chevron rotation (expanded) | `transform: rotate(0)` (chevron points DOWN) — class `.cds--tree-parent-node__toggle-icon--expanded`. Net rotation 90° |
| Chevron transition | `all var(--cds-duration-fast-02) var(--cds-easing-productive-standard)` (110ms productive standard) |
| Optional node icon (slot before label) | `16px` × `16px` (`min-block-size: 1rem; min-inline-size: 1rem`); `margin-inline: $spacing-03 $spacing-03` (= `8px` left / `8px` right); fill = `var(--cds-icon-secondary)` rest, `var(--cds-icon-primary)` hover/selected |
| Label type style | `body-compact-01` — IBM Plex Sans `14px` / `18px` line-height / `400` weight / `0.16px` letter-spacing |
| Label text-overflow | `overflow: hidden; text-overflow: ellipsis; white-space: nowrap` (truncate single line) |
| Label padding (parent node) | Padded only by the chevron toggle's margin; `padding-inline-end: 1rem` (`16px`) on `.cds--tree-node__label` |
| Label padding (leaf node, sm) | `padding-block: 7px 7px` ((min-height 32px - text height 18px) / 2 — exact comment in source) |
| Label padding (leaf node, xs) | `padding: 0` (text fills the 24px row exactly) |
| Border radius | `0` (Carbon: sharp by default — applies to label, hover bg, selected bg, focus outline, active rail) |
| Rest background (label) | `transparent` — the `.cds--tree-node` ancestor sets `background-color: var(--cds-layer-01)` |
| Hover background (label) | `var(--cds-layer-hover-01)` (= `#e8e8e8` White, `#333333` G100) |
| Selected background (label) | `var(--cds-layer-selected-01)` (= `#e0e0e0` White, `#525252` G100) |
| Selected hover background | `var(--cds-layer-selected-hover-01)` |
| Active "rail" indicator | `4px` × `100%` block of `var(--cds-interactive)` (= `#0f62fe` light, `#4589ff` dark) painted as a `::before` pseudo on the selected label, `inset-inline-start: 0` |
| Focus ring | `2px` solid `var(--cds-focus)` outline applied via `@include focus-outline('outline')` on `.cds--tree-node:focus > .cds--tree-node__label` (no inset shadow on this component — it's a single-ring outline) |
| Disabled background | `var(--cds-field-01)` (= `#f4f4f4` White, `#262626` G100); `cursor: not-allowed` |
| Disabled text | `var(--cds-text-disabled)` (= `rgba(22,22,22,0.25)` White, `rgba(244,244,244,0.25)` G100) |
| Disabled icon / chevron | `var(--cds-icon-disabled)` (same alpha as text-disabled) |
| Container | `.cds--tree` — `overflow: hidden`; no padding; takes full width of its parent |
| React import | `import { TreeView, TreeNode } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/tree-view/index.js';` |
| WC tag | `<cds-tree-view>` + `<cds-tree-node>` |

## Variants (from Storybook story exports)

Every story export found in `Treeview.stories.js` (React) and `tree-view.stories.ts` (WC):

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Seven top-level nodes, two of which are pre-expanded (`Cloud computing`, `Data & Analytics`) and one of which is pre-expanded but disabled (`Models`). Demonstrates the `sm` size default, no icons, the sharp focus outline, the `Models` disabled cascade, and the `Resources` deep-nested leaf (4 levels deep) |
| WithIcons | `WithIcons` | `withIcons` | Same node tree, but each leaf gets a `<Document>` icon and each parent gets a `<Folder>` icon (16px each), passed via the `renderIcon` prop (React) or the `slot="icon"` slot (WC) |
| WithControlledExpansion | `WithControlledExpansion` | `withControlledExpansion` | Same node tree wrapped with two `<Button>`s ("Expand all" / "Collapse all") that drive a single `expanded` state, propagated to every `TreeNode` via the recursive `renderTree` helper. Demonstrates programmatic control of `isExpanded` |
| WithLinks | `WithLinks` | `withLinks` | Same node tree where every node carries an `href` (React) or `href` attribute (WC) — Carbon renders the row as a real `<a>` instead of a `<div>`/`<button>`, so middle-click and right-click "open in new tab" work. Pre-selects node `1` (`Artificial intelligence`) with `selected={['1']}` + `active="1"` to show the active rail |
| WithComplexNesting | `WithComplexNesting` | — (not present in WC) | Demonstrates two unusual nesting patterns: (1) a `<TreeNode>` wrapped in a plain `<div>`, (2) a `<TreeNode>` rendered from an imported component (`<Nested />`). Carbon's `TreeView` walks past these wrappers and still binds the inner `<TreeNode>`s as treeitems. Defaults to `multiselect: true` and `selected: ['1-1']` to show multiselect highlighting |

> The React file's `default` export sets `args.onSelect = action('onSelect')` so every story logs selection events to the Storybook actions panel.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Treeview.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + helpers + default export** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { action } from 'storybook/actions';
import { Document, Folder } from '@carbon/icons-react';
import { default as TreeView, TreeNode } from './';
import { Button } from '../Button/index';
import mdx from './TreeView.mdx';

import './story.scss';
import TextInput from '../TextInput';

function renderTree({ nodes, expanded, withIcons = false, withLinks = false }) {
  if (!nodes) {
    return;
  }
  return nodes.map(
    ({ children, renderIcon, href, isExpanded, ...nodeProps }) => (
      <TreeNode
        key={nodeProps.id}
        renderIcon={withIcons ? renderIcon : null}
        href={withLinks ? href : null}
        isExpanded={expanded ?? isExpanded}
        onClick={withLinks ? (event) => event.preventDefault() : null} // This is so that we only simulate links within the storybook
        {...nodeProps}>
        {renderTree({ nodes: children, expanded, withIcons, withLinks })}
      </TreeNode>
    )
  );
}

export default {
  title: 'components/TreeView',
  component: TreeView,
  subcomponents: {
    TreeNode,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['label'],
    },
  },
  args: {
    onSelect: action('onSelect'),
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const nodes = [
    {
      id: '1',
      value: 'Application development and integration solutions',
      label: 'Application development and integration solutions',
      renderIcon: Document,
    },
    {
      id: '2',
      value: 'Blockchain',
      label: 'Blockchain',
      renderIcon: Document,
    },
    {
      id: '3',
      value: 'Business automation',
      label: 'Business automation',
      renderIcon: Folder,
      children: [
        {
          id: '3-1',
          value: 'Business process automation',
          label: 'Business process automation',
          renderIcon: Document,
        },
        {
          id: '3-2',
          value: 'Business process mapping',
          label: 'Business process mapping',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '4',
      value: 'Business operations',
      label: 'Business operations',
      renderIcon: Document,
    },
    {
      id: '5',
      value: 'Cloud computing',
      label: 'Cloud computing',
      isExpanded: true,
      renderIcon: Folder,
      children: [
        {
          id: '5-1',
          value: 'Containers',
          label: 'Containers',
          renderIcon: Document,
        },
        {
          id: '5-2',
          value: 'Databases',
          label: 'Databases',
          renderIcon: Document,
        },
        {
          id: '5-3',
          value: 'DevOps',
          label: 'DevOps',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '5-4',
              value: 'Solutions',
              label: 'Solutions',
              renderIcon: Document,
            },
            {
              id: '5-5',
              value: 'Case studies',
              label: 'Case studies',
              isExpanded: true,
              renderIcon: Folder,
              children: [
                {
                  id: '5-6',
                  value: 'Resources',
                  label: 'Resources',
                  renderIcon: Document,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      id: '6',
      value: 'Data & Analytics',
      label: 'Data & Analytics',
      renderIcon: Folder,
      children: [
        {
          id: '6-1',
          value: 'Big data',
          label: 'Big data',
          renderIcon: Document,
        },
        {
          id: '6-2',
          value: 'Business intelligence',
          label: 'Business intelligence',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '7',
      value: 'Models',
      label: 'Models',
      isExpanded: true,
      disabled: true,
      renderIcon: Folder,
      children: [
        {
          id: '7-1',
          value: 'Audit',
          label: 'Audit',
          renderIcon: Document,
        },
        {
          id: '7-2',
          value: 'Monthly data',
          label: 'Monthly data',
          renderIcon: Document,
        },
        {
          id: '8',
          value: 'Data warehouse',
          label: 'Data warehouse',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '8-1',
              value: 'Report samples',
              label: 'Report samples',
              renderIcon: Document,
            },
            {
              id: '8-2',
              value: 'Sales performance',
              label: 'Sales performance',
              renderIcon: Document,
            },
          ],
        },
      ],
    },
  ];

  function renderTree({ nodes, expanded, withIcons = false }) {
    if (!nodes) {
      return;
    }
    return nodes.map(({ children, renderIcon, isExpanded, ...nodeProps }) => (
      <TreeNode
        key={nodeProps.id}
        renderIcon={withIcons ? renderIcon : null}
        isExpanded={expanded ?? isExpanded}
        {...nodeProps}>
        {renderTree({ nodes: children, expanded, withIcons })}
      </TreeNode>
    ));
  }
  return (
    <TreeView label="Tree View" {...args}>
      {renderTree({ nodes })}
    </TreeView>
  );
};

Default.args = {
  hideLabel: false,
  multiselect: false,
};

Default.argTypes = {
  active: { control: { type: 'text' } },
  size: {
    options: ['xs', 'sm'],
    control: { type: 'select' },
  },
};
```

**Variant: WithIcons**

```jsx
export const WithIcons = () => {
  const nodes = [
    {
      id: '1',
      value: 'Artificial intelligence',
      label: <span>Artificial intelligence</span>,
      renderIcon: Document,
    },
    {
      id: '2',
      value: 'Blockchain',
      label: 'Blockchain',
      renderIcon: Document,
    },
    {
      id: '3',
      value: 'Business automation',
      label: 'Business automation',
      renderIcon: Folder,
      children: [
        {
          id: '3-1',
          value: 'Business process automation',
          label: 'Business process automation',
          renderIcon: Document,
        },
        {
          id: '3-2',
          value: 'Business process mapping',
          label: 'Business process mapping',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '4',
      value: 'Business operations',
      label: 'Business operations',
      renderIcon: Document,
    },
    {
      id: '5',
      value: 'Cloud computing',
      label: 'Cloud computing',
      isExpanded: true,
      renderIcon: Folder,
      children: [
        {
          id: '5-1',
          value: 'Containers',
          label: 'Containers',
          renderIcon: Document,
        },
        {
          id: '5-2',
          value: 'Databases',
          label: 'Databases',
          renderIcon: Document,
        },
        {
          id: '5-3',
          value: 'DevOps',
          label: 'DevOps',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '5-4',
              value: 'Solutions',
              label: 'Solutions',
              renderIcon: Document,
            },
            {
              id: '5-5',
              value: 'Case studies',
              label: 'Case studies',
              isExpanded: true,
              renderIcon: Folder,
              children: [
                {
                  id: '5-6',
                  value: 'Resources',
                  label: 'Resources',
                  renderIcon: Document,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      id: '6',
      value: 'Data & Analytics',
      label: 'Data & Analytics',
      renderIcon: Folder,
      children: [
        {
          id: '6-1',
          value: 'Big data',
          label: 'Big data',
          renderIcon: Document,
        },
        {
          id: '6-2',
          value: 'Business intelligence',
          label: 'Business intelligence',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '7',
      value: 'Models',
      label: 'Models',
      isExpanded: true,
      disabled: true,
      renderIcon: Folder,
      children: [
        {
          id: '7-1',
          value: 'Audit',
          label: 'Audit',
          renderIcon: Document,
        },
        {
          id: '7-2',
          value: 'Monthly data',
          label: 'Monthly data',
          renderIcon: Document,
        },
        {
          id: '8',
          value: 'Data warehouse',
          label: 'Data warehouse',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '8-1',
              value: 'Report samples',
              label: 'Report samples',
              renderIcon: Document,
            },
            {
              id: '8-2',
              value: 'Sales performance',
              label: 'Sales performance',
              renderIcon: Document,
            },
          ],
        },
      ],
    },
  ];

  function renderTree({ nodes, expanded, withIcons = false }) {
    if (!nodes) {
      return;
    }
    return nodes.map(({ children, renderIcon, isExpanded, ...nodeProps }) => (
      <TreeNode
        key={nodeProps.id}
        renderIcon={withIcons ? renderIcon : null}
        isExpanded={expanded ?? isExpanded}
        {...nodeProps}>
        {renderTree({ nodes: children, expanded, withIcons })}
      </TreeNode>
    ));
  }
  return (
    <TreeView label="Tree View">
      {renderTree({ nodes, withIcons: true })}
    </TreeView>
  );
};
```

**Variant: WithLinks** (extra story not in the original Phase 4 list — included for completeness)

```jsx
const TreeViewWithLinks = React.memo(({ setCurrentPage }) => {
  const nodes = [
    {
      id: '1',
      value: 'Artificial intelligence',
      label: <span>Artificial intelligence</span>,
      href: '/artificial-intelligence',
      renderIcon: Document,
    },
    {
      id: '2',
      value: 'Blockchain',
      label: 'Blockchain',
      href: '/blockchain',
      renderIcon: Document,
    },
    {
      id: '3',
      value: 'Business automation',
      label: 'Business automation',
      href: '/business-automation',
      renderIcon: Folder,
      children: [
        {
          id: '3-1',
          value: 'Business process automation',
          label: 'Business process automation',
          href: '/business-process-automation',
          renderIcon: Document,
        },
        {
          id: '3-2',
          value: 'Business process mapping',
          label: 'Business process mapping',
          href: '/business-process-mapping',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '4',
      value: 'Business operations',
      label: 'Business operations',
      href: '/business-operations',
      renderIcon: Document,
    },
    {
      id: '5',
      value: 'Cloud computing',
      label: 'Cloud computing',
      href: '/cloud-computing',
      isExpanded: true,
      renderIcon: Folder,
      children: [
        {
          id: '5-1',
          value: 'Containers',
          label: 'Containers',
          href: '/containers',
          renderIcon: Document,
        },
        {
          id: '5-2',
          value: 'Databases',
          label: 'Databases',
          href: '/databases',
          renderIcon: Document,
        },
        {
          id: '5-3',
          value: 'DevOps',
          label: 'DevOps',
          href: '/devops',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '5-4',
              value: 'Solutions',
              label: 'Solutions',
              href: '/solutions',
              renderIcon: Document,
            },
            {
              id: '5-5',
              value: 'Case studies',
              label: 'Case studies',
              href: '/case-studies',
              isExpanded: true,
              renderIcon: Folder,
              children: [
                {
                  id: '5-6',
                  value: 'Resources',
                  label: 'Resources',
                  href: '/resources',
                  renderIcon: Document,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      id: '6',
      value: 'Data & Analytics',
      label: 'Data & Analytics',
      href: '/data-analytics',
      renderIcon: Folder,
      children: [
        {
          id: '6-1',
          value: 'Big data',
          label: 'Big data',
          href: '/big-data',
          renderIcon: Document,
        },
        {
          id: '6-2',
          value: 'Business intelligence',
          label: 'Business intelligence',
          href: '/business-intelligence',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '7',
      value: 'Models',
      label: 'Models',
      href: '/models',
      isExpanded: true,
      disabled: true,
      renderIcon: Folder,
      children: [
        {
          id: '7-1',
          value: 'Audit',
          label: 'Audit',
          href: '/audit',
          renderIcon: Document,
        },
        {
          id: '7-2',
          value: 'Monthly data',
          label: 'Monthly data',
          href: '/monthly-data',
          renderIcon: Document,
        },
        {
          id: '8',
          value: 'Data warehouse',
          label: 'Data warehouse',
          href: '/data-warehouse',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '8-1',
              value: 'Report samples',
              label: 'Report samples',
              href: '/report-samples',
              renderIcon: Document,
            },
            {
              id: '8-2',
              value: 'Sales performance',
              label: 'Sales performance',
              href: '/sales-performance',
              renderIcon: Document,
            },
          ],
        },
      ],
    },
  ];

  return (
    <TreeView
      label="Tree View"
      hideLabel
      active="1"
      selected={['1']}
      onSelect={(event, node) => setCurrentPage(node.value)}>
      {renderTree({ nodes, withLinks: true })}
    </TreeView>
  );
});

export const WithLinks = () => {
  const [currentPage, setCurrentPage] = React.useState(
    'Artificial Intelligence'
  );

  return (
    <div id="page-body">
      <TreeViewWithLinks setCurrentPage={setCurrentPage} />
      <main>
        <h3>The current page is: {currentPage}</h3>
      </main>
    </div>
  );
};
```

**Variant: WithControlledExpansion**

```jsx
export const WithControlledExpansion = () => {
  const nodes = [
    {
      id: '1',
      value: 'Artificial intelligence',
      label: <span>Artificial intelligence</span>,
      renderIcon: Document,
    },
    {
      id: '2',
      value: 'Blockchain',
      label: 'Blockchain',
      renderIcon: Document,
    },
    {
      id: '3',
      value: 'Business automation',
      label: 'Business automation',
      renderIcon: Folder,
      children: [
        {
          id: '3-1',
          value: 'Business process automation',
          label: 'Business process automation',
          renderIcon: Document,
        },
        {
          id: '3-2',
          value: 'Business process mapping',
          label: 'Business process mapping',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '4',
      value: 'Business operations',
      label: 'Business operations',
      renderIcon: Document,
    },
    {
      id: '5',
      value: 'Cloud computing',
      label: 'Cloud computing',
      isExpanded: true,
      renderIcon: Folder,
      children: [
        {
          id: '5-1',
          value: 'Containers',
          label: 'Containers',
          renderIcon: Document,
        },
        {
          id: '5-2',
          value: 'Databases',
          label: 'Databases',
          renderIcon: Document,
        },
        {
          id: '5-3',
          value: 'DevOps',
          label: 'DevOps',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '5-4',
              value: 'Solutions',
              label: 'Solutions',
              renderIcon: Document,
            },
            {
              id: '5-5',
              value: 'Case studies',
              label: 'Case studies',
              isExpanded: true,
              renderIcon: Folder,
              children: [
                {
                  id: '5-6',
                  value: 'Resources',
                  label: 'Resources',
                  renderIcon: Document,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      id: '6',
      value: 'Data & Analytics',
      label: 'Data & Analytics',
      renderIcon: Folder,
      children: [
        {
          id: '6-1',
          value: 'Big data',
          label: 'Big data',
          renderIcon: Document,
        },
        {
          id: '6-2',
          value: 'Business intelligence',
          label: 'Business intelligence',
          renderIcon: Document,
        },
      ],
    },
    {
      id: '7',
      value: 'Models',
      label: 'Models',
      isExpanded: true,
      disabled: true,
      renderIcon: Folder,
      children: [
        {
          id: '7-1',
          value: 'Audit',
          label: 'Audit',
          renderIcon: Document,
        },
        {
          id: '7-2',
          value: 'Monthly data',
          label: 'Monthly data',
          renderIcon: Document,
        },
        {
          id: '8',
          value: 'Data warehouse',
          label: 'Data warehouse',
          isExpanded: true,
          renderIcon: Folder,
          children: [
            {
              id: '8-1',
              value: 'Report samples',
              label: 'Report samples',
              renderIcon: Document,
            },
            {
              id: '8-2',
              value: 'Sales performance',
              label: 'Sales performance',
              renderIcon: Document,
            },
          ],
        },
      ],
    },
  ];

  const [expanded, setExpanded] = React.useState(undefined);

  function renderTree({ nodes, expanded, withIcons = false }) {
    if (!nodes) {
      return;
    }
    return nodes.map(({ children, renderIcon, isExpanded, ...nodeProps }) => (
      <TreeNode
        key={nodeProps.id}
        renderIcon={withIcons ? renderIcon : null}
        isExpanded={expanded ?? isExpanded}
        {...nodeProps}>
        {renderTree({ nodes: children, expanded, withIcons })}
      </TreeNode>
    ));
  }

  return (
    <>
      <div style={{ marginBottom: '1rem' }}>
        <Button onClick={() => setExpanded(true)}>Expand all</Button>
        &nbsp;
        <Button onClick={() => setExpanded(false)}>Collapse all</Button>
      </div>
      <TreeView label="Tree View">{renderTree({ nodes, expanded })}</TreeView>
    </>
  );
};
```

**Variant: WithComplexNesting** (extra story not in the original Phase 4 list — included for completeness)

```jsx
const Nested = () => {
  return <TreeNode key={21} value="Nested" label="Nested" />;
};

export const WithComplexNesting = (args) => {
  return (
    <TreeView label="Tree View with Complex Nesting" {...args}>
      <TreeNode id="1" value="A.I." label="A.I." isExpanded>
        {/* Pattern 1: A TreeNode wrapped in a simple <div> */}
        <div>
          <TreeNode id="1-1" value="Sub 1" label="Sub 1 (in a div)" />
        </div>
        <TreeNode id="1-2" value="Sub 2" label="Sub 2 (direct child)">
          <TreeNode id="1-2-1" value="Sub 2.1" label="Sub 2.1" />
        </TreeNode>
      </TreeNode>

      <TreeNode id="2" value="Analytics" label="Analytics" isExpanded>
        {/* Pattern 2: A TreeNode rendered from an imported component */}
        <Nested />
      </TreeNode>

      <TreeNode id="3" value="Trust" label="Trust" />
    </TreeView>
  );
};

WithComplexNesting.args = {
  hideLabel: true,
  multiselect: true,
  selected: ['1-1'],
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `tree-view.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports + helpers + meta** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2025, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './index';
import { TREE_SIZE } from './defs';
import Document16 from '@carbon/icons/es/document/16.js';
import Folder16 from '@carbon/icons/es/folder/16.js';
import '../button/index';
import { iconLoader } from '../../globals/internal/icon-loader';

const sizes = {
  [`XS size (${TREE_SIZE.EXTRA_SMALL})`]: TREE_SIZE.EXTRA_SMALL,
  [`Small size (${TREE_SIZE.SMALL})`]: TREE_SIZE.SMALL,
};

const defaultArgs = {
  label: 'Tree View',
};

const controls = {
  size: {
    control: 'select',
    description: 'Specify the size of the Tree.',
    options: sizes,
  },
  hideLabel: {
    control: 'boolean',
    description: 'Will hide label if true',
  },
  label: {
    control: 'text',
    description: 'label',
  },
};

const meta = {
  title: 'Components/TreeView',
};

export default meta;
```

**Variant: Default**

```html
<cds-tree-view ?hide-label=${hideLabel} label=${label} size="${size}">
  <cds-tree-node label="Artificial intelligence"></cds-tree-node>
  <cds-tree-node label="Blockchain"></cds-tree-node>
  <cds-tree-node label="Business automation">
    <cds-tree-node label="Business process automation"></cds-tree-node>
    <cds-tree-node label="Business process mapping"></cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Business operations"></cds-tree-node>
  <cds-tree-node label="Cloud computing" is-expanded>
    <cds-tree-node label="Containers"></cds-tree-node>
    <cds-tree-node label="Databases"></cds-tree-node>
    <cds-tree-node label="DevOps">
      <cds-tree-node label="Solutions"></cds-tree-node>
      <cds-tree-node label="Case studies">
        <cds-tree-node label="Resources"></cds-tree-node>
      </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Data & Analytics" is-expanded>
    <cds-tree-node label="Big data"> </cds-tree-node>
    <cds-tree-node label="Business Intelligence"> </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Models" is-expanded disabled>
    <cds-tree-node label="Audit"> </cds-tree-node>
    <cds-tree-node label="Monthly data"> </cds-tree-node>
    <cds-tree-node label="Data warehouse" is-expanded>
      <cds-tree-node label="Report samples"> </cds-tree-node>
      <cds-tree-node label="Sales performance"> </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
</cds-tree-view>
```

**Variant: withControlledExpansion**

```html
<script>
  function expandAll() {
    document
      .querySelector('cds-tree-view[controlled]')
      .querySelectorAll('cds-tree-node')
      .forEach((node) => {
        node.isExpanded = true;
      });
  }

  function collapseAll() {
    document
      .querySelector('cds-tree-view[controlled]')
      .querySelectorAll('cds-tree-node')
      .forEach((node) => {
        node.isExpanded = false;
      });
  }
</script>
<div style="margin-block-end: 1rem">
  <cds-button onclick="expandAll()">Expand All</cds-button>
  <cds-button onclick="collapseAll()">Collapse All</cds-button>
</div>
<cds-tree-view controlled label="Tree View">
  <cds-tree-node label="Artificial intelligence"></cds-tree-node>
  <cds-tree-node label="Blockchain"></cds-tree-node>
  <cds-tree-node label="Business automation">
    <cds-tree-node label="Business process automation"></cds-tree-node>
    <cds-tree-node label="Business process mapping"></cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Business operations"></cds-tree-node>
  <cds-tree-node label="Cloud computing" is-expanded>
    <cds-tree-node label="Containers"></cds-tree-node>
    <cds-tree-node label="Databases"></cds-tree-node>
    <cds-tree-node label="DevOps">
      <cds-tree-node label="Solutions"></cds-tree-node>
      <cds-tree-node label="Case studies">
        <cds-tree-node label="Resources"></cds-tree-node>
      </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Data & Analytics" is-expanded>
    <cds-tree-node label="Big data"> </cds-tree-node>
    <cds-tree-node label="Business Intelligence"> </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Models" is-expanded disabled>
    <cds-tree-node label="Audit"> </cds-tree-node>
    <cds-tree-node label="Monthly data"> </cds-tree-node>
    <cds-tree-node label="Data warehouse" is-expanded>
      <cds-tree-node label="Report samples"> </cds-tree-node>
      <cds-tree-node label="Sales performance"> </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
</cds-tree-view>
```

**Variant: withIcons**

```html
<cds-tree-view label="Tree View">
  <cds-tree-node label="Artificial intelligence">
    ${iconLoader(Document16, { slot: 'icon' })}
  </cds-tree-node>
  <cds-tree-node label="Blockchain">
    ${iconLoader(Document16, { slot: 'icon' })}
  </cds-tree-node>
  <cds-tree-node label="Business automation">
    ${iconLoader(Folder16, { slot: 'icon' })}
    <cds-tree-node label="Business process automation">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="Business process mapping">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Business operations">
    ${iconLoader(Document16, { slot: 'icon' })}
  </cds-tree-node>
  <cds-tree-node label="Cloud computing" is-expanded>
    ${iconLoader(Folder16, { slot: 'icon' })}
    <cds-tree-node label="Containers">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="Databases">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="DevOps">
      ${iconLoader(Folder16, { slot: 'icon' })}
      <cds-tree-node label="Solutions">
        ${iconLoader(Document16, { slot: 'icon' })}
      </cds-tree-node>
      <cds-tree-node label="Case studies">
        ${iconLoader(Folder16, { slot: 'icon' })}
        <cds-tree-node label="Resources">
          ${iconLoader(Document16, { slot: 'icon' })}
        </cds-tree-node>
      </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Data & Analytics" is-expanded>
    ${iconLoader(Folder16, { slot: 'icon' })}
    <cds-tree-node label="Big data">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="Business Intelligence">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
  </cds-tree-node>
  <cds-tree-node label="Models" is-expanded disabled>
    ${iconLoader(Folder16, { slot: 'icon' })}
    <cds-tree-node label="Audit">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="Monthly data">
      ${iconLoader(Document16, { slot: 'icon' })}
    </cds-tree-node>
    <cds-tree-node label="Data warehouse" is-expanded>
      ${iconLoader(Folder16, { slot: 'icon' })}
      <cds-tree-node label="Report samples">
        ${iconLoader(Document16, { slot: 'icon' })}
      </cds-tree-node>
      <cds-tree-node label="Sales performance">
        ${iconLoader(Document16, { slot: 'icon' })}
      </cds-tree-node>
    </cds-tree-node>
  </cds-tree-node>
</cds-tree-view>
```

**Variant: withLinks**

```html
<script>
  document
    .querySelector('cds-tree-view[links]')
    .addEventListener('cds-tree-node-selected', (e) => {
      document.querySelector('h3').innerText =
        'The current page is: ' + e.detail.value;
    });
</script>
<div id="page-body" style="display: flex">
  <cds-tree-view
    links
    hide-label
    label="Tree view"
    style="inline-size: 20rem">
    <cds-tree-node
      label="Artificial intelligence"
      href="/artificial-intelligence"
      selected
      active
      .onClick=${(event) => event.preventDefault()}></cds-tree-node>
    <cds-tree-node
      label="Blockchain"
      href="/blockchain"
      .onClick=${(event) => event.preventDefault()}></cds-tree-node>
    <cds-tree-node
      label="Business automation"
      href="/business-automation"
      .onClick=${(event) => event.preventDefault()}>
      <cds-tree-node
        label="Business process automation"
        href="/business-process-automation"
        .onClick=${(event) => event.preventDefault()}></cds-tree-node>
      <cds-tree-node
        label="Business process mapping"
        href="/business-process-mapping"
        .onClick=${(event) => event.preventDefault()}></cds-tree-node>
    </cds-tree-node>
    <cds-tree-node
      label="Business operations"
      href="/business-operations"
      .onClick=${(event) => event.preventDefault()}></cds-tree-node>
    <cds-tree-node
      label="Cloud computing"
      href="/cloud-computing"
      is-expanded
      .onClick=${(event) => event.preventDefault()}>
      <cds-tree-node
        label="Containers"
        href="/containers"
        .onClick=${(event) => event.preventDefault()}></cds-tree-node>
      <cds-tree-node
        label="Databases"
        href="/databases"
        .onClick=${(event) => event.preventDefault()}></cds-tree-node>
      <cds-tree-node
        label="DevOps"
        href="/devops"
        .onClick=${(event) => event.preventDefault()}>
        <cds-tree-node
          label="Solutions"
          href="/solutions"
          .onClick=${(event) => event.preventDefault()}></cds-tree-node>
        <cds-tree-node
          label="Case studies"
          href="/case-studies"
          .onClick=${(event) => event.preventDefault()}>
          <cds-tree-node
            label="Resources"
            href="/resources"
            .onClick=${(event) => event.preventDefault()}></cds-tree-node>
        </cds-tree-node>
      </cds-tree-node>
    </cds-tree-node>
    <cds-tree-node
      label="Data & Analytics"
      href="/data-analytics"
      is-expanded
      .onClick=${(event) => event.preventDefault()}>
      <cds-tree-node
        label="Big data"
        href="/big-data"
        .onClick=${(event) => event.preventDefault()}>
      </cds-tree-node>
      <cds-tree-node
        label="Business Intelligence"
        href="/business-intelligence"
        .onClick=${(event) => event.preventDefault()}>
      </cds-tree-node>
    </cds-tree-node>
    <cds-tree-node
      label="Models"
      is-expanded
      disabled
      href="/models"
      .onClick=${(event) => event.preventDefault()}>
      <cds-tree-node
        label="Audit"
        href="/audit"
        .onClick=${(event) => event.preventDefault()}>
      </cds-tree-node>
      <cds-tree-node
        label="Monthly data"
        href="/monthly-data"
        .onClick=${(event) => event.preventDefault()}>
      </cds-tree-node>
      <cds-tree-node
        label="Data warehouse"
        is-expanded
        href="/data-warehouse"
        .onClick=${(event) => event.preventDefault()}>
        <cds-tree-node
          label="Report samples"
          href="/report-samples"
          .onClick=${(event) => event.preventDefault()}>
        </cds-tree-node>
        <cds-tree-node
          label="Sales performance"
          href="/sales-performance"
          .onClick=${(event) => event.preventDefault()}>
        </cds-tree-node>
      </cds-tree-node>
    </cds-tree-node>
  </cds-tree-view>
  <main style="flex: 1">
    <h3>The current page is: Artifical Intelligence</h3>
  </main>
</div>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?hide-label=${...}`, `${iconLoader(...)}`, `.onClick=${...}`) resolved to static attributes / inline SVG. Use this for hand-coded HTML without a component framework. The semantic shape — `<ul role="tree">` with `<li role="treeitem" aria-expanded aria-selected aria-owns>` and `<ul role="group">` for child lists — is what Carbon's `TreeView.tsx` and `TreeNode.tsx` render at runtime.

**Variant: Default** (sm size, no icons, two pre-expanded parents and one disabled-and-expanded parent — this is the static DOM that Carbon's `TreeView` produces):

```html
<div data-theme="white" style="background: var(--cds-layer-01); inline-size: 20rem;">
  <div class="cds--tree" role="tree" aria-label="Tree View">
    <ul class="cds--tree__root" role="presentation">
      <!-- Leaf node -->
      <li id="node-1" class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
        <div class="cds--tree-node__label">
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Artificial intelligence</span>
          </span>
        </div>
      </li>

      <!-- Leaf node -->
      <li id="node-2" class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
        <div class="cds--tree-node__label">
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Blockchain</span>
          </span>
        </div>
      </li>

      <!-- Parent node, COLLAPSED (no `is-expanded`) -->
      <li id="node-3" class="cds--tree-node cds--tree-parent-node" role="treeitem" aria-expanded="false" aria-selected="false" aria-disabled="false" aria-owns="node-3-subtree" tabindex="-1">
        <div class="cds--tree-node__label">
          <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="expand">
            <svg class="cds--tree-parent-node__toggle-icon" focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
            </svg>
          </button>
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Business automation</span>
          </span>
        </div>
        <ul id="node-3-subtree" role="group" class="cds--tree-node__children" hidden>
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Business process automation</span>
              </span>
            </div>
          </li>
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Business process mapping</span>
              </span>
            </div>
          </li>
        </ul>
      </li>

      <!-- Leaf node -->
      <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
        <div class="cds--tree-node__label">
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Business operations</span>
          </span>
        </div>
      </li>

      <!-- Parent node, EXPANDED -->
      <li id="node-5" class="cds--tree-node cds--tree-parent-node" role="treeitem" aria-expanded="true" aria-selected="false" aria-disabled="false" aria-owns="node-5-subtree" tabindex="-1">
        <div class="cds--tree-node__label">
          <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="collapse">
            <svg class="cds--tree-parent-node__toggle-icon cds--tree-parent-node__toggle-icon--expanded" focusable="false" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
            </svg>
          </button>
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Cloud computing</span>
          </span>
        </div>
        <ul id="node-5-subtree" role="group" class="cds--tree-node__children">
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Containers</span>
              </span>
            </div>
          </li>
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Databases</span>
              </span>
            </div>
          </li>
          <li class="cds--tree-node cds--tree-parent-node" role="treeitem" aria-expanded="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="expand">
                <svg class="cds--tree-parent-node__toggle-icon" focusable="false" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
                  <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
                </svg>
              </button>
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">DevOps</span>
              </span>
            </div>
          </li>
        </ul>
      </li>

      <!-- Parent node, EXPANDED (Data & Analytics) -->
      <li class="cds--tree-node cds--tree-parent-node" role="treeitem" aria-expanded="true" aria-selected="false" aria-disabled="false" tabindex="-1">
        <div class="cds--tree-node__label">
          <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="collapse">
            <svg class="cds--tree-parent-node__toggle-icon cds--tree-parent-node__toggle-icon--expanded" focusable="false" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
            </svg>
          </button>
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Data &amp; Analytics</span>
          </span>
        </div>
        <ul role="group" class="cds--tree-node__children">
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Big data</span>
              </span>
            </div>
          </li>
          <li class="cds--tree-node cds--tree-leaf-node" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="false" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Business Intelligence</span>
              </span>
            </div>
          </li>
        </ul>
      </li>

      <!-- Parent node, EXPANDED + DISABLED (Models) — disabled cascades to children visually -->
      <li class="cds--tree-node cds--tree-parent-node cds--tree-node--disabled" role="treeitem" aria-expanded="true" aria-selected="false" aria-disabled="true" tabindex="-1">
        <div class="cds--tree-node__label">
          <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="collapse" disabled>
            <svg class="cds--tree-parent-node__toggle-icon cds--tree-parent-node__toggle-icon--expanded" focusable="false" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
            </svg>
          </button>
          <span class="cds--tree-node__label__details">
            <span class="cds--tree-node__label__text">Models</span>
          </span>
        </div>
        <ul role="group" class="cds--tree-node__children">
          <li class="cds--tree-node cds--tree-leaf-node cds--tree-node--disabled" role="treeitem" aria-current="false" aria-selected="false" aria-disabled="true" tabindex="-1">
            <div class="cds--tree-node__label">
              <span class="cds--tree-node__label__details">
                <span class="cds--tree-node__label__text">Audit</span>
              </span>
            </div>
          </li>
          <!-- ... remaining disabled descendants follow the same pattern ... -->
        </ul>
      </li>
    </ul>
  </div>
</div>
```

**Variant: WithIcons** — same `<li>` structure as Default, with a single `<svg>` of `width="16" height="16"` inserted between `.cds--tree-parent-node__toggle` (or, on a leaf, at the start of `.cds--tree-node__label`) and `.cds--tree-node__label__details`. The icon picks up `class="cds--tree-node__icon"` and inherits `fill: var(--cds-icon-secondary)` from the SCSS:

```html
<li class="cds--tree-node cds--tree-leaf-node cds--tree-node--with-icon" role="treeitem" aria-current="false" aria-selected="false" tabindex="-1">
  <div class="cds--tree-node__label">
    <svg class="cds--tree-node__icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <!-- @carbon/icons document/16 path -->
      <path d="M9.5 1H3a1 1 0 00-1 1v12a1 1 0 001 1h10a1 1 0 001-1V5.5L9.5 1zM13 14H3V2h6v4h4v8z"/>
    </svg>
    <span class="cds--tree-node__label__details">
      <span class="cds--tree-node__label__text">Blockchain</span>
    </span>
  </div>
</li>

<!-- Parent node WITH icon -->
<li class="cds--tree-node cds--tree-parent-node cds--tree-node--with-icon" role="treeitem" aria-expanded="true" aria-selected="false" aria-owns="node-5-subtree" tabindex="-1">
  <div class="cds--tree-node__label">
    <button type="button" class="cds--tree-parent-node__toggle" tabindex="-1" aria-label="collapse">
      <svg class="cds--tree-parent-node__toggle-icon cds--tree-parent-node__toggle-icon--expanded" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <path d="M11 8L6 13 5.3 12.3 9.6 8 5.3 3.7 6 3z"/>
      </svg>
    </button>
    <svg class="cds--tree-node__icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <!-- @carbon/icons folder/16 path -->
      <path d="M14.5 4H7.71L5.85 2.15A.5.5 0 005.5 2h-4a.5.5 0 00-.5.5v11a.5.5 0 00.5.5h13a.5.5 0 00.5-.5v-9a.5.5 0 00-.5-.5z"/>
    </svg>
    <span class="cds--tree-node__label__details">
      <span class="cds--tree-node__label__text">Cloud computing</span>
    </span>
  </div>
  <!-- ul[role="group"] children here -->
</li>
```

**Variant: WithLinks** — every `<li>` becomes an `<a class="cds--tree-node">` with the same `role="treeitem"` ARIA. The `data-theme` wrapper, the inner `.cds--tree-node__label`, and the icons are unchanged. The active node carries `cds--tree-node--selected` AND `cds--tree-node--active` (which paints the 4px blue rail):

```html
<li class="cds--tree-node-link-parent">
  <a href="/artificial-intelligence" class="cds--tree-node cds--tree-leaf-node cds--tree-node--with-icon cds--tree-node--selected cds--tree-node--active" role="treeitem" aria-current="page" aria-selected="true" tabindex="-1">
    <div class="cds--tree-node__label">
      <svg class="cds--tree-node__icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <path d="M9.5 1H3a1 1 0 00-1 1v12a1 1 0 001 1h10a1 1 0 001-1V5.5L9.5 1zM13 14H3V2h6v4h4v8z"/>
      </svg>
      <span class="cds--tree-node__label__details">
        <span class="cds--tree-node__label__text">Artificial intelligence</span>
      </span>
    </div>
  </a>
</li>
```

**Variant: WithControlledExpansion** — identical static DOM to Default (both pre-expanded parents shown). The "Expand all" / "Collapse all" buttons are external `<button class="cds--btn cds--btn--primary">` elements that toggle every parent's `is-expanded` attribute / `--expanded` class via JS. No Carbon-specific markup is added.

## Design Tokens (component-scoped)

These resolve the semantic Carbon tokens used by `_treeview.scss` (`$layer-01`, `$layer-hover-01`, `$layer-selected-01`, `$layer-selected-hover-01`, `$field-01`, `$text-primary`, `$text-secondary`, `$text-disabled`, `$icon-primary`, `$icon-secondary`, `$icon-disabled`, `$interactive`, `$focus`) to their literal hex values per theme.

```css
[data-theme="white"] {
  /* Surface (default node bg) */
  --cds-layer-01: #f4f4f4;
  --cds-layer-hover-01: #e8e8e8;
  --cds-layer-selected-01: #e0e0e0;
  --cds-layer-selected-hover-01: #cacaca; /* Carbon White layer-selected-hover-01 */

  /* Disabled surface */
  --cds-field-01: #f4f4f4;

  /* Text */
  --cds-text-primary: #161616;            /* hover label color, selected label color */
  --cds-text-secondary: #525252;          /* rest label color */
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  /* Icons (chevron + optional node icon) */
  --cds-icon-primary: #161616;            /* hover icon, selected icon */
  --cds-icon-secondary: #525252;          /* rest icon */
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  /* Active rail (selected + active node) */
  --cds-interactive: #0f62fe;             /* 4px ::before rail color */

  /* Focus ring */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;

  /* Motion + spacing — tree uses productive standard 110ms */
  --cds-duration-fast-02: 110ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-spacing-02: 0.25rem;              /*  4px — chevron padding-inline-start, chevron margin-inline-start (negative) */
  --cds-spacing-03: 0.5rem;               /*  8px — chevron margin-inline-end, icon margin-inline both sides, with-icon child shift */
  --cds-spacing-05: 1rem;                 /* 16px — first-level node padding-inline-start */
  --cds-spacing-06: 1.5rem;               /* 24px — leaf-with-icon nested under leaf-with-icon padding-inline-start */
  --cds-spacing-07: 2rem;                 /* 32px — leaf-with-icon padding-inline-start */
  --cds-spacing-08: 2.5rem;               /* 40px — leaf-without-icon padding-inline-start */
}

[data-theme="g10"] {
  --cds-layer-01: #ffffff;
  --cds-layer-hover-01: #e8e8e8;
  --cds-layer-selected-01: #e0e0e0;
  --cds-layer-selected-hover-01: #cacaca;

  --cds-field-01: #ffffff;

  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  --cds-icon-primary: #161616;
  --cds-icon-secondary: #525252;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  --cds-interactive: #0f62fe;

  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
}

[data-theme="g90"] {
  --cds-layer-01: #393939;
  --cds-layer-hover-01: #4c4c4c;
  --cds-layer-selected-01: #525252;
  --cds-layer-selected-hover-01: #636363;

  --cds-field-01: #393939;

  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-interactive: #4589ff;

  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;
}

[data-theme="g100"],
.dark {
  /* Surface */
  --cds-layer-01: #262626;
  --cds-layer-hover-01: #333333;
  --cds-layer-selected-01: #393939;
  --cds-layer-selected-hover-01: #4c4c4c;

  /* Disabled surface */
  --cds-field-01: #262626;

  /* Text */
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  /* Icons */
  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  /* Active rail */
  --cds-interactive: #4589ff;

  /* Focus */
  --cds-focus: #ffffff;
  --cds-focus-inset: #161616;

  /* Motion + spacing — same in all themes */
  --cds-duration-fast-02: 110ms;
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-spacing-02: 0.25rem;
  --cds-spacing-03: 0.5rem;
  --cds-spacing-05: 1rem;
  --cds-spacing-06: 1.5rem;
  --cds-spacing-07: 2rem;
  --cds-spacing-08: 2.5rem;
}
```

## States Reference (from .scss)

> Pulled from `packages/styles/scss/components/treeview/_treeview.scss` (the cross-package source). All hex values resolved against the `[data-theme="white"]` and `[data-theme="g100"]` blocks in `overview.md`.

White theme — `.cds--tree-node` row + `.cds--tree-node__label` (the inner hover/selected target):

| State | Node bg (`.cds--tree-node`) | Label bg (`.cds--tree-node__label`) | Label color | Chevron / icon fill | Outline | Active rail (`::before`) |
|---|---|---|---|---|---|---|
| Rest | `#f4f4f4` (layer-01) | `transparent` | `#525252` (text-secondary) | `#525252` (icon-secondary) | none | none |
| Hover | `#f4f4f4` | `#e8e8e8` (layer-hover-01) | `#161616` (text-primary) | `#161616` (icon-primary) | none | none |
| Focus (`.cds--tree-node:focus > .cds--tree-node__label`) | `#f4f4f4` | (rest) | `#525252` | `#525252` | `2px solid #0f62fe` (`@include focus-outline('outline')`) | none |
| Selected (`.cds--tree-node--selected > .cds--tree-node__label`) | `#f4f4f4` | `#e0e0e0` (layer-selected-01) | `#161616` (text-primary) | `#161616` (icon-primary) | none | none |
| Selected + Hover | `#f4f4f4` | `#cacaca` (layer-selected-hover-01) | `#161616` | `#161616` | none | none |
| Active (`.cds--tree-node--active > .cds--tree-node__label::before`) | `#f4f4f4` | (matches selected) | `#161616` | `#161616` | none | `4px × 100%` `#0f62fe` (interactive), inset-block-start `0`, inset-inline-start `0` |
| Disabled (`.cds--tree-node--disabled`) | `#f4f4f4` (field-01) | `#f4f4f4` (field-01) | `rgba(22,22,22,0.25)` (text-disabled) | `rgba(22,22,22,0.25)` (icon-disabled) | `outline: none` on focus (the disabled rule overrides the focus-outline) | none; `cursor: not-allowed` |

G100 theme — same structure, dark values:

| State | Node bg | Label bg | Label color | Chevron / icon fill | Outline | Active rail |
|---|---|---|---|---|---|---|
| Rest | `#262626` (layer-01) | `transparent` | `#c6c6c6` (text-secondary) | `#c6c6c6` (icon-secondary) | none | none |
| Hover | `#262626` | `#333333` (layer-hover-01) | `#f4f4f4` (text-primary) | `#f4f4f4` (icon-primary) | none | none |
| Focus | `#262626` | (rest) | `#c6c6c6` | `#c6c6c6` | `2px solid #ffffff` (focus token in dark themes) | none |
| Selected | `#262626` | `#393939` (layer-selected-01) | `#f4f4f4` | `#f4f4f4` | none | none |
| Selected + Hover | `#262626` | `#4c4c4c` (layer-selected-hover-01) | `#f4f4f4` | `#f4f4f4` | none | none |
| Active | `#262626` | (matches selected) | `#f4f4f4` | `#f4f4f4` | none | `4px × 100%` `#4589ff` (interactive in dark), inset-block-start `0`, inset-inline-start `0` |
| Disabled | `#262626` (field-01) | `#262626` (field-01) | `rgba(244,244,244,0.25)` | `rgba(244,244,244,0.25)` | `outline: none` | none; `cursor: not-allowed` |

Sizes (all themes — affect `min-block-size` on `.cds--tree-node__label`):

| Size class | `min-block-size` (label row) | Leaf padding-block | Use case |
|---|---|---|---|
| `.cds--tree--xs` | `24px` | `0` (text fills row exactly) | Dense data dashboards, file-tree sidebars where vertical space is at a premium |
| `.cds--tree--sm` (default) | `32px` | `7px / 7px` (`(32 − 18) / 2`) | Standard product UI, navigation sidebars, settings panes. Default size in both React (`size = 'sm'`) and WC (`size="sm"`) |

> Carbon's `TREE_SIZE` enum (in `packages/web-components/src/components/tree-view/defs.ts`) only defines `EXTRA_SMALL = 'xs'` and `SMALL = 'sm'`. There is no `md` / `lg` for TreeView — unlike Accordion, Button, etc. If a designer asks for a larger tree row, they likely want a Side Navigation component instead.

Indent math — exact `padding-inline-start` per nesting level, derived from the `.cds--tree-node` and leaf rules:

| Depth | Leaf, no icon | Leaf, with icon | Parent (chevron + label), no icon | Parent (chevron + label), with icon |
|---|---|---|---|---|
| 0 (root child) | `40px` (`$spacing-08`) | `32px` (`$spacing-07`) | `16px` (`$spacing-05`) | `16px` (`$spacing-05`) |
| 1 (nested once) | `40px` + parent's own offset cascades via the nested `.cds--tree-node` rule | `32px` (leaf) or `24px` (leaf-with-icon nested under leaf-with-icon, `$spacing-06`) | `16px` + `$spacing-03` (`8px`) shift when nested under `.cds--tree-node--with-icon` | `16px` + `$spacing-03` |
| 2+ (deep nest) | each level adds another `$spacing-05` (`16px`) via the recursive `.cds--tree-node` rule | each level adds `$spacing-05` + (when `--with-icon`) `$spacing-03` | same | same |

> The visual rule: leaf labels always align under their parent's label text (not under the parent's chevron or icon). The `$spacing-08` / `$spacing-07` / `$spacing-06` leaf padding is calibrated so a leaf without a chevron sits at the same indent as a sibling parent's label — making the tree read as a clean vertical column of text.

Variants (state classes Carbon adds at runtime — wired by `TreeNode.tsx`):

| Class | Triggered by | Effect |
|---|---|---|
| `.cds--tree-node--selected` | Node id is in the `selected` array (controlled) or `preselected` (uncontrolled), or `<cds-tree-node selected>` | Adds `aria-selected="true"`, paints `--cds-layer-selected-01` background, lifts label color to `--cds-text-primary`, lifts icons to `--cds-icon-primary` |
| `.cds--tree-node--active` | Node id matches `active` prop (`active="1"` in WithLinks) | Adds the `4px` `::before` rail in `--cds-interactive` along the inline-start edge, indicating the "current page" / focal node |
| `.cds--tree-node--disabled` | `disabled` prop on `<TreeNode>` or `disabled` attribute on `<cds-tree-node>` | Adds `aria-disabled="true"`, sets bg to `--cds-field-01`, text to `--cds-text-disabled`, icon to `--cds-icon-disabled`, removes hover-bg cascade, kills focus outline, sets `cursor: not-allowed`. Children of a disabled parent are also painted disabled |
| `.cds--tree-node--with-icon` | A `renderIcon` prop is passed (React) or an element is slotted into `slot="icon"` (WC) | Adds the `8px` (`$spacing-03`) child shift; reduces leaf padding from `$spacing-08` (40px) to `$spacing-07` (32px) so the icon space replaces the empty leaf indent |
| `.cds--tree-node--hidden` | Internal — set on collapsed children that are still in the DOM but not visible | `display: none` |
| `.cds--tree-parent-node` | Node has `children` (React) or has any `<cds-tree-node>` slotted children (WC) | Renders the `.cds--tree-parent-node__toggle` chevron button before the label; expands the label to `inline-size: auto` so it shares the row with the chevron |
| `.cds--tree-leaf-node` | Node has no children | Sets `display: flex` and applies the leaf-specific padding (`$spacing-08` no-icon, `$spacing-07` with-icon) |
| `.cds--tree-parent-node__toggle-icon--expanded` | Parent's `is-expanded` / `isExpanded` is true | Adds `transform: rotate(0)` to the chevron (default rest is `rotate(-90deg)`) — the 90° rotation is the open/close visual signal |
| `.cds--tree-node-link-parent` | Node carries `href` AND has children (links variant only) | Wraps the parent `<a>` + child `<ul>` in a `flex column` `<li>` so the link row stays a single hit target above its expanded subtree, and reapplies `padding-inline-start: $spacing-05` to the children list (since the `<a>` strips the default li padding) |

## Animation & Motion

Carbon's TreeView uses **only productive motion tokens** (110ms — fast enough to feel instant, slow enough to register the chevron flip and the hover/select fill). Three properties animate; everything else is a static class swap.

```css
/* 1. Chevron rotation (110ms productive standard) — the headline tree gesture */
.cds--tree-parent-node__toggle-icon {
  fill: var(--cds-icon-secondary);
  transform: rotate(-90deg);   /* rest — chevron points RIGHT, parent collapsed */
  transition: all var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* duration-fast-02 = 110ms */
  /* easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

.cds--tree-parent-node__toggle-icon--expanded {
  transform: rotate(0);        /* expanded — chevron points DOWN */
}

/* 2. Label hover background — there's no explicit transition; Carbon relies on the
      browser's default (none) so the hover fill snaps in. This is intentional —
      the tree wants the hover state to feel like a precise highlight, not a fade. */
.cds--tree-node__label:hover {
  background-color: var(--cds-layer-hover-01);
  color: var(--cds-text-primary);
}

/* 3. Selected hover transition is also not explicitly transitioned — same rationale. */
.cds--tree-node--selected > .cds--tree-node__label {
  background-color: var(--cds-layer-selected-01);
  color: var(--cds-text-primary);
}
.cds--tree-node--selected > .cds--tree-node__label:hover {
  background-color: var(--cds-layer-selected-hover-01);
}

/* 4. Active rail is a static ::before block — no transition.
      The rail appears the moment the node becomes active. */
.cds--tree-node--active > .cds--tree-node__label {
  position: relative;
}
.cds--tree-node--active > .cds--tree-node__label::before {
  position: absolute;
  background-color: var(--cds-interactive);  /* #0f62fe light, #4589ff dark */
  block-size: 100%;
  content: '';
  inline-size: 0.25rem;                       /* 4px */
  inset-block-start: 0;
  inset-inline-start: 0;
}

/* prefers-reduced-motion — Carbon's _treeview.scss does not ship its own
   reduced-motion override, but the chevron's `transition: all ...` will be
   respected by browsers that honour the user agent's prefers-reduced-motion
   shortcut. For belt-and-braces, add this in your app's global CSS: */
@media (prefers-reduced-motion: reduce) {
  .cds--tree-parent-node__toggle-icon {
    transition: none;
  }
}
```

> Why no expand/collapse animation? Tree expansion in Carbon is a **discrete reveal**, not a slide-down. The `<ul role="group">` either renders or doesn't — Carbon does not animate a `max-height: 0 → fit-content` transition on the children list. The single moving piece is the chevron's 90° rotation, which is the user's only motion cue that the node opened. This keeps deeply nested trees responsive (no cascading 110ms slides on "Expand all") and matches the productive-motion philosophy: the action *just happens*. If your design wants a slide-down, you are no longer in Carbon territory — that's a Material Design tree pattern.

## Accessibility (from Carbon's docs + source)

- **Semantic markup:** Carbon renders `<ul role="tree">` as the outermost interactive container (`TreeView.tsx` line ~321), with `<li role="treeitem">` for every node (`TreeNode.tsx` line ~576). Parent nodes additionally carry `aria-owns="{id}-subtree"` pointing at a sibling `<ul role="group" aria-labelledby="{nodeLabelId}">` inside the same `<li>` (so the children are semantically owned by the parent treeitem, not nested inside it via the standard parent-child tree). When `href` is present, the `<li>` is replaced by `<a class="cds--tree-node">` and the row becomes a real link with `role="treeitem"`.
- **ARIA attributes** (set by `TreeNode.tsx`):
  - `role="treeitem"` on every node row.
  - `aria-expanded={true|false}` on parent nodes only (leaf nodes omit it). Carbon sets this from the node's `expanded` state.
  - `aria-selected={true|false}` on every non-link node (when `href` is absent). For link nodes (`href` present), Carbon uses `aria-current` instead — see next bullet — because `aria-selected` is not appropriate on a navigational link.
  - `aria-current` on link nodes only — set to a truthy value (e.g., `"page"`) when the node id matches the `active` / `selected` props.
  - `aria-disabled={true|false}` whenever `disabled` is true.
  - `aria-owns="{id}-subtree"` on parent nodes — points at the child `<ul>`'s id so screen readers traverse the tree even though the children render inside a sibling element.
  - `aria-labelledby` on the child `<ul role="group">` pointing at the parent's label, so the group announcement reads back the parent name.
  - `aria-multiselectable={true}` is set on the outer `<ul role="tree">` only when `multiselect` is true.
  - `aria-label` (if `hideLabel`) or `aria-labelledby={labelId}` (if a visible `<label>` is rendered) on the outer `<ul role="tree">`.
- **Keyboard** (handled in `TreeNode.tsx` `handleKeyDown` ~line 408+):
  - **Tab / Shift-Tab** — moves focus into the tree (the first focusable treeitem) and out of the tree. Within the tree, Tab does NOT move between treeitems — Carbon implements roving-tabindex (only the focused node has `tabindex="0"`; all others are `tabindex="-1"`).
  - **Arrow Down** — moves focus to the next visible treeitem (skipping disabled nodes via `aria-disabled` check on `treeWalker.current.currentNode`). Wraps from last to first within the tree's traversal.
  - **Arrow Up** — moves focus to the previous visible treeitem (skipping disabled nodes).
  - **Arrow Right** on a collapsed parent — expands the node. On an already-expanded parent — moves focus to the first child. On a leaf — does nothing.
  - **Arrow Left** on an expanded parent — collapses the node. On an already-collapsed parent or leaf — moves focus to the parent treeitem.
  - **Enter** on a leaf or non-parent — selects the node (fires `onSelect`). On a parent — toggles expand/collapse AND selects.
  - **Space** — same as Enter (selects + toggles where applicable).
  - **Home** / **End** — Carbon does NOT implement Home/End to jump to first/last treeitem (the WAI-ARIA tree pattern recommends them but Carbon's source omits them). Use Arrow keys to traverse.
- **Focus visualisation:** Carbon applies `@include focus-outline('outline')` on `.cds--tree-node:focus > .cds--tree-node__label`, which paints a `2px solid var(--cds-focus)` outline on the LABEL (not the `<li>`). This is a single-ring outline — there is NO inset shadow on TreeView (unlike the 6-shadow ring on Accordion). The disabled cascade overrides this with `outline: none` so focused-but-disabled nodes don't show a ring.
- **Roving tabindex:** `TreeView.tsx` uses a `useTreeWalker` ref + `tabIndex` rotation so only one treeitem is in the tab order at a time. This is the WAI-ARIA tree pattern — without it, Tab would cycle through every node in a 200-item tree.
- **Disabled handling:** `disabled` cascades visually to children (the SCSS paints all descendants of `.cds--tree-node--disabled` with disabled colors), but the keyboard navigator also skips over disabled nodes — `treeWalker.current.currentNode.getAttribute('aria-disabled')` is checked before moving focus to a node. So a disabled subtree is non-focusable, non-actionable, and visually muted.
- **Touch target:** `xs` (24px) and `sm` (32px) both fall below the WCAG 2.1 SC 2.5.5 `44px` AAA minimum. TreeView is intentionally compact — Carbon's design intent is dense navigation. For mobile or accessibility-critical contexts, pair the tree with a wider tap target (e.g., a side-nav toggle that expands the rows on touch) or use the SideNav component instead.
- **Color contrast (White theme):** rest label `#525252` on `#f4f4f4` (layer-01) = 7.1:1 (AAA). Hover label `#161616` on `#e8e8e8` = 13.6:1 (AAA). Selected label `#161616` on `#e0e0e0` = 12.6:1 (AAA). Disabled `rgba(22,22,22,0.25)` on `#f4f4f4` resolves to ~`#bfbfbf` = 1.78:1 — fails AA, but per WCAG SC 1.4.3 disabled UI components are explicitly excluded from the contrast requirement.
- **Color contrast (G100 theme):** rest label `#c6c6c6` on `#262626` = 8.9:1 (AAA). Hover label `#f4f4f4` on `#333333` = 11.7:1 (AAA). Selected label `#f4f4f4` on `#393939` = 10.6:1 (AAA).
- **Active rail contrast:** the `4px` `#0f62fe` (light) / `#4589ff` (dark) rail is decorative — Carbon adds `aria-current` (link nodes) or `aria-selected` (non-link nodes) for screen-reader semantics, so the rail is never the only signal of "active" status.
- **RTL:** `_treeview.scss` uses logical properties throughout (`padding-inline-start`, `margin-inline-end`, `inset-inline-start`, `inline-size`, `block-size`), so RTL works without per-direction overrides. Chevron rotation flips automatically because `rotate(-90deg)` applies relative to the icon, not to the document direction.
- **`hideLabel` prop:** when true, Carbon renders the visible `<label>` with `cds--visually-hidden` (a screen-reader-only class) instead of removing it. So a tree with `hideLabel` still has a programmatically-determinable name.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5 & 6 when generating Carbon TreeView | Don't paraphrase, rename props, or rewrite render functions — the Carbon source IS the spec |
| Default to `size="sm"` (`32px` row) — Carbon's React `TreeView.tsx` and the WC defaults both use `sm` | Don't default to `xs` (`24px`) for general nav — it's reserved for dense data trees and falls below comfortable touch targets |
| Use `border-radius: 0` on every part of the component (label, hover bg, selected bg, focus outline, active rail) | Don't add `border-radius` to soften corners — sharp edges are Carbon's signature; rounded tree nodes read as Material or Apple |
| Pair `selected={[...]}` with `active={...}` (single id) when ONE node is the user's current location — selected = "checked / chosen", active = "current page / focal" | Don't conflate the two: `selected` controls multi-selection (with the multiselect prop), `active` is single-id only and paints the 4px blue rail. They can be set independently |
| Use `--cds-layer-hover-01` (theme-aware) for hover and `--cds-layer-selected-01` for selected — Carbon's source already does this | Don't hardcode `#e8e8e8` / `#e0e0e0` for hover/selected — they'll be wrong in G90 / G100 (where selected becomes `#525252` / `#393939`) |
| Use `renderIcon={Folder}` on parents and `renderIcon={Document}` on leaves (or your own pair) when the tree represents a file-system-style hierarchy | Don't put icons only on some nodes — the indent math (`.cds--tree-node--with-icon`) cascades, so mixed icon/no-icon siblings will have misaligned labels |
| Set `href` on every node (or none) when using the WithLinks variant — Carbon switches the row from `<li>` to `<a class="cds--tree-node">` based on this | Don't mix `href`-bearing and non-`href` nodes in the same tree — the `aria-current` vs `aria-selected` semantics will be inconsistent and screen readers will announce them differently |
| Trust Carbon's roving tabindex — only the focused treeitem has `tabindex="0"`, all others are `-1` | Don't manually set `tabindex="0"` on every `<li>` — you'll break the WAI-ARIA tree pattern and trap users on Tab |
| Let Carbon's `:focus` outline (single 2px ring) stand — it's the WAI-ARIA-compliant focus indicator for the label row | Don't replace the outline with the 6-shadow Accordion-style ring — TreeView's outline rule is intentionally simpler because the rows are denser and a heavier ring would visually crowd adjacent nodes |
| Use the chevron's 90° rotation as the only motion cue for expand/collapse — Carbon does NOT animate the children's height | Don't add a `max-height: 0 → fit-content` slide-down — that's a Material Design pattern, not Carbon; it also breaks at deep nesting (every level cascades a 110ms slide) |
| Render parent's child list as a sibling `<ul role="group" id="{id}-subtree">` referenced by `aria-owns` on the parent treeitem — match Carbon's structure exactly | Don't nest `<ul>` inside the parent `<li>` as a child — Carbon's `aria-owns` pattern works precisely because the group is a sibling that the parent owns by id, not by DOM containment |
| Wrap the tree in `[data-theme="white"]` or `[data-theme="g100"]` so all `--cds-*` tokens resolve correctly | Don't ship a tree outside a theme scope — `--cds-layer-01`, `--cds-layer-hover-01`, `--cds-text-secondary`, etc. won't have values |
| Use `disabled` on parent nodes when an entire subtree is gated — the disabled cascade visually mutes children AND the keyboard navigator skips them | Don't disable individual leaves as a way to mark "completed" or "unavailable" status — use a different visual marker (icon, color, badge) and keep them keyboard-reachable |
| For dense file-tree-style sidebars (IDE, file browser), choose `size="xs"` + `WithIcons` + `Folder`/`Document` icons | Don't use TreeView for shallow 2-level menus — use SideNav or a flat list; tree is for genuinely hierarchical data (3+ levels of nesting in the wild) |
| When `hideLabel` is true, still pass `label="..."` so Carbon mounts the visually-hidden `<label>` as the tree's accessible name | Don't omit `label` on `hideLabel` trees — the outer `<ul role="tree">` will have no accessible name and screen readers will announce "tree" with no context |
| Use `multiselect` only when the user genuinely needs to select multiple nodes (e.g., "compare these 3 reports") — Carbon then sets `aria-multiselectable="true"` on the tree | Don't enable `multiselect` for navigational trees — selection in a nav tree means "current page" (single), and multiselect makes the keyboard pattern more complex (Space adds/removes from selection) |
| For controlled expansion (`WithControlledExpansion`), drive every `TreeNode`'s `isExpanded` prop from a single state via the recursive `renderTree` helper — Carbon's story is the canonical pattern | Don't try to call `setIsExpanded` on individual `TreeNode`s — they don't expose that API; you must re-render the tree with new `isExpanded` props on each node |
