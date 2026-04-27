---
name: progress-indicator
description: Carbon Progress Indicator — multi-step process / wizard stepper (NOT a progress bar) with horizontal + vertical orientation, optional secondary labels and descriptions, complete / current / incomplete / invalid / disabled step states, optional click-through (Interactive variant), and skeleton loading state; embeds verbatim Storybook source for Default, Interactive, and Skeleton variants.
metadata:
  tags: progress-indicator, stepper, wizard, multi-step, process, navigation, ibm, carbon, react, web-components
---

# Progress Indicator -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`ProgressIndicator.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ProgressIndicator/ProgressIndicator.stories.js)
> - **WC story:** [`progress-indicator.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/progress-indicator/progress-indicator.stories.ts)
> - **Core SCSS:** [`_progress-indicator.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/progress-indicator/_progress-indicator.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-progressindicator--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-progress-indicator--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/progress-indicator/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

> **Carbon-specific note:** The Progress Indicator is a **multi-step process / wizard stepper**, not a progress bar. The percentage-style progress bar is a different Carbon component (`ProgressBar`). Each step in this component represents a discrete stage in a flow — onboarding, checkout, multi-page form, deploy pipeline.

## Quick Reference

| Property | Value |
|---|---|
| Step row width (horizontal, default) | `128px` (`inline-size: convert.to-rem(128px)` on `.cds--progress-step`) |
| Step row min-width (horizontal, default) | `7rem` = `112px` (`min-inline-size: 7rem`) |
| Step row min-width (`spaceEqually`) | `8rem` = `128px` (`.cds--progress--space-equal .cds--progress-step { min-inline-size: 8rem }`) |
| Step row min-block-size (vertical) | `3.625rem` = `58px` (`min-block-size: 3.625rem` on vertical `.cds--progress-step`) |
| Indicator (svg) circle size | `16px × 16px` (`block-size: $spacing-05; inline-size: $spacing-05`, `$spacing-05 = 1rem = 16px`) |
| Indicator border-radius | `50%` (`border-radius: 50%` on `.cds--progress-step svg`) — the only rounded shape; everything else in Carbon is sharp `0` |
| Connector line thickness (horizontal) | `2px` (`block-size: 2px` on `.cds--progress-line`) |
| Connector line thickness (vertical) | `1px` (`inline-size: 1px` in `.cds--progress--vertical .cds--progress-line`) |
| Connector line length (horizontal, default) | `128px` (`inline-size: convert.to-rem(128px)` on `.cds--progress-line`) |
| Connector line length (horizontal, `spaceEqually`) | `100%` of step row (`inline-size: 100%` in `.cds--progress--space-equal .cds--progress-line`) |
| Connector line length (vertical) | `100%` of step row (`block-size: 100%`) |
| Indicator margin-top | `10px` (`margin-block-start: convert.to-rem(10px)` on `.cds--progress-step svg`) |
| Indicator margin-right (horizontal) | `8px` (`$spacing-03`) |
| Indicator margin (vertical) | `1px 8px 0` (`margin: convert.to-rem(1px) $spacing-03 0`) |
| Label font | IBM Plex Sans, `body-compact-01` — 14px / 18px line-height / 0.16px letter-spacing / weight 400 (with overridden `line-height: 1.45` for label wrap) |
| Label margin-top | `8px` (`margin: $spacing-03 0 0 0`) |
| Label max-width (horizontal) | `88px` (`max-inline-size: convert.to-rem(88px)`); ellipsis on overflow |
| Label max-width (`spaceEqually`) | `100%` (`max-inline-size: 100%`) |
| Label max-width (vertical) | `160px` (`max-inline-size: convert.to-rem(160px)`); allows wrap (`white-space: initial`) |
| Optional secondary label (`secondary-label` / `secondaryLabel`) | `label-01` type (12px), color `--cds-text-secondary`, `position: absolute`, `margin-block-start: 28px`, `margin-inline-start: 24px` (`$spacing-06`) — sits below label and right of indicator |
| Tooltip (single-line) | `body-01`, `inline-size: 125px`, `min-inline-size: 115px`, `padding: 8px 16px`, `margin-block-start: 40px`, `margin-inline-start: 22px` |
| Indicator color (incomplete) | `var(--cds-icon-primary)` (= `#161616` White / `#f4f4f4` G100) — outlined circle |
| Indicator color (current) | `var(--cds-interactive)` (= `#0f62fe` White / `#4589ff` G100) — filled blue circle, half-filled visual |
| Indicator color (complete) | `var(--cds-interactive)` (= `#0f62fe` White / `#4589ff` G100) — filled blue with white checkmark |
| Indicator color (invalid) | `var(--cds-support-error)` (= `#da1e28` White / `#fa4d56` G100) — red warning icon |
| Indicator color (disabled) | `var(--cds-icon-disabled)` (= `rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Connector color (incomplete) | `var(--cds-border-subtle)` (= `#e0e0e0` White / `#393939` G100, resolves to `border-subtle-00`) |
| Connector color (current → complete) | `var(--cds-interactive)` (= `#0f62fe` White / `#4589ff` G100) |
| Label color (rest) | `var(--cds-text-primary)` (= `#161616` White / `#f4f4f4` G100) |
| Label color (hover, clickable) | `var(--cds-link-primary-hover)` (= `#0043ce` White / `#a6c8ff` G100) — with 1px underline via `box-shadow` |
| Label color (focus-visible, clickable) | `var(--cds-focus)` (= `#0f62fe` White / `#ffffff` G100) — with 1px solid outline of same color |
| Label color (disabled) | `var(--cds-text-disabled)` (= `rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Skeleton label dimensions | `40px × 14px` (`inline-size: 40px; block-size: 14px`); `margin-block-start: 0.625rem` (= `10px`); vertical: `margin-block-start: 0.0625rem` (= `1px`) |
| Transition (label) | `box-shadow 110ms cubic-bezier(0.2, 0, 0.38, 0.9), color 110ms cubic-bezier(0.2, 0, 0.38, 0.9)` (`$duration-fast-02 motion(standard, productive)`) |
| React import | `import { ProgressIndicator, ProgressStep, ProgressIndicatorSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/progress-indicator/index.js';` |

## Variants (from Storybook story exports)

Every story export found in `ProgressIndicator.stories.js` (React) and `progress-indicator.stories.ts` (WC):

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Five-step horizontal indicator showcasing every step state — `complete` (with `secondaryLabel`), `current`, two unmarked (incomplete), `invalid` (with `secondaryLabel`), `disabled`. Args expose `currentIndex`, `spaceEqually`, `vertical`. |
| Interactive | `Interactive` | Three-step horizontal indicator with `currentIndex={1}` and `onChange={() => alert('Clicked')}` — entire step row becomes a button (`<cds-progress-step-button>` / `ProgressStepButton`); clicks fire onChange. |
| Skeleton | `Skeleton` | Loading placeholder. React: `<ProgressIndicatorSkeleton />` renders 4 skeleton steps. WC: `<cds-progress-indicator-skeleton>` wrapping four `<cds-progress-step-skeleton>` children. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `ProgressIndicator.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + story metadata** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { ProgressIndicator, ProgressStep, ProgressIndicatorSkeleton } from './';
import mdx from './ProgressIndicator.mdx';

export default {
  title: 'Components/ProgressIndicator',
  component: ProgressIndicator,
  subcomponents: {
    ProgressStep,
    ProgressIndicatorSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Interactive**

```jsx
export const Interactive = () => {
  return (
    <ProgressIndicator currentIndex={1} onChange={() => alert('Clicked')}>
      <ProgressStep
        label="Click me"
        description="Step 1: Register an onChange event"
      />
      <ProgressStep
        label="Really long label"
        description="The progress indicator will listen for clicks on the steps"
      />
      <ProgressStep
        label="Third step"
        description="The progress indicator will listen for clicks on the steps"
      />
    </ProgressIndicator>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <ProgressIndicatorSkeleton />;
};
```

**Variant: Default**

```jsx
export const Default = (args) => (
  <ProgressIndicator {...args}>
    <ProgressStep
      complete
      label="First step"
      description="Step 1: Getting started with Carbon Design System"
      secondaryLabel="Optional label"
    />
    <ProgressStep
      current
      label="Second step with tooltip"
      description="Step 2: Getting started with Carbon Design System"
    />
    <ProgressStep
      label="Third step with tooltip"
      description="Step 3: Getting started with Carbon Design System"
    />
    <ProgressStep
      label="Fourth step"
      description="Step 4: Getting started with Carbon Design System"
      invalid
      secondaryLabel="Example invalid step"
    />
    <ProgressStep
      label="Fifth step"
      description="Step 5: Getting started with Carbon Design System"
      disabled
    />
  </ProgressIndicator>
);

Default.args = {
  currentIndex: 0,
  spaceEqually: false,
  vertical: false,
};

Default.argTypes = {
  currentIndex: {
    control: { type: 'number' },
  },
  spaceEqually: {
    control: { type: 'boolean' },
  },
  vertical: {
    control: { type: 'boolean' },
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `progress-indicator.stories.ts` on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit, etc.). Note: lit-html `${...}` bindings remain unresolved here — see the next section for static HTML.

**Imports + shared args** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { action } from 'storybook/actions';
import './index';

const args = {
  currentIndex: 0,
  vertical: false,
  spaceEqually: false,
  iconLabel: '',
  secondaryLabel: 'Optional label',
};

const argTypes = {
  currentIndex: {
    control: 'number',
    description: 'Optionally specify the current step array index.',
  },
  vertical: {
    control: 'boolean',
    description:
      'Determines whether or not the Progress Indicator should be rendered vertically.',
  },
  spaceEqually: {
    control: 'boolean',
    description:
      'Specify whether progress steps should be split equally in size (horizontal only).',
  },
  iconLabel: {
    table: {
      disable: true,
    },
  },
  secondaryLabel: {
    control: 'text',
    description: 'The secondary progress label.',
  },
};
```

**Variant: Default**

```html
<cds-progress-indicator
  ?vertical="${vertical}"
  ?space-equally="${spaceEqually}"
  current-index="${currentIndex}">
  <cds-progress-step
    description="Step 1: Getting started with Carbon Design System"
    label="First step"
    secondary-label="${ifDefined(secondaryLabel)}"
    complete></cds-progress-step>
  <cds-progress-step
    description="Step 2: Getting started with Carbon Design System"
    label="Second step with tooltip"
    current></cds-progress-step>
  <cds-progress-step
    description="Step 3: Getting started with Carbon Design System"
    label="Third step with tooltip"></cds-progress-step>
  <cds-progress-step
    description="Step 4: Getting started with Carbon Design System"
    label="Fourth step"
    secondary-label="Example invalid step"
    invalid></cds-progress-step>
  <cds-progress-step
    disabled
    description="Step 5: Getting started with Carbon Design System"
    label="Fifth step"></cds-progress-step>
</cds-progress-indicator>
```

**Variant: Interactive**

```html
<cds-progress-indicator current-index="1" .onChange=${onChange}>
  <cds-progress-step
    label="Click me"
    description="Step 1: Register an onChange event"
    complete></cds-progress-step>
  <cds-progress-step
    label="Really long label"
    description="The progress indicator will listen for clicks on the steps"
    current></cds-progress-step>
  <cds-progress-step
    label="Third step"
    description="The progress indicator will listen for clicks on the steps"></cds-progress-step>
</cds-progress-indicator>
```

**Variant: Skeleton**

```html
<cds-progress-indicator-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
</cds-progress-indicator-skeleton>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings resolved to static attributes (using the default `args` values: `currentIndex: 0`, `vertical: false`, `spaceEqually: false`, `secondaryLabel: 'Optional label'`). Use this for hand-coded HTML without a component framework. The `<cds-*>` elements still require the WC bundle — `import '@carbon/web-components/es/components/progress-indicator/index.js';` — to upgrade them.

**Variant: Default** (horizontal, `currentIndex="0"`, with all five step states)

```html
<cds-progress-indicator current-index="0">
  <cds-progress-step
    description="Step 1: Getting started with Carbon Design System"
    label="First step"
    secondary-label="Optional label"
    complete></cds-progress-step>
  <cds-progress-step
    description="Step 2: Getting started with Carbon Design System"
    label="Second step with tooltip"
    current></cds-progress-step>
  <cds-progress-step
    description="Step 3: Getting started with Carbon Design System"
    label="Third step with tooltip"></cds-progress-step>
  <cds-progress-step
    description="Step 4: Getting started with Carbon Design System"
    label="Fourth step"
    secondary-label="Example invalid step"
    invalid></cds-progress-step>
  <cds-progress-step
    disabled
    description="Step 5: Getting started with Carbon Design System"
    label="Fifth step"></cds-progress-step>
</cds-progress-indicator>
```

**Variant: Default — Vertical** (toggle `vertical: true`)

```html
<cds-progress-indicator vertical current-index="0">
  <cds-progress-step
    description="Step 1: Getting started with Carbon Design System"
    label="First step"
    secondary-label="Optional label"
    complete></cds-progress-step>
  <cds-progress-step
    description="Step 2: Getting started with Carbon Design System"
    label="Second step with tooltip"
    current></cds-progress-step>
  <cds-progress-step
    description="Step 3: Getting started with Carbon Design System"
    label="Third step with tooltip"></cds-progress-step>
  <cds-progress-step
    description="Step 4: Getting started with Carbon Design System"
    label="Fourth step"
    secondary-label="Example invalid step"
    invalid></cds-progress-step>
  <cds-progress-step
    disabled
    description="Step 5: Getting started with Carbon Design System"
    label="Fifth step"></cds-progress-step>
</cds-progress-indicator>
```

**Variant: Default — Equally spaced** (toggle `spaceEqually: true`; lines stretch to fill row)

```html
<cds-progress-indicator space-equally current-index="0">
  <cds-progress-step
    description="Step 1"
    label="First step"
    complete></cds-progress-step>
  <cds-progress-step
    description="Step 2"
    label="Second step"
    current></cds-progress-step>
  <cds-progress-step
    description="Step 3"
    label="Third step"></cds-progress-step>
  <cds-progress-step
    description="Step 4"
    label="Fourth step"></cds-progress-step>
</cds-progress-indicator>
```

**Variant: Interactive** (clickable steps; entire step row is a button)

```html
<cds-progress-indicator current-index="1">
  <cds-progress-step
    label="Click me"
    description="Step 1: Register an onChange event"
    complete></cds-progress-step>
  <cds-progress-step
    label="Really long label"
    description="The progress indicator will listen for clicks on the steps"
    current></cds-progress-step>
  <cds-progress-step
    label="Third step"
    description="The progress indicator will listen for clicks on the steps"></cds-progress-step>
</cds-progress-indicator>
<script>
  document
    .querySelector('cds-progress-indicator')
    .addEventListener('cds-progress-step-clicked', (e) => {
      // e.detail.index is the clicked step's index
      console.log('Clicked step', e.detail);
    });
</script>
```

**Variant: Skeleton** (loading placeholder)

```html
<cds-progress-indicator-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
  <cds-progress-step-skeleton></cds-progress-step-skeleton>
</cds-progress-indicator-skeleton>
```

> **Internal markup the WC renders for each step** (for reference when hand-coding without `<cds-*>` elements — the rendered DOM looks like this once Carbon's React `ProgressStep` mounts):
>
> ```html
> <ul class="cds--progress">
>   <li class="cds--progress-step cds--progress-step--complete">
>     <button class="cds--progress-step-button" type="button" tabindex="0" aria-disabled="false">
>       <svg aria-label="Complete" class="cds--progress__warning" width="16" height="16" viewBox="0 0 16 16">
>         <!-- CheckmarkOutline16 from @carbon/icons -->
>         <path d="M8 1a7 7 0 1 0 7 7 7 7 0 0 0-7-7zm0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6z"/>
>         <path d="M7 11L4.3 8.3l.7-.7L7 9.6l4-4 .7.7z"/>
>       </svg>
>       <span class="cds--progress-line"></span>
>       <div class="cds--progress-text">
>         <p class="cds--progress-label" title="First step">First step</p>
>         <p class="cds--progress-optional">Optional label</p>
>       </div>
>     </button>
>   </li>
>   <li class="cds--progress-step cds--progress-step--current">
>     <button class="cds--progress-step-button" type="button" tabindex="0" aria-current="step">
>       <svg aria-label="Current" width="16" height="16" viewBox="0 0 16 16">
>         <!-- CircleDash16 / half-filled circle from @carbon/icons -->
>         <path d="M8 0a8 8 0 1 0 8 8 8 8 0 0 0-8-8zm0 14V2a6 6 0 0 1 0 12z"/>
>       </svg>
>       <span class="cds--progress-line"></span>
>       <div class="cds--progress-text">
>         <p class="cds--progress-label">Second step with tooltip</p>
>       </div>
>     </button>
>   </li>
>   <li class="cds--progress-step cds--progress-step--incomplete">
>     <button class="cds--progress-step-button cds--progress-step-button--unclickable" type="button" tabindex="-1">
>       <svg aria-label="Incomplete" width="16" height="16" viewBox="0 0 16 16">
>         <!-- Circle outline -->
>         <path d="M8 1a7 7 0 1 0 7 7 7 7 0 0 0-7-7zm0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6z"/>
>       </svg>
>       <span class="cds--progress-line"></span>
>       <div class="cds--progress-text">
>         <p class="cds--progress-label">Third step with tooltip</p>
>       </div>
>     </button>
>   </li>
>   <li class="cds--progress-step cds--progress-step--incomplete">
>     <button class="cds--progress-step-button cds--progress-step-button--unclickable" type="button" tabindex="-1">
>       <svg aria-label="Invalid" class="cds--progress__warning" width="16" height="16" viewBox="0 0 16 16">
>         <!-- WarningFilled16 -->
>         <path d="M8 1a7 7 0 1 0 7 7A7 7 0 0 0 8 1zm-.5 3h1v5h-1zm.5 8a.75.75 0 1 1 .75-.75A.75.75 0 0 1 8 12z"/>
>       </svg>
>       <span class="cds--progress-line"></span>
>       <div class="cds--progress-text">
>         <p class="cds--progress-label">Fourth step</p>
>         <p class="cds--progress-optional">Example invalid step</p>
>       </div>
>     </button>
>   </li>
>   <li class="cds--progress-step cds--progress-step--incomplete cds--progress-step--disabled">
>     <button class="cds--progress-step-button cds--progress-step-button--unclickable" type="button" tabindex="-1" disabled>
>       <svg aria-label="Incomplete" width="16" height="16" viewBox="0 0 16 16">
>         <path d="M8 1a7 7 0 1 0 7 7 7 7 0 0 0-7-7zm0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6z"/>
>       </svg>
>       <span class="cds--progress-line"></span>
>       <div class="cds--progress-text">
>         <p class="cds--progress-label">Fifth step</p>
>       </div>
>     </button>
>   </li>
> </ul>
> ```

## Design Tokens (component-scoped)

Resolved to literal hex from `overview.md`'s `[data-theme="white"]` and `[data-theme="g100"]` blocks. The Progress Indicator uses Carbon's semantic tokens directly (no `--cds-progress-*` namespace exists in v11) — these aliases simply make the per-state mapping explicit.

```css
[data-theme="white"] {
  /* Indicator (svg circle) fills */
  --cds-progress-indicator-incomplete: #161616;            /* icon-primary  */
  --cds-progress-indicator-current:    #0f62fe;            /* interactive   */
  --cds-progress-indicator-complete:   #0f62fe;            /* interactive   */
  --cds-progress-indicator-invalid:    #da1e28;            /* support-error */
  --cds-progress-indicator-disabled:   rgba(22, 22, 22, 0.25); /* icon-disabled */

  /* Connector line backgrounds */
  --cds-progress-line-incomplete:      #e0e0e0;            /* border-subtle (resolves to border-subtle-00 in White) */
  --cds-progress-line-current:         #0f62fe;            /* interactive   */
  --cds-progress-line-complete:        #0f62fe;            /* interactive   */

  /* Label text */
  --cds-progress-label-primary:        #161616;            /* text-primary    */
  --cds-progress-label-secondary:      #525252;            /* text-secondary (used for .cds--progress-optional) */
  --cds-progress-label-disabled:       rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-progress-label-hover:          #0043ce;            /* link-primary-hover */
  --cds-progress-label-focus:          #0f62fe;            /* focus           */

  /* Tooltip */
  --cds-progress-tooltip-bg:           #393939;            /* background-inverse */
  --cds-progress-tooltip-text:         #ffffff;            /* text-inverse       */

  /* Skeleton */
  --cds-progress-skeleton-bg:          #e8e8e8;            /* skeleton-background */
}

[data-theme="g100"],
.dark {
  /* Indicator (svg circle) fills */
  --cds-progress-indicator-incomplete: #f4f4f4;            /* icon-primary  */
  --cds-progress-indicator-current:    #4589ff;            /* interactive   */
  --cds-progress-indicator-complete:   #4589ff;            /* interactive   */
  --cds-progress-indicator-invalid:    #fa4d56;            /* support-error */
  --cds-progress-indicator-disabled:   rgba(244, 244, 244, 0.25); /* icon-disabled */

  /* Connector line backgrounds */
  --cds-progress-line-incomplete:      #393939;            /* border-subtle (resolves to border-subtle-00 in G100) */
  --cds-progress-line-current:         #4589ff;            /* interactive   */
  --cds-progress-line-complete:        #4589ff;            /* interactive   */

  /* Label text */
  --cds-progress-label-primary:        #f4f4f4;            /* text-primary    */
  --cds-progress-label-secondary:      #c6c6c6;            /* text-secondary  */
  --cds-progress-label-disabled:       rgba(244, 244, 244, 0.25); /* text-disabled */
  --cds-progress-label-hover:          #a6c8ff;            /* link-primary-hover */
  --cds-progress-label-focus:          #ffffff;            /* focus           */

  /* Tooltip */
  --cds-progress-tooltip-bg:           #f4f4f4;            /* background-inverse */
  --cds-progress-tooltip-text:         #161616;            /* text-inverse       */

  /* Skeleton */
  --cds-progress-skeleton-bg:          #292929;            /* skeleton-background */
}
```

## States Reference (from `_progress-indicator.scss`)

> Pulled verbatim from [`packages/styles/scss/components/progress-indicator/_progress-indicator.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/progress-indicator/_progress-indicator.scss). The SCSS file is the single source of truth for state-specific styling.

### Per-step state matrix

| State | Selector | Indicator (svg fill) | Connector line (background-color) | Label color | Cursor / pointer |
|---|---|---|---|---|---|
| Incomplete (default) | `.cds--progress-step--incomplete` | `$icon-primary` (`#161616` White / `#f4f4f4` G100) | `$border-subtle` (`#e0e0e0` White / `#393939` G100) | `$text-primary` | `pointer` if clickable, else `default` |
| Current | `.cds--progress-step--current` | `$interactive` (`#0f62fe` White / `#4589ff` G100) — half-filled circle SVG | `$interactive` (`#0f62fe` / `#4589ff`) | `$text-primary`, label rendered with `aria-current="step"` | same |
| Complete | `.cds--progress-step--complete` | `$interactive` (`#0f62fe` / `#4589ff`) — `CheckmarkOutline16` | `$interactive` (`#0f62fe` / `#4589ff`) | `$text-primary` | same |
| Invalid | `.cds--progress-step` with `invalid` prop, svg gets class `.cds--progress__warning` | `$support-error` (`#da1e28` White / `#fa4d56` G100) — `WarningFilled16` | `$border-subtle` (state remains incomplete) | `$text-primary` | same |
| Disabled | `.cds--progress-step--disabled` | `$icon-disabled` (`rgba(22,22,22,0.25)` / `rgba(244,244,244,0.25)`) | inherits `.cds--progress-line` color, `cursor: not-allowed` | `$text-disabled` (`rgba(22,22,22,0.25)` / `rgba(244,244,244,0.25)`) | `cursor: not-allowed; pointer-events: none;` |

### Per-label interaction states (Interactive variant)

| State | Selector | Color | Decoration / outline | Notes |
|---|---|---|---|---|
| Rest | `.cds--progress-label` | `$text-primary` | none | `transition: box-shadow 110ms cubic-bezier(0.2,0,0.38,0.9), color 110ms ...` |
| Hover (clickable) | `.cds--progress-label:hover` | `$link-primary-hover` (`#0043ce` / `#a6c8ff`) | `box-shadow: 0 1px $link-primary-hover` (1px underline) | `cursor: pointer` |
| Hover (unclickable) | `.cds--progress-step-button--unclickable .cds--progress-label:hover` | `$text-primary` | `box-shadow: none` | `cursor: default` (overrides clickable hover) |
| Active (clickable) | `.cds--progress-step-button:not(--unclickable) .cds--progress-label:active` | `$text-primary` | `box-shadow: 0 1px 0 0 $text-primary` | — |
| Focus-visible (clickable) | `.cds--progress-step-button:focus-visible .cds--progress-label` | `$focus` (`#0f62fe` / `#ffffff`) | `outline: 1px solid $focus` | The button itself has `outline: none` on `:focus`; outline is applied to the inner label element. |
| Disabled | `.cds--progress-step--disabled .cds--progress-label` | `$text-disabled` | `box-shadow: none` | `cursor: not-allowed` |

### Per-element layout primitives

| Element | Selector | Key styles |
|---|---|---|
| List container | `.cds--progress` | `display: flex; list-style: none;` (component-reset applied — no list bullets, no padding) |
| Vertical container | `.cds--progress--vertical` | `display: flex; flex-direction: column;` |
| Step row (horizontal) | `.cds--progress-step` | `position: relative; display: inline-flex; flex-direction: row; inline-size: 128px; min-inline-size: 7rem;` |
| Step row (vertical) | `.cds--progress--vertical .cds--progress-step` | `align-content: flex-start; inline-size: initial; min-block-size: 3.625rem; min-inline-size: initial;` |
| Step row (`spaceEqually`) | `.cds--progress--space-equal .cds--progress-step` | `flex-grow: 1; min-inline-size: 8rem;` |
| Indicator (svg) | `.cds--progress-step svg` | `position: relative; z-index: 1; flex-shrink: 0; border-radius: 50%; block-size: 16px; inline-size: 16px; fill: $interactive; margin-block-start: 10px; margin-inline-end: 8px;` |
| Indicator (vertical) | `.cds--progress--vertical .cds--progress-step svg` | `display: inline-block; margin: 1px 8px 0;` |
| Connector line (horizontal) | `.cds--progress-line` | `position: absolute; border: 1px inset transparent; block-size: 2px; inline-size: 128px; inset-inline-start: 0;` |
| Connector line (vertical) | `.cds--progress--vertical .cds--progress-line` | `position: absolute; block-size: 100%; inline-size: 1px; inset-block-start: 0; inset-inline-start: 0;` |
| Connector line (`spaceEqually`) | `.cds--progress--space-equal .cds--progress-line` | `inline-size: 100%; min-inline-size: 128px;` |
| Label | `.cds--progress-label` | `display: block; overflow: hidden; margin: 8px 0 0 0; color: $text-primary; line-height: 1.45; max-inline-size: 88px; text-overflow: ellipsis; white-space: nowrap;` (`@include type-style('body-compact-01')`) |
| Label (vertical) | `.cds--progress--vertical .cds--progress-label` | `display: inline-block; margin: 0; max-inline-size: 160px; vertical-align: top; white-space: initial;` |
| Optional secondary label | `.cds--progress-optional` | `position: absolute; display: block; color: $text-secondary; inset-inline-start: 0; margin-block-start: 28px; margin-inline-start: 24px; text-align: start;` (`@include type-style('label-01')` — 12px) |
| Optional label (vertical) | `.cds--progress--vertical .cds--progress-optional` | `position: static; margin: 0 0 auto; inline-size: 100%;` |
| Step button | `.cds--progress-step-button` | `@include button-reset.reset; display: flex; text-align: start;` |
| Step button (unclickable) | `.cds--progress-step-button--unclickable` | `cursor: default; outline: none;` |
| Skeleton label | `.cds--progress.cds--skeleton .cds--progress-label` | `@include skeleton; block-size: 14px; inline-size: 40px; margin-block-start: 0.625rem;` (vertical: `0.0625rem`) |

## Animation & Motion

Carbon's source applies a single transition to the label, using motion tokens `$duration-fast-02` (110ms) + `motion(standard, productive)` (= `cubic-bezier(0.2, 0, 0.38, 0.9)`). The connector line and the indicator svg do not have their own transitions — colour changes happen instantly when `complete` / `current` flips.

```css
/* From _progress-indicator.scss (verbatim transition block, with literal motion values) */
.cds--progress-label {
  transition:
    box-shadow 110ms cubic-bezier(0.2, 0, 0.38, 0.9),
    color      110ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

/* The skeleton element pulses via @include skeleton — that mixin animates background-color
   on $skeleton-background ↔ $skeleton-element with duration-moderate-02 (240ms) sinusoidal. */

@media (prefers-reduced-motion: reduce) {
  .cds--progress-label { transition: none; }
  .cds--progress.cds--skeleton .cds--progress-label { animation: none; }
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic element:** `<ul class="cds--progress">` for the container, `<li class="cds--progress-step">` for each step. The list semantics communicate "this is a sequence" to assistive tech.
- **Step button:** when `onChange` is provided (Interactive variant), each step's clickable surface is rendered as `<button class="cds--progress-step-button" type="button">` — keyboard-focusable, fires the React `onChange(index)` / WC `cds-progress-step-clicked` event. When no `onChange` is provided, Carbon adds `.cds--progress-step-button--unclickable` and removes the focus indicator (`outline: none`); the button still exists in the DOM but is non-interactive.
- **ARIA:**
  - The current step's button receives `aria-current="step"` (Carbon's convention for wizard steppers).
  - The disabled step's button receives `disabled` + `aria-disabled="true"`; pointer events are blocked via `pointer-events: none` in the SCSS.
  - The svg indicator has `aria-label` matching its state — `"Complete"`, `"Current"`, `"Incomplete"`, `"Invalid"`. (For the invalid icon, the SVG also gets the class `.cds--progress__warning` which fills it `$support-error`.)
  - The label element gets `title="…"` when the text overflows (`.cds--progress-label-overflow` class) so the full string surfaces in the native browser tooltip + the Carbon tooltip below.
- **Keyboard (Interactive variant only):**
  - `Tab` / `Shift+Tab` move focus between step buttons.
  - `Enter` / `Space` on a focused step button fires the `onChange(index)` callback.
  - Disabled steps are removed from the tab order (`tabindex="-1"` is applied via the `--unclickable` modifier when also `--disabled`).
- **Focus management:** `:focus` on `.cds--progress-step-button` removes the default outline (`outline: none`); `:focus-visible` on the same selector applies `color: $focus` + `outline: 1px solid $focus` to the inner `.cds--progress-label`. This means the focus ring lands on the label, not the button — visually this puts the indicator inside the focus rectangle alongside the text.
- **Touch target:** the rendered step button is wider than the 44×44 minimum on horizontal layout (128px row × ~36px tall content area) but the vertical mode's `min-block-size: 3.625rem` (= 58px) keeps it comfortably above 44px on mobile. For very small viewports prefer `vertical` orientation.
- **Tooltip on overflow:** when the label string exceeds `max-inline-size: 88px`, Carbon renders a Carbon Tooltip (`body-01` text on `text-inverse` background) that appears on hover OR focus of `.cds--progress-label-overflow`. The tooltip is `visibility: hidden` by default and made visible via the sibling-selector rule `.cds--progress-label-overflow:hover ~ .cds--tooltip { visibility: inherit; }`.
- **Color contrast:** the current/complete blue indicator (`#0f62fe` on `#ffffff`) is 4.74:1 (AA Large + AA Normal); in G100 the `#4589ff` indicator on `#161616` is 6.99:1 (AAA). The disabled state (`rgba(*, 0.25)`) intentionally falls below AA — Carbon's pattern is "disabled state is non-actionable so contrast guidance is relaxed". Pair `disabled` with helper text describing why the step is unreachable.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — `<ProgressIndicator>` / `<cds-progress-indicator>` with child `<ProgressStep>` / `<cds-progress-step>` elements | Don't substitute a generic `<ol>` + `<div>` stepper of your own design — the SCSS only resolves against the `cds--progress*` class names |
| Mark exactly one step as `current` (or set `currentIndex` on the parent) — Carbon also auto-derives `complete` for steps with `index < currentIndex` when you don't pass them explicitly | Don't mark multiple steps `current` — the `aria-current="step"` and the half-filled svg only make sense for one step at a time |
| Use `secondaryLabel` for an inline subtitle (e.g., "Optional", "Example invalid step") and `description` for the overflow-tooltip body | Don't use `description` as a visible subtitle — it is rendered into the tooltip, not the visible row |
| Use sharp corners (`border-radius: 0`) everywhere except the 16px indicator svg, which is `border-radius: 50%` | Don't add `border-radius` to the connector line, the label, or the row — Carbon's stepper is built on the same sharp grammar as the rest of v11 |
| Use vertical orientation (`vertical` / `vertical={true}`) for narrow viewports, sidebars, and >5-step flows | Don't squeeze a 7-step horizontal indicator into <600px — labels truncate to `max-inline-size: 88px` with ellipsis and the experience degrades; switch to `vertical` instead |
| Provide `onChange` only when previous steps are genuinely revisitable (e.g., a multi-step form where editing earlier sections is allowed) | Don't add `onChange` to a one-way pipeline (deploy, payment confirmation) — Carbon will then render every step as a focusable button which misleads users about reversibility |
| Use the `invalid` prop on a step that failed validation server-side or had an unrecoverable error; pair with a `secondaryLabel` describing the failure | Don't use `invalid` for soft warnings — there is no `warn` variant for ProgressStep; use a Notification component beside the indicator for transient warnings |
| Wrap the indicator in `[data-theme="white"]` / `[data-theme="g100"]` (or rely on the page-level `<html>` data-theme) | Don't define your own theme classes — the SCSS reads its colour tokens directly from `$interactive`, `$icon-primary`, `$border-subtle`, `$support-error`, `$text-primary`, `$text-disabled`, `$text-secondary`, `$focus`, `$link-primary-hover` |
| Use the `Skeleton` variant during data fetch — render exactly the same number of step skeletons as your final indicator will have | Don't crossfade from skeleton to data — Carbon's productive motion swaps content immediately at `duration-fast-02` (110ms); a longer crossfade reads as sluggish |
