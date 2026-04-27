---
name: text-input
description: Carbon TextInput — single-line input with bottom-border-only treatment. Variants from Storybook — Default, Inline, Fluid, ReadOnly, Skeleton, WithLayer, withAILabel, plus PasswordInput (Default) and a TestInvalidTextNoOverlap regression story. WC also exports WithAILabel and WithLayer.
metadata:
  tags: text-input, input, form, password, fluid, read-only, skeleton, ibm, carbon, react, web-components
---

# Text Input -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`TextInput.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TextInput/TextInput.stories.js)
> - **React story (PasswordInput):** [`PasswordInput.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TextInput/PasswordInput.stories.js)
> - **WC story:** [`text-input.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/text-input/text-input.stories.ts)
> - **WC SCSS:** [`text-input.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/text-input/text-input.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-textinput--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-text-input--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/text-input/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg) | `32px` / `40px` / `48px` |
| Heights (xs — Fluid only) | `24px` |
| Padding-inline (lg / md) | `0 16px` (`spacing-05`) |
| Padding-inline (sm) | `0 12px` (`spacing-04`) |
| Padding-inline-end (with password toggle) | `40px` (`spacing-08`) |
| Padding-inline-end (with warn or invalid icon) | `64px` (`spacing-10`) when also decorated, otherwise icon at `spacing-05` |
| AI-label / decorator slot offset | `inset-inline-end: 16px` (`spacing-05`); `transform: translateY(-50%)` |
| Corner radius | `0` (Carbon: sharp by default — no rounding on input) |
| Border treatment | **Bottom-only**: `border-block-end: 1px solid var(--cds-border-strong-01)` — no top/left/right border on rest |
| Background (White theme, `field-01`) | `#f4f4f4` |
| Background (G100 theme, `field-01`) | `#262626` |
| Border-strong-01 (White) | `#8d8d8d` |
| Border-strong-01 (G100) | `#6f6f6f` |
| Focus ring | Bottom border becomes `2px solid var(--cds-focus)` plus `outline: 2px solid var(--cds-focus); outline-offset: -2px` |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes) |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Placeholder color | `var(--cds-text-placeholder)` — White: `#a8a8a8`, G100: `#6f6f6f` |
| Label position | Above input as separate `<label>` element (NOT floating). Fluid variant relocates label INSIDE the field area. |
| Font | IBM Plex Sans, body-compact-01 (input value & label), helper-text-01 (helper / invalid / warn) |
| React import | `import { TextInput, TextInputSkeleton } from '@carbon/react';` |
| React import (password) | `import { PasswordInput } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/text-input/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `TextInput.stories.js` | Standard text input with label + helper text. |
| Inline | `Inline` | `TextInput.stories.js` | Label sits to the left of the input on the same row. |
| Fluid | `Fluid` | `TextInput.stories.js` | Wrapped in `<FluidForm>`; label moves inside the field, no internal padding above the input. |
| ReadOnly | `ReadOnly` | `TextInput.stories.js` | `readOnly` flag — value visible, input non-editable. |
| WithLayer | `_WithLayer` | `TextInput.stories.js` | Demonstrates `field-01 / 02 / 03` token swap across nested `<Layer>` contexts. |
| withAILabel | `withAILabel` | `TextInput.stories.js` | Embeds an `<AILabel>` decorator with aiAura gradient background. |
| Skeleton | `Skeleton` | `TextInput.stories.js` | `<TextInputSkeleton>` placeholder while content loads. |
| TestInvalidTextNoOverlap | `TestInvalidTextNoOverlap` | `TextInput.stories.js` | Hidden regression story (`tags: ['!dev', '!autodocs']`) — guards against bug #19960 where invalid-text overlapped the next field. |
| PasswordInput / Default | `Default` | `PasswordInput.stories.js` | Convenience wrapper around `TextInput` that exposes the visibility toggle as a dedicated component. |
| WC: Default | `Default` | `text-input.stories.ts` | Renders `<cds-text-input>` with all shared args. |
| WC: Inline | `Inline` | `text-input.stories.ts` | Web Components inline variant. |
| WC: ReadOnly | `ReadOnly` | `text-input.stories.ts` | Web Components readonly variant. |
| WC: Skeleton | `Skeleton` | `text-input.stories.ts` | `<cds-text-input-skeleton>` placeholder. |
| WC: WithAILabel | `WithAILabel` | `text-input.stories.ts` | Slots a `<cds-ai-label>` into the input. |
| WC: WithLayer | `WithLayer` | `text-input.stories.ts` | Demonstrates layer-token swap via `withLayers` decorator. |

The Web Components story also accepts `?show-password-visibility-toggle` as a shared arg (`sharedArgs.showPasswordVisibilityToggle`) on every variant, controlled via the `showPasswordVisibilityToggle` argType.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `TextInput.stories.js` and `PasswordInput.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `TextInput.stories.js`):

