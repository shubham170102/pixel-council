---
name: code-snippet
description: Carbon CodeSnippet — inline, single-line, multi-line (with copy + Show more / Show less expand), and skeleton variants reproduced verbatim from Carbon Storybook
metadata:
  tags: code-snippet, code, copy, clipboard, mono, ibm-plex-mono, ibm, carbon, react, web-components
---

# Code Snippet -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`CodeSnippet.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/CodeSnippet/CodeSnippet.stories.js)
> - **WC story:** [`code-snippet.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/code-snippet/code-snippet.stories.ts)
> - **Styles SCSS:** [`_code-snippet.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/code-snippet/_code-snippet.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-codesnippet--inline
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-code-snippet--inline
> - **Docs page:** https://v11.carbondesignsystem.com/components/code-snippet/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Variants | `inline`, `single`, `multi` (+ `skeleton`) |
| Inline height | content-driven (line-height of `code-01` ≈ 16px) plus padding; copy button column-wraps to `1.25rem` (20px) |
| Single-line height | `block-size: $spacing-08` = `40px` |
| Multi-line collapsed height | content height capped by `maxCollapsedNumberOfRows` (default `15` rows of `code-02` 20px line-height) |
| Multi-line skeleton height | `98px` |
| Single-line skeleton height | `56px` |
| Copy button (Single / Multi) | `32px` × `32px` square; multi-line offset `top: 0.5rem; right: 0.5rem` |
| Show more / Show less button | `32px` tall; `padding: $spacing-03 $spacing-05` (`8px 16px`); positioned bottom-right `inset-block-end: 0; inset-inline-end: 0;` |
| Multi-line padding | `padding: $spacing-05` (`16px`) on host; pre `padding-block-end: $spacing-06` (`24px`); pre `padding-inline-end: $spacing-06` (`24px`) |
| Single-line container padding | `padding-inline-start: $spacing-05` (`16px`); pre `padding-inline-end: $spacing-07` (`32px`) |
| Inline padding (code) | `padding: 0 $spacing-03` (`0 8px`) |
| Background — inline / single | `var(--cds-layer)` → `#f4f4f4` (White), `#ffffff` (G10), `#393939` (G90), `#262626` (G100) |
| Background — multi | `var(--cds-layer)` (same as single — Carbon uses tokenised layer; the *appearance* of "slightly darker" comes from layer-tier nesting via `cds-layer`) |
| Hover bg | `var(--cds-layer-hover)` |
| Active bg | `var(--cds-layer-active)` |
| Disabled fg / icon | `var(--cds-text-disabled)` / `var(--cds-icon-disabled)` |
| Copy icon | `Copy` (`@carbon/icons` 16px) — `block-size: 16px; inline-size: 16px;` |
| Expand chevron | `ChevronDown` (`@carbon/icons` 16px), rotates 180° when expanded |
| Feedback tooltip | text from `feedback` prop (default `"Copied to clipboard"`); `bg: var(--cds-background-inverse)` `#393939` (W) / `#f4f4f4` (G100); `fg: var(--cds-text-inverse)` |
| Feedback timeout | default `2000ms` (React `feedbackTimeout` default) |
| Font (code) | `IBM Plex Mono`, `code-01` (12px / 16px / 0.32px / 400) for inline + single + multi pre |
| Font (Show more text) | `IBM Plex Sans`, `body-compact-01` (14px / 18px / 0.16px / 400) |
| Corner radius | `0` everywhere (Carbon is sharp) — **only inline gets `border-radius: 4px`** to avoid clipping its inline focus border |
| Border radius — inline | `border-radius: 4px` (sole exception in Carbon code-snippet) |
| Border radius — single / multi | `border-radius: 0` |
| Focus | inline: `border: 1px solid var(--cds-focus)`; single / multi: `outline: 2px solid var(--cds-focus); outline-offset: -2px;` (`focus-outline('outline')`) |
| Right-edge fade mask (single) | `mask-image: linear-gradient(to right, #000 calc(100% - 32px), transparent 100%)` — disabled on `:focus-within` |
| Bottom + right fade mask (multi collapsed) | composited `mask-image` (right: 32px fade) ∩ (bottom: 16px fade) — disabled on `:focus-within` |
| Wrap text (multi only) | `wrapText` prop → `white-space: pre-wrap; word-wrap: break-word;` |
| Expand transition | `transition: max-height var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);` (150ms) |
| Chevron transition | same `moderate-01` (150ms) productive-standard |
| Copy feedback transition | `var(--cds-duration-fast-02)` (110ms) productive-standard |
| Icon transition | `transition: all var(--cds-duration-fast-01) var(--cds-easing-productive-standard);` (70ms) |
| React import | `import { CodeSnippet, CodeSnippetSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/code-snippet/index.js';` |

## Variants (from Storybook story exports)

| Variant | React story export | WC story export | Purpose |
|---|---|---|---|
| Inline | `Inline` | `Inline` | Mono-style code embedded inline within a paragraph (e.g., `node -v`). Click anywhere on the inline pill to copy. Shows feedback tooltip on click. |
| Single-line | `Singleline` | `Singleline` | Single-row block snippet with a fixed-position copy button on the right. No expand. Right-edge fade mask hints at horizontal overflow. |
| Multi-line | `Multiline` | `Multiline` | Multi-row block snippet with copy button (top-right) **and** Show more / Show less expand button (bottom-right). Default collapse threshold is 15 rows; `wrapText` flag toggles wrap. |
| Inline (with Layer) | `InlineWithLayer` | `InlineWithLayer` | Same as Inline, nested in `cds-layer` to demonstrate layer-tier promotion (`layer-01 → layer-02 → layer-03`). |
| Single-line (with Layer) | `SinglelineWithLayer` | `SinglelineWithLayer` | Same as Singleline, nested in `cds-layer`. |
| Multi-line (with Layer) | `MultilineWithLayer` | `MultilineWithLayer` | Same as Multiline, nested in `cds-layer`. |
| Skeleton | `Skeleton` | `Skeleton` | Loading placeholder. Renders one `single` skeleton (`56px` tall) and one `multi` skeleton (`98px` tall). |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `CodeSnippet.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. Output these as-is when generating Carbon React UI.

**Imports** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import { default as CodeSnippet, CodeSnippetSkeleton } from '.';
import mdx from './CodeSnippet.mdx';
```

**Story default export** (component metadata + arg-type controls):

```jsx
export default {
  title: 'Components/CodeSnippet',
  component: CodeSnippet,
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

**Variant: Inline**

```jsx
export const Inline = (args) => {
  return (
    <CodeSnippet type="inline" feedback="Copied to clipboard" {...args}>
      {'node -v'}
    </CodeSnippet>
  );
};
```

**Variant: Multiline**

```jsx
export const Multiline = (args) => {
  return (
    <CodeSnippet type="multi" feedback="Copied to clipboard" {...args}>
      {`  "scripts": {
    "build": "lerna run build --stream --prefix --npm-client yarn",
    "ci-check": "carbon-cli ci-check",
    "clean": "lerna run clean && lerna clean --yes && rimraf node_modules",
    "doctoc": "doctoc --title '## Table of Contents'",
    "format": "prettier --write '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**'",
    "format:diff": "prettier --list-different '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**' '!packages/components/**'",
    "lint": "eslint actions config codemods packages",
    "lint:styles": "stylelint '**/*.{css,scss}' --report-needless-disables --report-invalid-scope-disables",
    "test": "cross-env BABEL_ENV=test jest",
    "test:e2e": "cross-env BABEL_ENV=test jest --testPathPattern=e2e --testPathIgnorePatterns='examples,/packages/components/,/packages/react/'"
  },
  "resolutions": {
    "react": "~16.9.0",
    "react-dom": "~16.9.0",
    "react-is": "~16.9.0",
    "react-test-renderer": "~16.9.0"
  },
  "devDependencies": {
    "@babel/core": "^7.10.0",
    "@babel/plugin-proposal-class-properties": "^7.7.4",
    "@babel/plugin-proposal-export-default-from": "^7.7.4",
    "@babel/plugin-proposal-export-namespace-from": "^7.7.4",
    "@babel/plugin-transform-runtime": "^7.10.0",
    "@babel/preset-env": "^7.10.0",
    "@babel/preset-react": "^7.10.0",
    "@babel/runtime": "^7.10.0",
    "@commitlint/cli": "^8.3.5",`}
    </CodeSnippet>
  );
};
```

**Variant: Singleline**

```jsx
export const Singleline = (args) => {
  return (
    <CodeSnippet type="single" feedback="Copied to clipboard" {...args}>
      yarn add carbon-components@latest carbon-components-react@latest
      @carbon/icons-react@latest carbon-icons@latest
    </CodeSnippet>
  );
};
```

**Variant: InlineWithLayer**

```jsx
export const InlineWithLayer = (args) => {
  return (
    <WithLayer>
      <CodeSnippet type="inline" feedback="Copied to clipboard" {...args}>
        {'node -v'}
      </CodeSnippet>
    </WithLayer>
  );
};
```

**Variant: MultilineWithLayer**

```jsx
export const MultilineWithLayer = (args) => {
  return (
    <WithLayer>
      <CodeSnippet type="multi" feedback="Copied to clipboard" {...args}>
        {`  "scripts": {
      "build": "lerna run build --stream --prefix --npm-client yarn",
      "ci-check": "carbon-cli ci-check",
      "clean": "lerna run clean && lerna clean --yes && rimraf node_modules",
      "doctoc": "doctoc --title '## Table of Contents'",
      "format": "prettier --write '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**'",
      "format:diff": "prettier --list-different '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**' '!packages/components/**'",
      "lint": "eslint actions config codemods packages",
      "lint:styles": "stylelint '**/*.{css,scss}' --report-needless-disables --report-invalid-scope-disables",
      "test": "cross-env BABEL_ENV=test jest",
      "test:e2e": "cross-env BABEL_ENV=test jest --testPathPattern=e2e --testPathIgnorePatterns='examples,/packages/components/,/packages/react/'"
      },
      "resolutions": {
        "react": "~16.9.0",
        "react-dom": "~16.9.0",
        "react-is": "~16.9.0",
        "react-test-renderer": "~16.9.0"
      },
      "devDependencies": {
        "@babel/core": "^7.10.0",
        "@babel/plugin-proposal-class-properties": "^7.7.4",
        "@babel/plugin-proposal-export-default-from": "^7.7.4",
        "@babel/plugin-proposal-export-namespace-from": "^7.7.4",
        "@babel/plugin-transform-runtime": "^7.10.0",
        "@babel/preset-env": "^7.10.0",
        "@babel/preset-react": "^7.10.0",
        "@babel/runtime": "^7.10.0",
        "@commitlint/cli": "^8.3.5",`}
      </CodeSnippet>
    </WithLayer>
  );
};
```

**Variant: SinglelineWithLayer**

```jsx
export const SinglelineWithLayer = (args) => {
  return (
    <WithLayer>
      <CodeSnippet type="single" feedback="Copied to clipboard" {...args}>
        yarn add carbon-components@latest carbon-components-react@latest
        @carbon/icons-react@latest carbon-icons@latest
      </CodeSnippet>
    </WithLayer>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return (
    <div>
      <CodeSnippetSkeleton type="single" style={{ marginBottom: 8 }} />
      <CodeSnippetSkeleton type="multi" />
    </div>
  );
};
```

## Web Components (verbatim from Storybook)

> Copied exactly from `code-snippet.stories.ts` on the Carbon `main` branch. Output as-is when emitting framework-agnostic Carbon HTML.

**Imports + license header**

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './index';
import '../layer/index';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Shared `args` (default values applied to every story)**

```ts
const args = {
  copyButtonDescription: 'Copy to clipboard',
  copyText: '',
  disabled: false,
  feedback: '',
  feedbackTimeout: 0,
  hideCopyButton: false,
  maxCollapsedNumberOfRows: 15,
  maxExpandeddNumberOfRows: 0,
  minCollapsedNumberOfRows: 3,
  minExpandeddNumberOfRows: 16,
  showLessText: 'Show less',
  showMoreText: 'Show more',
  type: 'single',
  text: 'node -v',
  wrapText: false,
};
```

**Shared `argTypes` (Storybook controls — describe every public attribute)**

```ts
const argTypes = {
  copyButtonDescription: {
    control: 'text',
    description: 'Specify the description for the Copy Button.',
  },
  copyText: {
    control: 'text',
    description:
      "Optional text to copy. If not specified, the children node's <code>innerText</code> will be used as the copy value.",
  },
  disabled: {
    control: 'boolean',
    description: 'Specify whether or not the CodeSnippet should be disabled.',
  },
  feedback: {
    control: 'text',
    description: 'Specify the string displayed when the snippet is copied.',
  },
  feedbackTimeout: {
    control: 'number',
    description:
      'Specify the time it takes for the feedback message to timeout.',
  },
  hideCopyButton: {
    control: 'boolean',
    description:
      'Specify whether or not a copy button should be used/rendered.',
  },
  maxCollapsedNumberOfRows: {
    control: 'number',
    description:
      'Specify the maximum number of rows to be shown when in collapsed view.',
  },
  maxExpandeddNumberOfRows: {
    control: 'number',
    description:
      'Specify the maximum number of rows to be shown when in expanded view.',
  },
  minCollapsedNumberOfRows: {
    control: 'number',
    description:
      'Specify the minimum number of rows to be shown when in collapsed view.',
  },
  minExpandeddNumberOfRows: {
    control: 'number',
    description:
      'Specify the minimum number of rows to be shown when in expanded view.',
  },
  showLessText: {
    control: 'text',
    description:
      'Specify a string that is displayed when the Code Snippet has been interacted with to show more lines.',
  },
  showMoreText: {
    control: 'text',
    description:
      'Specify a string that is displayed when the Code Snippet text is more than 15 lines.',
  },
  type: {
    control: 'radio',
    options: ['single', 'inline', 'multi'],
  },
  text: {
    control: 'text',
    description: 'Specify the text that is inside the code snippet',
  },
  wrapText: {
    control: 'boolean',
    description: 'Specify whether or not to wrap the text.',
  },
};
```

**Variant: Inline**

```ts
export const Inline = {
  args: {
    ...args,
    type: 'inline',
  },
  argTypes,
  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};
    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}
      </cds-code-snippet>
    `;
  },
};
```

**Variant: InlineWithLayer**

```ts
export const InlineWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: {
    ...args,
    type: 'inline',
  },
  argTypes,
  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};
    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}
      </cds-code-snippet>
    `;
  },
};
```

**Variant: Multiline**

```ts
export const Multiline = {
  args: {
    ...args,
    type: 'multi',
    text: `"scripts": {
    "build": "lerna run build --stream --prefix --npm-client yarn",
    "ci-check": "carbon-cli ci-check",
    "clean": "lerna run clean && lerna clean --yes && rimraf node_modules",
    "doctoc": "doctoc --title '## Table of Contents'",
    "format": "prettier --write '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**'",
    "format:diff": "prettier --list-different '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**' '!packages/components/**'",
    "lint": "eslint actions config codemods packages",
    "lint:styles": "stylelint '**/*.{css,scss}' --report-needless-disables --report-invalid-scope-disables",
    "test": "cross-env BABEL_ENV=test jest",
    "test:e2e": "cross-env BABEL_ENV=test jest --testPathPattern=e2e --testPathIgnorePatterns='examples,/packages/components/,/packages/react/'"
  },
  "resolutions": {
    "react": "~16.9.0",
    "react-dom": "~16.9.0",
    "react-is": "~16.9.0",
    "react-test-renderer": "~16.9.0"
  },
  "devDependencies": {
    "@babel/core": "^7.10.0",
    "@babel/plugin-proposal-class-properties": "^7.7.4",
    "@babel/plugin-proposal-export-default-from": "^7.7.4",
    "@babel/plugin-proposal-export-namespace-from": "^7.7.4",
    "@babel/plugin-transform-runtime": "^7.10.0",
    "@babel/preset-env": "^7.10.0",
    "@babel/preset-react": "^7.10.0",
    "@babel/runtime": "^7.10.0",
    "@commitlint/cli": "^8.3.5",
`,
  },
  argTypes,

  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};
    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}
      </cds-code-snippet>
    `;
  },
};
```

