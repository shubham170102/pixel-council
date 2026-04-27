---
name: checkbox
description: Carbon Checkbox — single + grouped (CheckboxGroup) selection control with checked, indeterminate, disabled, read-only, invalid, warn, and skeleton states; embeds verbatim Storybook source for Default, Single, and Skeleton variants
metadata:
  tags: checkbox, form, selection, multi-select, fieldset, ibm, carbon, react, web-components
---

# Checkbox -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Checkbox.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Checkbox/Checkbox.stories.js)
> - **WC story:** [`checkbox.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/checkbox/checkbox.stories.ts)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-checkbox--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-checkbox--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/checkbox/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Box (presentational) size | `16px × 16px` (`block-size: 1rem; inline-size: 1rem;` in `_checkbox.scss`) |
| Box border (rest) | `1px solid var(--cds-icon-primary)` (= `#161616` White, `#f4f4f4` G100) |
| Box corner radius | `2px` (Carbon's only deliberate non-zero radius — `border-radius: 2px` on the `::before`) |
| Label text style | `body-compact-01` — IBM Plex Sans 14px / 18px line / 0.16px letter-spacing / weight 400 |
| Label min-height (touch) | `20px` (`min-block-size: 1.25rem`) + `6px` block-end margin between rows |
| Label inline padding | `20px` from the box edge (`padding-inline-start: 1.25rem`) |
| Label-text inset | `10px` (`padding-inline-start: 0.625rem`) inside the label after the box |
| Vertical group gap | `6px` (`margin-block-end: 0.375rem` on each `.cds--checkbox-wrapper`) |
| Horizontal group gap | `16px` (`$spacing-05`) between checkboxes in `.cds--checkbox-group--horizontal` |
| Checked background | `var(--cds-icon-primary)` — `#161616` (White) / `#f4f4f4` (G100) — NOT blue-60 |
| Checkmark / indeterminate stroke | `1.5px` (check) / `2px` (indeterminate) `var(--cds-icon-inverse)` |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: 1px;` |
| Disabled border | `var(--cds-icon-disabled)` (`rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Invalid border | `1px solid var(--cds-support-error)` (`#da1e28`) |
| Skeleton label width | `100px` (`inline-size: 6.25rem`) at `$spacing-05` (`16px`) tall |
| React import | `import { Checkbox, CheckboxSkeleton } from '@carbon/react';` + `import CheckboxGroup from '@carbon/react/lib/components/CheckboxGroup';` |
| WC import | `import '@carbon/web-components/es/components/checkbox/index.js';` |

> **Note on box size:** the planning doc references "18px box / 32px touch target" as a soft guideline. The verbatim Carbon source (`packages/styles/scss/components/checkbox/_checkbox.scss`, lines 101 + 107) renders the presentational `::before` at `16px × 16px`. The interactive label area is `20px` tall plus `6px` row gap, yielding ~`26px` of vertical hit-area per row. Use the Carbon source values as the truth.

## Variants (from Storybook story exports)

Every story export found in `Checkbox.stories.js` (React) and `checkbox.stories.ts` (WC):

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Two checkboxes inside a `CheckboxGroup` with `legendText="Group label"` and shared helper / invalid / warn args |
| Horizontal | `Horizontal` | Three checkboxes laid out horizontally via `orientation="horizontal"` on the group |
| Single | `Single` | Four standalone `Checkbox` instances showing helper text, invalid, warn, and read-only states (no group wrapper) |
| Skeleton | `Skeleton` | Loading placeholder — gray pill rendered via `CheckboxSkeleton` / `<cds-checkbox-skeleton>` |
| WithAILabel | `withAILabel` (React) / `WithAILabel` (WC) | Three groups each pairing checkboxes with `AILabel` decorators (group-level, per-item bottom-left, per-item inline) |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Checkbox.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports** (from the top of the stories file):

```jsx
import React from 'react';
import '../AILabel/ailabel-story.scss';
import { default as Checkbox, CheckboxSkeleton } from './';
import mdx from './Checkbox.mdx';
import CheckboxGroup from '../CheckboxGroup';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
```

**Story metadata** (default export from the stories file):

```jsx
export default {
  title: 'Components/Checkbox',
  component: Checkbox,
  subcomponents: {
    CheckboxGroup,
    CheckboxSkeleton,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: [
        'checked',
        'defaultChecked',
        'hideLabel',
        'id',
        'indeterminate',
        'labelText',
        'title',
      ],
    },
  },
};

const sharedArgs = {
  helperText: 'Helper text goes here',
  invalid: false,
  invalidText: 'Invalid message goes here',
  warn: false,
  warnText: 'Warning message goes here',
};
```

**Variant: Default**

```jsx
export const Default = (args) => (
  <CheckboxGroup className="some-class" legendText="Group label" {...args}>
    <Checkbox labelText={`Checkbox label`} id="checkbox-label-1" />
    <Checkbox labelText={`Checkbox label`} id="checkbox-label-2" />
  </CheckboxGroup>
);

Default.args = {
  ...sharedArgs,
};

Default.argTypes = { ...sharedArgTypes };
```

**Variant: Horizontal**

```jsx
export const Horizontal = (args) => {
  return (
    <CheckboxGroup
      orientation="horizontal"
      className="some-class"
      legendText="Group label"
      helperText="Helper text goes here"
      {...args}>
      <Checkbox labelText={`Checkbox label`} id="checkbox-label-1" />
      <Checkbox labelText={`Checkbox label`} id="checkbox-label-2" />
      <Checkbox labelText={`Checkbox label`} id="checkbox-label-3" />
    </CheckboxGroup>
  );
};

Horizontal.args = { ...sharedArgs };

Horizontal.argTypes = { ...sharedArgTypes };
```

**Variant: Single**

```jsx
export const Single = () => {
  const checkboxEvents = {
    className: 'some-class',
    labelText: 'Checkbox label',
  };
  return (
    <>
      <Checkbox
        {...checkboxEvents}
        id="checkbox-3"
        helperText="Helper text goes here"
      />
      <br /> <br />
      <Checkbox
        {...checkboxEvents}
        id="checkbox-4"
        invalid
        invalidText="Invalid text goes here"
      />
      <br /> <br />
      <Checkbox
        {...checkboxEvents}
        id="checkbox-5"
        warn
        warnText="Warning text goes here"
      />
      <br /> <br />
      <Checkbox {...checkboxEvents} id="checkbox-6" readOnly />
    </>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <CheckboxSkeleton />;
};
```

**Variant: withAILabel**

```jsx
export const withAILabel = (args) => {
  const AILabelFunc = (kind) => (
    <AILabel className="ai-label-container" kind={kind}>
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
    <div className="ai-label-check-radio-container">
      <CheckboxGroup
        legendText="Group Label"
        decorator={AILabelFunc()}
        {...args}>
        <Checkbox labelText={`Checkbox label`} id="checkbox-label-1" />
        <Checkbox labelText={`Checkbox label`} id="checkbox-label-2" />
        <Checkbox labelText={`Checkbox label`} id="checkbox-label-3" />
      </CheckboxGroup>

      <CheckboxGroup legendText="Group Label" {...args}>
        <Checkbox
          labelText={`Checkbox label`}
          id="checkbox-label-4"
          decorator={AILabelFunc()}
        />
        <Checkbox
          labelText={`Checkbox label`}
          id="checkbox-label-5"
          decorator={AILabelFunc()}
        />
        <Checkbox labelText={`Checkbox label`} id="checkbox-label-6" />
      </CheckboxGroup>

      <CheckboxGroup legendText="Group Label" {...args}>
        <Checkbox
          labelText={`Checkbox label`}
          id="checkbox-label-7"
          decorator={AILabelFunc('inline')}
        />
        <Checkbox
          labelText={`Checkbox label`}
          id="checkbox-label-8"
          decorator={AILabelFunc('inline')}
        />
        <Checkbox labelText={`Checkbox label`} id="checkbox-label-9" />
      </CheckboxGroup>
    </div>
  );
};

withAILabel.args = {
  invalid: false,
  invalidText: 'Invalid message goes here',
  readOnly: false,
  warn: false,
  warnText: 'Warning message goes here',
};

withAILabel.argTypes = { ...sharedArgTypes };
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `checkbox.stories.ts` on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit, etc.).

**Imports** (from the top of the stories file):

```ts
import { html } from 'lit';
import { prefix } from '../../globals/settings';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import '../ai-label/index';
import './index';
import { CHECKBOX_ORIENTATION } from './defs';
import { iconLoader } from '../../globals/internal/icon-loader';

const checkboxLabel = 'Checkbox label';

const defaultArgs = {
  disabled: false,
  helperText: 'Helper text goes here',
  invalid: false,
  invalidText: 'Invalid message goes here',
  legendText: 'Group label',
  readonly: false,
  warn: false,
  warnText: 'Warn message goes here',
  orientation: 'vertical',
};
```

**Variant: Default**

```html
<cds-checkbox-group
  legend-text="Group label"
  helper-text="${helperText}"
  ?disabled="${disabled}"
  ?invalid="${invalid}"
  invalid-text="${invalidText}"
  legend-text="${legendText}"
  orientation="${orientation}"
  ?readonly="${readonly}"
  ?warn="${warn}"
  warn-text="${warnText}">
  <cds-checkbox @cds-checkbox-changed="${onChange}"
    >${checkboxLabel}</cds-checkbox
  >
  <cds-checkbox @cds-checkbox-changed="${onChange}"
    >${checkboxLabel}</cds-checkbox
  >
</cds-checkbox-group>
```

**Variant: Horizontal**

```html
<cds-checkbox-group
  helper-text="${helperText}"
  ?disabled="${disabled}"
  ?invalid="${invalid}"
  invalid-text="${invalidText}"
  legend-text="${legendText}"
  orientation="horizontal"
  ?readonly="${readonly}"
  ?warn="${warn}"
  warn-text="${warnText}">
  <cds-checkbox @cds-checkbox-changed="${onChange}"
    >${checkboxLabel}</cds-checkbox
  >
  <cds-checkbox @cds-checkbox-changed="${onChange}"
    >${checkboxLabel}</cds-checkbox
  >
</cds-checkbox-group>
```

**Variant: Single**

```html
<cds-checkbox helper-text="Helper text goes here"
  >${checkboxLabel}</cds-checkbox
>
<br /><br />
<cds-checkbox invalid invalid-text="Invalid test goes here"
  >${checkboxLabel}</cds-checkbox
>
<br /><br />
<cds-checkbox warn warn-text="Warning test goes here"
  >${checkboxLabel}</cds-checkbox
>
<br /><br />
<cds-checkbox readonly>${checkboxLabel}</cds-checkbox>
```

**Variant: Skeleton**

```html
<fieldset class="${prefix}--fieldset">
  <cds-checkbox-skeleton></cds-checkbox-skeleton>
</fieldset>
```

**Variant: WithAILabel**

```html
<div style="width: 400px">
  <cds-checkbox-group
  legend-text="${legendText}"
  helper-text="${helperText}"
  ?disabled="${disabled}"
  ?invalid="${invalid}"
  invalid-text="${invalidText}"
  orientation="${orientation}"
  ?readonly="${readonly}"
  ?warn="${warn}"
  warn-text="${warnText}">
    <cds-ai-label alignment="bottom-left">
      ${content}${actions}</cds-ai-label
    >
    <cds-checkbox @cds-checkbox-changed="${onChange}">Checkbox label</cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">Checkbox label</cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">Checkbox label</cds-checkbox>
  </cds-checkbox-group>
  <br></br>
  <cds-checkbox-group
  legend-text="Group label"
  helper-text="${helperText}"
  ?disabled="${disabled}"
  ?invalid="${invalid}"
  invalid-text="${invalidText}"
  orientation="${orientation}"
  ?readonly="${readonly}"
  ?warn="${warn}"
  warn-text="${warnText}">
    <cds-checkbox @cds-checkbox-changed="${onChange}">
      Checkbox label
      <cds-ai-label alignment="bottom-left">
        ${content}${actions}</cds-ai-label
      >
    </cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">
      Checkbox label
      <cds-ai-label alignment="bottom-left">
        ${content}${actions}</cds-ai-label
      >
    </cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">Checkbox label</cds-checkbox>
  </cds-checkbox-group>
   <br></br>
  <cds-checkbox-group
  legend-text="Group label"
  helper-text="${helperText}"
  ?disabled="${disabled}"
  ?invalid="${invalid}"
  invalid-text="${invalidText}"
  orientation="${orientation}"
  ?readonly="${readonly}"
  ?warn="${warn}"
  warn-text="${warnText}">
    <cds-checkbox @cds-checkbox-changed="${onChange}">
      Checkbox label
      <cds-ai-label alignment="bottom-left" kind="inline">
        ${content}${actions}
      </cds-ai-label>
    </cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">
      Checkbox label
      <cds-ai-label alignment="bottom-left" kind="inline">
        ${content}${actions}
      </cds-ai-label>
    </cds-checkbox>
    <cds-checkbox @cds-checkbox-changed="${onChange}">Checkbox label</cds-checkbox>
  </cds-checkbox-group>
</div>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${...}` bindings resolved to literal attribute values. Use this for hand-coded HTML without a component framework. Carbon's `<cds-checkbox>` custom element registers under `@carbon/web-components/es/components/checkbox/index.js`.

**Variant: Default**

```html
<cds-checkbox-group
  legend-text="Group label"
  helper-text="Helper text goes here"
  invalid-text="Invalid message goes here"
  warn-text="Warn message goes here"
  orientation="vertical">
  <cds-checkbox>Checkbox label</cds-checkbox>
  <cds-checkbox>Checkbox label</cds-checkbox>
</cds-checkbox-group>
```

**Variant: Horizontal**

```html
<cds-checkbox-group
  legend-text="Group label"
  helper-text="Helper text goes here"
  invalid-text="Invalid message goes here"
  warn-text="Warn message goes here"
  orientation="horizontal">
  <cds-checkbox>Checkbox label</cds-checkbox>
  <cds-checkbox>Checkbox label</cds-checkbox>
  <cds-checkbox>Checkbox label</cds-checkbox>
</cds-checkbox-group>
```

**Variant: Single (helper / invalid / warn / read-only)**

```html
<cds-checkbox helper-text="Helper text goes here">Checkbox label</cds-checkbox>
<br /><br />
<cds-checkbox invalid invalid-text="Invalid test goes here">Checkbox label</cds-checkbox>
<br /><br />
<cds-checkbox warn warn-text="Warning test goes here">Checkbox label</cds-checkbox>
<br /><br />
<cds-checkbox readonly>Checkbox label</cds-checkbox>
```

**Variant: Indeterminate** (set the property in JS — there is no HTML attribute for `indeterminate`)

```html
<cds-checkbox id="cb-mixed">Checkbox label</cds-checkbox>
<script type="module">
  // Indeterminate is a JavaScript-only property on the underlying input.
  const el = document.getElementById('cb-mixed');
  el.indeterminate = true; // shows the en-dash bar instead of the check
</script>
```

**Variant: Disabled**

```html
<cds-checkbox-group
  legend-text="Group label"
  helper-text="Helper text goes here"
  disabled>
  <cds-checkbox>Checkbox label</cds-checkbox>
  <cds-checkbox>Checkbox label</cds-checkbox>
</cds-checkbox-group>
```

**Variant: Skeleton**

```html
<fieldset class="cds--fieldset">
  <cds-checkbox-skeleton></cds-checkbox-skeleton>
</fieldset>
```

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  /* Box / border (rest) */
  --cds-checkbox-border: #161616;            /* icon-primary */
  --cds-checkbox-background: transparent;    /* rest fill */
  --cds-checkbox-radius: 2px;                /* the only deliberate non-zero radius in Carbon */

  /* Checked + indeterminate fill */
  --cds-checkbox-checked-background: #161616; /* icon-primary — Carbon paints checked boxes with the SAME color as the rest border, NOT button-primary blue */
  --cds-checkbox-check-stroke: #ffffff;       /* icon-inverse */

  /* Hover (group-level layer brightens; box itself does not change fill) */
  --cds-checkbox-row-hover: #e8e8e8;          /* layer-hover-01 */

  /* Focus */
  --cds-checkbox-focus: #0f62fe;              /* focus */
  --cds-checkbox-focus-offset: 1px;

  /* Disabled */
  --cds-checkbox-disabled-border: rgba(22, 22, 22, 0.25); /* icon-disabled */
  --cds-checkbox-disabled-fill: rgba(22, 22, 22, 0.25);   /* icon-disabled — for checked-disabled */
  --cds-checkbox-disabled-text: rgba(22, 22, 22, 0.25);   /* text-disabled */

  /* Read-only (border becomes disabled gray, fill removed even when checked) */
  --cds-checkbox-readonly-border: rgba(22, 22, 22, 0.25); /* icon-disabled */
  --cds-checkbox-readonly-check: #161616;     /* text-primary — the check stays visible in read-only */

  /* Invalid + warn (validation messages) */
  --cds-checkbox-invalid-border: #da1e28;     /* support-error */
  --cds-checkbox-invalid-text: #da1e28;       /* text-error */
  --cds-checkbox-warn-icon: #f1c21b;          /* support-caution-minor */
  --cds-checkbox-helper-text: #6f6f6f;        /* text-helper */

  /* Skeleton */
  --cds-checkbox-skeleton-bg: #e8e8e8;        /* skeleton-background */
}

[data-theme="g100"],
.dark {
  --cds-checkbox-border: #f4f4f4;
  --cds-checkbox-background: transparent;
  --cds-checkbox-radius: 2px;

  --cds-checkbox-checked-background: #f4f4f4; /* icon-primary in G100 */
  --cds-checkbox-check-stroke: #161616;       /* icon-inverse in G100 = gray-100 */

  --cds-checkbox-row-hover: #333333;          /* layer-hover-01 in G100 */

  --cds-checkbox-focus: #ffffff;              /* focus in G100 */
  --cds-checkbox-focus-offset: 1px;

  --cds-checkbox-disabled-border: rgba(244, 244, 244, 0.25);
  --cds-checkbox-disabled-fill: rgba(244, 244, 244, 0.25);
  --cds-checkbox-disabled-text: rgba(244, 244, 244, 0.25);

  --cds-checkbox-readonly-border: rgba(244, 244, 244, 0.25);
  --cds-checkbox-readonly-check: #f4f4f4;     /* text-primary in G100 */

  --cds-checkbox-invalid-border: #ff8389;     /* support-error in G100 = red-40 */
  --cds-checkbox-invalid-text: #ff8389;
  --cds-checkbox-warn-icon: #f1c21b;
  --cds-checkbox-helper-text: #c6c6c6;        /* text-helper in G100 */

  --cds-checkbox-skeleton-bg: #353535;        /* skeleton-background in G100 */
}
```

> **Cross-reference:** these resolve from `overview.md` — `icon-primary` (line 286 White / 790 G100), `button-primary` (line 313 / 817; **not used** as the checked fill — Carbon checks fill with `icon-primary`), `layer-hover-01` (line 230 / 734), `focus` (line 308 / 812), `text-disabled` (line 276 / 780), `support-error` (line 295 / line in G100 block), `text-helper` (line 271 / G100 block), `skeleton-background` (line 335 / G100 block).

## States Reference (from .scss)

> Source-of-truth lines are quoted from `packages/styles/scss/components/checkbox/_checkbox.scss` on the Carbon `main` branch.

| State | Box border | Box background | Check / dash stroke | Label color | Notes / SCSS line |
|---|---|---|---|---|---|
| Rest (unchecked) | `1px solid #161616` (`icon-primary`) | `transparent` | none (`transform: scale(0)`) | `#161616` (`text-primary`) | `_checkbox.scss` L93, L100 |
| Hover (row) | unchanged | unchanged | unchanged | unchanged | label cursor: `pointer` (L64); the WC overrides apply `layer-hover-01` to surrounding row when needed (L399 in WC scss) |
| Focus-visible | unchanged | unchanged | unchanged | unchanged | `outline: 2px solid #0f62fe; outline-offset: 1px;` (L179-180) — applies to unchecked, checked, and indeterminate |
| Checked | none (`border: none; border-width: 1px;`) | `#161616` (`icon-primary`) | `1.5px` `#ffffff` (`icon-inverse`), `transform: scale(1) rotate(-45deg)` | unchanged | L140-142, L155 |
| Indeterminate | none | `#161616` | `2px` `#ffffff` horizontal bar (`–`), `inline-size: 0.5rem`, `transform: scale(1) rotate(0deg)` | unchanged | L160-164 |
| Disabled | `1px solid rgba(22,22,22,0.25)` (`icon-disabled`) | `transparent` | hidden | `rgba(22,22,22,0.25)` (`text-disabled`) | `cursor: not-allowed` (L190); L195 |
| Disabled + checked | none | `rgba(22,22,22,0.25)` | white | `text-disabled` | L202 |
| Read-only | `1px solid rgba(22,22,22,0.25)` (`icon-disabled`) | `transparent` (even when checked) | `#161616` (`text-primary`) when checked | unchanged | L320, L329-339; cursor reverts to `default` on label, `text` on label-text (L305, L310) |
| Invalid | `1px solid #da1e28` (`support-error`) | unchanged | unchanged | helper text replaced by error message in `#da1e28` | L213, L297 |
| Warn | unchanged border (only icon swaps) | unchanged | unchanged | warning icon `#f1c21b` (`support-warning`) | L254 |
| Skeleton | n/a (skeleton replaces the label-text) | `#e8e8e8` (`skeleton-background`) animated | n/a | label `cursor: default` | L351-362 |

## Animation & Motion

Carbon's checkbox uses **two** animations: the check-mark scale-in/out and the focus outline appearance. There is no transition declared for `border-color` or `background-color` — state changes are instant (Carbon prefers immediacy for selection controls).

```css
/* Check-mark scale-in (from Carbon's _checkbox.scss L128) */
.cds--checkbox-label::after {
  transform: scale(0) rotate(-45deg);
  transform-origin: bottom right;
}

.cds--checkbox:checked + .cds--checkbox-label::after,
.cds--checkbox-label[data-contained-checkbox-state='true']::after {
  transform: scale(1) rotate(-45deg);
}

/* Indeterminate bar replaces the diagonal check-stroke at scale(1) rotate(0deg) */
.cds--checkbox:indeterminate + .cds--checkbox-label::after {
  border-block-end: 2px solid var(--cds-icon-inverse);
  border-inline-start: 0 solid var(--cds-icon-inverse);
  inline-size: 0.5rem;     /* 8px */
  inset-block-start: 0.6875rem; /* 11px */
  transform: scale(1) rotate(0deg);
}

/* If you want the scale to animate (Carbon's source applies it instantly):
   layer this on top in your project — it matches Carbon motion tokens. */
.cds--checkbox:checked + .cds--checkbox-label::after {
  transition: transform var(--cds-duration-fast-01, 70ms)
    var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}

@media (prefers-reduced-motion: reduce) {
  .cds--checkbox-label::after {
    transition: none;
  }
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon hides a real `<input type="checkbox">` via `@include visually-hidden` (L49 of `_checkbox.scss`) and renders the visual box on `<label>::before` / `<label>::after` pseudo-elements. The native input is what screen readers and keyboard listeners interact with.
- **Label association:** every `<input>` is paired with a `<label for="...">` whose `id` matches the input. The Carbon React `<Checkbox id="..." labelText="..." />` API enforces this; the WC `<cds-checkbox>` does it internally.
- **Group semantics:** `CheckboxGroup` / `<cds-checkbox-group>` renders a `<fieldset>` with `<legend>` containing the `legendText`. Use a group whenever two or more related checkboxes share a question.
- **Indeterminate:** there is no HTML `indeterminate` attribute — set `inputElement.indeterminate = true` in JavaScript. Carbon's React API exposes this via the `indeterminate` prop, which forwards to the DOM property in a `useEffect`.
- **ARIA states:**
  - Invalid groups apply `aria-invalid="true"` on the `<fieldset>` (and the `data-invalid` attribute that drives the SCSS at L208).
  - `disabled` and `readonly` are passed through as native HTML attributes; no `aria-*` substitutes are needed.
  - Helper / invalid / warn text is rendered as a sibling node and referenced via `aria-describedby` on the input.
- **Keyboard:** `Space` toggles the focused checkbox (native browser behavior — Carbon does not intercept). `Tab` / `Shift+Tab` move focus between checkboxes; the entire group is part of the natural tab order (no roving `tabindex`).
- **Focus management:** Carbon's CSS provides the signature double-line outline at `2px solid var(--cds-focus); outline-offset: 1px;` on every state (rest, checked, indeterminate). Do not remove it — the offset is what creates the visible "ring" gap between the box edge and the focus line.
- **Touch target:** the visible box is 16px, but the clickable label area is `min-block-size: 1.25rem` (20px) plus `padding-inline-start: 1.25rem` (20px), giving an effective hit area of ~`220 × 20px` for typical labels — wide enough for thumb input. For pure-icon checkboxes on mobile, wrap in a container with `min-height: 44px` to meet WCAG 2.5.5.
- **Read-only:** the input remains focusable and announces "checkbox checked, read only" — selection cannot be changed but the value is still part of the page's accessible content.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5/6 — that IS the Carbon source | Don't paraphrase, reformat, or "improve" the Carbon source |
| Render the box at 16px square with `border-radius: 2px` (Carbon's only deliberate non-zero radius) | Don't substitute Material's 18px / Apple's 22px box dimensions |
| Use `var(--cds-icon-primary)` (#161616) as the **checked fill** color — same as the rest border | Don't fill checked boxes with `--cds-button-primary` (blue-60); that is the Button rule, not the Checkbox rule |
| Set `el.indeterminate = true` in JavaScript when you need the dash state | Don't write `<cds-checkbox indeterminate>` — there is no such HTML attribute |
| Wrap related checkboxes in `CheckboxGroup` / `<cds-checkbox-group>` with `legendText` | Don't use loose `<Checkbox>` siblings without a fieldset/legend when they share a question |
| Use `<input type="checkbox">` + `<label>` pairing (Carbon does this for you) | Don't fake the box on a `<div role="checkbox">` — lose native keyboard + screen-reader support |
| Apply the `2px solid var(--cds-focus)` + `1px` offset focus outline | Don't suppress focus styles on selection controls; Carbon's focus ring is visually load-bearing |
| Use `[data-theme="white"]` or `[data-theme="g100"]` to scope tokens | Don't hard-code hex; the same markup must work in both themes |
| Use 6px vertical row gap (Carbon's `0.375rem` between wrappers) | Don't double-space checkbox lists; the dense rhythm is part of the Carbon density signal |