```jsx
import React from 'react';
import { WithLayer } from '../../../.storybook/templates/WithLayer';
import FluidForm from '../FluidForm';
import { View, FolderOpen, Folders, Information } from '@carbon/icons-react';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import mdx from './TextInput.mdx';

import { default as TextInput, TextInputSkeleton } from '../TextInput';
```

**Default args** (apply to every story unless overridden):

```jsx
args: {
  className: 'input-test-class',
  id: 'text-input-1',
  placeholder: 'Placeholder text',
  invalid: false,
  invalidText: 'Error message goes here',
  disabled: false,
  labelText: 'Label text',
  helperText: 'Helper text',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
  readOnly: false,
  inline: false,
  hideLabel: false,
  enableCounter: false,
  maxCount: 10,
  type: 'text',
  defaultWidth: 300,
  defaultValue: '',
},
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const { defaultWidth, ...textInputArgs } = args;

  return (
    <div style={{ width: defaultWidth }}>
      <TextInput {...textInputArgs} />
    </div>
  );
};
```

**Variant: Inline**

```jsx
export const Inline = (args) => {
  const { defaultWidth, ...textInputArgs } = args;

  return (
    <div style={{ width: defaultWidth }}>
      <TextInput inline {...textInputArgs} />
    </div>
  );
};

Inline.args = {
  defaultWidth: 450,
  inline: true,
};

Inline.parameters = {
  controls: {
    exclude: ['inline'],
  },
};
```

**Variant: Fluid**

```jsx
export const Fluid = (args) => {
  const { defaultWidth, ...textInputArgs } = args;

  return (
    <div style={{ width: defaultWidth }}>
      <FluidForm>
        <TextInput {...textInputArgs} />
      </FluidForm>
    </div>
  );
};

Fluid.parameters = {
  controls: {
    exclude: ['helperText'],
  },
};
```

**Variant: ReadOnly**

```jsx
export const ReadOnly = (args) => {
  const { defaultWidth, ...textInputArgs } = args;

  return (
    <div style={{ width: defaultWidth }}>
      <TextInput {...textInputArgs} />
    </div>
  );
};

ReadOnly.args = {
  defaultValue: "This is read only, you can't type more.",
  readOnly: true,
};

ReadOnly.parameters = {
  controls: {
    exclude: [
      'readOnly',
      'disabled',
      'invalid',
      'invalidText',
      'warn',
      'warnText',
      'enableCounter',
      'maxCount',
      'value',
    ],
  },
};
```

**Variant: WithLayer**

```jsx
export const _WithLayer = (args) => {
  const { defaultWidth, ...textInputArgs } = args;

  return (
    <WithLayer>
      {(layer) => (
        <div style={{ width: defaultWidth }}>
          <TextInput {...textInputArgs} id={`text-input-${layer}`} />
        </div>
      )}
    </WithLayer>
  );
};
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => {
  const { defaultWidth, ...textInputArgs } = args;
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
    <div style={{ width: defaultWidth }}>
      <TextInput
        {...textInputArgs}
        type="text"
        labelText="Text input label"
        helperText="Optional help text"
        id="text-input-ai-label"
        decorator={aiLabel}
      />
    </div>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = ({ hideLabel, size }) => (
  <TextInputSkeleton hideLabel={hideLabel} size={size} />
);

Skeleton.parameters = {
  controls: {
    include: ['hideLabel', 'size'],
  },
};
```

**Variant: TestInvalidTextNoOverlap** (regression-only; hidden from sidebar via `tags: ['!dev', '!autodocs']`)

