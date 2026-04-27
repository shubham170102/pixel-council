---
name: slider
description: Carbon Slider — single-thumb and two-thumb range input rendered as a 2px track with a 14px circular thumb and an optional 40×64px paired number input; embeds verbatim Storybook source for Default, SliderWithHiddenInputs, SliderWithCustomValueLabel, ControlledSlider, _WithLayer, ControlledSliderWithLayer, TwoHandleSlider, TwoHandleSliderWithHiddenInputs, Skeleton, and TwoHandleSkeleton variants
metadata:
  tags: slider, range, input, form, value-selection, two-handle, ibm, carbon, react, web-components
---

# Slider -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Slider.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Slider/Slider.stories.js)
> - **WC story:** [`slider.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/slider/slider.stories.ts)
> - **SCSS:** [`_slider.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/slider/_slider.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-slider--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-slider--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/slider/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Track height | `2px` (`block-size: convert.to-rem(2px)` in `_slider.scss` L62, L82) |
| Track inline-size (slider) | `100%` of container, `min-inline-size: 200px`, `max-inline-size: 640px` (L43-45) |
| Track end-cap | `2 × 4px` rectangle stub at the centre tick of the track (`::before` pseudo, L67-77) |
| Filled-track height | `2px` — same as the unfilled track, painted from `0%` → thumb position (L79-88) |
| Thumb size | `14px × 14px` circle (`.cds--slider__thumb-wrapper` L90-95) |
| Thumb hover scale | `1.4286` → effective `20px × 20px` (`20 / 14 = 1.4286`, L201-204) |
| Thumb shape | Perfect circle (`border-radius: 50%`, L189) |
| Two-handle thumb wrapper | `24 × 16px` (block × inline) — wider hit area for the lower/upper handles (L106-107) |
| Number-input height | `40px` (`block-size: convert.to-rem(40px)`, L315) |
| Number-input width | `64px` (`inline-size: convert.to-rem(64px)`, L316) — `96px` (`6rem`) when invalid/warn (L333-334) |
| Container gap | `16px` (`gap: 1rem` between range-label / track / range-label / number-input, L35) |
| Container padding (slider only) | `16px 0` (`padding: $spacing-05 0` on `.cds--slider`, L41) |
| Range label font | IBM Plex Sans, `body-compact-01` — 14px / 18px line / 0.16px / weight 400, `color: text-primary` (L52-57) |
| Track unfilled color | `var(--cds-border-subtle)` → `border-subtle-01` = `#c6c6c6` (White) / `#525252` (G100) (L61, L70) |
| Track filled color (rest) | `var(--cds-layer-selected-inverse)` = `#161616` (White) / `#f4f4f4` (G100) (L81) |
| Track filled color (focus) | `var(--cds-border-interactive)` = `#0f62fe` (White) / `#4589ff` (G100) (L324-328) |
| Thumb color (rest) | `var(--cds-layer-selected-inverse)` = `#161616` (White) / `#f4f4f4` (G100) (L190) |
| Thumb color (focus) | `var(--cds-interactive)` = `#0f62fe` (White) / `#4589ff` (G100) (L207) |
| Focus ring | `inset 0 0 0 2px var(--cds-interactive), inset 0 0 0 3px var(--cds-layer)` — double-ring inside the scaled thumb (L208-211) |
| Animation duration | `110ms` `cubic-bezier(0.2, 0, 0.38, 0.9)` — `$duration-fast-02` × `motion(standard, productive)` — applied to thumb `transform` + `background` + `box-shadow` AND filled-track `background` (L87, L196-199) |
| ARIA pattern | `<div role="slider" aria-valuemin aria-valuemax aria-valuenow aria-labelledby tabindex="0">` — Carbon's `__thumb` is a focusable div, NOT an `<input type="range">`. The hidden `<input>` (L299-301) is the form-submission shadow. |
| React import | `import { Slider, SliderSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/slider/index.js';` |

> **Note on the thumb shape vs the brief:** the planning brief mentions a "4px white inner ring on hover." The verbatim Carbon source (`_slider.scss` L201-204) only **scales** the thumb on `:hover` (no ring) — the white double-ring is added on `:focus` and `:active` (L206-218) via `box-shadow: inset 0 0 0 2px $interactive, inset 0 0 0 3px $layer`. Carbon's source values are the truth.

> **Note on the value tooltip:** the brief mentions "tick marks (optional) at intervals." Carbon's slider does NOT render intermediate tick marks — only the centre stub (the `__track::before` rectangle at `inset-inline-start: 50%`, L67-77) which marks the visual midpoint. If you need value ticks, layer a `cds-popover` above the thumb (Carbon does this via `formatLabel` when `hideTextInput` is true — see the `SliderWithCustomValueLabel` variant below).

## Variants (from Storybook story exports)

Every story export found in `Slider.stories.js` (React) and `slider.stories.ts` (WC):

| Variant | Story export (React) | Story export (WC) | Purpose |
|---|---|---|---|
| Default | `Default` | `Default` | Single-handle slider, `min=0 max=100 step=5`, paired with a 64×40 number input |
| Hidden inputs | `SliderWithHiddenInputs` | `SliderWithHiddenInputs` | Same as Default but `hideTextInput`, leaving only the track + thumb |
| Custom value label | `SliderWithCustomValueLabel` | `SliderWithCustomValueLabel` | Replaces the number input with a tooltip that calls `formatLabel(value)` to render `Low`/`Medium`/`High` based on position |
| Controlled | `ControlledSlider` | `ControlledSlider` | Demonstrates programmatic value updates via a "randomize value" button + an `onChange` handler |
| With layer | `_WithLayer` | `WithLayer` | Wraps the slider in a `WithLayer` decorator so the track + thumb pick up the next layer tier (gray-10 in White, gray-90 in G100) |
| Controlled + layer | `ControlledSliderWithLayer` | `ControlledSliderWithLayer` | Combines controlled state with the layer decorator — multiple sliders updated simultaneously |
| Two-handle | `TwoHandleSlider` | `TwoHandleSlider` | Range slider with `value` (lower) + `unstable_valueUpper` (upper), paired with two number inputs |
| Two-handle hidden inputs | `TwoHandleSliderWithHiddenInputs` | `TwoHandleSliderWithHiddenInputs` | Same as Two-handle but `hideTextInput` |
| Skeleton | `Skeleton` | `Skeleton` | Loading placeholder — `SliderSkeleton` / `<cds-slider-skeleton>` |
| Two-handle skeleton | `TwoHandleSkeleton` | `TwoHandleSkeleton` | Loading placeholder for the range variant — `<SliderSkeleton twoHandles />` |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Slider.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + story metadata** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useState } from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import { Slider, SliderSkeleton } from '.';
import mdx from './Slider.mdx';

