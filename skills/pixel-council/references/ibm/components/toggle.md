---
name: toggle
description: Carbon Toggle — on/off switch control rendered as a pill-shaped track with a sliding circular knob; embeds verbatim Storybook source for Default (md), SmallToggle (sm), WithAccessibleLabels (hideLabel + aria-labelledby), and Skeleton variants
metadata:
  tags: toggle, switch, on-off, form, selection, ibm, carbon, react, web-components
---

# Toggle -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story:** [`Toggle.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Toggle/Toggle.stories.js)
> - **WC story:** [`toggle.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/toggle/toggle.stories.ts)
> - **SCSS:** [`_toggle.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/toggle/_toggle.scss)
> - **Storybook live (React):** https://react.carbondesignsystem.com/?path=/story/components-toggle--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-toggle--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/toggle/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| Track size (md, default) | `48px × 24px` (`inline-size: 3rem; block-size: 1.5rem;` in `_toggle.scss`) |
| Track size (sm) | `32px × 16px` (`inline-size: 2rem; block-size: 1rem;`) |
| Track corner radius | `12px` (`border-radius: 0.75rem` — pill shape, the largest deliberate radius in Carbon) |
| Knob size (md) | `18px × 18px`, inset `3px` from each edge of the track |
| Knob size (sm) | `10px × 10px`, inset `3px` from each edge of the track |
| Knob shape | Circle (`border-radius: 50%`) |
| Knob shift (md) | `translateX(24px)` from off → on |
| Knob shift (sm) | `translateX(16px)` from off → on |
| Track off color | `var(--cds-toggle-off)` = `#8d8d8d` (gray-50) — same in both themes |
| Track on color | `var(--cds-support-success)` = `#24a148` (White) / `#42be65` (G100) |
| Knob color (off + on) | `var(--cds-icon-on-color)` = `#ffffff` (both themes) |
| Top label text style | `label-01` — IBM Plex Sans 12px / 16px line / 0.32px letter-spacing / weight 400, `color: var(--cds-text-secondary)` |
| Side text ("On" / "Off") | `body-01` — IBM Plex Sans 14px / 20px line / 0.16px letter-spacing / weight 400, `color: var(--cds-text-primary)` |
| Top label bottom margin | `16px` (`margin-block-end: $spacing-05`) — `8px` (`$spacing-03`) when `enable-v12-toggle-reduced-label-spacing` flag is on |
| Track ↔ side-text gap | `8px` (`column-gap: $spacing-03`) |
| Focus ring | `outline: 2px solid var(--cds-focus); outline-offset: 1px;` rendered as a `::after` pseudo overlay on the switch (radius `16px` to match track) |
| Animation duration | `70ms` `cubic-bezier(0.2, 0, 0.38, 0.9)` — `$duration-fast-01` × `motion(exit, productive)` — applied to track `background-color` AND knob `transform` |
| ARIA pattern | `<button role="switch" aria-checked="true|false">` — Carbon's `__button` is a real `<button>`, NOT a checkbox |
| React import | `import { Toggle, ToggleSkeleton } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/toggle/index.js';` |

> **Note on knob size in the planning doc:** the spec brief lists `12px (sm)` and `18px (md)` knobs. The verbatim Carbon source (`_toggle.scss`, `block-size: convert.to-rem(18px)` on `.cds--toggle__switch::before` and `convert.to-rem(10px)` on the `--sm` override) renders the small knob at `10px`, not `12px`. Carbon's source values are the truth; the brief was approximate.

## Variants (from Storybook story exports)

Every story export found in `Toggle.stories.js` (React) and `toggle.stories.ts` (WC):

| Variant | Story export | Purpose |
|---|---|---|
| Default (md) | `Default` | Medium toggle (48 × 24) with `labelText="Label"`, `labelA="Off"`, `labelB="On"`, `defaultToggled` |
| Small | `SmallToggle` | Small toggle (32 × 16) with `size="sm"`, otherwise identical to Default |
| With accessible labels | `WithAccessibleLabels` | Four toggles in a `VStack` showing: rest, `hideLabel`, `aria-labelledby` to a sibling div, `aria-labelledby` to a paired `<label>` |
| Skeleton | `Skeleton` | Loading placeholder — `ToggleSkeleton` / `<cds-toggle-skeleton>` — circle + bar |

## React (verbatim from Storybook)

> The code blocks below are copied exactly from `Toggle.stories.js` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + story metadata** (from the top of the stories file):

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';