```jsx
// Hidden Test-Only Story. This story tests for a bug where the invalid-text would overlap with components below it. #19960
export const TestInvalidTextNoOverlap = (args) => {
  return (
    <div style={{ width: args.defaultWidth }}>
      <TextInput
        labelText="test invalid text, the invalid text should not overlap"
        invalid
        invalidText="invalid text, this should not overlap with the component below"
        id="text-input-1"
        type="text"
      />
      <TextInput labelText="test label" id="text-input-2" type="text" />
    </div>
  );
};

/*
 * This story will:
 * - Be excluded from the docs page
 * - Removed from the sidebar navigation
 * - Still be a tested variant
 */
TestInvalidTextNoOverlap.tags = ['!dev', '!autodocs'];
```

**PasswordInput — imports** (from `PasswordInput.stories.js`):

```jsx
import React from 'react';
import { PasswordInput } from '../PasswordInput';
```

**PasswordInput — Variant: Default** (this IS the toggle-visibility variant)

```jsx
export const Default = ({ defaultWidth, ...passwordInputArgs }) => (
  <div style={{ width: defaultWidth }}>
    <PasswordInput
      {...passwordInputArgs}
      id="text-input-1"
      labelText="Text input label"
      helperText="Optional help text"
      autoComplete="true"
    />
  </div>
);

Default.args = {
  defaultWidth: 300,
  className: 'input-test-class',
  placeholder: 'Placeholder text',
  invalid: false,
  invalidText: 'Error message goes here',
  disabled: false,
  labelText: 'Label text',
  helperText: 'Helper text',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `text-input.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `text-input.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { prefix } from '../../globals/settings';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './index';
import '../form/form-item';
import '../ai-label';
import '../icon-button';
import { INPUT_SIZE } from './text-input';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Shared template** (used by Default / Inline / WithAILabel / WithLayer):

```ts
const renderTextInput = (args: TextInputStoryArgs, children?: unknown) => html`
  <cds-text-input
    ?disabled=${args.disabled}
    ?enable-counter=${args.enableCounter}
    helper-text=${ifDefined(args.helperText)}
    ?hide-label=${args.hideLabel}
    ?inline=${args.inline}
    ?invalid=${args.invalid}
    invalid-text=${ifDefined(args.invalidText)}
    label=${ifDefined(args.labelText)}
    max-count=${ifDefined(args.maxCount)}
    placeholder=${ifDefined(args.placeholder)}
    ?readonly=${args.readonly}
    ?show-password-visibility-toggle=${args.showPasswordVisibilityToggle}
    size=${ifDefined(args.size)}
    type=${ifDefined(args.type)}
    .value=${args.value}
    ?warn=${args.warn}
    warn-text=${ifDefined(args.warnText)}
    @input=${args.onInput}>
    ${children ?? ''}
  </cds-text-input>
`;
```

**AI-label slot helpers** (used by `WithAILabel`):

```ts
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
```

**Variant: Default**

```ts
render: (args: TextInputStoryArgs) => html`
  <div style="width: ${args.defaultWidth}px;">${renderTextInput(args)}</div>
`,
```

**Variant: Inline** (args: `{ ...sharedArgs, defaultWidth: 450, inline: true }`; same `render` body as Default — `renderTextInput(args)` wrapped in the width div)

```ts
render: (args: TextInputStoryArgs) => html`
  <div style="width: ${args.defaultWidth}px;">${renderTextInput(args)}</div>
`,
```

**Variant: ReadOnly** (uses its own inline template, NOT `renderTextInput`)

```html
<div style="width: ${args.defaultWidth}px;">
  <cds-text-input
    readonly
    label=${ifDefined(args.labelText)}
    helper-text=${ifDefined(args.helperText)}
    size=${ifDefined(args.size)}
    ?hide-label=${args.hideLabel}
    .value=${args.value}>
  </cds-text-input>
</div>
```

**Variant: Skeleton**

```html
<cds-text-input-skeleton
  ?hide-label=${hideLabel}
  size="${size}"></cds-text-input-skeleton>