export default {
  title: 'Components/Slider',
  component: Slider,
  subcomponents: {
    SliderSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <Slider
      {...args}
      labelText={`Slider (must be an increment of ${args.step})`}
    />
  );
};

Default.parameters = {
  controls: {
    exclude: ['light', 'formatLabel', 'labelText'],
  },
};

Default.argTypes = {
  ariaLabelInput: {
    control: { type: 'text' },
  },
  unstable_ariaLabelInputUpper: {
    control: { type: 'text' },
  },
  disabled: {
    control: {
      control: {
        type: 'boolean',
      },
    },
  },
  hideTextInput: {
    control: {
      type: 'boolean',
    },
  },
  invalid: {
    control: {
      type: 'boolean',
    },
  },
  invalidText: {
    control: {
      type: 'text',
    },
  },
  min: {
    control: { type: 'number' },
  },
  max: {
    control: { type: 'number' },
  },
  name: {
    control: { type: 'text' },
  },
  unstable_nameUpper: {
    control: { type: 'text' },
  },
  readOnly: {
    control: {
      type: 'boolean',
    },
  },
  required: {
    control: {
      type: 'boolean',
    },
  },
  step: {
    control: { type: 'number' },
  },
  stepMultiplier: {
    control: { type: 'number' },
  },
  value: {
    control: { type: 'number' },
  },
  unstable_valueUpper: {
    control: { type: 'number' },
  },
  warn: {
    control: {
      type: 'boolean',
    },
  },
  warnText: {
    control: {
      type: 'text',
    },
  },
};

