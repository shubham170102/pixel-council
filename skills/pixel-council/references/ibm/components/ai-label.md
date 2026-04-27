---
name: ai-label
description: Carbon's flagship 2024+ AI surface system — three composable components in one reference. (1) **AILabel** — small badge anchored to any element that opens an AI explanation popover (sizes mini/2xs/xs/sm/md/lg/xl, kinds default/inline, with optional revert toggle and 12-position alignment); (2) **AISkeleton** — loading placeholders (`AISkeletonText`, `AISkeletonPlaceholder`, `AISkeletonIcon`) that pulse with the AI aura colour `#4589ff` instead of the regular `#c6c6c6` skeleton grey; (3) **ChatButton** — chat-shell button with `border-radius` rounded to the size's height (24/20/16px) and a `isQuickAction` chip variant. Powered by 14 `--cds-ai-*` and 14 `--cds-chat-*` tokens (Aura gradient, AI border, AI inner-shadow, AI popover background, chat-bubble user/agent colours). **AI ELEMENTS BREAK CARBON'S SHARP-CORNER RULE** — popover surface uses `border-radius: 8px`, inline AI label `1px`, ChatButton `16/20/24px` (size-dependent). Plus the `aiAura` border-box / padding-box dual-gradient pattern for adding AI affordance to any Tile or Modal.
metadata:
  tags: ai-label, ai, slug, ai-skeleton, chat-button, ai-aura, ai-popover, ai-gradient, sparkle, badge, popover, skeleton, chat-bubble, ai-tile, ai-modal, generative, ibm, carbon, react, web-components
---

# AI Label, AI Skeleton & Chat Button -- IBM Carbon Design System

> **Composite reference** — this single file documents the three components that make up Carbon's AI/chat surface system. They share tokens (`--cds-ai-*`, `--cds-chat-*`) and a common visual language (the AI Aura linear-gradient), so they are documented together. When the user asks for "AI Label", "AI badge", "AI skeleton", "chat button", "AI tile", or "generative-AI explainability", read this entire file.
>
> Source (verbatim Storybook code embedded below):
> - **React story (AILabel):** [`AILabel.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/AILabel/AILabel.stories.js) — exports `Default`, `Inline`, `InlineWithContent`.
> - **React story (AISkeletonText):** [`AISkeletonText.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/AISkeleton/AISkeletonText.stories.js) — exports `_AISkeletonText`.
> - **React story (AISkeletonPlaceholder):** [`AISkeletonPlaceholder.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/AISkeleton/AISkeletonPlaceholder.stories.js) — exports `_AISkeletonPlaceholder`.
> - **React story (AISkeletonIcon):** [`AISkeletonIcon.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/AISkeleton/AISkeletonIcon.stories.js) — exports `_AISkeletonIcon`.
> - **React story (ChatButton):** [`ChatButton.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ChatButton/ChatButton.stories.js) — exports `Default`. (Title path: `Preview/preview__ChatButton` — still in preview at v11 but used in production by IBM watsonx, Maximo, and Watson Assistant chat shells.)
> - **WC story (ai-label):** [`ai-label.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ai-label/ai-label.stories.ts) — exports `Default`, `Inline`, `InlineWithContent`.
> - **WC story (ai-skeleton-text):** [`ai-skeleton-text.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ai-skeleton/ai-skeleton-text.stories.ts) — exports `AISkeletonText`.
> - **WC story (ai-skeleton-placeholder):** [`ai-skeleton-placeholder.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ai-skeleton/ai-skeleton-placeholder.stories.ts) — exports `AISkeletonPlaceholder`.
> - **WC story (ai-skeleton-icon):** [`ai-skeleton-icon.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ai-skeleton/ai-skeleton-icon.stories.ts) — exports `AISkeletonIcon`.
> - **WC story (chat-button):** [`chat-button.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/chat-button/chat-button.stories.ts) — exports `Default`.
> - **AI Label SCSS (`@carbon/styles`):** [`_ai-label.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/ai-label/_ai-label.scss) — 18-line stub that `@use`s `slug`. **All AI Label styling lives in `_slug.scss`** (the AI Label was renamed from "Slug" in v11.40 but the SCSS file kept the legacy name; the `cds--ai-label` and `cds--slug` class selectors are dual-emitted by the same mixin).
> - **Slug SCSS (the real source):** [`_slug.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/slug/_slug.scss) (1 125 lines) — defines the 7-size `$sizes` map, the `__button` reset, `__text` rendering of the "AI" wordmark, `--inline` and `--inline-with-content` variants, AI-popover-gradient mixin call on `cds--ai-label-content`, plus all 12 caret position selectors.
> - **Chat Button SCSS:** [`_chat-button.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/chat-button/_chat-button.scss) (87 lines) — `border-radius: 24/20/16px` rule, the `--quick-action` chip variant rules.
> - **AI Skeleton SCSS (WC):** [`ai-skeleton.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ai-skeleton/ai-skeleton.scss) — host-block layout shim. Animation comes from the shared `@mixin skeleton` in [`utilities/_skeleton.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/utilities/_skeleton.scss).
> - **AI Gradient utility:** [`utilities/_ai-gradient.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/utilities/_ai-gradient.scss) — defines the `@mixin ai-gradient`, `@mixin ai-table-gradient`, and `@mixin ai-popover-gradient` mixins consumed by AILabel, AI tile, AI modal, and AI data-table.
> - **Story SCSS (AI Label):** [`ailabel-story.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/AILabel/ailabel-story.scss) (203 lines) — example container layout (`.ai-label-container-example`, `.ai-label-tile-container`, `.ai-label-heading` 2.625rem hero) used in the screenshots.
> - **Story SCSS (Chat Button):** [`chat-button-story.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ChatButton/chat-button-story.scss) (14 lines) — the `.test-button-*` row containers.
> - **Storybook live (AILabel React):** https://react.carbondesignsystem.com/?path=/story/components-ailabel--default
> - **Storybook live (AILabel WC):** https://web-components.carbondesignsystem.com/?path=/story/components-ai-label--default
> - **Storybook live (AISkeleton React):** https://react.carbondesignsystem.com/?path=/story/components-skeleton-aiskeleton--ai-skeleton-text
> - **Storybook live (AISkeleton WC):** https://web-components.carbondesignsystem.com/?path=/story/components-skeleton-ai-skeleton--ai-skeleton-text
> - **Storybook live (ChatButton React):** https://react.carbondesignsystem.com/?path=/story/preview-preview-chatbutton--default
> - **Storybook live (ChatButton WC):** https://web-components.carbondesignsystem.com/?path=/story/preview-chat-button--default
> - **Docs page:** https://carbondesignsystem.com/components/ai-label/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim from the Carbon repo under that license.

## Quick Reference

