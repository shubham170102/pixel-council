---
name: radio-button
description: Carbon Radio Button — single-selection control rendered inside a RadioButtonGroup with vertical/horizontal layout, helper / invalid / warn / read-only / disabled states; embeds verbatim Storybook source for Default, Vertical, Skeleton, and WithAILabel variants. RadioTile (large card-style radio) is documented in tile.md.
metadata:
  tags: radio-button, radio, form, selection, single-select, fieldset, legend, ibm, carbon, react, web-components
---

# Radio Button -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`RadioButton.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/RadioButton/RadioButton.stories.js)
> - **WC story:** [`radio-button.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/radio-button/radio-button.stories.ts)
> - **Core SCSS:** [`_radio-button.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/radio-button/_radio-button.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-radiobutton--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-radio-button--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/radio-button/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Outer circle size | `18px × 18px` (`block-size: 1.125rem; inline-size: 1.125rem;` in `_radio-button.scss`) |
| Inner dot (when selected) | `9px` effective (`100%` of the 18px appearance scaled to `0.5` via `transform: scale(0.5)`) |
| Outer border (rest) | `1px solid var(--cds-icon-primary)` (= `#161616` White, `#f4f4f4` G100) |
| Outer fill (rest + selected) | `transparent` — Carbon does NOT fill the outer circle when selected; only the inner dot is painted |
| Inner-dot color (selected) | `var(--cds-icon-primary)` — `#161616` (White) / `#f4f4f4` (G100) |
| Corner radius | `50%` on both outer circle and inner dot (the only round shape in Carbon — every other component is sharp `0`) |
| Label text style | `body-compact-01` — IBM Plex Sans 14px / 18px line / 0.16px letter-spacing / weight 400 |
| Label inline gap | `10px` (`margin-inline: 2px 10px` between appearance circle and label-text) |
| Vertical group gap | `6px` (`margin-block-end: convert.to-rem(6px)` on each `.cds--radio-button-wrapper`) |
| Horizontal group gap | `16px` (`$spacing-05` — `margin-inline-end` between wrappers) |
| Vertical-only spacing | `12px` (`$spacing-03` between non-last labels in `.cds--radio-button-group--vertical`) |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: 1.5px;` (note: 1.5px offset, not 1px) |
| Disabled border | `var(--cds-icon-disabled)` (`rgba(22,22,22,0.25)` White / `rgba(244,244,244,0.25)` G100) |
| Disabled inner-dot | `var(--cds-text-disabled)` (NOT `icon-disabled` — Carbon uses `text-disabled` for the dot) |
| Read-only border | `var(--cds-icon-disabled)` (same as disabled) — but cursor reverts to `default` / `text` and value remains focusable |
| Invalid border | `1px solid var(--cds-support-error)` (`#da1e28` White / `#fa4d56` G100) |
| Skeleton dimensions | `18px` tall × `100px` wide (`@include skeleton`) |
| React import | `import { RadioButton, RadioButtonGroup, RadioButtonSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/radio-button/index.js';` |

> **Note:** RadioTile (large card-style radio) is a **Tile** variant, not a Radio Button variant. Its source lives in `packages/web-components/src/components/tile/tile.scss` under the `:host(cds-radio-tile)` selector, and its Storybook code is in the Tile stories file. See `components/tile.md` for the RadioTile reference.

## Variants (from Storybook story exports)

Every story export found in `RadioButton.stories.js` (React) and `radio-button.stories.ts` (WC):

| Variant | Story export | Purpose |
|---|---|---|
| Default | `Default` | Three radios in a `RadioButtonGroup` with `legendText="Radio Button group"`, helper / invalid / warn / read-only args, and `defaultSelected="radio-2"` |
| Vertical | `Vertical` | Three radios stacked with `orientation="vertical"`; the third radio is `disabled` |
| Skeleton | `Skeleton` | Loading placeholder rendered via `RadioButtonSkeleton` / `<cds-radio-button-skeleton>` |
| withAILabel (React) / WithAILabel (WC) | `withAILabel` / `WithAILabel` | Three groups each pairing radios with `AILabel` decorators (group-level, per-item bottom-left, per-item inline) |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `RadioButton.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + story metadata** (from the top of the stories file):

```jsx
import RadioButton from './RadioButton';
import RadioButtonGroup from '../RadioButtonGroup';
import RadioButtonSkeleton from './RadioButton.Skeleton';
import React from 'react';
import Button from '../Button';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './RadioButton.mdx';

export default {
  title: 'Components/RadioButton',
  component: RadioButton,
  subcomponents: {
    RadioButtonGroup,
    RadioButtonSkeleton,
  },
  argTypes: {
    checked: {
      table: {
        disable: true,
      },
    },
    defaultChecked: {
      table: {
        disable: true,
      },
    },
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Vertical**

```jsx
export const Vertical = () => {
  return (
    <RadioButtonGroup
      legendText="Group label"
      name="radio-button-vertical-group"
      defaultSelected="radio-1"
      orientation="vertical">
      <RadioButton
        labelText="Radio button label"
        value="radio-1"
        id="radio-1"
      />
      <RadioButton
        labelText="Radio button label"
        value="radio-2"
        id="radio-2"
      />
      <RadioButton
        labelText="Radio button label"
        value="radio-3"
        id="radio-3"
        disabled
      />
    </RadioButtonGroup>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = () => {
  return <RadioButtonSkeleton />;
};
```

**Variant: withAILabel**

```jsx
export const withAILabel = () => {
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
      <RadioButtonGroup
        decorator={AILabelFunc('default')}
        orientation="vertical"
        legendText="Group label"
        name="radio-button-group"
        defaultSelected="radio-1">
        <RadioButton
          labelText="Radio button label"
          value="radio-1"
          id="radio-1"
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-2"
          id="radio-2"
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-3"
          id="radio-3"
        />
      </RadioButtonGroup>

      <RadioButtonGroup
        orientation="vertical"
        legendText="Group label"
        name="radio-button-group-2"
        defaultSelected="radio-4">
        <RadioButton
          labelText="Radio button label"
          value="radio-4"
          id="radio-4"
          decorator={AILabelFunc()}
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-5"
          id="radio-5"
          decorator={AILabelFunc()}
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-6"
          id="radio-6"
        />
      </RadioButtonGroup>

      <RadioButtonGroup
        orientation="vertical"
        legendText="Group label"
        name="radio-button-group-3"
        defaultSelected="radio-7">
        <RadioButton
          labelText="Radio button label"
          value="radio-7"
          id="radio-7"
          decorator={AILabelFunc('inline')}
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-8"
          id="radio-8"
          decorator={AILabelFunc('inline')}
        />
        <RadioButton
          labelText="Radio button label"
          value="radio-9"
          id="radio-9"
        />
      </RadioButtonGroup>
    </div>
  );
};
```

**Variant: Default**

```jsx
export const Default = (args) => {
  return (
    <RadioButtonGroup
      legendText="Radio Button group"
      name="radio-button-default-group"
      {...args}>
      <RadioButton
        labelText="Radio button label"
        value="radio-1"
        id="radio-1"
        hideLabel={args.hideLabel}
      />
      <RadioButton
        labelText="Radio button label"
        value="radio-2"
        id="radio-2"
        hideLabel={args.hideLabel}
      />
      <RadioButton
        labelText="Radio button label"
        value="radio-3"
        id="radio-3"
        hideLabel={args.hideLabel}
      />
    </RadioButtonGroup>
  );
};

Default.args = {
  defaultSelected: 'radio-2',
  helperText: 'Helper text',
  hideLabel: false,
  invalidText: 'Invalid selection',
  warn: false,
  warnText: 'Please notice the warning',
};

Default.argTypes = {
  defaultSelected: {
    description: 'Specify the `<RadioButton>` to be selected by default',
    options: ['radio-1', 'radio-2', 'radio-3'],
    control: {
      type: 'select',
    },
  },
  readOnly: {
    description: 'Specify whether the RadioButtonGroup is read-only',
    control: {
      type: 'boolean',
    },
  },
  helperText: {
    description:
      'Provide text that is used alongside the control label for additional help',
    control: {
      type: 'text',
    },
  },
  hideLabel: {
    description:
      'Specify whether the label should be visually hidden but still available to screen readers',
    control: {
      type: 'boolean',
    },
  },
  invalid: {
    description: 'Specify whether the RadioButtonGroup is invalid',
    control: {
      type: 'boolean',
    },
  },
  invalidText: {
    description:
      'Provide the text that is displayed when the control is in an invalid state',
    control: {
      type: 'text',
    },
  },
  orientation: {
    description: 'Provide how radio buttons should be displayed',
    control: 'select',
    options: ['horizontal', 'vertical'],
  },
  warn: {
    description: 'Specify whether the control is currently in warning state',
    control: {
      type: 'boolean',
    },
  },
  warnText: {
    description:
      'Provide the text that is displayed when the control is in warning state',
    control: {
      type: 'text',
    },
  },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `radio-button.stories.ts` on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit, etc.).

**Imports + shared content** (from the top of the stories file):

```ts
import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { prefix } from '../../globals/settings';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import { RADIO_BUTTON_ORIENTATION } from './radio-button-group';
import { RADIO_BUTTON_LABEL_POSITION } from './radio-button';
import './index';
import '../ai-label';
import '../icon-button';
import { iconLoader } from '../../globals/internal/icon-loader';

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

```html
<cds-radio-button-group
  ?readOnly="${readOnly}"
  ?disabled="${disabled}"
  helper-text="${ifDefined(helperText)}"
  ?invalid="${invalid}"
  invalid-text="${ifDefined(invalidText)}"
  label-position="${ifDefined(labelPosition)}"
  legend-text="Radio Button group"
  orientation="${ifDefined(orientation)}"
  name="${ifDefined(name)}"
  value="${ifDefined(value)}"
  ?required="${required}"
  ?warn="${warn}"
  warn-text="${ifDefined(warnText)}"
  @cds-radio-button-group-changed="${onChange}">
  <cds-radio-button
    ?checked="${checked}"
    ?hide-label="${hideLabel}"
    label-text="${ifDefined(labelText)}"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    ?hide-label="${hideLabel}"
    label-text="${ifDefined(labelText)}"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    ?hide-label="${hideLabel}"
    label-text="${ifDefined(labelText)}"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Vertical**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  value="radio-1"
  orientation="vertical">
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"
    disabledItem></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Skeleton**

```html
<cds-radio-button-skeleton></cds-radio-button-skeleton>
```

**Variant: WithAILabel**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  value="radio-1"
  orientation="vertical">
  <cds-ai-label alignment="bottom-left"
    >${content}${actions}</cds-ai-label
  >
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>

<cds-radio-button-group
  legend-text="Group label"
  name="radio-group-2"
  value="radio-4"
  orientation="vertical">
  <cds-radio-button label-text="Radio button label" value="radio-4"
    ><cds-ai-label alignment="bottom-left"
      >${content}${actions}</cds-ai-label
    ></cds-radio-button
  >
  <cds-radio-button label-text="Radio button label" value="radio-5"
    ><cds-ai-label alignment="bottom-left"
      >${content}${actions}</cds-ai-label
    ></cds-radio-button
  >
  <cds-radio-button
    label-text="Radio button label"
    value="radio-6"></cds-radio-button>
</cds-radio-button-group>

<cds-radio-button-group
  legend-text="Group label"
  name="radio-group-3"
  value="radio-7"
  orientation="vertical">
  <cds-radio-button label-text="Radio button label" value="radio-7"
    ><cds-ai-label slot="ai-label" alignment="bottom-left" kind="inline"
      >${content}${actions}</cds-ai-label
    ></cds-radio-button
  >
  <cds-radio-button label-text="Radio button label" value="radio-8"
    ><cds-ai-label slot="ai-label" alignment="bottom-left" kind="inline"
      >${content}${actions}</cds-ai-label
    ></cds-radio-button
  >
  <cds-radio-button
    label-text="Radio button label"
    value="radio-9"></cds-radio-button>
</cds-radio-button-group>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${...}` bindings resolved to literal attribute values. Use this for hand-coded HTML without a component framework. Carbon's `<cds-radio-button>` and `<cds-radio-button-group>` custom elements register under `@carbon/web-components/es/components/radio-button/index.js`.

**Variant: Default (horizontal, helper text, defaultSelected radio-2)**

```html
<cds-radio-button-group
  helper-text="Helper text"
  invalid-text="Invalid selection"
  label-position="right"
  legend-text="Radio Button group"
  orientation="horizontal"
  name="radio-group"
  value="radio-2"
  warn-text="Please notice the warning">
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Vertical (with disabled third radio)**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  value="radio-1"
  orientation="vertical">
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"
    disabledItem></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Read-only**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  value="radio-1"
  orientation="vertical"
  readOnly>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Invalid**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  orientation="vertical"
  invalid
  invalid-text="Invalid selection">
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Warn**

```html
<cds-radio-button-group
  legend-text="Group label"
  name="radio-group"
  orientation="vertical"
  warn
  warn-text="Please notice the warning">
  <cds-radio-button
    label-text="Radio button label"
    value="radio-1"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-2"></cds-radio-button>
  <cds-radio-button
    label-text="Radio button label"
    value="radio-3"></cds-radio-button>
</cds-radio-button-group>
```

**Variant: Skeleton**

```html
<cds-radio-button-skeleton></cds-radio-button-skeleton>
```

**Variant: Pure-HTML fallback (no custom element — using Carbon's `cds--*` classes directly)**

```html
<fieldset class="cds--radio-button-group cds--radio-button-group--vertical">
  <legend class="cds--label">Group label</legend>

  <div class="cds--radio-button-wrapper">
    <input
      id="radio-1"
      class="cds--radio-button"
      type="radio"
      name="radio-group"
      value="radio-1"
      checked />
    <label for="radio-1" class="cds--radio-button__label">
      <span class="cds--radio-button__appearance"></span>
      <span class="cds--radio-button__label-text">Radio button label</span>
    </label>
  </div>

  <div class="cds--radio-button-wrapper">
    <input
      id="radio-2"
      class="cds--radio-button"
      type="radio"
      name="radio-group"
      value="radio-2" />
    <label for="radio-2" class="cds--radio-button__label">
      <span class="cds--radio-button__appearance"></span>
      <span class="cds--radio-button__label-text">Radio button label</span>
    </label>
  </div>

  <div class="cds--radio-button-wrapper">
    <input
      id="radio-3"
      class="cds--radio-button"
      type="radio"
      name="radio-group"
      value="radio-3"
      disabled />
    <label for="radio-3" class="cds--radio-button__label">
      <span class="cds--radio-button__appearance"></span>
      <span class="cds--radio-button__label-text">Radio button label</span>
    </label>
  </div>
</fieldset>
```

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  /* Outer circle / border (rest) */
  --cds-radio-border: #161616;             /* icon-primary */
  --cds-radio-background: transparent;     /* outer circle is NEVER filled, even when selected */
  --cds-radio-radius: 50%;                 /* the only round shape in Carbon */

  /* Inner dot (selected) */
  --cds-radio-dot: #161616;                /* icon-primary — same color as the rest border */

  /* Label */
  --cds-radio-label-text: #161616;         /* text-primary */

  /* Focus */
  --cds-radio-focus: #0f62fe;              /* focus */
  --cds-radio-focus-offset: 1.5px;         /* note: 1.5px offset, NOT 1px */

  /* Disabled */
  --cds-radio-disabled-border: rgba(22, 22, 22, 0.25);  /* icon-disabled */
  --cds-radio-disabled-dot: rgba(22, 22, 22, 0.25);     /* text-disabled — Carbon paints the disabled dot with text-disabled, not icon-disabled */
  --cds-radio-disabled-text: rgba(22, 22, 22, 0.25);    /* text-disabled */

  /* Read-only (border becomes disabled gray; dot remains visible at icon-primary if selected; cursor reverts to default/text) */
  --cds-radio-readonly-border: rgba(22, 22, 22, 0.25);  /* icon-disabled */
  --cds-radio-readonly-dot: #161616;                    /* icon-primary — dot stays visible in read-only */

  /* Invalid + warn */
  --cds-radio-invalid-border: #da1e28;     /* support-error */
  --cds-radio-invalid-text: #da1e28;       /* text-error */
  --cds-radio-warn-icon: #f1c21b;          /* support-warning (Carbon uses #000000 for the inner ! glyph path) */
  --cds-radio-helper-text: #6f6f6f;        /* text-helper */

  /* Skeleton */
  --cds-radio-skeleton-bg: #e8e8e8;        /* skeleton-background */
}

[data-theme="g100"],
.dark {
  --cds-radio-border: #f4f4f4;             /* icon-primary in G100 */
  --cds-radio-background: transparent;
  --cds-radio-radius: 50%;

  --cds-radio-dot: #f4f4f4;                /* icon-primary in G100 */

  --cds-radio-label-text: #f4f4f4;         /* text-primary in G100 */

  --cds-radio-focus: #ffffff;              /* focus in G100 */
  --cds-radio-focus-offset: 1.5px;

  --cds-radio-disabled-border: rgba(244, 244, 244, 0.25);
  --cds-radio-disabled-dot: rgba(244, 244, 244, 0.25);
  --cds-radio-disabled-text: rgba(244, 244, 244, 0.25);

  --cds-radio-readonly-border: rgba(244, 244, 244, 0.25);
  --cds-radio-readonly-dot: #f4f4f4;

  --cds-radio-invalid-border: #fa4d56;     /* support-error in G100 = red-50 */
  --cds-radio-invalid-text: #ff8389;       /* text-error in G100 = red-40 */
  --cds-radio-warn-icon: #f1c21b;
  --cds-radio-helper-text: #c6c6c6;        /* text-helper in G100 */

  --cds-radio-skeleton-bg: #292929;        /* skeleton-background in G100 */
}
```

> **Cross-reference:** these resolve from `overview.md` — `icon-primary` (line 286 White / 790 G100), `icon-disabled` (line 291 / 795), `text-primary` (line 268 / 772), `text-disabled` (line 276 / 780), `text-helper` (line 271 / 775), `text-error` (line 272 / 776), `focus` (line 308 / 812), `support-error` (line 295 / 799), `support-warning` (line 297 / 801), `skeleton-background` (line 335 / 839).

## States Reference (from .scss)

> Source-of-truth lines are quoted from `packages/styles/scss/components/radio-button/_radio-button.scss` on the Carbon `main` branch.

| State | Outer border | Outer fill | Inner dot | Label color | Notes / SCSS line |
|---|---|---|---|---|---|
| Rest (unchecked) | `1px solid #161616` (`icon-primary`) | `transparent` | none — `::before` pseudo not rendered | `#161616` (`text-primary`) | `_radio-button.scss` L92-100 — `border: 1px solid $icon-primary; background-color: transparent` |
| Hover | unchanged | unchanged | unchanged | unchanged | `cursor: pointer` on `.cds--radio-button__label` (L75); Carbon does NOT change colors on hover for radio — selection is the affordance |
| Focus-visible | unchanged | unchanged | unchanged | unchanged | `outline: 2px solid #0f62fe; outline-offset: 1.5px;` (L195-199) — applies to both unchecked and checked |
| Checked (selected) | `border-color: $icon-primary` (unchanged from rest) | `transparent` (NOT filled — only the dot is painted) | `#161616` (`icon-primary`) circle, `transform: scale(0.5)` of the 18px appearance = ~9px effective | unchanged | L106-130 |
| Disabled | `1px solid rgba(22,22,22,0.25)` (`icon-disabled`) | `transparent` | hidden (selected state suppressed visually but `::before` color = `text-disabled` if checked) | `rgba(22,22,22,0.25)` (`text-disabled`) | `cursor: not-allowed` on label (L138); L141-147 |
| Disabled + checked | `1px solid #icon-disabled` | `transparent` | `rgba(22,22,22,0.25)` (`text-disabled`) | `text-disabled` | L141-147 — `&::before { background-color: $text-disabled; }` |
| Read-only | `1px solid rgba(22,22,22,0.25)` (`icon-disabled`) | `transparent` | unchanged from selected (`#161616` `icon-primary`) | unchanged | L150-160; cursor reverts to `default` on label (L156), `text` on label-text (L160) |
| Read-only + checked | unchanged border | `transparent` | `#161616` (`icon-primary`) — dot stays visible in read-only | unchanged | The dot remains; the user simply cannot change the value |
| Invalid (group) | `1px solid #da1e28` (`support-error`) on every radio in the group | `transparent` | unchanged | helper text replaced by error message in `#da1e28` (`text-error`) | L164-168, L184 — `.cds--radio-button-group--invalid .cds--radio-button + label .cds--radio-button__appearance { border-color: $support-error; }` |
| Warn (group) | unchanged border | `transparent` | unchanged | helper text replaced by warning message + `support-warning` (`#f1c21b`) icon | L177; warn icon path:first-of-type filled with `#000000` (L181) |
| Skeleton | n/a — `.cds--radio-button__appearance` is `display: none` (L208) | n/a | n/a | replaced by skeleton pill | L201-208 — `block-size: 1.125rem; inline-size: 6.25rem` (= 18px × 100px) |

## Animation & Motion

Carbon's radio button source declares **no transitions** — selection state changes are instantaneous (Carbon prefers immediacy for selection controls, matching the Checkbox behavior). The only animated property is the focus outline appearance, which the browser handles natively.

If you want the dot to scale in smoothly (Carbon's source paints it instantly), layer this on top in your project — it matches Carbon motion tokens and respects `prefers-reduced-motion`:

```css
/* Optional smooth scale-in for the inner dot — NOT in Carbon's verbatim SCSS */
.cds--radio-button + .cds--radio-button__label .cds--radio-button__appearance::before {
  transition: transform var(--cds-duration-fast-01, 70ms)
    var(--cds-easing-productive-standard, cubic-bezier(0.2, 0, 0.38, 0.9));
}

@media (prefers-reduced-motion: reduce) {
  .cds--radio-button + .cds--radio-button__label .cds--radio-button__appearance::before {
    transition: none;
  }
}
```

The relevant verbatim Carbon SCSS that paints the dot (no transition declared):

```scss
.cds--radio-button:checked
  + .cds--radio-button__label
  .cds--radio-button__appearance {
  display: flex;
  align-items: center;
  justify-content: center;
  border-color: $icon-primary;

  &::before {
    position: relative;
    display: inline-block;
    border-radius: 50%;
    background-color: $icon-primary;
    block-size: 100%;
    content: '';
    inline-size: 100%;
    transform: scale(0.5);
  }
}
```

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon hides a real `<input type="radio">` via `@include visually-hidden` (L65 of `_radio-button.scss`) and renders the visual circle on a sibling `<span class="cds--radio-button__appearance">` inside `<label class="cds--radio-button__label">`. The native input is what screen readers announce and what the browser uses for keyboard navigation.
- **Label association:** every `<input>` has a matching `<label for="...">`. Carbon's React `<RadioButton id="..." labelText="..." />` API and the WC `<cds-radio-button label-text="...">` both enforce this internally.
- **Group semantics:** `RadioButtonGroup` / `<cds-radio-button-group>` renders a `<fieldset>` with a `<legend>` containing the `legendText`. **A `legend` is required** for screen-reader users to understand what the group represents — Carbon's API will warn if you omit it.
- **Group `name`:** every radio in a group MUST share the same `name` attribute (Carbon passes the group's `name` prop down to each child input). This is what makes them mutually exclusive at the browser level.
- **`defaultSelected` vs `value`:** React uses `defaultSelected="radio-2"` on the group (uncontrolled) or `value="radio-2"` (controlled). WC uses `value="radio-2"` on the group (the value of the currently-selected radio).
- **Single-select semantics:** unlike checkboxes, only ONE radio in a group can be selected. Use radios when the user must pick exactly one option from 2-7 alternatives. For more than 7 options, use a Dropdown / Select instead. For 0-or-many, use Checkbox.
- **ARIA states:**
  - Invalid groups apply `aria-invalid="true"` on the `<fieldset>` (and the `data-invalid` / `.cds--radio-button-group--invalid` class that drives the SCSS at L164).
  - `disabled` and `readOnly` are passed through as native HTML attributes; no `aria-*` substitutes are needed.
  - Helper / invalid / warn text is rendered as a sibling node and announced via `aria-describedby` on each input.
- **Keyboard navigation:**
  - `Tab` moves focus INTO the group (lands on the currently-selected radio, or the first radio if none is selected).
  - `Tab` again moves focus OUT of the group entirely (the whole group is one tab stop, not one per radio).
  - `Arrow Up` / `Arrow Left` selects the previous radio in the group (and moves focus to it).
  - `Arrow Down` / `Arrow Right` selects the next radio in the group (and moves focus to it).
  - `Space` selects the focused radio if it's not already selected (native browser behavior; rarely needed because arrow keys also select).
- **Focus management:** Carbon's CSS provides the signature focus outline at `2px solid var(--cds-focus); outline-offset: 1.5px;` (NOT 1px — radio offset is 1.5px to compensate for the round shape). Do not remove it.
- **Touch target:** the visible circle is 18px, but the clickable label area extends to the full label width plus 10px gap. For pure-icon radios on mobile, wrap in a container with `min-height: 44px` to meet WCAG 2.5.5.
- **Read-only:** the input remains focusable and announces "radio button checked, read only" — selection cannot be changed but the value is still part of the page's accessible content.
- **`hideLabel`:** when set, the label-text is `visually-hidden` but remains in the DOM for screen readers — DO NOT delete the `labelText` prop entirely.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5/6 — that IS the Carbon source | Don't paraphrase, reformat, or "improve" the Carbon source |
| Render the outer circle at 18px with `border-radius: 50%` (Carbon's only round shape) | Don't use `border-radius: 0` — radio buttons are the one Carbon component that breaks the sharp-corner rule (every other component uses `border-radius: 0`) |
| Leave the outer circle `transparent` even when selected — only paint the inner dot | Don't fill the outer circle with `--cds-icon-primary` when selected; only the `::before` inner circle is painted |
| Use `var(--cds-icon-primary)` (#161616) for both the outer border AND the inner dot | Don't use `--cds-button-primary` (blue-60) for the dot; that's the Button rule, not the Radio rule |
| Always wrap radios in `RadioButtonGroup` / `<cds-radio-button-group>` with a `legendText` | Don't use loose `<RadioButton>` siblings without a fieldset/legend — screen readers won't know what the group represents |
| Give every radio in a group the same `name` attribute | Don't omit `name` or give each radio a different name — they won't be mutually exclusive |
| Use `defaultSelected` (uncontrolled) or `value` (controlled) on the GROUP, not on individual radios | Don't put `checked` on individual `<RadioButton>` children — control selection at the group level |
| Use radios for "pick exactly one of 2-7 options" | Don't use radios for "pick zero or more" (use Checkbox) or for "pick one of 8+ options" (use Dropdown/Select) |
| Apply the `2px solid var(--cds-focus)` + `1.5px` offset focus outline | Don't suppress focus styles on selection controls; Carbon's focus ring is visually load-bearing |
| Use `[data-theme="white"]` or `[data-theme="g100"]` to scope tokens | Don't hard-code hex; the same markup must work in both themes |
| Use 6px vertical row gap (Carbon's `convert.to-rem(6px)` between wrappers) | Don't double-space radio lists; the dense rhythm is part of the Carbon density signal |
| For card-style radio selection, use `RadioTile` from `tile.md` (96px+ tall) | Don't try to upscale a regular RadioButton into a card — RadioTile is a separate Tile-based component with its own SCSS in `tile.scss` |