Default.args = {
  ariaLabelInput: 'Lower bound',
  unstable_ariaLabelInputUpper: 'Upper bound',
  disabled: false,
  hideTextInput: false,
  invalid: false,
  invalidText: 'Invalid message goes here',
  min: 0,
  max: 100,
  readOnly: false,
  required: false,
  step: 5,
  stepMultiplier: 5,
  value: 50,
  unstable_valueUpper: undefined,
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: SliderWithHiddenInputs**

```jsx
export const SliderWithHiddenInputs = () => {
  return (
    <Slider
      labelText="Slider label"
      value={50}
      min={0}
      max={100}
      step={1}
      stepMultiplier={10}
      noValidate
      invalidText="Invalid message goes here"
      hideTextInput={true}
    />
  );
};
```

**Variant: SliderWithCustomValueLabel**

```jsx
export const SliderWithCustomValueLabel = () => {
  return (
    <Slider
      labelText="Slider label with low/medium/high"
      value={50}
      min={0}
      max={100}
      stepMultiplier={50}
      step={1}
      noValidate
      hideTextInput
      formatLabel={(val) => {
        if (val < 25) {
          return 'Low';
        } else if (val > 75) {
          return 'High';
        }
        return 'Medium';
      }}
    />
  );
};
```

**Variant: ControlledSlider**

```jsx
export const ControlledSlider = () => {
  const [val, setVal] = React.useState(87);
  return (
    <>
      <button
        type="button"
        onClick={() => setVal(Math.round(Math.random() * 100))}>
        randomize value
      </button>
      <Slider
        labelText="Slider label"
        max={100}
        min={0}
        value={val}
        onChange={({ value }) => setVal(value)}
      />
      <h1>{val}</h1>
    </>
  );
};
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = () => (
  <WithLayer>
    <Slider
      labelText="Slider label"
      value={50}
      min={0}
      max={100}
      step={1}
      stepMultiplier={10}
      noValidate
    />
  </WithLayer>
);
```

**Variant: ControlledSliderWithLayer**

```jsx
export const ControlledSliderWithLayer = () => {
  const [val, setVal] = useState(87);
  return (
    <WithLayer>
      <button
        type="button"
        onClick={() => setVal(Math.round(Math.random() * 100))}>
        randomize value
      </button>
      <Slider
        labelText="Slider label"
        max={100}
        min={0}
        value={val}
        onChange={({ value }) => setVal(value)}
      />
      <h1>{val}</h1>
    </WithLayer>
  );
};
```

**Variant: TwoHandleSlider**

```jsx
export const TwoHandleSlider = () => {
  return (
    <Slider
      ariaLabelInput="Lower bound"
      unstable_ariaLabelInputUpper="Upper bound"
      labelText="Slider label"
      value={10}
      unstable_valueUpper={90}
      min={0}
      max={100}
      step={1}
      stepMultiplier={10}
      invalidText="Invalid message goes here"
    />
  );
};
```

**Variant: TwoHandleSliderWithHiddenInputs**

```jsx
export const TwoHandleSliderWithHiddenInputs = () => {
  return (
    <Slider
      ariaLabelInput="Lower bound"
      unstable_ariaLabelInputUpper="Upper bound"
      labelText="Slider label"
      value={10}
      unstable_valueUpper={90}
      min={0}
      max={100}
      step={1}
      stepMultiplier={10}
      invalidText="Invalid message goes here"
      hideTextInput={true}
    />
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <SliderSkeleton />;
};
```

**Variant: TwoHandleSkeleton**

```jsx
export const TwoHandleSkeleton = () => {
  return <SliderSkeleton twoHandles={true} />;
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `slider.stories.ts` on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit, etc.).

**Imports + default args + control bindings** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import '../form/form-item';
import '../layer';
import { prefix } from '../../globals/settings';
import { withLayers } from '../../../.storybook/decorators/with-layers';

const args = {
  ariaLabelInput: 'Lower bound',
  disabled: false,
  hideLabel: false,
  hideTextInput: false,
  labelText: 'Slider (must be an increment of 5)',
  invalid: false,
  invalidText: 'Invalid message goes here',
  max: 100,
  min: 0,
  readOnly: false,
  required: false,
  step: 5,
  stepMultiplier: 5,
  warn: false,
  warnText: 'Warning message goes here',
  value: 50,
};
const argsTwohandle = {
  ariaLabelInput: 'Lower bound',
  disabled: false,
  labelText: 'Slider label',
  invalid: false,
  invalidText: 'Invalid message goes here',
  max: 100,
  min: 0,
  readOnly: false,
  required: false,
  step: 1,
  stepMultiplier: 1,
  warn: false,
  warnText: 'Warning message goes here',
  value: 10,
  unstable_valueUpper: 90,
  unstable_ariaLabelInputUpper: 'Upper bound',
  unstable_nameUpper: '',
};

const argTypes = {
  ariaLabelInput: {
    control: 'text',
    description:
      'The <code>ariaLabel</code> for the <code>&lt;input&gt;</code>.',
  },
  disabled: {
    control: 'boolean',
    description: '<code>true</code> to disable this slider.',
  },
  formatLabel: {
    control: false,
    description:
      'The callback to format the label associated with the minimum/maximum value and the value tooltip when hideTextInput is true.',
  },
  hideLabel: {
    control: 'boolean',
    description: 'Hide label (hide-label)',
  },
  hideTextInput: {
    control: 'boolean',
    description: '<code>true</code> to hide the number input box.',
  },
  labelText: {
    control: 'text',
    description: 'Provide the text for the slider label.',
  },
  inputType: {
    control: 'text',
    description: 'The type attribute of the <code>&lt;input&gt;</code>.',
  },
  invalid: {
    control: 'boolean',
    description: 'Specify whether the Slider is currently invalid.',
  },
  invalidText: {
    control: 'text',
    description:
      'Provide the text that is displayed when the Slider is in an invalid state.',
  },
  name: {
    control: 'text',
    description: 'The name attribute of the <code>&lt;input&gt;</code>.',
  },
  max: {
    control: 'number',
    description: 'The maximum value.',
  },
  min: {
    control: 'number',
    description: 'The minimum value.',
  },
  maxLabel: {
    control: 'text',
    description: 'The label associated with the maximum value.',
  },
  minLabel: {
    control: 'text',
    description: 'The label associated with the minimum value.',
  },
  readOnly: {
    control: 'boolean',
    description: 'Whether the slider should be read-only.',
  },
  required: {
    control: 'boolean',
    description: '<code>true</code> to specify if the control is required.',
  },
  step: {
    control: 'number',
    description:
      'A value determining how much the value should increase/decrease by moving the thumb by mouse. If a value other than 1 is provided and the input is <em>not</em> hidden, the new step requirement should be added to a visible label. Values outside the <code>step</code> increment will be considered invalid.',
  },
  stepMultiplier: {
    control: 'number',
    description:
      'A value determining how much the value should increase/decrease by Shift+arrow keys, which will be <code>(max - min) / stepMultiplier</code>.',
  },
  warn: {
    control: 'boolean',
    description: 'Specify whether the control is currently in warning state.',
  },
  warnText: {
    control: 'text',
    description:
      'Provide the text that is displayed when the control is in warning state.',
  },
  value: {
    control: 'number',
    description:
      'The value of the slider. When there are two handles, value is the lower bound.',
  },
  unstable_ariaLabelInputUpper: {
    control: 'text',
    description:
      'The `ariaLabel` for the upper bound `<input>` and handle when there are two handles.',
  },
  unstable_nameUpper: {
    control: 'text',
    description:
      'The `name` attribute of the upper bound `<input>` when there are two handles.',
  },
  unstable_valueUpper: {
    control: 'number',
    description: 'The upper bound when there are two handles.',
  },
  onAfterChange: {
    action: `${prefix}-slider-changed`,
    table: {
      disable: true,
    },
  },
};
```

**Variant: Default**

```html
<cds-form-item>
  <cds-slider
    ?disabled="${disabled}"
    ?hide-label="${hideLabel}"
    ?hide-text-input="${hideTextInput}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="${labelText}"
    max="${ifDefined(max)}"
    min="${ifDefined(min)}"
    max-label="${ifDefined(maxLabel)}"
    min-label="${ifDefined(minLabel)}"
    ?readonly="${ifDefined(readOnly)}"
    step="${ifDefined(step)}"
    step-multiplier="${ifDefined(stepMultiplier)}"
    ?warn="${warn}"
    warn-text="${warnText}"
    value="${ifDefined(value)}"
    @cds-slider-changed="${onChange}">
    <cds-slider-input
      aria-label="${ifDefined(ariaLabelInput)}"
      type="${ifDefined(inputType)}"
      ?required="${ifDefined(required)}"
      ?name="${ifDefined(name)}"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: ControlledSlider**

```html
<button type="button" @click="${onClick}">randomize value</button>
<cds-form-item>
  <cds-slider
    controlled
    label-text="Slider label"
    max="100"
    min="0"
    step="1"
    value="${ifDefined(value)}">
    <cds-slider-input
      aria-label="Slider value"
      type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
<h1 class="slider-headers">${value}</h1>
```

**Variant: ControlledSliderWithLayer**

```html
<div>
  <button type="button" @click="${onClick}">randomize value</button>
  <cds-form-item>
    <cds-slider
      label-text="Slider label"
      max="100"
      min="0"
      step="1"
      value="${ifDefined(value)}">
      <cds-slider-input
        aria-label="Slider value"
        type="number"></cds-slider-input>
    </cds-slider>
  </cds-form-item>
  <h1 class="slider-headers">${value}</h1>
</div>
```

**Variant: Skeleton**

```html
<cds-form-item>
  <cds-slider-skeleton>
    <cds-slider> </cds-slider>
  </cds-slider-skeleton>
</cds-form-item>
```

**Variant: SliderWithCustomValueLabel**

```html
<cds-form-item>
  <cds-slider
    ?disabled="${disabled}"
    ?hide-text-input="${hideTextInput}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="Slider label with low/medium/high"
    max="${ifDefined(max)}"
    min="${ifDefined(min)}"
    max-label="${ifDefined(maxLabel)}"
    min-label="${ifDefined(minLabel)}"
    ?readonly="${ifDefined(readOnly)}"
    step="${ifDefined(step)}"
    step-multiplier="${ifDefined(stepMultiplier)}"
    ?warn="${warn}"
    warn-text="${warnText}"
    value="${ifDefined(value)}"
    .formatLabel=${(value) => {
      if (value < 25) {
        return 'Low';
      } else if (value > 75) {
        return 'High';
      }
      return 'Medium';
    }}
    @cds-slider-changed="${onChange}">
    <cds-slider-input
      aria-label="${ifDefined(ariaLabelInput)}"
      type="${ifDefined(inputType)}"
      ?required="${ifDefined(required)}"
      ?name="${ifDefined(name)}"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: SliderWithHiddenInputs**

```html
<cds-form-item>
  <cds-slider
    ?disabled="${disabled}"
    ?hide-text-input="${hideTextInput}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="${labelText}"
    max="${ifDefined(max)}"
    min="${ifDefined(min)}"
    max-label="${ifDefined(maxLabel)}"
    min-label="${ifDefined(minLabel)}"
    ?readonly="${ifDefined(readOnly)}"
    step="${ifDefined(step)}"
    step-multiplier="${ifDefined(stepMultiplier)}"
    ?warn="${warn}"
    warn-text="${warnText}"
    value="${ifDefined(value)}"
    @cds-slider-changed="${onChange}">
    <cds-slider-input
      aria-label="${ifDefined(ariaLabelInput)}"
      type="${ifDefined(inputType)}"
      ?required="${ifDefined(required)}"
      ?name="${ifDefined(name)}"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: TwoHandleSkeleton**

```html
<cds-form-item>
  <cds-slider-skeleton twoHandles> </cds-slider-skeleton>
</cds-form-item>
```

**Variant: TwoHandleSlider**

```html
<cds-form-item>
  <cds-slider
    ?disabled="${disabled}"
    ?hide-text-input="${hideTextInput}"
    label-text="${labelText}"
    max="${max}"
    min="${min}"
    step="${step}"
    step-multiplier="${ifDefined(stepMultiplier)}"
    value="${value}"
    value-upper="${unstable_valueUpper}"
    max-label="${ifDefined(maxLabel)}"
    min-label="${ifDefined(minLabel)}"
    ?readonly="${ifDefined(readOnly)}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    ?warn="${warn}"
    warn-text="${warnText}">
    <cds-slider-input
      aria-label="${ifDefined(ariaLabelInput)}"
      name="${ifDefined(name)}"
      type="${ifDefined(inputType)}"
      id="lower"
      slot="lower-input"></cds-slider-input>
    <cds-slider-input
      aria-label="${ifDefined(unstable_ariaLabelInputUpper)}"
      name="${ifDefined(unstable_nameUpper)}"
      type="${ifDefined(inputType)}"
      id="upper"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: TwoHandleSliderWithHiddenInputs**

```html
<cds-form-item>
  <cds-slider
    ?disabled="${disabled}"
    ?hide-text-input="${hideTextInput}"
    label-text="${labelText}"
    max="${max}"
    min="${min}"
    step="${step}"
    step-multiplier="${ifDefined(stepMultiplier)}"
    value="${value}"
    value-upper="${unstable_valueUpper}"
    max-label="${ifDefined(maxLabel)}"
    min-label="${ifDefined(minLabel)}"
    ?readonly="${ifDefined(readOnly)}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    ?warn="${warn}"
    warn-text="${warnText}">
    <cds-slider-input
      aria-label="${ifDefined(ariaLabelInput)}"
      name="${ifDefined(name)}"
      type="${ifDefined(inputType)}"
      id="lower"
      slot="lower-input"></cds-slider-input>
    <cds-slider-input
      aria-label="${ifDefined(unstable_ariaLabelInputUpper)}"
      name="${ifDefined(unstable_nameUpper)}"
      type="${ifDefined(inputType)}"
      id="upper"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: WithLayer**

```html
<cds-form-item>
  <cds-slider
    label-text="Slider label"
    max="100"
    min="0"
    step="1"
    value="50">
    <cds-slider-input
      aria-label="Slider value"
      type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${...}` bindings resolved to literal attribute values. Use this for hand-coded HTML without a component framework. Carbon's `<cds-slider>` and `<cds-slider-input>` custom elements register under `@carbon/web-components/es/components/slider/index.js`.

**Variant: Default (single handle, value=50, range 0–100, step 5, paired number input)**

```html
<cds-form-item>
  <cds-slider
    label-text="Slider (must be an increment of 5)"
    min="0"
    max="100"
    step="5"
    step-multiplier="5"
    value="50"
    invalid-text="Invalid message goes here"
    warn-text="Warning message goes here">
    <cds-slider-input
      aria-label="Lower bound"
      type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: SliderWithHiddenInputs (no number input rendered)** — same as Default above, plus the `hide-text-input` boolean attribute on `<cds-slider>`. The `<cds-slider-input>` child stays in the DOM (Carbon hides it via CSS).

**Variant: SliderWithCustomValueLabel (Low / Medium / High popover above the thumb — `formatLabel` is a JS prop, not an HTML attribute, so this variant requires JS)**

```html
<cds-form-item>
  <cds-slider id="custom-label-slider"
    label-text="Slider label with low/medium/high"
    min="0"
    max="100"
    step="1"
    step-multiplier="50"
    value="50"
    hide-text-input>
    <cds-slider-input
      aria-label="Lower bound"
      type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
<script type="module">
  // formatLabel is a JS-only property on the custom element — set it after the
  // element registers. With hideTextInput, Carbon renders the label via a
  // popover docked to the thumb-wrapper.
  const slider = document.getElementById('custom-label-slider');
  slider.formatLabel = (value) => {
    if (value < 25) return 'Low';
    if (value > 75) return 'High';
    return 'Medium';
  };
</script>
```

**Variant: ControlledSlider (button drives the slider — uses the `value` attribute as the source of truth)**

```html
<button type="button" id="randomize-btn">randomize value</button>
<cds-form-item>
  <cds-slider id="controlled-slider" label-text="Slider label" min="0" max="100" step="1" value="87">
    <cds-slider-input aria-label="Slider value" type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
<h1 id="slider-readout">87</h1>
<script type="module">
  document.getElementById('randomize-btn').addEventListener('click', () => {
    const v = Math.round(Math.random() * 100);
    document.getElementById('controlled-slider').setAttribute('value', String(v));
    document.getElementById('slider-readout').textContent = String(v);
  });
</script>
```

**Variant: TwoHandleSlider (range, lower=10 upper=90)**

```html
<cds-form-item>
  <cds-slider
    label-text="Slider label"
    min="0"
    max="100"
    step="1"
    step-multiplier="10"
    value="10"
    value-upper="90"
    invalid-text="Invalid message goes here"
    warn-text="Warning message goes here">
    <cds-slider-input
      aria-label="Lower bound"
      id="lower"
      slot="lower-input"
      type="number"></cds-slider-input>
    <cds-slider-input
      aria-label="Upper bound"
      id="upper"
      type="number"></cds-slider-input>
  </cds-slider>
</cds-form-item>
```

**Variant: TwoHandleSliderWithHiddenInputs** — same as TwoHandleSlider above, plus the `hide-text-input` boolean attribute on `<cds-slider>`. The two `<cds-slider-input>` children stay in the markup (Carbon hides them via CSS, not removal — they remain in the DOM for form submission).

**Variants: Disabled / Read-only / Invalid / Warn (state attributes — apply to any of the markup above)**

```html
<!-- Disabled — entire control non-interactive, cursor: not-allowed -->
<cds-slider label-text="Slider label" min="0" max="100" step="5" value="50" disabled>
  <cds-slider-input aria-label="Lower bound" type="number"></cds-slider-input>
</cds-slider>

<!-- Read-only — thumb collapses to 0×0, text input bg goes transparent -->
<cds-slider label-text="Slider label" min="0" max="100" step="5" value="50" readonly>
  <cds-slider-input aria-label="Lower bound" type="number"></cds-slider-input>
</cds-slider>

<!-- Invalid — red support-error icon inline in the input + validation message -->
<cds-slider label-text="Slider label" min="0" max="100" step="5" value="120"
  invalid invalid-text="Number must be between 0 and 100">
  <cds-slider-input aria-label="Lower bound" type="number"></cds-slider-input>
</cds-slider>

<!-- Warn — yellow support-warning icon inline + warning message -->
<cds-slider label-text="Slider label" min="0" max="100" step="5" value="95"
  warn warn-text="Approaching the maximum recommended value">
  <cds-slider-input aria-label="Lower bound" type="number"></cds-slider-input>
</cds-slider>
```

**Variant: Skeleton**

```html
<cds-form-item>
  <cds-slider-skeleton>
    <cds-slider></cds-slider>
  </cds-slider-skeleton>
</cds-form-item>
```

**Variant: TwoHandleSkeleton**

```html
<cds-form-item>
  <cds-slider-skeleton twoHandles></cds-slider-skeleton>
</cds-form-item>
```

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  /* Track (unfilled portion) */
  --cds-slider-track-bg: #c6c6c6;            /* border-subtle (resolves to border-subtle-01) — gray-30 */
  --cds-slider-track-height: 0.125rem;       /* 2px — Carbon's track is intentionally hairline */
  --cds-slider-track-cap: #c6c6c6;           /* border-subtle — same color used for the centre stub (::before) */

  /* Track (filled portion, rest) */
  --cds-slider-filled-track-bg: #161616;     /* layer-selected-inverse — gray-100 (very dark in light mode) */

  /* Track (filled portion, focus — recolors to brand blue when the thumb is focused) */
  --cds-slider-filled-track-bg-focus: #0f62fe; /* border-interactive — blue-60 */

  /* Thumb (rest) */
  --cds-slider-thumb-bg: #161616;            /* layer-selected-inverse — same as filled-track at rest */
  --cds-slider-thumb-size: 0.875rem;         /* 14px circle */
  --cds-slider-thumb-scale-hover: 1.4286;    /* 20px / 14px = 1.4286 — applied via transform: scale() */

  /* Thumb (focus + active double-ring) */
  --cds-slider-thumb-bg-focus: #0f62fe;      /* interactive — blue-60 — fills the thumb when focused */
  --cds-slider-thumb-ring-inner: #0f62fe;    /* interactive — inner box-shadow ring (2px) */
  --cds-slider-thumb-ring-outer: #f4f4f4;    /* layer (resolves to layer-01) — outer box-shadow ring (3px) — separates the inner blue ring from the page bg */

  /* Range labels (min / max text on either side of the track) */
  --cds-slider-range-label: #161616;         /* text-primary */

  /* Number input (paired on the right) */
  --cds-slider-input-bg: #f4f4f4;            /* field (resolves to field-01) — gray-10 */
  --cds-slider-input-text: #161616;          /* text-primary */
  --cds-slider-input-height: 2.5rem;         /* 40px */
  --cds-slider-input-width: 4rem;            /* 64px (96px when invalid/warn — `inline-size: 6rem`) */

  /* Validation */
  --cds-slider-invalid-icon: #da1e28;        /* support-error — red-60 */
  --cds-slider-warn-icon: #f1c21b;           /* support-warning — yellow-30 */
  --cds-slider-warn-icon-path: #000000;      /* black-100 — the small inner glyph of the warn icon */
  --cds-slider-validation-text: #da1e28;     /* text-error — same red-60 as the icon */

  /* Disabled */
  --cds-slider-disabled-track: #c6c6c6;      /* border-disabled — gray-30 (same color as rest track, but the thumb darkens to match) */
  --cds-slider-disabled-thumb: #c6c6c6;      /* border-disabled */
  --cds-slider-disabled-input-bg: #f4f4f4;   /* field — input keeps its background but loses border + cursor changes to not-allowed */
  --cds-slider-disabled-input-text: rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-slider-disabled-range-label: rgba(22, 22, 22, 0.25); /* text-disabled */

  /* Read-only (thumb collapses to 0×0; input becomes transparent — value is shown text-only) */
  --cds-slider-readonly-thumb-size: 0;       /* block-size: 0; inline-size: 0; */
  --cds-slider-readonly-input-bg: transparent;

  /* Two-handle bridge (the 6×2 stub between two thumbs that hides the thin "inset" gap) */
  --cds-slider-two-handle-bridge-bg: #ffffff; /* background — paints over the 6px between the lower & upper thumbs */
  --cds-slider-two-handle-thumb-block: 1.5rem;  /* 24px tall hit-target */
  --cds-slider-two-handle-thumb-inline: 1rem;   /* 16px wide hit-target */

  /* Skeleton */
  --cds-slider-skeleton-bg: #e8e8e8;         /* skeleton-background */
  --cds-slider-skeleton-range-label-h: 0.75rem; /* 12px */
  --cds-slider-skeleton-range-label-w: 1.25rem; /* 20px */
}