```

**Variant: WithAILabel** (slots `<cds-ai-label>` into the field via `renderTextInput`'s `children` arg)

```ts
render: (args: TextInputStoryArgs) => html`
  <div style=${`width: ${args.defaultWidth}px;`}>
    ${renderTextInput(
      args,
      html`<cds-ai-label alignment="bottom-left"
        >${content}${actions}</cds-ai-label
      >`
    )}
  </div>
`,
```

**Variant: WithLayer** (decorated with `withLayers`; same `renderTextInput(args)` body, conditional width div)

```ts
render: (args: TextInputStoryArgs) => html`
  <div style=${args.defaultWidth ? `width: ${args.defaultWidth}px;` : ''}>
    ${renderTextInput(args)}
  </div>
`,
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?attr=${value}`, `${ifDefined(...)}`, `.value=${...}`) resolved to static attributes using the shared default args. Use this for hand-coded HTML without a component framework. The component itself is still a custom element — you must register `@carbon/web-components/es/components/text-input/index.js` for it to upgrade.

**Variant: Default** (size `md`, width `300px`)

```html
<div style="width: 300px;">
  <cds-text-input
    helper-text="Helper text"
    invalid-text="Error message goes here"
    label="Label text"
    max-count="100"
    placeholder="Placeholder text"
    size="md"
    type="text"
    value="">
  </cds-text-input>
</div>
```

**Variant: Inline** (width `450px`, `inline` flag set)

```html
<div style="width: 450px;">
  <cds-text-input
    inline
    helper-text="Helper text"
    invalid-text="Error message goes here"
    label="Label text"
    max-count="100"
    placeholder="Placeholder text"
    size="md"
    type="text"
    value="">
  </cds-text-input>
</div>
```

**Variant: ReadOnly**

```html
<div style="width: 300px;">
  <cds-text-input
    readonly
    label="Label text"
    helper-text="Helper text"
    size="md"
    value="This is read only, you can't type more.">
  </cds-text-input>
</div>
```

**Variant: Skeleton**

```html
<cds-text-input-skeleton size="md"></cds-text-input-skeleton>
```

**Variant: With password visibility toggle** (the WC equivalent of React's `<PasswordInput>`)

```html
<div style="width: 300px;">
  <cds-text-input
    show-password-visibility-toggle
    type="password"
    label="Password"
    helper-text="At least 8 characters"
    placeholder="Enter your password"
    size="md">
  </cds-text-input>
</div>
```

**Variant: With error**

```html
<div style="width: 300px;">
  <cds-text-input
    invalid
    invalid-text="Error message goes here"
    label="Label text"
    placeholder="Placeholder text"
    size="md"
    type="text">
  </cds-text-input>
</div>
```

**Variant: With warning**

```html
<div style="width: 300px;">
  <cds-text-input
    warn
    warn-text="Warning message that is really long can wrap to more lines but should not be excessively long."
    label="Label text"
    placeholder="Placeholder text"
    size="md"
    type="text">
  </cds-text-input>
</div>
```

**Variant: Disabled**

```html
<div style="width: 300px;">
  <cds-text-input
    disabled
    label="Label text"
    helper-text="Helper text"
    placeholder="Placeholder text"
    size="md"
    type="text">
  </cds-text-input>
</div>
```

## Design Tokens (component-scoped, resolved from overview.md)

The Storybook source uses semantic tokens (`$field-01`, `$border-strong-01`, `$focus`, `$support-error`, `$support-warning`, `$text-helper`, `$text-placeholder`). Below are those tokens resolved to literal hex for the two canonical themes (White and G100).

```css
[data-theme="white"] {
  /* Field background — flat, no top/left/right border */
  --cds-text-input-background:        #f4f4f4; /* field-01 */
  --cds-text-input-background-hover:  #e8e8e8; /* field-hover-01 */

  /* Bottom border (the Carbon-distinctive treatment) */
  --cds-text-input-border-bottom:     #8d8d8d; /* border-strong-01 */
  --cds-text-input-border-bottom-w:   1px;
  --cds-text-input-border-bottom-w-focus: 2px;

  /* Focus ring (outline overlays the input on :focus-visible) */
  --cds-text-input-focus:             #0f62fe; /* focus */
  --cds-text-input-focus-inset:       #ffffff; /* focus-inset */

  /* Text */
  --cds-text-input-color:             #161616; /* text-primary — typed value */
  --cds-text-input-placeholder:       #a8a8a8; /* text-placeholder */
  --cds-text-input-label:             #525252; /* text-secondary — label above input */
  --cds-text-input-helper:            #6f6f6f; /* text-helper — line below input */

  /* Validation states */
  --cds-text-input-error:             #da1e28; /* support-error — bottom border + icon + invalid-text */
  --cds-text-input-warning:           #f1c21b; /* support-warning — icon + warn-text border */

  /* Disabled */
  --cds-text-input-disabled-color:    rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-text-input-disabled-bg:       #f4f4f4;                /* field-01 unchanged */
  --cds-text-input-border-disabled:   #c6c6c6;                /* border-disabled */
}

