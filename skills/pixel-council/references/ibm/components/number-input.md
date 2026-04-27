---
name: number-input
description: Carbon NumberInput — text-input with increment/decrement steppers on the right and a 1px vertical rule divider. Variants from Storybook — Default, withAILabel, WithTypeOfText, WithTypeOfTextControlled, WithTypeOfCustomValidation, Skeleton (React); Default, Skeleton, WithAILabel, WithTypeOfText, WithTypeOfTextControlled, WithTypeOfCustomValidation, plus hidden regression stories InvalidWithAILabel, WarnWithAILabel, DisabledWithAILabel, TypeTextTestScenarios (WC).
metadata:
  tags: number-input, input, form, stepper, increment, decrement, fluid, skeleton, ibm, carbon, react, web-components
---

# Number Input -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`NumberInput.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/NumberInput/NumberInput.stories.js)
> - **WC story:** [`number-input.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/number-input/number-input.stories.ts)
> - **SCSS:** [`_number-input.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/number-input/_number-input.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-numberinput--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-number-input--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/number-input/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg) | `32px` / `40px` / `48px` |
| Min inline-size of native input | `9.375rem` (`150px`) |
| Padding-inline (md, rest) | `0` start, `48px` end (steppers reserve `48px`) — wait, actual: `padding-inline: $spacing-05 $spacing-12` = `16px` start, `48px` end |
| Padding-inline-end (md, invalid) | `128px` (room for warn/invalid icon + 1px divider + two stepper buttons) |
| Padding-inline-end (md, warning) | `128px` |
| Padding-inline-end (lg, rest) | `112px` |
| Padding-inline-end (lg, invalid) | `144px` |
| Padding-inline-end (lg, warning) | `144px` |
| Padding-inline-end (sm, rest) | `80px` |
| Padding-inline-end (sm, invalid) | `112px` |
| Padding-inline-end (sm, warning) | `112px` |
| Padding-inline-end (no-steppers, rest) | `0` |
| Padding-inline-end (no-steppers, invalid / warning) | `48px` |
| Padding-inline-end (with AI-label decorator, rest) | `145px` |
| Padding-inline-end (with AI-label decorator, invalid / warning) | `144px` |
| Stepper container width (sm / md / lg) | `64px` / `80px` / `48px` (lg uses `$spacing-12` = 48px container) |
| Single stepper button width (sm / md / lg) | `32px` / `40px` (default `1/2` of 80px container) / `48px` |
| Stepper button height | `100%` of input height |
| Vertical rule divider | `1px` wide × `16px` tall, color `var(--cds-border-subtle)` (`#e0e0e0` White / `#393939` G100), centered between input and steppers and between the two stepper buttons |
| Stepper icons | `chevron-up` (up) / `chevron-down` (down), `16px`, `fill: currentColor` mapped to `var(--cds-icon-primary)` |
| Corner radius | `0` (Carbon: sharp by default — never round) |
| Border treatment | **Bottom-only**: `border-block-end: 1px solid var(--cds-border-strong)` (matches text-input) |
| Background (White, `field`) | `#f4f4f4` |
| Background (G100, `field`) | `#262626` |
| Hover background (stepper buttons) | `var(--cds-field-hover)` — White: `#e8e8e8`, G100: `#333333` |
| Hover inset shadow on stepper | `box-shadow: 0 -1px 0 var(--cds-border-strong) inset` |
| Focus ring | Bottom border becomes `2px solid var(--cds-focus)` PLUS `outline: 2px solid var(--cds-focus); outline-offset: -2px`. Stepper buttons gain `border-width: 2px 0; border-style: solid; border-color: var(--cds-focus)` (top + bottom focus indicator). |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White `#da1e28`, G100 `#fa4d56`. Invalid icon (`warning--filled`) sits at `inset-inline-end: $spacing-12` (48px) for md, `112px` for lg, `80px` for sm. |
| Warning icon | `var(--cds-support-warning)` = `#f1c21b` (both themes); inner triangle path: `fill: var(--cds-black-100)` (`#000000`), `opacity: 1` |
| Helper text color | `var(--cds-text-helper)` — White `#6f6f6f`, G100 `#c6c6c6` |
| Disabled text | `var(--cds-text-disabled)` — White `rgba(22, 22, 22, 0.25)`, G100 `rgba(244, 244, 244, 0.25)` |
| Disabled stepper icon | `var(--cds-icon-disabled)` |
| Read-only background | `transparent` (input becomes see-through; bottom border switches to `var(--cds-border-subtle)`) |
| Font | IBM Plex Sans, body-compact-01 (input value); helper-text-01 (helper / invalid / warn); 400 weight |
| React import | `import { NumberInput, NumberInputSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/number-input/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `NumberInput.stories.js` | Standard `type="number"` input with controlled state, range -100 to 100, integer step. |
| withAILabel | `withAILabel` | `NumberInput.stories.js` | Embeds an `<AILabel>` decorator (with confidence score body + actions) into the field; activates the aiAura gradient background and `145px` end padding. |
| WithTypeOfText | `WithTypeOfText` | `NumberInput.stories.js` | `type="text"` + `inputMode="decimal"` + `locale={useDocumentLang()}` — locale-aware parsing/formatting (group + decimal separators). |
| WithTypeOfTextControlled | `WithTypeOfTextControlled` | `NumberInput.stories.js` | `type="text"` controlled — `value` starts as `NaN`, external button programmatically sets to `50`. Demonstrates `onBlur` action and external state sync. |
| WithTypeOfCustomValidation | `WithTypeOfCustomValidation` | `NumberInput.stories.js` | `type="text"` + `validate={validateNumberSeparators}` + `allowEmpty` — uses Carbon's exported regex validator that supports Latin / Arabic / Devanagari / Bengali / Fullwidth / CJK digits. |
| Skeleton | `Skeleton` | `NumberInput.stories.js` | `<NumberInputSkeleton size hideLabel>` — shimmer placeholder while data loads. |
| WC: Default | `Default` | `number-input.stories.ts` | Renders `<cds-number-input>` inside `<cds-form-item>` with all shared args. |
| WC: Skeleton | `Skeleton` | `number-input.stories.ts` | `<cds-number-input-skeleton>` shimmer block; Percy snapshot disabled. |
| WC: WithAILabel | `WithAILabel` | `number-input.stories.ts` | Slots a `<cds-ai-label alignment="bottom-left">` into the input; range -100M to 100M. |
| WC: WithTypeOfText | `WithTypeOfText` | `number-input.stories.ts` | `type="text"` + `input-mode="decimal"` + `default-value="50"` + `locale="${locale}"`. |
| WC: WithTypeOfTextControlled | `WithTypeOfTextControlled` | `number-input.stories.ts` | `type="text"` controlled with an external button that sets the `value` property to `'50'`. |
| WC: WithTypeOfCustomValidation | `WithTypeOfCustomValidation` | `number-input.stories.ts` | Same custom Unicode-digit validator as the React version, expressed as an inline TypeScript helper passed via `.validate=${...}`. |
| WC: InvalidWithAILabel | `InvalidWithAILabel` | `number-input.stories.ts` | Hidden regression story (`tags: ['!dev', '!autodocs']`) — guards against bug #20117 where `invalid` + AI-label combined produced incorrect styling. |
| WC: WarnWithAILabel | `WarnWithAILabel` | `number-input.stories.ts` | Hidden regression story for #20117 — `warn` + AI-label combo. |
| WC: DisabledWithAILabel | `DisabledWithAILabel` | `number-input.stories.ts` | Hidden regression story for #20117 — `disabled` + AI-label combo. |
| WC: TypeTextTestScenarios | `TypeTextTestScenarios` | `number-input.stories.ts` | Hidden test-only story that flexes a dozen `type="text"` cases: read-only, disabled, invalid (value < min), allow-empty, decimal precision (15.01), large numbers with thousand separators, German `de-DE` locale, percentage `formatOptions`, currency `formatOptions`, at-min, at-max, plus AI-label slot. |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `NumberInput.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `NumberInput.stories.js`):