[data-theme="g100"],
.dark {
  --cds-slider-track-bg: #525252;            /* border-subtle-01 in G100 — gray-70 */
  --cds-slider-track-height: 0.125rem;
  --cds-slider-track-cap: #525252;

  --cds-slider-filled-track-bg: #f4f4f4;     /* layer-selected-inverse in G100 — gray-10 (light against dark page) */
  --cds-slider-filled-track-bg-focus: #4589ff; /* border-interactive in G100 — blue-50 */

  --cds-slider-thumb-bg: #f4f4f4;
  --cds-slider-thumb-size: 0.875rem;
  --cds-slider-thumb-scale-hover: 1.4286;

  --cds-slider-thumb-bg-focus: #4589ff;      /* interactive in G100 — blue-50 */
  --cds-slider-thumb-ring-inner: #4589ff;
  --cds-slider-thumb-ring-outer: #262626;    /* layer-01 in G100 — gray-90 */

  --cds-slider-range-label: #f4f4f4;         /* text-primary in G100 */

  --cds-slider-input-bg: #262626;            /* field-01 in G100 — gray-90 */
  --cds-slider-input-text: #f4f4f4;          /* text-primary in G100 */
  --cds-slider-input-height: 2.5rem;
  --cds-slider-input-width: 4rem;

  --cds-slider-invalid-icon: #ff8389;        /* support-error in G100 — red-40 (brighter for dark backdrops) */
  --cds-slider-warn-icon: #f1c21b;           /* support-warning — same yellow-30 in both themes */
  --cds-slider-warn-icon-path: #000000;
  --cds-slider-validation-text: #ff8389;     /* text-error in G100 */

  --cds-slider-disabled-track: rgba(141, 141, 141, 0.5); /* border-disabled in G100 */
  --cds-slider-disabled-thumb: rgba(141, 141, 141, 0.5);
  --cds-slider-disabled-input-bg: #262626;
  --cds-slider-disabled-input-text: rgba(244, 244, 244, 0.25); /* text-disabled in G100 */
  --cds-slider-disabled-range-label: rgba(244, 244, 244, 0.25);

  --cds-slider-readonly-thumb-size: 0;
  --cds-slider-readonly-input-bg: transparent;

  --cds-slider-two-handle-bridge-bg: #161616; /* background in G100 — gray-100 */
  --cds-slider-two-handle-thumb-block: 1.5rem;
  --cds-slider-two-handle-thumb-inline: 1rem;

  --cds-slider-skeleton-bg: #292929;         /* skeleton-background in G100 */
  --cds-slider-skeleton-range-label-h: 0.75rem;
  --cds-slider-skeleton-range-label-w: 1.25rem;
}
```

> **Cross-reference:** these resolve from `overview.md` — `border-subtle-01` (line 254 White / 758 G100), `layer-selected-inverse` (line 239 / 743), `interactive` (line 330 / 834), `border-interactive` (line 264 / 768), `layer-01` (line 227 / 731), `text-primary` (line 268 / 772), `field-01` (line 245 / 749), `support-error` (line 295 / 631), `support-warning` (line 297 / 633), `text-error` (line 272 / 776), `border-disabled` (line 265 — White / G100 dark token), `text-disabled` (line 276 / 780), `background` (line 217 / 721), `skeleton-background` (line 335 / 839). The `$black-100` value `#000000` (warn icon path, `_slider.scss` L361) is a Carbon palette constant, not a themed token.