**Variant: MultilineWithLayer**

```ts
export const MultilineWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: {
    ...args,
    type: 'multi',
    text: `"scripts": {
    "build": "lerna run build --stream --prefix --npm-client yarn",
    "ci-check": "carbon-cli ci-check",
    "clean": "lerna run clean && lerna clean --yes && rimraf node_modules",
    "doctoc": "doctoc --title '## Table of Contents'",
    "format": "prettier --write '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**'",
    "format:diff": "prettier --list-different '**/*.{js,md,scss,ts}' '!**/{build,es,lib,storybook,ts,umd}/**' '!packages/components/**'",
    "lint": "eslint actions config codemods packages",
    "lint:styles": "stylelint '**/*.{css,scss}' --report-needless-disables --report-invalid-scope-disables",
    "test": "cross-env BABEL_ENV=test jest",
    "test:e2e": "cross-env BABEL_ENV=test jest --testPathPattern=e2e --testPathIgnorePatterns='examples,/packages/components/,/packages/react/'"
  },
  "resolutions": {
    "react": "~16.9.0",
    "react-dom": "~16.9.0",
    "react-is": "~16.9.0",
    "react-test-renderer": "~16.9.0"
  },
  "devDependencies": {
    "@babel/core": "^7.10.0",
    "@babel/plugin-proposal-class-properties": "^7.7.4",
    "@babel/plugin-proposal-export-default-from": "^7.7.4",
    "@babel/plugin-proposal-export-namespace-from": "^7.7.4",
    "@babel/plugin-transform-runtime": "^7.10.0",
    "@babel/preset-env": "^7.10.0",
    "@babel/preset-react": "^7.10.0",
    "@babel/runtime": "^7.10.0",
    "@commitlint/cli": "^8.3.5",
`,
  },
  argTypes,
  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};

    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}
      </cds-code-snippet>
    `;
  },
};
```

**Variant: Singleline**

```ts
export const Singleline = {
  args: {
    ...args,
    type: 'single',
    text: 'yarn add carbon-components@latest carbon-components-react@latest @carbon/icons-react@latest carbon-icons@latest',
  },
  argTypes,
  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};
    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}
      </cds-code-snippet>
    `;
  },
};
```