[data-theme="g100"],
.dark {
  --cds-text-input-background:        #262626; /* field-01 (G100) */
  --cds-text-input-background-hover:  #333333; /* field-hover-01 (G100) */

  --cds-text-input-border-bottom:     #6f6f6f; /* border-strong-01 (G100) */
  --cds-text-input-border-bottom-w:   1px;
  --cds-text-input-border-bottom-w-focus: 2px;

  --cds-text-input-focus:             #ffffff; /* focus inverts on dark */
  --cds-text-input-focus-inset:       #161616; /* focus-inset */

  --cds-text-input-color:             #f4f4f4; /* text-primary (G100) */
  --cds-text-input-placeholder:       #6f6f6f; /* text-placeholder (G100) */
  --cds-text-input-label:             #c6c6c6; /* text-secondary (G100) */
  --cds-text-input-helper:            #c6c6c6; /* text-helper (G100) */

  --cds-text-input-error:             #fa4d56; /* support-error (G100) */
  --cds-text-input-warning:           #f1c21b;

  --cds-text-input-disabled-color:    rgba(244, 244, 244, 0.25);
  --cds-text-input-disabled-bg:       #262626;
  --cds-text-input-border-disabled:   rgba(141, 141, 141, 0.5);
}

/* Sharp corners — Carbon's default. NEVER round a text input. */
.cds--text-input,
cds-text-input {
  border-radius: 0;
}
```

## States Reference (from `text-input.scss` and Carbon styles)

> The shipped `packages/web-components/src/components/text-input/text-input.scss` file is a thin wrapper that `@use`s `@carbon/styles/scss/components/text-input/index` and adds shadow-DOM host rules (decorator slot positioning, password-toggle and warn/invalid icon padding). The state values below resolve those Carbon styles to literal hex per theme.

| State | Background | Text color | Bottom border | Outline | Other |
|---|---|---|---|---|---|
| Rest (White) | `#f4f4f4` (`field-01`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong-01`) | none | placeholder `#a8a8a8` |
| Rest (G100) | `#262626` (`field-01`) | `#f4f4f4` | `1px solid #6f6f6f` | none | placeholder `#6f6f6f` |
| Hover (White) | `#e8e8e8` (`field-hover-01`) | `#161616` | `1px solid #8d8d8d` | none | — |
| Hover (G100) | `#333333` (`field-hover-01`) | `#f4f4f4` | `1px solid #6f6f6f` | none | — |
| Focus-visible (White) | (rest bg) | `#161616` | `2px solid #0f62fe` (`focus`) | `outline: 2px solid #0f62fe; outline-offset: -2px` | inset focus ring `0 0 0 2px #ffffff` |
| Focus-visible (G100) | (rest bg) | `#f4f4f4` | `2px solid #ffffff` (`focus`) | `outline: 2px solid #ffffff; outline-offset: -2px` | inset focus ring `0 0 0 2px #161616` |
| Active / typing | (focus bg) | `text-primary` | (focus border) | (focus outline) | caret `text-primary` color |
| Invalid (White) | `#f4f4f4` | `#161616` | `2px solid #da1e28` (`support-error`) | none on rest; focus shows blue outline | error icon `#da1e28` at `inset-inline-end: 16px`; invalid-text `#da1e28` (`text-error`) below input |
| Invalid (G100) | `#262626` | `#f4f4f4` | `2px solid #fa4d56` | — | error icon `#fa4d56`; invalid-text `#ff8389` (`text-error`) |
| Warn (White) | `#f4f4f4` | `#161616` | `1px solid #8d8d8d` | none | warning triangle icon `#f1c21b` at `inset-inline-end: 16px`; warn-text `#525252` (`text-secondary`) |
| Warn (G100) | `#262626` | `#f4f4f4` | `1px solid #6f6f6f` | — | warning icon `#f1c21b`; warn-text `#c6c6c6` |
| Read-only (White) | transparent / inherits page | `#161616` | `1px solid transparent` (border hidden, label/value still visible) | none | `cursor: default`; user-select allowed |
| Read-only (G100) | transparent | `#f4f4f4` | `1px solid transparent` | — | — |
| Disabled (White) | `#f4f4f4` (unchanged) | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | `1px solid #c6c6c6` (`border-disabled`) | none | `cursor: not-allowed`; placeholder color matches text-disabled |
| Disabled (G100) | `#262626` (unchanged) | `rgba(244, 244, 244, 0.25)` | `1px solid rgba(141, 141, 141, 0.5)` | — | `cursor: not-allowed` |
| Skeleton | `#e5e5e5` shimmer (White) / `#353535` (G100) | n/a | none | none | `@keyframes skeleton` 3s `cubic-bezier(.4, .14, .3, 1)` infinite |