```jsx
import React, { useState } from 'react';
import { action } from 'storybook/actions';
import { NumberInput } from './';
import NumberInputSkeleton from './NumberInput.Skeleton';
import { validateNumberSeparators } from './NumberInput';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { useDocumentLang } from '../../internal/useDocumentLang';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './NumberInput.mdx';
```

**Default export** (Storybook meta):

```jsx
export default {
  title: 'Components/NumberInput',
  component: NumberInput,
  parameters: {
    subcomponents: {
      NumberInputSkeleton,
    },
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['id', 'defaultValue', 'light', 'translateWithId'],
    },
  },
};
```

**Shared argTypes + reusable props**:

```jsx
const sharedArgTypes = {
  min: { control: { type: 'number' } },
  max: { control: { type: 'number' } },
  step: { control: { type: 'number' } },
  disabled: { control: { type: 'boolean' } },
  invalid: { control: { type: 'boolean' } },
  invalidText: { control: { type: 'text' } },
  warn: { control: { type: 'boolean' } },
  warnText: { control: { type: 'text' } },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
  label: { control: { type: 'text' } },
  helperText: { control: { type: 'text' } },
};

const reusableProps = {
  min: -100000000,
  max: 100000000,
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  const [value, setValue] = React.useState(50);

  const handleChange = (event, { value }) => {
    setValue(value);
  };

  return (
    <NumberInput
      id="default-number-input"
      min={-100}
      max={100}
      value={value}
      label="NumberInput label"
      helperText="Optional helper text."
      onChange={handleChange}
      {...args}
    />
  );
};

Default.args = {
  step: 1,
  disabled: false,
  invalid: false,
  invalidText: `Number is not valid. Must be between -100 and 100`,
  helperText: 'Optional helper text.',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
};

Default.argTypes = { ...sharedArgTypes };
```

**Variant: withAILabel**

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
    <div style={{ width: 400 }}>
      <NumberInput
        min={reusableProps.min}
        max={reusableProps.max}
        value={50}
        label="NumberInput label"
        helperText="Optional helper text."
        invalidText="Number is not valid"
        decorator={aiLabel}
        {...args}
      />
    </div>
  );
};