| Property | Value |
|---|---|
| **Corner radius (AILabel button, default kind)** | **`border-radius: 0`** (sharp — Carbon default). The AI Label badge is a sharp-cornered square. |
| **Corner radius (AILabel button, `inline` kind)** | **`border-radius: 1px`** (`convert.to-rem(1px)` from `_slug.scss` line 160) — **CARBON EXCEPTION (microscopic)**. The inline label has a 1px radius to soften its tiny outline. |
| **Corner radius (AI popover surface — `cds--ai-label-content`)** | **`border-radius: 8px`** (`convert.to-rem(8px)` from `_slug.scss` line 320) — **CARBON EXCEPTION**. AI popovers are soft-cornered (vs. regular Popover's `2px`) to communicate "magical / generative" affordance. |
| **Corner radius (ChatButton, `lg` size)** | **`border-radius: 24px`** (`convert.to-rem(24px)` — `_chat-button.scss` line 16) — **CARBON EXCEPTION**. Pill-shaped: half the lg button height (48px). |
| **Corner radius (ChatButton, `md` size)** | **`border-radius: 20px`** (line 24) — pill-shaped: half the md height (40px). |
| **Corner radius (ChatButton, `sm` size)** | **`border-radius: 16px`** (line 28) — pill-shaped: half the sm height (32px). |
| **Corner radius (ChatButtonSkeleton)** | Inherits the `cds--btn` size class radius via `.cds--chat-btn.cds--skeleton { overflow: hidden; }` — same 16/20/24px pill. |
| **Corner radius (AISkeleton placeholder/text/icon)** | `border-radius: 0` (sharp — inherits the regular `cds--skeleton__placeholder` / `cds--skeleton__text` / `cds--icon--skeleton` rules with **no radius added**). |
| AILabel sizes (`mini`/`2xs`/`xs`/`sm`/`md`/`lg`/`xl`) | **16px / 20px / 24px / 32px / 40px / 48px / 64px** (square — height = width). From `$sizes` map in `_slug.scss` lines 20–63. |
| AILabel font-size per size | mini `9px` · 2xs `12px` · xs `12px` · sm `16px` · md `16px` · lg `16px` · xl `20px` (line-height: `12/16/16/21/21/21/26px`). |
| AILabel click-target augmentation | `mini` and `2xs` get a transparent `::after` pseudo of `24×24px` (AAA touch). Lines 107–117. |
| AILabel border (default kind, rest) | `1px solid var(--cds-border-inverse)` (`#161616` White / `#161616` G10 / `#f4f4f4` G90 / `#ffffff` G100). |
| AILabel background (default kind, rest) | `transparent` — sits on parent surface. The "AI" wordmark is `var(--cds-text-primary)` `font-weight: 600`. |
| AILabel hover (default kind) | `background: var(--cds-border-inverse)`, `color: var(--cds-background)` (inverts to a filled black-on-white badge). |
| AILabel focus (default kind) | `border: 1px solid var(--cds-focus)` + `box-shadow: inset 0 0 0 1px var(--cds-focus)`. |
| AILabel active (default kind) | hover background + double inset `box-shadow: inset 0 0 0 1px focus, inset 0 0 0 2px focus-inset`. |
| AILabel inline kind | `border: 1px solid transparent`, `border-radius: 1px`, `padding-inline: 4px`, height auto. Renders the "AI" text inline with adjacent copy. |
| AILabel inline-with-content | Adds `border: 1px solid var(--cds-border-inverse)` + `padding-block: 2px` + `padding-inline: 8px` so the badge wraps the AI wordmark **and** an additional inline text label (e.g., "AI - Text goes here"). |
| AI popover surface (`cds--ai-label-content`) | Background: `@include ai-popover-gradient()` (dual-stop gradient, see Section 8). Border: `1px solid transparent` (the visible "border" is the second gradient layer painted into `border-box`). Border-radius: **`8px`**. Min inline-size: `280px`. Box-shadow stack: `inset 0 -80px 70px -65px var(--cds-ai-inner-shadow), -40px 44px 60px -24px var(--cds-ai-popover-shadow-outer-01), -56px 64px 64px -24px var(--cds-ai-popover-shadow-outer-02)`. |
| ChatButton heights | `sm: 32px`, `md: 40px`, `lg: 48px` (inherits from `cds--btn--sm/md/lg`). The `isQuickAction` variant uses the same heights. |
| ChatButton padding override | Without an icon: `padding-inline-end: 15px` (line 20). Quick-action: 1px solid border + transparent background. |
| ChatButton kinds | `primary` · `secondary` · `tertiary` · `ghost` · `danger` (passed through to underlying `cds--btn--{kind}`). |
| ChatButton quick-action states | rest `transparent` bg + `1px solid var(--cds-chat-button)` border + `var(--cds-chat-button)` text. Hover: `var(--cds-chat-button-hover)` bg + `var(--cds-chat-button-text-hover)` text + transparent border. Active: `var(--cds-chat-button-active)` bg. Selected: `var(--cds-chat-button-selected)` bg + `var(--cds-chat-button-text-selected)` text. |
| AISkeleton text dimensions | `block-size: 1rem` (16px), `inline-size: 100%`, `margin-block-end: var(--cds-spacing-03)` (8px). Heading variant: `block-size: 1.5rem` (24px). |
| AISkeleton placeholder dimensions | `block-size: 100px`, `inline-size: 100px` (default — `<AISkeletonPlaceholder>` is intended to be sized by parent CSS). |
| AISkeleton icon dimensions | `block-size: 16px`, `inline-size: 16px`. |
| AISkeleton background colour | `var(--cds-ai-skeleton-background)` = **`#4589ff`** (blue-50 in light themes, `#78a9ff` in dark) — replaces the standard `--cds-skeleton-background` `#e8e8e8`. |
| AISkeleton element (shimmer) colour | `var(--cds-ai-skeleton-element-background)` = **`rgba(15, 98, 254, 0.3)`** (blue-60 @ 30% in light themes, `rgba(255, 255, 255, 0.3)` in dark). |
| AISkeleton animation | `3000ms ease-in-out cds--skeleton infinite` (shared `@keyframes cds--skeleton` — same timing as regular skeleton, only the colours differ). |
| Transitions (AILabel button) | `color`, `border-color`, `box-shadow`, `background` all `var(--cds-duration-fast-01)` (`70ms`) `cubic-bezier(0.4, 0.14, 0.3, 1)` (productive-entrance). |
| Reduced motion | AISkeleton: `@media (prefers-reduced-motion: reduce) { animation: none; }` (from `utilities/_skeleton.scss` line 43). AILabel transitions remain on (they're sub-100ms). |
| ARIA (AILabel) | `<button class="cds--ai-label__button" aria-label="Show information" aria-haspopup="dialog" aria-expanded="…">` — opens a `<div role="dialog">` popover (via the shared `cds-toggletip` mechanism). |
| ARIA (AISkeleton) | `aria-hidden="true"` (decorative — loading state is announced by the parent's `aria-busy="true"`). |
| ARIA (ChatButton) | `<button>` (or `<cds-chat-button>` registered with `role="button"`); when `isSelected` adds `aria-pressed="true"`. |
| Stacking | `cds--ai-label:has(> .cds--popover--open) { z-index: 2; }` (lifts the AI badge above adjacent content while open). |
| **Imports — React** | `import { AILabel, AILabelContent, AILabelActions } from '@carbon/react';` · `import { AISkeletonText, AISkeletonPlaceholder, AISkeletonIcon } from '@carbon/react';` · `import { ChatButton, ChatButtonSkeleton } from '@carbon/react';` |
| **Imports — Web Components** | `import '@carbon/web-components/es/components/ai-label/index.js';` (registers `<cds-ai-label>`, `<cds-ai-label-action-button>`) · `import '@carbon/web-components/es/components/ai-skeleton/index.js';` (registers `<cds-ai-skeleton-text>`, `<cds-ai-skeleton-placeholder>`, `<cds-ai-skeleton-icon>`) · `import '@carbon/web-components/es/components/chat-button/index.js';` (registers `<cds-chat-button>`, `<cds-chat-button-skeleton>`) |

## Variants (from Storybook story exports)

| Component | Variant | React export | WC export | Purpose |
|---|---|---|---|---|
| **AILabel** | **Default** | `Default` | `Default` | Square AI badge anchored to a card or row. Click → opens an `AILabelContent` popover with a 4-block explanation: `<p class="secondary">AI Explained</p>`, an 84% confidence-score `<h2 class="ai-label-heading">`, body copy, `<hr>`, model-type metadata, link row, and `<AILabelActions>` row containing 3 ghost icon-buttons (View, Open Folder, Folders) + a primary "View details" button. Configurable via `align` (12 popover positions), `size` (mini→xl), `kind` (default/inline), `revertActive` (toggle to "revert to AI input" undo state), `defaultOpen`, `aria-label`. |
| **AILabel** | **Inline** | `Inline` | `Inline` | Renders the "AI" wordmark **inside** a paragraph or row of body copy (1px-radius border, 4px inline padding). Sizes restricted to `sm`, `md`, `lg`. Used in tables (per-row AI provenance) and form-field labels (per-field AI explanation). |
| **AILabel** | **InlineWithContent** | `InlineWithContent` | `InlineWithContent` | Same as Inline but renders an additional text label after the "AI" wordmark (e.g., `AI · Text goes here`). The badge widens to wrap both pieces and gains a full `1px solid border-inverse` border. |
| **AISkeleton** | **AISkeletonText** | `_AISkeletonText` | `AISkeletonText` | One or more AI-aura'd text lines (1rem block-size each). Args: `heading` (boolean, switches to 1.5rem heading height), `paragraph` (boolean, generates `lineCount` lines), `width` (px or %), `lineCount` (default 3). Use to placeholder AI-generated text while it streams in. |
| **AISkeleton** | **AISkeletonPlaceholder** | `_AISkeletonPlaceholder` | `AISkeletonPlaceholder` | A 100×100px (default — resize via `className`) AI-aura'd block. Use as a placeholder for AI-generated images, charts, or rich-content tiles. |
| **AISkeleton** | **AISkeletonIcon** | `_AISkeletonIcon` | `AISkeletonIcon` | A 16×16px (default — resize via `style`/`custom-styles` to e.g. 24×24px) AI-aura'd icon-shaped block. Use inline next to streaming AI labels (e.g., a still-loading sparkle icon). |
| **ChatButton** | **Default** | `Default` | `Default` | Demonstrates 3 sizes (`sm`/`md`/`lg`), 5 kinds (`primary`/`secondary`/`tertiary`/`ghost`/`danger`), the `isQuickAction` chip variant (4 quick-action states: rest, selected, selected-disabled, disabled), and the `ChatButtonSkeleton` loading state. The `isQuickAction` variant is what makes ChatButton distinct from regular Button — used for inline reply suggestions ("Summarise", "Translate", "Cite source") in chat shells. |

## React (verbatim from Storybook)

> The blocks below are copied **verbatim** from each `*.stories.js` file on the Carbon `main` branch. Do **not** edit them — Carbon's source is the truth. The agent should output these as-is when generating Carbon AI/chat UI.

### AILabel — Imports (top of `packages/react/src/components/AILabel/AILabel.stories.js`)

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';

import { AILabel, AILabelContent, AILabelActions } from '.';
import { action } from 'storybook/actions';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import Button from '../Button';
import { IconButton } from '../IconButton';
import { Link } from '../Link';
import mdx from './AILabel.mdx';
import './ailabel-story.scss';

export default {
  title: 'Components/AILabel',
  component: AILabel,
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['AILabelContent', 'aiTextLabel', 'slugLabel'],
    },
  },
};
const sharedArgTypes = {
  aiText: {
    control: {
      type: 'text',
    },
  },
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
    control: { type: 'select' },
    description:
      'Specify how the `AILabelContent` should align with the trigger element.',
  },
  autoAlign: {
    control: {
      type: 'boolean',
    },
    description:
      'Will auto-align the `AILabelContent` on first render if it is not visible. This prop is currently experimental and is subject to future changes. Requires React v17+',
  },
  'aria-label': {
    control: {
      type: 'text',
    },
  },
  kind: {
    options: ['default', 'inline'],
    control: { type: 'select' },
  },
  revertActive: {
    control: {
      type: 'boolean',
    },
  },
  revertLabel: {
    control: {
      type: 'text',
    },
    if: { arg: 'revertActive', eq: true },
  },
  size: {
    options: ['mini', '2xs', 'xs', 'sm', 'md', 'lg', 'xl'],
    control: { type: 'select' },
    if: { arg: 'revertActive', neq: true },
  },
  textLabel: {
    control: {
      type: 'text',
    },
    if: { arg: 'kind', eq: 'inline' },
    table: {
      category: 'Inline variant',
    },
  },
  defaultOpen: {
    control: {
      type: 'boolean',
    },
    description:
      'Specify if the toggletip should be open by default.\n\n(For the change to this control to be visible, refresh the page.)',
  },
  onRevertClick: {
    action: 'onRevertClick',
  },
};