### Padding rules (verbatim from `text-input.scss`)

```scss
:host(#{$prefix}-text-input[show-password-visibility-toggle])
  .#{$prefix}--text-input {
  padding-inline-end: $spacing-08; /* 40px — leave room for the eye-icon button */
}

:host(#{$prefix}-text-input[show-password-visibility-toggle])
  .#{$prefix}--text-input__invalid-icon {
  inset-inline-end: $spacing-08; /* 40px — push invalid icon left of the toggle */
}

:host(#{$prefix}-text-input[warn]),
:host(#{$prefix}-text-input[invalid]) {
  .#{$prefix}--text-input__field-wrapper--decorator {
    .#{$prefix}--text-input {
      padding-inline-end: $spacing-10; /* 64px — when both validation + decorator slot are present */
    }
  }
}

:host(#{$prefix}-text-input[ai-label]) {
  .#{$prefix}--text-input {
    @include ai-gradient;            /* aiAura background gradient */
    padding-inline-end: $spacing-08; /* 40px — leave room for AI label */
  }
}

:host(#{$prefix}-text-input) {
  ::slotted(#{$prefix}-ai-label),
  ::slotted(#{$prefix}-slug) {
    position: absolute;
    inset-block-start: 50%;
    inset-inline-end: $spacing-05;   /* 16px from the right edge */
  }

  ::slotted(#{$prefix}-ai-label:not([revert-active])),
  ::slotted(#{$prefix}-slug:not([revert-active])) {
    transform: translateY(-50%);     /* center vertically */
  }
}
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `@carbon/styles/scss/components/text-input/index`):

```css
.cds--text-input,
cds-text-input::part(input) {
  /* Bottom border + background fade on hover/focus state changes */
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline           var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    border-color      var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* AI-label and slot decorators slide subtly when revert-active toggles */
:host(cds-text-input) ::slotted(cds-ai-label),
:host(cds-text-input) ::slotted(cds-slug) {
  transition: transform var(--cds-duration-moderate-01) var(--cds-easing-productive-standard);
}

/* Skeleton shimmer */
@keyframes skeleton {
  0%   { transform: scaleX(0); transform-origin: left;  }
  20%  { transform: scaleX(1); transform-origin: left;  }
  28%  { transform: scaleX(1); transform-origin: right; }
  51%  { transform: scaleX(0); transform-origin: right; }
  58%  { transform: scaleX(0); transform-origin: right; }
  82%  { transform: scaleX(1); transform-origin: right; }
  83%  { transform: scaleX(1); transform-origin: left;  }
  96%  { transform: scaleX(0); transform-origin: left;  }
  100% { transform: scaleX(0); transform-origin: left;  }
}
.cds--skeleton .cds--text-input { animation: skeleton 3s cubic-bezier(0.4, 0.14, 0.3, 1) infinite; }

@media (prefers-reduced-motion: reduce) {
  .cds--text-input,
  cds-text-input::part(input) { transition: none; }
  .cds--skeleton .cds--text-input { animation: none; }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms`
- `--cds-duration-moderate-01` = `150ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`

## Accessibility (from Carbon's docs + source)

- **Semantic element:** the underlying form control is a native `<input type="text">` (or `type="password"`, etc.). Carbon's `<cds-text-input>` is a custom element shadow-rooted around that native input — screen readers see the native control.
- **Label association:** Carbon ALWAYS renders a `<label>` element wired by `id` / `for` (React: `labelText` prop; WC: `label` attribute). The label sits above the input, NOT as a placeholder. `hide-label` / `hideLabel` keeps the label in the accessibility tree but visually hides it (`cds--visually-hidden`).
- **Helper text:** rendered in a sibling `<div class="cds--form__helper-text">` that is wired via `aria-describedby` on the input.
- **Error / warn text:** when `invalid` or `warn` is set, the text moves into `<div class="cds--form-requirement" role="alert">` and gains `id` linkage via `aria-describedby`. The icon (`AlertFilled` or `WarningAltFilled`) is `aria-hidden="true"` because the message text already conveys state.
- **`readonly`:** sets `readonly` on the native input — screen readers announce "read only". Tab-stop is preserved.
- **`disabled`:** sets `disabled` on the native input — removes from tab order and announces "dimmed / disabled". Disabled inputs MUST NOT have helper / invalid text used to convey required information.
- **Password visibility toggle:** rendered as an `<button type="button">` with an accessible name (`Show password` / `Hide password`); `aria-pressed` reflects state; the button is inside the input wrapper but separate from the input.
- **Counter (`enableCounter`):** the count `current/max` is rendered as a sibling node and announced via `aria-live="polite"`; `maxlength` is set on the native input.
- **Keyboard:**
  - `Tab` / `Shift+Tab` — focus the input, then the password toggle (if present), then move on.
  - All native typing keys behave normally; selection / arrow / Home / End / Cmd-A unchanged.
  - `Enter` inside a `<form>` submits, per the platform default — Carbon does not intercept it.
- **Focus management:** Carbon ships a `:focus-visible` rule that combines a `2px solid var(--cds-focus)` outline with an inset `0 0 0 2px var(--cds-background)` ring — DO NOT remove either. The bottom border ALSO grows from `1px` → `2px` so users in high-contrast mode still see the focus indication if the outline is suppressed.
- **Touch target:** medium (`md`, 40px) clears the WCAG 2.1 Level AAA 44×44 target only at `lg` (48px). For touch-first UI, prefer `size="lg"` or wrap the input row in `min-height: 44px`.
- **Color contrast:** placeholder text `#a8a8a8` on `#f4f4f4` (White theme) is 2.4:1 — below WCAG AA for body text. Carbon documents this and explicitly forbids using placeholder text to communicate required information; the visible label is what carries semantics.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) on every input | Don't round the corners — that's Material / Apple, not Carbon |
| Apply the bottom-only border (`border-block-end: 1px solid border-strong-01`) and KEEP top / left / right borderless | Don't draw a 4-sided box — that's the v9-and-earlier Carbon style and it breaks the visual rhythm of forms |
| Render the `<label>` as a SEPARATE element above the input | Don't use a floating-label / Material-style `placeholder` substitute — Carbon labels are static |
| Put helper text in a sibling node tied via `aria-describedby` | Don't merge helper, error, and warn text into the same node — Carbon swaps them per state |
| Use `<PasswordInput>` (React) or `?show-password-visibility-toggle` (WC) for masked input | Don't roll your own eye-icon — the toggle has built-in `aria-pressed`, focus management, and padding-inline-end shift |
| Use `<FluidForm>` wrapper to opt into the Fluid variant (label moves INSIDE the field) | Don't add `fluid` ad-hoc on a single input — Fluid only renders correctly inside FluidForm context |
| Use `cds--*` class names from the source and `<cds-text-input>` element name | Don't substitute generic `<input>` if the project is using Carbon — the styles, focus ring, and ARIA wiring all live in the component |
| Wrap pages in `[data-theme="white"]` or `[data-theme="g100"]` so token values resolve correctly | Don't define your own `--cds-*` overrides — let the theme cascade do its job |
| Pad to `spacing-08` (40px) on the right when a password toggle, AI label, or invalid icon is present | Don't let icons overlap the typed value — the SCSS already handles the padding offset |
| Use `size="lg"` (48px) on touch-first surfaces | Don't ship `size="sm"` (32px) on mobile — it is below the WCAG touch-target threshold |
