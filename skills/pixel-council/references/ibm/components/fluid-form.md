---
name: fluid-form
description: Carbon FluidForm — wrapper that converts standard inputs into 64px-tall, label-inside fields that share borders with no spacing between siblings. Wraps any of FluidTextInput, FluidDropdown, FluidSelect, FluidNumberInput, FluidSearch, FluidTextArea, FluidTimePicker, FluidComboBox, FluidMultiSelect, FluidDatePicker. Variants from Storybook — FluidForm.Default, FluidTextInput {Default, DefaultWithToggletip, Skeleton}, FluidDropdown {Default, Condensed, withAILabel, Skeleton}, FluidSelect {Default, withAILabel, Skeleton}, FluidNumberInput {Default, Skeleton}, FluidSearch {Default, Skeleton}, FluidTextArea {Default, DefaultWithLayers, DefaultWithToggletip, Skeleton}, FluidTimePicker {Default, Skeleton}, FluidComboBox {Default, Condensed, withAILabel, Skeleton}, FluidMultiSelect {Default, Filterable, _FilterableWithLayer, Condensed, withAILabel, Skeleton}, FluidDatePicker {Simple, Single, RangeWithCalendar, Skeleton}.
metadata:
  tags: fluid-form, fluid, form, input, dense, dropdown, select, number-input, text-area, search, time-picker, combo-box, multi-select, date-picker, ai-label, ibm, carbon, react, web-components
---

