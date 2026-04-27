---
name: text-area
description: Carbon TextArea — multi-line input that inherits TextInput's bottom-border-only treatment and adds vertical resize, optional rows/cols sizing, and an optional character/word counter. Variants from Storybook — Default (React), WithCharacterCounter (a Default-with-`enableCounter`), Skeleton, _WithLayer, withAILabel. WC exports Default, Skeleton, WithAILabel, WithLayer.
metadata:
  tags: text-area, textarea, input, form, multiline, counter, resize, skeleton, ibm, carbon, react, web-components
---

# Text Area -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`TextArea.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TextArea/TextArea.stories.js)
> - **WC story:** [`textarea.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/textarea/textarea.stories.ts)
> - **Shared SCSS:** [`_text-area.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/text-area/_text-area.scss)
> - **WC SCSS:** [`textarea.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/textarea/textarea.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-textarea--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-text-area--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/text-input/usage/ (TextArea shares usage docs with TextInput)
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Default rows | `4` (≈ `96px` tall at body-01 line-height) |
| Min block size | `40px` (`min-block-size: convert.to-rem(40px)`) — same as `md` text-input |
| Min inline size | `10rem` (`160px`) — keeps the field usable at narrow widths |
| Padding-block | `11px 11px` (`convert.to-rem(11px)` top + bottom) — leaves 18px of caret-friendly space at body-01 |
| Padding-inline | `0 16px` (`layout.density('padding-inline')` resolves to `spacing-05` at the default `normal` density) |
| Padding-inline-end (with AI-label / decorator) | `40px` (`spacing-08`) |
| Padding-inline-end (with invalid / warn icon AND decorator) | `64px` (`spacing-10`) |
| Counter offset | counter sits in `__label-wrapper` (right side of the label row), `13px` line-height, `helper-text-01` |
| Resize | `resize: vertical` — user can drag handle, NOT horizontal |
| Resize (disabled state) | `resize: none` |
| Corner radius | `0` (Carbon: sharp by default — no rounding on the textarea) |
| Border treatment | **Bottom-only**: `border-block-end: 1px solid var(--cds-border-strong-01)` — top, left, right are `border: none` |
| Background (White theme, `field-01`) | `#f4f4f4` |
| Background (G100 theme, `field-01`) | `#262626` |
| Border-strong-01 (White) | `#8d8d8d` |
| Border-strong-01 (G100) | `#6f6f6f` |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: -2px` plus the bottom border thickens to `2px solid var(--cds-focus)` (re-uses `focus-outline('outline')` mixin) |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes) |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Placeholder color | `var(--cds-text-placeholder)` — White: `#a8a8a8`, G100: `#6f6f6f` |
| Label position | Above textarea as a separate `<label>` element; counter (`current/max`) sits to the right of the label on the same row (`__label-wrapper` flex with `justify-content: space-between`) |
| Font | IBM Plex Sans, `body-01` for typed value (14px / 1.25rem line-height — note: textarea uses body-01, NOT body-compact-01 like text-input) |
| React import | `import { TextArea, TextAreaSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/textarea/index.js';` (note the WC element is `<cds-textarea>`, single word, no hyphen between `text` and `area`) |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default (React) | `Default` | `TextArea.stories.js` | Standard textarea with label + helper text. The default args set `enableCounter: true`, so the rendered Default is the `WithCharacterCounter` story. |
| WithCharacterCounter | (no separate export — `Default` with `enableCounter: true`) | `TextArea.stories.js` | Carbon does not ship a `WithCharacterCounter` export; the counter is enabled on `Default` via `Default.args = { enableCounter: true };`. The Storybook side-bar item labelled "With character counter" is the same story. |
| WithLayer | `_WithLayer` | `TextArea.stories.js` | Demonstrates `field-01 / 02 / 03` token swap across nested `<Layer>` contexts. |
| withAILabel | `withAILabel` | `TextArea.stories.js` | Embeds an `<AILabel>` decorator with the `aiAura` gradient background; positioned via `__inner-wrapper--decorator` slot. |
| Skeleton | `Skeleton` | `TextArea.stories.js` | `<TextAreaSkeleton>` placeholder while content loads — `100px` tall shimmer. |
| WC: Default | `Default` | `textarea.stories.ts` | Renders `<cds-textarea>` wrapped in `<cds-form-item>` with all shared args. |
| WC: Skeleton | `Skeleton` | `textarea.stories.ts` | `<cds-textarea-skeleton>` placeholder. |
| WC: WithAILabel | `WithAILabel` | `textarea.stories.ts` | Slots a `<cds-ai-label alignment="bottom-right">` into the textarea. |
| WC: WithLayer | `WithLayer` | `textarea.stories.ts` | Demonstrates layer-token swap via `withLayers` decorator. |

The React `Default` story enables the counter by default (`Default.args = { enableCounter: true };`), so the "WithCharacterCounter" story you see in Storybook is the SAME story as `Default` — it is not a separately-exported render function. The counter is controlled exclusively by the `enableCounter` and `maxCount` props.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `TextArea.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `TextArea.stories.js`):

```jsx
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';
import { View, FolderOpen, Folders, Information } from '@carbon/icons-react';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { default as TextArea, TextAreaSkeleton } from './';
import { Tooltip } from '../Tooltip';
import mdx from './TextArea.mdx';
```

**Default args** (apply to every story unless overridden):

```jsx
args: {
  enableCounter: false,
  helperText: 'TextArea helper text',
  labelText: 'TextArea label',
  maxCount: 500,
  disabled: false,
  hideLabel: false,
  invalid: false,
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  placeholder: '',
  rows: 4,
  warn: false,
  warnText: 'This is a warning message.',
},
```

**ArgTypes** (control panel definitions — every prop in `args` above is exposed as a Storybook control of the matching type; `className` and `id` are `control: false`, and `light` / `slug` are deprecated controls hidden via `table: { disable: true }`).

**Variant: Default** (NB: `Default.args = { enableCounter: true };` overrides the global default, so the rendered Default IS the character-counter variant)

```jsx
export const Default = (args) => {
  return <TextArea {...args} id="text-area-1" />;
};

Default.args = {
  enableCounter: true,
};
```

**Variant: WithLayer**

```jsx
export const _WithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <TextArea
        labelText="Text Area label"
        helperText="Optional helper text"
        rows={4}
        id={`text-area-${layer}`}
        {...args}
      />
    )}
  </WithLayer>
);