import { VStack } from '../Stack';
import Toggle, { ToggleSkeleton } from '../Toggle';
import mdx from './Toggle.mdx';

export default {
  title: 'Components/Toggle',
  component: Toggle,
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
    <Toggle
      labelText="Label"
      labelA="Off"
      labelB="On"
      defaultToggled
      id="toggle-3"
      {...args}
    />
  );
};

Default.argTypes = {
  className: {
    control: false,
  },
  defaultToggled: {
    control: false,
  },
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
  id: {
    control: false,
  },
  labelA: {
    control: false,
  },
  labelB: {
    control: false,
  },
  labelText: {
    control: false,
  },
  onClick: {
    control: false,
  },
  onToggle: {
    control: false,
  },
  size: {
    size: {
      options: ['sm', 'md'],
      control: { type: 'select' },
    },
  },
};
```

**Variant: SmallToggle**

```jsx
export const SmallToggle = (args) => {
  return (
    <Toggle
      size="sm"
      labelText="Label"
      labelA="Off"
      labelB="On"
      defaultToggled
      id="toggle-2"
      {...args}
    />
  );
};
```

**Variant: WithAccessibleLabels**

```jsx
export const WithAccessibleLabels = () => {
  return (
    <VStack gap={7}>
      <Toggle id="toggle-4" labelText="Label" />

      <Toggle id="toggle-5" labelText="Label" hideLabel />

      <div>
        <div id="toggle-6-label" style={{ marginBlockEnd: '0.5rem' }}>
          Internal aria-label toggle
        </div>
        <Toggle aria-labelledby="toggle-6-label" id="toggle-6" />
      </div>

      <div>
        <label
          id="toggle-7-label"
          htmlFor="toggle-7"
          style={{ display: 'block', marginBlockEnd: '0.5rem' }}>
          External toggle label
        </label>
        <Toggle aria-labelledby="toggle-7-label" id="toggle-7" />
      </div>
    </VStack>
  );
};
```

**Variant: Skeleton**

```jsx
export const Skeleton = (args) => {
  return (
    <div>
      <ToggleSkeleton />
    </div>
  );
};

Skeleton.parameters = {
  controls: { include: ['className'] },
};
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `toggle.stories.ts` on the Carbon `main` branch. Use these for non-React projects (HTML, Vue, Svelte, Astro, Lit, etc.).

**Imports + default args + control bindings** (from the top of the stories file):

```ts
/**
 * Copyright IBM Corp. 2019, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './index';
import '../stack/index';
import { TOGGLE_SIZE } from './toggle';

const sizes = {
  'Medium size (default)': null,
  [`Small size (${TOGGLE_SIZE.SMALL})`]: TOGGLE_SIZE.SMALL,
};

const defaultArgs = {
  labelA: 'On',
  labelB: 'Off',
  toggled: true,
  labelText: 'Label',
};

const smallToggleArgs = {
  labelA: 'On',
  labelB: 'Off',
  toggled: true,
  labelText: 'Label',
  size: 'sm',
};

const controls = {
  disabled: {
    control: 'boolean',
    description: 'Whether this control should be disabled',
  },
  hideLabel: {
    control: 'boolean',
    description:
      "If true, the side labels (props.labelA and props.labelB) will be replaced by props.labelText (if passed), so that the toggle doesn't render a top label.",
  },
  labelA: {
    control: 'text',
    description: 'Specify the label for the "on" position',
  },
  labelB: {
    control: 'text',
    description: 'Specify the label for the "off" position',
  },
  labelText: {
    control: 'text',
    description: 'The text that is read for the control',
  },
  readOnly: {
    control: 'boolean',
    description: 'Whether the toggle should be read-only',
  },
  size: {
    control: 'radio',
    description:
      "Specify the size of the Toggle. Currently only supports 'sm' or 'md' (default)",
    options: sizes,
  },
  toggled: {
    control: 'boolean',
    description: 'Specify whether the control is toggled',
  },
};
```

**Variant: Default**

```html
<cds-toggle
  label-b="${labelB}"
  label-a="${labelA}"
  ?disabled="${disabled}"
  ?hideLabel="${hideLabel}"
  label-text="${labelText}"
  size="${size}"
  ?read-only=${readOnly}
  ?toggled="${toggled}"></cds-toggle>
```

**Variant: SmallToggle**