**Variant: SinglelineWithLayer**

```ts
export const SinglelineWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: {
    ...args,
    type: 'single',
    text: 'yarn add carbon-components@latest carbon-components-react@latest @carbon/icons-react@latest carbon-icons@latest',
  },
  argTypes,
  render: (args) => {
    const {
      copyButtonDescription,
      copyText,
      disabled,
      feedback,
      feedbackTimeout,
      hideCopyButton,
      maxCollapsedNumberOfRows,
      maxExpandedNumberOfRows,
      minCollapsedNumberOfRows,
      minExpandedNumberOfRows,
      showLessText,
      showMoreText,
      text,
      type,
      wrapText,
    } = args ?? {};
    return html`
      <cds-code-snippet
        type="${type}"
        copy-text="${copyText}"
        ?disabled="${disabled}"
        maxCollapsedNumberOfRows="${maxCollapsedNumberOfRows}"
        maxExpandedNumberOfRows="${maxExpandedNumberOfRows}"
        minCollapsedNumberOfRows="${minCollapsedNumberOfRows}"
        minExpandedNumberOfRows="${minExpandedNumberOfRows}"
        ?hide-copy-button="${hideCopyButton}"
        show-less-text="${showLessText}"
        show-more-text="${showMoreText}"
        ?wrap-text="${wrapText}"
        feedback=${feedback}
        feedback-timeout=${feedbackTimeout}
        tooltip-content="${copyButtonDescription}"
        >${text}</cds-code-snippet
      >
    `;
  },
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  render: () => html`
    <cds-code-snippet-skeleton
      type="single"
      style="margin-bottom: 8px;"></cds-code-snippet-skeleton>
    <cds-code-snippet-skeleton type="multi"></cds-code-snippet-skeleton>
  `,
};
```

**Story `meta` (default export)**

```ts
const meta = {
  title: 'Components/Code snippet',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> When you can't ship a custom-element bundle, the `cds--snippet` markup below is what `<cds-code-snippet>` renders into the DOM. Pair with the `## Component CSS (verbatim from `_code-snippet.scss`)` section so every state hangs off real Carbon class names.

**Variant: Inline**

```html
<button
  type="button"
  class="cds--snippet cds--snippet--inline cds--btn cds--btn--primary"
  aria-label="node -v"
  data-feedback="Copied to clipboard">
  <code>node -v</code>
</button>
```

**Variant: Inline (no copy)** — disable click-to-copy, render as a non-interactive inline span:

```html
<span class="cds--snippet cds--snippet--inline cds--snippet--no-copy">
  <code>node -v</code>
</span>
```

**Variant: Single-line**

```html
<div class="cds--snippet cds--snippet--single">
  <div
    role="textbox"
    tabindex="0"
    aria-label="yarn add carbon-components@latest"
    class="cds--snippet-container">
    <pre>yarn add carbon-components@latest carbon-components-react@latest @carbon/icons-react@latest carbon-icons@latest</pre>
  </div>
  <div class="cds--popover-container cds--popover--caret cds--popover--high-contrast cds--popover--top cds--popover--align-center cds--copy-btn">
    <button
      type="button"
      class="cds--copy cds--copy-btn"
      aria-label="Copy to clipboard"
      data-feedback="Copied to clipboard">
      <!-- @carbon/icons Copy 16 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" class="cds--snippet__icon" aria-hidden="true">
        <path d="M28 10v18H10V10h18m0-2H10a2 2 0 0 0-2 2v18a2 2 0 0 0 2 2h18a2 2 0 0 0 2-2V10a2 2 0 0 0-2-2Z"/>
        <path d="M4 18H2V4a2 2 0 0 1 2-2h14v2H4Z"/>
      </svg>
    </button>
  </div>
</div>
```

**Variant: Multi-line (collapsed, with Show more / Show less)**