## States Reference (from .scss)

> Source-of-truth lines are quoted from `packages/styles/scss/components/slider/_slider.scss` on the Carbon `main` branch.

| State | Track (unfilled) | Track (filled) | Thumb size | Thumb color | Thumb ring (box-shadow) | Cursor | SCSS line |
|---|---|---|---|---|---|---|---|
| Rest | `#c6c6c6` (`border-subtle`) | `#161616` (`layer-selected-inverse`) | `14px × 14px` | `#161616` (`layer-selected-inverse`) | `inset 0 0 0 1px transparent, inset 0 0 0 2px transparent` | `pointer` | L42, L61, L81, L93, L190, L191-193 |
| Hover | unchanged | unchanged | `14px × 14px` *scaled* `1.4286` → `20px × 20px` | unchanged | unchanged (no ring on hover, only scale) | `pointer` | L201-204 |
| Focus-visible | unchanged | `#0f62fe` (`border-interactive`) — filled-track recolors to brand blue | scaled `1.4286` | `#0f62fe` (`interactive`) | `inset 0 0 0 2px #0f62fe, inset 0 0 0 3px #f4f4f4` (double-ring inside the scaled thumb) | `pointer` | L206-213, L324-328 |
| Active | unchanged | (focus state retained while pressed) | scaled `1.4286` | (rest color, blue removed) | `inset 0 0 0 2px #0f62fe` (single inner ring only) | `pointer` | L215-218 |
| Disabled — slider | `#c6c6c6` (`border-disabled`) | `#c6c6c6` (`border-disabled`) — even the `:focus` filled-track stays disabled-gray | `14px × 14px` (no scale on hover/focus/active) | `#c6c6c6` (`border-disabled`) | none on `:focus` | `not-allowed` | L372-396, L414-420 |
| Disabled — number input | n/a | n/a | n/a | n/a | n/a | `not-allowed` — `border: none; background: $field; color: $text-disabled` | L422-438 |
| Read-only | unchanged | unchanged (filled track still draws) | `0 × 0` (thumb collapses, no `::before`/`::after`) | n/a | n/a | `default` on the slider; text input becomes `transparent` | L441-457 |
| Invalid | unchanged | unchanged | unchanged | unchanged | unchanged | unchanged — change is on the input + icon: input width grows to `6rem`, padding-end `48px` (`$spacing-09`), `cds--slider__invalid-icon` is positioned absolute right inside the input with `fill: support-error` | L331-344, L352-353 |
| Warn | unchanged | unchanged | unchanged | unchanged | unchanged | unchanged — same input-width grow as invalid; icon is the same Carbon "warning--alt" with `fill: support-warning` and an inner `path:first-of-type` filled `#000000 (black-100)` | L356-363 |
| Two-handle — lower thumb | unchanged | filled segment runs **between** the two thumbs | `24 × 16px` wrapper, no `border-radius` (replaced by the SVG icon) | `transparent` background — the visible thumb is the SVG icon | none on rest; `:focus` swaps `__thumb-icon` for `__thumb-icon--focus` (recolors to `interactive`) | `pointer` | L104-149, L230-283 |
| Two-handle — upper thumb | unchanged | unchanged | `24 × 16px` wrapper, mirror of lower | mirrors lower thumb behavior | mirrors lower | `pointer` | L151-185, L285-297 |
| Skeleton | (track still drawn, no pointer) | (no filled segment) | (single-thumb pinned to `inset-inline-start: 50%`; two-thumb skeleton pins lower at `0%`, upper at `100%`) | `#e8e8e8` (`skeleton-background`) | n/a | `default`, `pointer-events: none` | L466-497 |
| Windows HCM | `outline` mixin on `.cds--slider__track` | n/a | thumb gets `outline` via `high-contrast-mode('outline')` mixin; `:focus` switches to HCM `'focus'` system color | n/a | n/a | n/a | L504-514 |