_WithLayer.args = { helperText: 'Optional helper text' };
```

**Variant: withAILabel** (the `aiLabel` JSX is identical to TextInput's withAILabel — see `text-input.md` for the full `<AILabel>` body)

```jsx
export const withAILabel = (args) => {
  const aiLabel = (
    <AILabel className="ai-label-container">
      <AILabelContent>
        {/* AI Explained / 84% Confidence score / Lorem ipsum body / Model type — see text-input.md */}
        <AILabelActions>
          <IconButton kind="ghost" label="View"><View /></IconButton>
          <IconButton kind="ghost" label="Open Folder"><FolderOpen /></IconButton>
          <IconButton kind="ghost" label="Folders"><Folders /></IconButton>
          <Button>View details</Button>
        </AILabelActions>
      </AILabelContent>
    </AILabel>
  );

  return (
    <TextArea
      labelText="Text Area label"
      helperText="Optional helper text"
      rows={4}
      id="text-area-5"
      decorator={aiLabel}
      {...args}
    />
  );
};

withAILabel.args = { helperText: 'Optional helper text' };
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => {
  return <TextAreaSkeleton {...args} />;
};

Skeleton.parameters = {
  controls: {
    include: ['hideLabel'],
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `textarea.stories.ts` on the Carbon `main` branch. Use these for non-React projects. NOTE: the WC element name is `<cds-textarea>` (single word) — NOT `<cds-text-area>`. The path is also `components/textarea/`.

**Imports** (from the top of `textarea.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './index';
import '../form/form-item';
import '../ai-label';
import '../icon-button';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Shared args** (used by Default / WithAILabel / WithLayer):

```ts
const args = {
  cols: 0,
  counterMode: '',
  disabled: false,
  enableCounter: true,
  helperText: 'TextArea helper text',
  hideLabel: false,
  invalid: false,
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  label: 'TextArea label',
  maxCount: 500,
  onInput: () => {},
  placeholder: '',
  readonly: false,
  rows: 4,
  value: '',
  warn: false,
  warnText: 'This is a warning message.',
};
```

**Shared argTypes** (every prop in `args` is a Storybook control of the matching type. `counterMode` is `control: 'radio'` with `options: ['character', 'word']`. `onInput` is `{ action: 'input', table: { disable: true } }`. Each control has a description matching the WC attribute name in parentheses, e.g. `'Helper text (helper-text)'`.)

**AI-label slot helpers** (used by `WithAILabel`; the `content` and `actions` `html` template literals are character-for-character identical to the ones in `text-input.stories.ts` — see `text-input.md` for the full source. They render an "AI Explained / 84% / Confidence score / Lorem ipsum / Model type" body and three `<cds-icon-button kind="ghost" slot="actions" size="lg">` action buttons (View, Open folder, Folders) plus a `<cds-ai-label-action-button>View details</cds-ai-label-action-button>`.)

**Variant: Default** (rendered with `enableCounter: true` from the shared args — this IS the character-counter story)

```ts
export const Default = {
  args,
  argTypes,
  render: ({
    cols, counterMode, disabled, enableCounter, helperText, hideLabel,
    invalid, invalidText, label, maxCount, onInput, placeholder,
    readonly, rows, value, warn, warnText,
  }) => html`
    <cds-form-item>
      <cds-textarea
        ?enable-counter="${enableCounter}"
        counter-mode="${ifDefined(counterMode)}"
        helper-text="${ifDefined(helperText)}"
        ?hide-label="${hideLabel}"
        ?invalid="${invalid}"
        invalid-text="${ifDefined(invalidText)}"
        label="${ifDefined(label)}"
        ?readonly="${readonly}"
        value="${ifDefined(value)}"
        ?warn="${warn}"
        warn-text="${ifDefined(warnText)}"
        ?disabled="${disabled}"
        max-count="${ifDefined(maxCount)}"
        placeholder="${ifDefined(placeholder)}"
        @input="${onInput}"
        rows="${ifDefined(rows)}"
        cols="${ifDefined(cols)}">
        ${value}
      </cds-textarea>
    </cds-form-item>
  `,
};
```

**Variant: Skeleton**

```ts
export const Skeleton = {
  args,
  argTypes,
  parameters: {
    controls: {
      include: ['hideLabel'],
    },
  },
  render: ({ hideLabel }) => html`
    <cds-textarea-skeleton ?hide-label=${hideLabel}></cds-textarea-skeleton>
  `,
};
```

**Variant: WithAILabel** (same render-prop destructuring and full attribute list as `Default`; only the args override and the slotted `<cds-ai-label>` differ)

```ts
export const WithAILabel = {
  args: { ...args, helperText: 'Optional helper text', enableCounter: false },
  argTypes,
  render: ({ /* same destructured args as Default */ }) => html`
    <cds-textarea
      ?enable-counter="${enableCounter}"
      counter-mode="${ifDefined(counterMode)}"
      helper-text="${ifDefined(helperText)}"
      ?hide-label="${hideLabel}"
      ?invalid="${invalid}"
      invalid-text="${ifDefined(invalidText)}"
      label="${ifDefined(label)}"
      ?readonly="${readonly}"
      value="${ifDefined(value)}"
      ?warn="${warn}"
      warn-text="${ifDefined(warnText)}"
      ?disabled="${disabled}"
      max-count="${ifDefined(maxCount)}"
      placeholder="${ifDefined(placeholder)}"
      @input="${onInput}"
      rows="${ifDefined(rows)}"
      cols="${ifDefined(cols)}">
      <cds-ai-label alignment="bottom-right">
        ${content}${actions}
      </cds-ai-label>
    </cds-textarea>
  `,
};
```

**Variant: WithLayer** (decorated with `withLayers`; identical attribute list to Default, no slotted children)

```ts
export const WithLayer = {
  decorators: [withLayers],
  parameters: { layout: 'fullscreen' },
  args: { ...args, helperText: 'Optional helper text', enableCounter: false },
  argTypes,
  render: ({ /* same destructured args as Default */ }) => html`
    <cds-textarea
      ?enable-counter="${enableCounter}"
      counter-mode="${ifDefined(counterMode)}"
      helper-text="${ifDefined(helperText)}"
      ?hide-label="${hideLabel}"
      ?invalid="${invalid}"
      invalid-text="${ifDefined(invalidText)}"
      label="${ifDefined(label)}"
      ?readonly="${readonly}"
      value="${ifDefined(value)}"
      ?warn="${warn}"
      warn-text="${ifDefined(warnText)}"
      ?disabled="${disabled}"
      max-count="${ifDefined(maxCount)}"
      placeholder="${ifDefined(placeholder)}"
      @input="${onInput}"
      rows="${ifDefined(rows)}"
      cols="${ifDefined(cols)}">
    </cds-textarea>
  `,
};
```

**Default export** (story metadata): `export default { title: 'Components/Text Area' };`

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`?attr=${value}`, `${ifDefined(...)}`) resolved to static attributes using the shared default args. The `<cds-textarea>` element is still a custom element — register `@carbon/web-components/es/components/textarea/index.js` for it to upgrade.

**Variant: Default / WithCharacterCounter** (rows `4`, counter on, `maxCount: 500`; `counter-mode` defaults to `character`)

```html
<cds-form-item>
  <cds-textarea
    enable-counter
    counter-mode="character"
    helper-text="TextArea helper text"
    label="TextArea label"
    max-count="500"
    rows="4">
  </cds-textarea>
</cds-form-item>
```

**Variant: With word counter** (swap to `counter-mode="word"`)

```html
<cds-form-item>
  <cds-textarea enable-counter counter-mode="word" label="TextArea label" max-count="200" rows="4"></cds-textarea>
</cds-form-item>
```

**Variant: ReadOnly / Invalid / Warn / Disabled** (toggle one boolean attribute on the element above; pair `invalid` with `invalid-text`, `warn` with `warn-text`)

```html
<cds-textarea readonly label="TextArea label" helper-text="TextArea helper text" rows="4" value="This is read only, you can't type more."></cds-textarea>
<cds-textarea invalid invalid-text="Error message goes here" label="TextArea label" rows="4"></cds-textarea>
<cds-textarea warn warn-text="This is a warning message." label="TextArea label" rows="4"></cds-textarea>
<cds-textarea disabled label="TextArea label" helper-text="TextArea helper text" rows="4"></cds-textarea>
```

**Variant: Skeleton**

```html
<cds-textarea-skeleton></cds-textarea-skeleton>
```

## Design Tokens (component-scoped, resolved from overview.md)

The Storybook source uses semantic tokens (`$field`, `$border-strong`, `$text-primary`, `$text-helper`, `$text-placeholder`, `$support-error`, `$support-warning`, `$border-subtle` for read-only, `$text-disabled`). Below are those tokens resolved to literal hex for the two canonical themes (White and G100). The TextArea inherits ALL of these from TextInput's bottom-only treatment — there is no separate textarea token namespace in Carbon.

```css
[data-theme="white"] {
  --cds-text-area-background:        #f4f4f4; /* field-01 */
  --cds-text-area-background-hover:  #e8e8e8; /* field-hover-01 */
  --cds-text-area-border-bottom:     #8d8d8d; /* border-strong-01 */
  --cds-text-area-border-bottom-w:   1px;
  --cds-text-area-border-bottom-w-focus: 2px;
  --cds-text-area-border-readonly:   #c6c6c6; /* border-subtle-01 */
  --cds-text-area-focus:             #0f62fe; /* focus */
  --cds-text-area-focus-inset:       #ffffff; /* focus-inset */
  --cds-text-area-color:             #161616; /* text-primary */
  --cds-text-area-placeholder:       #a8a8a8; /* text-placeholder */
  --cds-text-area-label:             #525252; /* text-secondary */
  --cds-text-area-helper:            #6f6f6f; /* text-helper — also counter */
  --cds-text-area-error:             #da1e28; /* support-error */
  --cds-text-area-warning:           #f1c21b; /* support-warning */
  --cds-text-area-disabled-color:    rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-text-area-disabled-bg:       #f4f4f4;
  --cds-text-area-border-disabled:   transparent;
}

[data-theme="g100"],
.dark {
  --cds-text-area-background:        #262626; /* field-01 G100 */
  --cds-text-area-background-hover:  #333333; /* field-hover-01 G100 */
  --cds-text-area-border-bottom:     #6f6f6f; /* border-strong-01 G100 */
  --cds-text-area-border-bottom-w:   1px;
  --cds-text-area-border-bottom-w-focus: 2px;
  --cds-text-area-border-readonly:   #525252; /* border-subtle-01 G100 */
  --cds-text-area-focus:             #ffffff; /* focus inverts on dark */
  --cds-text-area-focus-inset:       #161616;
  --cds-text-area-color:             #f4f4f4; /* text-primary G100 */
  --cds-text-area-placeholder:       #6f6f6f;
  --cds-text-area-label:             #c6c6c6;
  --cds-text-area-helper:            #c6c6c6;
  --cds-text-area-error:             #fa4d56; /* support-error G100 */
  --cds-text-area-warning:           #f1c21b;
  --cds-text-area-disabled-color:    rgba(244, 244, 244, 0.25);
  --cds-text-area-disabled-bg:       #262626;
  --cds-text-area-border-disabled:   transparent;
}

/* Sharp corners + vertical-only resize. Disabled removes the handle. */
.cds--text-area, cds-textarea { border-radius: 0; }
.cds--text-area { resize: vertical; }
.cds--text-area:disabled { resize: none; }
```

## States Reference (from `_text-area.scss`)

> The shipped `packages/styles/scss/components/text-area/_text-area.scss` is the canonical CSS source — the WC `textarea.scss` `@use`s it and adds shadow-DOM host rules (decorator slot positioning, ai-label padding). The state values below resolve those Carbon styles to literal hex per theme.

| State | White bg / border | G100 bg / border | Outline | Resize | Notes |
|---|---|---|---|---|---|
| Rest | `#f4f4f4` / `1px solid #8d8d8d` | `#262626` / `1px solid #6f6f6f` | none | `vertical` | text `text-primary`; placeholder `text-placeholder`; min-block-size `40px`; min-inline-size `160px` |
| Hover | `#e8e8e8` (`field-hover-01`) / same | `#333333` / same | none | `vertical` | bottom border unchanged on hover |
| Focus / active | (rest bg) / `2px solid #0f62fe` | (rest bg) / `2px solid #ffffff` | `outline: 2px solid var(--cds-focus); outline-offset: -2px` | `vertical` | both `:focus` and `:active` share the rule (`focus-outline('outline')` mixin) |
| Invalid | `#f4f4f4` / `2px solid #da1e28` | `#262626` / `2px solid #fa4d56` | none on rest; focus still blue | `vertical` | error icon at `inset-block-start: 12px; inset-inline-end: 16px` (`spacing-04` / `spacing-05`); invalid-text `text-error` below |
| Warn | `#f4f4f4` / `1px solid #8d8d8d` | `#262626` / `1px solid #6f6f6f` | none | `vertical` | warning triangle `#f1c21b` (with `path[fill]: #000000`) at same offsets; warn-text `text-secondary` |
| Read-only | transparent / `1px solid #c6c6c6` (`border-subtle-01`) | transparent / `1px solid #525252` | none | `vertical` | wrapper has `__wrapper--readonly` modifier; `cursor: default` |
| Disabled | `#f4f4f4` (unchanged) / `1px solid transparent` | `#262626` / `1px solid transparent` | `outline: none` | **`none`** | text `text-disabled`; placeholder also `text-disabled`; `cursor: not-allowed`; resize handle removed |
| With AI-label / decorator | (rest bg) + `aiAura` gradient | (rest bg) + gradient | none | `vertical` | `padding-inline-end: 40px` (`spacing-08`); decorator pinned at `inset-block-start: 12px; inset-inline-end: 16px` |
| AI-label + invalid/warn | (rest bg) + gradient + 2px error border | same + gradient | none | `vertical` | `padding-inline-end: 64px` (`spacing-10`); decorator slides to `inset-inline-end: 40px` (`spacing-08`) |
| Skeleton | `#e5e5e5` shimmer | `#353535` shimmer | none | none | `block-size: 100px`; `@keyframes skeleton` 3s `cubic-bezier(.4,.14,.3,1)` infinite |

### Verbatim SCSS source (`packages/styles/scss/components/text-area/_text-area.scss`)

```scss
@mixin text-area {
  .#{$prefix}--text-area {
    @include component-reset.reset;
    @include type-style('body-01');
    @include focus-outline('reset');
    padding: convert.to-rem(11px) layout.density('padding-inline');
    border: none;
    background-color: $field;
    block-size: 100%;
    border-block-end: 1px solid $border-strong;
    color: $text-primary;
    font-family: inherit;
    min-block-size: convert.to-rem(40px);
    min-inline-size: 10rem;
    resize: vertical;
    transition:
      background-color $duration-fast-01 motion(standard, productive),
      outline $duration-fast-01 motion(standard, productive);
  }
  .#{$prefix}--text-area:focus,
  .#{$prefix}--text-area:active { @include focus-outline('outline'); }
  .#{$prefix}--text-area::placeholder { @include placeholder-colors; @include type-style('body-01'); }

  .#{$prefix}--text-area__wrapper {
    @include layout.use('density', $default: 'normal');
    position: relative; display: flex; inline-size: 100%; max-inline-size: 100%;
  }
  .#{$prefix}--text-area__wrapper--cols { inline-size: auto; }

  .#{$prefix}--text-area__invalid-icon {
    position: absolute;
    fill: $support-error;
    inset-block-start: $spacing-04;            /* 12px */
    inset-inline-end: layout.density('padding-inline');
  }
  .#{$prefix}--text-area__invalid-icon--warning { fill: $support-warning; }
  .#{$prefix}--text-area__invalid-icon--warning path[fill] { fill: $black-100; opacity: 1; }

  .#{$prefix}--text-area__counter-alert {
    position: absolute; overflow: hidden; padding: 0; border: 0; margin: -1px;
    block-size: 1px; clip: rect(0, 0, 0, 0); inline-size: 1px;
  }

  /* Disabled */
  .#{$prefix}--text-area:disabled {
    background-color: $field;
    border-block-end: 1px solid transparent;
    color: $text-disabled;
    cursor: not-allowed; outline: none; resize: none;
  }
  .#{$prefix}--text-area:disabled::placeholder { color: $text-disabled; }

  /* Read-only */
  .#{$prefix}--text-area__wrapper--readonly .#{$prefix}--text-area {
    background: transparent; border-block-end-color: $border-subtle;
  }

  /* Decorator / ai-label slot — pinned top-right (12px / 16px) */
  .#{$prefix}--text-area__wrapper--decorator .#{$prefix}--text-area__inner-wrapper--decorator > *,
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--ai-label,
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--slug {
    position: absolute; inset-block-start: $spacing-04; inset-inline-end: $spacing-05;
  }
  /* Revert mode tucks into the corner (4px / 8px) */
  .#{$prefix}--text-area__wrapper--decorator .#{$prefix}--ai-label.#{$prefix}--ai-label--revert,
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--ai-label.#{$prefix}--ai-label--revert,
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--slug.#{$prefix}--slug--revert {
    inset-block-start: $spacing-02; inset-inline-end: $spacing-03; transform: translate(0);
  }

  /* Padding-inline-end grows to spacing-08 (40px) when decorator OR validation icon is present;
     to spacing-10 (64px) when BOTH are present. Decorator slides left to spacing-08 in that combo. */
  .#{$prefix}--text-area__wrapper--decorator
    .#{$prefix}--text-area:has(~ .#{$prefix}--text-area__inner-wrapper--decorator > *),
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--text-area:has(~ .#{$prefix}--ai-label),
  .#{$prefix}--text-area__wrapper--slug .#{$prefix}--text-area:has(~ .#{$prefix}--slug) {
    padding-inline-end: $spacing-08;
  }
  .#{$prefix}--text-area--invalid:has(~ .#{$prefix}--text-area__inner-wrapper--decorator > *),
  .#{$prefix}--text-area--warn:has(~ .#{$prefix}--text-area__inner-wrapper--decorator > *),
  .#{$prefix}--text-area--invalid:has(~ .#{$prefix}--ai-label),
  .#{$prefix}--text-area--warn:has(~ .#{$prefix}--ai-label),
  .#{$prefix}--text-area--invalid:has(~ .#{$prefix}--slug),
  .#{$prefix}--text-area--warn:has(~ .#{$prefix}--slug) { padding-inline-end: $spacing-10; }
  .#{$prefix}--text-area--invalid ~ .#{$prefix}--text-area__inner-wrapper--decorator > *,
  .#{$prefix}--text-area--warn ~ .#{$prefix}--text-area__inner-wrapper--decorator > *,
  .#{$prefix}--text-area--invalid ~ .#{$prefix}--ai-label,
  .#{$prefix}--text-area--warn ~ .#{$prefix}--ai-label,
  .#{$prefix}--text-area--invalid ~ .#{$prefix}--slug,
  .#{$prefix}--text-area--warn ~ .#{$prefix}--slug { inset-inline-end: $spacing-08; }

  /* Skeleton — 100px tall shimmer */
  .#{$prefix}--text-area.#{$prefix}--skeleton {
    @include skeleton; block-size: convert.to-rem(100px); inline-size: 100%;
    &::placeholder { color: transparent; }
  }

  /* Label row: label on the left, counter on the right */
  .#{$prefix}--text-area__label-wrapper {
    position: relative; display: flex; justify-content: space-between; inline-size: 100%;
  }
}
```

### WC shadow-DOM extras (verbatim from `packages/web-components/src/components/textarea/textarea.scss`)

```scss
:host(cds-textarea) {
  outline: none;
  ::slotted(cds-ai-label),
  ::slotted(cds-slug) {
    position: absolute;
    inset-block-start: 0.75rem;       /* spacing-04 */
    inset-inline-end: 1rem;           /* spacing-05 */
  }
  ::slotted(cds-ai-label[revert-active]),
  ::slotted(cds-slug[revert-active]) {
    inset-block-start: 0.25rem;       /* spacing-02 */
    inset-inline-end: 0.5rem;         /* spacing-03 */
    transform: translate(0);
  }
}

/* When the host has no cols (or cols=0) the textarea fills its container */
:host(cds-textarea[cols='0']),
:host(cds-textarea:not([cols])),
:host(cds-textarea) textarea[cols='0'],
:host(cds-textarea) textarea:not([cols]) {
  inline-size: 100%;
}

/* Validation + decorator combo — push padding to spacing-10 (64px) and slide slot left */
:host(cds-textarea[warn]),
:host(cds-textarea[invalid]) {
  .cds--text-area__wrapper--decorator .cds--text-area {
    padding-inline-end: 4rem;         /* spacing-10 */
  }
  ::slotted(cds-ai-label),
  ::slotted(cds-slug) { inset-inline-end: 2.5rem; }      /* spacing-08 */
  ::slotted(cds-ai-label[revert-active]),
  ::slotted(cds-slug[revert-active]) { inset-inline-end: 2rem; }   /* spacing-07 */
}

/* AI-label gradient on the wrapper */
:host(cds-textarea[ai-label]) .cds--text-area__wrapper--decorator {
  /* @include ai-gradient */
}

.cds--text-area__wrapper--cols { display: inline-flex; }
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `_text-area.scss`):

```css
.cds--text-area,
cds-textarea::part(textarea) {
  /* Bottom border + background fade on hover/focus state changes */
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline           var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* AI-label and slot decorators slide subtly when revert-active toggles */
:host(cds-textarea) ::slotted(cds-ai-label),
:host(cds-textarea) ::slotted(cds-slug) {
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
.cds--skeleton .cds--text-area { animation: skeleton 3s cubic-bezier(0.4, 0.14, 0.3, 1) infinite; }

@media (prefers-reduced-motion: reduce) {
  .cds--text-area,
  cds-textarea::part(textarea) { transition: none; }
  .cds--skeleton .cds--text-area { animation: none; }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms`
- `--cds-duration-moderate-01` = `150ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`
- `--cds-easing-expressive-standard` = `cubic-bezier(0.4, 0.14, 0.3, 1)` (used by skeleton shimmer)

## Accessibility (from Carbon's docs + source)

- **Semantic element:** the underlying form control is a native `<textarea>`. The `<cds-textarea>` custom element shadow-roots around it — screen readers see the native control and announce "edit, multi-line".
- **Label association:** Carbon ALWAYS renders a `<label>` wired by `id` / `for` (React: `labelText`; WC: `label`). Label sits above the textarea, never as a placeholder. `hideLabel` keeps the label in the a11y tree but visually hides it (`cds--visually-hidden`).
- **Helper text:** rendered in a sibling `<div class="cds--form__helper-text">` linked via `aria-describedby`. When `invalid` or `warn` is set, the text moves into `<div class="cds--form-requirement" role="alert">`. The validation icon (`AlertFilled` / `WarningAltFilled`) is `aria-hidden="true"`.
- **Counter (`enableCounter`):** `current/max` renders in the `__label-wrapper` (right side of the label row, `helper-text-01`). A duplicate lives in `cds--text-area__counter-alert` — visually hidden, `role="status"`, `aria-live="polite"` — so SRs announce updates politely. `maxlength` is set on the native `<textarea>` in character mode; word mode counts whitespace-separated tokens client-side and does NOT set `maxlength`.
- **`readonly`:** native `readonly` — SRs announce "read only", tab-stop preserved, border becomes `border-subtle`, background transparent.
- **`disabled`:** native `disabled` — removed from tab order, "dimmed / disabled" announced, helper / invalid text MUST NOT carry required info, resize handle removed (`resize: none`).
- **Resize handle:** the native `resize: vertical` corner is keyboard-inaccessible by default — Carbon does not ship a custom resize keybinding. Set `rows` to give a sensible starting height.
- **Keyboard:** `Tab` / `Shift+Tab` move focus through the field. `Enter` inserts a newline (does NOT submit; `Tab` exits — textareas do not capture it). All native typing / selection / Home / End / Cmd-A keys unchanged.
- **Focus management:** the `focus-outline('outline')` mixin draws `outline: 2px solid var(--cds-focus); outline-offset: -2px` so the ring sits ON the field edge; the bottom border also grows `1px → 2px` so high-contrast mode still shows focus. DO NOT remove either.
- **Touch target & contrast:** `min-block-size: 40px` clears WCAG 2.1 AA. Placeholder `#a8a8a8` on `#f4f4f4` is 2.4:1 — below AA for body text, so NEVER use the placeholder to convey required information; the visible label carries semantics.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) and bottom-only border (`border-block-end: 1px solid border-strong-01`; `border: none` on top/left/right) | Don't round corners or draw a 4-sided box — that's Material / Apple or v9-Carbon, not v11 |
| Render `<label>` as a separate element above the textarea, with the counter on the SAME row (right-aligned) when `enableCounter` is set | Don't use floating labels or placeholder-as-label, and don't put the counter below the field — it lives in the label row |
| Allow `resize: vertical` only; SCSS sets `resize: none` on disabled — keep it that way | Don't allow `resize: both` / `horizontal`, and don't leave a drag handle visible while disabled |
| Use `enableCounter` + `maxCount` (or `counter-mode="word"`) — the counter ships with `aria-live` + auto `maxlength` | Don't roll your own counter, and don't set both a character limit AND a word counter on the same field |
| Put helper text in a sibling node tied via `aria-describedby`; let `invalid` / `warn` swap it | Don't merge helper, error, and warn into one node — Carbon swaps them per state |
| Use the WC element `<cds-textarea>` (one word, no hyphen) and the SCSS classes `cds--text-area` (with hyphen) | Don't write `<cds-text-area>` with a hyphen — the element name is `<cds-textarea>` |
| Wrap pages in `[data-theme="white"]` / `[data-theme="g100"]` so `--cds-*` tokens resolve correctly | Don't override `--cds-*` per component — let the theme cascade work |
| Pad `spacing-08` (40px) on the right when an AI-label OR validation icon is present; `spacing-10` (64px) when both are present | Don't let icons overlap the typed value — the SCSS `:has()` selectors handle this automatically |
| Set `rows={3}` or higher for comfortable typing; wrap WC in `<cds-form-item>` for form-row rhythm | Don't ship `rows={1}` (use `<TextInput>` instead) and don't drop `<cds-textarea>` directly into a flex container without `<cds-form-item>` |