```html
<cds-toggle
  ?toggled="${toggled}"
  ?read-only=${readOnly}
  ?disabled="${disabled}"
  ?hideLabel="${hideLabel}"
  label-text="${labelText}"
  label-b="${labelB}"
  label-a="${labelA}"
  size="${size}"></cds-toggle>
```

**Variant: WithAccessibleLabels**

```html
<cds-stack gap="7">
  <cds-toggle id="toggle-4" label-text="Label"></cds-toggle>
  <cds-toggle id="toggle-5" label-text="Label" hideLabel></cds-toggle>

  <div>
    <div id="toggle-6-label" style="margin-block-end: 0.5rem;">
      Internal aria-label toggle
    </div>
    <cds-toggle aria-labelledby="toggle-6-label" id="toggle-6"></cds-toggle>
  </div>

  <div>
    <label
      id="toggle-7-label"
      for="toggle-7"
      style="display: block; margin-block-end: 0.5rem;">
      External toggle label
    </label>
    <cds-toggle aria-labelledby="toggle-7-label" id="toggle-7"></cds-toggle>
  </div>
</cds-stack>
```

**Variant: Skeleton**

```html
<cds-toggle-skeleton></cds-toggle-skeleton>
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${...}` bindings resolved to literal attribute values. Use this for hand-coded HTML without a component framework. Carbon's `<cds-toggle>` custom element registers under `@carbon/web-components/es/components/toggle/index.js`.

**Variant: Default (medium, on, with top label + side text)**

```html
<cds-toggle
  label-a="Off"
  label-b="On"
  label-text="Label"
  size="md"
  toggled></cds-toggle>
```

**Variant: SmallToggle (32 × 16, on)**

```html
<cds-toggle
  label-a="Off"
  label-b="On"
  label-text="Label"
  size="sm"
  toggled></cds-toggle>
```

**Variant: Off (default state, no `toggled` attribute)**

```html
<cds-toggle
  label-a="Off"
  label-b="On"
  label-text="Label"
  size="md"></cds-toggle>
```

**Variant: HideLabel (top label removed; the labelText becomes the accessible name)**

```html
<cds-toggle
  label-text="Label"
  size="md"
  hideLabel
  toggled></cds-toggle>
```

**Variant: Disabled**

```html
<cds-toggle
  label-a="Off"
  label-b="On"
  label-text="Label"
  size="md"
  disabled></cds-toggle>
```

**Variant: Read-only**

```html
<cds-toggle
  label-a="Off"
  label-b="On"
  label-text="Label"
  size="md"
  read-only
  toggled></cds-toggle>
```

**Variant: External label (aria-labelledby)**

```html
<label id="toggle-ext-label" for="toggle-ext"
       style="display: block; margin-block-end: 0.5rem;">
  External toggle label
</label>
<cds-toggle id="toggle-ext" aria-labelledby="toggle-ext-label"></cds-toggle>
```

**Variant: Skeleton**

```html
<cds-toggle-skeleton></cds-toggle-skeleton>
```

## Design Tokens (component-scoped)