## Animation & Motion

Carbon's slider defines transitions on three properties — the **filled-track background** (gray → blue when focused), the **thumb transform** (scale on hover/focus/active), and the **thumb background + box-shadow** (rest → focused). All three use the **fast-02** duration (`110ms`) and the **standard productive** easing (`cubic-bezier(0.2, 0, 0.38, 0.9)`), so the focus state lands as a single coordinated motion.

```css
/* Filled track recolor on focus (from _slider.scss L87) */
.cds--slider__filled-track {
  transition: background var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* Carbon source: $duration-fast-02 motion(standard, productive) */
}

/* Thumb scale + color + ring transition (from _slider.scss L196-199) */
.cds--slider__thumb {
  transition:
    transform   var(--cds-duration-fast-02) var(--cds-easing-productive-standard),
    background  var(--cds-duration-fast-02) var(--cds-easing-productive-standard),
    box-shadow  var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
}

/* Hover — pure scale (no ring) */
.cds--slider__thumb:hover {
  transform: scale(1.4286);   /* 20px / 14px */
}

/* Focus — scale + brand-blue fill + double-ring */
.cds--slider__thumb:focus {
  background-color: var(--cds-interactive);          /* #0f62fe (W) / #4589ff (G100) */
  box-shadow:
    inset 0 0 0 2px var(--cds-interactive),
    inset 0 0 0 3px var(--cds-layer);                /* outer ring = layer-01 = #f4f4f4 (W) / #262626 (G100) */
  transform: scale(1.4286);
}

/* Active — scale + inner ring only (the brand-blue fill drops away during press) */
.cds--slider__thumb:active {
  box-shadow: inset 0 0 0 2px var(--cds-interactive);
  transform: scale(1.4286);
}

/* Filled track recolors when the thumb (or two-handle wrapper) is focused */
.cds--slider__thumb:focus ~ .cds--slider__filled-track,
.cds--slider__thumb-wrapper:focus-within ~ .cds--slider__filled-track {
  background-color: var(--cds-border-interactive); /* #0f62fe (W) / #4589ff (G100) */
}

/* Two-handle thumb override — no scale on hover/focus/active because the
   thumb is a 24×16 hit-zone with an SVG glyph inside, not a 14×14 circle */
.cds--slider__thumb--lower,
.cds--slider__thumb--upper {
  transition: none;          /* L237 — Carbon disables the transition on the range thumbs */
}

/* Reduced-motion override — Carbon does NOT ship one for slider, but you should
   add it in your project to honor user prefs end-to-end. */
@media (prefers-reduced-motion: reduce) {
  .cds--slider__thumb,
  .cds--slider__filled-track {
    transition: none;
  }
  .cds--slider__thumb:hover,
  .cds--slider__thumb:focus,
  .cds--slider__thumb:active {
    transform: none;        /* drop the scale jump */
  }
}
```

