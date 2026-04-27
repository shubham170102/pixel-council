---
name: date-picker
description: Carbon DatePicker — text input + Flatpickr-driven calendar popover for picking a single date or a date range. Variants from Storybook — Default, Simple, SingleWithCalendar, RangeWithCalendar, SimpleWithLayer, SingleWithCalendarWithLayer, RangeWithCalendarWithLayer, Skeleton, withAILabel. Three datePickerType modes — `simple` (no calendar, MM/DD/YYYY mask), `single` (input + popover calendar), `range` (two inputs + popover calendar with shared range highlight).
metadata:
  tags: date-picker, datepicker, calendar, flatpickr, date, range, form, input, ai-label, skeleton, ibm, carbon, react, web-components
---

# Date Picker -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`DatePicker.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/DatePicker/DatePicker.stories.js)
> - **WC story:** [`date-picker.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/date-picker/date-picker.stories.ts)
> - **SCSS (component):** [`_date-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/date-picker/_date-picker.scss)
> - **SCSS (calendar / Flatpickr):** [`_flatpickr.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/date-picker/_flatpickr.scss)
> - **SCSS (WC host overrides):** [`date-picker.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/date-picker/date-picker.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-datepicker--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-date-picker--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/date-picker/usage/
> - **Underlying library:** Flatpickr v4 (https://flatpickr.js.org/) — Carbon embeds it via the `@carbon/styles/scss/components/date-picker/_flatpickr.scss` mixin so calendar markup uses Flatpickr's class names (`flatpickr-calendar`, `flatpickr-day`, `flatpickr-month`, etc.)
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Input heights (sm / md / lg) | `32px` / `40px` / `48px` (`block-size: convert.to-rem(32px / 40px / 48px)`) |
| Input padding-inline | `0 16px` (`padding: 0 $spacing-05`) — bumps to `padding-inline-end: 48px` (`$spacing-09`) when a status icon is present, and to `64px` (`$spacing-10`) when an `<AILabel>` decorator is slotted |
| Input width — `simple` | `120px` (`inline-size: convert.to-rem(120px)`); grows to `152px` when `invalid` or `warn` to leave room for the icon; `90px` when `simple` + `short` |
| Input width — `single` | `288px` (`inline-size: convert.to-rem(288px)`) |
| Input width — `range` (each of two inputs) | `143.5px` (`inline-size: convert.to-rem(143.5px)`); `1px` margin-inline-end on the first wrapper to create a hairline gap |
| Corner radius | `border-radius: 0` (Carbon: sharp by default — applies to the input AND the calendar popover via `border-radius: 0` on `.flatpickr-calendar`) |
| Border treatment | **Bottom-only on the input**: `border: none; border-block-end: 1px solid var(--cds-border-strong-01)` (rest); becomes `1px solid transparent` while disabled; becomes `1px solid var(--cds-border-subtle-01)` while `[readonly]` |
| Input font | IBM Plex Mono — `code-02` (14px / 20px / 0.32px tracking) — Carbon uses **mono** for the date string so digits align in a fixed grid |
| Label font | IBM Plex Sans — `label-01` (12px / 16px / 0.32px tracking, weight 400) |
| Helper / invalid / warn text font | IBM Plex Sans — `helper-text-01` (12px / 16px / 0.32px) |
| Calendar weekday + day cells font | IBM Plex Sans — `body-compact-01` (14px / 18px / 0.16px tracking) |
| Calendar month label font | IBM Plex Sans — `heading-compact-01` (14px / 18px / 0.16px, weight 600) |
| Calendar popover size | `inline-size: 288px` × `block-size: 336px` (when `.open`); collapsed state `inline-size: 315px` with `max-block-size: 0`, `opacity: 0`, `visibility: hidden` |
| Calendar popover padding | `padding: $spacing-02 $spacing-02 $spacing-03 $spacing-02` → `4px 4px 8px 4px` |
| Calendar popover offset | `inset-block-start: calc(100% + 2px)` (`flatpickr-calendar.static`); WC also nudges by `margin-block-start: convert.to-rem(-2px)` |
| Day cell size | `40px × 40px` (`block-size: 40px; inline-size: 40px`) — every cell is a perfect square |
| Day cell row container | `block-size: 246px` for `.dayContainer` (6 rows × ~40px, with weekday header row separate) |
| Weekday header row height | `40px` (`.flatpickr-weekdays { block-size: 40px }`) |
| Month nav buttons | `40px × 40px` square (`.flatpickr-prev-month` / `.flatpickr-next-month` — `block-size: 40px; inline-size: 40px`); contain a left/right chevron icon, `fill: var(--cds-icon-primary)` |
| Month label / numInput | `block-size: 28px` for `.flatpickr-current-month`; year `numInputWrapper` is `60px` wide |
| Background — input (White, `field-01`) | `#f4f4f4` |
| Background — input (G100, `field-01`) | `#262626` |
| Background — calendar popover (White, `layer-01`) | `#f4f4f4` |
| Background — calendar popover (G100, `layer-01`) | `#262626` |
| Background — day cell hover (White, `layer-hover-01`) | `#e8e8e8` |
| Background — day cell hover (G100, `layer-hover-01`) | `#333333` |
| Background — selected day (White, `button-primary`) | `#0f62fe` (text becomes `--cds-text-on-color` `#ffffff`) |
| Background — selected day (G100, `button-primary`) | `#0f62fe` |
| Background — in-range day (White, `highlight`) | `#d0e2ff` |
| Background — in-range day (G100, `highlight`) | `#002d9c` |
| Today indicator (White, `link-primary`) | `#0f62fe` text color + a `4px × 4px` block underline rendered as `::after` |
| Today indicator (G100, `link-primary`) | `#78a9ff` text color + same `4px × 4px` underline |
| Border-strong-01 (White) — input bottom border (rest) | `#8d8d8d` |
| Border-strong-01 (G100) — input bottom border (rest) | `#6f6f6f` |
| Border-subtle-01 (White) — input bottom border (`[readonly]`) | `#c6c6c6` |
| Border-subtle-01 (G100) — input bottom border (`[readonly]`) | `#525252` |
| Focus ring | `outline: 2px solid var(--cds-focus)` on the input AND on day cells (Carbon's `focus-outline('outline')` mixin); selected day adds `outline: 1px solid var(--cds-layer-02); outline-offset: -3px` for an inner ring contrast |
| Focus color (White) | `#0f62fe` (`--cds-focus`) |
| Focus color (G100) | `#ffffff` (`--cds-focus`) |
| Error border / icon | `var(--cds-support-error)` — White: `#da1e28`, G100: `#fa4d56` |
| Warning icon | `var(--cds-support-warning)` — `#f1c21b` (both themes); the warning glyph's first path uses literal `$black-100` (`#000000`) so the inner triangle stays black |
| Helper text color | `var(--cds-text-helper)` — White: `#6f6f6f`, G100: `#c6c6c6` |
| Input text color (rest) | `var(--cds-text-primary)` — White: `#161616`, G100: `#f4f4f4` |
| Disabled input background | `var(--cds-field-01)` (same as rest — there is no separate disabled background) |
| Disabled input text | `var(--cds-text-disabled)` — White: `rgba(22, 22, 22, 0.25)`, G100: `rgba(244, 244, 244, 0.25)` |
| Disabled icon | `var(--cds-icon-disabled)` (same alpha-25 token as text-disabled) |
| Calendar icon position | `position: absolute; inset-inline-end: 1rem; inset-block-start: 50%; transform: translateY(-50%)` — `pointer-events: none` so clicks pass through to the input (`fill: var(--cds-icon-primary)`) |
| Input transition | `transition: var(--cds-duration-fast-01) var(--cds-easing-productive-standard) all` (70ms, all properties — Carbon's source uses `all`) |
| Calendar open transition | `animation: fp-fade-in-down var(--cds-duration-fast-02) var(--cds-easing-productive-entrance)` (110ms — `translate3d(0, -20px, 0)` → `translate3d(0, 0, 0)` + opacity 0 → 1) |
| Calendar month-slide transition | `400ms cubic-bezier(0.23, 1, 0.32, 1)` (Flatpickr's hard-coded easing — paired `fp-fade-out` + `fp-slide-left/right` and `fp-fade-in` + `fp-slide-left-new/right-new`) |
| Day cell transition | `transition: all var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` |
| Month nav button transition | `transition: background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard)` |
| z-index — calendar popover | `99999` when opened as floating; `999` when `.flatpickr-calendar.static.open` |
| Element / role | `<input type="text">` with no native `type="date"` (Flatpickr replaces native picker). Calendar uses Flatpickr's `<div class="flatpickr-calendar">` with `<div class="dayContainer">` and `<span class="flatpickr-day" tabindex="-1">` cells. |
| React import | `import { DatePicker, DatePickerInput, DatePickerSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/date-picker/index.js';` |

## Variants (from Storybook story exports)

| Variant | Story export | Source file | Purpose |
|---|---|---|---|
| Default | `Default` | `DatePicker.stories.js` | Renders a `DatePicker` whose `datePickerType` is selectable via the controls panel (`single` / `simple` / `range`). When `range` is picked the wrapper conditionally appends a second `DatePickerInput`. The locale is read from `useDocumentLang().split('-')[0]`. |
| Simple | `Simple` | `DatePicker.stories.js` | `datePickerType="simple"` — a 120px-wide text input with no calendar attached. User types `MM/DD/YYYY` directly; Flatpickr is not initialised. |
| SingleWithCalendar | `SingleWithCalendar` | `DatePicker.stories.js` | `datePickerType="single"` — a 288px input with a calendar icon on the trailing edge. Clicking the icon (or focusing the input) opens the Flatpickr calendar popover. `size="md"`. |
| RangeWithCalendar | `RangeWithCalendar` | `DatePicker.stories.js` | `datePickerType="range"` — two 143.5px inputs ("Start date" + "End date") side by side with a 1px hairline gap. A single shared calendar popover handles both inputs; selecting a start date highlights the in-range cells in `--cds-highlight` until an end date is picked. |
| SimpleWithLayer | `SimpleWithLayer` | `DatePicker.stories.js` | `Simple` variant wrapped in `<WithLayer>` decorator — input swaps `field-01 → field-02 → field-03` for each nested layer tier. |
| SingleWithCalendarWithLayer | `SingleWithCalendarWithLayer` | `DatePicker.stories.js` | `SingleWithCalendar` wrapped in `<WithLayer>` — input + calendar surfaces both swap tiers. |
| RangeWithCalendarWithLayer | `RangeWithCalendarWithLayer` | `DatePicker.stories.js` | `RangeWithCalendar` wrapped in `<WithLayer>`. |
| Skeleton | `Skeleton` | `DatePicker.stories.js` | `<DatePickerSkeleton range />` — shimmer placeholder for the range layout. Renders a `14px × 75px` label skeleton + `100%`-wide input skeleton(s) with the standard `@include skeleton` shimmer animation. |
| withAILabel | `withAILabel` | `DatePicker.stories.js` | Slots an `<AILabel>` decorator into a single-mode input. The AI label sits at `inset-inline-end: $spacing-08` (40px), the input gains the `ai-gradient` background, and `padding-inline-end` increases to `$spacing-10` (64px). Includes a confidence-score body and `<View>`/`<FolderOpen>`/`<Folders>`/`<Button>` actions. |
| WC: Default | `Default` | `date-picker.stories.ts` | Renders `<cds-date-picker>` with a `kind` arg (radio: Single / Simple / Range). Range mode appends a second `<cds-date-picker-input kind="to">`. |
| WC: Simple | `Simple` | `date-picker.stories.ts` | `<cds-date-picker>` with a single `<cds-date-picker-input>` (no `kind` attribute defaults to single-input layout — this story omits `?disabled` from the host). |
| WC: SingleWithCalendar | `SingleWithCalendar` | `date-picker.stories.ts` | `<cds-date-picker-input kind="single">` — calendar opens on focus or icon click. |
| WC: RangeWithCalendar | `RangeWithCalendar` | `date-picker.stories.ts` | Two `<cds-date-picker-input>` siblings — `kind="from"` + `kind="to"` — inside one `<cds-date-picker>` host. |
| WC: SimpleWithLayer | `SimpleWithLayer` | `date-picker.stories.ts` | Same as Simple, decorated with `withLayers`. `parameters: { layout: 'fullscreen' }`. |
| WC: SingleWithCalendarWithLayer | `SingleWithCalendarWithLayer` | `date-picker.stories.ts` | Same as SingleWithCalendar, decorated with `withLayers`. |
| WC: RangeWithCalendarWithLayer | `RangeWithCalendarWithLayer` | `date-picker.stories.ts` | Same as RangeWithCalendar, decorated with `withLayers`. |
| WC: Skeleton | `Skeleton` | `date-picker.stories.ts` | `<cds-date-picker-input-skeleton ?range>` — defaults to `range: true`. |
| WC: WithAILabel | `WithAILabel` | `date-picker.stories.ts` | Slots `<cds-ai-label alignment="bottom-left">` (with body content + 3 ghost icon buttons + an `<cds-ai-label-action-button>`) inside the input. |

The Web Components story file's `defaultArgs` set `dateFormat: 'm/d/Y'`, `allowInput: true`, `closeOnSelect: true`, `placeholder: 'mm/dd/yyyy'`, and `size: INPUT_SIZE.MEDIUM`. The React story file's `sharedArgs` set `invalidText: 'Error message goes here'` and `warnText: 'Warning message goes here'`.

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `DatePicker.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of the stories file):

```jsx
import React, { useState } from 'react';

import { WithLayer } from '../../../.storybook/templates/WithLayer';

import DatePicker from './DatePicker';
import DatePickerSkeleton from './DatePicker.Skeleton';
import DatePickerInput from '../DatePickerInput';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders, Information } from '@carbon/icons-react';
import { useDocumentLang } from '../../internal/useDocumentLang';

import mdx from './DatePicker.mdx';
```

**Default export (meta + shared args/argTypes)** — referenced by every variant:

```jsx
export default {
  title: 'Components/DatePicker',
  component: DatePicker,
  subcomponents: {
    DatePickerInput,
    DatePickerSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: [
        'appendTo',
        'datePickerType',
        'disable',
        'enable',
        'inline',
        'locale',
        'value',
      ],
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

const sharedArgs = {
  invalidText: 'Error message goes here',
  warnText: 'Warning message goes here',
};

const sharedArgTypes = {
  onChange: {
    action: 'onChange',
  },
  onClose: {
    action: 'onClose',
  },
  onOpen: {
    action: 'onOpen',
  },
  readOnly: {
    control: {
      type: 'boolean',
    },
  },
  size: {
    options: ['sm', 'md', 'lg'],
    control: { type: 'select' },
    table: {
      category: 'DatePickerInput',
    },
  },
  disabled: {
    control: { type: 'boolean' },
    table: {
      category: 'DatePickerInput',
    },
  },
  invalid: {
    control: { type: 'boolean' },
    table: {
      category: 'DatePickerInput',
    },
  },
  invalidText: {
    control: { type: 'text' },
    table: {
      category: 'DatePickerInput',
    },
  },
  placeholder: {
    control: { type: 'text' },
    table: {
      category: 'DatePickerInput',
    },
  },
  warn: {
    control: { type: 'boolean' },
    table: {
      category: 'DatePickerInput',
    },
  },
  warnText: {
    control: { type: 'text' },
    table: {
      category: 'DatePickerInput',
    },
  },
  helperText: {
    control: { type: 'text' },
    table: {
      category: 'DatePickerInput',
    },
  },
};
```

**Variant: Default**

```jsx
export const Default = ({ readOnly, ...args }) => {
  const locale = useDocumentLang().split('-')[0];
  return (
    <DatePicker
      datePickerType="single"
      {...args}
      readOnly={readOnly}
      locale={locale}>
      <DatePickerInput
        placeholder="mm/dd/yyyy"
        labelText="Date Picker label"
        id="date-picker-single"
        {...sharedArgs}
        {...args}
      />
      {args.datePickerType === 'range' && (
        <DatePickerInput
          placeholder="mm/dd/yyyy"
          labelText="End date"
          size="md"
          id="date-picker-input-2"
          {...sharedArgs}
          {...args}
        />
      )}
    </DatePicker>
  );
};

Default.argTypes = {
  ...sharedArgTypes,
  datePickerType: {
    options: ['single', 'simple', 'range'],
    control: { type: 'select' },
  },
};
```

**Variant: Simple**

```jsx
export const Simple = (args) => (
  <DatePicker datePickerType="simple" {...args}>
    <DatePickerInput
      placeholder="mm/dd/yyyy"
      labelText="Date Picker label"
      id="date-picker-simple"
      {...sharedArgs}
      {...args}
    />
  </DatePicker>
);

Simple.argTypes = { ...sharedArgTypes };
```

**Variant: SingleWithCalendar**

```jsx
export const SingleWithCalendar = (args) => (
  <DatePicker datePickerType="single" {...args}>
    <DatePickerInput
      placeholder="mm/dd/yyyy"
      labelText="Date Picker label"
      id="date-picker-single"
      size="md"
      {...sharedArgs}
      {...args}
    />
  </DatePicker>
);

SingleWithCalendar.argTypes = { ...sharedArgTypes };
```

**Variant: RangeWithCalendar**

```jsx
export const RangeWithCalendar = (args) => {
  return (
    <DatePicker datePickerType="range" {...args}>
      <DatePickerInput
        id="date-picker-input-id-start"
        placeholder="mm/dd/yyyy"
        labelText="Start date"
        size="md"
        {...sharedArgs}
        {...args}
      />
      <DatePickerInput
        id="date-picker-input-id-finish"
        placeholder="mm/dd/yyyy"
        labelText="End date"
        size="md"
        {...sharedArgs}
        {...args}
      />
    </DatePicker>
  );
};

RangeWithCalendar.argTypes = { ...sharedArgTypes };
```

**Variant: SimpleWithLayer**

```jsx
export const SimpleWithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <DatePicker datePickerType="simple" {...args}>
        <DatePickerInput
          placeholder="mm/dd/yyyy"
          labelText="Date Picker label"
          id={`date-picker-simple-${layer}`}
          size="md"
          {...sharedArgs}
          {...args}
        />
      </DatePicker>
    )}
  </WithLayer>
);

SimpleWithLayer.argTypes = { ...sharedArgTypes };
```

**Variant: SingleWithCalendarWithLayer**

```jsx
export const SingleWithCalendarWithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <DatePicker datePickerType="single" {...args}>
        <DatePickerInput
          placeholder="mm/dd/yyyy"
          labelText="Date Picker label"
          id={`date-picker-single-${layer}`}
          size="md"
          {...sharedArgs}
          {...args}
        />
      </DatePicker>
    )}
  </WithLayer>
);