```css
[data-theme="white"] {
  /* Track */
  --cds-toggle-track-off: #8d8d8d;          /* toggle-off — gray-50 (same in both themes) */
  --cds-toggle-track-on: #24a148;           /* support-success — green-50 */
  --cds-toggle-track-radius: 0.75rem;       /* 12px pill */

  /* Knob (the white circle) */
  --cds-toggle-knob: #ffffff;               /* icon-on-color — knob is white in BOTH off and on states */
  --cds-toggle-knob-shadow: none;           /* Carbon does NOT use a knob shadow — flat by design */

  /* Top label */
  --cds-toggle-label-text: #525252;         /* text-secondary */

  /* Side text ("On" / "Off") */
  --cds-toggle-side-text: #161616;          /* text-primary */

  /* Focus */
  --cds-toggle-focus: #0f62fe;              /* focus — applied as 2px solid outline + 1px offset on the ::after overlay */
  --cds-toggle-focus-radius: 1rem;          /* 16px — slightly larger than track to wrap cleanly */

  /* Disabled */
  --cds-toggle-disabled-track: #c6c6c6;     /* button-disabled — gray-30 (note: NOT toggle-off, NOT a button.scss internal token) */
  --cds-toggle-disabled-knob: #8d8d8d;      /* icon-on-color-disabled — gray-50 */
  --cds-toggle-disabled-label: rgba(22, 22, 22, 0.25); /* text-disabled */
  --cds-toggle-disabled-side-text: rgba(22, 22, 22, 0.25);

  /* Read-only (rare — track becomes outlined transparent, knob becomes dark) */
  --cds-toggle-readonly-border: rgba(22, 22, 22, 0.25); /* icon-disabled */
  --cds-toggle-readonly-track: transparent;
  --cds-toggle-readonly-knob: #161616;      /* icon-primary */
  --cds-toggle-readonly-check: #ffffff;     /* background — the tiny check inside the knob inverts to the page bg */

  /* Skeleton */
  --cds-toggle-skeleton-bg: #e8e8e8;        /* skeleton-background */
}

[data-theme="g100"],
.dark {
  --cds-toggle-track-off: #8d8d8d;          /* toggle-off — same gray-50 in dark */
  --cds-toggle-track-on: #42be65;           /* support-success in G100 — green-40 (brighter green for dark backdrops) */
  --cds-toggle-track-radius: 0.75rem;

  --cds-toggle-knob: #ffffff;
  --cds-toggle-knob-shadow: none;

  --cds-toggle-label-text: #c6c6c6;         /* text-secondary in G100 */
  --cds-toggle-side-text: #f4f4f4;          /* text-primary in G100 */

  --cds-toggle-focus: #ffffff;              /* focus in G100 = white */
  --cds-toggle-focus-radius: 1rem;

  --cds-toggle-disabled-track: rgba(141, 141, 141, 0.3); /* button-disabled in G100 */
  --cds-toggle-disabled-knob: #6f6f6f;      /* icon-on-color-disabled in G100 */
  --cds-toggle-disabled-label: rgba(244, 244, 244, 0.25); /* text-disabled in G100 */
  --cds-toggle-disabled-side-text: rgba(244, 244, 244, 0.25);

  --cds-toggle-readonly-border: rgba(244, 244, 244, 0.25); /* icon-disabled in G100 */
  --cds-toggle-readonly-track: transparent;
  --cds-toggle-readonly-knob: #f4f4f4;      /* icon-primary in G100 */
  --cds-toggle-readonly-check: #161616;     /* background in G100 */

  --cds-toggle-skeleton-bg: #292929;        /* skeleton-background in G100 */
}
```

> **Cross-reference:** these resolve from `overview.md` — `toggle-off` (line 333 White / 837 G100), `support-success` (line 296 / 800), `icon-on-color` (line 289 / 793), `text-secondary` (line 269 / 773), `text-primary` (line 268 / 772), `focus` (line 308 / 812), `button-disabled` (line 326 / 830 — sourced via `@use '../button/tokens' as button` in `_toggle.scss` L168), `icon-on-color-disabled` (line 290 / 794), `text-disabled` (line 276 / 780), `icon-disabled` (line 291 / 795), `icon-primary` (line 286 / 790), `background` (line 217 / 721), `skeleton-background` (line 335 / 839).

## States Reference (from .scss)

> Source-of-truth lines are quoted from `packages/styles/scss/components/toggle/_toggle.scss` on the Carbon `main` branch.

| State | Track background | Knob position | Knob color | Side-text color | Focus overlay | Notes / SCSS line |
|---|---|---|---|---|---|---|
| Rest — off | `#8d8d8d` (`toggle-off`) | `inset-inline-start: 3px` | `#ffffff` (`icon-on-color`) | `#161616` (`text-primary`) | none | L60-69 |
| Rest — on (md) | `#24a148` (`support-success`) | `transform: translateX(24px)` | `#ffffff` | unchanged | none | L97-104 |
| Rest — on (sm) | `#24a148` | `transform: translateX(16px)` | `#ffffff` | unchanged | none | L122-125 |
| Hover (md/sm) | unchanged (no hover background swap in `_toggle.scss`) | unchanged | unchanged | unchanged | unchanged | Carbon does NOT define a hover state for toggle — cursor: `pointer` (L57) is the only feedback |
| Focus-visible | unchanged | unchanged | unchanged | unchanged | `outline: 2px solid #0f62fe; outline-offset: 1px;` on a `::after` pseudo (`block-size: 100%; border-radius: 16px;`) | L82-94 |
| Active | unchanged background | unchanged knob | unchanged knob | unchanged | same focus `::after` overlay reused while `:active` and `:not(.cds--toggle--disabled)` | L86-89 |
| Disabled | `#c6c6c6` (`button-disabled`) | unchanged | `#8d8d8d` (`icon-on-color-disabled`) | `rgba(22,22,22,0.25)` (`text-disabled`) | none | `cursor: not-allowed` (L161); L164-175 |
| Read-only — off | `transparent` with `1px solid rgba(22,22,22,0.25)` (`icon-disabled`) border | `inset-inline-start: 2px` (shifted to compensate for the new 1px border) | `#161616` (`icon-primary`) | unchanged | none | `cursor: default` (L182); L185-198 |
| Read-only — on | `transparent` with `1px solid icon-disabled` border | `translateX(24px)` (md) / `16px` (sm), `inset-block-start: 2px` | `#161616` | unchanged | none — text is selectable: `cursor: text; user-select: text;` (L208-211) | L186-198 |
| Indeterminate | n/a | n/a | n/a | n/a | n/a | Carbon Toggle has no indeterminate state — this is a binary control. Use Checkbox for tri-state. |
| Skeleton | n/a | n/a | n/a | n/a | n/a | `circular-skeleton` 18px circle + `skeleton` 24×8 rectangle (`#e8e8e8`/`#292929`), 8px gap | L222-234 |