**Why the standard (not exit) productive curve:** the slider's focus state is an **entrance** — the thumb grows and recolors to indicate the control has accepted focus. Carbon uses `motion(standard, productive)` (the symmetrical productive curve) so the rest → focus transition and the focus → rest transition feel identical, which matters for keyboard users who Tab through a form rapidly. This is distinct from the toggle, which uses `motion(exit, productive)` because its motion is a one-direction state change (off → on).

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon's React `<Slider>` and WC `<cds-slider>` render an outer `<div class="cds--slider-container">` containing two `<span class="cds--slider__range-label">` (min / max), the `<div class="cds--slider">` track, an inner `<div class="cds--slider__thumb-wrapper">` housing the focusable thumb (`<div class="cds--slider__thumb" role="slider" tabindex="0" aria-valuemin aria-valuemax aria-valuenow aria-labelledby>`), the filled-track div, and a hidden `<input class="cds--slider__input" type="hidden" name="...">` (L299-301) that submits the value as part of the form. **Important: the visible interactive surface is a `role="slider"` div, NOT an `<input type="range">`.** The hidden input exists only for form submission.
- **Companion number input:** when `hideTextInput` is `false` (default), Carbon renders a sibling `<input type="number" class="cds--slider-text-input" inline-size: 64px; block-size: 40px>` (the `<cds-slider-input>` slot in WC). It mirrors the slider's `value` and accepts direct keyboard entry; typing a value out of `[min, max]` flips both controls into the `invalid` state and grows the input width to `6rem` to fit the inline error icon (`_slider.scss` L331-344).
- **Two-handle ARIA:** the range variant renders **two** `role="slider"` thumbs (`__thumb--lower`, `__thumb--upper`), each with its own `aria-valuenow`. The `aria-valuemin` of the upper thumb is set dynamically to `value` (the lower bound), and the `aria-valuemax` of the lower thumb is set to `unstable_valueUpper` (the upper bound), so the two thumbs cannot cross. Each thumb has its own `aria-labelledby` pointing to the `labelText`.
- **Keyboard:**
  - `←` / `↓` decrement by `step` (default 1).
  - `→` / `↑` increment by `step`.
  - `Shift + ←/↓` decrement by `(max - min) / stepMultiplier` (the "jump" interval — defaults to `5` in the Default story, so on a 0–100 slider Shift+arrow moves by 20).
  - `Shift + →/↑` increment by the same "jump" interval.
  - `Home` jumps to `min`.
  - `End` jumps to `max`.
  - `Tab` / `Shift+Tab` move focus into and out of the slider thumb. In two-handle mode, `Tab` moves between the lower and upper thumbs; the number inputs are also in the tab order if visible.