```html
<div class="cds--snippet cds--snippet--multi">
  <div
    role="textbox"
    tabindex="0"
    aria-label="Multi-line code snippet"
    class="cds--snippet-container"
    style="max-block-size: calc(15 * 1.25rem);">
    <pre><code>"scripts": {
  "build": "lerna run build --stream --prefix --npm-client yarn",
  "ci-check": "carbon-cli ci-check",
  "clean": "lerna run clean &amp;&amp; lerna clean --yes &amp;&amp; rimraf node_modules"
  ...
}</code></pre>
  </div>

  <div class="cds--popover-container cds--popover--caret cds--popover--high-contrast cds--popover--top cds--popover--align-center cds--copy-btn">
    <button
      type="button"
      class="cds--copy cds--copy-btn"
      aria-label="Copy to clipboard"
      data-feedback="Copied to clipboard">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" class="cds--snippet__icon" aria-hidden="true">
        <path d="M28 10v18H10V10h18m0-2H10a2 2 0 0 0-2 2v18a2 2 0 0 0 2 2h18a2 2 0 0 0 2-2V10a2 2 0 0 0-2-2Z"/>
        <path d="M4 18H2V4a2 2 0 0 1 2-2h14v2H4Z"/>
      </svg>
    </button>
  </div>

  <button
    type="button"
    class="cds--btn cds--snippet-btn--expand"
    aria-expanded="false">
    <span class="cds--snippet-btn--text">Show more</span>
    <!-- @carbon/icons ChevronDown 16 -->
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" class="cds--icon-chevron--down" aria-hidden="true">
      <path d="M8 11L3 6l.7-.7L8 9.6l4.3-4.3.7.7z"/>
    </svg>
  </button>
</div>
```

**Variant: Multi-line (expanded — toggles `cds--snippet--expand`)**

```html
<div class="cds--snippet cds--snippet--multi cds--snippet--expand">
  <div role="textbox" tabindex="0" aria-label="Multi-line code snippet" class="cds--snippet-container">
    <pre><code>...full content...</code></pre>
  </div>

  <div class="cds--popover-container cds--copy-btn"> ... copy button ... </div>

  <button type="button" class="cds--btn cds--snippet-btn--expand" aria-expanded="true">
    <span class="cds--snippet-btn--text">Show less</span>
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" class="cds--icon-chevron--down" aria-hidden="true" style="transform: rotate(180deg);">
      <path d="M8 11L3 6l.7-.7L8 9.6l4.3-4.3.7.7z"/>
    </svg>
  </button>
</div>
```

**Variant: Multi-line (wrap text)** — adds `cds--snippet--wraptext`:

```html
<div class="cds--snippet cds--snippet--multi cds--snippet--wraptext">
  <div role="textbox" tabindex="0" class="cds--snippet-container">
    <pre>... long content with no trailing horizontal scroll ...</pre>
  </div>
  <!-- copy + expand buttons as above -->
</div>
```

**Variant: Disabled** (any type — adds `cds--snippet--disabled`):

```html
<div class="cds--snippet cds--snippet--single cds--snippet--disabled" aria-disabled="true">
  <div class="cds--snippet-container">
    <pre>node -v</pre>
  </div>
  <div class="cds--popover-container cds--copy-btn">
    <button type="button" class="cds--copy cds--copy-btn" disabled aria-label="Copy to clipboard">
      <svg class="cds--snippet__icon" aria-hidden="true">...</svg>
    </button>
  </div>
</div>
```

**Variant: Skeleton** (single + multi)

```html
<div class="cds--snippet cds--snippet--single cds--skeleton">
  <div class="cds--snippet-container">
    <span></span>
  </div>
</div>

<div class="cds--snippet cds--snippet--multi cds--skeleton">
  <div class="cds--snippet-container">
    <span></span>
    <span></span>
    <span></span>
  </div>
</div>
```

## Component CSS (verbatim from `_code-snippet.scss`)

> Full content of `packages/styles/scss/components/code-snippet/_code-snippet.scss` (Carbon `main`). Token vars (`$layer`, `$focus`, `$spacing-*`, `$duration-*`) resolve to the `--cds-*` literals catalogued in `## Design Tokens` below. Reproduced verbatim under Apache 2.0.