## Animation & Motion

Carbon's toggle defines two parallel transitions, both using the **fast-01** duration (`70ms`) and the **productive exit** easing (`cubic-bezier(0.2, 0, 0.38, 0.9)`): the track `background-color` (off-gray ↔ on-green) and the knob `transform: translateX()` (left ↔ right). They start at the same instant, so the color change and the slide feel like a single gesture.

```css
/* Track color transition (from _toggle.scss L65) */
.cds--toggle__switch {
  transition: background-color 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
  /* Carbon source: $duration-fast-01 motion(exit, productive) */
}

/* Knob slide transition (from _toggle.scss L75) */
.cds--toggle__switch::before {
  transition: transform 70ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

/* Off → On state class (Carbon adds .cds--toggle__switch--checked) */
.cds--toggle__switch--checked {
  background-color: var(--cds-support-success);
}
.cds--toggle__switch--checked::before {
  transform: translateX(1.5rem);   /* 24px for md */
}
.cds--toggle__appearance--sm .cds--toggle__switch--checked::before {
  transform: translateX(1rem);     /* 16px for sm */
}

/* RTL — knob slides the other direction (from _toggle.scss L240-247) */
[dir='rtl'] .cds--toggle__switch--checked::before {
  transform: translateX(-1.5rem);
}
[dir='rtl'] .cds--toggle__appearance--sm .cds--toggle__switch--checked::before {
  transform: translateX(-1rem);
}

/* Reduced-motion override — Carbon ships this for the knob (L78-80).
   Mirror it for the track in your project to honor user prefs end-to-end. */
@media (prefers-reduced-motion: reduce) {
  .cds--toggle__switch::before { transition: none; }
  .cds--toggle__switch        { transition: none; }
}
```

**Why the productive (not expressive) curve:** toggles are a control surface, not a hero element. Carbon reserves the slower `expressive` motion tokens (`240ms`+) for full-screen transitions and editorial reveals; selection controls use `productive` to feel responsive without drawing attention.

## Accessibility (from Carbon's docs + source)

- **Semantic element:** Carbon's React `<Toggle>` and WC `<cds-toggle>` both render an internal `<button class="cds--toggle__button" role="switch" aria-checked="true|false">`. The `__button` is `@include visually-hidden` (L42 of `_toggle.scss`) — the visible track + knob (`.cds--toggle__appearance` and its `__switch` child) sit alongside the button inside a `<label>`, and the label's click forwards to the button. **Important: this is a `role="switch"` button, not an `<input type="checkbox">`. Do NOT substitute a checkbox.**
- **Top label vs side labels:** `labelText` renders the small top label (`.cds--toggle__label-text`, `label-01` / `text-secondary`). `labelA` and `labelB` render the side text that swaps based on state (`.cds--toggle__text`, `body-01` / `text-primary`). When `hideLabel` is set, the top label is removed and `labelText` is moved to a `visually-hidden` span so screen readers still announce it.
- **Group naming via `aria-labelledby`:** if the toggle is inside a custom layout where you want a different label element (an `<h3>`, a sibling `<div>`, an external `<label>`), pass `aria-labelledby="some-id"` to point to that node. Carbon will skip rendering its own top label. See the `WithAccessibleLabels` story for all four naming patterns.
- **ARIA states:**
  - `aria-checked="true"` when on, `"false"` when off — written by Carbon to the `__button`.
  - `aria-readonly="true"` when `readOnly` is set (the button is still focusable but `aria-checked` cannot change via interaction).
  - `disabled` is the native HTML attribute on the `__button` — no `aria-disabled` substitute is needed.