- **Screen reader announcement:** when `hideTextInput` is true and `formatLabel` is provided, Carbon announces the formatted label (`"Low"` / `"Medium"` / `"High"`) via the popover that docks to the thumb-wrapper. When `formatLabel` is absent, Carbon announces the raw `aria-valuenow`.
- **Focus management:** the visible focus state is on the `__thumb` itself — `box-shadow: inset 0 0 0 2px var(--cds-interactive), inset 0 0 0 3px var(--cds-layer)` (a brand-blue inner ring with a layer-color separator ring) — paired with `transform: scale(1.4286)` so the focused thumb visually grows from 14px to 20px. The default `outline: none` on `.cds--slider__thumb` (L195) is intentional because the visible focus is the inset double-ring; do NOT add an outline back. For Windows High Contrast Mode, Carbon swaps in a system `outline` via `@include high-contrast-mode('outline')` and `@include high-contrast-mode('focus')` mixins (L506-514) so HCM users see a visible thumb edge and focus.
- **Touch target:** the visible thumb is `14 × 14px` (`20 × 20px` when scaled on hover/focus). The slider's `padding: 16px 0` on `.cds--slider` (L41) extends the **vertical** hit area to ~`46px` (`16 + 14 + 16`). The horizontal hit-target is the full track width (min 200px, max 640px). For the two-handle variant, each thumb wrapper is `24px × 16px` (L106-107) — Carbon expands the hit zone here because the user must distinguish two adjacent thumbs. On a touch-only device with a single-handle slider in a tight layout, wrap the slider in a container with `min-height: 44px` to satisfy WCAG 2.5.5.
- **High Contrast Mode:** Carbon includes Windows HCM overrides — `.cds--slider__thumb` and `.cds--slider__track` both gain an `outline` via the `'outline'` mixin (L506, L512), and `.cds--slider__thumb:focus` swaps to the HCM `'focus'` system color (L509-511) so focus is visible against a forced-color background.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5/6 — that IS the Carbon source | Don't paraphrase, reformat, or "improve" the Carbon source |
| Render the track at exactly `2px` height (`block-size: convert.to-rem(2px)`) — Carbon's slider is intentionally hairline | Don't use Material's `4px` track or Apple's `8px` capsule track — that's a different design language |
| Render the thumb as a `14px` circle (rest), scaling to `20px` on hover / focus / active via `transform: scale(1.4286)` | Don't render the thumb at a fixed `20px` and skip the scale transition — Carbon's growth-on-focus is part of the affordance |
| Use `var(--cds-layer-selected-inverse)` (`#161616` White / `#f4f4f4` G100) for the **rest** thumb and filled-track | Don't use blue as the rest color — Carbon's slider is high-contrast gray-100 against the page; blue only appears on `:focus` |
| On focus, recolor the **filled-track** to `var(--cds-border-interactive)` (blue-60 / blue-50) AND the **thumb fill** to `var(--cds-interactive)` (same blues) | Don't recolor only the thumb — the whole filled-track must turn blue together; this is the "I'm interactive" signal |
| Render the focus ring as `inset 0 0 0 2px var(--cds-interactive), inset 0 0 0 3px var(--cds-layer)` — a double inset shadow | Don't put `outline: 2px solid` on the thumb — Carbon's focus is an inset shadow, not an outline; outline interferes with the scale transform |
| Pair the slider with a `<cds-slider-input type="number">` (64×40, sitting `16px` to the right) by default | Don't render the slider alone unless `hideTextInput` is set; Carbon's value-entry pattern includes the number input by default |
| When `hideTextInput`, add a `cds-popover` above the thumb with the value (use `formatLabel` if you want `Low/Medium/High`) | Don't leave a `hideTextInput` slider with no value display — users need to know the current value |
| Use `<div role="slider" aria-valuemin aria-valuemax aria-valuenow tabindex="0">` as the focusable element | Don't substitute `<input type="range">` — Carbon does not use the native range input; the hidden `<input type="hidden">` is form-submission only |
| For the two-handle variant, render two `role="slider"` thumbs with the SVG glyph (24×16 wrappers) — and keep the bridging `2px × 6px` `__thumb::before` rectangle that paints the gap between them in `--cds-background` | Don't render two `14px` circles for the range variant — Carbon uses a wider `24×16` glyph per thumb so users can grab them on touch devices |
| Animate `transform`, `background`, and `box-shadow` on the thumb at `110ms` `cubic-bezier(0.2, 0, 0.38, 0.9)` — productive **standard** | Don't slow this down (`200ms+ ease-out` will feel Material-y, not Carbon); keep the productive snap |
| For invalid / warn, grow the number input to `inline-size: 6rem` and add right-padding `48px` (`$spacing-09`) so the inline icon fits | Don't show the validation icon outside the input — Carbon places it inside, right-aligned, vertically centered |
| For disabled, swap **both** the track and the thumb to `var(--cds-border-disabled)` (`#c6c6c6` / `rgba(141,141,141,0.5)`) and set `cursor: not-allowed` on the slider | Don't gray out only one of them — Carbon disables the entire visual chain (track + filled-track + thumb + range labels + number input) |
| For read-only, collapse the thumb to `0 × 0` and switch the number input background to `transparent` — the slider becomes a pure value display | Don't disable a read-only slider — `disabled` and `readOnly` are different states (read-only is keyboard-focusable, disabled is not) |
| Use `[data-theme="white"]` or `[data-theme="g100"]` to scope tokens — note the rest filled-track flips from `#161616` to `#f4f4f4` because `layer-selected-inverse` inverts | Don't hardcode `#161616` for the filled-track — that breaks G100 dark mode where the filled track is `#f4f4f4` (so it stays visible against the dark page) |
| For RTL layouts, rely on Carbon's logical properties (`inset-inline-start`, `transform: translate(50%, -50%)` flip in `.cds--slider-container--rtl`) — they're built into the SCSS at L99-101, L133-149, L169-185 | Don't manually flip with `transform: scaleX(-1)` — that mirrors the SVG glyphs in the two-handle thumbs and breaks the focus ring |
