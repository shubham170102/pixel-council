---
name: time-picker
description: Carbon TimePicker — text input for hours/minutes (HH:MM) paired with one or two TimePickerSelect dropdowns (typically AM/PM and timezone). Variants from Storybook — Default and _WithLayer (React); Default and WithLayer (Web Components).
metadata:
  tags: time-picker, time, time-input, timepicker, timezone, am-pm, form, ibm, carbon, react, web-components
---

# Time Picker -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`TimePicker.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/TimePicker/TimePicker.stories.js)
> - **WC story:** [`time-picker.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/time-picker/time-picker.stories.ts)
> - **SCSS (shared / styles package):** [`_time-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/time-picker/_time-picker.scss)
> - **WC SCSS (host wiring):** [`time-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/time-picker/time-picker.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-timepicker--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-time-picker--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/time-picker/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Heights (sm / md / lg) | `32px` / `40px` / `48px` (applied to BOTH `.cds--time-picker__input-field` and the paired `.cds--select-input`) |
| Time-input inline-size (rest) | `4.875rem` (`78px`) — fits "HH:MM" comfortably |
| Time-input inline-size (invalid / warn — error icon visible) | `6.175rem` (`98.8px`) — extra room so the error icon doesn't overlap the value |
| Select inline-size | `auto`, with `padding-inline-end: 48px` (`3rem`) so the chevron clears the value text |
| Select gap | `margin-inline-start: 2px` (`spacing-01`) — the AM/PM and timezone selects sit immediately to the right of the time input |
| Padding-inline (input — inherits text-input) | `0 16px` (`spacing-05`) |
| Corner radius | `0` (Carbon: sharp by default — applies to BOTH the time-input AND the paired selects) |
| Border treatment | **Bottom-only** on both input and select: `border-block-end: 1px solid var(--cds-border-strong-01)` (inherits text-input + select) |
| Background — time input (White theme, `field-01`) | `#f4f4f4` |
| Background — time input (G100 theme, `field-01`) | `#262626` |
| Background — select (White theme, `field-01`) | `#f4f4f4` |
| Background — select (G100 theme, `field-01`) | `#262626` |
| Background — select (legacy `--light` modifier, White, `field-02`) | `#ffffff` |
| Background — select (legacy `--light` modifier, G100, `field-02`) | `#393939` |
| Border-strong-01 (White) | `#8d8d8d` |
| Border-strong-01 (G100) | `#6f6f6f` |
| Focus ring | Bottom border becomes `2px solid var(--cds-focus)` plus `outline: 2px solid var(--cds-focus); outline-offset: -2px` |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Error icon position | `inset-inline-end: 1rem` (`16px`), vertically centered via `transform: translateY(-50%)` |
| Warning border / icon | `var(--cds-support-warning)` — `#f1c21b` (both themes) |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Placeholder color | `var(--cds-text-placeholder)` — White: `#a8a8a8`, G100: `#6f6f6f`. WC default placeholder: `hh:mm` |
| Read-only border | `var(--cds-border-subtle)` (lower contrast than `border-strong-01` so the field reads as non-editable) |
| Disabled chevron (read-only and disabled selects) | `var(--cds-icon-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Layout | `display: flex; align-items: flex-end;` — input + selects align on their bottom border |
| Font | IBM Plex Sans for label / helper / select value; **IBM Plex Mono `code-02`** for the time-input value (so HH:MM digits are evenly spaced) |
| Type token (input value) | `code-02` — `14px / 20px / 400 / 0.32px / IBM Plex Mono` |
| Transition | `outline 70ms cubic-bezier(0.2, 0, 0.38, 0.9), background-color 70ms cubic-bezier(0.2, 0, 0.38, 0.9)` (`fast-01` + `productive-standard`) |
| React import | `import { TimePicker, TimePickerSelect, SelectItem } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/time-picker/index.js';` |
| WC element names | `<cds-time-picker>`, `<cds-time-picker-select>`, `<cds-select-item>` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `TimePicker.stories.js` | Standard time picker — text input ("hh:mm") + two selects (AM/PM and timezone). Wired to all argTypes (size, disabled, hideLabel, invalid, invalidText, warning, warningText, labelText). |
| WithLayer | `_WithLayer` | `TimePicker.stories.js` | Demonstrates `field-01 / 02 / 03` token swap across nested `<WithLayer>` contexts. Renders one TimePicker per layer (3 stacked). |
| WC: Default | `Default` | `time-picker.stories.ts` | Renders `<cds-time-picker>` with paired `<cds-time-picker-select>` for AM/PM and timezone. Adds `placeholder="hh:mm"`, `max-length`, `type`, `value`, `readOnly` argTypes that React's story does not expose at the top level. |
| WC: WithLayer | `WithLayer` | `time-picker.stories.ts` | Same `withLayers` decorator pattern as React `_WithLayer`. |

> The `controls.exclude` list on the React story (`['inputClassName', 'pickerClassName', 'id', 'light', 'pattern']`) hides those props from the Storybook UI but they remain valid component API. `light` is the v9-era prop that switches the paired select's background from `field-01` to `field-02` — the SCSS preserves `.cds--time-picker--light` for backward compat (marked "V11: Possibly deprecate" in the source). `pattern` is forwarded to the underlying `<input>` for HTML5 pattern validation (e.g., `pattern="(1[012]|[1-9]):[0-5][0-9](\\s)?"`).

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `TimePicker.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of `TimePicker.stories.js`):

```jsx
import React from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import SelectItem from '../SelectItem';
import TimePicker from './TimePicker';
import TimePickerSelect from '../TimePickerSelect';
import mdx from './TimePicker.mdx';
```

**Default export** (story metadata + global controls/exclusions):

```jsx
export default {
  title: 'Components/TimePicker',
  component: TimePicker,
  subcomponents: {
    TimePickerSelect,
    SelectItem,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['inputClassName', 'pickerClassName', 'id', 'light', 'pattern'],
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <TimePicker id="time-picker" labelText="Select a time" {...args}>
      <TimePickerSelect id="time-picker-select-1" disabled={args.disabled}>
        <SelectItem value="AM" text="AM" />
        <SelectItem value="PM" text="PM" />
      </TimePickerSelect>
      <TimePickerSelect id="time-picker-select-2" disabled={args.disabled}>
        <SelectItem value="Time zone 1" text="Time zone 1" />
        <SelectItem value="Time zone 2" text="Time zone 2" />
      </TimePickerSelect>
    </TimePicker>
  );
};

Default.args = {
  disabled: false,
  hideLabel: false,
  invalid: false,
  warning: false,
};

Default.argTypes = {
  disabled: {
    control: {
      type: 'boolean',
    },
  },
  hideLabel: {
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
    control: { type: 'text' },
  },
  warning: {
    control: {
      type: 'boolean',
    },
  },
  warningText: {
    control: { type: 'text' },
  },
  labelText: {
    control: { type: 'text' },
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
  },
};
```

**Variant: _WithLayer**

```jsx
export const _WithLayer = () => (
  <WithLayer>
    {(layer) => (
      <TimePicker id={`time-picker-${layer}`} labelText="Select a time">
        <TimePickerSelect id={`time-picker-select-${layer}-1`}>
          <SelectItem value="AM" text="AM" />
          <SelectItem value="PM" text="PM" />
        </TimePickerSelect>
        <TimePickerSelect id={`time-picker-select-${layer}-2`}>
          <SelectItem value="Time zone 1" text="Time zone 1" />
          <SelectItem value="Time zone 2" text="Time zone 2" />
        </TimePickerSelect>
      </TimePicker>
    )}
  </WithLayer>
);
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `time-picker.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of `time-picker.stories.ts`):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import './index';
import '../form/form-item';
import './time-picker-select';
import '../select/select-item';
import './time-picker';
import { withLayers } from '../../../.storybook/decorators/with-layers';
```

**Shared args + argTypes** (apply to every WC story unless overridden):

```ts
const args = {
  disabled: false,
  hideLabel: false,
  invalid: false,
  invalidText: 'Error message goes here',
  warningText: 'Warning message goes here',
  labelText: 'Select a time',
  placeholder: 'hh:mm',
  readOnly: false,
  size: 'md',
  value: '',
  warning: false,
  maxLength: 5,
  type: 'text',
};

const argTypes = {
  disabled: {
    control: 'boolean',
    description: 'Disabled (disabled)',
  },
  hideLabel: {
    control: 'boolean',
    description: 'Hide label (hide-label)',
  },
  invalid: {
    control: 'boolean',
    description: 'Invalid (invalid)',
  },
  invalidText: {
    control: 'text',
    description: 'Invalid text (invalid-text)',
  },
  labelText: {
    control: 'text',
    description: 'Label text (label)',
  },
  placeholder: {
    control: 'text',
    description: 'Placeholder text (placeholder)',
  },
  readOnly: {
    control: 'boolean',
    description: 'Read only (readOnly)',
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: 'select',
    description: 'Size (size)',
  },
  value: {
    control: 'text',
    description: 'Value (value)',
  },
  warning: {
    control: 'boolean',
    description: 'Warning (warning)',
  },
  warningText: {
    control: 'text',
    description: 'Warn text (warning-text)',
  },
  maxLength: {
    control: 'number',
    description: 'Max length (max-length)',
  },
  type: {
    control: 'text',
    description: 'Type (type)',
  },
};
```

**Variant: Default**

```ts
export const Default = {
  args,
  argTypes,
  render: ({
    disabled,
    hideLabel,
    invalid,
    invalidText,
    labelText,
    placeholder,
    readOnly,
    size,
    value,
    warning,
    warningText,
    maxLength,
    type,
  }) => html`
    <cds-time-picker
      id="time-picker"
      ?hide-label="${hideLabel}"
      ?invalid="${invalid}"
      invalid-text="${ifDefined(invalidText)}"
      label-text="${ifDefined(labelText)}"
      placeholder="${ifDefined(placeholder)}"
      ?readonly="${readOnly}"
      ?disabled="${disabled}"
      size="${ifDefined(size)}"
      value="${ifDefined(value)}"
      ?warning="${warning}"
      max-length="${ifDefined(maxLength)}"
      type="${ifDefined(type)}"
      warning-text="${ifDefined(warningText)}">
      <cds-time-picker-select
        default-value="AM"
        id="time-picker-select-1"
        ?disabled="${disabled}"
        aria-label="Select AM/PM">
        <cds-select-item value="AM" selected="true">AM</cds-select-item>
        <cds-select-item value="PM">PM</cds-select-item>
      </cds-time-picker-select>
      <cds-time-picker-select
        default-value="Time zone 1"
        id="time-picker-select-2"
        ?disabled="${disabled}"
        aria-label="Select timezone">
        <cds-select-item value="Time zone 1" text="Time zone 1"
          >Time zone 1</cds-select-item
        >
        <cds-select-item value="Time zone 2" text="Time zone 2" selected
          >Time zone 2</cds-select-item
        >
      </cds-time-picker-select>
    </cds-time-picker>
  `,
};
```

**Variant: WithLayer**

```ts
export const WithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  render: () => html`
    <cds-time-picker
      id="time-picker"
      labelText="Select a time"
      placeholder="hh:mm">
      <cds-time-picker-select
        id="time-picker-select-1"
        default-value="AM"
        aria-label="Select AM/PM">
        <cds-select-item value="AM">AM</cds-select-item>
        <cds-select-item value="PM" selected>PM</cds-select-item>
      </cds-time-picker-select>
      <cds-time-picker-select
        id="time-picker-select-2"
        aria-label="Select timezone"
        default-value="Time zone 1">
        <cds-select-item value="Time zone 1" text="Time zone 1"
          >Time zone 1</cds-select-item
        >
        <cds-select-item value="Time zone 2" text="Time zone 2" selected
          >Time zone 2</cds-select-item
        >
      </cds-time-picker-select>
    </cds-time-picker>
  `,
};

export default {
  title: 'Components/Time Picker',
};
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${disabled}` → either present or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. The custom-element tags (`<cds-time-picker>` etc.) still require the WC bundle to be imported in the page.

**Variant: Default (rest, md, with AM and Time zone selects)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="md"
  max-length="5"
  type="text">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
  <cds-time-picker-select
    default-value="Time zone 1"
    id="time-picker-select-2"
    aria-label="Select timezone">
    <cds-select-item value="Time zone 1" text="Time zone 1">Time zone 1</cds-select-item>
    <cds-select-item value="Time zone 2" text="Time zone 2" selected>Time zone 2</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (invalid)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="md"
  max-length="5"
  type="text"
  invalid
  invalid-text="Error message goes here">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
  <cds-time-picker-select
    default-value="Time zone 1"
    id="time-picker-select-2"
    aria-label="Select timezone">
    <cds-select-item value="Time zone 1" text="Time zone 1">Time zone 1</cds-select-item>
    <cds-select-item value="Time zone 2" text="Time zone 2" selected>Time zone 2</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (warning)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="md"
  max-length="5"
  type="text"
  warning
  warning-text="Warning message goes here">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
  <cds-time-picker-select
    default-value="Time zone 1"
    id="time-picker-select-2"
    aria-label="Select timezone">
    <cds-select-item value="Time zone 1" text="Time zone 1">Time zone 1</cds-select-item>
    <cds-select-item value="Time zone 2" text="Time zone 2" selected>Time zone 2</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (disabled)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="md"
  max-length="5"
  type="text"
  disabled>
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    disabled
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
  <cds-time-picker-select
    default-value="Time zone 1"
    id="time-picker-select-2"
    disabled
    aria-label="Select timezone">
    <cds-select-item value="Time zone 1" text="Time zone 1">Time zone 1</cds-select-item>
    <cds-select-item value="Time zone 2" text="Time zone 2" selected>Time zone 2</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (read-only with value)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="md"
  max-length="5"
  type="text"
  readonly
  value="11:30">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
  <cds-time-picker-select
    default-value="Time zone 1"
    id="time-picker-select-2"
    aria-label="Select timezone">
    <cds-select-item value="Time zone 1" text="Time zone 1">Time zone 1</cds-select-item>
    <cds-select-item value="Time zone 2" text="Time zone 2" selected>Time zone 2</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (small / sm — 32px)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="sm"
  max-length="5"
  type="text">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (large / lg — 48px)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time"
  placeholder="hh:mm"
  size="lg"
  max-length="5"
  type="text">
  <cds-time-picker-select
    default-value="AM"
    id="time-picker-select-1"
    aria-label="Select AM/PM">
    <cds-select-item value="AM" selected="true">AM</cds-select-item>
    <cds-select-item value="PM">PM</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

**Variant: Default (24-hour, no AM/PM select)**

```html
<cds-time-picker
  id="time-picker"
  label-text="Select a time (24-hour)"
  placeholder="HH:MM"
  size="md"
  max-length="5"
  type="text">
  <cds-time-picker-select
    default-value="UTC"
    id="time-picker-select-tz"
    aria-label="Select timezone">
    <cds-select-item value="UTC" selected="true">UTC</cds-select-item>
    <cds-select-item value="EST">EST</cds-select-item>
    <cds-select-item value="PST">PST</cds-select-item>
  </cds-time-picker-select>
</cds-time-picker>
```

> Variants above mirror Storybook's `Default` story with each individual arg (`invalid`, `warning`, `disabled`, `readOnly`, `size`) toggled in turn — these are the canonical states a user can produce by flipping the Storybook controls. The 24-hour example uses only the timezone select (omits the AM/PM select); Carbon's `<cds-time-picker>` accepts any number of `<cds-time-picker-select>` children.

## Anatomy & DOM Structure

```
<cds-time-picker> (display: flex, align-items: flex-end)
├── label (above the row, IBM Plex Sans, label-01 = 12px / 16px / 400)
├── .cds--time-picker__input (relative wrapper, flex column)
│   ├── input.cds--time-picker__input-field (the HH:MM text input — 78px wide, IBM Plex Mono code-02)
│   └── .cds--time-picker__error__icon (absolute, inset-inline-end: 16px, only when invalid OR warning)
├── .cds--time-picker__select #1 (the AM/PM select — extends .cds--select)
│   └── select.cds--select-input (auto-width, padding-inline-end: 48px, chevron right of value)
├── .cds--time-picker__select #2 (optional — the timezone select; same styling as #1)
│   └── select.cds--select-input
└── helper text OR invalid-text OR warning-text (below the row, helper-text-01 = 12px / 16px / 400)
```

**Layout rules (from `_time-picker.scss`):**
- The outer `.cds--time-picker` is `display: flex` with `align-items: flex-end` so the input and the selects share a single bottom border line, even though the label sits above only the input.
- Each `.cds--time-picker__select` has `margin-inline-start: spacing-01` (`2px`) — that's the only horizontal gap between the input and the first select, and between the two selects. There is NO larger spacing.
- `.cds--time-picker__input` is `position: relative` so the absolute-positioned error icon (`__error__icon`) anchors to the input column (not the whole picker row).
- `.cds--time-picker .cds--select-input` overrides the standard select width: `inline-size: auto` instead of `100%`, plus `min-inline-size: auto` so the select can shrink to its content + 48px chevron padding. Without this, the select would stretch to fill the picker row.

## Design Tokens (component-scoped)

Carbon does not ship time-picker–specific tokens. The component reuses text-input + select tokens (which all resolve from the theme `field-*`, `border-*`, `text-*`, `support-*`, and `focus` families). The literal hex resolutions for both default themes are:

```css
[data-theme="white"] {
  /* Time-input + select (rest) */
  --cds-time-picker-background: #f4f4f4;             /* field-01 */
  --cds-time-picker-text: #161616;                   /* text-primary */
  --cds-time-picker-placeholder: #a8a8a8;            /* text-placeholder */
  --cds-time-picker-border: #8d8d8d;                 /* border-strong-01 */
  --cds-time-picker-label: #525252;                  /* text-secondary */
  --cds-time-picker-helper: #6f6f6f;                 /* text-helper */

  /* Hover */
  --cds-time-picker-background-hover: #e8e8e8;       /* field-hover-01 */

  /* Focus */
  --cds-time-picker-focus: #0f62fe;                  /* focus */
  --cds-time-picker-focus-inset: #ffffff;            /* focus-inset */

  /* Invalid / warning */
  --cds-time-picker-error: #da1e28;                  /* support-error */
  --cds-time-picker-error-text: #da1e28;             /* text-error */
  --cds-time-picker-warning: #f1c21b;                /* support-warning */

  /* Disabled */
  --cds-time-picker-disabled-text: rgba(22, 22, 22, 0.25);     /* text-disabled */
  --cds-time-picker-disabled-icon: rgba(22, 22, 22, 0.25);     /* icon-disabled */
  --cds-time-picker-disabled-background: transparent;
  --cds-time-picker-disabled-border: transparent;

  /* Read-only */
  --cds-time-picker-readonly-background: transparent;
  --cds-time-picker-readonly-border: #c6c6c6;        /* border-subtle-01 */
  --cds-time-picker-readonly-icon: rgba(22, 22, 22, 0.25);     /* icon-disabled */

  /* Legacy `.cds--time-picker--light` modifier (V11: possibly deprecated) */
  --cds-time-picker-light-select-background: #ffffff;          /* field-02 */
  --cds-time-picker-light-select-background-hover: #e8e8e8;    /* field-hover */
}

[data-theme="g100"],
.dark {
  /* Time-input + select (rest) */
  --cds-time-picker-background: #262626;             /* field-01 */
  --cds-time-picker-text: #f4f4f4;                   /* text-primary */
  --cds-time-picker-placeholder: #6f6f6f;            /* text-placeholder */
  --cds-time-picker-border: #6f6f6f;                 /* border-strong-01 */
  --cds-time-picker-label: #c6c6c6;                  /* text-secondary */
  --cds-time-picker-helper: #c6c6c6;                 /* text-helper */

  /* Hover */
  --cds-time-picker-background-hover: #333333;       /* field-hover-01 */

  /* Focus — pure white in dark themes */
  --cds-time-picker-focus: #ffffff;                  /* focus */
  --cds-time-picker-focus-inset: #161616;            /* focus-inset */

  /* Invalid / warning */
  --cds-time-picker-error: #fa4d56;                  /* support-error */
  --cds-time-picker-error-text: #ff8389;             /* text-error */
  --cds-time-picker-warning: #f1c21b;                /* support-warning */

  /* Disabled */
  --cds-time-picker-disabled-text: rgba(244, 244, 244, 0.25);  /* text-disabled */
  --cds-time-picker-disabled-icon: rgba(244, 244, 244, 0.25);  /* icon-disabled */
  --cds-time-picker-disabled-background: transparent;
  --cds-time-picker-disabled-border: transparent;

  /* Read-only */
  --cds-time-picker-readonly-background: transparent;
  --cds-time-picker-readonly-border: #525252;        /* border-subtle-01 */
  --cds-time-picker-readonly-icon: rgba(244, 244, 244, 0.25);

  /* Legacy `.cds--time-picker--light` modifier */
  --cds-time-picker-light-select-background: #393939;          /* field-02 */
  --cds-time-picker-light-select-background-hover: #474747;    /* field-hover */
}
```

> The `--cds-time-picker-*` names above are pixel-council–scoped helpers for clarity; in real Carbon CSS the SCSS just references the underlying theme tokens directly (e.g., `$field-01`, `$border-strong-01`, `$focus`). When generating Carbon code, prefer the underlying `--cds-field-01`, `--cds-focus`, etc. — the component-scoped names exist here only to make the resolution graph visible at a glance.

## States Reference (from `_time-picker.scss`)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/time-picker/_time-picker.scss` plus the inherited rules from `_text-input.scss` and `_select.scss`. The time-picker file itself is intentionally thin (~129 lines) because most styling is delegated.

### Time input (`.cds--time-picker__input-field`)

| State | Background | Color | Border (block-end) | Outline | Other |
|---|---|---|---|---|---|
| Rest | `#f4f4f4` (`field-01`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong-01`) | none | inline-size: `4.875rem` (78px); font: IBM Plex Mono `code-02`; placeholder `#a8a8a8` |
| Hover | `#e8e8e8` (`field-hover-01`) | `#161616` | `1px solid #8d8d8d` | none | cursor: text |
| Focus-visible | (rest) | `#161616` | `2px solid #0f62fe` (`focus`) | `2px solid #0f62fe`, `outline-offset: -2px` | inset focus ring on top of the bottom border |
| Active (typing) | (rest) | `#161616` | `2px solid #0f62fe` | (focus) | — |
| Invalid | (rest) | `#161616` | `2px solid #da1e28` (`support-error`) | none | inline-size grows to `6.175rem` (98.8px); error icon visible at `inset-inline-end: 16px`; helper-row replaced by `invalid-text` (`#da1e28`) |
| Warning | (rest) | `#161616` | `1px solid #8d8d8d` | none | warning icon (`WarningAltFilled`) at `inset-inline-end: 16px`, `fill: #f1c21b`; warning-text below in `text-secondary` |
| Disabled | `transparent` | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | `1px solid transparent` | none | cursor: not-allowed; placeholder color matches text-disabled |
| Read-only | `transparent` | `#161616` | `1px solid #c6c6c6` (`border-subtle-01`) | none | cursor: default; value is selectable but not editable |

### Paired select (`.cds--time-picker .cds--select-input`)

| State | Background | Color | Border (block-end) | Chevron fill | Other |
|---|---|---|---|---|---|
| Rest | `#f4f4f4` (`field-01`) | `#161616` (`text-primary`) | `1px solid #8d8d8d` (`border-strong-01`) | `#161616` (`icon-primary`) | inline-size: auto; `padding-inline-end: 48px` reserves chevron space |
| Hover | `#e8e8e8` (`field-hover-01`) | `#161616` | `1px solid #8d8d8d` | `#161616` | — |
| Focus-visible | (rest) | `#161616` | `2px solid #0f62fe` (`focus`) | `#161616` | `outline: 2px solid #0f62fe; outline-offset: -2px` |
| Disabled | `transparent` | `rgba(22, 22, 22, 0.25)` (`text-disabled`) | `1px solid transparent` | `rgba(22, 22, 22, 0.25)` (`icon-disabled`) | cursor: not-allowed |
| Read-only | `transparent` | `#161616` | `1px solid #c6c6c6` (`border-subtle-01`) | `rgba(22, 22, 22, 0.25)` (`icon-disabled`) | cursor: default; chevron dims to communicate non-interactive |
| Legacy `--light` rest | `#ffffff` (`field-02`) | `#161616` | `1px solid #8d8d8d` | `#161616` | only when wrapper has `.cds--time-picker--light` |
| Legacy `--light` hover | `#e8e8e8` (`field-hover`) | `#161616` | `1px solid #8d8d8d` | `#161616` | — |
| Legacy `--light` disabled | `transparent` | `rgba(22, 22, 22, 0.25)` | `1px solid transparent` | `rgba(22, 22, 22, 0.25)` | cursor: not-allowed |

### Verbatim SCSS source (the entire `_time-picker.scss`)

```scss
//
// Copyright IBM Corp. 2016, 2023
//
// This source code is licensed under the Apache-2.0 license found in the
// LICENSE file in the root directory of this source tree.
//

@use '../text-input';
@use '../select';
@use '../../config' as *;
@use '../../motion' as *;
@use '../../spacing' as *;
@use '../../theme' as *;
@use '../../type' as *;
@use '../../utilities/convert';
@use '../../utilities/focus-outline' as *;
@use '../../utilities/placeholder-colors' as *;

/// Time picker styles
/// @access public
/// @group time-picker
@mixin time-picker {
  .#{$prefix}--time-picker {
    display: flex;
    align-items: flex-end;
  }

  .#{$prefix}--time-picker__select {
    justify-content: center;
    margin-inline-start: $spacing-01;
  }

  .#{$prefix}--time-picker__input {
    position: relative;
    display: flex;
    flex-direction: column;
  }

  .#{$prefix}--time-picker__error__icon {
    position: absolute;
    display: flex;
    block-size: 100%;
    inset-block-start: 50%;
    inset-inline-end: 1rem;
    place-items: center;
    // top/transform used to center invalid icon in IE11
    transform: translateY(-50%);
  }

  .#{$prefix}--time-picker__error__icon .#{$prefix}--checkbox__invalid-icon {
    fill: $support-error;
  }

  .#{$prefix}--time-picker .#{$prefix}--select-input {
    margin: 0;
    inline-size: auto;
    line-height: 1;
    min-inline-size: auto;
    padding-inline-end: convert.to-rem(48px);
  }

  .#{$prefix}--time-picker__input-field {
    @include focus-outline('reset');
    @include type-style('code-02');

    display: flex;
    align-items: center;
    block-size: convert.to-rem(40px);
    inline-size: 4.875rem;
    transition:
      outline $duration-fast-01 motion(standard, productive),
      background-color $duration-fast-01 motion(standard, productive);

    &::placeholder {
      @include placeholder-colors;
    }
  }

  .#{$prefix}--time-picker__input-field-error {
    inline-size: 6.175rem;
  }

  // V11: Possibly deprecate
  .#{$prefix}--time-picker--light .#{$prefix}--select-input {
    background-color: $field-02;

    &:hover {
      background-color: $field-hover;
    }

    &:disabled,
    &:hover:disabled {
      background-color: transparent;
      border-block-end: 1px solid transparent;
      color: $text-disabled;
      cursor: not-allowed;
    }
  }

  .#{$prefix}--time-picker--sm .#{$prefix}--select-input,
  .#{$prefix}--time-picker--sm .#{$prefix}--time-picker__input-field {
    block-size: convert.to-rem(32px);
    max-block-size: convert.to-rem(32px);
  }

  .#{$prefix}--time-picker--lg .#{$prefix}--select-input,
  .#{$prefix}--time-picker--lg .#{$prefix}--time-picker__input-field {
    block-size: convert.to-rem(48px);
    max-block-size: convert.to-rem(48px);
  }

  // readonly
  .#{$prefix}--time-picker--readonly .#{$prefix}--time-picker__input-field {
    background-color: transparent;
    border-block-end-color: $border-subtle;
  }

  .#{$prefix}--time-picker--readonly .#{$prefix}--select-input {
    background-color: transparent;
    border-block-end-color: $border-subtle;
    cursor: default;
  }

  .#{$prefix}--time-picker--readonly
    .#{$prefix}--select-input
    + .#{$prefix}--select__arrow {
    fill: $icon-disabled;
  }
}
```

### Verbatim WC host wiring (`time-picker.scss`)

```scss
//
// Copyright IBM Corp. 2019, 2025
//
// This source code is licensed under the Apache-2.0 license found in the
// LICENSE file in the root directory of this source tree.
//

$css--plex: true !default;

@use '@carbon/styles/scss/config' as *;
@use '@carbon/styles/scss/spacing' as *;
@use '@carbon/styles/scss/utilities/convert' as *;
@use '@carbon/styles/scss/utilities' as *;
@use '@carbon/styles/scss/components/time-picker/index';
@use '@carbon/styles/scss/components/select';
@use '@carbon/styles/scss/layout' as *;
@use '@carbon/styles/scss/utilities/convert' as convert;

:host(#{$prefix}-time-picker) {
  @include emit-layout-tokens();
}

:host(#{$prefix}-time-picker-select) {
  @extend .#{$prefix}--select;
  @extend .#{$prefix}--time-picker__select;
}

:host(#{$prefix}-time-picker-select) .#{$prefix}--select {
  inline-size: 100%;
}

:host(#{$prefix}-time-picker-select[disabled]) {
  @extend .#{$prefix}--select--disabled;
}

:host(#{$prefix}-time-picker-select[readonly]) {
  @extend .#{$prefix}--select--readonly;
}

:host(#{$prefix}-time-picker-select[readonly]) select {
  pointer-events: none;
}

:host(#{$prefix}-time-picker-select) select {
  margin: 0;
  inline-size: auto;
  line-height: 1;
  min-inline-size: auto;
  padding-inline-end: convert.to-rem(48px);
}
```

## Animation & Motion

Carbon's source uses these motion tokens for this component (extracted directly from `_time-picker.scss`):

```css
.cds--time-picker__input-field,
cds-time-picker::part(input-field) {
  /* Both `outline` (focus ring) and `background-color` (hover) are tweened
     via the same Productive easing curve, in lockstep at 70ms. */
  transition:
    outline var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

@media (prefers-reduced-motion: reduce) {
  .cds--time-picker__input-field,
  cds-time-picker::part(input-field) {
    transition: none;
  }
}
```

Token values:
- `--cds-duration-fast-01` = `70ms`
- `--cds-easing-productive-standard` = `cubic-bezier(0.2, 0, 0.38, 0.9)`

The paired `<cds-time-picker-select>` reuses the Select transition rules — `outline` only at the same `fast-01 / productive-standard` pair (Carbon explicitly excludes `background-color` on the select to dodge the regression documented in `carbon-design-system/carbon#4464`). The OS popover that opens when the user activates either select is rendered by the browser; Carbon does NOT animate it.

There is no entrance / dismiss animation for the time picker as a whole — it is a static form row. State transitions (rest → hover → focus → invalid) are the only motion.

## Accessibility (from Carbon's docs + source)

- **Semantic elements:** the time input is a native `<input type="text">` (Carbon does NOT use `<input type="time">` because it produces an inconsistent OS picker across browsers and clobbers the IBM Plex Mono styling). Each paired `<cds-time-picker-select>` shadow-roots a native `<select>` so screen readers and form submission see standard form controls.
- **Label association:** the React `labelText` prop and WC `label-text` attribute render a `<label>` wired by `id` / `for` to the time input. The label sits ABOVE the input column (not floating, not inline by default). When `hideLabel` / `hide-label` is set, the label remains in the accessibility tree but is visually hidden via `cds--visually-hidden`.
- **Select labels:** EACH `<cds-time-picker-select>` MUST have its own `aria-label` because the `<select>` element does not have a visible `<label>`. The Storybook source uses `aria-label="Select AM/PM"` and `aria-label="Select timezone"` — replicate this pattern; do NOT leave the select unlabeled.
- **Helper text / invalid-text / warning-text:** rendered in a sibling row below the input row, wired via `aria-describedby` on the time input. When `invalid` is set, the text moves into a `role="alert"` element so AT clients announce the change.
- **Pattern validation:** the `pattern` prop (excluded from Storybook controls but still part of the API) is forwarded to the underlying `<input>`. The standard 12-hour pattern is `(1[012]|[1-9]):[0-5][0-9](\\s)?`. For 24-hour, use `([01]?[0-9]|2[0-3]):[0-5][0-9]`. HTML5 form submission triggers the pattern automatically.
- **`maxLength`:** WC default is `5` (`HH:MM`). This protects against pasted overflow but does NOT enforce digit-only input — pair with `inputmode="numeric"` (Carbon does not set this by default; add it manually) for mobile keyboard tuning.
- **Disabled:** sets `disabled` on both the time input AND every paired select. The picker drops out of tab order entirely. Per WCAG, disabled rows MUST NOT carry information that is required to complete the form.
- **Read-only:** the wrapper class `.cds--time-picker--readonly` styles the borders to `border-subtle` and grays the chevron, but the time input still accepts focus (so users can copy the value). The paired select has `pointer-events: none` (WC) AND `cursor: default` (Sass) — the value is announced but cannot be changed.
- **Keyboard:**
  - `Tab` / `Shift+Tab` — move forward through: time input → AM/PM select → timezone select → next form field.
  - In the time input: typing inserts characters; `Backspace` deletes; arrow keys move the caret. Carbon does NOT auto-format the value on input — the developer is responsible for masking (or for letting `pattern` validate on submit).
  - In each select: `Space` / `Enter` / `Alt+Down` opens the OS popover; `Up` / `Down` change selection while closed; first-letter type-ahead navigates while open.
- **Focus management:** the time input ships the same `:focus-visible` rule as TextInput — a `2px solid var(--cds-focus)` outline plus a thickened bottom border. Each paired select gets the matching Select focus rule. DO NOT remove either — they are the primary focus indicator for form fields.
- **Touch target:** `md` (40px) clears the WCAG 2.1 Level AA 24×24 target but is BELOW the AAA 44×44 target. For touch-first surfaces, prefer `size="lg"` (48px) on the whole picker — the SCSS rule `.cds--time-picker--lg .cds--select-input, .cds--time-picker--lg .cds--time-picker__input-field` resizes both halves in lockstep.
- **High Contrast Mode:** the select chevron rule (inherited from `_select.scss`) scopes a `(-ms-high-contrast: active), (prefers-contrast)` block where `path { fill: ButtonText; }`. The time input itself has no special HCM rule beyond the inherited `:focus-visible` outline.
- **Color contrast:** label `#525252` on `#ffffff` is 7.46:1 (AAA); placeholder `#a8a8a8` on `#f4f4f4` is 2.83:1 (FAILS AA — placeholder is informational only, never the only label); value `#161616` on `#f4f4f4` is 16.05:1 (AAA); invalid icon `#da1e28` on `#ffffff` is 4.85:1 (AA). In G100, focus border `#ffffff` on `#262626` is 14.83:1 (AAA).
- **`autocomplete` hints:** Carbon does not set `autocomplete` by default. For appointment / scheduling flows, set `autocomplete="off"` on the time input (browsers do not have a useful preset for "time of day"). For timezone selects, no standard `autocomplete` token applies.

## Responsive

- **Width:** the picker as a whole is `display: flex` and sizes to its content — it does NOT stretch to `width: 100%` like the underlying TextInput's wrapper does. The time input is fixed at `4.875rem` (`78px`); each select is `auto` width plus `48px` chevron padding. To force a specific width, wrap the picker in a `display: block; width: …` container and the picker will sit left-aligned inside it.
- **Sizes by surface:**
  - `sm` (32px) — dense schedules, table-cell time editing, advanced settings panels. NOT for primary forms; below WCAG touch target on mobile.
  - `md` (40px) — default for product UI forms (the canonical Storybook size).
  - `lg` (48px) — touch-first UI (mobile booking flows), expressive marketing forms, FluidForm context.
- **Stacking on narrow viewports:** the picker does NOT auto-wrap. On viewports narrower than approximately `200px` of available horizontal space (input 78px + 2px gap + select ~60px + 2px gap + select ~80px ≈ 222px), either:
  1. Drop the second select (e.g., omit timezone when the user's TZ is implicit), or
  2. Stack the input above the selects manually by overriding `.cds--time-picker { flex-direction: column; align-items: flex-start; }` and resetting `.cds--time-picker__select { margin-inline-start: 0; margin-block-start: spacing-03; }`.
- **24-hour locale:** in 24-hour locales, OMIT the AM/PM `<cds-time-picker-select>` entirely. The picker will render input + (optional) timezone, and the SCSS handles the layout naturally.
- **RTL:** all spacing uses logical properties (`margin-inline-start`, `padding-inline-end`, `inset-inline-end`). The error icon, the chevron position, and the gap between input and selects all flip correctly under `dir="rtl"`.
- **Long timezone labels:** the select's `inline-size: auto` lets it expand to fit the longest option (e.g., "America/Argentina/Buenos Aires"). For consistent column widths, set `min-inline-size` on `.cds--time-picker__select` or use abbreviated labels (`UTC-3 (Buenos Aires)`).

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Use `<TimePicker>` (React) / `<cds-time-picker>` (WC) when you need a free-form time entry plus auxiliary selects (AM/PM, timezone) | Don't reach for Carbon TimePicker when the user only picks a moment in the future and the date matters — use **DatePicker** with a time mode instead (e.g., flatpickr's `enableTime`) |
| Sharp corners (`border-radius: 0`) on BOTH the time input AND each paired select | Don't round the corners — that's Material / Apple, not Carbon. The whole row reads as one unit because the bottom borders share a line; rounding breaks the seam. |
| Apply the bottom-only border (`border-block-end: 1px solid border-strong-01`) and KEEP top / left / right borderless on every part | Don't draw a 4-sided box around the input or the selects — that's the v9-and-earlier Carbon style |
| Use `<input type="text">` with a `pattern` attribute for the HH:MM field (this is what Carbon's React component renders under the hood) | Don't use `<input type="time">` — it produces an inconsistent OS picker and clobbers the IBM Plex Mono `code-02` styling |
| Render the `<label>` as a SEPARATE element above the input column (or use `hideLabel` to keep it in the AT tree only) | Don't use a floating-label / Material-style placeholder substitute — Carbon labels are static and live above the input |
| Give EACH `<cds-time-picker-select>` an `aria-label` (e.g., `"Select AM/PM"`, `"Select timezone"`) — the Storybook source does this on every variant | Don't leave the paired selects unlabeled — the visible time input's label only covers the input itself, and a screen reader user will hear the selects as anonymous combo boxes |
| Keep the gap between input and selects at the SCSS default `spacing-01` (`2px`) so the row reads as one unit | Don't add `margin-inline-start: 8px` or larger between the input and the selects — the picker stops looking like a single field and starts looking like three independent inputs |
| Use the IBM Plex Mono `code-02` type token on the time input value (the SCSS does this with `@include type-style('code-02')`) | Don't override the time-input font to IBM Plex Sans — the monospace digits are what makes "12:34 PM" look aligned and readable as a number |
| Pair the picker with a 12-hour AM/PM select OR drop the AM/PM select for 24-hour locales (and adjust the `pattern` accordingly) | Don't ship a 24-hour locale with an AM/PM select — it's ambiguous and the user has to think about which one wins |
| Use `size="lg"` (48px) on touch-first surfaces; the SCSS resizes both halves at the same time | Don't ship `size="sm"` (32px) on mobile — the input is below the WCAG touch-target threshold AND the AM/PM select chevron is hard to tap |
| Forward `disabled` to BOTH the picker AND every paired select (the React Storybook does `disabled={args.disabled}` on each `<TimePickerSelect>`) | Don't disable only the time input — the user can still change AM/PM or timezone, which is confusing |
| Wrap pages in `[data-theme="white"]` or `[data-theme="g100"]` so token values resolve correctly | Don't define your own `--cds-*` overrides — let the theme cascade do its job |
| When `invalid` is set, expect the input to widen from `78px` to `~99px` and the error icon to appear at `inset-inline-end: 16px` (the SCSS handles this — DO NOT recompute the width yourself) | Don't try to keep the invalid input the same width as the rest input — the icon will overlap the value |
| Use `<cds-form-item>` as the wrapping element when composing TimePicker into a larger form (per Storybook's WC import: `import '../form/form-item';`) | Don't omit `<cds-form-item>` in WC — it provides the form-row spacing and helper-text margins Carbon's CSS expects |
| Treat the legacy `.cds--time-picker--light` modifier (which switches the paired select to `field-02`) as DEPRECATED — the SCSS comment literally says "V11: Possibly deprecate" | Don't reach for `light` for new code — use the Layer system (`<Layer>` in React, `<cds-layer>` in WC) to swap `field-01` ↔ `field-02` instead, the same way the `_WithLayer` story does |