withAILabel.argTypes = { ...sharedArgTypes };
```

**Variant: WithTypeOfText**

```jsx
export const WithTypeOfText = (args) => {
  const locale = useDocumentLang();

  return (
    <NumberInput
      id="default-number-input"
      min={reusableProps.min}
      max={reusableProps.max}
      inputMode="decimal"
      defaultValue={50}
      label="NumberInput label"
      helperText="Optional helper text."
      {...args}
      locale={locale}
    />
  );
};
WithTypeOfText.args = {
  step: 1,
  disabled: false,
  invalid: false,
  invalidText: `Number is not valid. Must be between ${reusableProps.min} and ${reusableProps.max}`,
  helperText: 'Optional helper text.',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
  type: 'text',
};
WithTypeOfText.argTypes = {
  locale: { control: { type: 'text' } },
  stepStartValue: { control: { type: 'number' } },
  formatOptions: { control: { type: 'object' } },
  ...sharedArgTypes,
};
```

**Variant: WithTypeOfTextControlled**

```jsx
export const WithTypeOfTextControlled = (args) => {
  const locale = useDocumentLang();
  const [value, setValue] = useState(NaN);

  return (
    <>
      <NumberInput
        id="default-number-input"
        min={reusableProps.min}
        max={reusableProps.max}
        type="text"
        inputMode="decimal"
        label="NumberInput label"
        helperText="Optional helper text."
        {...args}
        locale={locale}
        value={value}
        onChange={(event, state) => {
          setValue(state.value);
        }}
        onBlur={action('onBlur')}
      />
      <button
        type="button"
        onClick={() => {
          setValue(50);
        }}>
        set to 50
      </button>
    </>
  );
};
WithTypeOfTextControlled.args = {
  step: 1,
  disabled: false,
  invalid: false,
  invalidText: `Number is not valid. Must be between ${reusableProps.min} and ${reusableProps.max}`,
  helperText: 'Optional helper text.',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
  type: 'text',
};
WithTypeOfTextControlled.argTypes = {
  locale: { control: { type: 'text' } },
  formatOptions: { control: { type: 'object' } },
  ...sharedArgTypes,
};
```

**Variant: WithTypeOfCustomValidation**

```jsx
export const WithTypeOfCustomValidation = (args) => {
  const locale = useDocumentLang();
  const [value, setValue] = useState(NaN);

  return (
    <>
      <NumberInput
        id="default-number-input"
        type="text"
        inputMode="decimal"
        label="NumberInput label"
        helperText="Optional helper text."
        validate={validateNumberSeparators}
        {...args}
        locale={locale}
        value={value}
        allowEmpty
        onChange={(event, state) => {
          setValue(state.value);
        }}
      />
      <button
        type="button"
        onClick={() => {
          setValue(1000);
        }}>
        set to 1000
      </button>
    </>
  );
};
WithTypeOfCustomValidation.args = {
  step: 1,
  disabled: false,
  invalid: false,
  invalidText: `Number is not valid. Must be between ${reusableProps.min} and ${reusableProps.max}`,
  helperText: 'Optional helper text.',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
  size: 'md',
  type: 'text',
};
WithTypeOfCustomValidation.argTypes = {
  locale: { control: { type: 'text' } },
  formatOptions: { control: { type: 'object' } },
  ...sharedArgTypes,
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => {
  return <NumberInputSkeleton {...args} />;
};

Skeleton.argTypes = {
  size: {
    table: {
      defaultValue: { summary: '"md"' },
    },
  },
};

Skeleton.args = {
  size: 'md',
};

Skeleton.parameters = {
  controls: {
    include: ['size', 'hideLabel'],
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `number-input.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `number-input.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { prefix } from '../../globals/settings';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import { INPUT_SIZE } from '../text-input/text-input';
import './number-input';
import './number-input-skeleton';
import '../form/form-item';
import '../ai-label';
import '../icon-button';
```

**Reusable props + AI-label slot helpers** (used by `WithAILabel`, `Invalid/Warn/DisabledWithAILabel`):

```ts
const reusableProps = {
  min: -100000000,
  max: 100000000,
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

**Shared `args` + `argTypes`**:

```ts
const sizes = {
  [`Small size (${INPUT_SIZE.SMALL})`]: INPUT_SIZE.SMALL,
  [`Medium size (${INPUT_SIZE.MEDIUM})`]: INPUT_SIZE.MEDIUM,
  [`Large size (${INPUT_SIZE.LARGE})`]: INPUT_SIZE.LARGE,
};

const args = {
  allowEmpty: false,
  decrementButtonDescription: 'decrease number input',
  incrementButtonDescription: 'increase number input',
  disabled: false,
  helperText: 'Optional helper text',
  hideLabel: false,
  hideSteppers: false,
  invalid: false,
  invalidText: 'Number is not valid. Must be between -100 and 100',
  label: 'NumberInput label',
  readOnly: false,
  value: 50,
  warn: false,
  warnText: 'Warning text',
  min: -100,
  max: 100,
  step: 1,
  size: INPUT_SIZE.MEDIUM,
  type: 'number',
  locale: 'en-US',
  inputMode: 'decimal',
  stepStartValue: 0,
  disableWheel: false,
};
```

**Variant: Default**

```html
<cds-form-item>
  <cds-number-input
    ?allow-empty="${allowEmpty}"
    decrement-button-assistive-text="${ifDefined(decrementButtonDescription)}"
    increment-button-assistive-text="${ifDefined(incrementButtonDescription)}"
    helper-text="${ifDefined(helperText)}"
    ?hide-steppers="${hideSteppers}"
    ?hide-label="${hideLabel}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label="${ifDefined(label)}"
    ?readonly="${readOnly}"
    value="${ifDefined(value)}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}"
    ?disabled="${disabled}"
    min="${ifDefined(min)}"
    max="${ifDefined(max)}"
    size="${ifDefined(size)}"
    step="${ifDefined(step)}"
    type="${ifDefined(type)}"
    locale="${ifDefined(locale)}"
    input-mode="${ifDefined(inputMode)}"
    step-start-value="${ifDefined(stepStartValue)}"
    ?disable-wheel="${disableWheel}"
    @cds-number-input="${onInput}">
  </cds-number-input>
</cds-form-item>
```

**Variant: Skeleton**

```html
<cds-number-input-skeleton
  ?hide-label="${hideLabel}"
  size="${ifDefined(size)}">
</cds-number-input-skeleton>
```

**Variant: WithAILabel**

```html
<div style="width: 400px">
  <cds-number-input
    value="50"
    min="${reusableProps.min}"
    max="${reusableProps.max}"
    step="1"
    label="NumberInput label"
    helper-text="Optional helper text."
    invalid-text="Number is not valid"
    @cds-number-input="${onInput}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}
    </cds-ai-label>
  </cds-number-input>
</div>
```

**Variant: WithTypeOfText**

```html
<cds-form-item>
  <cds-number-input
    type="text"
    input-mode="decimal"
    allow-empty
    default-value="50"
    min="${reusableProps.min}"
    max="${reusableProps.max}"
    step="1"
    locale="${locale}"
    label="NumberInput label"
    invalid-text="Number is not valid. Must be between ${reusableProps.min} and ${reusableProps.max}"
    helper-text="Optional helper text. Uses ${locale} formatting."
    @cds-number-input="${onInput}">
  </cds-number-input>
</cds-form-item>
```

**Variant: WithTypeOfTextControlled**

```html
<cds-form-item>
  <cds-number-input
    id="controlled-number-input"
    type="text"
    input-mode="decimal"
    allow-empty
    min="0"
    max="100000000"
    step="1"
    locale="${locale}"
    label="NumberInput label"
    helper-text="Optional helper text. Uses ${locale} formatting."
    @cds-number-input="${onInput}">
  </cds-number-input>
</cds-form-item>
<button
  @click="${() => {
    const input = document.querySelector(
      '#controlled-number-input'
    ) as HTMLElement & { value: string };
    if (input) {
      input.value = '50';
    }
  }}">
  set to 50
</button>
```

**Variant: WithTypeOfCustomValidation** (the inline `validateNumberSeparators` helper supports Latin / Arabic-Indic / Devanagari / Bengali / Fullwidth / CJK digits)

```html
<cds-form-item>
  <cds-number-input
    id="custom-validation-number-input"
    type="text"
    input-mode="decimal"
    allow-empty
    min="${reusableProps.min}"
    invalid-text="Number is not valid. Must be between ${reusableProps.min} and ${reusableProps.max}"
    max="${reusableProps.max}"
    step="1"
    locale="${locale}"
    label="NumberInput label"
    helper-text="Optional helper text. Uses ${locale} formatting."
    .validate="${validateNumberSeparators}"
    @cds-number-input="${onInput}">
  </cds-number-input>
</cds-form-item>
<button
  @click="${() => {
    const input = document.querySelector(
      '#custom-validation-number-input'
    ) as HTMLElement & { value: string };
    if (input) {
      input.value = '1000';
    }
  }}">
  set to 1000
</button>
```

**Variant: InvalidWithAILabel** (hidden regression — `tags: ['!dev', '!autodocs']`, bug #20117)

```html
<div style="width: 400px">
  <cds-number-input
    value="50"
    min="0"
    max="100"
    step="1"
    label="NumberInput label"
    invalid
    invalid-text="invalid"
    @cds-number-input="${onInput}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}
    </cds-ai-label>
  </cds-number-input>
</div>
```

**Variant: WarnWithAILabel** (hidden regression for #20117)

```html
<div style="width: 400px">
  <cds-number-input
    value="50"
    min="0"
    max="100"
    step="1"
    label="NumberInput label"
    warn
    warn-text="warning"
    @cds-number-input="${onInput}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}
    </cds-ai-label>
  </cds-number-input>
</div>
```

**Variant: DisabledWithAILabel** (hidden regression for #20117)

```html
<div style="width: 400px">
  <cds-number-input
    value="50"
    min="0"
    max="100"
    step="1"
    label="Number input"
    helper-text="Optional helper text."
    disabled
    @cds-number-input="${onInput}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}
    </cds-ai-label>
  </cds-number-input>
</div>
```

**Variant: TypeTextTestScenarios** (hidden test-only — twelve `type="text"` cases stacked in a flex column: Basic, Read-only, Disabled, Invalid-below-min, Allow-empty, Decimal-precision (`15.01`), Large-numbers-with-separators, German-locale (`de-DE`, `123456` → `123.456`), Percentage-format (`.formatOptions={style: 'percent'}`), Currency-format (`.formatOptions={style: 'currency', currency: 'USD'}` → `$1,234.56`), At-max (increment button disabled), At-min (decrement button disabled), With-AI-Label-slot. Each is a `<cds-form-item><cds-number-input ...>` with its own `label`, `helper-text`, and `invalid-text`. The full source — including the inline `formatOptions` property bindings — is in the verbatim `number-input.stories.ts` linked at the top.)

## Plain HTML (derived from Web Components)

> Same markup as the WC section with lit-html bindings (`?attr=${value}`, `${ifDefined(...)}`) resolved to literal attributes using the shared default args. The element itself is still a custom element — register `@carbon/web-components/es/components/number-input/index.js` for it to upgrade.

**Variant: Default** (size `md`, value `50`, range `-100..100`, step `1`)

```html
<cds-form-item>
  <cds-number-input
    decrement-button-assistive-text="decrease number input"
    increment-button-assistive-text="increase number input"
    helper-text="Optional helper text"
    invalid-text="Number is not valid. Must be between -100 and 100"
    label="NumberInput label"
    value="50"
    warn-text="Warning text"
    min="-100"
    max="100"
    size="md"
    step="1"
    type="number"
    locale="en-US"
    input-mode="decimal"
    step-start-value="0">
  </cds-number-input>
</cds-form-item>
```

**Variant flags** (apply to the Default markup above by adding the noted attribute):

| Variant | Attributes to add / change | Visual effect |
|---|---|---|
| Disabled | `disabled` | Steppers grey out, input cursor → not-allowed, text → `text-disabled` |
| Invalid | `invalid` + `invalid-text="..."` | Bottom border → `support-error`, warning--filled icon at `inset-inline-end: 48px` (md), invalid-text below |
| Warn | `warn` + `warn-text="..."` | Warning--alt--filled icon (yellow triangle) at `inset-inline-end: 48px`, bottom border STAYS at `border-strong` (1px) |
| Read-only | `readonly` | Input bg → transparent, bottom border → `border-subtle`, steppers → `icon-disabled` + `pointer-events: none` |
| Hide steppers | `hide-steppers` | Stepper container removed; `padding-inline-end` collapses to `0` (rest) / `48px` (invalid+warn) |
| Sizes | `size="sm"` (32px) / `size="md"` (40px, default) / `size="lg"` (48px) | Input height + stepper button width track 1:1 with size |
| Skeleton | `<cds-number-input-skeleton size="md" hide-label></cds-number-input-skeleton>` | Shimmer block; native input is `display: none` |
| With AI label | Slot `<cds-ai-label alignment="bottom-left">…</cds-ai-label>` inside `<cds-number-input>` | Input gains `@include ai-gradient` bg, `padding-inline-end: 145px`, stepper hover shadow upgrades to `0 -1px 0 #4589ff inset` (`ai-border-strong`), rule dividers hide |

## Design Tokens (component-scoped, resolved from overview.md)

The Storybook source uses semantic tokens (`$field`, `$field-hover`, `$border-strong`, `$border-subtle`, `$focus`, `$icon-primary`, `$icon-disabled`, `$support-error`, `$support-warning`, `$text-primary`, `$text-helper`, `$text-disabled`, `$ai-border-strong`, `$black-100`). Below those are resolved to literal hex for the two canonical themes.

```css
[data-theme="white"] {
  /* Field background — same as text-input */
  --cds-number-input-background:        #f4f4f4; /* field-01 */
  --cds-number-input-background-hover:  #e8e8e8; /* field-hover-01 (stepper button hover only — input bg does NOT change on hover) */

  /* Bottom border (Carbon-distinctive treatment) */
  --cds-number-input-border-bottom:     #8d8d8d; /* border-strong-01 */
  --cds-number-input-border-bottom-w:   1px;
  --cds-number-input-border-bottom-w-focus: 2px;

  /* 1px vertical rule divider (between input + steppers, between the two stepper buttons) */
  --cds-number-input-rule-divider:      #e0e0e0; /* border-subtle-00 */
  --cds-number-input-rule-divider-w:    1px;
  --cds-number-input-rule-divider-h:    16px;

  /* Focus ring */
  --cds-number-input-focus:             #0f62fe; /* focus */
  --cds-number-input-focus-inset:       #ffffff; /* focus-inset */

  /* Stepper buttons (hover inset shadow, active state) */
  --cds-number-input-stepper-icon:      #161616; /* icon-primary */
  --cds-number-input-stepper-icon-disabled: rgba(22, 22, 22, 0.25); /* icon-disabled */
  --cds-number-input-stepper-hover-bg:  #e8e8e8; /* field-hover-01 */
  --cds-number-input-stepper-hover-shadow: #8d8d8d; /* border-strong-01 — used as 0 -1px 0 inset */

  /* Text */
  --cds-number-input-color:             #161616; /* text-primary — typed value */
  --cds-number-input-label:             #525252; /* text-secondary */
  --cds-number-input-helper:            #6f6f6f; /* text-helper */
  --cds-number-input-placeholder:       #a8a8a8; /* text-placeholder */

  /* Validation */
  --cds-number-input-error:             #da1e28; /* support-error */
  --cds-number-input-warning:           #f1c21b; /* support-warning */
  --cds-number-input-warning-inner:     #000000; /* black-100 — inner triangle path of the warning--filled icon */
  --cds-number-input-error-text:        #da1e28; /* text-error */

  /* Disabled */
  --cds-number-input-disabled-color:    rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-number-input-disabled-bg:       #f4f4f4;                /* field-01 unchanged */
  --cds-number-input-rule-divider-disabled: rgba(22, 22, 22, 0.25); /* icon-disabled — divider darkens behind disabled stepper */

  /* AI-label decorated — input gains gradient + thicker shadow on stepper hover */
  --cds-number-input-ai-stepper-hover-shadow: #4589ff; /* ai-border-strong */
}

[data-theme="g100"],
.dark {
  --cds-number-input-background:        #262626; /* field-01 (G100) */
  --cds-number-input-background-hover:  #333333; /* field-hover-01 (G100) */

  --cds-number-input-border-bottom:     #6f6f6f; /* border-strong-01 (G100) */
  --cds-number-input-border-bottom-w:   1px;
  --cds-number-input-border-bottom-w-focus: 2px;

  --cds-number-input-rule-divider:      #393939; /* border-subtle-00 (G100) */
  --cds-number-input-rule-divider-w:    1px;
  --cds-number-input-rule-divider-h:    16px;

  --cds-number-input-focus:             #ffffff; /* focus inverts on dark */
  --cds-number-input-focus-inset:       #161616; /* focus-inset */

  --cds-number-input-stepper-icon:      #f4f4f4; /* icon-primary */
  --cds-number-input-stepper-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-number-input-stepper-hover-bg:  #333333; /* field-hover-01 */
  --cds-number-input-stepper-hover-shadow: #6f6f6f;

  --cds-number-input-color:             #f4f4f4; /* text-primary (G100) */
  --cds-number-input-label:             #c6c6c6; /* text-secondary (G100) */
  --cds-number-input-helper:            #c6c6c6; /* text-helper (G100) */
  --cds-number-input-placeholder:       #6f6f6f; /* text-placeholder (G100) */

  --cds-number-input-error:             #fa4d56; /* support-error (G100) */
  --cds-number-input-warning:           #f1c21b;
  --cds-number-input-warning-inner:     #000000;
  --cds-number-input-error-text:        #ff8389; /* text-error (G100) */

  --cds-number-input-disabled-color:    rgba(244, 244, 244, 0.25);
  --cds-number-input-disabled-bg:       #262626;
  --cds-number-input-rule-divider-disabled: rgba(244, 244, 244, 0.25);

  --cds-number-input-ai-stepper-hover-shadow: #78a9ff; /* ai-border-strong (G100) */
}

/* Sharp corners — Carbon's default. NEVER round a number input. */
.cds--number,
cds-number-input {
  border-radius: 0;
}
```

## States Reference (from `_number-input.scss`)

> Pulled from `packages/styles/scss/components/number-input/_number-input.scss` (verbatim quoted SCSS lines below the table). All hex values resolved per theme.

| State | Background | Text color | Bottom border | Stepper button bg | Rule divider | Other |
|---|---|---|---|---|---|---|
| Rest (White) | `#f4f4f4` (`field-01`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong`) | transparent | `#e0e0e0` (`border-subtle-00`) | stepper icon `#161616`; padding-inline `16px / 48px` |
| Rest (G100) | `#262626` | `#f4f4f4` | `1px solid #6f6f6f` | transparent | `#393939` | stepper icon `#f4f4f4` |
| Hover on stepper button (White) | (input bg unchanged) | `#161616` | `1px solid #8d8d8d` | `#e8e8e8` (`field-hover-01`) | hidden (transparent) on hovered side | `box-shadow: 0 -1px 0 #8d8d8d inset` on the hovered button |
| Hover on stepper button (G100) | (unchanged) | `#f4f4f4` | `1px solid #6f6f6f` | `#333333` | hidden | `box-shadow: 0 -1px 0 #6f6f6f inset` |
| Focus on input (White) | `#f4f4f4` | `#161616` | `2px solid #0f62fe` (`focus`) | transparent | transparent (hidden behind focus outline) | `outline: 2px solid #0f62fe; outline-offset: -2px`. Stepper buttons gain `border-width: 2px 0; border-style: solid; border-color: #0f62fe` (top + bottom 2px focus rule). |
| Focus on input (G100) | `#262626` | `#f4f4f4` | `2px solid #ffffff` | transparent | transparent | `outline: 2px solid #ffffff; outline-offset: -2px`; stepper top/bottom rule `2px solid #ffffff`. |
| Focus on stepper button | (input bg) | (text-primary) | (rest bottom border) | transparent | hidden | `outline: 2px solid var(--cds-focus); outline-offset: -2px`; on `:last-of-type:hover` the button gets `box-shadow: -4px 0 0 -2px var(--cds-focus) inset` (left-edge separator). |
| Invalid (White) | `#f4f4f4` | `#161616` | `2px solid #da1e28` (`support-error`) | transparent | `#e0e0e0` (kept visible since `border-block-end-color: $support-error` is applied to `__control-btn` via the `[data-invalid]` selector) | `padding-inline-end: 128px` (md). Invalid icon (`warning--filled`, 16px, `fill: #da1e28`) at `inset-inline-end: 48px` (md). On stepper hover (when not focused): `box-shadow: -4px 0 0 -2px #da1e28 inset` + 2px top/bottom border in `#da1e28`. Invalid-text below input: `#da1e28` (`text-error`). |
| Invalid (G100) | `#262626` | `#f4f4f4` | `2px solid #fa4d56` | transparent | `#393939` | invalid icon `#fa4d56`; invalid-text `#ff8389` |
| Warn (White) | `#f4f4f4` | `#161616` | `1px solid #8d8d8d` | transparent | `#e0e0e0` | `padding-inline-end: 128px` (md). Warning icon (`warning--alt--filled`, 16px) — outer triangle `#f1c21b` (`support-warning`), inner exclamation path `fill: #000000; opacity: 1`. |
| Warn (G100) | `#262626` | `#f4f4f4` | `1px solid #6f6f6f` | transparent | `#393939` | same icon coloring; `warn-text` uses `#c6c6c6` (`text-secondary`) |
| Read-only (White) | `transparent` | `#161616` | `1px solid #e0e0e0` (`border-subtle`) | transparent (no hover bg) | `#e0e0e0` (only visible on `__controls:hover` and never on `:first-of-type`) | Stepper icon color forced to `#a8a8a8` (`icon-disabled` — `pointer-events: none`); stepper hover bg suppressed; stepper-focus outline removed. |
| Read-only (G100) | `transparent` | `#f4f4f4` | `1px solid #393939` | transparent | `#393939` | stepper icon `rgba(244, 244, 244, 0.25)`. |
| Disabled (White) | `#f4f4f4` (unchanged) | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | `1px solid #8d8d8d` (rest border kept) | not-allowed (no hover) | first-of-type → `transparent`; others → `rgba(22, 22, 22, 0.25)` (`icon-disabled`) | Stepper SVG `fill: rgba(22, 22, 22, 0.25)`; `cursor: not-allowed`; `pointer-events: none`. |
| Disabled (G100) | `#262626` | `rgba(244, 244, 244, 0.25)` | `1px solid #6f6f6f` | — | `rgba(244, 244, 244, 0.25)` | — |
| With AI-label decorator (rest, White) | `#f4f4f4` + `@include ai-gradient` (aiAura linear gradient overlay) | `#161616` | `1px solid #8d8d8d` | transparent | hidden (`__rule-divider { display: none; }` inside `--decorator` wrapper) | `padding-inline-end: 145px`. Stepper hover shadow upgrades to `box-shadow: 0 -1px 0 #4589ff inset` (`ai-border-strong`). |
| With AI-label decorator (rest, G100) | `#262626` + ai-gradient | `#f4f4f4` | `1px solid #6f6f6f` | transparent | hidden | shadow uses `#78a9ff` |
| Hide-steppers (rest) | (rest bg) | (rest text) | (rest border) | n/a | n/a | `padding-inline-end: 0` (rest); `48px` (invalid / warn); invalid icon `inset-inline-end: 16px`. |
| Skeleton | `#e5e5e5` shimmer (White) / `#393939` (G100) | n/a | none | n/a | n/a | Block-size: `32px` (sm) / `40px` (md) / `48px` (lg) — set via `$spacing-07` / `$spacing-08` / `$spacing-09`. Native `<input>` is `display: none`. |

### Verbatim SCSS — base input

```scss
.#{$prefix}--number input[type='number'],
.#{$prefix}--number input[type='text'] {
  @include type-style('body-compact-01');
  @include focus-outline('reset');

  display: inline-flex;
  box-sizing: border-box;
  border: 0;
  border-radius: 0;

  // Firefox: Hide spinner (up and down buttons)
  -moz-appearance: textfield;
  appearance: textfield;
  background-color: $field;
  block-size: convert.to-rem(40px);
  border-block-end: convert.to-rem(1px) solid $border-strong;
  color: $text-primary;
  font-family: font-family('sans');
  font-weight: 400;
  inline-size: 100%;
  min-inline-size: 9.375rem;
  padding-inline: $spacing-05 $spacing-12;
  transition:
    background-color $duration-fast-01 motion(standard, productive),
    outline $duration-fast-01 motion(standard, productive);

  &:focus {
    @include focus-outline('outline');
  }

  &:disabled ~ .#{$prefix}--number__controls {
    cursor: not-allowed;
    pointer-events: none;
  }

  &:disabled ~ .#{$prefix}--number__controls svg {
    fill: $icon-disabled;
  }
}
```

### Verbatim SCSS — stepper controls + rule divider

```scss
.#{$prefix}--number__controls {
  position: absolute;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  block-size: 100%;
  inline-size: convert.to-rem(80px); /* md container = 80px (two 40px halves) */
  inset-block-start: 50%;
  inset-inline-end: 0;
  transform: translateY(-50%);
}

.#{$prefix}--number__control-btn {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  block-size: 100%;
  color: $icon-primary;

  svg { fill: currentColor; }

  &:focus {
    @include focus-outline;
    color: $icon-primary;
    outline-offset: -2px;
    outline-width: 2px;
  }

  &:hover {
    background-color: $field-hover;
    box-shadow: 0 -1px 0 $border-strong inset;
    color: $icon-primary;
    cursor: pointer;
  }

  &:disabled {
    border-block-end-color: transparent;
    color: $text-disabled;
    cursor: not-allowed;
  }
}

.#{$prefix}--number__control-btn.down-icon { order: 1; }
.#{$prefix}--number__control-btn.up-icon   { order: 2; }

.#{$prefix}--number__rule-divider {
  position: absolute;
  z-index: z('overlay');
  background-color: $border-subtle;
  block-size: convert.to-rem(16px);
  inline-size: convert.to-rem(1px);

  &:first-of-type { order: 0; }
}
```

### Verbatim SCSS — sizes, invalid/focus stepper rules, read-only, no-steppers, AI decorator, invalid icon, skeleton

```scss
/* Sizes (block-size of input + inline-size of controls container + per-button width) */
.#{$prefix}--number--lg input[type='number'],
.#{$prefix}--number--lg input[type='text']        { block-size: convert.to-rem(48px); }
.#{$prefix}--number--lg .#{$prefix}--number__controls   { inline-size: $spacing-12; /* 48px */ }
.#{$prefix}--number--lg .#{$prefix}--number__control-btn { inline-size: convert.to-rem(48px); }

.#{$prefix}--number--sm input[type='number'],
.#{$prefix}--number--sm input[type='text']        { block-size: convert.to-rem(32px); }
.#{$prefix}--number--sm .#{$prefix}--number__controls   { inline-size: convert.to-rem(64px); }
.#{$prefix}--number--sm .#{$prefix}--number__control-btn { inline-size: convert.to-rem(32px); }

/* Invalid: stepper bottom-border → support-error */
.#{$prefix}--number input[data-invalid] ~ .#{$prefix}--number__controls .#{$prefix}--number__control-btn {
  border-block-end-color: $support-error;
}

/* Focus on input: steppers get 2px top + bottom focus rule */
.#{$prefix}--number input:focus ~ .#{$prefix}--number__controls .#{$prefix}--number__control-btn {
  border-width: 2px 0; border-style: solid; border-color: $focus;
  box-shadow: none; outline-offset: -2px;
}

/* Focus + last-of-type:hover → -4px focus inset on left edge */
.#{$prefix}--number input:focus ~ .#{$prefix}--number__controls .#{$prefix}--number__control-btn:last-of-type:hover {
  box-shadow: -4px 0 0 -2px $focus inset;
}

/* Read-only */
.#{$prefix}--number--readonly input[type='number'],
.#{$prefix}--number--readonly input[type='text'] {
  background: transparent; border-block-end-color: $border-subtle;
}
.#{$prefix}--number--readonly .#{$prefix}--number__control-btn {
  color: $icon-disabled; pointer-events: none;
  &:hover { background-color: transparent; cursor: pointer; }
}

/* Hide steppers */
.#{$prefix}--number--nosteppers input { padding-inline-end: 0; }
.#{$prefix}--number--nosteppers input[data-invalid],
.#{$prefix}--number--nosteppers .#{$prefix}--number__input-wrapper--warning input {
  padding-inline-end: convert.to-rem(48px);
}

/* AI-label decorator: gradient bg + 145px right pad + ai-border-strong stepper hover shadow */
.#{$prefix}--number__input-wrapper--decorator input:has(~ .#{$prefix}--number__input-inner-wrapper--decorator .#{$prefix}--ai-label):not(:has(~ .#{$prefix}--number__input-inner-wrapper--decorator .#{$prefix}--ai-label--revert)) {
  @include ai-gradient;
  padding-inline-end: convert.to-rem(145px);
}
.#{$prefix}--number__input-wrapper--decorator .#{$prefix}--number__control-btn:hover,
.#{$prefix}--number__input-wrapper--slug      .#{$prefix}--number__control-btn:hover {
  box-shadow: 0 -1px 0 $ai-border-strong inset;
}

/* Invalid icon position (per size) */
.#{$prefix}--number__invalid {
  position: absolute; fill: $support-error; inset-inline-end: $spacing-12; /* md = 48px */
}
.#{$prefix}--number--lg .#{$prefix}--number__invalid { inset-inline-end: convert.to-rem(112px); }
.#{$prefix}--number--sm .#{$prefix}--number__invalid { inset-inline-end: convert.to-rem(80px); }
.#{$prefix}--number__invalid--warning { fill: $support-warning; }
.#{$prefix}--number__invalid--warning path:first-of-type { fill: $black-100; opacity: 1; }

/* Skeleton */
.#{$prefix}--number.#{$prefix}--skeleton {
  @include skeleton; inline-size: 100%;
  input { display: none; }
}
.#{$prefix}--number.#{$prefix}--skeleton.#{$prefix}--number--sm { block-size: $spacing-07; /* 32px */ }
.#{$prefix}--number.#{$prefix}--skeleton.#{$prefix}--number--md { block-size: $spacing-08; /* 40px */ }
.#{$prefix}--number.#{$prefix}--skeleton.#{$prefix}--number--lg { block-size: $spacing-09; /* 48px */ }
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted from `_number-input.scss`):

```css
.cds--number input[type='number'],
.cds--number input[type='text'],
cds-number-input::part(input) {
  /* Bottom border + outline fade on hover/focus state changes */
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    outline           var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Stepper buttons inherit the same productive-standard easing via .cds--number__control-btn — Carbon does not declare a separate transition on them; the focus / hover style change is instantaneous to keep tactile feedback crisp. */

/* Skeleton shimmer (shared with text-input) */
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
.cds--skeleton.cds--number { animation: skeleton 3s cubic-bezier(0.4, 0.14, 0.3, 1) infinite; }

@media (prefers-reduced-motion: reduce) {
  .cds--number input[type='number'],
  .cds--number input[type='text'],
  cds-number-input::part(input) { transition: none; }
  .cds--skeleton.cds--number { animation: none; }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`

## Accessibility (from Carbon's docs + source)

- **Semantic element:** the underlying form control is a native `<input type="number">` (or `type="text"` with `inputMode="decimal"` + a custom validator for locale-aware parsing). Carbon's `<cds-number-input>` is a custom element shadow-rooted around that native input — screen readers see the native control.
- **Label association:** Carbon ALWAYS renders a `<label>` element wired by `id` / `for` (React: `label` prop; WC: `label` attribute). The label sits above the input, NOT as a placeholder. `hide-label` keeps the label in the accessibility tree but visually hides it (`cds--visually-hidden`).
- **Helper text:** rendered in a sibling `<div class="cds--form__helper-text">` wired via `aria-describedby` on the input.
- **Error / warn text:** when `invalid` / `warn` is set, the text moves into `<div class="cds--form-requirement" role="alert">` and gains `id` linkage via `aria-describedby`. The icon (`warning--filled` / `warning--alt--filled`) is `aria-hidden="true"`; the message text already conveys state.
- **Stepper buttons:** rendered as `<button type="button">`. Each receives an accessible name from `decrement-button-assistive-text` / `increment-button-assistive-text` (defaults: `"decrease number input"` / `"increase number input"`) — keep them descriptive, not generic. Buttons are inside the input wrapper but separate tab-stops.
- **Disabled steppers at boundary:** when `value === min`, the decrement button gets `disabled` (icon → `--cds-icon-disabled`, `cursor: not-allowed`, `pointer-events: none` on the parent `__controls`). Same for `value === max` on increment. The native input remains focusable.
- **Read-only:** sets `readonly` on the native input — screen readers announce "read only". Steppers become non-interactive (`pointer-events: none`, icon → `--cds-icon-disabled`) but keep their tab-stop hidden via `pointer-events: none` on the controls container.
- **Disabled:** sets `disabled` on the native input — removes from tab order and announces "dimmed / disabled". Steppers become non-interactive via the descendant `~ .cds--number__controls { pointer-events: none; }` rule.
- **Wheel scrolling:** by default the browser increments/decrements the value when the wheel is scrolled over a focused `<input type="number">`. Set `?disable-wheel="${true}"` (WC) / `disableWheel` (React) on data-entry forms where accidental wheel scroll would corrupt values (e.g., currency, quantities).
- **Keyboard:**
  - `Tab` / `Shift+Tab` — focus the input, then decrement, then increment, then move on.
  - `Up Arrow` / `Down Arrow` (when input is focused) — increment / decrement by `step`. Native browser behavior; Carbon does NOT intercept.
  - `Page Up` / `Page Down` — increment / decrement by `step * 10` in some browsers (native behavior).
  - `Home` / `End` — jump to `min` / `max` if defined (native behavior).
  - `Enter` inside a `<form>` submits, per the platform default.
  - On stepper buttons: `Space` / `Enter` triggers the corresponding stepping action.
- **Focus management:** Carbon ships a `:focus-visible` rule that combines a `2px solid var(--cds-focus)` outline with `outline-offset: -2px`. The bottom border ALSO grows from `1px` → `2px` so users in high-contrast mode still see focus indication if the outline is suppressed. Stepper buttons gain a top + bottom 2px focus rule (`border-width: 2px 0`) — DO NOT remove this; it's the visual analogue of the bottom-border focus signal on the input itself.
- **High-contrast (Windows HCM):** `__control-btn:hover, :focus { @include high-contrast-mode('focus'); }` and `__control-btn { @include high-contrast-mode('outline'); }` ensure stepper boundaries remain visible in forced-color mode.
- **Touch target:** medium (`md`, 40px) clears the WCAG 2.1 Level AAA 44×44 target only at `lg` (48px). For touch-first UI, prefer `size="lg"`. Each stepper button at md is `40px × 40px` — at the AA edge.
- **Color contrast:** placeholder text `#a8a8a8` on `#f4f4f4` (White theme) is 2.4:1 — below WCAG AA for body text. Carbon documents this and explicitly forbids using placeholder text to communicate required information; the visible label is what carries semantics.
- **Locale-aware parsing (`type="text"`):** when set with `locale="${BCP47}"` and a `validate` function, the underlying input still passes the raw character stream to assistive tech. The `validateNumberSeparators` helper supports digit ranges Latin (U+0030..0039), Arabic-Indic (U+0660..0669), Devanagari (U+0966..096F), Bengali (U+09E6..09EF), Fullwidth (U+FF10..FF19), and CJK ideographic (一二三四五六七八九〇零) — for global forms always pair with a localized error message.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) on every input + stepper button | Don't round the corners — that's Material / Apple, not Carbon |
| Apply the bottom-only border (`border-block-end: 1px solid border-strong`) and KEEP top / left / right borderless | Don't draw a 4-sided box — that's the v9-and-earlier Carbon style |
| Render the `<label>` as a SEPARATE element above the input | Don't use a floating-label / Material-style placeholder substitute — Carbon labels are static |
| Place the increment / decrement buttons in a 2-button stack on the right (`order: 1` for down, `order: 2` for up — meaning down ABOVE up by source order, but visually side-by-side via flex-row) | Don't reorder them; the down/up DOM ordering is what makes the rule-divider `:first-of-type` selectors target the correct gap |
| Draw a 1px × 16px `border-subtle` rule divider between input and steppers AND between the two stepper buttons | Don't draw a full-height divider — Carbon keeps it short (16px) and centered |
| Use `chevron-up` (16px) on the increment button and `chevron-down` (16px) on the decrement button, both sharing `currentColor` (`icon-primary`) | Don't substitute `+` / `−` glyphs or `caret-up` / `caret-down` — Carbon uses the chevron family |
| Pass `decrement-button-assistive-text` / `increment-button-assistive-text` for screen readers | Don't ship steppers with `aria-label="up"` / `"down"` — describe the action ("increase number input") |
| Use `?disable-wheel="${true}"` (WC) / `disableWheel` (React) on currency, quantity, and other forms where accidental wheel scroll would corrupt the value | Don't leave wheel scroll enabled by default on long forms — users routinely scroll past inputs and bump values without noticing |
| Use `type="text"` + `inputMode="decimal"` + `locale` + `validate` for international apps that need group/decimal separator localization | Don't use raw `type="number"` for currency — it does not respect locale formatting and rejects valid characters like `,` in `de-DE` |
| Disable the increment button when `value === max`, decrement when `value === min` | Don't allow steppers to push past `min` / `max` without re-clamping the value |
| Use `<NumberInput>` inside `<FluidForm>` for the Fluid variant (label moves INSIDE the field) | Don't add `fluid` ad-hoc on a single input — Fluid only renders correctly inside FluidForm context |
| Use `cds--*` class names from the source and `<cds-number-input>` element name | Don't substitute generic `<input type="number">` if the project is using Carbon — the styles, focus ring, stepper buttons, and ARIA wiring all live in the component |
| Wrap pages in `[data-theme="white"]` or `[data-theme="g100"]` so token values resolve correctly | Don't define your own `--cds-*` overrides — let the theme cascade do its job |
| Pad to `128px` end (md) on invalid / warn so the icon clears the steppers | Don't let the invalid icon overlap the stepper buttons — the SCSS already handles the padding offset |
| Use `size="lg"` (48px) on touch-first surfaces | Don't ship `size="sm"` (32px) on mobile — both the input AND its 32px stepper buttons fall below the WCAG touch-target threshold |
| Use the `<NumberInputSkeleton>` block while data loads (matches the input height per size) | Don't show an empty input or a generic "Loading..." text — the shimmer signals shape AND state |