```scss
//
// Copyright IBM Corp. 2016, 2023
//
// This source code is licensed under the Apache-2.0 license found in the
// LICENSE file in the root directory of this source tree.
//

@use 'mixins' as *;
@use '../copy-button';
@use '../../config' as *;
@use '../../motion' as *;
@use '../../spacing' as *;
@use '../../theme' as *;
@use '../../type' as *;
@use '../../layer' as *;
@use '../../utilities/convert';
@use '../../utilities/focus-outline' as *;
@use '../../utilities/high-contrast-mode' as *;
@use '../../utilities/keyframes' as *;
@use '../../utilities/layout' as *;
@use '../../utilities/skeleton' as *;
@use '../../utilities/tooltip' as *;
@use '../../utilities/z-index' as *;

/// @type Color
/// @access public
/// @group copy-button
$copy-active: $layer-active !default;

/// @type Color
/// @access public
/// @group copy-button
$copy-btn-feedback: $background-inverse !default;

@mixin code-snippet {
  .#{$prefix}--snippet {
    @include reset;
  }

  .#{$prefix}--snippet--disabled,
  .#{$prefix}--snippet--disabled
    .#{$prefix}--btn.#{$prefix}--snippet-btn--expand {
    background-color: $layer;
    color: $text-disabled;
  }

  .#{$prefix}--snippet--disabled .#{$prefix}--snippet-btn--expand:hover,
  .#{$prefix}--snippet--disabled .#{$prefix}--copy-btn,
  .#{$prefix}--snippet--disabled .#{$prefix}--copy-btn:hover {
    background-color: $layer;
    color: $text-disabled;
    cursor: not-allowed;
  }

  .#{$prefix}--snippet--disabled .#{$prefix}--snippet__icon,
  .#{$prefix}--snippet--disabled
    .#{$prefix}--snippet-btn--expand
    .#{$prefix}--icon-chevron--down {
    fill: $icon-disabled;
  }

  .#{$prefix}--snippet code {
    @include type-style('code-01');
  }

  // Inline Code Snippet
  .#{$prefix}--snippet--inline {
    @include reset;

    position: relative;
    display: inline;
    padding: 0;
    border: 1px solid transparent;
    border-radius: 4px;
    background-color: $layer;
    color: $text-primary;
    cursor: pointer;

    &:hover {
      background-color: $layer-hover;
    }

    &:active {
      background-color: $layer-active;
    }

    &:focus {
      border: 1px solid $focus;
      outline: none;
    }

    &::before {
      @include tooltip--caret;

      display: none;

      border: none;
    }

    .#{$prefix}--copy-btn__feedback {
      @include tooltip--content('icon');

      display: none;
      overflow: visible;
      box-sizing: content-box;
      margin: auto;
      clip: auto;
    }
  }

  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating::before,
  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating
    .#{$prefix}--copy-btn__feedback {
    display: block;
  }

  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating.#{$prefix}--copy-btn--fade-out::before,
  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating.#{$prefix}--copy-btn--fade-out
    .#{$prefix}--copy-btn__feedback {
    animation: $duration-fast-02 motion(standard, productive) #{$prefix}--hide-feedback;
  }

  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating.#{$prefix}--copy-btn--fade-in::before,
  .#{$prefix}--snippet--inline.#{$prefix}--copy-btn--animating.#{$prefix}--copy-btn--fade-in
    .#{$prefix}--copy-btn__feedback {
    animation: $duration-fast-02 motion(standard, productive) #{$prefix}--show-feedback;
  }

  .#{$prefix}--snippet--inline code {
    padding: 0 $spacing-03;
  }

  .#{$prefix}--snippet--inline.#{$prefix}--snippet--no-copy {
    display: inline-block;

    &:hover {
      background-color: $layer;
      cursor: auto;
    }
  }

  .#{$prefix}--snippet--light.#{$prefix}--snippet--inline.#{$prefix}--snippet--no-copy:hover {
    background-color: $layer-hover;
    cursor: auto;
  }

  // Single Line Snippet
  .#{$prefix}--snippet--single {
    @include bx--snippet;

    display: flex;
    align-items: center;
    block-size: $spacing-08;
    padding-inline-end: $spacing-08;
  }

  .#{$prefix}--snippet--single.#{$prefix}--snippet--no-copy {
    padding: 0;

    &::after {
      inset-inline-end: $spacing-05;
    }
  }

  .#{$prefix}--snippet--single .#{$prefix}--snippet-container {
    position: relative;
    display: flex;
    align-items: center;
    block-size: 100%;
    overflow-x: auto;
    padding-inline-start: $spacing-05;

    &:focus {
      @include focus-outline('outline');
    }
  }

  .#{$prefix}--snippet--single pre {
    @include type-style('code-01');

    padding-inline-end: $spacing-07;
  }

  // Preserve whitespace, but don't allow wrapping for inline and single
  .#{$prefix}--snippet--single pre,
  .#{$prefix}--snippet--inline code {
    white-space: pre;
  }

  // Multi Line Snippet
  .#{$prefix}--snippet--multi {
    @include bx--snippet;

    display: flex;
    padding: $spacing-05;
  }

  //collapsed snippet container
  .#{$prefix}--snippet--multi .#{$prefix}--snippet-container {
    position: relative;
    order: 1;
    max-block-size: 100%;
    min-block-size: 100%;
    overflow-y: auto;
    transition: max-height $duration-moderate-01 motion(standard, productive);

    &:focus {
      @include focus-outline('outline');

      outline-offset: 0;
    }
  }

  // expanded snippet container
  .#{$prefix}--snippet--multi.#{$prefix}--snippet--expand
    .#{$prefix}--snippet-container {
    padding-block-end: $spacing-05;
    transition: max-height $duration-moderate-01 motion(standard, productive);
  }

  .#{$prefix}--snippet--multi.#{$prefix}--snippet--wraptext pre {
    white-space: pre-wrap;
    word-wrap: break-word;
  }

  .#{$prefix}--snippet--multi .#{$prefix}--snippet-container pre {
    overflow: auto;
    padding-block-end: $spacing-06;
    padding-inline-end: $spacing-06;
  }

  .#{$prefix}--snippet--multi.#{$prefix}--snippet--no-copy
    .#{$prefix}--snippet-container
    pre {
    padding-inline-end: 0;
  }

  [dir='rtl']
    .#{$prefix}--snippet--multi.#{$prefix}--snippet--has-right-overflow::after {
    background-image: linear-gradient(to left, transparent, $layer);
  }

  .#{$prefix}--snippet--multi .#{$prefix}--snippet-container pre code {
    overflow: hidden;
  }

  //Copy Button
  .#{$prefix}--snippet__icon {
    block-size: convert.to-rem(16px);
    fill: $icon-primary;
    inline-size: convert.to-rem(16px);
    transition: all $duration-fast-01 motion(standard, productive);
  }

  .#{$prefix}--btn > .#{$prefix}--snippet__icon {
    margin-block-start: 0;
  }

  .#{$prefix}--copy-btn {
    @include reset;

    display: flex;
    overflow: visible;
    align-items: center;
    justify-content: center;
    padding: 0;
    border: none;
    background-color: $layer;
    cursor: pointer;
    outline: none;

    &:focus {
      @include focus-outline('outline');

      outline-color: $focus;
    }
  }

  // TODO: remove copy button styles above
  .#{$prefix}--snippet .#{$prefix}--popover-container {
    @include font-family('sans');

    position: absolute;
    inset-block-start: 0;
    inset-inline-end: 0;
  }

  // Overrides for codesnippet copy btn
  // TLDR: Copy/CopyButton now uses IconButton, which uses Carbon buttons under the hood
  // v10 Copy just used native html button so it didn't have extra carbon styles that needed overriding
  .#{$prefix}--snippet--inline.#{$prefix}--btn {
    block-size: 1.25rem;
    inline-size: initial;
    max-inline-size: unset;
    min-block-size: 1.25rem;
    padding-inline: 0;
  }

  .#{$prefix}--snippet--inline.#{$prefix}--btn.#{$prefix}--btn--primary:hover {
    color: $text-primary;
  }

  // override multi copy btn styles
  .#{$prefix}--snippet.#{$prefix}--snippet--multi
    .#{$prefix}--popover-container {
    inset-block-start: 0.5rem;
    inset-inline-end: 0.5rem;
  }

  .#{$prefix}--snippet--multi .#{$prefix}--copy-btn {
    z-index: 10;
  }

  // Show more / less button
  .#{$prefix}--snippet-btn--expand {
    @include type-style('body-compact-01');
    @include font-family('sans');

    position: absolute;
    z-index: 10;
    display: inline-flex;
    align-items: center;

    padding: $spacing-03 $spacing-05;
    border: 0;
    background-color: $layer;
    block-size: convert.to-rem(32px);
    color: $text-primary;
    inset-block-end: 0;
    inset-inline-end: 0;
  }

  .#{$prefix}--snippet-btn--expand .#{$prefix}--snippet-btn--text {
    position: relative;
    inset-block-start: convert.to-rem(-1px);
  }

  .#{$prefix}--snippet-btn--expand--hide.#{$prefix}--snippet-btn--expand {
    display: none;
  }

  .#{$prefix}--snippet-btn--expand .#{$prefix}--icon-chevron--down {
    fill: $icon-primary;
    margin-inline-start: $spacing-03;
    transform: rotate(0deg);
    transition: $duration-moderate-01 motion(standard, productive);
  }

  .#{$prefix}--snippet-btn--expand:hover {
    background: $layer-hover;
    color: $text-primary;
  }

  .#{$prefix}--snippet-btn--expand:active {
    background-color: $layer-active;
  }

  .#{$prefix}--snippet-btn--expand:focus {
    @include focus-outline('outline');

    border-color: transparent;
  }

  .#{$prefix}--snippet--expand
    .#{$prefix}--snippet-btn--expand
    .#{$prefix}--icon-chevron--down {
    transform: rotate(180deg);
    transition: transform $transition-expansion;
  }

  // Light version
  .#{$prefix}--snippet--light,
  .#{$prefix}--snippet--light .#{$prefix}--snippet-button,
  .#{$prefix}--snippet--light .#{$prefix}--btn.#{$prefix}--snippet-btn--expand,
  .#{$prefix}--snippet--light .#{$prefix}--copy-btn {
    background-color: $layer;
  }

  .#{$prefix}--snippet--light.#{$prefix}--snippet--inline:hover,
  .#{$prefix}--snippet--light .#{$prefix}--snippet-button:hover,
  .#{$prefix}--snippet--light
    .#{$prefix}--btn.#{$prefix}--snippet-btn--expand:hover,
  .#{$prefix}--snippet--light .#{$prefix}--copy-btn:hover {
    background-color: $layer-hover;
  }

  .#{$prefix}--snippet--light.#{$prefix}--snippet--inline:active,
  .#{$prefix}--snippet--light .#{$prefix}--snippet-button:active,
  .#{$prefix}--snippet--light
    .#{$prefix}--btn.#{$prefix}--snippet-btn--expand:active,
  .#{$prefix}--snippet--light .#{$prefix}--copy-btn:active {
    background-color: $layer-active;
  }

  // Skeleton State
  .#{$prefix}--snippet.#{$prefix}--skeleton .#{$prefix}--snippet-container {
    block-size: 100%;
    inline-size: 100%;
  }

  .#{$prefix}--snippet-button .#{$prefix}--btn--copy__feedback {
    // (The height of button) + (The height of the tooltip's triangle) + 4px
    inset-block-start: convert.to-rem(50.8px);
    inset-inline: 50% auto;

    &::before {
      inset-block-start: 0;
    }

    &::after {
      inset-block-start: convert.to-rem(-4px);
    }
  }

  .#{$prefix}--snippet--multi
    .#{$prefix}--snippet-button
    .#{$prefix}--btn--copy__feedback {
    // (The height of button) + (The height of the tooltip's triangle) + 4px
    inset-block-start: convert.to-rem(42.8px);
  }

  .#{$prefix}--snippet--inline .#{$prefix}--btn--copy__feedback {
    // TODO: use updated global tooltip mixins under the hood
    // since all of the positioning values for the copy button tooltip are arbitrary hard coded rem values, we need this arbitrary 4px offset to keep the proper tooltip spacing according to the spec
    inset-block-start: calc(100% - #{convert.to-rem(4px)});
    inset-inline: 50% auto;
  }

  // Using mask-image for single line snippet
  .#{$prefix}--snippet--single .#{$prefix}--snippet-container {
    mask-image: linear-gradient(
      to right,
      #000000 calc(100% - #{$spacing-07}),
      transparent 100%
    );
    pointer-events: auto;
  }

  .#{$prefix}--snippet--multi {
    position: relative;
  }

  .#{$prefix}--snippet--multi .#{$prefix}--snippet-container {
    inline-size: 100%;
    mask-composite: intersect;
    mask-image: linear-gradient(
        to right,
        #000000 calc(100% - #{$spacing-07}),
        transparent 100%
      ),
      linear-gradient(
        to bottom,
        #000000 calc(100% - #{$spacing-05}),
        transparent 100%
      );
    pointer-events: auto;
  }

  [dir='rtl'] .#{$prefix}--snippet--single .#{$prefix}--snippet-container {
    mask-image: linear-gradient(
      to left,
      #000000 calc(100% - #{$spacing-07}),
      transparent 100%
    );
  }

  [dir='rtl'] .#{$prefix}--snippet--multi .#{$prefix}--snippet-container {
    mask-image: linear-gradient(
        to left,
        #000000 calc(100% - #{$spacing-07}),
        transparent 100%
      ),
      linear-gradient(
        to bottom,
        #000000 calc(100% - #{$spacing-05}),
        transparent 100%
      );
  }

  .#{$prefix}--snippet--single:focus-within .#{$prefix}--snippet-container,
  .#{$prefix}--snippet--multi:focus-within .#{$prefix}--snippet-container {
    mask-image: none;
  }

  .#{$prefix}--snippet--multi.#{$prefix}--skeleton {
    block-size: convert.to-rem(98px);
  }

  .#{$prefix}--snippet--single.#{$prefix}--skeleton {
    block-size: convert.to-rem(56px);
  }

  .#{$prefix}--snippet.#{$prefix}--skeleton span {
    @include skeleton;

    display: block;
    block-size: 1rem;
    inline-size: 100%;
    margin-block-start: 0.5rem;

    &:first-child {
      margin: 0;
    }

    &:nth-child(2) {
      inline-size: 85%;
    }

    &:nth-child(3) {
      inline-size: 95%;
    }
  }

  .#{$prefix}--snippet--single.#{$prefix}--skeleton
    .#{$prefix}--snippet-container {
    padding-block-end: 0;
  }

  // Windows HCM fix
  .#{$prefix}--snippet--inline:focus {
    @include high-contrast-mode('focus');
  }

  .#{$prefix}--snippet--single,
  .#{$prefix}--snippet--multi {
    @include high-contrast-mode('outline');
  }
}
```