const sharedArgs = {
  aiText: 'AI',
  ['aria-label']: 'Show information',
  kind: 'default',
  revertActive: false,
  revertLabel: 'Revert to AI input',
  size: 'md',
  defaultOpen: false,
  textLabel: '',
  autoAlign: true,
  onRevertClick: (event) => {
    action('onRevertClick')(event);
  },
};
```

### AILabel — Variant: Default

```jsx
export const Default = (args) => {
  const aiContent = (
    <div>
      <p className="secondary">AI Explained</p>
      <h2 className="ai-label-heading">84%</h2>
      <p className="secondary bold">Confidence score</p>
      <p className="secondary">
        Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
        eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
      </p>
      <hr />
      <p className="secondary">Model type</p>
      <p className="bold">Foundation model</p>
      <a href="#">normal link</a>
      <Link href="#">cds link</Link>
    </div>
  );

  return (
    <>
      <div className="ai-label-container ai-label-container-example">
        <AILabel {...args}>
          <AILabelContent>
            {aiContent}
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
      </div>
    </>
  );
};
Default.args = { ...sharedArgs };
Default.argTypes = { ...sharedArgTypes };
```

### AILabel — Variant: Inline

```jsx
export const Inline = (args) => {
  const aiContent = (
    <div>
      <p className="secondary">AI Explained</p>
      <h2 className="ai-label-heading">84%</h2>
      <p className="secondary bold">Confidence score</p>
      <p className="secondary">
        Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
        eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
      </p>
      <hr />
      <p className="secondary">Model type</p>
      <p className="bold">Foundation model</p>
    </div>
  );

  return (
    <>
      <div className="ai-label-container ai-label-container-example">
        <AILabel {...args}>
          <AILabelContent>
            {aiContent}
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
      </div>
    </>
  );
};
Inline.args = {
  ...sharedArgs,
  // `kind` prop is hidden from the controls table, but its value is still used for conditional `textLabel`,
  // hence the arg value is set even though the prop can’t be updated from controls.
  kind: 'inline',
};
Inline.argTypes = {
  ...sharedArgTypes,
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
    description:
      'Specify the size of the button, from the following list of sizes:',
    table: {
      defaultValue: {
        summary: 'md',
      },
      type: {
        summary: "'sm' | 'md' | 'lg'",
      },
    },
    if: { arg: 'revertActive', neq: true },
  },
};
Inline.parameters = {
  controls: {
    exclude: [
      'AILabelContent',
      'aiTextLabel',
      'slugLabel',
      'defaultOpen',
      'kind',
    ],
  },
};
```

### AILabel — Variant: InlineWithContent

```jsx
export const InlineWithContent = (args) => {
  const aiContent = (
    <div>
      <p className="secondary">AI Explained</p>
      <h2 className="ai-label-heading">84%</h2>
      <p className="secondary bold">Confidence score</p>
      <p className="secondary">
        Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do
        eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
      </p>
      <hr />
      <p className="secondary">Model type</p>
      <p className="bold">Foundation model</p>
    </div>
  );

  return (
    <>
      <div className="ai-label-container ai-label-container-example">
        <AILabel {...args}>
          <AILabelContent>
            {aiContent}
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
      </div>
    </>
  );
};
InlineWithContent.args = {
  ...sharedArgs,
  // `kind` prop is hidden from the controls table, but its value is still used for conditional `textLabel`,
  // hence the arg value is set even though the prop can’t be updated from controls.
  kind: 'inline',
  textLabel: 'Text goes here',
};
InlineWithContent.argTypes = {
  ...sharedArgTypes,
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
    description:
      'Specify the size of the button, from the following list of sizes:',
    table: {
      defaultValue: {
        summary: 'md',
      },
      type: {
        summary: "'sm' | 'md' | 'lg'",
      },
    },
    if: { arg: 'revertActive', neq: true },
  },
};
InlineWithContent.parameters = {
  controls: {
    exclude: [
      'AILabelContent',
      'aiTextLabel',
      'slugLabel',
      'defaultOpen',
      'kind',
    ],
  },
};
```

### AISkeletonText — Imports + Variant: _AISkeletonText (top of `AISkeletonText.stories.js`)

```jsx
/**
 * Copyright IBM Corp. 2016, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable no-console */

import React from 'react';

import AISkeletonText from './AISkeletonText';

export default {
  title: 'Components/Skeleton/AISkeleton',
  component: AISkeletonText,
};

export const _AISkeletonText = () => {
  return <AISkeletonText />;
};
```

### AISkeletonPlaceholder — Imports + Variant: _AISkeletonPlaceholder

```jsx
/**
 * Copyright IBM Corp. 2016, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable no-console */

import React from 'react';

import AISkeletonPlaceholder from './AISkeletonPlaceholder';

export default {
  title: 'Components/Skeleton/AISkeleton',
  component: AISkeletonPlaceholder,
};

export const _AISkeletonPlaceholder = () => {
  return <AISkeletonPlaceholder className="test" />;
};
```

### AISkeletonIcon — Imports + Variant: _AISkeletonIcon

```jsx
/**
 * Copyright IBM Corp. 2016, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable no-console */

import React from 'react';

import AISkeletonIcon from './AISkeletonIcon';
import mdx from './AISkeleton.mdx';

export default {
  title: 'Components/Skeleton/AISkeleton',
  component: AISkeletonIcon,
  parameters: {
    docs: {
      page: mdx,
    },
  },
};

const propsSkeleton = {
  style: {
    margin: '50px',
  },
};

const propsSkeleton2 = {
  style: {
    margin: '50px',
    width: '24px',
    height: '24px',
  },
};