# Fluid Form -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
>
> **React (eleven story files):**
> - [`FluidForm.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidForm/FluidForm.stories.js)
> - [`FluidTextInput.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidTextInput/FluidTextInput.stories.js)
> - [`FluidDropdown.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidDropdown/FluidDropdown.stories.js)
> - [`FluidSelect.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidSelect/FluidSelect.stories.js)
> - [`FluidNumberInput.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidNumberInput/FluidNumberInput.stories.js)
> - [`FluidSearch.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidSearch/FluidSearch.stories.js)
> - [`FluidTextArea.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidTextArea/FluidTextArea.stories.js)
> - [`FluidTimePicker.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidTimePicker/FluidTimePicker.stories.js)
> - [`FluidComboBox.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidComboBox/FluidComboBox.stories.js)
> - [`FluidMultiSelect.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidMultiSelect/FluidMultiSelect.stories.js)
> - [`FluidDatePicker.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidDatePicker/FluidDatePicker.stories.js)
>
> **Web Components (note: a top-level `fluid-form` element does not ship in `@carbon/web-components` — apply `cds--form--fluid` to the wrapping `<cds-form>` and compose Fluid* primitives inside):**
> - [`fluid-text-input.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-text-input/fluid-text-input.stories.ts)
> - [`fluid-dropdown.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-dropdown/fluid-dropdown.stories.ts)
> - [`fluid-select.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-select/fluid-select.stories.ts)
> - [`fluid-number-input.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-number-input/fluid-number-input.stories.ts)
> - [`fluid-search.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-search/fluid-search.stories.ts)
> - [`fluid-textarea.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-textarea/fluid-textarea.stories.ts) (folder is `fluid-textarea`, no hyphen)
> - [`fluid-time-picker.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-time-picker/fluid-time-picker.stories.ts)
> - [`fluid-multi-select.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/fluid-multi-select/fluid-multi-select.stories.ts)
> - **404 (not yet shipped in `@carbon/web-components`):** `fluid-combo-box.stories.ts`, `fluid-date-picker.stories.ts`. The folders `fluid-combo-box/` and `fluid-date-picker/` exist on disk but contain no `.stories.ts` file (only the index/scss). Use the React equivalents for these two until the WC stories land in v11.106+.
>
> **SCSS (twelve files cross-referenced for state values):**
> - [`form/_form.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/form/_form.scss) — defines `.cds--form--fluid` (the FluidForm wrapper class) and Fluid form-requirement padding overrides.
> - [`fluid-text-input/_fluid-text-input.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-text-input/_fluid-text-input.scss) — 64px height, 32px top padding for label, 13px bottom.
> - [`fluid-text-area/_fluid-text-area.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-text-area/_fluid-text-area.scss) — 64px min height, 2rem top margin for input.
> - [`fluid-number-input/_fluid-number-input.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-number-input/_fluid-number-input.scss) — 64px min height, 80px right padding (for stepper buttons).
> - [`fluid-dropdown/_fluid-dropdown.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-dropdown/_fluid-dropdown.scss)
> - [`fluid-select/_fluid-select.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-select/_fluid-select.scss)
> - [`fluid-search/_fluid-search.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-search/_fluid-search.scss)
> - [`fluid-time-picker/_fluid-time-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-time-picker/_fluid-time-picker.scss)
> - [`fluid-combo-box/_fluid-combo-box.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-combo-box/_fluid-combo-box.scss)
> - [`fluid-multiselect/_fluid-multiselect.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-multiselect/_fluid-multiselect.scss)
> - [`fluid-date-picker/_fluid-date-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-date-picker/_fluid-date-picker.scss)
> - [`fluid-list-box/_fluid-list-box.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/fluid-list-box/_fluid-list-box.scss)
>
> **React component source:** [`FluidForm.tsx`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/FluidForm/FluidForm.tsx) — confirms wrapper renders `<form class="cds--form--fluid">` and provides `FormContext` with `{ isFluid: true }`.
>
> **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-fluid-components-fluidform--default
> **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-fluid-components-fluidtextinput--default
> **Docs page:** https://v11.carbondesignsystem.com/components/form/usage/#fluid-form
> **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license.

## Quick Reference

| Property | Value |
|---|---|
| Wrapper class | `.cds--form--fluid` (rendered by `<FluidForm>` and applied to `<cds-form>`) |
| Field min-height (every Fluid* input) | `64px` (`min-block-size: convert.to-rem(64px)`) |
| Stepper / control button height (FluidNumberInput, FluidSearch close-btn) | `40px` |
| Label position | **INSIDE the field**, top — `inset-block-start: 13px`, `inset-inline-start: 16px` (`spacing-05`), `block-size: 16px` |
| Label typography | IBM Plex Sans, `label-01` — 12px / 16px / 0.32px / weight 400 (`$input-label-weight`) |
| Value padding | `padding: 32px 16px 13px` (top / inline / bottom) — `convert.to-rem(32px) $spacing-05 convert.to-rem(13px)` |
| Value padding (number input — leaves room for steppers) | `padding: 32px 80px 13px 16px` — `convert.to-rem(32px) convert.to-rem(80px) convert.to-rem(13px) $spacing-05` |
| Value typography | IBM Plex Sans, `body-compact-01` — 14px / 18px / 0.16px / weight 400 |
| Background (White theme, `field`) | `#f4f4f4` (resolves to `--cds-field` → `--cds-field-01`) |
| Background (G100 theme, `field`) | `#262626` |
| Background inside Modal (`field-02`) | `#ffffff` (White) / `#393939` (G100) — auto-applied via `.cds--modal .cds--text-area--fluid .cds--text-area__wrapper { background: $field-02 }` |
| Border treatment between sibling Fluid fields | **Borders collapse — fields touch with NO margin**. Each field has `border-block-end: 1px solid $border-strong` (`#8d8d8d` White / `#6f6f6f` G100); no top/left/right border. |
| Corner radius | `0` (Carbon: sharp by default — applies to wrapper AND every nested field) |
| Helper text in Fluid mode | **Hidden** — `.cds--text-input--fluid .cds--form__helper-text { display: none; }`. Use a `<Toggletip>` inside the label slot instead. |
| Invalid / warning text padding | `$spacing-03 40px $spacing-03 $spacing-05` (8px top, 40px right, 8px bottom, 16px left) — appears below the field on its own row, NOT a 16px gap. |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: -2px` (inset on the entire 64px field). Focus color is `#0f62fe` (White) / `#ffffff` (G100). |
| Invalid focus ring | `outline: 2px solid var(--cds-support-error); outline-offset: -2px` |
| Invalid icon position | `inset-block-start: 80px` (sits in the helper-text band BELOW the field, not inside it) |
| AI-label / decorator slot offset (Fluid) | `inset-block-start: 42px; inset-inline-end: 16px` (centered vertically in the lower half of the 64px field) |
| Read-only value color | `$text-secondary` — `#525252` (White) / `#c6c6c6` (G100) |
| Read-only background | unchanged (`$field`) — distinguished only by missing focus ring on hover/focus |
| Skeleton background | `$skeleton-background` — `#e8e8e8` (White) / `#393939` (G100) |
| Skeleton bar element | `$skeleton-element` — `#c6c6c6` (White) / `#525252` (G100) |
| Skeleton block-size | `64px` (matches the Fluid field) |
| Transition (background + outline) | `background-color $duration-fast-01 motion(standard, productive), outline $duration-fast-01 motion(standard, productive)` — `70ms cubic-bezier(0.2, 0, 0.38, 0.9)` |
| React import (wrapper) | `import { FluidForm } from '@carbon/react';` |
| React imports (children) | `import { FluidTextInput, FluidTextArea, FluidNumberInput, FluidSearch, FluidSelect, FluidDropdown, FluidComboBox, FluidMultiSelect, FluidDatePicker, FluidDatePickerInput, FluidTimePicker, FluidTimePickerSelect } from '@carbon/react';` |
| React skeletons | `import { FluidTextInputSkeleton, FluidTextAreaSkeleton, FluidNumberInputSkeleton, FluidSearchSkeleton, FluidSelectSkeleton, FluidDropdownSkeleton, FluidComboBoxSkeleton, FluidMultiSelectSkeleton, FluidDatePickerSkeleton, FluidTimePickerSkeleton } from '@carbon/react';` |
| WC imports (children — note `fluid-textarea` has no hyphen) | `import '@carbon/web-components/es/components/fluid-text-input/index.js';` `import '@carbon/web-components/es/components/fluid-dropdown/index.js';` `import '@carbon/web-components/es/components/fluid-select/index.js';` `import '@carbon/web-components/es/components/fluid-number-input/index.js';` `import '@carbon/web-components/es/components/fluid-search/index.js';` `import '@carbon/web-components/es/components/fluid-textarea/index.js';` `import '@carbon/web-components/es/components/fluid-time-picker/index.js';` `import '@carbon/web-components/es/components/fluid-multi-select/index.js';` |

## Variants (from Storybook story exports)

> Eleven story files contribute to FluidForm. The wrapper itself (`FluidForm.stories.js`) ships only ONE export — `Default` — that demonstrates the composition pattern. The remaining ten files ship the individual Fluid* inputs that are designed to live INSIDE the wrapper.

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| FluidForm composition | `Default` | `FluidForm.stories.js` | Full-form composition: TimePicker + DatePicker + Select on one row, TextInput + NumberInput on another, then a password TextInput, then a TextArea — all sharing borders. Also wraps a second copy in a `<ModalWrapper>` (Fluid-in-Modal pattern). |
| FluidTextInput Default | `Default` | `FluidTextInput.stories.js` | Single-field demo with `defaultWidth=300`, label="Label", invalid/warn/disabled toggles. |
| FluidTextInput WithToggletip | `DefaultWithToggletip` | `FluidTextInput.stories.js` | Replaces the plain string label with a `<ToggletipLabel>` + `<Toggletip>` (Information icon → "Additional field information here."). The Fluid pattern's recommended substitute for helper text. |
| FluidTextInput Skeleton | `Skeleton` | `FluidTextInput.stories.js` | `<FluidTextInputSkeleton>` — 64px placeholder with bar at top (label) + bar inline (value). |
| FluidDropdown Default | `Default` | `FluidDropdown.stories.js` | Dropdown trigger with `titleText="Label"` (sits inside the field) and 6 items. Args: `isCondensed`, `disabled`, `invalid`, `warn`. |
| FluidDropdown Condensed | `Condensed` | `FluidDropdown.stories.js` | Renders menu items in condensed (32px row) mode. The trigger itself stays at 64px. |
| FluidDropdown withAILabel | `withAILabel` | `FluidDropdown.stories.js` | Slots an `<AILabel>` decorator inside the dropdown — adds aiAura gradient background and AI popover with confidence score / model type / actions. |
| FluidDropdown Skeleton | `Skeleton` | `FluidDropdown.stories.js` | `<FluidDropdownSkeleton>` placeholder. |
| FluidSelect Default | `Default` | `FluidSelect.stories.js` | Native `<select>` wrapped in Fluid styling. Label is a `<ToggletipLabel>` ("Select an option") by default. 4 options + an empty placeholder option. |
| FluidSelect withAILabel | `withAILabel` | `FluidSelect.stories.js` | Adds `decorator={aiLabel}` — same AILabel content as Dropdown. |
| FluidSelect Skeleton | `Skeleton` | `FluidSelect.stories.js` | `<FluidSelectSkeleton>` placeholder. |
| FluidNumberInput Default | `Default` | `FluidNumberInput.stories.js` | NumberInput at 400px width, min=0 / max=100 / step=10 / defaultValue=50. Label is a `<ToggletipLabel>` ("Label"). 40px stepper buttons fixed in the right 80px gutter. |
| FluidNumberInput Skeleton | `Skeleton` | `FluidNumberInput.stories.js` | `<FluidNumberInputSkeleton>` placeholder. |
| FluidSearch Default | `Default` | `FluidSearch.stories.js` | Search field at 400px with `labelText="Search"`, `placeholder="Prompt text"`, magnifying-glass icon left, clear button right. |
| FluidSearch Skeleton | `Skeleton` | `FluidSearch.stories.js` | `<FluidSearchSkeleton>` placeholder. |
| FluidTextArea Default | `Default` | `FluidTextArea.stories.js` | Resizable textarea at 300px, label="Text Area label", `enableCounter` + `maxCount=500` available. Label sits inside the field, value area starts 32px down. |
| FluidTextArea WithLayers | `DefaultWithLayers` | `FluidTextArea.stories.js` | Demonstrates the field token swap (`field-01` → `field-02` → `field-03`) across nested `<Layer>` contexts. |
| FluidTextArea WithToggletip | `DefaultWithToggletip` | `FluidTextArea.stories.js` | Toggletip-as-label variant. |
| FluidTextArea Skeleton | `Skeleton` | `FluidTextArea.stories.js` | `<FluidTextAreaSkeleton>` placeholder. |
| FluidTimePicker Default | `Default` | `FluidTimePicker.stories.js` | A 350px-wide composition: time `<input>` plus two `<FluidTimePickerSelect>` children (Clock = AM/PM, Timezone = ET/CT/MT/PT). Borders collapse between the three controls — the entire row reads as one fluid field. A second isolated TimePicker with one Clock select follows. |
| FluidTimePicker Skeleton | `Skeleton` | `FluidTimePicker.stories.js` | Two skeletons stacked — one with default 3 sub-fields, one with `isOnlyTwo` prop for the 2-sub-field layout. |
| FluidComboBox Default | `Default` | `FluidComboBox.stories.js` | Type-ahead combobox at 400px, items array, `titleText="Label"`. |
| FluidComboBox Condensed | `Condensed` | `FluidComboBox.stories.js` | Condensed menu rows. |
| FluidComboBox withAILabel | `withAILabel` | `FluidComboBox.stories.js` | AILabel decorator. |
| FluidComboBox Skeleton | `Skeleton` | `FluidComboBox.stories.js` | `<FluidComboBoxSkeleton>` placeholder. |
| FluidMultiSelect Default | `Default` | `FluidMultiSelect.stories.js` | Multi-select dropdown at 400px, 6 items, `titleText="Label"`. |
| FluidMultiSelect Filterable | `Filterable` | `FluidMultiSelect.stories.js` | Adds `isFilterable` — type to filter options. |
| FluidMultiSelect FilterableWithLayer | `_FilterableWithLayer` | `FluidMultiSelect.stories.js` | Demonstrates the `WithLayer` template applied to a filterable multi-select, with `selectionFeedback="top-after-reopen"`. |
| FluidMultiSelect Condensed | `Condensed` | `FluidMultiSelect.stories.js` | Condensed menu rows. |
| FluidMultiSelect withAILabel | `withAILabel` | `FluidMultiSelect.stories.js` | AILabel decorator. |
| FluidMultiSelect Skeleton | `Skeleton` | `FluidMultiSelect.stories.js` | `<FluidMultiSelectSkeleton>` placeholder. |
| FluidDatePicker Simple | `Simple` | `FluidDatePicker.stories.js` | `datePickerType="simple"` — one input, no calendar popover. 288px wide. |
| FluidDatePicker Single | `Single` | `FluidDatePicker.stories.js` | `datePickerType="single"` — one input + Flatpickr calendar popover. |
| FluidDatePicker RangeWithCalendar | `RangeWithCalendar` | `FluidDatePicker.stories.js` | `datePickerType="range"` — two adjoining inputs (start/end) with shared range calendar. |
| FluidDatePicker Skeleton | `Skeleton` | `FluidDatePicker.stories.js` | Three skeletons stacked — simple, single, range. |
| WC: FluidTextInput | `Default`, `DefaultWithToggletip`, `Skeleton` | `fluid-text-input.stories.ts` | `<cds-fluid-text-input>` plus `<cds-fluid-text-input-skeleton>`. Toggletip variant slots `<cds-toggletip slot="label-text">` into the label area. |
| WC: FluidDropdown | `Default`, `Condensed`, `WithAILabel`, `Skeleton` | `fluid-dropdown.stories.ts` | `<cds-fluid-dropdown>` with `<cds-dropdown-item>` children; `is-condensed` toggles condensed menu rows; `WithAILabel` slots `<cds-ai-label alignment="bottom-left">`. |
| WC: FluidSelect | `Default`, `WithToggletip`, `Skeleton`, `WithAILabel` | `fluid-select.stories.ts` | `<cds-fluid-select>` with `<cds-select-item>` children. |
| WC: FluidNumberInput | `Default`, `DefaultWithToggletip`, `Skeleton` | `fluid-number-input.stories.ts` | `<cds-fluid-number-input>` with min/max/step attrs. |
| WC: FluidSearch | `Default`, `Skeleton` | `fluid-search.stories.ts` | `<cds-fluid-search>` plus `<cds-fluid-search-skeleton>`. |
| WC: FluidTextArea | `Default`, `Skeleton`, `WithLayer`, `DefaultWithToggletip` | `fluid-textarea.stories.ts` (folder is `fluid-textarea`, no hyphen) | `<cds-fluid-textarea>` — note: WC custom-element name uses `textarea` as one word. |
| WC: FluidTimePicker | `Default`, `Skeleton` | `fluid-time-picker.stories.ts` | `<cds-fluid-time-picker>` with two `<cds-fluid-time-picker-select>` children; Skeleton has default and `is-only-two`. |
| WC: FluidMultiSelect | `Default`, `Condensed`, `Filterable`, `FilterableWithLayer`, `Skeleton`, `WithAILabel` | `fluid-multi-select.stories.ts` | `<cds-fluid-multi-select>` with `<cds-multi-select-item>` children; `filterable="true"` adds typeahead. |
| WC: FluidComboBox / FluidDatePicker | _(none)_ | _missing_ | Folders exist (`fluid-combo-box/`, `fluid-date-picker/`) but no `.stories.ts` ships in v11. **Use the React equivalents until the WC stories land.** |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from the eleven Storybook files on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI. Each block is preceded by its source-file imports so a literal copy compiles in isolation.

### Wrapper (FluidForm.stories.js)

**Imports:**

```jsx
import React from 'react';

import FluidForm from '.';
import FluidDatePicker from '../FluidDatePicker';
import FluidDatePickerInput from '../FluidDatePickerInput';
import FluidSelect from '../FluidSelect';
import SelectItem from '../SelectItem';
import SelectItemGroup from '../SelectItemGroup';
import FluidTextInput from '../FluidTextInput';
import FluidTextArea from '../FluidTextArea';
import FluidTimePicker from '../FluidTimePicker';
import FluidTimePickerSelect from '../FluidTimePickerSelect';
import FluidNumberInput from '../FluidNumberInput';
import ModalWrapper from '../ModalWrapper';
import mdx from './FluidForm.mdx';
```

**Shared prop objects** (also from `FluidForm.stories.js`):

```jsx
const additionalProps = {
  className: 'some-class',
};

const TextInputProps = {
  className: 'some-class',
  id: 'test2',
  labelText: 'Text Input label',
  placeholder: 'Placeholder text',
};

const TextAreaProps = {
  className: 'some-class',
  id: 'test3',
  labelText: 'Text Area label',
  placeholder: 'Placeholder text',
};

const InvalidPasswordProps = {
  className: 'some-class',
  id: 'test4',
  labelText: 'Password',
  value: '0000',
};

export default {
  title: 'Components/Fluid Components/FluidForm',
  component: FluidForm,
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Default — full FluidForm composition (TimePicker + DatePicker + Select on row 1, TextInput + NumberInput on row 2, then a password TextInput, a TextArea, and the same form mirrored inside a Modal):**

```jsx
export const Default = () => (
  <>
    <FluidForm aria-label="sample form" {...additionalProps}>
      <div style={{ display: 'flex' }}>
        <FluidTimePicker
          id="time-picker-1"
          labelText="Time"
          placeholder="hh:mm">
          <FluidTimePickerSelect id="select-01" labelText="Clock">
            <SelectItem value="am" text="AM" />
            <SelectItem value="pm" text="PM" />
          </FluidTimePickerSelect>
          <FluidTimePickerSelect id="select-02" labelText="Timezone">
            <SelectItem value="et" text="Eastern Time (ET)" />
            <SelectItem value="ct" text="Central Time (CT)" />
            <SelectItem value="mt" text="Mountain Time (MT)" />
            <SelectItem value="pt" text="Pacific Time (PT)" />
          </FluidTimePickerSelect>
        </FluidTimePicker>
        <FluidDatePicker datePickerType="range">
          <FluidDatePickerInput
            id="date-picker-input-id-start"
            placeholder="mm/dd/yyyy"
            labelText="Choose your dates"
          />
          <FluidDatePickerInput
            id="date-picker-input-id-finish"
            placeholder="mm/dd/yyyy"
            labelText="End date"
          />
        </FluidDatePicker>
        <FluidSelect
          id="select-1"
          defaultValue="placeholder-item"
          labelText="Choose an option">
          <SelectItem
            disabled
            hidden
            value="placeholder-item"
            text="Choose an option"
          />
          <SelectItemGroup label="Category 1">
            <SelectItem value="option-1" text="Option 1" />
            <SelectItem value="option-2" text="Option 2" />
          </SelectItemGroup>
          <SelectItemGroup label="Category 2">
            <SelectItem value="option-3" text="Option 3" />
            <SelectItem value="option-4" text="Option 4" />
          </SelectItemGroup>
        </FluidSelect>
      </div>
      <div style={{ display: 'flex' }}>
        <FluidTextInput {...TextInputProps} />
        <FluidNumberInput
          label="Number Input Label"
          labelText="Fluid Number Input"
          placeholder="Placeholder text"
          id="input-default"
          step={10}
          min={0}
          max={100}
          defaultValue={50}
        />
      </div>

      <FluidTextInput
        type="password"
        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
        {...InvalidPasswordProps}
      />
      <FluidTextArea {...TextAreaProps} />
    </FluidForm>

    <br />

    <ModalWrapper
      hasScrollingContent
      buttonTriggerText="Fluid form in modal"
      modalHeading="Modal heading"
      modalLabel="Label"
      handleSubmit={() => {}}
      size="md">
      <FluidForm {...additionalProps}>
        <FluidTextInput {...TextInputProps} />
        <FluidTextInput
          type="password"
          pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
          {...InvalidPasswordProps}
        />
        <FluidTextArea {...TextAreaProps} />
      </FluidForm>
    </ModalWrapper>
  </>
);
```

### FluidTextInput (FluidTextInput.stories.js)

**Imports:**

```jsx
import React from 'react';
import FluidTextInput from '../FluidTextInput';
import FluidTextInputSkeleton from './FluidTextInput.Skeleton';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { Information } from '@carbon/icons-react';
import './test.scss';
import mdx from './FluidTextInput.mdx';
```

**ToggleTip helper** (re-used by every variant that needs an in-label info button — same pattern appears in FluidNumberInput / FluidTextArea / FluidComboBox / FluidMultiSelect / FluidDropdown / FluidSelect / FluidTimePicker / FluidDatePicker):

```jsx
const ToggleTip = (
  <>
    <ToggletipLabel>Label</ToggletipLabel>
    <Toggletip align="top-left">
      <ToggletipButton label="Show information">
        <Information />
      </ToggletipButton>
      <ToggletipContent>
        <p>Additional field information here.</p>
      </ToggletipContent>
    </Toggletip>
  </>
);
```

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...textInputArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidTextInput {...textInputArgs} />
  </div>
);

Default.args = {
  defaultWidth: 300, placeholder: 'Placeholder text',
  invalid: false,
  invalidText: 'Error message that is really long can wrap to more lines but should not be excessively long.',
  disabled: false, labelText: 'Label',
  warn: false,
  warnText: 'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: DefaultWithToggletip** — Fluid pattern's recommended substitute for helper text:

```jsx
export const DefaultWithToggletip = () => (
  <FluidTextInput labelText={ToggleTip} placeholder="Placeholder text" />
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: '300px' }}>
    <FluidTextInputSkeleton
      labelText="Label"
      placeholder="Placeholder text"
      id="input-1"
    />
  </div>
);
```

### FluidDropdown (FluidDropdown.stories.js)

**Imports:**

```jsx
import React from 'react';
import { FluidDropdown, FluidDropdownSkeleton } from '../FluidDropdown';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { Button } from '../Button';
import { Information, View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './FluidDropdown.mdx';
```

**Items array** (re-used by Dropdown, ComboBox, MultiSelect):

```jsx
const items = [
  {
    id: 'option-0',
    text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit.',
  },
  {
    id: 'option-1',
    text: 'Option 1',
  },
  {
    id: 'option-2',
    text: 'Option 2',
  },
  {
    id: 'option-3',
    text: 'Option 3 - a disabled item',
    disabled: true,
  },
  {
    id: 'option-4',
    text: 'Option 4',
  },
  {
    id: 'option-5',
    text: 'Option 5',
  },
];
```

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...dropdownArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidDropdown id="default" titleText="Label" label="Choose an option"
      items={items} itemToString={(item) => (item ? item.text : '')}
      {...dropdownArgs} />
  </div>
);

Default.args = {
  defaultWidth: 400, className: 'test-class', isCondensed: false,
  disabled: false, invalid: false,
  invalidText: 'Error message that is really long can wrap to more lines but should not be excessively long.',
  label: 'Choose an option', titleText: 'Label',
  warn: false,
  warnText: 'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: Condensed**

```jsx
export const Condensed = () => (
  <div style={{ width: '400px' }}>
    <FluidDropdown id="default" isCondensed titleText="Label"
      label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')} />
  </div>
);
```

**aiLabel decorator** (re-used by Dropdown / Select / ComboBox / MultiSelect):

```jsx
const aiLabel = (
  <AILabel className="ai-label-container">
    <AILabelContent>
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
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => (
  <div style={{ width: '400px' }}>
    <FluidDropdown initialSelectedItem={items[2]} id="default" titleText="Label"
      label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')}
      decorator={aiLabel} {...args} />
  </div>
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: 400 }}>
    <FluidDropdownSkeleton />
  </div>
);
```

### FluidSelect (FluidSelect.stories.js)

**Imports:**

```jsx
import React from 'react';
import { FluidSelect, FluidSelectSkeleton } from '.';
import SelectItem from '../SelectItem';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { Information, View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './FluidSelect.mdx';
```

**Variant: Default** (note: uses `<ToggletipLabel>` for `labelText` by default — Fluid pattern):

```jsx
export const Default = ({ defaultWidth, ...selectArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidSelect {...selectArgs} id="select-1">
      <SelectItem value="" text="" />
      <SelectItem value="option-1" text="Option 1" />
      <SelectItem value="option-2" text="Option 2" />
      <SelectItem value="option-3" text="Option 3" />
      <SelectItem value="option-4" text="Option 4" />
    </FluidSelect>
  </div>
);

Default.args = {
  labelText: ToggleTip, defaultWidth: 400, className: 'test-class',
  disabled: false, invalid: false,
  invalidText: 'Error message that is really long can wrap to more lines but should not be excessively long.',
  warn: false,
  warnText: 'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: withAILabel** (re-uses the `aiLabel` decorator declared in FluidDropdown above):

```jsx
export const withAILabel = (args) => (
  <div style={{ width: 400 }}>
    <FluidSelect id="select-1" labelText="Select an option"
      decorator={aiLabel} {...args}>
      <SelectItem value="" text="" />
      <SelectItem
        value="An example option that is really long to show what should be done to handle long text"
        text="An example option that is really long to show what should be done to handle long text"
      />
      <SelectItem value="Option 2" text="Option 2" />
      <SelectItem value="Option 3" text="Option 3" />
      <SelectItem value="Option 4" text="Option 4" />
    </FluidSelect>
  </div>
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: 400 }}>
    <FluidSelectSkeleton />
  </div>
);
```

### FluidNumberInput (FluidNumberInput.stories.js)

**Imports:**

```jsx
import React from 'react';
import { FluidNumberInput, FluidNumberInputSkeleton } from '.';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { Information } from '@carbon/icons-react';
import mdx from './FluidNumberInput.mdx';
```

**Variant: Default** — note `label` (not `labelText`) accepts the ToggleTip; min/max/step/defaultValue are explicit:

```jsx
export const Default = ({ defaultWidth, ...numberInputArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidNumberInput {...numberInputArgs} />
  </div>
);

Default.args = {
  max: 100,
  min: 0,
  step: 10,
  id: 'input-default',
  placeholder: 'Placeholder text',
  defaultWidth: 400,
  defaultValue: 50,
  invalid: false,
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  disabled: false,
  label: ToggleTip,
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: '400px' }}>
    <FluidNumberInputSkeleton
      label="Label"
      placeholder="Placeholder text"
      id="input-skeleton"
    />
  </div>
);
```

### FluidSearch (FluidSearch.stories.js)

**Imports:**

```jsx
import React from 'react';
import { FluidSearch, FluidSearchSkeleton } from '.';
import mdx from './FluidSearch.mdx';
```

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...searchArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidSearch {...searchArgs} />
  </div>
);

Default.args = {
  defaultWidth: 400,
  closeButtonLabelText: 'Clear search input',
  disabled: false,
  labelText: 'Search',
  placeholder: 'Prompt text',
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: '400px' }}>
    <FluidSearchSkeleton />
  </div>
);
```

### FluidTextArea (FluidTextArea.stories.js)

**Imports:**

```jsx
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import FluidTextArea from '../FluidTextArea';
import FluidTextAreaSkeleton from './FluidTextArea.Skeleton';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { Information } from '@carbon/icons-react';
import mdx from './FluidTextArea.mdx';
```

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...textAreaArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidTextArea {...textAreaArgs} />
  </div>
);

Default.args = {
  defaultWidth: 300,
  className: 'test-class',
  placeholder: 'Placeholder text',
  invalid: false,
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  disabled: false,
  enableCounter: false,
  labelText: 'Text Area label',
  maxCount: 500,
  warn: false,
  warnText: 'This is a warning message.',
};
```