## Design Tokens (component-scoped)

Resolved hex values cross-referenced from `references/ibm/overview.md` (`[data-theme="white"]`, `[data-theme="g10"]`, `[data-theme="g90"]` and `[data-theme="g100"]` blocks). All values literal — do not substitute generic colors.

```css
/* ── Light: White (default) ─────────────────────────────────── */
[data-theme="white"] {
  /* Snippet body */
  --cds-layer: #f4f4f4;          /* layer-01 */
  --cds-layer-hover: #e8e8e8;    /* layer-hover-01 */
  --cds-layer-active: #c6c6c6;   /* layer-active-01 */

  /* Text + icon */
  --cds-text-primary: #161616;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-primary: #161616;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  /* Focus border / outline */
  --cds-focus: #0f62fe;

  /* Copy feedback tooltip */
  --cds-background-inverse: #393939;
  --cds-text-inverse: #ffffff;

  /* Skeleton shimmer */
  --cds-skeleton-background: #e8e8e8;
  --cds-skeleton-element: #c6c6c6;
}

/* ── Light: G10 (alternate light, inverts White's layer relationship) ─ */
[data-theme="g10"] {
  --cds-layer: #ffffff;          /* layer-01 in G10 */
  --cds-layer-hover: #e8e8e8;
  --cds-layer-active: #c6c6c6;

  --cds-text-primary: #161616;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-primary: #161616;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);

  --cds-focus: #0f62fe;

  --cds-background-inverse: #393939;
  --cds-text-inverse: #ffffff;

  --cds-skeleton-background: #e8e8e8;
  --cds-skeleton-element: #c6c6c6;
}

/* ── Dark: G90 (alternate dark, mid-grey) ───────────────────── */
[data-theme="g90"] {
  --cds-layer: #393939;          /* layer-01 in G90 */
  --cds-layer-hover: #4c4c4c;
  --cds-layer-active: #6f6f6f;

  --cds-text-primary: #f4f4f4;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-focus: #ffffff;

  --cds-background-inverse: #f4f4f4;
  --cds-text-inverse: #161616;

  --cds-skeleton-background: #333333;
  --cds-skeleton-element: #525252;
}

/* ── Dark: G100 (canonical dark; mirrors `.dark` class) ─────── */
[data-theme="g100"],
.dark {
  --cds-layer: #262626;          /* layer-01 in G100 */
  --cds-layer-hover: #333333;    /* layer-hover-01 */
  --cds-layer-active: #525252;   /* layer-active-01 */

  --cds-text-primary: #f4f4f4;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-primary: #f4f4f4;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);

  --cds-focus: #ffffff;

  --cds-background-inverse: #f4f4f4;
  --cds-text-inverse: #161616;

  --cds-skeleton-background: #292929;
  --cds-skeleton-element: #393939;
}

/* ── Layer-tier promotion when nested in `cds-layer` ──────────
   Inline / Single / Multi snippets ALL paint with `var(--cds-layer)`,
   which in Carbon means: at the page root → layer-01; nested once in
   <cds-layer> → layer-02; nested again → layer-03. That is the
   "slightly darker (or lighter)" effect when one snippet sits inside
   another tonal surface. Carbon is FLAT — no shadows, just layer tiers.
*/

/* ── Sharp by default — only inline gets a 4px radius for its focus border ─ */
.cds--snippet--single,
.cds--snippet--multi,
cds-code-snippet[type="single"]::part(snippet),
cds-code-snippet[type="multi"]::part(snippet) {
  border-radius: 0;
}
.cds--snippet--inline,
cds-code-snippet[type="inline"]::part(snippet) {
  border-radius: 4px; /* sole exception in this component */
}

/* ── Spacing tokens used by this component ─────────────────── */
:root {
  --cds-spacing-03: 0.5rem;   /*   8px — inline code padding-x; expand-btn padding-y; chevron margin-start */
  --cds-spacing-05: 1rem;     /*  16px — single container padding-start; multi host padding; expand-btn padding-x; copy-btn offset */
  --cds-spacing-06: 1.5rem;   /*  24px — multi pre padding-block-end + padding-inline-end */
  --cds-spacing-07: 2rem;     /*  32px — single pre padding-end; mask gradient stop */
  --cds-spacing-08: 2.5rem;   /*  40px — single host block-size + padding-inline-end */
}

/* ── Typography (always IBM Plex Mono for code) ────────────── */
:root {
  --cds-font-mono: 'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', 'Courier New', monospace;
  --cds-font-sans: 'IBM Plex Sans', 'Helvetica Neue', Arial, sans-serif;
}

.cds--snippet code,
.cds--snippet pre {
  /* code-01: 12px / 16px / 0.32px / 400 */
  font-family: var(--cds-font-mono);
  font-size: 0.75rem;
  font-weight: 400;
  line-height: 1.33333;
  letter-spacing: 0.32px;
}

.cds--snippet-btn--expand {
  /* body-compact-01: 14px / 18px / 0.16px / 400, sans */
  font-family: var(--cds-font-sans);
  font-size: 0.875rem;
  font-weight: 400;
  line-height: 1.28572;
  letter-spacing: 0.16px;
}

/* ── Motion durations + easings ────────────────────────────── */
:root {
  --cds-duration-fast-01: 70ms;     /* icon transition */
  --cds-duration-fast-02: 110ms;    /* inline copy feedback fade-in / fade-out */
  --cds-duration-moderate-01: 150ms;/* multi expand max-height + chevron rotate */
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
}
```