export const _AISkeletonIcon = () => {
  const propsSkeleton = {
    style: {
      margin: '50px',
    },
  };

  const propsSkeleton2 = {
    style: {
      margin: '50px',
      width: '24px',
      height: '24px',
    },
  };
  return (
    <>
      <AISkeletonIcon {...propsSkeleton} />
      <AISkeletonIcon {...propsSkeleton2} />
    </>
  );
};
```

### ChatButton — Imports + Variant: Default (entire `ChatButton.stories.js`)

```jsx
/**
 * Copyright IBM Corp. 2022
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { ChatButton, ChatButtonSkeleton } from './';
import { Add } from '@carbon/icons-react';
import './chat-button-story.scss';

export default {
  title: 'Preview/preview__ChatButton',
  component: ChatButton,
  parameters: {},
};

export const Default = () => (
  <div className="test-button">
    <div className="test-button-sizes">
      <h3>Sizes</h3>
      <br />
      <ChatButton size="sm" renderIcon={Add}>
        Primary
      </ChatButton>
      <ChatButton size="md" renderIcon={Add}>
        Primary
      </ChatButton>
      <ChatButton size="lg" renderIcon={Add}>
        Primary
      </ChatButton>
      <br />
      <br />
      <ChatButton size="sm">Primary</ChatButton>
      <ChatButton size="md">Primary</ChatButton>
      <ChatButton size="lg">Primary</ChatButton>
    </div>
    <div className="test-button-kinds">
      <h3>Kinds</h3>
      <br />
      <ChatButton kind="primary" renderIcon={Add}>
        Primary
      </ChatButton>
      <ChatButton kind="secondary" renderIcon={Add}>
        Secondary
      </ChatButton>
      <ChatButton kind="tertiary" renderIcon={Add}>
        Tertiary
      </ChatButton>
      <ChatButton kind="ghost" renderIcon={Add}>
        Ghost
      </ChatButton>
      <ChatButton kind="danger" renderIcon={Add}>
        Danger
      </ChatButton>
      <br />
      <br />
      <ChatButton kind="primary">Primary</ChatButton>
      <ChatButton kind="secondary">Secondary</ChatButton>
      <ChatButton kind="tertiary">Tertiary</ChatButton>
      <ChatButton kind="ghost">Ghost</ChatButton>
      <ChatButton kind="danger">Danger</ChatButton>
    </div>
    <div className="test-button-quick-action">
      <h3>Quick action</h3>
      <br />
      <ChatButton isQuickAction renderIcon={Add}>
        Quick action
      </ChatButton>
      <ChatButton isSelected isQuickAction renderIcon={Add}>
        Selected and Enabled
      </ChatButton>
      <ChatButton disabled isSelected isQuickAction renderIcon={Add}>
        Selected and Disabled
      </ChatButton>
      <ChatButton disabled isQuickAction renderIcon={Add}>
        Disabled
      </ChatButton>
      <br />
      <br />
      <ChatButton isQuickAction>Quick action</ChatButton>
      <ChatButton isSelected isQuickAction>
        Selected and Enabled
      </ChatButton>
      <ChatButton disabled isSelected isQuickAction>
        Selected and Disabled
      </ChatButton>
      <ChatButton disabled isQuickAction>
        Disabled
      </ChatButton>
    </div>

    <div className="test-button-skeleton">
      <h3>Skeleton</h3>
      <br />
      <ChatButtonSkeleton size="sm" />
      <ChatButtonSkeleton size="md" />
      <ChatButtonSkeleton />
    </div>
  </div>
);
```

## Web Components (verbatim from Storybook)

> The blocks below are copied **verbatim** from each `*.stories.ts` file. They use lit-html `${expression}` bindings and `html\`...\`` tagged templates — paste them as-is into a lit project. For framework-less HTML, see the next section.

### `<cds-ai-label>` — Imports (top of `packages/web-components/src/components/ai-label/ai-label.stories.ts`)

```ts
/**
 * Copyright IBM Corp. 2019, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './index';
import '../icon-button/index';
import '../button/index';
import styles from './ai-label-story.scss?lit';
import { iconLoader } from '../../globals/internal/icon-loader';

import { POPOVER_ALIGNMENT } from '../popover/defs';
import { AI_LABEL_SIZE } from './defs';

const tooltipAlignments = {
  [`top`]: POPOVER_ALIGNMENT.TOP,
  [`top-start`]: POPOVER_ALIGNMENT.TOP_START,
  [`top-end`]: POPOVER_ALIGNMENT.TOP_END,
  [`bottom`]: POPOVER_ALIGNMENT.BOTTOM,
  [`bottom-start`]: POPOVER_ALIGNMENT.BOTTOM_START,
  [`bottom-end`]: POPOVER_ALIGNMENT.BOTTOM_END,
  [`left`]: POPOVER_ALIGNMENT.LEFT,
  [`left-start`]: POPOVER_ALIGNMENT.LEFT_START,
  [`left-end`]: POPOVER_ALIGNMENT.LEFT_END,
  [`right`]: POPOVER_ALIGNMENT.RIGHT,
  [`right-start`]: POPOVER_ALIGNMENT.RIGHT_START,
  [`right-end`]: POPOVER_ALIGNMENT.RIGHT_END,
};

const sizes = {
  [`Mini size (${AI_LABEL_SIZE.MINI})`]: AI_LABEL_SIZE.MINI,
  [`2XS size (${AI_LABEL_SIZE.EXTRA_EXTRA_SMALL})`]:
    AI_LABEL_SIZE.EXTRA_EXTRA_SMALL,
  [`XS size (${AI_LABEL_SIZE.EXTRA_SMALL})`]: AI_LABEL_SIZE.EXTRA_SMALL,
  [`Small size (${AI_LABEL_SIZE.SMALL})`]: AI_LABEL_SIZE.SMALL,
  [`Medium size (${AI_LABEL_SIZE.MEDIUM})`]: AI_LABEL_SIZE.MEDIUM,
  [`Large size (${AI_LABEL_SIZE.LARGE})`]: AI_LABEL_SIZE.LARGE,
  [`XL size (${AI_LABEL_SIZE.EXTRA_LARGE})`]: AI_LABEL_SIZE.EXTRA_LARGE,
};

const inlineSizes = {
  [`Small size (${AI_LABEL_SIZE.SMALL})`]: AI_LABEL_SIZE.SMALL,
  [`Medium size (${AI_LABEL_SIZE.MEDIUM})`]: AI_LABEL_SIZE.MEDIUM,
  [`Large size (${AI_LABEL_SIZE.LARGE})`]: AI_LABEL_SIZE.LARGE,
};

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
    <a href="#">normal link</a>
    <cds-link href="#">cds link</cds-link>
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

const args = {
  aiText: 'AI',
  aiTextLabel: '',
  alignment: POPOVER_ALIGNMENT.BOTTOM_START,
  autoalign: true,
  kind: 'default',
  defaultOpen: false,
  revertActive: false,
  buttonLabel: 'Show information',
  revertLabel: 'Revert to AI input',
  size: AI_LABEL_SIZE.MEDIUM,
};

const argTypes = {
  aiText: {
    control: 'text',
    description: 'Specify the correct translation of the AI text',
  },
  aiTextLabel: {
    control: 'text',
    description:
      'Specify additional text to be rendered next to the AI label in the inline variant.',
    if: { arg: 'kind', eq: 'inline' },
    table: {
      category: 'Inline variant',
    },
  },
  alignment: {
    control: 'select',
    description: 'Specify how the popover should align with the button.',
    options: tooltipAlignments,
  },
  autoalign: {
    control: 'boolean',
    description:
      'Will auto-align the popover. This prop is currently experimental and is subject to future changes.',
  },
  buttonLabel: {
    control: 'text',
    description:
      'Specify the text that will be provided to the `aria-label` of the `AI Label` button',
  },
  kind: {
    control: 'select',
    description:
      'Specify the type of AI Label, from the following list of types: <code>default</code>, <code>hollow</code>, or <code>inline</code>.',
    options: ['default', 'inline'],
  },
  defaultOpen: {
    control: 'boolean',
    description:
      'Specify if the toggletip should be open by default.\n\n(For the change to this control to be visible, refresh the page.)',
  },
  size: {
    control: 'select',
    description:
      'Specify the size of the button, from the following list of sizes: <code>mini</code>, <code>2xs</code>, <code>xs</code>, <code>sm</code>, <code>md</code>, <code>lg</code>, <code>xl</code>.',
    options: sizes,
    if: { arg: 'revertActive', neq: true },
  },
  revertActive: {
    control: 'boolean',
    description: 'Specify whether the revert button should be visible.',
  },
  revertLabel: {
    control: 'text',
    description:
      'Specify the text that should be shown when the revert button is hovered',
    if: { arg: 'revertActive', eq: true },
  },
};
```

### `<cds-ai-label>` — Variant: Default

```html
export const Default = {
  args,
  argTypes,
  render: ({
    aiText,
    aiTextLabel,
    alignment,
    autoalign,
    buttonLabel,
    kind,
    defaultOpen,
    size,
    revertActive,
    revertLabel,
  }) => {
    return html`
      <style>
        ${styles}
      </style>
      <div class="ai-label-container">
        <cds-ai-label
          ?default-open="${defaultOpen}"
          ai-text="${aiText}"
          ai-text-label="${aiTextLabel}"
          alignment="${alignment}"
          ?autoalign="${autoalign}"
          button-label="${buttonLabel}"
          kind="${kind}"
          size="${size}"
          ?revert-active="${revertActive}"
          revert-label="${revertLabel}">
          ${content} ${actions}
        </cds-ai-label>
      </div>
    `;
  },
};
```

### `<cds-ai-label>` — Variant: Inline

```html
export const Inline = {
  args: {
    ...args,
    // `kind` prop is hidden from the controls table, but its value is still used for conditional `aiTextLabel`,
    // hence the arg value is set even though the prop can’t be updated from controls.
    kind: 'inline',
  },
  argTypes: {
    ...argTypes,
    kind: {
      ...argTypes.kind,
      table: {
        disable: true,
      },
    },
    defaultOpen: {
      ...argTypes.kind,
      table: {
        disable: true,
      },
    },
    size: {
      control: 'select',
      description:
        'Specify the size of the button, from the following list of sizes: <code>sm</code>, <code>md</code>, <code>lg</code>',
      options: inlineSizes,
      if: { arg: 'revertActive', neq: true },
    },
  },
  render: ({
    aiText,
    aiTextLabel,
    alignment,
    autoalign,
    buttonLabel,
    kind,
    size,
    revertActive,
    revertLabel,
  }) => {
    return html`
      <style>
        ${styles}
      </style>
      <div class="ai-label-container">
        <cds-ai-label
          ai-text="${aiText}"
          ai-text-label="${aiTextLabel}"
          alignment="${alignment}"
          ?autoalign="${autoalign}"
          button-label="${buttonLabel}"
          kind="${kind}"
          size="${size}"
          ?revert-active="${revertActive}"
          revert-label="${revertLabel}">
          ${content} ${actions}
        </cds-ai-label>
      </div>
    `;
  },
};
```

### `<cds-ai-label>` — Variant: InlineWithContent

```html
export const InlineWithContent = {
  args: {
    ...args,
    // `kind` prop is hidden from the controls table, but its value is still used for conditional `aiTextLabel`,
    // hence the arg value is set even though the prop can’t be updated from controls.
    kind: 'inline',
    aiTextLabel: 'Text goes here',
  },
  argTypes: {
    ...argTypes,
    kind: {
      ...argTypes.kind,
      table: {
        disable: true,
      },
    },
    defaultOpen: {
      ...argTypes.kind,
      table: {
        disable: true,
      },
    },
    size: {
      control: 'select',
      description:
        'Specify the size of the button, from the following list of sizes: <code>sm</code>, <code>md</code>, <code>lg</code>',
      options: inlineSizes,
      if: { arg: 'revertActive', neq: true },
    },
  },
  render: ({
    aiText,
    aiTextLabel,
    alignment,
    autoalign,
    buttonLabel,
    kind,
    size,
    revertActive,
    revertLabel,
  }) => {
    return html`
      <style>
        ${styles}
      </style>
      <div class="ai-label-container">
        <cds-ai-label
          ai-text="${aiText}"
          ai-text-label="${aiTextLabel}"
          alignment="${alignment}"
          ?autoalign="${autoalign}"
          button-label="${buttonLabel}"
          kind="${kind}"
          size="${size}"
          ?revert-active="${revertActive}"
          revert-label="${revertLabel}">
          ${content} ${actions}
        </cds-ai-label>
      </div>
    `;
  },
};

const meta = {
  title: 'Components/AI Label',
};

export default meta;
```

### `<cds-ai-skeleton-text>` — Imports + Variant: AISkeletonText (entire `ai-skeleton-text.stories.ts`)

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './ai-skeleton-text';

const args = {
  heading: false,
  paragraph: false,
  width: '100%',
  lineCount: 3,
};

const argTypes = {
  heading: {
    control: 'boolean',
    description: 'Set this to true to apply heading styling.',
  },
  paragraph: {
    control: 'boolean',
    description: 'Set this to true to generate multiple lines of text.',
  },
  width: {
    control: 'text',
    description:
      'Width (in px or %) of single line of text or max-width of paragraph lines.',
  },
  lineCount: {
    control: 'number',
    description: 'The number of lines shown if paragraph is true.',
  },
};

export const AISkeletonText = {
  args,
  argTypes,
  render: (args) => {
    const { heading, paragraph, width, lineCount } = args ?? {};

    return html`<cds-ai-skeleton-text
      ?heading="${heading}"
      width="${width}"
      ?paragraph="${paragraph}"
      linecount="${lineCount}"></cds-ai-skeleton-text>`;
  },
};

const meta = {
  title: 'Components/Skeleton/AI Skeleton',
};

export default meta;
```

### `<cds-ai-skeleton-placeholder>` — Imports + Variant: AISkeletonPlaceholder (entire `ai-skeleton-placeholder.stories.ts`)

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './ai-skeleton-placeholder';
import mdx from './ai-skeleton.mdx';

export const AISkeletonPlaceholder = {
  // This story doesn't accept any args.
  args: {},
  argTypes: {},
  parameters: {
    docs: {
      page: mdx,
    },
  },
  render: () => {
    return html`<cds-ai-skeleton-placeholder
      class="test"></cds-ai-skeleton-placeholder>`;
  },
};

const meta = {
  title: 'Components/Skeleton/AI Skeleton',
};

export default meta;
```

### `<cds-ai-skeleton-icon>` — Imports + Variant: AISkeletonIcon (entire `ai-skeleton-icon.stories.ts`)

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './ai-skeleton-icon';
import mdx from './ai-skeleton.mdx';

export const AISkeletonIcon = {
  // This story doesn't accept any args.
  args: {},
  argTypes: {},
  parameters: {
    docs: {
      page: mdx,
    },
  },
  render: () => {
    return html`<cds-ai-skeleton-icon
        custom-styles="margin: 50px"></cds-ai-skeleton-icon>
      <cds-ai-skeleton-icon
        custom-styles="margin: 50px; width: 24px; height: 24px"></cds-ai-skeleton-icon>`;
  },
};

const meta = {
  title: 'Components/Skeleton/AI Skeleton',
};

export default meta;
```

### `<cds-chat-button>` — Imports + Variant: Default (entire `chat-button.stories.ts`)

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './index';
import Add16 from '@carbon/icons/es/add/16.js';
import { iconLoader } from '../../globals/internal/icon-loader';
import styles from './chat-button-story.scss?lit';

export const Default = () => {
  return html`
    <style>
      ${styles}
    </style>
    <div class="test-button">
      <div class="test-button-sizes">
        <h3>Sizes</h3>
        <br />
        <cds-chat-button size="sm">
          Primary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button size="md">
          Primary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button size="lg">
          Primary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <br />
        <br />
        <cds-chat-button size="sm"> Primary </cds-chat-button>
        <cds-chat-button size="md"> Primary </cds-chat-button>
        <cds-chat-button size="lg"> Primary </cds-chat-button>
      </div>
      <div class="test-button-kinds">
        <h3>Kinds</h3>
        <br />
        <cds-chat-button kind="primary">
          Primary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button kind="secondary">
          Secondary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button kind="tertiary">
          Tertiary ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button kind="ghost">
          Ghost ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button kind="danger">
          Danger ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <br />
        <br />
        <cds-chat-button kind="primary"> Primary </cds-chat-button>
        <cds-chat-button kind="secondary"> Secondary </cds-chat-button>
        <cds-chat-button kind="tertiary"> Tertiary </cds-chat-button>
        <cds-chat-button kind="ghost"> Ghost </cds-chat-button>
        <cds-chat-button kind="danger"> Danger </cds-chat-button>
      </div>
      <div class="test-button-quick-action">
        <h3>Quick action</h3>
        <br />
        <cds-chat-button is-quick-action>
          Quick action ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button is-quick-action is-selected>
          Selected and Enabled ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button is-quick-action is-selected disabled>
          Selected and disabled ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <cds-chat-button is-quick-action disabled>
          Disabled ${iconLoader(Add16, { slot: 'icon' })}
        </cds-chat-button>
        <br />
        <br />
        <cds-chat-button is-quick-action> Quick action </cds-chat-button>
        <cds-chat-button is-quick-action is-selected>
          Selected and Enabled
        </cds-chat-button>
        <cds-chat-button is-quick-action is-selected disabled>
          Selected and disabled
        </cds-chat-button>
        <cds-chat-button is-quick-action disabled> Disabled </cds-chat-button>
      </div>
      <div class="test-button-skeleton">
        <h3>Skeleton</h3>
        <br />
        <cds-chat-button-skeleton size="sm"></cds-chat-button-skeleton>
        <cds-chat-button-skeleton size="md"></cds-chat-button-skeleton>
        <cds-chat-button-skeleton size="lg"></cds-chat-button-skeleton>
      </div>
    </div>
  `;
};

const meta = {
  title: 'Preview/Chat button',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings resolved to literal attributes. Use this for hand-coded HTML without a component framework. The custom elements still need to be registered first via the `@carbon/web-components` ESM imports listed in Section 1.

### Plain HTML — AILabel (Default kind, md size, anchored to a tile-style container)

```html
<div class="ai-label-container ai-label-container-example">
  <cds-ai-label
    ai-text="AI"
    ai-text-label=""
    alignment="bottom-start"
    autoalign
    button-label="Show information"
    kind="default"
    size="md"
    revert-label="Revert to AI input">

    <!-- Popover body content (slotted into the AILabelContent) -->
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
      <a href="#">normal link</a>
      <cds-link href="#">cds link</cds-link>
    </div>

    <!-- Action row at the bottom of the popover -->
    <cds-icon-button kind="ghost" slot="actions" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- View 16 SVG --></svg>
      <span slot="tooltip-content">View</span>
    </cds-icon-button>
    <cds-icon-button kind="ghost" slot="actions" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- Folder--open 16 SVG --></svg>
      <span slot="tooltip-content">Open folder</span>
    </cds-icon-button>
    <cds-icon-button kind="ghost" slot="actions" size="lg">
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- Folders 16 SVG --></svg>
      <span slot="tooltip-content">Folders</span>
    </cds-icon-button>
    <cds-ai-label-action-button>View details</cds-ai-label-action-button>
  </cds-ai-label>
</div>
```

### Plain HTML — AILabel (Inline kind, md size — sits inline with body copy)

```html
<p>
  Confidence score is 84%
  <cds-ai-label
    ai-text="AI"
    alignment="bottom-start"
    autoalign
    button-label="Show information"
    kind="inline"
    size="md">
    <div slot="body-text">
      <p class="secondary">AI Explained</p>
      <p class="secondary">This score reflects the model's confidence.</p>
    </div>
  </cds-ai-label>
  based on the input data.
</p>
```

### Plain HTML — AILabel (InlineWithContent kind — wraps the wordmark + an additional label)

```html
<cds-ai-label
  ai-text="AI"
  ai-text-label="Text goes here"
  alignment="bottom-start"
  autoalign
  button-label="Show information"
  kind="inline"
  size="md">
  <div slot="body-text">
    <p class="secondary">AI Explained</p>
    <p>Foundation model</p>
  </div>
</cds-ai-label>
```

### Plain HTML — AISkeletonText (paragraph, 3 lines, 100% width)

```html
<cds-ai-skeleton-text width="100%" linecount="3"></cds-ai-skeleton-text>

<!-- Heading variant (1.5rem block-size instead of 1rem) -->
<cds-ai-skeleton-text heading width="100%"></cds-ai-skeleton-text>

<!-- Paragraph variant (lineCount stacked lines) -->
<cds-ai-skeleton-text paragraph width="100%" linecount="3"></cds-ai-skeleton-text>
```

### Plain HTML — AISkeletonPlaceholder (block placeholder)

```html
<!-- Default 100×100px (size via parent CSS or the .test class) -->
<cds-ai-skeleton-placeholder class="test"></cds-ai-skeleton-placeholder>

<!-- Custom-sized placeholder (e.g., for an AI-generated image) -->
<cds-ai-skeleton-placeholder
  style="block-size: 240px; inline-size: 320px;"></cds-ai-skeleton-placeholder>
```

### Plain HTML — AISkeletonIcon (16×16px or custom)

```html
<cds-ai-skeleton-icon custom-styles="margin: 50px"></cds-ai-skeleton-icon>
<cds-ai-skeleton-icon
  custom-styles="margin: 50px; width: 24px; height: 24px"></cds-ai-skeleton-icon>
```

### Plain HTML — ChatButton (sizes + kinds + quick-action + skeleton)

```html
<div class="test-button">

  <div class="test-button-sizes">
    <h3>Sizes</h3>
    <br />
    <cds-chat-button size="sm">
      Primary
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- Add 16 SVG --></svg>
    </cds-chat-button>
    <cds-chat-button size="md">
      Primary
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- Add 16 SVG --></svg>
    </cds-chat-button>
    <cds-chat-button size="lg">
      Primary
      <svg slot="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16" fill="currentColor"><!-- Add 16 SVG --></svg>
    </cds-chat-button>
    <br /><br />
    <cds-chat-button size="sm">Primary</cds-chat-button>
    <cds-chat-button size="md">Primary</cds-chat-button>
    <cds-chat-button size="lg">Primary</cds-chat-button>
  </div>

  <div class="test-button-kinds">
    <h3>Kinds</h3>
    <br />
    <cds-chat-button kind="primary">Primary</cds-chat-button>
    <cds-chat-button kind="secondary">Secondary</cds-chat-button>
    <cds-chat-button kind="tertiary">Tertiary</cds-chat-button>
    <cds-chat-button kind="ghost">Ghost</cds-chat-button>
    <cds-chat-button kind="danger">Danger</cds-chat-button>
  </div>

  <div class="test-button-quick-action">
    <h3>Quick action</h3>
    <br />
    <cds-chat-button is-quick-action>Quick action</cds-chat-button>
    <cds-chat-button is-quick-action is-selected>Selected and Enabled</cds-chat-button>
    <cds-chat-button is-quick-action is-selected disabled>Selected and disabled</cds-chat-button>
    <cds-chat-button is-quick-action disabled>Disabled</cds-chat-button>
  </div>

  <div class="test-button-skeleton">
    <h3>Skeleton</h3>
    <br />
    <cds-chat-button-skeleton size="sm"></cds-chat-button-skeleton>
    <cds-chat-button-skeleton size="md"></cds-chat-button-skeleton>
    <cds-chat-button-skeleton size="lg"></cds-chat-button-skeleton>
  </div>

</div>
```

### Plain HTML — AI Aura on a Tile (the `data-ai="true"` pattern)

This is the **dual-stop padding-box / border-box gradient** that elevates any container into an AI-affordance surface (Tile, Modal, DataTable row). Pulled from the `@mixin ai-popover-gradient` in `utilities/_ai-gradient.scss` and applied by the `cds--ai-label-content` selector in `_slug.scss`.

```html
<div class="cds--tile cds--tile--ai">
  <h4>AI-generated forecast</h4>
  <p>Q4 revenue projected to grow 12% YoY.</p>
  <!-- Anchor the AI Label in the top-right corner of the tile -->
  <cds-ai-label kind="default" size="xs" alignment="bottom-right" autoalign>
    <div slot="body-text">
      <p class="secondary">AI Explained</p>
      <h2 class="ai-label-heading">84%</h2>
      <p class="secondary">Confidence score</p>
    </div>
  </cds-ai-label>
</div>
```

```css
/* AI affordance on any Tile (dual-gradient pattern) */
.cds--tile--ai {
  position: relative;
  border: 1px solid transparent;
  background:
    linear-gradient(
        to top,
        var(--cds-layer-01) 0%,
        var(--cds-ai-aura-start) 0%,
        15%,
        var(--cds-ai-aura-end) 50%
      )
      padding-box,
    linear-gradient(to top, var(--cds-layer-01), var(--cds-layer-01)) padding-box,
    linear-gradient(to bottom, var(--cds-ai-border-start), var(--cds-ai-border-end))
      border-box,
    /* Underlay so the transparent border isn't see-through */
    linear-gradient(to top, var(--cds-layer-01), var(--cds-layer-01)) border-box;
}