- **Keyboard:** `Space` and `Enter` both toggle the `__button` (native `role="switch"` behavior). `Tab` / `Shift+Tab` move focus to/from the toggle. There is NO arrow-key navigation — toggle is a single binary control, not a group.
- **Focus management:** Carbon's CSS renders the focus ring on a `::after` pseudo-element overlaid on `.cds--toggle__switch` — `outline: 2px solid var(--cds-focus); outline-offset: 1px;` with `border-radius: 1rem` (16px) so the ring cleanly wraps the 12px-radius pill. The focus ring also appears on `:active` (L86-89), so click-and-hold shows the same visual state as keyboard focus. **Do not remove `outline: none` on `:focus` of the `__button`** — that line is intentional (`outline: none` on the visually-hidden button), because the visible focus is on the sibling `__switch` overlay.
- **Touch target:** the visible track is 24px tall (md) or 16px tall (sm). Carbon's `<label>` (which contains both `__appearance` and `__button`) has the full top-label height stacked on top, plus `column-gap: 8px` to the side text — total clickable area for the `Default` story is ~`48 × 60px` including the label, which exceeds WCAG 2.5.5 (44 × 44). For the `Small` variant on a touch device with `hideLabel`, wrap the toggle in a container with `min-height: 44px` to maintain the target.
- **High Contrast Mode:** Carbon includes Windows HCM overrides (L153-159) — the track and knob get an `outline` that becomes visible in HCM, and the focus ring switches to the HCM "focus" system color. The verbatim source uses the `@include high-contrast-mode('outline')` and `@include high-contrast-mode('focus')` mixins.

## Do / Don't

| Do | Don't |
|---|---|
| Output the verbatim Storybook code from Sections 5/6 — that IS the Carbon source | Don't paraphrase, reformat, or "improve" the Carbon source |
| Render the track at `48 × 24px` (md) or `32 × 16px` (sm) with `border-radius: 12px` | Don't use Material's 52 × 32 / 36 × 20 dimensions, and don't use Apple's `100% / capsule` radius |
| Use `var(--cds-support-success)` (`#24a148` White / `#42be65` G100) for the **on** state | Don't use `--cds-button-primary` (blue) — Carbon Toggle is GREEN when on, not blue. The blue is only the focus ring. |
| Keep the knob WHITE (`var(--cds-icon-on-color)` = `#ffffff`) in both off and on states | Don't switch the knob color on toggle — Material does that, Carbon does not |
| Render the knob FLAT — no shadow, no inner highlight | Don't add `box-shadow` to the knob; Carbon Toggle is a flat shape, like the rest of Carbon |
| Pair `labelText` (top) with `labelA`/`labelB` (side, "Off"/"On") | Don't put the side text inside the track — they sit OUTSIDE, with `8px` (`$spacing-03`) gap |
| Render the focus ring on a `::after` overlay at `border-radius: 16px`, `outline: 2px solid var(--cds-focus)`, `outline-offset: 1px` | Don't put the focus outline on the inner button or on the track itself — the visible focus is the `::after` (the inner button is `visually-hidden`) |
| Use `<button role="switch" aria-checked="true|false">` as the interactive element | Don't substitute `<input type="checkbox">` — Carbon Toggle is a switch button, not a checkbox |
| Animate both `background-color` (track) and `transform` (knob) at `70ms` `cubic-bezier(0.2, 0, 0.38, 0.9)` | Don't slow it down — Carbon's productive motion is intentionally snappy; `300ms` ease feels Material, not Carbon |
| Use `[data-theme="white"]` or `[data-theme="g100"]` to scope tokens — toggle-off and knob-white are theme-stable, but the on-green AND focus color flip | Don't hardcode `#24a148` — that breaks G100 dark mode where the on-green is `#42be65` (green-40) |
| For read-only, swap the track to `transparent` with a `1px` `icon-disabled` border, and recolor the knob to `icon-primary` (`#161616` / `#f4f4f4`) | Don't just gray out the track — read-only is visually distinct from disabled (border vs filled, dark knob vs gray knob) |
| For RTL layouts, flip the `translateX` sign (Carbon ships this in `_toggle.scss` L240-247) | Don't leave `translateX(24px)` in RTL — the knob will slide off the wrong end of the track |