SingleWithCalendarWithLayer.argTypes = { ...sharedArgTypes };
```

**Variant: RangeWithCalendarWithLayer**

```jsx
export const RangeWithCalendarWithLayer = (args) => (
  <WithLayer>
    {(layer) => (
      <DatePicker datePickerType="range" {...args}>
        <DatePickerInput
          id={`date-picker-input-id-start-${layer}`}
          placeholder="mm/dd/yyyy"
          labelText="Start date"
          size="md"
          {...sharedArgs}
          {...args}
        />
        <DatePickerInput
          id={`date-picker-input-id-finish-${layer}`}
          placeholder="mm/dd/yyyy"
          labelText="End date"
          size="md"
          {...sharedArgs}
          {...args}
        />
      </DatePicker>
    )}
  </WithLayer>
);

RangeWithCalendarWithLayer.argTypes = { ...sharedArgTypes };
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <DatePickerSkeleton range />;
};
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
      <DatePicker datePickerType="single" {...args}>
        <DatePickerInput
          placeholder="mm/dd/yyyy"
          labelText="Date Picker label"
          size="md"
          id="date-picker"
          decorator={aiLabel}
          {...sharedArgs}
          {...args}
        />
      </DatePicker>
    </div>
  );
};

withAILabel.argTypes = { ...sharedArgTypes };
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `date-picker.stories.ts` on the Carbon `main` branch. Use these for non-React projects.