.cds--tile--ai .cds--ai-label {
  position: absolute;
  top: 8px;
  right: 8px;
}
```

## Design Tokens (component-scoped)

> All values are **literal hex** resolved from `references/ibm/overview.md` for each of Carbon's four themes (White, G10, G90, G100). The Storybook source uses semantic tokens (`$ai-aura-start`, `$ai-border-strong`, `$chat-button`); the blocks below are what those resolve to at runtime.

```css
/* === WHITE THEME === */
[data-theme="white"] {
  /* AI Aura — gradient endpoints (used by ai-gradient mixin) */
  --cds-ai-aura-start: rgba(69, 137, 255, 0.1);          /* blue-50 @ 10% */
  --cds-ai-aura-end: rgba(255, 255, 255, 0);             /* white @ 0% */
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-hover-end: rgba(255, 255, 255, 0);
  --cds-ai-aura-hover-background: #edf5ff;               /* blue-10 — solid hover surface */

  /* AI border — gradient (start/end) + strong (single-stop) */
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);      /* blue-30 @ 36% */
  --cds-ai-border-end: #78a9ff;                          /* blue-40 */
  --cds-ai-border-strong: #4589ff;                       /* blue-50 — used for ai-gradient block-end */

  /* AI shadow + popover */
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-ai-drop-shadow: rgba(15, 98, 254, 0.1);
  --cds-ai-popover-background: #ffffff;
  --cds-ai-popover-shadow-outer-01: rgba(0, 0, 0, 0.06);
  --cds-ai-popover-shadow-outer-02: rgba(0, 0, 0, 0.04);
  --cds-ai-overlay: rgba(0, 0, 0, 0.5);                  /* full-page tint when AI processing */

  /* AI Skeleton — solid blue with a darker blue shimmer */
  --cds-ai-skeleton-background: #4589ff;                 /* blue-50 */
  --cds-ai-skeleton-element-background: rgba(15, 98, 254, 0.3); /* blue-60 @ 30% */

  /* Chat surfaces */
  --cds-chat-prompt-background: #ffffff;
  --cds-chat-prompt-border-start: #f4f4f4;
  --cds-chat-prompt-border-end: rgba(244, 244, 244, 0);
  --cds-chat-bubble-user: #e0e0e0;                       /* gray-20 */
  --cds-chat-bubble-agent: #ffffff;
  --cds-chat-bubble-border: #e0e0e0;
  --cds-chat-avatar-bot: #6f6f6f;                        /* gray-60 */
  --cds-chat-avatar-agent: #393939;                      /* gray-80 */
  --cds-chat-avatar-user: #0f62fe;                       /* blue-60 */
  --cds-chat-shell-background: #ffffff;
  --cds-chat-header-background: #ffffff;
  --cds-chat-button: #525252;                            /* gray-70 — quick-action border + text */
  --cds-chat-button-hover: rgba(141, 141, 141, 0.12);
  --cds-chat-button-text-hover: #0043ce;                 /* blue-70 */
  --cds-chat-button-active: rgba(141, 141, 141, 0.5);
  --cds-chat-button-selected: #d0e2ff;                   /* blue-20 */
  --cds-chat-button-text-selected: #0043ce;
}