> Carbon supports two parallel selector strategies (matches the convention in `references/ibm/overview.md`): `[data-theme="..."]` for explicit per-region theming and `.dark` on `<html>` for class-toggle dark mode. Both blocks above must exist so either strategy works.

## States Reference (from `_code-snippet.scss` + token map)

> White-theme literals shown by default; G100 shown in parentheses when it differs. All values resolved from the token block above and the verbatim SCSS.

### Inline

| State | Background | Text | Border | Notes |
|---|---|---|---|---|
| Rest | `#f4f4f4` (G100 `#262626`) | `#161616` (G100 `#f4f4f4`) | `1px solid transparent` | `border-radius: 4px`, `cursor: pointer`, `display: inline` |
| Hover | `#e8e8e8` (G100 `#333333`) | unchanged | unchanged | |
| Active | `#c6c6c6` (G100 `#525252`) | unchanged | unchanged | |
| Focus | unchanged | unchanged | `1px solid #0f62fe` (G100 `#ffffff`); `outline: none` | Inline uses **border** (not outline) for focus |
| Disabled | `#f4f4f4` (G100 `#262626`) | `rgba(22,22,22,.25)` (G100 `rgba(244,244,244,.25)`) | unchanged | `cursor: not-allowed` |
| No-copy hover | reverts to rest `#f4f4f4` (light theme also stays rest) | unchanged | unchanged | `cursor: auto` (not pointer) |
| Copy feedback fade-in | adds `cds--copy-btn--animating cds--copy-btn--fade-in`; tooltip + caret `display: block`; `animation: 110ms productive-standard cds--show-feedback;` | | | tooltip bg `#393939`, fg `#ffffff` |
| Copy feedback fade-out | adds `cds--copy-btn--animating cds--copy-btn--fade-out`; `animation: 110ms productive-standard cds--hide-feedback;` | | | |

### Single-line

| State | Background | Text | Outline / Border | Notes |
|---|---|---|---|---|
| Rest | `#f4f4f4` (G100 `#262626`) | `#161616` (G100 `#f4f4f4`) | none | `block-size: 40px`; `padding-inline-end: 40px`; right-edge mask 32px fade |
| Container hover (no native rule — handled by the inline copy button) | unchanged | unchanged | unchanged | |
| Container `:focus` | unchanged | unchanged | `outline: 2px solid #0f62fe; outline-offset: -2px` (G100 outline `#ffffff`) | mask is removed via `:focus-within` |
| Copy button rest | `#f4f4f4` (G100 `#262626`) | icon `#161616` (G100 `#f4f4f4`) | none | `display: flex; align-items: center; justify-content: center` |
| Copy button hover | `#e8e8e8` (G100 `#333333`) | unchanged | unchanged | |
| Copy button active | `#c6c6c6` (G100 `#525252`) | unchanged | unchanged | |
| Copy button focus | unchanged | unchanged | `outline: 2px solid #0f62fe` (G100 `#ffffff`); `outline-color: $focus` | |
| Copy feedback | tooltip absolute below button; bg `#393939`, fg `#ffffff` | | | `inset-block-start: calc(50.8px)` (single) per SCSS |
| Disabled | `#f4f4f4` (G100 `#262626`) | `rgba(22,22,22,.25)` (G100 `rgba(244,244,244,.25)`) | none | icon fill → `--cds-icon-disabled`; `cursor: not-allowed` |

### Multi-line

| State | Background | Text | Outline / Border | Notes |
|---|---|---|---|---|
| Rest (collapsed) | `#f4f4f4` (G100 `#262626`) | `#161616` (G100 `#f4f4f4`) | none | `padding: 16px`; pre `padding-block-end: 24px`, `padding-inline-end: 24px`; `max-block-size` capped to `maxCollapsedNumberOfRows`; right + bottom composited mask |
| Rest (expanded — `.cds--snippet--expand`) | unchanged | unchanged | unchanged | container `padding-block-end: 16px`; `transition: max-height 150ms productive-standard`; chevron `transform: rotate(180deg)` |
| Wrap text — `.cds--snippet--wraptext` | unchanged | unchanged | unchanged | `pre { white-space: pre-wrap; word-wrap: break-word; }` |
| Container `:focus` | unchanged | unchanged | `outline: 2px solid #0f62fe; outline-offset: 0` (G100 outline `#ffffff`) | mask removed via `:focus-within` |
| Copy button rest | `#f4f4f4` (G100 `#262626`) | icon `#161616` (G100 `#f4f4f4`) | none | offset `top: 8px; right: 8px`; `z-index: 10` |
| Copy button hover | `#e8e8e8` (G100 `#333333`) | unchanged | unchanged | |
| Copy button active | `#c6c6c6` (G100 `#525252`) | unchanged | unchanged | |
| Copy button focus | unchanged | unchanged | `outline: 2px solid #0f62fe` (G100 `#ffffff`) | |
| Copy feedback | tooltip absolute below button; bg `#393939`, fg `#ffffff` | | | `inset-block-start: calc(42.8px)` (multi) per SCSS |
| Show more / Show less rest | `#f4f4f4` (G100 `#262626`) | `#161616` (G100 `#f4f4f4`) | none | `position: absolute; bottom: 0; right: 0; height: 32px; padding: 8px 16px; z-index: 10` |
| Show more / Show less hover | `#e8e8e8` (G100 `#333333`) | unchanged | unchanged | |
| Show more / Show less active | `#c6c6c6` (G100 `#525252`) | unchanged | unchanged | |
| Show more / Show less focus | unchanged | unchanged | `outline: 2px solid #0f62fe` (G100 `#ffffff`); `border-color: transparent` | |
| Disabled | `#f4f4f4` (G100 `#262626`) | `rgba(22,22,22,.25)` (G100 `rgba(244,244,244,.25)`) | none | icon + chevron fill → `--cds-icon-disabled`; `cursor: not-allowed`; expand button shares same disabled bg |

### Skeleton

| Property | Value |
|---|---|
| Single skeleton block-size | `56px` |
| Multi skeleton block-size | `98px` |
| Skeleton bar height | `1rem` (`16px`); first child `margin: 0`, subsequent `margin-block-start: 0.5rem` |
| Bar widths | first `100%`, second `85%`, third `95%` |
| Bar colors | bg `--cds-skeleton-background`, shimmer element `--cds-skeleton-element` |
| Shimmer animation | shared `@keyframes skeleton` via `@include skeleton` (Carbon utility) — typically `3000ms ease-in-out` infinite per Carbon's skeleton mixin |

## Animation & Motion

Carbon's CodeSnippet uses **three motion values**, all paired with `productive-standard` easing:

```css
/* 70ms — copy icon micro-transition (color/fill tweens on hover/focus) */
.cds--snippet__icon {
  transition: all var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* 110ms — inline-snippet copy feedback fade-in / fade-out */
.cds--snippet--inline.cds--copy-btn--animating.cds--copy-btn--fade-in::before,
.cds--snippet--inline.cds--copy-btn--animating.cds--copy-btn--fade-in
  .cds--copy-btn__feedback {
  animation: var(--cds-duration-fast-02) var(--cds-easing-productive-standard) cds--show-feedback;
}
.cds--snippet--inline.cds--copy-btn--animating.cds--copy-btn--fade-out::before,
.cds--snippet--inline.cds--copy-btn--animating.cds--copy-btn--fade-out
  .cds--copy-btn__feedback {
  animation: var(--cds-duration-fast-02) var(--cds-easing-productive-standard) cds--hide-feedback;
}

/* 150ms — multi-line max-height expand / collapse + chevron rotate */
.cds--snippet--multi .cds--snippet-container {
  transition: max-height var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);
}
.cds--snippet--multi.cds--snippet--expand .cds--snippet-container {
  transition: max-height var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);
}
.cds--snippet-btn--expand .cds--icon-chevron--down {
  transform: rotate(0deg);
  transition: var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);
}
.cds--snippet--expand .cds--snippet-btn--expand .cds--icon-chevron--down {
  transform: rotate(180deg);
  transition: transform var(--cds-transition-expansion);
}

/* Carbon-defined keyframes for inline copy feedback */
@keyframes cds--show-feedback {
  0%   { opacity: 0; }
  100% { opacity: 1; }
}
@keyframes cds--hide-feedback {
  0%   { opacity: 1; }
  100% { opacity: 0; }
}

/* Skeleton shimmer (shared @include skeleton mixin output) */
@keyframes skeleton {
  0%   { opacity: 0.3; }
  20%  { opacity: 1; transform: scaleX(1); }
  100% { transform: scaleX(0); }
}
.cds--snippet.cds--skeleton span {
  animation: 3000ms ease-in-out skeleton 1000ms infinite;
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  .cds--snippet__icon,
  .cds--snippet--multi .cds--snippet-container,
  .cds--snippet--multi.cds--snippet--expand .cds--snippet-container,
  .cds--snippet-btn--expand .cds--icon-chevron--down,
  .cds--snippet--inline .cds--copy-btn__feedback {
    transition: none;
    animation: none;
  }
}
```

Resolved token values: `--cds-duration-fast-01: 70ms`, `--cds-duration-fast-02: 110ms`, `--cds-duration-moderate-01: 150ms`, `--cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9)`.

## Accessibility (from Carbon's docs + source)

- **Semantic roles:** Inline → `<button>` (the entire pill is the click target). Single / Multi container → `role="textbox"` + `tabindex="0"` so screen readers announce the code as editable text content (Carbon's choice; users can copy-select). Copy button → native `<button>`. Show more / Show less → native `<button>` with `aria-expanded`.
- **`aria-label` (required):**
  - Inline: `aria-label` reflects the code being copied (e.g., `node -v`).
  - Copy button: defaults to the value of the `copyButtonDescription` (WC) / `copyButtonDescription` prop (React) — `"Copy to clipboard"`. Always provided, even though there's no visible button text.
  - Multi-line container: provide `aria-label="Multi-line code snippet"` (or describe the language/purpose) since the `<pre>` content can be very long.
- **`aria-expanded`:** Bound to the `cds--snippet--expand` toggle — `false` collapsed, `true` expanded. Carbon swaps the visible text between `showMoreText` and `showLessText`.
- **`aria-disabled`:** Set on the host (and the `disabled` attribute on the underlying buttons) when `disabled` prop is `true`. Buttons remain in tab order so screen readers announce the disabled state.
- **Keyboard:**
  - `Tab` / `Shift+Tab` traverse: container → copy button → expand button (multi only).
  - `Enter` / `Space` on inline snippet copies. `Enter` / `Space` on the copy button copies. `Enter` / `Space` on the Show more / Show less button toggles expansion.
  - When the container has focus, the right + bottom mask gradient is removed (`:focus-within { mask-image: none; }`) so the visible content matches the visible scroll region — important for a11y per Carbon's rationale comment.
- **Focus indicator:** Inline uses a `1px` border in `--cds-focus`. Single + Multi use the global `focus-outline('outline')` mixin → `outline: 2px solid var(--cds-focus); outline-offset: -2px;` (single) / `outline-offset: 0` (multi container). Never override with `outline: none`.
- **Copy feedback:** The visible `feedback` text (`"Copied to clipboard"` by default) is rendered into a tooltip and announced through Carbon's tooltip live region; `feedbackTimeout` (default `2000ms` in React; `0` = no auto-dismiss) controls dismissal.
- **High-contrast mode (Windows HCM):** Inline focus uses `@include high-contrast-mode('focus')`; single + multi use `@include high-contrast-mode('outline')`. These map to `Highlight` / `CanvasText` system colors for forced-colors mode.
- **Touch target:** The copy and expand buttons are `32px` square — meets Carbon's productive minimum but below WCAG 2.5.5 (44px). On mobile, wrap the snippet in a container with `min-height: 44px` for the touch target, or use the inline variant which is read-only-text-style.
- **Reduced motion:** The expand transition (150ms) and inline copy feedback animation (110ms) MUST be disabled under `prefers-reduced-motion: reduce` (see motion block above).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS — `<CodeSnippet type="inline / single / multi">` (React) or `<cds-code-snippet type="...">` (WC) | Don't paraphrase the source, invent props, or "clean up" the verbatim story code |
| Use **inline** for code embedded in prose (`node -v`, `ls -la`) | Don't use inline for multi-token examples that need their own block — use single or multi |
| Use **single** for one-line shell/install commands shown as a standalone block | Don't use single when the line will inevitably wrap on common widths — use multi with `wrapText` |
| Use **multi** for code blocks > 1 line; keep `maxCollapsedNumberOfRows={15}` (default) for the Show more affordance | Don't omit the Show more button for very long content — let users collapse |
| Set `feedback="Copied to clipboard"` (Carbon's canonical string) on every variant | Don't ship without `feedback` — users get no confirmation that the click did anything |
| Always paint with `var(--cds-layer)` so layer-tier nesting auto-promotes inside `<cds-layer>` | Don't hard-code `#f4f4f4` / `#262626` — you'll break layer-02 / layer-03 nesting |
| Keep the inline `border-radius: 4px` and the single / multi `border-radius: 0` (Carbon is sharp) | Don't apply the 4px radius to single or multi variants |
| Render code with `IBM Plex Mono` (`code-01` → 12px or `code-02` → 14px) | Don't use proportional fonts (Plex Sans, Helvetica) for the `<code>` / `<pre>` content |
| Provide `aria-label` on the inline pill and the copy button | Don't ship icon-only copy buttons without an SR label |
| Honor `prefers-reduced-motion: reduce` for the 150ms expand and 110ms feedback fade | Don't leave the max-height transition or feedback animation always-on |
| Use `[data-theme="white"]` (or `.dark` / `[data-theme="g100"]`) at a parent so the layer + focus tokens resolve | Don't define your own theme classes that bypass Carbon's token map |
| Position the Show more / Show less button bottom-right (`inset-block-end: 0; inset-inline-end: 0`) | Don't move it to bottom-left or center — Carbon's contract is bottom-right |
| Keep the right-edge fade `mask-image` on single + bottom-right composite mask on multi to hint at overflow | Don't remove the mask — it's the only signal that more content exists |
| Disable the mask on `:focus-within` so keyboard users see complete content | Don't keep the mask on focus — you're hiding content from users who need it |
| Use `wrapText` only on multi (single intentionally never wraps) | Don't apply `cds--snippet--wraptext` to single — it does nothing and is non-spec |