**Variant: DefaultWithLayers** — demonstrates the `field-01 → field-02 → field-03` token swap:

```jsx
export const DefaultWithLayers = () => (
  <WithLayer>
    {(layer) => (
      <FluidTextArea
        labelText="Text Area label"
        placeholder="Placeholder text"
        id={`text-area-${layer}`}
      />
    )}
  </WithLayer>
);
```

**Variant: DefaultWithToggletip**

```jsx
export const DefaultWithToggletip = () => (
  <FluidTextArea labelText={ToggleTip} placeholder="Placeholder text" />
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: '300px' }}>
    <FluidTextAreaSkeleton />
  </div>
);
```

### FluidTimePicker (FluidTimePicker.stories.js)

**Imports:**

```jsx
import React from 'react';
import FluidTimePicker from '../FluidTimePicker';
import FluidTimePickerSelect from '../FluidTimePickerSelect';
import FluidTimePickerSkeleton from './FluidTimePicker.Skeleton';
import SelectItem from '../SelectItem';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { Information } from '@carbon/icons-react';
import mdx from './FluidTimePicker.mdx';
```

**Variant: Default** — borders collapse between the time `<input>` and each `<FluidTimePickerSelect>` so the whole row reads as one fluid field:

```jsx
export const Default = (args) => {
  return (
    <div style={{ width: '350px' }}>
      <FluidTimePicker id="time-picker-1" {...args}>
        <FluidTimePickerSelect id="select-1" labelText={ToggleTip}>
          <SelectItem value="am" text="AM" />
          <SelectItem value="pm" text="PM" />
        </FluidTimePickerSelect>
        <FluidTimePickerSelect id="select-2" labelText="Timezone">
          <SelectItem value="et" text="Eastern Time (ET)" />
          <SelectItem value="ct" text="Central Time (CT)" />
          <SelectItem value="mt" text="Mountain Time (MT)" />
          <SelectItem value="pt" text="Pacific Time (PT)" />
        </FluidTimePickerSelect>
      </FluidTimePicker>
      <br />
      <br />
      <FluidTimePicker
        id="time-picker-2"
        labelText="Time"
        placeholder="hh:mm"
        {...args}>
        <FluidTimePickerSelect id="select-3" labelText={ToggleTip}>
          <SelectItem value="am" text="AM" />
          <SelectItem value="pm" text="PM" />
        </FluidTimePickerSelect>
      </FluidTimePicker>
    </div>
  );
};

Default.args = {
  labelText: 'Time',
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  placeholder: 'hh:mm',
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: Skeleton** — default (3 sub-fields) + `isOnlyTwo` (2 sub-fields):

```jsx
export const Skeleton = () => (
  <div style={{ width: '300px' }}>
    <FluidTimePickerSkeleton />
    <br />
    <br />
    <FluidTimePickerSkeleton isOnlyTwo />
  </div>
);
```

### FluidComboBox (FluidComboBox.stories.js)

**Imports:**

```jsx
import React from 'react';
import { FluidComboBox, FluidComboBoxSkeleton } from '../FluidComboBox';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { Button } from '../Button';
import { Information, View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './FluidComboBox.mdx';
```

**Variant: Default** (re-uses the same `items` array and `aiLabel` decorator declared in FluidDropdown above):

```jsx
export const Default = ({ defaultWidth, ...comboBoxArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidComboBox
      onChange={() => {}}
      id="default"
      titleText="Label"
      label="Choose an option"
      items={items}
      itemToString={(item) => (item ? item.text : '')}
      {...comboBoxArgs}
    />
  </div>
);

Default.args = {
  defaultWidth: 400, className: 'test-class', isCondensed: false,
  disabled: false, invalid: false,
  invalidText: 'Error message that is really long can wrap to more lines but should not be excessively long.',
  label: 'Choose an option', titleText: 'Label',
  warn: false,
  warnText: 'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: Condensed**

```jsx
export const Condensed = () => (
  <div style={{ width: '400px' }}>
    <FluidComboBox onChange={() => {}} id="default" isCondensed
      titleText="Label" label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')} />
  </div>
);
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => (
  <div style={{ width: '400px' }}>
    <FluidComboBox onChange={() => {}} id="default" titleText="Label"
      label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')}
      decorator={aiLabel} {...args} />
  </div>
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: 400 }}>
    <FluidComboBoxSkeleton />
  </div>
);
```

### FluidMultiSelect (FluidMultiSelect.stories.js)

**Imports:**

```jsx
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';
import {
  FluidMultiSelect,
  FluidMultiSelectSkeleton,
} from '../FluidMultiSelect';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { Button } from '../Button';
import { Information, View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './FluidMultiSelect.mdx';
```

**Variant: Default**

```jsx
export const Default = ({ defaultWidth, ...multiSelectArgs }) => (
  <div style={{ width: defaultWidth }}>
    <FluidMultiSelect
      onChange={() => {}}
      id="default"
      titleText="Label"
      label="Choose an option"
      items={items}
      itemToString={(item) => (item ? item.text : '')}
      {...multiSelectArgs}
    />
  </div>
);

Default.args = {
  defaultWidth: 400,
  className: 'test-class',
  isCondensed: false,
  isFilterable: false,
  disabled: false,
  invalid: false,
  invalidText:
    'Error message that is really long can wrap to more lines but should not be excessively long.',
  label: 'Choose an option',
  titleText: 'Label',
  warn: false,
  warnText:
    'Warning message that is really long can wrap to more lines but should not be excessively long.',
};
```

**Variant: Filterable**

```jsx
export const Filterable = () => (
  <div style={{ width: '400px' }}>
    <FluidMultiSelect isFilterable onChange={() => {}}
      initialSelectedItem={items[2]} id="default" titleText="Label"
      label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')} />
  </div>
);
```

**Variant: _FilterableWithLayer**

```jsx
export const _FilterableWithLayer = () => (
  <WithLayer>
    {(layer) => (
      <div style={{ width: 300 }}>
        <FluidMultiSelect isFilterable
          id={`carbon-multiselect-example-${layer}`}
          titleText="Multiselect title" items={items}
          itemToString={(item) => (item ? item.text : '')}
          selectionFeedback="top-after-reopen" />
      </div>
    )}
  </WithLayer>
);
```

**Variant: Condensed**

```jsx
export const Condensed = () => (
  <div style={{ width: '400px' }}>
    <FluidMultiSelect onChange={() => {}} id="default" isCondensed
      titleText="Label" label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')} />
  </div>
);
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => (
  <div style={{ width: '400px' }}>
    <FluidMultiSelect onChange={() => {}} initialSelectedItem={items[2]}
      id="default" titleText="Label" label="Choose an option" items={items}
      itemToString={(item) => (item ? item.text : '')}
      decorator={aiLabel} {...args} />
  </div>
);
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: 400 }}>
    <FluidMultiSelectSkeleton />
  </div>
);
```

### FluidDatePicker (FluidDatePicker.stories.js)

**Imports:**

```jsx
import React from 'react';
import FluidDatePicker from '../FluidDatePicker';
import FluidDatePickerInput from '../FluidDatePickerInput';
import FluidDatePickerSkeleton from './FluidDatePicker.Skeleton';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
} from '../Toggletip';
import { Information } from '@carbon/icons-react';
import mdx from './FluidDatePicker.mdx';
```

**Variant: Simple** (no calendar popover):

```jsx
export const Simple = (args) => (
  <div style={{ width: '288px' }}>
    <FluidDatePicker datePickerType="simple" {...args}>
      <FluidDatePickerInput
        placeholder="mm/dd/yyyy"
        labelText={ToggleTip}
        id="date-picker-simple"
        {...args}
      />
    </FluidDatePicker>
  </div>
);

Simple.args = { ...sharedArgs };
Simple.argTypes = { ...sharedArgTypes };
```

**Variant: Single** (single date + Flatpickr calendar):

```jsx
export const Single = (args) => (
  <div style={{ width: '288px' }}>
    <FluidDatePicker datePickerType="single" {...args}>
      <FluidDatePickerInput
        style={{ width: '288px' }}
        placeholder="mm/dd/yyyy"
        labelText={ToggleTip}
        id="date-picker-single"
        {...args}
      />
    </FluidDatePicker>
  </div>
);
```

**Variant: RangeWithCalendar** — two adjoining inputs (start / end) with shared range calendar:

```jsx
export const RangeWithCalendar = (args) => {
  return (
    <div style={{ width: '288px' }}>
      <FluidDatePicker datePickerType="range" {...args}>
        <FluidDatePickerInput
          id="date-picker-input-id-start"
          placeholder="mm/dd/yyyy"
          labelText={ToggleTip}
          size="md"
          {...args}
        />
        <FluidDatePickerInput
          id="date-picker-input-id-finish"
          placeholder="mm/dd/yyyy"
          labelText="End date"
          size="md"
          {...args}
        />
      </FluidDatePicker>
    </div>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => (
  <div style={{ width: '300px' }}>
    <FluidDatePickerSkeleton
      datePickerType="simple"
      labelText="Label"
      placeholder="Placeholder text"
      id="input-1"
    />
    <br />
    <br />
    <FluidDatePickerSkeleton
      datePickerType="single"
      labelText="Label"
      placeholder="Placeholder text"
      id="input-2"
    />
    <br />
    <br />
    <FluidDatePickerSkeleton
      datePickerType="range"
      labelText="Label"
      placeholder="Placeholder text"
      id="input-3"
    />
  </div>
);
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from the eight Web Components stories files. Use these for non-React projects. To replicate the FluidForm wrapper itself, render `<cds-form class="cds--form--fluid">` and stack Fluid* primitives inside (the React `FluidForm` provides this class plus a context flag — there is no `<cds-fluid-form>` element).

### WC FluidTextInput (`fluid-text-input.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import '../toggle-tip/toggletip';
import './fluid-text-input';
import './fluid-text-input-skeleton';
```

**Variant: Default**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-text-input
    placeholder="${ifDefined(placeholder)}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    ?disabled="${disabled}"
    label="${ifDefined(labelText)}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}"
    value="${ifDefined(value)}"
    ?enable-counter="${ifDefined(enableCounter)}"
    max-count="${ifDefined(maxCount)}"
    ?readonly="${ifDefined(readonly)}">
  </cds-fluid-text-input>
</div>
```

**Variant: DefaultWithToggletip**

```html
<cds-fluid-text-input placeholder="Placeholder text">
  <cds-toggletip autoAlign="true" slot="label-text">
    Label
    <p slot="body-text">Additional field information here.</p>
  </cds-toggletip>
</cds-fluid-text-input>
```

**Variant: Skeleton**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-text-input-skeleton></cds-fluid-text-input-skeleton>
</div>
```

### WC FluidDropdown (`fluid-dropdown.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../dropdown/dropdown-item';
import '../ai-label';
import '../icon-button';
import { iconLoader } from '../../globals/internal/icon-loader';
import '../toggle-tip/toggletip';
```

**Variant: Default**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-dropdown
    aria-label="${ifDefined(ariaLabel || undefined)}"
    ?auto-align="${autoAlign}"
    direction="${ifDefined(direction)}"
    ?disabled="${disabled}"
    ?is-condensed="${isCondensed}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label="${ifDefined(label)}"
    ?open="${open}"
    ?read-only="${readOnly}"
    title-text="${ifDefined(titleText)}"
    value="${ifDefined(value || undefined)}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}">
    ${items.map(
      (elem) => html`
        <cds-dropdown-item ?disabled=${elem.disabled} value="${elem.value}"
          >${elem.text}</cds-dropdown-item
        >
      `
    )}
  </cds-fluid-dropdown>
</div>
```

**Variant: Condensed** — identical to Default except `args.isCondensed = true` (default args block: `{ ...args, isCondensed: true }`); same render template as Default above. Only the menu rows render in condensed mode; the trigger stays at 64px.

**Variant: Skeleton**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-dropdown-skeleton></cds-fluid-dropdown-skeleton>
</div>
```

**Variant: WithAILabel**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-dropdown
    aria-label="${ifDefined(ariaLabel || undefined)}"
    ?auto-align="${autoAlign}"
    direction="${ifDefined(direction)}"
    ?disabled="${disabled}"
    ?is-condensed="${isCondensed}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label="${ifDefined(label)}"
    ?open="${open}"
    ?read-only="${readOnly}"
    title-text="${ifDefined(titleText)}"
    value="${ifDefined(value || undefined)}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}</cds-ai-label
    >
    ${items.map(
      (elem) => html`
        <cds-dropdown-item ?disabled=${elem.disabled} value="${elem.value}"
          >${elem.text}</cds-dropdown-item
        >
      `
    )}
  </cds-fluid-dropdown>
</div>
```

### WC FluidSelect (`fluid-select.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../form/form-item';
import '../ai-label';
import '../icon-button';
import { iconLoader } from '../../globals/internal/icon-loader';
import '../select/select-item';
import '../toggle-tip/toggletip';
```

**Variant: Default**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-select
    id="${id}"
    ?disabled="${disabled}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="${ifDefined(labelText)}"
    name="${ifDefined(name)}"
    ?readonly="${readOnly}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}">
    <cds-select-item value=""></cds-select-item>
    <cds-select-item value="option-1">Option 1</cds-select-item>
    <cds-select-item value="option-2">Option 2</cds-select-item>
    <cds-select-item value="option-3">Option 3</cds-select-item>
    <cds-select-item value="option-4">Option 4</cds-select-item>
  </cds-fluid-select>
  <div></div>
</div>
```

**Variant: WithToggletip**

```html
<div style="width:400px;">
  <cds-fluid-select>
    <cds-toggletip autoAlign="true" slot="label-text">
      Label
      <p slot="body-text">Additional field information here.</p>
    </cds-toggletip>
    <cds-select-item
      value="An example option that is really long to show what should be done to handle long text"
      >An example option that is really long to show what should be done
      to handle long text</cds-select-item
    >
    <cds-select-item value="option-1">Option 1</cds-select-item>
    <cds-select-item value="option-2">Option 2</cds-select-item>
    <cds-select-item value="option-3">Option 3</cds-select-item>
    <cds-select-item value="option-4">Option 4</cds-select-item>
  </cds-fluid-select>
  <div></div>
</div>
```

**Variant: Skeleton**

```html
<div style="width:400px;">
  <cds-fluid-select-skeleton></cds-fluid-select-skeleton>
  <div style="width:400px;"></div>
</div>
```

**Variant: WithAILabel**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-select
    id="${id}"
    ?disabled="${disabled}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="${ifDefined(labelText)}"
    name="${ifDefined(name)}"
    ?readonly="${readOnly}"
    ?warn="${warn}"
    warn-text="${ifDefined(warnText)}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}</cds-ai-label
    >
    <cds-select-item value=""></cds-select-item>
    <cds-select-item value="all"
      >An example option that is really long to show what should be done to
      handle long text</cds-select-item
    >
    <cds-select-item value="cloudFoundry">Option 2</cds-select-item>
    <cds-select-item value="staging">Option 3</cds-select-item>
    <cds-select-item value="dea">Option 4</cds-select-item>
  </cds-fluid-select>
</div>
```

### WC FluidNumberInput (`fluid-number-input.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import '../toggle-tip/toggletip';
import './fluid-number-input';
import './fluid-number-input-skeleton';
```

**Variant: Default**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-number-input
    ?allow-empty="${allowEmpty}"
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
    step="${ifDefined(step)}"
    @input="${onInput}">
  </cds-fluid-number-input>
</div>
```

**Variant: DefaultWithToggletip**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-number-input
    ?allow-empty="${allowEmpty}"
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
    step="${ifDefined(step)}"
    @input="${onInput}">
    <cds-toggletip autoAlign="true" slot="label-text">
      Label
      <p slot="body-text">Additional field information here.</p>
    </cds-toggletip>
  </cds-fluid-number-input>
</div>
```

**Variant: Skeleton**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-number-input-skeleton></cds-fluid-number-input-skeleton>
</div>
```

### WC FluidSearch (`fluid-search.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './fluid-search';
import './fluid-search-skeleton';
```

**Variant: Default**

```html
<div style="width:${defaultWidth}px;">
  <cds-fluid-search
    autocomplete="${autoComplete}"
    close-button-label-text="${ifDefined(closeButtonLabelText)}"
    ?disabled="${disabled}"
    label-text="${ifDefined(labelText)}"
    placeholder="${ifDefined(placeholder)}"
    type="${ifDefined(type)}"
    role=${role}
    value="${ifDefined(value)}"
    @cds-search-input="${onInput}">
  </cds-fluid-search>
</div>
```

**Variant: Skeleton**

```html
<div style="width: ${defaultWidth}px;">
  <cds-fluid-search-skeleton></cds-fluid-search-skeleton>
</div>
```

### WC FluidTextArea (`fluid-textarea.stories.ts` — folder is `fluid-textarea`, no hyphen; element name is `<cds-fluid-textarea>`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import '../toggle-tip/toggletip';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Variant: Default**

```html
<div style="width:300px;">
  <cds-fluid-textarea
    ?enable-counter="${enableCounter}"
    counter-mode="${ifDefined(counterMode)}"
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
  </cds-fluid-textarea>
</div>
```

**Variant: Skeleton**

```html
<div style="width:300px;">
  <cds-fluid-textarea-skeleton></cds-fluid-textarea-skeleton>
</div>
```

**Variant: WithLayer**

```html
<cds-fluid-textarea
  placeholder="Placeholder text"
  label="Text Area label"
  helper-text="Optional helper text">
</cds-fluid-textarea>
```

**Variant: DefaultWithToggletip**

```html
<div style="width:300px;">
  <cds-fluid-textarea placeholder="Placeholder text">
    <cds-toggletip slot="label-text" alignment="top-left" autoAlign="true">
      Toggletip label
      <p slot="body-text">Additional field information here.</p>
    </cds-toggletip>
  </cds-fluid-textarea>
</div>
```

### WC FluidTimePicker (`fluid-time-picker.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import '../toggle-tip/toggletip';
import '../select/select-item';
import './fluid-time-picker';
import './fluid-time-picker-select';
import './fluid-time-picker-skeleton';
```

**Variant: Default**

```html
<div style="width:350px;">
  <cds-fluid-time-picker
    id="time-picker-1"
    ?disabled="${disabled}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    label-text="${ifDefined(labelText)}"
    placeholder="${ifDefined(placeholder)}"
    ?readonly="${readOnly}"
    ?warning="${warning}"
    warning-text="${ifDefined(warningText)}">
    <cds-fluid-time-picker-select id="select-1" default-value="am">
      <cds-toggletip slot="label-text" alignment="top-left" autoalign="true">
        Clock
        <p slot="body-text">Additional field information here.</p>
      </cds-toggletip>
      <cds-select-item value="am" selected="true">AM</cds-select-item>
      <cds-select-item value="pm">PM</cds-select-item>
    </cds-fluid-time-picker-select>
    <cds-fluid-time-picker-select
      id="select-2"
      label-text="Timezone"
      default-value="et">
      <cds-select-item value="et" selected="true"
        >Eastern Time (ET)</cds-select-item
      >
      <cds-select-item value="ct">Central Time (CT)</cds-select-item>
      <cds-select-item value="mt">Mountain Time (MT)</cds-select-item>
      <cds-select-item value="pt">Pacific Time (PT)</cds-select-item>
    </cds-fluid-time-picker-select>
  </cds-fluid-time-picker>
  <br />
  <br />
  <cds-fluid-time-picker
    id="time-picker-2"
    label-text="${ifDefined(labelText)}"
    placeholder="${ifDefined(placeholder)}"
    ?disabled="${disabled}"
    ?invalid="${invalid}"
    invalid-text="${ifDefined(invalidText)}"
    ?readonly="${readOnly}"
    ?warning="${warning}"
    warning-text="${ifDefined(warningText)}">
    <cds-fluid-time-picker-select id="select-3" default-value="am">
      <cds-toggletip slot="label-text" alignment="top-left" autoalign="true">
        Clock
        <p slot="body-text">Additional field information here.</p>
      </cds-toggletip>
      <cds-select-item value="am" selected="true">AM</cds-select-item>
      <cds-select-item value="pm">PM</cds-select-item>
    </cds-fluid-time-picker-select>
  </cds-fluid-time-picker>
</div>
```

**Variant: Skeleton**

```html
<div style="width:300px;">
  <cds-fluid-time-picker-skeleton> </cds-fluid-time-picker-skeleton>
  <br />
  <br />
  <cds-fluid-time-picker-skeleton is-only-two>
  </cds-fluid-time-picker-skeleton>
</div>
```

### WC FluidMultiSelect (`fluid-multi-select.stories.ts`)

**Imports:**

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../form/form-item';
import '../ai-label';
import '../icon-button';
import { iconLoader } from '../../globals/internal/icon-loader';
import '../select/select-item';
import '../toggle-tip/toggletip';
import {
  DROPDOWN_DIRECTION,
  SELECTION_FEEDBACK_OPTION,
} from '../multi-select/multi-select';
import '../multi-select/index';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Variant: Default**

```html
<div style="width:${defaultWidth}px">
  <cds-fluid-multi-select
    direction=${ifDefined(direction)}
    ?disabled=${disabled}
    ?invalid=${invalid}
    ?is-condensed=${isCondensed}
    invalid-text=${ifDefined(invalidText)}
    clear-selection-label=${ifDefined(clearSelectionLabel)}
    locale=${ifDefined(locale)}
    ?read-only=${readOnly}
    title-text=${ifDefined(titleText)}
    selection-feedback=${ifDefined(selectionFeedback)}
    size=${ifDefined(size)}
    ?warn=${warn}
    warn-text=${ifDefined(warnText)}
    label=${ifDefined(label)}
    value="${ifDefined(value)}">
    <cds-multi-select-item value="example"
      >An example option that is really long to show what should be done
      to handle long text</cds-multi-select-item
    >
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry"
      >Option 2</cds-multi-select-item
    >
    <cds-multi-select-item disabled value="staging"
      >Option 3 - a disabled item</cds-multi-select-item
    >
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-fluid-multi-select>
</div>
```

**Variant: Filterable** — identical to Default render template above except adds `filterable="true"` attribute on `<cds-fluid-multi-select>` (uses `filterableArgs` instead of `args` for default values, with `label: ''` instead of `'Choose an option'`).

**Variant: Skeleton**

```html
<div style="width:400px;">
  <cds-fluid-multi-select-skeleton></cds-fluid-multi-select-skeleton>
</div>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.disabled}` → `disabled` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. The full FluidForm wrapper has no dedicated WC element, so apply `class="cds--form--fluid"` to a `<cds-form>` (or plain `<form>`) and stack Fluid* primitives inside.

**Variant: FluidForm wrapper composition** (mirrors the React Default story above):

```html
<form class="cds--form--fluid" aria-label="sample form">
  <div style="display:flex;">
    <cds-fluid-time-picker id="time-picker-1" label-text="Time" placeholder="hh:mm">
      <cds-fluid-time-picker-select id="select-01" label-text="Clock" default-value="am">
        <cds-select-item value="am" selected="true">AM</cds-select-item>
        <cds-select-item value="pm">PM</cds-select-item>
      </cds-fluid-time-picker-select>
      <cds-fluid-time-picker-select id="select-02" label-text="Timezone" default-value="et">
        <cds-select-item value="et" selected="true">Eastern Time (ET)</cds-select-item>
        <cds-select-item value="ct">Central Time (CT)</cds-select-item>
        <cds-select-item value="mt">Mountain Time (MT)</cds-select-item>
        <cds-select-item value="pt">Pacific Time (PT)</cds-select-item>
      </cds-fluid-time-picker-select>
    </cds-fluid-time-picker>

    <cds-fluid-select id="select-1" label-text="Choose an option">
      <cds-select-item value=""></cds-select-item>
      <cds-select-item value="option-1">Option 1</cds-select-item>
      <cds-select-item value="option-2">Option 2</cds-select-item>
      <cds-select-item value="option-3">Option 3</cds-select-item>
      <cds-select-item value="option-4">Option 4</cds-select-item>
    </cds-fluid-select>
  </div>

  <div style="display:flex;">
    <cds-fluid-text-input id="test2" label="Text Input label" placeholder="Placeholder text"></cds-fluid-text-input>
    <cds-fluid-number-input
      id="input-default"
      label="Fluid Number Input"
      min="0" max="100" step="10" value="50">
    </cds-fluid-number-input>
  </div>

  <cds-fluid-textarea id="test3" label="Text Area label" placeholder="Placeholder text"></cds-fluid-textarea>
</form>
```

**Variant: FluidTextInput Default** (resolved):

```html
<div style="width:300px;">
  <cds-fluid-text-input
    placeholder="Placeholder text"
    label="Label">
  </cds-fluid-text-input>
</div>
```

**Variant: FluidTextInput WithToggletip**:

```html
<cds-fluid-text-input placeholder="Placeholder text">
  <cds-toggletip autoAlign="true" slot="label-text">
    Label
    <p slot="body-text">Additional field information here.</p>
  </cds-toggletip>
</cds-fluid-text-input>
```

**Variant: FluidTextInput Skeleton**:

```html
<div style="width:300px;">
  <cds-fluid-text-input-skeleton></cds-fluid-text-input-skeleton>
</div>
```

**Variant: FluidDropdown Default** (resolved):

```html
<div style="width:400px;">
  <cds-fluid-dropdown
    direction="bottom"
    label="Choose an option"
    title-text="Label">
    <cds-dropdown-item value="option-0">Lorem, ipsum dolor sit amet consectetur adipisicing elit.</cds-dropdown-item>
    <cds-dropdown-item value="option-1">Option 1</cds-dropdown-item>
    <cds-dropdown-item value="option-2">Option 2</cds-dropdown-item>
    <cds-dropdown-item disabled value="option-3">Option 3 - a disabled item</cds-dropdown-item>
    <cds-dropdown-item value="option-4">Option 4</cds-dropdown-item>
  </cds-fluid-dropdown>
</div>
```

**Variant: FluidNumberInput Default** (resolved — note 80px right padding gutter for steppers):

```html
<div style="width:400px;">
  <cds-fluid-number-input label="Label" value="50" min="0" max="100" step="1">
  </cds-fluid-number-input>
</div>
```

**Variant: FluidSearch Default** (resolved):

```html
<div style="width:400px;">
  <cds-fluid-search
    autocomplete="off"
    close-button-label-text="Clear search input"
    label-text="Search"
    placeholder="Prompt text"
    role="searchbox">
  </cds-fluid-search>
</div>
```

**Variant: FluidTextArea Default** (resolved):

```html
<div style="width:300px;">
  <cds-fluid-textarea
    enable-counter label="Text Area label"
    max-count="500" placeholder="Placeholder text"
    rows="4" cols="0">
  </cds-fluid-textarea>
</div>
```

**Variant: FluidMultiSelect Filterable** (resolved — same items array as Default, with `filterable="true"`):

```html
<div style="width:400px">
  <cds-fluid-multi-select direction="bottom" filterable="true" locale="en"
    title-text="Label" selection-feedback="top-after-reopen" label="">
    <cds-multi-select-item value="example">An example option that is really long to show what should be done to handle long text</cds-multi-select-item>
    <cds-multi-select-item value="all">Option 1</cds-multi-select-item>
    <cds-multi-select-item value="cloudFoundry">Option 2</cds-multi-select-item>
    <cds-multi-select-item disabled value="staging">Option 3 - a disabled item</cds-multi-select-item>
    <cds-multi-select-item value="dea">Option 4</cds-multi-select-item>
    <cds-multi-select-item value="router">Option 5</cds-multi-select-item>
  </cds-fluid-multi-select>
</div>
```

## Design Tokens (component-scoped)

> Resolved from `overview.md` — every Fluid* input pulls from the same shared semantic tokens (`field`, `border-strong-01`, `text-secondary`, `text-helper`, `support-error`, `focus`, etc.). The rows below resolve those semantic tokens to literal hex values for the White (default light) and G100 (default dark) themes.

```css
[data-theme="white"] {
  /* Field background — every Fluid input rests on `--cds-field` (= field-01) */
  --cds-fluid-field-background: #f4f4f4;            /* --cds-field / --cds-field-01 */
  --cds-fluid-field-background-modal: #ffffff;      /* --cds-field-02 — auto-applied inside .cds--modal */
  --cds-fluid-field-background-layer-02: #ffffff;   /* --cds-field-02 in WithLayer second tier */
  --cds-fluid-field-background-layer-03: #f4f4f4;   /* --cds-field-03 in WithLayer third tier */
  --cds-fluid-field-hover: #e8e8e8;                 /* --cds-field-hover-01 */

  /* Border (bottom only — collapses between siblings) */
  --cds-fluid-border-bottom: #8d8d8d;               /* --cds-border-strong-01 */
  --cds-fluid-border-bottom-warning: #8d8d8d;       /* --cds-border-strong-01 — warning keeps strong border */
  --cds-fluid-border-bottom-disabled: #c6c6c6;      /* --cds-border-disabled */
  --cds-fluid-divider: #e0e0e0;                     /* --cds-border-subtle — appears between Fluid form-requirement and next field when invalid/warn */

  /* Text */
  --cds-fluid-label-text: #525252;                  /* --cds-text-secondary — the inset label */
  --cds-fluid-value-text: #161616;                  /* --cds-text-primary */
  --cds-fluid-value-text-readonly: #525252;         /* --cds-text-secondary */
  --cds-fluid-placeholder: #a8a8a8;                 /* --cds-text-placeholder */
  --cds-fluid-helper: #6f6f6f;                      /* --cds-text-helper — only visible OUTSIDE FluidForm; helper text is HIDDEN in Fluid mode */
  --cds-fluid-error-text: #da1e28;                  /* --cds-text-error */
  --cds-fluid-disabled-text: rgba(22, 22, 22, 0.25);/* --cds-text-disabled */

  /* Icons (chevron, magnifier, stepper arrows, invalid icon, etc.) */
  --cds-fluid-icon: #161616;                        /* --cds-icon-primary */
  --cds-fluid-icon-secondary: #525252;              /* --cds-icon-secondary */
  --cds-fluid-icon-disabled: rgba(22, 22, 22, 0.25);/* --cds-icon-disabled */
  --cds-fluid-icon-error: #da1e28;                  /* --cds-support-error */
  --cds-fluid-icon-warning: #f1c21b;                /* --cds-support-warning */

  /* Focus / state outlines */
  --cds-fluid-focus: #0f62fe;                       /* --cds-focus */
  --cds-fluid-focus-invalid: #da1e28;               /* --cds-support-error */
  --cds-fluid-overlay-hover: rgba(141, 141, 141, 0.12); /* --cds-background-hover */

  /* Skeleton */
  --cds-fluid-skeleton-background: #e8e8e8;         /* --cds-skeleton-background */
  --cds-fluid-skeleton-element: #c6c6c6;            /* --cds-skeleton-element */

  /* AI surfaces (used by FluidDropdown / FluidSelect / FluidComboBox / FluidMultiSelect when decorator={aiLabel}) */
  --cds-fluid-ai-aura-start: rgba(69, 137, 255, 0.1);    /* --cds-ai-aura-start */
  --cds-fluid-ai-aura-end: rgba(255, 255, 255, 0);
  --cds-fluid-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-fluid-ai-border-end: #78a9ff;
  --cds-fluid-ai-border-strong: #4589ff;
  --cds-fluid-ai-popover-background: #ffffff;
  --cds-fluid-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-fluid-ai-drop-shadow: rgba(15, 98, 254, 0.1);
}

[data-theme="g100"],
.dark {
  /* Field background */
  --cds-fluid-field-background: #262626;            /* --cds-field-01 */
  --cds-fluid-field-background-modal: #393939;      /* --cds-field-02 */
  --cds-fluid-field-background-layer-02: #393939;
  --cds-fluid-field-background-layer-03: #525252;
  --cds-fluid-field-hover: #333333;                 /* --cds-field-hover-01 */

  /* Border */
  --cds-fluid-border-bottom: #6f6f6f;               /* --cds-border-strong-01 */
  --cds-fluid-border-bottom-warning: #6f6f6f;
  --cds-fluid-border-bottom-disabled: #525252;      /* --cds-border-disabled */
  --cds-fluid-divider: #393939;                     /* --cds-border-subtle */

  /* Text */
  --cds-fluid-label-text: #c6c6c6;                  /* --cds-text-secondary */
  --cds-fluid-value-text: #f4f4f4;                  /* --cds-text-primary */
  --cds-fluid-value-text-readonly: #c6c6c6;
  --cds-fluid-placeholder: #6f6f6f;                 /* --cds-text-placeholder */
  --cds-fluid-helper: #c6c6c6;                      /* --cds-text-helper */
  --cds-fluid-error-text: #ff8389;                  /* --cds-text-error */
  --cds-fluid-disabled-text: rgba(244, 244, 244, 0.25);

  /* Icons */
  --cds-fluid-icon: #f4f4f4;                        /* --cds-icon-primary */
  --cds-fluid-icon-secondary: #c6c6c6;
  --cds-fluid-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-fluid-icon-error: #fa4d56;                  /* --cds-support-error */
  --cds-fluid-icon-warning: #f1c21b;                /* --cds-support-warning (same in both themes) */

  /* Focus */
  --cds-fluid-focus: #ffffff;                       /* --cds-focus */
  --cds-fluid-focus-invalid: #fa4d56;
  --cds-fluid-overlay-hover: rgba(141, 141, 141, 0.16);

  /* Skeleton */
  --cds-fluid-skeleton-background: #353535;
  --cds-fluid-skeleton-element: #525252;

  /* AI surfaces */
  --cds-fluid-ai-aura-start: rgba(69, 137, 255, 0.4);
  --cds-fluid-ai-aura-end: rgba(38, 38, 38, 0);
  --cds-fluid-ai-border-start: rgba(69, 137, 255, 0.36);
  --cds-fluid-ai-border-end: #4589ff;
  --cds-fluid-ai-border-strong: #4589ff;
  --cds-fluid-ai-popover-background: #262626;
  --cds-fluid-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-fluid-ai-drop-shadow: rgba(0, 0, 0, 0.6);
}
```

## States Reference (from .scss)

> Values pulled from `_form.scss`, `_fluid-text-input.scss`, `_fluid-text-area.scss`, `_fluid-number-input.scss`, `_fluid-search.scss`, `_fluid-time-picker.scss`, `_fluid-select.scss`, `_fluid-dropdown.scss`, `_fluid-multiselect.scss`, `_fluid-combo-box.scss`, `_fluid-date-picker.scss`, and `_fluid-list-box.scss`.

### FluidForm wrapper (`.cds--form--fluid`)

| State | Property | White value | G100 value |
|---|---|---|---|
| Rest | wrapper background | transparent (children paint their own `field` background) | transparent |
| Rest | child border-block-end | `1px solid #8d8d8d` | `1px solid #6f6f6f` |
| Rest | child border (top / left / right) | none | none |
| Rest | gap between sibling fields | `0` (collapsed; fields touch — borders share) | `0` |
| Invalid | child border-block-end | none — replaced by `outline: 2px solid #da1e28; outline-offset: -2px` | none — `outline: 2px solid #fa4d56; outline-offset: -2px` |
| Invalid | child form-requirement padding | `8px 40px 8px 16px` | same |
| Invalid | child form-requirement color | `#da1e28` | `#fa4d56` |
| Warn | child border-block-end | `1px solid #8d8d8d` (kept — only differentiated by `<svg>` icon) | `1px solid #6f6f6f` |
| Helper text | helper-text element | `display: none` (hidden in Fluid mode — Toggletip is the substitute) | same |

### Per-field Fluid* primitive (FluidTextInput / FluidTextArea / FluidNumberInput / FluidDropdown / FluidSelect / FluidComboBox / FluidMultiSelect / FluidSearch / FluidTimePicker / FluidDatePicker)

| State | Background | Border-block-end | Outline | Label color | Value color | Other |
|---|---|---|---|---|---|---|
| Rest | `#f4f4f4` (W) / `#262626` (G100) | `1px solid #8d8d8d` (W) / `#6f6f6f` (G100) | none | `#525252` (W) / `#c6c6c6` (G100) | `#161616` (W) / `#f4f4f4` (G100) | label inset 13px from top, 16px inset-inline-start; value pad `32px 16px 13px` |
| Hover | `#e8e8e8` (W) / `#333333` (G100) | (rest) | none | (rest) | (rest) | cursor: text on input area |
| Focus-visible | (rest) | none | `2px solid #0f62fe` (W) / `#ffffff` (G100), `outline-offset: -2px` | (rest) | (rest) | NumberInput stepper buttons gain `box-shadow: inset 0 -1px $focus` |
| Active | (rest) | (rest) | (rest) | (rest) | (rest) | — |
| Disabled | (rest) | `1px solid #c6c6c6` (W) / `#525252` (G100) | none | `rgba(22,22,22,0.25)` (W) / `rgba(244,244,244,0.25)` (G100) | `rgba(22,22,22,0.25)` (W) / `rgba(244,244,244,0.25)` (G100) | `cursor: not-allowed` |
| Read-only | (rest) | (rest) | none on focus | (rest) | `#525252` (W) / `#c6c6c6` (G100) | input not editable; cursor: default |
| Invalid (rest) | (rest) | none | `2px solid #da1e28` (W) / `#fa4d56` (G100), `outline-offset: -2px` | (rest) | (rest) | `<svg>` invalid icon at `inset-block-start: 80px` (in helper band) |
| Invalid (focus) | (rest) | none | `2px solid #0f62fe` (W) / `#ffffff` (G100) | (rest) | (rest) | focus outline replaces invalid outline |
| Warn (rest) | (rest) | `1px solid #8d8d8d` | none | (rest) | (rest) | `<svg>` warning icon at `inset-block-start: 80px`, fill `#f1c21b` |
| Warn (focus) | (rest) | (rest) | `2px solid #0f62fe` (W) / `#ffffff` (G100) | (rest) | (rest) | — |
| With aiLabel decorator | aiAura gradient overlay (`rgba(69,137,255,0.1) → transparent`) | (rest) | `inset 0 0 0 1px var(--cds-ai-border-strong)` (`#4589ff`) | (rest) | (rest) | decorator slot at `inset-block-start: 42px; inset-inline-end: 16px` |
| Skeleton | `#e8e8e8` (W) / `#353535` (G100) | `1px solid #c6c6c6` (W) / `#525252` (G100) | none | bar `#c6c6c6` (W) / `#525252` (G100) at `inset-block-start: 16px`, 50% width × 8px tall | bar `#c6c6c6` at `inset-block-start: 36px`, 25% width × 8px tall | total block-size 64px |

### Specific to FluidNumberInput stepper buttons

| State | Background | Border | Box-shadow | Notes |
|---|---|---|---|---|
| Rest stepper | transparent | `border-block-end: 1px solid var(--cds-border-strong-01)` | none | 40px × 40px, sits inset-block-start: 23px (centered in lower 40px of 64px field) |
| Stepper while parent input focused | transparent | `border-block-end-color: #0f62fe` (W) / `#ffffff` (G100) | `inset 0 -1px $focus` (last-of-type also `inset -2px 0 $focus`) | the focus ring "wraps" the stepper |
| Stepper hover | `--cds-background-hover` (`rgba(141,141,141,0.12)`) | (rest) | (rest) | — |
| Stepper invalid (focused parent) | transparent | `border-block-end-color: transparent` | `none` | invalid outline on parent takes over |

### Specific to FluidSearch close button

| State | Width | Background | Notes |
|---|---|---|---|
| Rest close button | 40px | transparent | hidden when value is empty |
| Visible close button (when value present) | 40px | transparent | inset-inline-end: 0; centered vertically |
| Hover close button | (rest) | `--cds-background-hover` | — |

## Animation & Motion

Carbon's source uses these motion tokens for Fluid components (extracted from `_fluid-text-input.scss` lines 23-27 and shared in every other Fluid file):

```css
.cds--text-input--fluid.cds--text-input-wrapper,
.cds--text-area--fluid .cds--text-area__wrapper,
.cds--number-input--fluid,
.cds--search--fluid,
.cds--time-picker--fluid,
.cds--dropdown--fluid,
.cds--select--fluid,
.cds--combo-box--fluid,
.cds--multi-select--fluid,
.cds--date-picker--fluid {
  /* duration-fast-01 = 70ms; productive-standard easing = cubic-bezier(0.2, 0, 0.38, 0.9) */
  transition:
    background-color 70ms cubic-bezier(0.2, 0, 0.38, 0.9),
    outline 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

/* Password-toggle button (FluidTextInput type="password") */
.cds--text-input--fluid .cds--toggle-password-tooltip {
  transition: outline 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

@media (prefers-reduced-motion: reduce) {
  .cds--text-input--fluid.cds--text-input-wrapper,
  .cds--text-area--fluid .cds--text-area__wrapper,
  .cds--number-input--fluid,
  .cds--search--fluid,
  .cds--time-picker--fluid,
  .cds--dropdown--fluid,
  .cds--select--fluid,
  .cds--combo-box--fluid,
  .cds--multi-select--fluid,
  .cds--date-picker--fluid,
  .cds--text-input--fluid .cds--toggle-password-tooltip {
    transition: none;
  }
}
```

**Skeleton shimmer** — every `*Skeleton` re-uses the global `@keyframes skeleton` defined in `@carbon/styles/scss/utilities/_skeleton.scss`:

```css
@keyframes skeleton {
  0% {
    opacity: 0.3;
    transform: translate3d(-100%, 0, 0);
  }
  20% {
    opacity: 1;
    transform: translate3d(-100%, 0, 0);
  }
  100% {
    transform: translate3d(100%, 0, 0);
  }
}

.cds--skeleton::before {
  /* duration-moderate-02 = 480ms; expressive-standard easing = cubic-bezier(0.4, 0.14, 0.3, 1) */
  animation: 3s ease-in-out skeleton infinite;
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic element (wrapper):** `<form class="cds--form--fluid">` (React `<FluidForm>` always renders a `<form>`; WC users wrap with `<cds-form class="cds--form--fluid">` since no `<cds-fluid-form>` exists).
- **Semantic elements (children):** Each Fluid* primitive renders the same semantic element as its non-Fluid sibling — `<input type="text">`, `<input type="number">`, `<input type="search">`, `<select>`, `<textarea>`, custom `<cds-dropdown>` listbox, etc. The `--fluid` modifier is a CSS-only restyle; it does not change the underlying element.
- **Label association:** Every Fluid input keeps a real `<label>` element wired up via `for` / `id`. Even though the label SITS INSIDE the field visually, the DOM relationship is preserved — screen readers announce "{label}, edit text" correctly.
- **Toggletip-as-label:** when `<ToggletipLabel>` is passed to `labelText`, the visible label text is wrapped in a `<button>` (the Toggletip trigger). Carbon ensures the button's label includes the field's label string so screen readers still announce correctly.
- **Hidden helper text:** Fluid mode hides standard helper text via `.cds--form__helper-text { display: none }`. Use Toggletip-as-label as the substitute (the Storybook "DefaultWithToggletip" variant in every Fluid* story shows this pattern). Do NOT pass `helperText=` to a Fluid input expecting it to render — it will be visually hidden but still in the accessibility tree, which is misleading.
- **Invalid / warning text:** `<div class="cds--form-requirement">` becomes `display: block` when `data-invalid` or `--warning` is present. It is announced by screen readers via `aria-describedby` (Carbon wires this automatically).
- **Required state:** Fluid does NOT render a visible "required" asterisk. Pass `required` to the underlying input so the form-level browser validation triggers; pair with a sentence-form invalidText for screen-reader users.
- **Touch target:** Every Fluid input is **64px** tall on every breakpoint — well above the 44×44 WCAG 2.5.5 target. The interior 40px stepper buttons (NumberInput) and 40px close button (Search) sit centered inside that 64px field, so the entire 64px row is touch-active.
- **Focus management:** Carbon's CSS provides `:focus-within` with a 2px solid outline (inset by `outline-offset: -2px`) on every Fluid wrapper — DO NOT remove it. The focus ring also wraps the NumberInput stepper buttons so they share the parent's focus state visually.
- **Keyboard:**
  - Tab / Shift+Tab cycle through fields in DOM order. Fluid never traps focus.
  - Enter inside a `<form>` submits (browser default). FluidForm does not preventDefault.
  - For Dropdown / ComboBox / MultiSelect / TimePickerSelect: Space opens, Enter selects, Up/Down navigates options, Home/End jump to first/last, type-ahead filters.
  - For NumberInput: Up / Down arrow on the input increment / decrement by `step`; PageUp / PageDown step by 10×; Shift+arrow steps by 10×.
  - For DatePicker: Arrow keys move focus across calendar dates; Enter selects.

## Do / Don't

| Do | Don't |
|---|---|
| Use FluidForm to wrap **dense data-entry forms** (modals, side panels, settings pages) where vertical real estate matters. | Don't use FluidForm for short forms (1–2 inputs) — the inset label saves no space and looks visually heavier than the standard input. |
| Stack Fluid* primitives directly inside `<FluidForm>` so their borders collapse into a single seam between fields. | Don't put `margin-block: 16px;` between Fluid fields — it breaks the border-collapse aesthetic that defines the pattern. |
| Use the Toggletip-as-label pattern (`<ToggletipLabel>` + `<Toggletip>`) when you need helper context — Fluid HIDES standard helper text. | Don't pass `helperText=` to a Fluid* input expecting it to render — the CSS hides it but it stays in the a11y tree, confusing screen-reader users. |
| Output the Storybook code AS-IS for Carbon outputs — borrow the `additionalProps`, `TextInputProps`, `TextAreaProps` shared constants verbatim from `FluidForm.stories.js`. | Don't paraphrase or rewrite — use the verbatim code. The Carbon source is the truth. |
| Use `.cds--form--fluid` on a `<form>` (or `<cds-form>`) as the wrapper — that is what the React `<FluidForm>` renders. | Don't invent a `<cds-fluid-form>` element — it doesn't ship in `@carbon/web-components`. Apply the class to `<cds-form>` instead. |
| Keep `border-radius: 0` on every Fluid field — Carbon is sharp by default. | Don't add `border-radius` to Fluid inputs. If you reach for `4px` or `8px`, you've left the Carbon system. |
| Wrap in `[data-theme="white"]` (or `[data-theme="g10"]`) for light, `[data-theme="g90"]` (or `[data-theme="g100"]`) for dark. | Don't define your own theme classes — they bypass the official `--cds-*` token resolution. |
| For modals, drop a FluidForm directly inside the modal body — Carbon's `_fluid-text-area.scss` automatically swaps `field` → `field-02` background so the form contrasts against the modal surface. | Don't manually re-set `--cds-field` on Fluid inside a modal — Carbon already handles the layer swap. |
| Use FluidNumberInput's 64px field as a single touch target — the 40px steppers sit inside it; the whole row is touch-active. | Don't shrink Fluid fields below 64px. The padding (`32px 16px 13px`) assumes that height — anything smaller clips the inset label. |
| Use FluidTimePicker / FluidDatePicker (range) when you need adjoining inputs to read as one fluid field — their internal borders collapse with each other, not just with sibling form fields. | Don't compose a TimePicker by stacking three separate FluidSelects — use the dedicated FluidTimePickerSelect children so the internal borders collapse correctly. |
| When using `decorator={aiLabel}`, the input gains an aiAura gradient + `inset 0 0 0 1px #4589ff` border indicating AI augmentation. The decorator slot lives at `inset-block-start: 42px`. | Don't add custom AI styling to a Fluid input — pass `decorator={<AILabel>}` and let Carbon's CSS apply the official aiAura tokens. |
| Use `<FluidForm>` only inside `<Layer>` contexts when the parent already paints a `field-02` background; otherwise let Layer handle the swap. | Don't nest two `<FluidForm>` wrappers — the outer wrapper's class is enough. The `FormContext` provider only needs to fire once. |