/* === G10 THEME === */
[data-theme="g10"] {
  --cds-ai-aura-start: rgba(69, 137, 255, 0.1);
  --cds-ai-aura-end: rgba(244, 244, 244, 0);             /* gray-10 @ 0% (matches G10 page bg) */
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-hover-end: rgba(244, 244, 244, 0);
  --cds-ai-aura-hover-background: #edf5ff;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #78a9ff;
  --cds-ai-border-strong: #4589ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-ai-drop-shadow: rgba(15, 98, 254, 0.1);
  --cds-ai-popover-background: #ffffff;
  --cds-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-ai-skeleton-background: #4589ff;
  --cds-ai-skeleton-element-background: rgba(15, 98, 254, 0.3);

  --cds-chat-prompt-background: #f4f4f4;
  --cds-chat-prompt-border-start: #ffffff;
  --cds-chat-prompt-border-end: rgba(255, 255, 255, 0);
  --cds-chat-bubble-user: #e0e0e0;
  --cds-chat-bubble-agent: #ffffff;
  --cds-chat-bubble-border: #e0e0e0;
  --cds-chat-avatar-bot: #6f6f6f;
  --cds-chat-avatar-agent: #393939;
  --cds-chat-avatar-user: #0f62fe;
  --cds-chat-shell-background: #f4f4f4;
  --cds-chat-header-background: #f4f4f4;
  --cds-chat-button: #525252;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.12);
  --cds-chat-button-text-hover: #0043ce;
  --cds-chat-button-active: rgba(141, 141, 141, 0.5);
  --cds-chat-button-selected: #d0e2ff;
  --cds-chat-button-text-selected: #0043ce;
}

/* === G90 THEME (dark — content surfaces) === */
[data-theme="g90"],
.dark {
  --cds-ai-aura-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-end: rgba(38, 38, 38, 0);                /* gray-90 @ 0% */
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.6);
  --cds-ai-aura-hover-end: rgba(38, 38, 38, 0);
  --cds-ai-aura-hover-background: #333333;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #4589ff;                          /* swapped to blue-50 in dark */
  --cds-ai-border-strong: #78a9ff;                       /* swapped to blue-40 in dark */
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-ai-drop-shadow: rgba(0, 0, 0, 0.28);
  --cds-ai-popover-background: #393939;                  /* gray-80 */
  --cds-ai-overlay: rgba(0, 0, 0, 0.65);
  --cds-ai-skeleton-background: #78a9ff;                 /* blue-40 — lighter for dark contrast */
  --cds-ai-skeleton-element-background: rgba(255, 255, 255, 0.3);

  --cds-chat-prompt-background: #262626;                 /* gray-90 */
  --cds-chat-prompt-border-start: #525252;
  --cds-chat-prompt-border-end: rgba(82, 82, 82, 0);
  --cds-chat-bubble-user: #525252;                       /* gray-70 */
  --cds-chat-bubble-agent: #393939;                      /* gray-80 */
  --cds-chat-bubble-border: #525252;
  --cds-chat-avatar-bot: #c6c6c6;                        /* gray-30 */
  --cds-chat-avatar-agent: #f4f4f4;                      /* gray-10 */
  --cds-chat-avatar-user: #4589ff;                       /* blue-50 */
  --cds-chat-shell-background: #262626;
  --cds-chat-header-background: #262626;
  --cds-chat-button: #c6c6c6;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.16);
  --cds-chat-button-text-hover: #a6c8ff;                 /* blue-30 */
  --cds-chat-button-active: rgba(141, 141, 141, 0.4);
  --cds-chat-button-selected: #002d9c;                   /* blue-80 */
  --cds-chat-button-text-selected: #a6c8ff;
}