**Imports** (from the top of the stories file):

```ts
import { html } from 'lit';
import { prefix } from '../../globals/settings';
import { iconLoader } from '../../globals/internal/icon-loader';
import { INPUT_SIZE } from '../text-input/text-input';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './date-picker';
import './date-picker-input-skeleton';
import '../layer/index';
import '../ai-label';
import { withLayers } from '../../../.storybook/decorators/with-layers';

const sizes = {
  [`Small (${INPUT_SIZE.SMALL})`]: INPUT_SIZE.SMALL,
  [`Medium (${INPUT_SIZE.MEDIUM})`]: INPUT_SIZE.MEDIUM,
  [`Large (${INPUT_SIZE.LARGE})`]: INPUT_SIZE.LARGE,
};

const defaultArgs = {
  dateFormat: 'm/d/Y',
  disabled: false,
  allowInput: true,
  closeOnSelect: true,
  minDate: '',
  maxDate: '',
  readonly: false,
  short: false,
  helperText: '',
  invalid: false,
  invalidText: 'Error message goes here',
  warnText: 'Warning message goes here',
  warn: false,
  placeholder: 'mm/dd/yyyy',
  size: INPUT_SIZE.MEDIUM,
};

const controls = {
  allowInput: {
    control: 'boolean',
    description:
      'Flatpickr prop passthrough enables direct date input, and when set to false, we must clear dates manually by resetting the value prop to empty string making it a controlled input.',
  },
  closeOnSelect: {
    control: 'boolean',
    description:
      'Flatpickr prop passthrough. Controls whether the calendar dropdown closes upon selection.',
  },
  dateFormat: {
    control: 'text',
    description: 'The date format.',
  },
  disabled: { control: 'boolean' },
  helperText: { control: 'text' },
  invalid: {
    control: 'boolean',
    description: 'Specify if the currently value is invalid.',
  },
  invalidText: {
    control: 'text',
    description: 'Message which is displayed if the value is invalid.',
  },
  maxDate: {
    control: 'text',
    description: 'The maximum date that a user can pick to.',
  },
  minDate: {
    control: 'text',
    description: 'The minimum date that a user can start picking from.',
  },
  placeholder: { control: 'text' },
  readonly: {
    control: 'boolean',
    description:
      'Whether the DatePicker is to be readOnly if boolean applies to all inputs if array applies to each input in order.',
  },
  short: {
    control: 'boolean',
    description: '<code>true</code> to use the short version.',
  },
  size: { control: 'select', options: sizes },
  warn: {
    control: 'boolean',
    description: 'Specify whether the control is currently in warning state.',
  },
  warnText: {
    control: 'text',
    description:
      'Provide the text that is displayed when the control is in warning state.',
  },
  onChange: {
    action: `${prefix}-date-picker-changed`,
  },
  onInput: {
    action: 'input',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args: { ...defaultArgs, kind: 'single' },
  argTypes: {
    ...controls,
    kind: {
      control: 'radio',
      options: { Single: 'single', Simple: 'simple', Range: 'range' },
      description: `The type of the date picker:
    <ul>
      <li><code>simple</code>
        <ul><li>Without calendar dropdown.</li></ul>
      </li>
      <li><code>single</code>
        <ul><li>With calendar dropdown and single date.</li></ul>
      </li>
      <li><code>range</code>
        <ul><li>With calendar dropdown and a date range.</li></ul>
      </li>
    </ul>`,
    },
  },
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    kind,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="${kind === 'range' ? 'from' : kind}"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
        ${kind === 'range'
          ? html`
              <cds-date-picker-input
                kind="to"
                label-text="End date"
                placeholder="${placeholder}"
                size="${size}"
                ?invalid="${invalid}"
                invalid-text="${invalidText}"
                ?warn="${warn}"
                warn-text="${warnText}">
              </cds-date-picker-input>
            `
          : null}
      </cds-date-picker>
    `;
  },
};
```

**Variant: RangeWithCalendar**

```html
export const RangeWithCalendar = {
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="from"
          label-text="Start date"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
        <cds-date-picker-input
          kind="to"
          label-text="End date"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: RangeWithCalendarWithLayer**

```html
export const RangeWithCalendarWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="from"
          label-text="Start date"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
        <cds-date-picker-input
          kind="to"
          label-text="End date"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: Simple**

```html
export const Simple = {
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        max-date="${maxDate}"
        min-date="${minDate}">
        <cds-date-picker-input
          ?disabled="${disabled}"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          ?readonly="${readonly}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: SimpleWithLayer**

```html
export const SimpleWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        max-date="${maxDate}"
        min-date="${minDate}">
        <cds-date-picker-input
          ?disabled="${disabled}"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          ?readonly="${readonly}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: SingleWithCalendar**

```html
export const SingleWithCalendar = {
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="single"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: SingleWithCalendarWithLayer**

```html
export const SingleWithCalendarWithLayer = {
  decorators: [withLayers],
  parameters: {
    layout: 'fullscreen',
  },
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    disabled,
    dateFormat,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="single"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};
```

**Variant: Skeleton**

```html
const skeletonControls = {
  hideLabel: {
    control: 'boolean',
    description: 'Specify whether the label should be hidden, or not',
  },
  range: {
    control: 'boolean',
    description: 'Specify whether the skeleton should be of range date picker.',
  },
};

export const Skeleton = {
  args: { hideLabel: false, range: true },
  argTypes: skeletonControls,
  render: ({ hideLabel, range }) => html`
    <cds-date-picker-input-skeleton
      ?hide-label="${hideLabel}"
      ?range="${range}">
    </cds-date-picker-input-skeleton>
  `,
  decorators: [(story) => html` <div>${story()}</div> `],
};
```

**Variant: WithAILabel** (helpers + story export):

```html
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

export const WithAILabel = {
  args: defaultArgs,
  argTypes: controls,
  render: ({
    allowInput,
    closeOnSelect,
    dateFormat,
    disabled,
    invalid,
    invalidText,
    maxDate,
    minDate,
    placeholder,
    readonly,
    size,
    warn,
    warnText,
  }) => {
    return html`
      <cds-date-picker
        allow-input="${allowInput}"
        close-on-select="${closeOnSelect}"
        date-format="${dateFormat}"
        ?disabled="${disabled}"
        max-date="${maxDate}"
        min-date="${minDate}"
        ?readonly="${readonly}">
        <cds-date-picker-input
          kind="single"
          label-text="Date Picker label"
          placeholder="${placeholder}"
          size="${size}"
          ?invalid="${invalid}"
          invalid-text="${invalidText}"
          ?warn="${warn}"
          warn-text="${warnText}">
          <cds-ai-label alignment="bottom-left">
            ${content}${actions}</cds-ai-label
          >
        </cds-date-picker-input>
      </cds-date-picker>
    `;
  },
};

const meta = {
  title: 'Components/Date picker',
  parameters: {
    docs: {
      controls: { exclude: ['calendar'] },
    },
  },
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.disabled}` → `disabled` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. The calendar markup follows the structure that Flatpickr renders at runtime when the input is focused — Carbon styles it via the `flatpickr` mixin (every selector below maps to a CSS rule in `_flatpickr.scss`).

**Variant: Simple** — single text input, no calendar attached:

```html
<cds-date-picker
  allow-input="true"
  close-on-select="true"
  date-format="m/d/Y"
  max-date=""
  min-date="">
  <cds-date-picker-input
    label-text="Date Picker label"
    placeholder="mm/dd/yyyy"
    size="md">
  </cds-date-picker-input>
</cds-date-picker>
```

**Variant: SingleWithCalendar** (closed state) — input + calendar icon:

```html
<cds-date-picker
  allow-input="true"
  close-on-select="true"
  date-format="m/d/Y"
  max-date=""
  min-date="">
  <cds-date-picker-input
    kind="single"
    label-text="Date Picker label"
    placeholder="mm/dd/yyyy"
    size="md">
    <!-- Internal markup rendered by the component -->
    <div class="cds--date-picker-container">
      <label for="date-picker-single" class="cds--label">Date Picker label</label>
      <div class="cds--date-picker-input__wrapper">
        <span>
          <input
            id="date-picker-single"
            type="text"
            class="cds--date-picker__input"
            placeholder="mm/dd/yyyy"
            autocomplete="off"
            data-input />
          <svg
            class="cds--date-picker__icon"
            focusable="false"
            preserveAspectRatio="xMidYMid meet"
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            viewBox="0 0 32 32"
            aria-hidden="true">
            <path d="M26,4H22V2H20V4H12V2H10V4H6A2,2,0,0,0,4,6V26a2,2,0,0,0,2,2H26a2,2,0,0,0,2-2V6A2,2,0,0,0,26,4Zm0,22H6V12H26ZM6,10V6h4V8h2V6h8V8h2V6h4v4Z"></path>
          </svg>
        </span>
      </div>
    </div>
  </cds-date-picker-input>
</cds-date-picker>
```

**Variant: SingleWithCalendar** (calendar OPEN — Flatpickr-rendered popover) — append after the input wrapper, anchored absolutely below:

```html
<div class="flatpickr-calendar animate open arrowTop arrowLeft" tabindex="-1">
  <div class="flatpickr-months">
    <span class="flatpickr-prev-month" tabindex="-1" role="button" aria-label="Previous month">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M20 24L10 16 20 8z"></path>
      </svg>
    </span>
    <div class="flatpickr-month">
      <div class="flatpickr-current-month">
        <span class="cur-month">April </span>
        <div class="numInputWrapper">
          <input
            class="numInput cur-year"
            type="number"
            tabindex="-1"
            aria-label="Year"
            value="2026"
            min="-1"
            max="2100"
            step="1" />
          <span class="arrowUp"></span>
          <span class="arrowDown"></span>
        </div>
      </div>
    </div>
    <span class="flatpickr-next-month" tabindex="-1" role="button" aria-label="Next month">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M12 8L22 16 12 24z"></path>
      </svg>
    </span>
  </div>

  <div class="flatpickr-innerContainer">
    <div class="flatpickr-rContainer">
      <div class="flatpickr-weekdays">
        <div class="flatpickr-weekdaycontainer">
          <span class="flatpickr-weekday">S</span>
          <span class="flatpickr-weekday">M</span>
          <span class="flatpickr-weekday">T</span>
          <span class="flatpickr-weekday">W</span>
          <span class="flatpickr-weekday">T</span>
          <span class="flatpickr-weekday">F</span>
          <span class="flatpickr-weekday">S</span>
        </div>
      </div>

      <div class="flatpickr-days" tabindex="-1">
        <div class="dayContainer">
          <!-- Six rows × seven cells. Each cell carries one of: rest, .today, .selected, .inRange, .startRange, .endRange, .nextMonthDay, .prevMonthDay, .flatpickr-disabled -->
          <span class="flatpickr-day prevMonthDay" aria-label="March 29, 2026" tabindex="-1">29</span>
          <span class="flatpickr-day prevMonthDay" aria-label="March 30, 2026" tabindex="-1">30</span>
          <span class="flatpickr-day prevMonthDay" aria-label="March 31, 2026" tabindex="-1">31</span>
          <span class="flatpickr-day" aria-label="April 1, 2026" tabindex="-1">1</span>
          <span class="flatpickr-day" aria-label="April 2, 2026" tabindex="-1">2</span>
          <span class="flatpickr-day" aria-label="April 3, 2026" tabindex="-1">3</span>
          <span class="flatpickr-day" aria-label="April 4, 2026" tabindex="-1">4</span>
          <!-- ... -->
          <span class="flatpickr-day today" aria-label="April 25, 2026 (today)" tabindex="-1">25</span>
          <!-- ... -->
          <span class="flatpickr-day selected" aria-label="April 17, 2026 (selected)" tabindex="0">17</span>
          <!-- ... -->
          <span class="flatpickr-day flatpickr-disabled" aria-label="April 30, 2026 (disabled)" tabindex="-1">30</span>
          <span class="flatpickr-day nextMonthDay" aria-label="May 1, 2026" tabindex="-1">1</span>
          <span class="flatpickr-day nextMonthDay" aria-label="May 2, 2026" tabindex="-1">2</span>
        </div>
      </div>
    </div>
  </div>
</div>
```

**Variant: RangeWithCalendar** (closed state) — two inputs side by side with the 1px hairline gap:

```html
<cds-date-picker
  allow-input="true"
  close-on-select="true"
  date-format="m/d/Y"
  max-date=""
  min-date="">
  <cds-date-picker-input
    kind="from"
    label-text="Start date"
    placeholder="mm/dd/yyyy"
    size="md">
  </cds-date-picker-input>
  <cds-date-picker-input
    kind="to"
    label-text="End date"
    placeholder="mm/dd/yyyy"
    size="md">
  </cds-date-picker-input>
</cds-date-picker>
```

**Variant: RangeWithCalendar** (calendar OPEN with mid-range highlight) — same Flatpickr scaffold as single, but with `.startRange`, `.inRange`, and `.endRange` modifiers populated:

```html
<div class="flatpickr-calendar animate open" tabindex="-1">
  <!-- ... months + weekdays as above ... -->
  <div class="dayContainer">
    <span class="flatpickr-day" tabindex="-1">10</span>
    <span class="flatpickr-day startRange selected" tabindex="0">11</span>
    <span class="flatpickr-day inRange" tabindex="-1">12</span>
    <span class="flatpickr-day inRange" tabindex="-1">13</span>
    <span class="flatpickr-day inRange" tabindex="-1">14</span>
    <span class="flatpickr-day inRange" tabindex="-1">15</span>
    <span class="flatpickr-day endRange selected" tabindex="0">16</span>
    <span class="flatpickr-day" tabindex="-1">17</span>
  </div>
</div>
```

**Variant: Default** with `?invalid` (input variant — replace `cds--date-picker__icon` with the invalid-state icon):

```html
<cds-date-picker
  allow-input="true"
  close-on-select="true"
  date-format="m/d/Y"
  max-date=""
  min-date=""
  readonly="false">
  <cds-date-picker-input
    kind="single"
    label-text="Date Picker label"
    placeholder="mm/dd/yyyy"
    size="md"
    invalid
    invalid-text="Error message goes here">
    <div class="cds--date-picker-input__wrapper cds--date-picker-input__wrapper--invalid">
      <span>
        <input
          id="date-picker"
          type="text"
          class="cds--date-picker__input cds--date-picker__input--invalid"
          placeholder="mm/dd/yyyy"
          aria-invalid="true"
          data-invalid />
        <svg
          class="cds--date-picker__icon cds--date-picker__icon--invalid"
          focusable="false"
          preserveAspectRatio="xMidYMid meet"
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          viewBox="0 0 16 16"
          aria-hidden="true">
          <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2 c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
          <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8 c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
        </svg>
      </span>
    </div>
    <div class="cds--form-requirement">Error message goes here</div>
  </cds-date-picker-input>
</cds-date-picker>
```

**Variant: Default** with `?warn` (warning state — yellow triangle icon):

```html
<cds-date-picker-input
  kind="single"
  label-text="Date Picker label"
  placeholder="mm/dd/yyyy"
  size="md"
  warn
  warn-text="Warning message goes here">
  <div class="cds--date-picker-input__wrapper cds--date-picker-input__wrapper--warn">
    <span>
      <input
        id="date-picker"
        type="text"
        class="cds--date-picker__input cds--date-picker__input--warn"
        placeholder="mm/dd/yyyy" />
      <svg
        class="cds--date-picker__icon cds--date-picker__icon--warn"
        focusable="false"
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 16 16"
        aria-hidden="true">
        <path d="M8,1L1,15h14L8,1z M7.5,5h1v6h-1V5z M8,13.5c-0.4,0-0.8-0.3-0.8-0.8 c0-0.4,0.3-0.8,0.8-0.8s0.8,0.3,0.8,0.8C8.8,13.2,8.4,13.5,8,13.5z" />
        <path d="M7.5,5h1v6h-1V5z M8,13.5c-0.4,0-0.8-0.3-0.8-0.8 c0-0.4,0.3-0.8,0.8-0.8s0.8,0.3,0.8,0.8C8.8,13.2,8.4,13.5,8,13.5z" data-icon-path="inner-path" />
      </svg>
    </span>
  </div>
  <div class="cds--form-requirement">Warning message goes here</div>
</cds-date-picker-input>
```

**Variant: Default** with `?disabled`:

```html
<cds-date-picker-input
  kind="single"
  label-text="Date Picker label"
  placeholder="mm/dd/yyyy"
  size="md"
  disabled>
  <div class="cds--date-picker-input__wrapper">
    <span>
      <input
        id="date-picker"
        type="text"
        class="cds--date-picker__input"
        placeholder="mm/dd/yyyy"
        disabled />
      <svg class="cds--date-picker__icon" aria-hidden="true" /* disabled: fill becomes icon-disabled */></svg>
    </span>
  </div>
</cds-date-picker-input>
```

**Variant: Default** with `?readonly`:

```html
<cds-date-picker-input
  kind="single"
  label-text="Date Picker label"
  placeholder="mm/dd/yyyy"
  size="md"
  readonly>
  <div class="cds--date-picker-input__wrapper">
    <span>
      <input
        id="date-picker"
        type="text"
        class="cds--date-picker__input"
        placeholder="mm/dd/yyyy"
        readonly />
      <svg class="cds--date-picker__icon" aria-hidden="true" /* readonly: fill becomes icon-disabled */></svg>
    </span>
  </div>
</cds-date-picker-input>
```

**Variant: Skeleton** (range):

```html
<cds-date-picker-input-skeleton range>
  <div class="cds--date-picker cds--skeleton">
    <div class="cds--date-picker-container">
      <span class="cds--label cds--skeleton"></span>
      <div class="cds--date-picker-input-skeleton-container">
        <input class="cds--date-picker__input cds--skeleton" />
      </div>
    </div>
    <div class="cds--date-picker-container">
      <span class="cds--label cds--skeleton"></span>
      <div class="cds--date-picker-input-skeleton-container">
        <input class="cds--date-picker__input cds--skeleton" />
      </div>
    </div>
  </div>
</cds-date-picker-input-skeleton>
```

**Variant: WithAILabel** — input gets the `ai-gradient` background; the AI label is slotted at `inset-inline-end: $spacing-08` (40px from the trailing edge); padding-inline-end of the input grows to `$spacing-10` (64px):

```html
<cds-date-picker
  allow-input="true"
  close-on-select="true"
  date-format="m/d/Y"
  max-date=""
  min-date=""
  readonly="false">
  <cds-date-picker-input
    ai-label
    kind="single"
    label-text="Date Picker label"
    placeholder="mm/dd/yyyy"
    size="md">
    <!-- input gets the .cds--date-picker__input--decorator class -->
    <input
      class="cds--date-picker__input cds--date-picker__input--decorator"
      type="text"
      placeholder="mm/dd/yyyy" />
    <svg class="cds--date-picker__icon" aria-hidden="true" /* ... */></svg>

    <!-- AI label slotted: positioned absolute, inset-inline-end: 40px, vertically centred -->
    <cds-ai-label alignment="bottom-left">
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
      <cds-icon-button kind="ghost" slot="actions" size="lg">
        <svg slot="icon" /* View 16 */></svg>
        <span slot="tooltip-content">View</span>
      </cds-icon-button>
      <cds-icon-button kind="ghost" slot="actions" size="lg">
        <svg slot="icon" /* FolderOpen 16 */></svg>
        <span slot="tooltip-content">Open folder</span>
      </cds-icon-button>
      <cds-icon-button kind="ghost" slot="actions" size="lg">
        <svg slot="icon" /* Folders 16 */></svg>
        <span slot="tooltip-content">Folders</span>
      </cds-icon-button>
      <cds-ai-label-action-button>View details</cds-ai-label-action-button>
    </cds-ai-label>
  </cds-date-picker-input>
</cds-date-picker>
```

## Design Tokens (component-scoped)

The Carbon source uses semantic tokens (`$field`, `$layer-01`, `$button-primary`, etc.) which Carbon maps to literal hex via `[data-theme="white"]` and `[data-theme="g100"]` blocks. Component-scoped tokens below resolve those for the date picker's two surfaces (the input and the calendar popover):

```css
[data-theme="white"] {
  /* Input field */
  --cds-date-picker-input-background: #f4f4f4;            /* $field / --cds-field-01 */
  --cds-date-picker-input-text: #161616;                  /* $text-primary */
  --cds-date-picker-input-placeholder: #a8a8a8;           /* placeholder-colors mixin → text-placeholder */
  --cds-date-picker-input-border-bottom: #8d8d8d;         /* $border-strong / --cds-border-strong-01 */
  --cds-date-picker-input-border-bottom-readonly: #c6c6c6; /* $border-subtle / --cds-border-subtle-01 */
  --cds-date-picker-input-icon: #161616;                  /* $icon-primary */
  --cds-date-picker-input-icon-disabled: rgba(22, 22, 22, 0.25); /* $icon-disabled */
  --cds-date-picker-input-text-disabled: rgba(22, 22, 22, 0.25); /* $text-disabled */

  /* Status overlays */
  --cds-date-picker-input-icon-invalid: #da1e28;          /* $support-error */
  --cds-date-picker-input-icon-warn: #f1c21b;             /* $support-warning */
  --cds-date-picker-input-warn-inner-path: #000000;       /* black-100 (the inner triangle of the warn icon) */
  --cds-date-picker-input-helper-text: #6f6f6f;           /* $text-helper */

  /* Calendar popover */
  --cds-date-picker-calendar-background: #f4f4f4;         /* $layer-01 */
  --cds-date-picker-calendar-shadow: 0 2px 6px rgba(0, 0, 0, 0.2); /* @include box-shadow */
  --cds-date-picker-day-text: #161616;                    /* $text-primary */
  --cds-date-picker-day-text-helper: #6f6f6f;             /* $text-helper — for nextMonthDay / prevMonthDay */
  --cds-date-picker-day-hover-background: #e8e8e8;        /* $layer-hover / --cds-layer-hover-01 */
  --cds-date-picker-day-selected-background: #0f62fe;     /* $button-primary */
  --cds-date-picker-day-selected-text: #ffffff;           /* $text-on-color */
  --cds-date-picker-day-in-range-background: #d0e2ff;     /* $highlight */
  --cds-date-picker-day-in-range-text: #161616;           /* $text-primary */
  --cds-date-picker-day-today-text: #0f62fe;              /* $link-primary */
  --cds-date-picker-day-today-underline: #0f62fe;         /* $link-primary */
  --cds-date-picker-day-disabled-text: rgba(22, 22, 22, 0.25); /* $text-disabled */

  /* Month navigation */
  --cds-date-picker-month-text: #161616;                  /* $text-primary */
  --cds-date-picker-month-nav-icon: #161616;              /* $icon-primary */
  --cds-date-picker-month-nav-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-date-picker-month-nav-hover-background: #e8e8e8;  /* $layer-hover */
  --cds-date-picker-num-input-background: #f4f4f4;        /* $field-01 */
  --cds-date-picker-num-input-arrow-hover: #0f62fe;       /* $button-primary — arrow ::after border-color on hover */
  --cds-date-picker-num-input-arrow-active: #0f62fe;      /* $border-interactive (resolves to focus blue in white) */

  /* Focus */
  --cds-date-picker-focus: #0f62fe;                       /* --cds-focus */
  --cds-date-picker-focus-inset: #ffffff;                 /* --cds-focus-inset (inner ring on selected day) */
}

[data-theme="g100"],
.dark {
  /* Input field */
  --cds-date-picker-input-background: #262626;            /* --cds-field-01 in g100 */
  --cds-date-picker-input-text: #f4f4f4;
  --cds-date-picker-input-placeholder: #6f6f6f;
  --cds-date-picker-input-border-bottom: #6f6f6f;         /* --cds-border-strong-01 in g100 */
  --cds-date-picker-input-border-bottom-readonly: #525252; /* --cds-border-subtle-01 in g100 */
  --cds-date-picker-input-icon: #f4f4f4;
  --cds-date-picker-input-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-date-picker-input-text-disabled: rgba(244, 244, 244, 0.25);

  /* Status overlays */
  --cds-date-picker-input-icon-invalid: #fa4d56;          /* g100 support-error */
  --cds-date-picker-input-icon-warn: #f1c21b;             /* unchanged */
  --cds-date-picker-input-warn-inner-path: #000000;       /* unchanged — always black */
  --cds-date-picker-input-helper-text: #c6c6c6;

  /* Calendar popover */
  --cds-date-picker-calendar-background: #262626;
  --cds-date-picker-calendar-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
  --cds-date-picker-day-text: #f4f4f4;
  --cds-date-picker-day-text-helper: #c6c6c6;
  --cds-date-picker-day-hover-background: #333333;        /* --cds-layer-hover-01 in g100 */
  --cds-date-picker-day-selected-background: #0f62fe;     /* button-primary stays the same */
  --cds-date-picker-day-selected-text: #ffffff;
  --cds-date-picker-day-in-range-background: #002d9c;     /* highlight in g100 */
  --cds-date-picker-day-in-range-text: #f4f4f4;
  --cds-date-picker-day-today-text: #78a9ff;              /* link-primary in g100 */
  --cds-date-picker-day-today-underline: #78a9ff;
  --cds-date-picker-day-disabled-text: rgba(244, 244, 244, 0.25);

  /* Month navigation */
  --cds-date-picker-month-text: #f4f4f4;
  --cds-date-picker-month-nav-icon: #f4f4f4;
  --cds-date-picker-month-nav-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-date-picker-month-nav-hover-background: #333333;
  --cds-date-picker-num-input-background: #262626;
  --cds-date-picker-num-input-arrow-hover: #0f62fe;
  --cds-date-picker-num-input-arrow-active: #4589ff;      /* g100 border-interactive */

  /* Focus — pure white in dark themes */
  --cds-date-picker-focus: #ffffff;
  --cds-date-picker-focus-inset: #161616;
}
```

## States Reference (from .scss)

> Pulled directly from `_date-picker.scss` (input) and `_flatpickr.scss` (calendar popover). The "(line)" annotations cite the source-file line number for each rule.

### Input field (`.cds--date-picker__input`)

| State | Background | Text | Border-block-end | Other |
|---|---|---|---|---|
| Rest (md) | `var(--cds-field)` — White `#f4f4f4`, G100 `#262626` (line 103) | `var(--cds-text-primary)` — White `#161616`, G100 `#f4f4f4` (line 106) | `1px solid var(--cds-border-strong)` — White `#8d8d8d`, G100 `#6f6f6f` (line 105) | `block-size: 40px` (line 104), `padding: 0 16px` (line 101), `border: none` (line 102), `transition: 70ms cubic-bezier(0.2, 0, 0.38, 0.9) all` (line 107) |
| Rest (sm) | (rest) | (rest) | (rest) | `block-size: 32px` (line 140) |
| Rest (lg) | (rest) | (rest) | (rest) | `block-size: 48px` (line 136) |
| `:focus`, `.cds--focused` | (rest) | (rest) | (rest) | `outline: 2px solid var(--cds-focus)` via `focus-outline('outline')` mixin (line 110-112) |
| `:disabled` | `var(--cds-field)` (same as rest) (line 115) | `var(--cds-text-disabled)` (line 117) | `1px solid transparent` (line 116) | `cursor: not-allowed` (line 118), placeholder also becomes `text-disabled` (line 122), `:hover` keeps the transparent border (line 126) |
| `[readonly]` | `transparent` (line 237) | (rest) | `1px solid var(--cds-border-subtle)` — White `#c6c6c6`, G100 `#525252` (line 238) | `cursor: text` (line 239); the trailing icon's fill becomes `var(--cds-icon-disabled)` (line 243) |
| With status icon (invalid / warn) | (rest) | (rest) | `1px solid var(--cds-support-error)` (invalid) or `1px solid var(--cds-support-warning)` (warn) — set by the WC variant classes; the icon takes the same colour | `padding-inline-end: 48px` (`$spacing-09`) so the input text doesn't run under the icon (line 174) |
| With AI label decorator | `ai-gradient` (a `linear-gradient` from `--cds-ai-aura-start` to `--cds-ai-aura-end`) (line 230) | (rest) | (rest) | `padding-inline-end: 64px` (`$spacing-10`) (line 232) |
| Skeleton | shimmer animation via `@include skeleton` (`background: var(--cds-skeleton-background)` with a `linear-gradient` keyframe sweep) (line 249) | placeholder text becomes `transparent` (line 254) | (rest) | `inline-size: 100%` (line 251); the label adjacent shrinks to `block-size: 14px; inline-size: 75px` (line 261-262) |

### Calendar popover (`.flatpickr-calendar`)

| State | Background | Block-size | Other |
|---|---|---|---|
| Closed (rest) | (none — invisible) | `max-block-size: 0` (line 102) | `opacity: 0; visibility: hidden; padding: 0; border: 0; border-radius: 0; inline-size: 315px` (lines 95-105) |
| `.open`, `.inline` | — | `max-block-size: 640px` (line 113) | `overflow: visible; opacity: 1; visibility: inherit` (lines 112-115) |
| `.open` (final styles) | `var(--cds-layer-01)` — White `#f4f4f4`, G100 `#262626` (line 129) | `block-size: 336px` (line 130) | `inline-size: 288px` (line 131); `padding: 4px 4px 8px 4px` (line 127); `box-shadow` via `@include box-shadow` (line 119); `z-index: 99999` (line 121); `display: flex; flex-direction: column; align-items: center` (lines 122-124); `margin-block-start: -2px` (line 132) |
| `.open:focus` | (rest) | — | `outline: 1px solid var(--cds-border-interactive)` via `focus-outline('border')` (line 135) |
| `.animate.open` | — | — | `animation: fp-fade-in-down 110ms cubic-bezier(0, 0, 0.38, 0.9)` (line 140) — translate3d(0, -20px, 0) → translate3d(0, 0, 0), opacity 0 → 1 |
| `.static.open` | — | — | `inset-block-start: calc(100% + 2px); z-index: 999; display: block` (lines 154-160) |

### Day cells (`.flatpickr-day`)

| State | Background | Color | Other |
|---|---|---|---|
| Rest | transparent | `var(--cds-text-primary)` — White `#161616`, G100 `#f4f4f4` (line 443) | `block-size: 40px; inline-size: 40px` (lines 442/445); `display: flex; align-items: center; justify-content: center` (lines 439-441); `cursor: pointer` (line 444); `transition: all 70ms cubic-bezier(0.2, 0, 0.38, 0.9)` (line 446) |
| `:hover` | `var(--cds-layer-hover)` — White `#e8e8e8`, G100 `#333333` (line 449) | (rest) | — |
| `:focus` | (rest) | (rest) | `outline: 2px solid var(--cds-button-primary)` (the `focus-outline('outline')` mixin overridden with `outline-color: $button-primary`) (lines 452-456) |
| `.today` | transparent | `var(--cds-link-primary)` — White `#0f62fe`, G100 `#78a9ff` (line 466) | `font-weight: 600` (line 467); `::after` pseudo-element renders a `4px × 4px` block underline at `inset-block-end: 7px; inset-inline-start: 50%; transform: translateX(-50%)` with `background-color: var(--cds-link-primary)` (lines 468-479) |
| `.today.selected` | (selected) | (selected) | `outline: 2px solid var(--cds-focus)` via `focus-outline('outline')` (line 487); the `::after` underline is hidden (`display: none`) (line 490) |
| `.selected` | `var(--cds-button-primary)` — `#0f62fe` in both themes (line 500) | `var(--cds-text-on-color)` — `#ffffff` (line 501) | High-contrast mode adds dotted outline (lines 502-504); `:focus` adds `outline: 1px solid var(--cds-layer-02); outline-offset: -3px` for an inner contrast ring (lines 506-509) |
| `.inRange` | `var(--cds-highlight)` — White `#d0e2ff`, G100 `#002d9c` (line 495) | `var(--cds-text-primary)` (line 496) | — |
| `.startRange.selected` | (selected) | (selected) | `z-index: 2; box-shadow: none` (lines 512-515) |
| `.startRange.inRange:not(.selected)`, `.endRange.inRange` | `var(--cds-layer-01)` (line 522) | (rest) | `outline: 2px solid var(--cds-focus)`; `z-index: 3` (lines 519-523) |
| `.endRange:hover` | `var(--cds-layer-01)` (line 528) | `var(--cds-text-primary)` (line 529) | `outline: 2px solid var(--cds-focus)` (line 526) |
| `.endRange.inRange.selected` | `var(--cds-button-primary)` (line 533) | `var(--cds-text-on-color)` (line 534) | — |
| `.flatpickr-disabled` | (rest, no hover background) | `var(--cds-text-disabled)` (line 538) | `cursor: not-allowed` (line 539); `:hover { background-color: transparent }` (line 542) |
| `.nextMonthDay`, `.prevMonthDay` | (rest) | `var(--cds-text-helper)` — White `#6f6f6f`, G100 `#c6c6c6` (line 461) | — |

### Month nav buttons (`.flatpickr-prev-month`, `.flatpickr-next-month`)

| State | Background | Fill | Other |
|---|---|---|---|
| Rest | transparent | `var(--cds-icon-primary)` (line 227) | `block-size: 40px; inline-size: 40px` (lines 225/228); `cursor: pointer` (line 226); `display: flex; align-items: center; justify-content: center; padding: 0` (lines 221-224); `transition: background-color 70ms cubic-bezier(0.2, 0, 0.38, 0.9)` (line 232); `transform: scale(1, 1)` (RTL flips to scale(-1, 1)) (line 231) |
| `:hover` | `var(--cds-layer-hover)` (line 240) | (rest) | — |
| `.disabled svg` | (rest) | `var(--cds-icon-disabled)` (line 247) | `cursor: not-allowed` (line 246) |
| `.disabled:hover svg` | (rest) | `var(--cds-icon-disabled)` (line 252) | — |

### Year input (`.numInputWrapper .numInput`)

| State | Background | Color | Other |
|---|---|---|---|
| Rest | `var(--cds-field-01)` (line 289) | `var(--cds-text-primary)` (line 290) | `padding: 4px` (line 284); `border: none` (line 285); `font-weight: 600` (line 294); `inline-size: 100%` (line 295); `cursor: default` (line 291); `font-family: inherit; font-size: inherit` (lines 292-293); `-moz-appearance: textfield` (line 288, hides Firefox spinner) |
| `:focus` | (rest) | (rest) | `outline: 1px solid var(--cds-border-interactive)` via `focus-outline('border')` (line 305) |
| `[disabled]`, `[disabled]:hover` | `var(--cds-layer-01)` (line 310) | `var(--cds-text-disabled)` (line 311) | `pointer-events: none` (line 312) |
| Wrapper `:hover` | `var(--cds-background-hover)` (line 278) | — | `inline-size: 60px` (line 275); `position: relative` (line 274); spinner arrows transition to `opacity: 1` (line 375) |

### Month label (`.flatpickr-current-month .cur-month`)

| State | Background | Color | Other |
|---|---|---|---|
| Rest | transparent | (inherits `var(--cds-text-primary)`) | `margin-inline: 4px 4px` (line 266); part of `heading-compact-01` type style |
| `:hover` | `var(--cds-layer-hover)` (line 269) | (rest) | — |

### Calendar icon trigger (`.cds--date-picker__icon`)

| State | Fill | Position |
|---|---|---|
| Rest | `var(--cds-icon-primary)` (line 146) | `position: absolute; inset-block-start: 50%; inset-inline-end: 1rem; transform: translateY(-50%); pointer-events: none; z-index: 1` (lines 144-151) |
| `--invalid` | `var(--cds-support-error)` (line 170) | (rest); `cursor: auto` (line 156) |
| `--warn` | `var(--cds-support-warning)` (line 160) — first path uses literal `$black-100` `#000000` (line 165) | (rest); `cursor: auto` (line 156) |
| Adjacent input `:disabled` | `var(--cds-icon-disabled)` (line 179) | `cursor: not-allowed` (line 178) |
| Adjacent input `[readonly]` | `var(--cds-icon-disabled)` (line 243) | (rest) |

## Animation & Motion

Carbon's source uses these motion tokens for the date picker (extracted from `_date-picker.scss` and `_flatpickr.scss`):

```css
/* Input transitions — 70ms productive standard */
.cds--date-picker__input {
  transition:
    var(--cds-duration-fast-01) var(--cds-easing-productive-standard) all;
  /* Source: $duration-fast-01 motion(standard, productive) all (line 107 of _date-picker.scss) */
}

/* Calendar popover open animation — 110ms productive entrance */
@keyframes fp-fade-in-down {
  from {
    opacity: 0;
    transform: translate3d(0, -20px, 0);
  }
  to {
    opacity: 1;
    transform: translate3d(0, 0, 0);
  }
}

.flatpickr-calendar.animate.open {
  animation:
    fp-fade-in-down
    var(--cds-duration-fast-02)
    var(--cds-easing-productive-entrance);
  /* Source: line 140 of _flatpickr.scss */
}

/* Day cell transitions — 70ms productive standard, all properties */
.flatpickr-day {
  transition:
    all
    var(--cds-duration-fast-01)
    var(--cds-easing-productive-standard);
  /* Source: line 446 of _flatpickr.scss */
}

/* Month nav button transitions — 70ms productive standard, background only */
.flatpickr-prev-month,
.flatpickr-next-month {
  transition:
    background-color
    var(--cds-duration-fast-01)
    var(--cds-easing-productive-standard);
  /* Source: line 232 of _flatpickr.scss */
}

/* Month change slide animations — Flatpickr's hard-coded 400ms easing
   (NOT a Carbon motion token — these are raw cubic-bezier values inside the SCSS) */
@keyframes fp-fade-out {
  from { opacity: 1; }
  to   { opacity: 0; }
}

@keyframes fp-fade-in {
  from { opacity: 0; }
  to   { opacity: 1; }
}

@keyframes fp-slide-left {
  from { transform: translate3d(0, 0, 0); }
  to   { transform: translate3d(-100%, 0, 0); }
}

@keyframes fp-slide-left-new {
  from { transform: translate3d(100%, 0, 0); }
  to   { transform: translate3d(0, 0, 0); }
}

@keyframes fp-slide-right {
  from { transform: translate3d(0, 0, 0); }
  to   { transform: translate3d(100%, 0, 0); }
}

@keyframes fp-slide-right-new {
  from { transform: translate3d(-100%, 0, 0); }
  to   { transform: translate3d(0, 0, 0); }
}

.flatpickr-calendar.animate .dayContainer.slideLeft {
  animation:
    fp-fade-out 400ms cubic-bezier(0.23, 1, 0.32, 1),
    fp-slide-left 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

.flatpickr-calendar.animate .dayContainer.slideLeftNew {
  animation:
    fp-fade-in 400ms cubic-bezier(0.23, 1, 0.32, 1),
    fp-slide-left 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

.flatpickr-calendar.animate .dayContainer.slideRight {
  animation:
    fp-fade-out 400ms cubic-bezier(0.23, 1, 0.32, 1),
    fp-slide-right 400ms cubic-bezier(0.23, 1, 0.32, 1);
  transform: translate3d(100%, 0, 0);
}

.flatpickr-calendar.animate .dayContainer.slideRightNew {
  animation:
    fp-fade-in 400ms cubic-bezier(0.23, 1, 0.32, 1),
    fp-slide-right-new 400ms cubic-bezier(0.23, 1, 0.32, 1);
}

@media (prefers-reduced-motion: reduce) {
  .flatpickr-calendar.animate.open,
  .flatpickr-prev-month,
  .flatpickr-next-month,
  .flatpickr-day,
  .cds--date-picker__input,
  .flatpickr-calendar.animate .dayContainer {
    animation: none;
    transition: none;
  }
}
```

### Resolved Carbon motion-token values

| Token | Value | Used by |
|---|---|---|
| `--cds-duration-fast-01` | `70ms` | Input transition; day-cell hover; month-nav hover |
| `--cds-duration-fast-02` | `110ms` | Calendar open `fp-fade-in-down` animation |
| `--cds-easing-productive-standard` | `cubic-bezier(0.2, 0, 0.38, 0.9)` | Input transition; day-cell transition; month-nav transition |
| `--cds-easing-productive-entrance` | `cubic-bezier(0, 0, 0.38, 0.9)` | Calendar open animation |
| Flatpickr month-slide easing | `cubic-bezier(0.23, 1, 0.32, 1)` | Hard-coded inside `_flatpickr.scss` for month-change slide; NOT a Carbon token |

## Accessibility (from Carbon's docs + source)

- **Semantic element:** A standard `<input type="text">` (Flatpickr never uses native `type="date"` because the native picker can't be styled). Carbon's WC wrapper renders `<cds-date-picker>` containing `<cds-date-picker-input>` shadow-DOM elements, each of which projects an `<input>` plus a calendar `<svg>` icon.
- **Calendar role:** Flatpickr renders the popover as a `<div class="flatpickr-calendar" tabindex="-1">`. The day cells are `<span class="flatpickr-day" tabindex="-1">` with `aria-label` of the form `"April 25, 2026"` (and `"(today)"` / `"(selected)"` / `"(disabled)"` suffixes when applicable). The selected cell receives `tabindex="0"` so it is the only initial tab stop inside the calendar.
- **Label association:** Each `DatePickerInput` renders a `<label class="cds--label" for={id}>` so screen readers announce the label when the input takes focus. In WC, `label-text` is projected into the `<label>`.
- **Status announcements:** `?invalid` adds `aria-invalid="true"` and renders `<div class="cds--form-requirement" id={`${id}-error-msg`}>` with `aria-describedby={`${id}-error-msg`}` linking the error to the input. `?warn` uses the same `cds--form-requirement` slot but does NOT set `aria-invalid` (warnings are advisory).
- **Keyboard (input):** `Tab` focuses the input. `Enter` / `ArrowDown` opens the calendar. Typing while `allow-input="true"` is supported (Flatpickr parses the typed string against `dateFormat`); when `allow-input="false"`, the input is read-only and only the calendar can change the value.
- **Keyboard (calendar):** `ArrowLeft` / `ArrowRight` move one day; `ArrowUp` / `ArrowDown` move one week. `PageUp` / `PageDown` move one month. `Shift+PageUp` / `Shift+PageDown` move one year. `Enter` selects the focused day (range mode requires two `Enter` presses — first sets `startRange.selected`, second sets `endRange.selected`). `Escape` closes the calendar without selecting. `Home` / `End` move to first / last day of the visible month.
- **Focus management:** When the calendar opens, focus moves to the first available day (or the selected day if one already exists). When the calendar closes (via `Escape` or selection with `closeOnSelect="true"`), focus returns to the input that triggered it. `:focus-visible` rings on day cells use `outline: 2px solid var(--cds-button-primary)` (NOT `--cds-focus`) to maintain Carbon's signature blue ring.
- **Touch target:** Day cells are `40px × 40px`, which exceeds the WCAG 2.5.5 minimum of `24px × 24px` and meets the AAA recommendation of `44px × 44px` (within 4px). Month-nav buttons are also `40px × 40px`. The text input itself is `40px` tall (md), `48px` (lg), `32px` (sm) — for mobile, prefer `lg` so the input meets the AAA target.
- **Year input:** The `numInputWrapper` has spinner buttons (`.arrowUp` / `.arrowDown`) that are `opacity: 0` by default and `opacity: 1` on `:hover` — make sure keyboard users can still type the year directly into the `<input type="number">` even though the spinners are visually hidden in the rest state.
- **High-contrast mode:** Carbon includes `@include high-contrast-mode('outline')` on `.flatpickr-calendar` so the popover remains outlined in WHCM. `.today` and `.inRange` cells switch their text color to `Highlight` (a system color in WHCM). `.flatpickr-day.selected:focus` switches to `outline-style: dotted` to differentiate from the in-range fill.
- **Localisation:** The React Default story reads `useDocumentLang().split('-')[0]` and passes it to `DatePicker`'s `locale` prop. Flatpickr ships ~50 locale modules (`flatpickr/dist/l10n/*.js`) that translate weekday and month names; pass them to Carbon's `locale` prop.
- **DO NOT** remove the focus outlines, the `aria-invalid` linkage, or the `cds--form-requirement` element — they are how Carbon meets WCAG 1.3.1 / 2.4.7 / 4.1.3 for this component.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs | Don't paraphrase or rewrite — use the verbatim code |
| Sharp corners (`border-radius: 0`) on the input AND the calendar popover | Don't add `border-radius` — Carbon's calendar uses `border-radius: 0` deliberately |
| Use `cds--*` class names from the WC source (`cds--date-picker`, `cds--date-picker__input`, `cds--date-picker__icon`) and Flatpickr's `flatpickr-*` class names for the calendar markup | Don't invent your own classes — Flatpickr's selectors are what `_flatpickr.scss` styles |
| Use `<cds-date-picker>` + `<cds-date-picker-input>` element names from source for WC; `<DatePicker>` + `<DatePickerInput>` for React | Don't substitute `<input type="date">` — Carbon never uses the native picker (it can't be styled) |
| Wrap in `[data-theme="white"]` or `[data-theme="g100"]` | Don't define your own theme classes |
| Use `kind="from"` + `kind="to"` for the two range inputs (WC) or just stack two `<DatePickerInput>` children inside a `<DatePicker datePickerType="range">` (React) | Don't try to render two separate `<DatePicker>` instances for a range — Flatpickr's range mode coordinates the highlight across BOTH inputs from a single instance |
| Set `dateFormat` to match the user's locale conventions (`"m/d/Y"` for en-US, `"d/m/Y"` for en-GB, `"Y-m-d"` for ISO) | Don't hard-code `"m/d/Y"` for international audiences — pass the locale via `useDocumentLang()` like the React Default story does |
| Use IBM Plex Mono (`code-02` type style) for the input text | Don't switch to Plex Sans for the input — the mono digits are intentional so dates align in fixed columns when stacked vertically |
| Provide `helperText` ("MM/DD/YYYY") so users know the expected format BEFORE they type | Don't rely on the placeholder alone — placeholders disappear once the user starts typing |
| Use `?disabled` for fields that cannot be edited at all; `?readonly` for fields whose value is fixed but visible | Don't conflate the two — readonly inputs use a transparent background + subtle border, disabled inputs keep the field background but become semi-transparent text |
| Preserve the bottom-only border treatment | Don't add a full 4-sided border — Carbon's input language is bottom-border-only, the same as TextInput, NumberInput, Select, etc. |
| Increment `padding-inline-end` to `48px` when adding a status icon, `64px` when adding an `<AILabel>` | Don't let the icon overlap the text — Carbon's SCSS uses `$spacing-09` / `$spacing-10` increments for exactly this reason |
| Test BOTH `single` and `range` keyboard flows — range requires TWO `Enter` presses to lock in start + end | Don't assume a single `Enter` selects the range — that only sets `startRange.selected`; the calendar stays open in "in-range" tracking mode until the user picks an end date |
| Honor `prefers-reduced-motion` — the SCSS already disables the slide animations, so just don't override it | Don't replace Flatpickr's month-slide easing (`cubic-bezier(0.23, 1, 0.32, 1)`) with a Carbon token — this is one of the few places Carbon ships a non-tokenised easing on purpose, and it's stable |