/* === G100 THEME (deepest dark — page surfaces) === */
[data-theme="g100"] {
  --cds-ai-aura-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-end: rgba(22, 22, 22, 0);                /* gray-100 @ 0% */
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.6);
  --cds-ai-aura-hover-end: rgba(22, 22, 22, 0);
  --cds-ai-aura-hover-background: #333333;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #4589ff;
  --cds-ai-border-strong: #78a9ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-ai-drop-shadow: rgba(0, 0, 0, 0.28);
  --cds-ai-popover-background: #262626;                  /* gray-90 in G100 */
  --cds-ai-popover-shadow-outer-01: rgba(0, 0, 0, 0.16);
  --cds-ai-popover-shadow-outer-02: rgba(0, 0, 0, 0.24);
  --cds-ai-overlay: rgba(0, 0, 0, 0.65);
  --cds-ai-skeleton-background: #78a9ff;
  --cds-ai-skeleton-element-background: rgba(255, 255, 255, 0.3);

  --cds-chat-prompt-background: #161616;                 /* gray-100 */
  --cds-chat-prompt-border-start: #393939;
  --cds-chat-prompt-border-end: rgba(57, 57, 57, 0);
  --cds-chat-bubble-user: #393939;                       /* gray-80 */
  --cds-chat-bubble-agent: #262626;                      /* gray-90 */
  --cds-chat-bubble-border: #393939;
  --cds-chat-avatar-bot: #c6c6c6;
  --cds-chat-avatar-agent: #f4f4f4;
  --cds-chat-avatar-user: #4589ff;
}
```

## States Reference (from .scss)

> Pulled from `_slug.scss` (AI Label) and `_chat-button.scss`. Dimensions/colours are quoted from the SCSS line numbers in parentheses; theme tokens resolve to the literals shown for **White** theme — swap into the dark blocks above for G90/G100.

### AILabel — Default kind (square badge)

| State | Background | Color (text) | Border | Other |
|---|---|---|---|---|
| Rest (line 85–94) | `transparent` | `var(--cds-text-primary)` `#161616` | `1px solid var(--cds-border-inverse)` `#161616` | `font-weight: 600`, `outline: none`, transitions on color/border-color/box-shadow/background `var(--cds-duration-fast-01)` (70ms) `cubic-bezier(0.4, 0.14, 0.3, 1)` (motion(entrance, productive)) |
| Hover (line 125–128) | `var(--cds-border-inverse)` `#161616` (inverts to filled) | `var(--cds-background-inverse)` `#393939` | (inherits rest) | — |
| Hover + Active (line 131–138) | `var(--cds-border-inverse)` `#161616` | (inherits hover) | (inherits rest) | `box-shadow: inset 0 0 0 1px var(--cds-focus) #0f62fe, inset 0 0 0 2px var(--cds-focus-inset) #ffffff` |
| Hover + Active (mini/2xs only — line 140–149) | (inherits) | (inherits) | (inherits) | `box-shadow: inset 0 0 0 1px var(--cds-focus-inset) #ffffff` (single inset — smaller buttons can't fit double ring) |
| Focus-visible (line 119–123) | `transparent` (inherits rest) | (inherits rest) | `1px solid var(--cds-focus)` `#0f62fe` | `box-shadow: inset 0 0 0 1px var(--cds-focus) #0f62fe` (the signature Carbon double-ring outside + inside) |
| Disabled (set via `disabled` HTML attribute) | `transparent` | `var(--cds-text-disabled)` `#c6c6c6` | `1px solid var(--cds-border-disabled)` `#c6c6c6` | `cursor: not-allowed`, `pointer-events: none` |

### AILabel — Inline kind (border-radius 1px, transparent border)

| State | Background | Color (text) | Border | Other |
|---|---|---|---|---|
| Rest (line 157–168) | `transparent` | (inherits text-primary) | `1px solid transparent` | `border-radius: 1px`, `padding-inline: 4px`, `inline-size: initial`, `line-height: initial`, the `::before` pseudo (the small AI mark) is hidden (`background: transparent` per line 170–173) |
| Hover (line 181–189) | `transparent` | (inherits) | (inherits transparent) | The inline AI mark `::before` becomes visible on hover via `background: var(--cds-icon-secondary)` `#525252` (line 196–203). Hover-only — no fill on the badge itself. |
| Focus-visible (line 175–179) | `transparent` | (inherits) | `1px solid var(--cds-focus)` `#0f62fe` (border-color only, no inset shadow) | — |
| Focus + Hover (line 191–194) | `transparent` | (inherits) | `1px solid var(--cds-focus)` `#0f62fe` | (focus border wins over hover) |
| Active | (inherits hover) | (inherits) | (inherits) | — |

### AILabel — Inline-with-content kind (wraps wordmark + extra label)

| State | Background | Color (text) | Border | Other |
|---|---|---|---|---|
| Rest (line 282–287) | `transparent` | (text-primary) | `1px solid var(--cds-border-inverse)` `#161616` | `padding-block: 2px`, `padding-inline: 8px`, additional text in `cds--ai-label__additional-text` gets `padding-inline-start: 4px` (line 289–296) |
| Focus / Focus+Hover (line 305–312) | (inherits) | (inherits) | (inherits) | `box-shadow: inset 0 0 0 1px var(--cds-focus) #0f62fe` |

### AI Label popover surface (`cds--ai-label-content`)

| Property | Value (from `_slug.scss` line 315–328) |
|---|---|
| Background | `@include ai-popover-gradient()` — see Section 8 for the resolved 4-layer gradient |
| Border | `1px solid transparent` (the visible "border" is the second gradient layer painted into `border-box`) |
| Border-radius | `8px` (CARBON EXCEPTION) |
| Color | `var(--cds-text-primary)` `#161616` |
| Min inline-size | `280px` |
| Box-shadow | `inset 0 -80px 70px -65px var(--cds-ai-inner-shadow)` (the inner aura glow that pools at the bottom) `, -40px 44px 60px -24px var(--cds-ai-popover-shadow-outer-01)` (offset drop shadow #1) `, -56px 64px 64px -24px var(--cds-ai-popover-shadow-outer-02)` (offset drop shadow #2 — softer, larger blur) |

### ChatButton — base + size (from `_chat-button.scss` lines 14–30)

| State / size | Border-radius | Padding-inline-end (no icon) | Source line |
|---|---|---|---|
| `lg` | `24px` | `15px` | line 16 |
| `md` | `20px` | `15px` | line 24 |
| `sm` | `16px` | `15px` | line 28 |

### ChatButton — Quick action variant (`is-quick-action`)

| State | Background | Color (text) | Border | Source line |
|---|---|---|---|---|
| Rest (line 32–37) | `transparent` | `var(--cds-chat-button)` `#525252` | `1px solid var(--cds-chat-button)` `#525252` | line 32 |
| Hover (line 39–43) | `var(--cds-chat-button-hover)` `rgba(141,141,141,0.12)` | `var(--cds-chat-button-text-hover)` `#0043ce` | `transparent` | — |
| Active (line 45–49) | `var(--cds-chat-button-active)` `rgba(141,141,141,0.5)` | `var(--cds-chat-button-text-hover)` `#0043ce` | `transparent` | — |
| Focus-visible (ghost flavour, line 51–54) | (inherits) | (inherits) | `1px solid var(--cds-focus)` `#0f62fe` | + `box-shadow: inset 0 0 0 1px var(--cds-focus)` |
| Focus + Hover (line 56–59) | (hover bg) | (hover text) | `1px solid var(--cds-focus)` `#0f62fe` | + `box-shadow: inset 0 0 0 1px var(--cds-focus-inset) #ffffff` |
| Disabled (line 61–65) | `transparent` | `var(--cds-button-disabled)` `#c6c6c6` | `1px solid var(--cds-button-disabled)` `#c6c6c6` | — |
| Selected (line 67–73) | `var(--cds-chat-button-selected)` `#d0e2ff` | `var(--cds-chat-button-text-selected)` `#0043ce` | `transparent` | — |
| Selected + Disabled | (selected bg) | (selected text) | `transparent` | — |
| Selected + Hover (line 75–82) | (hover/active bg) | `var(--cds-chat-button-text-selected)` `#0043ce` | (transparent) | — |

### AISkeleton (text/placeholder/icon — shared `@mixin skeleton`)

| Property | Value (from `utilities/_skeleton.scss` + per-component dimensions) |
|---|---|
| Background | `var(--cds-ai-skeleton-background)` = `#4589ff` (light) / `#78a9ff` (dark) — solid blue plate |
| Pseudo `::before` background (the moving shimmer) | `var(--cds-ai-skeleton-element-background)` = `rgba(15, 98, 254, 0.3)` (light) / `rgba(255, 255, 255, 0.3)` (dark) |
| Animation | `3000ms ease-in-out cds--skeleton infinite` (shared `@keyframes cds--skeleton` — defined in `utilities/_keyframes.scss`; transforms the `::before` `transform-origin` + `transform` + `opacity`) |
| Border / Border-radius | `border: none`, `border-radius: 0` (sharp — Carbon default; the only AI surface that does NOT round its corners) |
| Padding | `padding: 0` |
| Pointer events | `pointer-events: none` |
| Hover/focus/active | `border: none`, `cursor: default`, `outline: none` (suppressed — skeletons are non-interactive) |
| AISkeletonText block-size | `1rem` (16px). Heading variant: `1.5rem` (24px). Margin-block-end: `var(--cds-spacing-03)` `8px`. |
| AISkeletonPlaceholder block-size | `100px` × `100px` default — resize via `className` / `style` |
| AISkeletonIcon block-size | `16px` × `16px` default — resize via `style` / `custom-styles` |
| Reduced motion | `@media (prefers-reduced-motion: reduce) { animation: none; }` (the solid blue plate stays — only the shimmer stops) |

## Animation & Motion

All AI-surface motion uses Carbon's productive-entrance easing curve `cubic-bezier(0.4, 0.14, 0.3, 1)` and the fast-01 duration `70ms` for state changes. The skeleton shimmer uses a slower 3000ms ease-in-out loop because it needs to feel "ambient", not "interactive".

```css
/* === AILabel button — state transitions === */
.cds--ai-label__button,
.cds--slug__button {
  transition:
    color var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),       /* motion(entrance, productive) */
    border-color var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    box-shadow var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    background var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1);
}

/* The inline-kind ::before pseudo (the AI dot indicator) also transitions on hover */
.cds--ai-label__button--inline .cds--ai-label__text::before,
.cds--slug__button--inline .cds--slug__text::before {
  transition:
    background var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    inline-size var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1);
}

/* === AILabel popover — open/close === */
/* No CSS open transition — the popover snaps in/out via display: none ↔ block.
   The AI-aura gradient is static (painted by paint() not animated).
   Wrap in your own enter animation if you want it to feel "magical": */
@keyframes cds--ai-popover-enter {
  from {
    opacity: 0;
    transform: translateY(4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.cds--ai-label-content[data-open="true"] {
  animation: cds--ai-popover-enter var(--cds-duration-fast-02) cubic-bezier(0.4, 0.14, 0.3, 1);
  /* var(--cds-duration-fast-02) = 110ms */
}

/* === AISkeleton — shimmer === */
/* The shared keyframes (from utilities/_keyframes.scss): */
@keyframes cds--skeleton {
  0% {
    transform-origin: left;
    transform: scaleX(0);
    opacity: 0.3;
  }
  20% {
    transform-origin: left;
    transform: scaleX(1);
    opacity: 1;
  }
  28% {
    transform-origin: right;
    transform: scaleX(1);
    opacity: 1;
  }
  51% {
    transform-origin: right;
    transform: scaleX(0);
    opacity: 0.3;
  }
  58% {
    transform-origin: right;
    transform: scaleX(0);
    opacity: 0.3;
  }
  82% {
    transform-origin: right;
    transform: scaleX(0);
    opacity: 0.3;
  }
  83% {
    transform-origin: left;
  }
  96% {
    transform-origin: left;
    transform: scaleX(0);
    opacity: 0.3;
  }
  100% {
    transform-origin: left;
    transform: scaleX(0);
    opacity: 0.3;
  }
}

.cds--ai-skeleton-text,
.cds--ai-skeleton-placeholder,
.cds--icon--ai-skeleton {
  position: relative;
  background: var(--cds-ai-skeleton-background);   /* #4589ff in light themes */
  pointer-events: none;
}

.cds--ai-skeleton-text::before,
.cds--ai-skeleton-placeholder::before,
.cds--icon--ai-skeleton::before {
  position: absolute;
  inset-inline-start: 0;
  inline-size: 100%;
  block-size: 100%;
  background: var(--cds-ai-skeleton-element-background);  /* rgba(15,98,254,0.3) in light themes */
  content: '';
  animation: 3000ms ease-in-out cds--skeleton infinite;
  will-change: transform-origin, transform, opacity;
}

@media (prefers-reduced-motion: reduce) {
  .cds--ai-skeleton-text::before,
  .cds--ai-skeleton-placeholder::before,
  .cds--icon--ai-skeleton::before {
    animation: none;
  }
}

/* === ChatButton — inherits cds--btn transitions === */
.cds--chat-btn {
  transition:
    background var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    color var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    border-color var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1),
    box-shadow var(--cds-duration-fast-01) cubic-bezier(0.4, 0.14, 0.3, 1);
}

@media (prefers-reduced-motion: reduce) {
  .cds--ai-label__button,
  .cds--slug__button,
  .cds--chat-btn {
    transition: none;
  }
}
```

### The `@mixin ai-popover-gradient` — resolved (the surface paint of the AI popover)

This is the most distinctive piece of Carbon AI styling. The mixin emits **four** stacked backgrounds in one declaration — two `padding-box` layers (the visible inside paint) and two `border-box` layers (the gradient border that simulates the AI border edge). Resolved literal output for the default (rest) state:

```css
.cds--ai-label-content {
  background:
    /* Layer 1 (padding-box): the visible inside surface — popover-bg under, blue aura on top, fading up */
    linear-gradient(
        to top,
        var(--cds-ai-popover-background) 0%,    /* solid white/g80/g90 base */
        var(--cds-ai-aura-start) 0%,             /* blue-50 @ 10% — sits on top */
        15%,
        var(--cds-ai-aura-end) 50%               /* fades to 0 alpha by 50% up the surface */
      )
      padding-box,
    /* Layer 2 (padding-box): solid bg under everything, ensures opaque even where Layer 1 fades */
    linear-gradient(to top, var(--cds-ai-popover-background), var(--cds-ai-popover-background))
      padding-box,
    /* Layer 3 (border-box): the AI border — gradient from translucent blue-30 (top) to blue-40 (bottom) */
    linear-gradient(to bottom, var(--cds-ai-border-start), var(--cds-ai-border-end))
      border-box,
    /* Layer 4 (border-box): bg underlay so the transparent border isn't see-through to anything behind */
    linear-gradient(to top, var(--cds-ai-popover-background), var(--cds-ai-popover-background))
      border-box;

  border: 1px solid transparent;   /* Border is *paint* — the actual border is transparent */
  border-radius: 8px;
}
```

The selected and hover variants of the same mixin (used by AI selectable tile + AI table row hover) substitute different aura tokens — see `_ai-gradient.scss` lines 98–153 for the full mixin.

## Accessibility (from Carbon's docs + source)

### AILabel

- **Semantic element:** `<button class="cds--ai-label__button">` for the trigger; the popover surface is a `<div role="dialog" aria-modal="false">` (mounted via Carbon's shared toggletip mechanism — same machinery as Toggletip).
- **ARIA on trigger:** `aria-label="Show information"` (sourced from the `buttonLabel` arg / `aria-label` prop), `aria-haspopup="dialog"`, `aria-expanded` toggles between `"false"` and `"true"` based on open state.
- **ARIA on popover:** `role="dialog"`, `aria-labelledby="..."` referencing the popover's `<h2 class="ai-label-heading">` (the "84%" confidence-score heading in the demo). Carbon does NOT add `aria-modal="true"` because the popover is non-modal — surrounding page content remains operable.
- **Keyboard:**
  - `Enter` / `Space` on trigger → opens popover.
  - `Esc` → closes popover, returns focus to trigger.
  - `Tab` cycles through interactive elements inside the popover (links, IconButtons in `<AILabelActions>`, the "View details" `<Button>`).
  - `Shift+Tab` from the first focusable element returns to the trigger.
  - `revertActive` toggles the trigger between "AI" badge and a `Reset` revert button — same keyboard behaviour, different label.
- **Touch target:** sizes `mini` (16px) and `2xs` (20px) get a transparent `::after` pseudo-element of `24×24px` (`_slug.scss` lines 107–117) to satisfy WCAG 2.5.5 AAA (24×24 minimum). Larger sizes (`xs` 24px → `xl` 64px) already meet AA (24×24) and AAA (44×44 from `lg` up).
- **Focus management:** Carbon's CSS provides the signature double-ring on focus-visible (`border` + `inset box-shadow`). Do NOT remove it. When the popover opens, focus stays on the trigger by default — only the popover content becomes part of the tab order.
- **Color contrast:** the rest-state badge (`color: var(--cds-text-primary)` `#161616` on transparent over `--cds-background` `#ffffff`) has 21:1 contrast (AAA Large + AA Normal). Hover state (`color: var(--cds-background-inverse)` `#393939` on `var(--cds-border-inverse)` `#161616`) has 12.6:1.

### AISkeleton (Text / Placeholder / Icon)

- **Semantic element:** `<div>` (Text and Placeholder) or `<span>` (Icon). The Web Component renders into a host element (`<cds-ai-skeleton-text>` etc.) with `display: block` (`text`/`placeholder`) or `display: inline-block` (`icon`).
- **ARIA:** Carbon's source does NOT auto-apply `aria-hidden`. **Apply it yourself** plus an `aria-busy="true"` on the parent container that's loading:
  ```html
  <div aria-busy="true" aria-live="polite">
    <cds-ai-skeleton-text width="60%"></cds-ai-skeleton-text>
    <cds-ai-skeleton-text paragraph linecount="3" width="100%"></cds-ai-skeleton-text>
  </div>
  ```
  Pair with a visually hidden status message: `<span class="cds--visually-hidden">Loading AI response…</span>`.
- **Keyboard:** Skeletons are non-interactive — `pointer-events: none` (line 23 of `utilities/_skeleton.scss`) and any hover/focus/active styles are stripped. They never receive focus.
- **Touch target:** N/A (decorative).
- **Reduced motion:** the shimmer animation respects `@media (prefers-reduced-motion: reduce)` — the solid blue plate persists but the shimmer pseudo stops moving (line 43–45 of `utilities/_skeleton.scss`).
- **Color contrast:** Skeleton plates are **decorative** — they don't need to pass contrast against the page bg, but the AI blue (`#4589ff`) over white has 3.4:1, sufficient to be visually distinct. In G100, the lighter blue (`#78a9ff`) over `#161616` has 7.8:1.

### ChatButton

- **Semantic element:** `<button>` (React) or `<cds-chat-button>` (registered as `role="button"` with internal `<button>` slot).
- **ARIA:** Inherits all `cds-button` ARIA. When `isSelected` is set, adds `aria-pressed="true"`. When `disabled`, adds `aria-disabled="true"` and removes from tab order. The `isQuickAction` chip variant pairs naturally with `role="group"` on its container plus a labelled fieldset:
  ```html
  <fieldset>
    <legend class="cds--visually-hidden">Quick actions</legend>
    <cds-chat-button is-quick-action>Summarise</cds-chat-button>
    <cds-chat-button is-quick-action>Translate</cds-chat-button>
    <cds-chat-button is-quick-action>Cite source</cds-chat-button>
  </fieldset>
  ```
- **Keyboard:** Same as standard Button — `Enter` / `Space` activate. The `isQuickAction` selected state maintains `aria-pressed` so screen readers announce "selected button".
- **Touch target:** `sm` (32px) misses AAA (44×44) — use only in dense scrollable lists. `md` (40px) / `lg` (48px) meet AAA. The `padding-inline-end: 15px` (line 20) on chat buttons without an icon ensures a comfortable tappable area at all sizes.
- **Focus management:** quick-action ghost buttons get the standard Carbon double-ring (`1px solid focus border` + `inset 1px focus shadow`). Do NOT remove.
- **Reduced motion:** Inherits the `cds--btn` transition list — already sub-100ms, but suppressed under `prefers-reduced-motion` via the SCSS.

### Composite usage (chat shell with AI affordance)

When ChatButton, AISkeleton, and AILabel co-occur in a chat-shell context (typical `watsonx Assistant` or `watsonx Orchestrate` UI), wire them together:

1. The streaming **AI response bubble** uses `<cds-ai-skeleton-text paragraph linecount="3">` while loading, replaced in-place once the message streams in.
2. The **AI sender avatar** uses `var(--cds-chat-avatar-user)` / `var(--cds-chat-avatar-bot)` for the circular avatar background.
3. The **provenance badge** at the bottom of the streamed response is a `<cds-ai-label kind="inline" size="sm">` with the model name as `aiTextLabel` (e.g., `aiTextLabel="Granite 3.0"`), opening to a popover that explains "This response was generated by Granite 3.0…".
4. The **suggested reply chips** under the input field are `<cds-chat-button is-quick-action>` buttons in a `role="group"` fieldset.
5. The **send button** is a regular `<cds-chat-button kind="primary" size="md">Send</cds-chat-button>` (NOT `is-quick-action`).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon AI outputs — AILabel, AISkeleton, and ChatButton are pixel-perfect when their verbatim source is preserved. | Don't paraphrase or rewrite — use the verbatim code from Section 5 / 6 / 7. |
| Use the `--cds-ai-*` and `--cds-chat-*` tokens for any AI/chat surface — they're the only way to participate in Carbon's AI design language. | Don't invent your own purple/blue gradients to "look AI" — use `var(--cds-ai-aura-start)` → `var(--cds-ai-aura-end)`. The colour, opacity, and direction matter. |
| Apply `border-radius: 8px` to AI popover surfaces and the dual-gradient pattern from Section 7's "AI Aura on a Tile" example. | Don't apply rounded corners to the AILabel button itself when `kind="default"` — it stays sharp. The `1px` radius on `kind="inline"` is intentional and microscopic. |
| Pair AISkeleton with `aria-busy="true"` on its parent container and a `<span class="cds--visually-hidden">Loading AI response…</span>` SR-only label. | Don't use AISkeleton for non-AI loading states — the blue colour misleads users. Use `<cds-skeleton-text>` (the regular gray skeleton) for non-AI loading. |
| Wrap `is-quick-action` chips in a labelled `<fieldset>` (or `role="group"` with `aria-label`) so screen readers announce them as a coherent set. | Don't use `is-quick-action` for primary chat-send actions — quick action chips are auxiliary suggestions, not the main "send" button. |
| For the `aiAura` Tile/Modal pattern, keep the gradient subtle — Carbon's `--cds-ai-aura-start: rgba(69,137,255,0.1)` is intentionally 10% alpha. | Don't crank up the aura alpha to make AI more "obvious" — at >40% the gradient becomes visually distracting and reduces legibility of the tile content. |
| Use `kind="inline"` AILabel inside table cells, form labels, and body copy — the 1px radius + transparent rest-state border is designed for that context. | Don't use `kind="default"` AILabel inside tight inline contexts — its hard 1px border-inverse border is visually loud against body copy. |
| Use the dual `padding-box` / `border-box` gradient from `@mixin ai-popover-gradient` for any custom AI surface (custom modal, custom drawer). | Don't use `box-shadow` for the AI aura — the mixin uses `background-image` so the border participates in the same paint, which `box-shadow` cannot. |
| Set `aria-haspopup="dialog"` on the AILabel button trigger and `role="dialog" aria-modal="false"` on the popover surface — Carbon does this automatically; preserve it if hand-rolling. | Don't set `aria-modal="true"` on the popover — it's non-modal by design (surrounding page content stays operable). |
| Keep AISkeleton's `pointer-events: none` (set by `@mixin skeleton`) — skeletons must never receive focus or pointer interaction. | Don't make AISkeleton interactive (e.g., adding `:hover` styling) — it breaks the loading-state semantics. |
| For ChatButton sizes, follow heights `sm 32px / md 40px / lg 48px` and let the `border-radius: 16/20/24px` rule from `_chat-button.scss` apply — it's intentionally `height/2` to make the button perfectly pill-shaped. | Don't override ChatButton's border-radius — the pill shape is what distinguishes it from a regular `cds--btn` (which is sharp). |
| Use `var(--cds-chat-button-text-selected)` `#0043ce` (blue-70) for the text colour of selected quick-action chips — it gives the selected chip visual weight without a heavy fill. | Don't use a solid blue background for selected quick-action chips — Carbon uses `var(--cds-chat-button-selected)` `#d0e2ff` (blue-20, very light) to keep the chip group visually quiet. |
| Wrap the AI badge in `[data-theme="white"]` or `[data-theme="g100"]` (or `.dark`) — the `--cds-ai-*` tokens cascade per theme. | Don't hard-code `#4589ff` or any other AI hex — the dark themes swap the blue family (`#78a9ff` instead of `#4589ff`) for contrast. |
| Use the `@mixin ai-popover-gradient` exactly as defined — its 4-layer composition is precise (Layer 4 underlay is non-obvious but mandatory; without it the transparent border becomes see-through). | Don't simplify the gradient to 2 layers — the underlay layers (2 and 4) are what guarantee opacity over any background. |
| Keep the AILabel popover's `min-inline-size: 280px` (line 327) — narrower popovers crop the "84% Confidence score" heading and break the design intent. | Don't make AI popovers wider than ~360px without redesigning — long-line body copy degrades scannability. |
