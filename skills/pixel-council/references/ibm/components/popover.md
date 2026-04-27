---
name: popover
description: Carbon Popover — click-triggered floating surface with optional caret pointing at an anchor element. Variants Default (12 align positions), TabTip (table/toolbar overflow popover with sharp corner against the trigger), Toggletip (small help-text popover triggered by an info icon), ExperimentalAutoAlign (auto-flips when near viewport edge). Tokenised on `--cds-layer-01` background, `--cds-border-subtle-01` 1px border, **CARBON EXCEPTION `border-radius: 2px`**, 16px content padding (`$spacing-05`).
metadata:
  tags: popover, toggletip, tab-tip, dialog, floating, caret, anchored, click-trigger, auto-align, ibm, carbon, react, web-components
---

# Popover -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (Popover):** [`Popover.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Popover/Popover.stories.js)
> - **React story (Toggletip):** [`Toggletip.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Toggletip/Toggletip.stories.js)
> - **WC story (Popover):** [`popover.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/popover/popover.stories.ts) — also contains the `TabTip` and `TabTipExperimentalAutoAlign` exports.
> - **WC story (Toggletip):** **Not yet available in `@carbon/web-components`** — the WC package ships `cds-toggletip` as an internal element (mounted via the Popover SCSS host selector), but no standalone `toggletip.stories.ts` exists at v11. Use the React Toggletip code below as the canonical source; emit `<cds-toggletip>` in WC contexts (the element is registered when `@carbon/web-components/es/components/popover/index.js` loads).
> - **WC raw SCSS (state values):** [`popover.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/popover/popover.scss) (1 032 lines) — defines `popover-base`, the 12 caret position selectors, `tabTip` host overrides, drop-shadow filter.
> - **Styles SCSS:** [`_popover.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/popover/_popover.scss) (1 554 lines) — declares `$popover-border-radius: 2px`, `$popover-caret-width: 12px`, `$popover-caret-height: 6px`, `popover-tab-tip-button` (32×32 button reset).
> - **Toggletip SCSS:** [`_toggletip.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/toggletip/_toggletip.scss) — `padding: $spacing-05` (16px), `max-inline-size: 18rem` (288px), `popover-offset: 13px`.
> - **Storybook live (Popover, React):** https://react.carbondesignsystem.com/?path=/story/components-popover--default
> - **Storybook live (Popover, WC):** https://web-components.carbondesignsystem.com/?path=/story/components-popover--default
> - **Storybook live (Toggletip, React):** https://react.carbondesignsystem.com/?path=/story/components-toggletip--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/popover/usage/ — and https://v11.carbondesignsystem.com/components/toggletip/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license.

## Quick Reference

| Property | Value |
|---|---|
| **Corner radius** | **`border-radius: 2px`** — **CARBON EXCEPTION** (not `0`). Popover, Toggletip, Tag, and Tooltip are the **only** Carbon components that intentionally break the sharp-corner rule. **Do not change to `0`.** |
| Content padding (Popover) | `var(--cds-spacing-05)` = **16px** (set by `.p-3` utility class in the Storybook stories — `.p-3` resolves to `padding: 1rem`). For Toggletip the SCSS hard-codes `padding: $spacing-05` = 16px on `.cds--toggletip-content`. |
| Max width (Popover) | `max-inline-size: 23rem` = **368px** (from `_popover.scss` line 201). Inline-size is `max-content` so short content doesn't fill the box. |
| Max width (Toggletip) | `max-inline-size: 18rem` = **288px** (from `_toggletip.scss` line 80). |
| Caret dimensions | width `0.75rem` (**12px**), height `0.375rem` (**6px**) — flipped on left/right alignments so width becomes the "long" axis. |
| Popover offset (gap to trigger) | Default `0`. With `caret` flag → `0.625rem` (**10px**). Toggletip → `0.8125rem` (**13px**). |
| Background (White / G10 / G90 / G100) | `--cds-layer-01` → `#f4f4f4` / `#ffffff` / `#393939` / `#262626`. Switchable to `--cds-background` via `backgroundToken="background"` arg. |
| Background (high-contrast variant) | `--cds-background-inverse` → `#393939` (light themes) / `#f4f4f4` (dark themes). Text becomes `--cds-text-inverse`. |
| Border (when `border` flag) | `1px solid var(--cds-border-subtle-01)` (`#c6c6c6` / `#e0e0e0` / `#6f6f6f` / `#525252`), `outline-offset: -1px`. |
| Drop shadow (when `dropShadow`) | `filter: drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2))` — `0 2px 2px rgba(0,0,0,0.2)`. Applied via `filter` (not `box-shadow`) so the caret inherits the shadow. |
| Tab-tip trigger button | `32px × 32px`, button reset, hover `--cds-layer-hover-01`, focus `2px solid --cds-focus` outline. When parent `cds-popover[tabTip][open]`, the trigger gains `background: --cds-layer-01` plus a 2px line covering the popover-side edge (so the popover and button visually merge into one shape with no caret). |
| Toggletip trigger button | Inline-flex, button-reset, default icon fill `--cds-icon-secondary` (`#525252`), hover/open fill `--cds-icon-primary` (`#161616`). |
| Toggletip content padding / row-gap | `padding: 1rem` (**16px**), `row-gap: 1rem` between content and `<ToggletipActions>`. |
| Stacking | `z-index: var(--cds-z-floating)` ≈ `8000` (Carbon's `z-floating` map entry). Position is `absolute`. |
| Animation | Open/close has no transition by default (`display: none ↔ block`). Caret/border tokens transition via the inherited `--cds-duration-fast-02` (110ms) on hover state changes. Carbon's docs classify the popover as a `productive-entrance` motion — emit it if you wrap with your own enter animation. |
| 12 align positions | `top` · `top-start` · `top-end` · `bottom` · `bottom-start` · `bottom-end` · `left` · `left-start` · `left-end` · `right` · `right-start` · `right-end`. Auto-flips when `autoAlign` (Floating UI) is set. |
| ARIA | Trigger: `<button aria-haspopup="dialog" aria-expanded="…" aria-controls="…">`. Surface: `<div role="dialog" aria-modal="false" aria-labelledby="…">`. Toggletip uses `role="tooltip"` on the surface and `aria-describedby` from the trigger. |
| Imports | React: `import { Popover, PopoverContent } from '@carbon/react';` · `import { Toggletip, ToggletipLabel, ToggletipButton, ToggletipContent, ToggletipActions } from '@carbon/react';` · WC: `import '@carbon/web-components/es/components/popover/index.js';` (registers `<cds-popover>`, `<cds-popover-content>`, and the internal `<cds-toggletip>`). |

## Variants (from Storybook story exports)

| Variant | React export | WC export | Purpose |
|---|---|---|---|
| **Default** | `Default` (binds `DefaultStory`) | `Default` | Click-triggered popover with a 12-position caret. The "Available storage" example (Checkbox icon trigger → `<h2>Available storage</h2>` + body copy). Aligns to one of 12 positions, configurable border / dropShadow / highContrast / caret. |
| **TabTip** | `TabTip` | `TabTip` | Two side-by-side popovers anchored to a Settings icon-button. The trigger and popover **share an edge** (no caret) — used for table-row settings, toolbar overflow, and column-edit panels. Renders form controls inside (radio group + checkbox group). |
| **Toggletip** (React only) | `Default` (in `Toggletip.stories.js`) | n/a — emit `<cds-toggletip>` directly (registered by the popover module) | Small click-triggered help-text popover anchored to an Information icon. Pairs with `<ToggletipLabel>` to label the field, `<ToggletipButton>` (the info-icon trigger), `<ToggletipContent>` (the surface), and optional `<ToggletipActions>` (Link + Button row). Replaces hover-only tooltips when content needs interactivity (links, buttons). |
| **ExperimentalAutoAlign** | `ExperimentalAutoAlign` | `ExperimentalAutoAlign` | Auto-flips the popover when it would clip the viewport. Uses Floating UI under the hood. Demonstrated inside a 5000×5000 scrolling container — scroll any direction to watch the caret/edge auto-realign. |
| ExperimentalAutoAlignBoundary | `ExperimentalAutoAlignBoundary` | `ExperimentalAutoAlignWithBoundary` | autoAlign with a custom boundary element (`autoAlignBoundary` ref / `autoalign-boundary` selector) instead of the document viewport — flips against the boundary's edges. |
| TabTipExperimentalAutoAlign | `TabTipExperimentalAutoAlign` | `TabTipExperimentalAutoAlign` | TabTip + autoAlign combined. The most common production pattern (table column-settings popovers in scrolling overflow regions). |
| Toggletip ExperimentalAutoAlign | `ExperimentalAutoAlign` (in `Toggletip.stories.js`) | n/a | Same as Default Toggletip with `autoAlign` enabled — flips when the help-text would clip the viewport. |

## React (verbatim from Storybook)

> The blocks below are copied **verbatim** from `Popover.stories.js` and `Toggletip.stories.js` on the Carbon `main` branch. Do **not** edit them — Carbon's source is the truth.

**Imports** (top of `packages/react/src/components/Popover/Popover.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import './story.scss';
import { Checkbox as CheckboxIcon } from '@carbon/icons-react';
import React, { useState, useEffect, useRef } from 'react';
import { Popover, PopoverContent } from '../Popover';
import RadioButton from '../RadioButton';
import RadioButtonGroup from '../RadioButtonGroup';
import { default as Checkbox } from '../Checkbox';
import mdx from './Popover.mdx';
import { Settings } from '@carbon/icons-react';
import { keys, match } from '../../internal/keyboard';
import OverflowMenu from '../OverflowMenu/OverflowMenu';
import OverflowMenuItem from '../OverflowMenuItem';

const prefix = 'cds';

export default {
  title: 'Components/Popover',
  component: Popover,
  subcomponents: {
    PopoverContent,
  },
  parameters: {
    controls: {
      hideNoControlsWarning: true,
      exclude: ['relative'],
    },
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Default** (`DefaultStory` is bound below as `export const Default = DefaultStory.bind({})`):

```jsx
const DefaultStory = (props) => {
  const { align, caret, dropShadow, highContrast, open } = props;
  const [isOpen, setIsOpen] = useState(open);

  return (
    <Popover
      {...props}
      align={align}
      caret={caret}
      dropShadow={dropShadow}
      highContrast={highContrast}
      open={isOpen}
      onRequestClose={() => setIsOpen(false)}>
      <button
        className="playground-trigger"
        aria-label="Checkbox"
        type="button"
        aria-expanded={isOpen}
        onClick={() => {
          setIsOpen(!isOpen);
        }}>
        <CheckboxIcon />
      </button>
      <PopoverContent className="p-3">
        <h2 className="popover-title">Available storage</h2>
        <p className="popover-details">
          This server has 150 GB of block storage remaining.
        </p>
      </PopoverContent>
    </Popover>
  );
};
```

```jsx
export const Default = DefaultStory.bind({});

Default.args = {
  caret: true,
  dropShadow: true,
  highContrast: false,
  open: true,
};

Default.argTypes = {
  isTabTip: {
    table: {
      disable: true,
    },
  },
  align: {
    options: [
      'top',
      'top-start',
      'top-end',

      'bottom',
      'bottom-start',
      'bottom-end',

      'left',
      'left-end',
      'left-start',

      'right',
      'right-end',
      'right-start',
    ],
    control: {
      type: 'select',
    },
  },
  border: {
    control: {
      type: 'boolean',
    },
  },
  caret: {
    control: {
      type: 'boolean',
    },
  },
  dropShadow: {
    control: {
      type: 'boolean',
    },
  },
  highContrast: {
    control: {
      type: 'boolean',
    },
  },
  open: {
    control: {
      type: 'boolean',
    },
  },
};

Default.story = {
  decorators: [
    (story) => <div className="mt-10 flex justify-center">{story()}</div>,
  ],
};
```

**Variant: TabTip** (paired settings popovers, edge-to-edge with the trigger):

```jsx
export const TabTip = (args) => {
  const [open, setOpen] = useState(true);
  const [openTwo, setOpenTwo] = useState(false);
  const align = document?.dir === 'rtl' ? 'bottom-right' : 'bottom-left';
  const alignTwo = document?.dir === 'rtl' ? 'bottom-left' : 'bottom-right';
  return (
    <div className="popover-tabtip-story" style={{ display: 'flex' }}>
      <Popover
        align={align}
        open={open}
        onKeyDown={(evt) => {
          if (match(evt, keys.Escape)) {
            setOpen(false);
          }
        }}
        isTabTip
        onRequestClose={() => setOpen(false)}
        {...args}>
        <button
          aria-label="Settings"
          type="button"
          aria-expanded={open}
          onClick={() => {
            setOpen(!open);
          }}>
          <Settings />
        </button>
        <PopoverContent className="p-3">
          <RadioButtonGroup
            style={{ alignItems: 'flex-start', flexDirection: 'column' }}
            legendText="Row height 1"
            name="radio-button-group"
            defaultSelected="small">
            <RadioButton labelText="Small" value="small" id="radio-small" />
            <RadioButton labelText="Large" value="large" id="radio-large" />
          </RadioButtonGroup>
          <hr />
          <fieldset className={`${prefix}--fieldset`}>
            <legend className={`${prefix}--label`}>Edit columns</legend>
            <Checkbox defaultChecked labelText="Name" id="checkbox-label-1" />
            <Checkbox defaultChecked labelText="Type" id="checkbox-label-2" />
            <Checkbox
              defaultChecked
              labelText="Location"
              id="checkbox-label-3"
            />
          </fieldset>
        </PopoverContent>
      </Popover>

      <Popover
        open={openTwo}
        isTabTip
        align={alignTwo}
        onRequestClose={() => setOpenTwo(false)}
        {...args}>
        <button
          aria-label="Settings"
          type="button"
          aria-expanded={open}
          onClick={() => {
            setOpenTwo(!openTwo);
          }}>
          <Settings />
        </button>
        <PopoverContent className="p-3">
          <RadioButtonGroup
            style={{ alignItems: 'flex-start', flexDirection: 'column' }}
            legendText="Row height 2"
            name="radio-button-group-2"
            defaultSelected="small-2">
            <RadioButton labelText="Small" value="small-2" id="radio-small-2" />
            <RadioButton labelText="Large" value="large-2" id="radio-large-2" />
          </RadioButtonGroup>
          <hr />
          <fieldset className={`${prefix}--fieldset`}>
            <legend className={`${prefix}--label`}>Testing</legend>
            <Checkbox defaultChecked labelText="Name" id="checkbox-label-8" />
            <Checkbox defaultChecked labelText="Type" id="checkbox-label-9" />
            <Checkbox
              defaultChecked
              labelText="Location"
              id="checkbox-label-10"
            />
          </fieldset>
        </PopoverContent>
      </Popover>
    </div>
  );
};

TabTip.argTypes = {
  align: {
    table: {
      disable: true,
    },
  },
  autoAlign: {
    table: {
      disable: true,
    },
  },
  highContrast: {
    table: {
      disable: true,
    },
  },
  caret: {
    table: {
      disable: true,
    },
  },
};
```

**Variant: ExperimentalAutoAlign** (the popover auto-flips when scrolled near a viewport edge):

```jsx
const autoAlignArgTypes = {
  autoAlign: {
    table: {
      disable: true,
    },
  },
  highContrast: {
    table: {
      disable: true,
    },
  },
  isTabTip: {
    table: {
      disable: true,
    },
  },
  caret: {
    control: {
      type: 'boolean',
    },
  },
  align: {
    options: [
      'top',
      'top-start',
      'top-end',

      'bottom',
      'bottom-start',
      'bottom-end',

      'left',
      'left-end',
      'left-start',

      'right',
      'right-end',
      'right-start',
    ],
    control: {
      type: 'select',
    },
  },
};

export const ExperimentalAutoAlign = (args) => {
  const [open, setOpen] = useState(true);
  const ref = useRef();

  useEffect(() => {
    ref?.current?.scrollIntoView({ block: 'center', inline: 'center' });
  });

  return (
    <div style={{ width: '5000px', height: '5000px' }}>
      <div
        style={{
          position: 'absolute',
          top: '2500px',
          left: '2500px',
        }}>
        <Popover
          open={open}
          align="top"
          autoAlign
          ref={ref}
          onRequestClose={() => setOpen(false)}
          {...args}>
          <button
            className="playground-trigger"
            aria-label="Checkbox"
            type="button"
            aria-expanded={open}
            onClick={() => {
              setOpen(!open);
            }}>
            <CheckboxIcon />
          </button>
          <PopoverContent className="p-3">
            <div>
              <p className="popover-title">This popover uses autoAlign</p>
              <p className="popover-details">
                Scroll the container up, down, left or right to observe how the
                popover will automatically change its position in attempt to
                stay within the viewport. This works on initial render in
                addition to on scroll.
              </p>
            </div>
          </PopoverContent>
        </Popover>
      </div>
    </div>
  );
};

ExperimentalAutoAlign.argTypes = autoAlignArgTypes;
```

**Variant: ExperimentalAutoAlignBoundary** (autoAlign restricted to a custom boundary instead of the viewport):

```jsx
export const ExperimentalAutoAlignBoundary = (args) => {
  const [open, setOpen] = useState(true);
  const ref = useRef();
  const [boundary, setBoundary] = useState();

  useEffect(() => {
    ref?.current?.scrollIntoView({ block: 'center', inline: 'center' });
  });

  return (
    <div
      style={{
        display: 'grid',
        placeItems: 'center',
        overflow: 'scroll',
        width: '800px',
        height: '500px',
        border: '1px',
        borderStyle: 'dashed',
        borderColor: 'black',
        margin: '0 auto',
      }}
      ref={setBoundary}>
      <div
        style={{
          width: '2100px',
          height: '1px',
          placeItems: 'center',
        }}
      />
      <div style={{ placeItems: 'center', height: '32px', width: '32px' }}>
        <Popover
          open={open}
          align="top"
          autoAlign
          autoAlignBoundary={boundary}
          onRequestClose={() => setOpen(false)}
          ref={ref}
          {...args}>
          <button
            className="playground-trigger"
            aria-label="Checkbox"
            type="button"
            aria-expanded={open}
            onClick={() => {
              setOpen(!open);
            }}>
            <CheckboxIcon />
          </button>
          <PopoverContent className="p-3">
            <div>
              <p className="popover-title">This popover uses autoAlign</p>
              <p className="popover-details">
                Scroll the container up, down, left or right to observe how the
                popover will automatically change its position in attempt to
                stay within the viewport. This works on initial render in
                addition to on scroll.
              </p>
            </div>
          </PopoverContent>
        </Popover>
        <div
          style={{
            height: '1000px',
            width: '1px',
            placeItems: 'center',
          }}
        />
      </div>
    </div>
  );
};

ExperimentalAutoAlignBoundary.argTypes = autoAlignArgTypes;
```

**Variant: TabTipExperimentalAutoAlign** (TabTip + autoAlign — the production pattern for table-column popovers):

```jsx
export const TabTipExperimentalAutoAlign = () => {
  const [open, setOpen] = useState(true);
  const ref = useRef();

  useEffect(() => {
    ref?.current?.scrollIntoView({ block: 'center', inline: 'center' });
  });

  return (
    <div style={{ width: '5000px', height: '5000px' }}>
      <div
        style={{
          position: 'absolute',
          top: '2500px',
          left: '2500px',
        }}>
        <Popover open={open} align="bottom-right" autoAlign ref={ref} isTabTip>
          <div className="playground-trigger">
            <CheckboxIcon
              onClick={() => {
                setOpen(!open);
              }}
            />
          </div>
          <PopoverContent className="p-3">
            <div>
              <p className="popover-title">
                This popover uses autoAlign with isTabTip
              </p>
              <p className="popover-details">
                Scroll the container up, down, left or right to observe how the
                popover will automatically change its position in attempt to
                stay within the viewport. This works on initial render in
                addition to on scroll.
              </p>
            </div>
          </PopoverContent>
        </Popover>
      </div>
    </div>
  );
};
```

### Toggletip stories (verbatim from `packages/react/src/components/Toggletip/Toggletip.stories.js`)

**Imports** (top of `Toggletip.stories.js`):

```jsx
/**
 * Copyright IBM Corp. 2016, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { Information } from '@carbon/icons-react';
import React, { useRef, useEffect } from 'react';
import { default as Button } from '../Button';
import { default as Link } from '../Link';
import Modal from '../Modal';
import {
  ToggletipLabel,
  Toggletip,
  ToggletipButton,
  ToggletipContent,
  ToggletipActions,
} from '../Toggletip';
import mdx from './Toggletip.mdx';

const alignOptions = [
  'top',
  'top-start',
  'top-end',
  'bottom',
  'bottom-start',
  'bottom-end',
  'left',
  'left-start',
  'left-end',
  'right',
  'right-start',
  'right-end',
];

const deprecatedAlignOptions = [
  'top-left',
  'top-right',
  'bottom-left',
  'bottom-right',
  'left-bottom',
  'left-top',
  'right-bottom',
  'right-top',
];

export default {
  title: 'Components/Toggletip',
  component: Toggletip,
  subcomponents: {
    ToggletipLabel,
    ToggletipButton,
    ToggletipContent,
    ToggletipActions,
  },
  parameters: {
    docs: {
      page: mdx,
    },
  },
};
```

**Variant: Toggletip Default** (the canonical info-icon → click-revealed help popover with link + button actions):

```jsx
// Note: autoAlign is used here only to make tooltips visible in StackBlitz,
// autoAlign is in preview and not part of the actual implementation.
export const Default = (args) => {
  const { align, alignDeprecated, ...rest } = args;
  const resolvedAlign = alignDeprecated || align;
  return (
    <>
      <ToggletipLabel>Toggletip label</ToggletipLabel>
      <Toggletip autoAlign align={resolvedAlign} {...rest}>
        <ToggletipButton label="Show information">
          <Information />
        </ToggletipButton>
        <ToggletipContent>
          <p>
            Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed
            do eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.
          </p>
          <ToggletipActions>
            <Link href="#">Link action</Link>
            <Button size="sm">Button</Button>
          </ToggletipActions>
        </ToggletipContent>
      </Toggletip>
    </>
  );
};

Default.argTypes = {
  align: {
    options: alignOptions,
    control: {
      type: 'select',
    },
  },
  alignDeprecated: {
    name: 'align (deprecated)',
    options: deprecatedAlignOptions,
    control: {
      type: 'select',
    },
    table: {
      category: 'Deprecated',
    },
  },
};

Default.story = {
  decorators: [
    (story) => (
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
        }}>
        {story()}
      </div>
    ),
  ],
};
```

**Variant: Toggletip ExperimentalAutoAlign** (toggletip auto-flips against the viewport):

```jsx
export const ExperimentalAutoAlign = () => {
  const ref = useRef();
  useEffect(() => {
    ref?.current?.scrollIntoView({ block: 'center', inline: 'center' });
  });

  return (
    <div style={{ width: '5000px', height: '5000px' }}>
      <div
        style={{
          position: 'absolute',
          top: '2500px',
          left: '2500px',
          inlineSize: '8rem',
        }}>
        <ToggletipLabel>Toggletip label</ToggletipLabel>
        <Toggletip align="bottom" autoAlign defaultOpen>
          <ToggletipButton label="Show information">
            <Information ref={ref} />
          </ToggletipButton>
          <ToggletipContent>
            <p>
              Scroll the container up, down, left or right to observe how the
              Toggletip will automatically change its position in attempt to
              stay within the viewport. This works on initial render in addition
              to on scroll.
            </p>
            <ToggletipActions>
              <Link href="#">Link action</Link>
              <Button size="sm">Button</Button>
            </ToggletipActions>
          </ToggletipContent>
        </Toggletip>
      </div>
    </div>
  );
};
```

## Web Components (verbatim from Storybook)

> The blocks below are copied verbatim from `packages/web-components/src/components/popover/popover.stories.ts` on the Carbon `main` branch. Use these for non-React projects. **Note:** the WC package does not ship a separate `toggletip.stories.ts` file at v11 — emit the toggletip element using the markup pattern in the Plain HTML section below; the `<cds-toggletip>` custom element is registered when `@carbon/web-components/es/components/popover/index.js` is imported.

**Imports** (top of `popover.stories.ts`):

```ts
/**
 * Copyright IBM Corp. 2019, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import './popover';
import './popover-content';
import '../radio-button/index';
import { POPOVER_ALIGNMENT, POPOVER_BACKGROUND_TOKEN } from './defs';
import { prefix } from '../../globals/settings';
import Checkbox16 from '@carbon/icons/es/checkbox/16.js';
import Settings16 from '@carbon/icons/es/settings/16.js';
import '../checkbox';
import { iconLoader } from '../../globals/internal/icon-loader';

import styles from './popover-story.scss?lit';
const sharedArgTypes = {
  align: {
    control: 'select',
    options: [
      POPOVER_ALIGNMENT.TOP,
      POPOVER_ALIGNMENT.TOP_START,
      POPOVER_ALIGNMENT.TOP_END,
      POPOVER_ALIGNMENT.BOTTOM,
      POPOVER_ALIGNMENT.BOTTOM_START,
      POPOVER_ALIGNMENT.BOTTOM_END,
      POPOVER_ALIGNMENT.LEFT,
      POPOVER_ALIGNMENT.LEFT_END,
      POPOVER_ALIGNMENT.LEFT_START,
      POPOVER_ALIGNMENT.RIGHT,
      POPOVER_ALIGNMENT.RIGHT_END,
      POPOVER_ALIGNMENT.RIGHT_START,
    ],
    description: `Specify how the popover should align with the trigger element`,
  },
  autoAlign: {
    control: 'boolean',
    description:
      'Will auto-align the popover on first render if it is not visible. This prop is currently experimental and is subject to future changes',
  },
  caret: {
    control: 'boolean',
    description: `Specify whether a caret should be rendered`,
  },
  border: {
    control: 'boolean',
    description: 'Specify whether a border should be rendered on the popover',
  },
  dropShadow: {
    control: 'boolean',
    description:
      'Specify whether a drop shadow should be rendered on the popover',
  },
  highContrast: {
    control: 'boolean',
    description: 'Render the component using the high-contrast variant',
  },
  backgroundToken: {
    control: 'select',
    options: [
      POPOVER_BACKGROUND_TOKEN.LAYER,
      POPOVER_BACKGROUND_TOKEN.BACKGROUND,
    ],
    description: 'Specify the background token to use. Default is "layer".',
  },
  open: {
    control: 'boolean',
    description: 'Specify whether the component is currently open or closed',
  },
};

const sharedAutoAlignArgTypes = {
  caret: {
    control: 'boolean',
    description: `Specify whether a caret should be rendered`,
  },
  border: {
    control: 'boolean',
    description: 'Specify whether a border should be rendered on the popover',
  },
  highContrast: {
    control: 'boolean',
    description: 'Render the component using the high-contrast variant',
  },
  dropShadow: {
    control: 'boolean',
    description:
      'Specify whether a drop shadow should be rendered on the popover',
  },
  backgroundToken: {
    control: 'select',
    options: [
      POPOVER_BACKGROUND_TOKEN.LAYER,
      POPOVER_BACKGROUND_TOKEN.BACKGROUND,
    ],
    description: 'Specify the background token to use. Default is "layer".',
  },
  open: {
    control: 'boolean',
    description: 'Specify whether the component is currently open or closed',
  },
};
```

**Variant: Default**:

```ts
export const Default = {
  argTypes: sharedArgTypes,
  args: {
    caret: true,
    border: false,
    highContrast: false,
    align: POPOVER_ALIGNMENT.BOTTOM,
    autoAlign: false,
    dropShadow: true,
    open: true,
  },

  decorators: [
    (story) => html`<div class="mt-10 flex justify-center">${story()}</div>`,
  ],
  render: (args) => {
    const handleClick = () => {
      const popover = document.querySelector(`${prefix}-popover`);
      const open = popover?.hasAttribute('open');
      if (open) {
        popover?.removeAttribute('open');
      } else {
        popover?.setAttribute('open', '');
      }
    };

    return html`
      <style>
        ${styles}
      </style>
      <cds-popover
        ?open=${args.open}
        ?caret=${args.caret}
        ?border=${args.border}
        ?highContrast=${args.highContrast}
        ?autoalign=${args.autoAlign}
        align=${args.align}
        ?tabTip=${args.tabTip}
        ?dropShadow=${args.dropShadow}
        backgroundToken=${args.backgroundToken}>
        <button
          class="playground-trigger"
          aria-label="Checkbox"
          type="button"
          aria-expanded=${open}
          @click="${() => handleClick()}">
          ${iconLoader(Checkbox16)}
        </button>
        <cds-popover-content>
          <div class="p-3">
            <p class="popover-title">Available storage</p>
            <p class="popover-details">
              This server has 150 GB of block storage remaining.
            </p>
          </div>
        </cds-popover-content>
      </cds-popover>
    `;
  },
};
```

**Variant: ExperimentalAutoAlign**:

```ts
export const ExperimentalAutoAlign = {
  argTypes: sharedAutoAlignArgTypes,
  args: {
    caret: true,
    highContrast: false,
    dropShadow: true,
    open: true,
    border: false,
    backgroundToken: 'layer',
  },

  decorators: [
    (story) => html`<div class="mt-10 flex justify-center">${story()}</div>`,
  ],
  render: (args) => {
    const handleClick = () => {
      const popover = document.querySelector(`${prefix}-popover`);
      const open = popover?.hasAttribute('open');
      if (open) {
        popover?.removeAttribute('open');
      } else {
        popover?.setAttribute('open', '');
      }
    };

    requestAnimationFrame(() => {
      document.querySelector('cds-popover')?.scrollIntoView({
        block: 'center',
        inline: 'center',
      });
    });
    return html`
      <style>
        ${styles}
      </style>
      <div style="width: 5000px; height: 5000px;">
        <div
          style="position: absolute; top: 2500px;
          left: 2500px; padding-right: 2500px;">
          <cds-popover
            ?open=${args.open}
            ?caret=${args.caret}
            ?highContrast=${args.highContrast}
            autoalign
            ?dropShadow=${args.dropShadow}
            ?border=${args.border}
            backgroundToken=${args.backgroundToken}>
            <button
              class="playground-trigger"
              aria-label="Checkbox"
              type="button"
              aria-expanded=${open}
              @click="${() => handleClick()}">
              ${iconLoader(Checkbox16)}
            </button>
            <cds-popover-content>
              <div class="p-3">
                <p class="popover-title">This popover uses autoAlign</p>
                <p class="popover-details">
                  Scroll the container up, down, left or right to observe how
                  the popover will automatically change its position in attempt
                  to stay within the viewport. This works on initial render in
                  addition to on scroll.
                </p>
              </div>
            </cds-popover-content>
          </cds-popover>
        </div>
      </div>
    `;
  },
};
```

**Variant: ExperimentalAutoAlignWithBoundary**:

```ts
export const ExperimentalAutoAlignWithBoundary = {
  argTypes: sharedAutoAlignArgTypes,
  args: {
    caret: true,
    highContrast: false,
    dropShadow: true,
    open: true,
    border: false,
    backgroundToken: 'layer',
  },

  decorators: [
    (story) => html`<div class="mt-10 flex justify-center">${story()}</div>`,
  ],
  render: (args) => {
    const handleClick = () => {
      const popover = document.querySelector(`${prefix}-popover`);
      const open = popover?.hasAttribute('open');
      if (open) {
        popover?.removeAttribute('open');
      } else {
        popover?.setAttribute('open', '');
      }
    };

    requestAnimationFrame(() => {
      document.querySelector('cds-popover')?.scrollIntoView({
        block: 'center',
        inline: 'center',
      });
    });
    return html`
      <style>
        ${styles}
      </style>
      <div
        id="boundary"
        style="
         display:grid;place-items:center;overflow:auto;
         width:800px;height:500px;border:1px dashed black;margin:0 auto;">
        <div style="width:2100px;height:1px;"></div>
        <div style="place-items:center;height:32px;width:32px;">
          <cds-popover
            ?open=${args.open}
            ?caret=${args.caret}
            ?highContrast=${args.highContrast}
            autoalign-boundary="#boundary"
            autoalign
            ?dropShadow=${args.dropShadow}
            ?border=${args.border}
            backgroundToken=${args.backgroundToken}>
            <button
              class="playground-trigger"
              aria-label="Checkbox"
              type="button"
              aria-expanded=${open}
              @click="${() => handleClick()}">
              ${iconLoader(Checkbox16)}
            </button>
            <cds-popover-content>
              <div class="p-3">
                <p class="popover-title">This popover uses autoAlign</p>
                <p class="popover-details">
                  Scroll the container up, down, left or right to observe how
                  the popover will automatically change its position in attempt
                  to stay within the viewport. This works on initial render in
                  addition to on scroll.
                </p>
              </div>
            </cds-popover-content>
          </cds-popover>
          <div style="height:1000px;width:1px;"></div>
        </div>
      </div>
    `;
  },
};
```

**Variant: TabTip** (paired settings popovers — radio + checkbox content):

```ts
const sharedTabTipArgTypes = {
  dropShadow: {
    control: 'boolean',
    description:
      'Specify whether a drop shadow should be rendered on the popover',
  },
  open: {
    control: 'boolean',
    description: 'Specify whether the component is currently open or closed',
  },
};
export const TabTip = {
  argTypes: sharedTabTipArgTypes,
  args: {
    dropShadow: true,
    open: true,
  },
  render: (args) => {
    const handleClick = (id) => {
      const popover = document.querySelector(id);
      const open = popover?.hasAttribute('open');
      if (open) {
        popover?.removeAttribute('open');
      } else {
        popover?.setAttribute('open', '');
      }
    };

    return html`
      <style>
        ${styles}
      </style>
      <div class="popover-tabtip-story" style="display: 'flex'">
        <cds-popover
          ?dropShadow=${args.dropShadow}
          ?open=${args.open}
          tabTip
          align="bottom-left"
          id="popover-one">
          <button
            aria-label="Settings"
            type="button"
            @click="${() => handleClick('#popover-one')}">
            ${iconLoader(Settings16)}
          </button>
          <cds-popover-content>
            <div class="p-3">
              <cds-form-item>
                <cds-radio-button-group
                  legend-text="Row height 1"
                  name="radio-button-group-1"
                  value="small"
                  orientation="vertical"
                  style="align-items: flex-start; flex-direction: column">
                  <cds-radio-button
                    label-text="Small"
                    value="small"
                    id="radio-small"></cds-radio-button>
                  <cds-radio-button
                    label-text="Large"
                    value="large"
                    id="radio-large"></cds-radio-button>
                </cds-radio-button-group>
              </cds-form-item>
              <hr />
              <cds-checkbox-group legend-text="Edit columns">
                <cds-checkbox
                  checked
                  label-text="Name"
                  id="checkbox-label-1"></cds-checkbox>
                <cds-checkbox
                  checked
                  label-text="Type"
                  id="checkbox-label-2"></cds-checkbox>
                <cds-checkbox
                  checked
                  label-text="Location"
                  id="checkbox-label-3"></cds-checkbox>
              </cds-checkbox-group>
            </div>
          </cds-popover-content>
        </cds-popover>
        <cds-popover
          ?dropShadow=${args.dropShadow}
          ?highContrast=${args.highContrast}
          tabTip
          id="popover-two"
          align="bottom-right"
          backgroundToken=${POPOVER_BACKGROUND_TOKEN.LAYER}>
          <button
            aria-label="Settings"
            type="button"
            @click="${() => handleClick('#popover-two')}">
            ${iconLoader(Settings16)}
          </button>
          <cds-popover-content>
            <div class="p-3">
              <cds-form-item>
                <cds-radio-button-group
                  legend-text="Row height 2"
                  name="radio-button-group-2"
                  value="small"
                  orientation="vertical"
                  style="align-items: flex-start; flex-direction: column">
                  <cds-radio-button
                    label-text="Small"
                    value="small"
                    id="radio-small"></cds-radio-button>
                  <cds-radio-button
                    label-text="Large"
                    value="large"
                    id="radio-large"></cds-radio-button>
                </cds-radio-button-group>
              </cds-form-item>
              <hr />
              <cds-checkbox-group legend-text="Testing">
                <cds-checkbox
                  checked
                  label-text="Name"
                  id="checkbox-label-1"></cds-checkbox>
                <cds-checkbox
                  checked
                  label-text="Type"
                  id="checkbox-label-2"></cds-checkbox>
                <cds-checkbox
                  checked
                  label-text="Location"
                  id="checkbox-label-3"></cds-checkbox>
              </cds-checkbox-group>
            </div>
          </cds-popover-content>
        </cds-popover>
      </div>
    `;
  },
};
```

**Variant: TabTipExperimentalAutoAlign**:

```ts
export const TabTipExperimentalAutoAlign = {
  argTypes: sharedTabTipArgTypes,
  args: {
    highContrast: false,
    dropShadow: true,
    open: true,
  },

  decorators: [
    (story) => html`<div class="mt-10 flex justify-center">${story()}</div>`,
  ],
  render: (args) => {
    const handleClick = () => {
      const popover = document.querySelector(`${prefix}-popover`);
      const open = popover?.hasAttribute('open');
      if (open) {
        popover?.removeAttribute('open');
      } else {
        popover?.setAttribute('open', '');
      }
    };

    requestAnimationFrame(() => {
      document.querySelector('cds-popover')?.scrollIntoView({
        block: 'center',
        inline: 'center',
      });
    });
    return html`
      <style>
        ${styles}
      </style>
      <div style="width: 5000px; height: 5000px;">
        <div
          style="position: absolute; top: 2500px;
          left: 2500px; padding-right: 2500px;">
          <cds-popover
            ?open=${args.open}
            ?highContrast=${args.highContrast}
            autoalign
            tabTip
            ?dropShadow=${args.dropShadow}>
            <div
              class="playground-trigger"
              aria-expanded=${open}
              @click="${() => handleClick()}">
              ${iconLoader(Checkbox16)}
            </div>
            <cds-popover-content>
              <div class="p-3">
                <p class="popover-title">
                  This popover uses autoAlign with tabTip
                </p>
                <p class="popover-details">
                  Scroll the container up, down, left or right to observe how
                  the popover will automatically change its position in attempt
                  to stay within the viewport. This works on initial render in
                  addition to on scroll.
                </p>
              </div>
            </cds-popover-content>
          </cds-popover>
        </div>
      </div>
    `;
  },
};

const meta = {
  title: 'Components/Popover',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${expression}` bindings resolved to literal attributes. Use these for hand-coded HTML without a component framework. The `cds-*` custom elements still require `@carbon/web-components/es/components/popover/index.js` to be loaded on the page.

**Variant: Default** (the canonical bottom-aligned popover with caret + drop shadow on the storage example):

```html
<cds-popover
  open
  caret
  align="bottom"
  dropShadow>
  <button
    class="playground-trigger"
    aria-label="Checkbox"
    type="button"
    aria-expanded="true"
    aria-haspopup="dialog"
    aria-controls="popover-default-content">
    <!-- @carbon/icons checkbox/16 -->
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
      <path d="M14 21.414 9 16.413 10.413 15 14 18.586 21.585 11 23 12.415z"/>
      <path d="M28 4H4c-1.103 0-2 .898-2 2v20c0 1.103.897 2 2 2h24c1.103 0 2-.897 2-2V6c0-1.102-.897-2-2-2zM4 26V6h24l.002 20H4z"/>
    </svg>
  </button>
  <cds-popover-content id="popover-default-content" role="dialog" aria-labelledby="popover-default-title">
    <div class="p-3">
      <p class="popover-title" id="popover-default-title">Available storage</p>
      <p class="popover-details">This server has 150 GB of block storage remaining.</p>
    </div>
  </cds-popover-content>
</cds-popover>
```

**Variant: Default — bordered + high-contrast permutations**:

```html
<!-- Bordered variant (1px subtle outline) -->
<cds-popover open caret border align="bottom" dropShadow>
  <button class="playground-trigger" type="button" aria-haspopup="dialog" aria-expanded="true" aria-label="Checkbox">…</button>
  <cds-popover-content role="dialog">
    <div class="p-3">
      <p class="popover-title">Bordered popover</p>
      <p class="popover-details">Adds a 1px border-subtle-01 outline around the surface.</p>
    </div>
  </cds-popover-content>
</cds-popover>

<!-- High-contrast variant (inverse background + inverse text) -->
<cds-popover open caret highContrast align="bottom" dropShadow>
  <button class="playground-trigger" type="button" aria-haspopup="dialog" aria-expanded="true" aria-label="Checkbox">…</button>
  <cds-popover-content role="dialog">
    <div class="p-3">
      <p class="popover-title">High-contrast popover</p>
      <p class="popover-details">Inverts to background-inverse / text-inverse for callout emphasis.</p>
    </div>
  </cds-popover-content>
</cds-popover>

<!-- backgroundToken="background" — switches surface from --cds-layer-01 to --cds-background -->
<cds-popover open caret align="bottom" dropShadow backgroundToken="background">
  <button class="playground-trigger" type="button" aria-haspopup="dialog" aria-expanded="true" aria-label="Checkbox">…</button>
  <cds-popover-content role="dialog">
    <div class="p-3"><p>Background-token surface</p></div>
  </cds-popover-content>
</cds-popover>
```

**Variant: TabTip** (paired settings popovers; trigger and surface share an edge — no caret):

```html
<div class="popover-tabtip-story" style="display: flex">
  <cds-popover open tabTip align="bottom-left" id="popover-one" dropShadow>
    <button aria-label="Settings" aria-haspopup="dialog" aria-expanded="true" aria-controls="popover-one-content" type="button">
      <!-- @carbon/icons settings/16 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M27 16.76v-1.53l1.92-1.68A2 2 0 0 0 29.41 11l-2.36-4a2 2 0 0 0-1.73-1 2 2 0 0 0-.64.1l-2.43.82a11.35 11.35 0 0 0-1.31-.75l-.51-2.52a2 2 0 0 0-2-1.61h-4.86a2 2 0 0 0-2 1.61l-.51 2.52a11.48 11.48 0 0 0-1.32.75l-2.42-.82a2 2 0 0 0-.64-.1 2 2 0 0 0-1.74 1l-2.36 4a2 2 0 0 0 .49 2.56L4.93 15.23v1.54l-1.92 1.68A2 2 0 0 0 2.59 21l2.35 4a2 2 0 0 0 1.73 1 2 2 0 0 0 .64-.1l2.43-.82a11.35 11.35 0 0 0 1.31.75l.51 2.52a2 2 0 0 0 2 1.61h4.83a2 2 0 0 0 2-1.61l.51-2.52a11.48 11.48 0 0 0 1.32-.75l2.42.82a2 2 0 0 0 .64.1 2 2 0 0 0 1.74-1l2.36-4a2 2 0 0 0-.49-2.56zM25.32 24l-3.36-1.13a8.92 8.92 0 0 1-2.55 1.47L18.71 28h-4.86l-.7-3.61A9.07 9.07 0 0 1 10.6 22.9L7.25 24l-2.36-4 2.74-2.4a8.83 8.83 0 0 1 0-2.94L4.89 12l2.36-4 3.36 1.13A8.92 8.92 0 0 1 13.16 7.7l.7-3.65h4.86l.7 3.61a9.07 9.07 0 0 1 2.55 1.47L25.32 8l2.36 4-2.74 2.4a8.83 8.83 0 0 1 0 2.94L27.71 20zM16 11.4a4.6 4.6 0 1 0 4.6 4.6 4.6 4.6 0 0 0-4.6-4.6zm0 7.2a2.6 2.6 0 1 1 2.6-2.6 2.6 2.6 0 0 1-2.6 2.6z"/>
      </svg>
    </button>
    <cds-popover-content id="popover-one-content" role="dialog" aria-label="Row height settings">
      <div class="p-3">
        <cds-form-item>
          <cds-radio-button-group legend-text="Row height 1" name="radio-button-group-1" value="small" orientation="vertical" style="align-items: flex-start; flex-direction: column">
            <cds-radio-button label-text="Small" value="small" id="radio-small"></cds-radio-button>
            <cds-radio-button label-text="Large" value="large" id="radio-large"></cds-radio-button>
          </cds-radio-button-group>
        </cds-form-item>
        <hr />
        <cds-checkbox-group legend-text="Edit columns">
          <cds-checkbox checked label-text="Name" id="checkbox-label-1"></cds-checkbox>
          <cds-checkbox checked label-text="Type" id="checkbox-label-2"></cds-checkbox>
          <cds-checkbox checked label-text="Location" id="checkbox-label-3"></cds-checkbox>
        </cds-checkbox-group>
      </div>
    </cds-popover-content>
  </cds-popover>

  <cds-popover tabTip align="bottom-right" id="popover-two" dropShadow backgroundToken="layer">
    <button aria-label="Settings" aria-haspopup="dialog" aria-expanded="false" aria-controls="popover-two-content" type="button">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true"><!-- settings/16 path --></svg>
    </button>
    <cds-popover-content id="popover-two-content" role="dialog" aria-label="Testing settings">
      <div class="p-3">
        <cds-form-item>
          <cds-radio-button-group legend-text="Row height 2" name="radio-button-group-2" value="small" orientation="vertical" style="align-items: flex-start; flex-direction: column">
            <cds-radio-button label-text="Small" value="small" id="radio-small-2"></cds-radio-button>
            <cds-radio-button label-text="Large" value="large" id="radio-large-2"></cds-radio-button>
          </cds-radio-button-group>
        </cds-form-item>
        <hr />
        <cds-checkbox-group legend-text="Testing">
          <cds-checkbox checked label-text="Name" id="checkbox-label-4"></cds-checkbox>
          <cds-checkbox checked label-text="Type" id="checkbox-label-5"></cds-checkbox>
          <cds-checkbox checked label-text="Location" id="checkbox-label-6"></cds-checkbox>
        </cds-checkbox-group>
      </div>
    </cds-popover-content>
  </cds-popover>
</div>
```

**Variant: Toggletip** (small click-revealed help-text popover anchored to an Information icon — emit `<cds-toggletip>` with the slot pattern that mirrors the React `<ToggletipLabel>` / `<ToggletipButton>` / `<ToggletipContent>` / `<ToggletipActions>` composition):

```html
<!-- Field with a Toggletip-labelled control -->
<div style="display: flex; align-items: center;">
  <span class="cds--toggletip-label">Toggletip label</span>
  <cds-toggletip alignment="bottom" autoalign open>
    <button slot="trigger" class="cds--toggletip-button" aria-label="Show information" type="button" aria-haspopup="dialog" aria-expanded="true" aria-controls="toggletip-content-1">
      <!-- @carbon/icons information/16 -->
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 32 32" aria-hidden="true">
        <path d="M17 22v-8h-4v2h2v6h-3v2h8v-2zM16 8a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 16 8z"/>
        <path d="M16 30a14 14 0 1 1 14-14 14 14 0 0 1-14 14zm0-26a12 12 0 1 0 12 12A12 12 0 0 0 16 4z"/>
      </svg>
    </button>
    <div id="toggletip-content-1" class="cds--toggletip-content" role="dialog" aria-label="Toggletip help">
      <p>Lorem ipsum dolor sit amet, di os consectetur adipiscing elit, sed do eiusmod tempor incididunt ut fsil labore et dolore magna aliqua.</p>
      <div class="cds--toggletip-actions">
        <a href="#" class="cds--link">Link action</a>
        <button class="cds--btn cds--btn--primary cds--btn--sm" type="button">Button</button>
      </div>
    </div>
  </cds-toggletip>
</div>
```

## Design Tokens (component-scoped, literal hex per theme)

> Carbon uses the same surface tokens as Tile / Modal — Popover doesn't ship its own colour ramp. The only popover-specific custom properties are dimensional (`--cds-popover-offset`, `--cds-popover-caret-width`, `--cds-popover-caret-height`, `--cds-popover-border-radius`, `--cds-popover-drop-shadow`). Tokens are resolved from `overview.md`.

```css
/* Light primary — White */
[data-theme="white"] {
  /* Surface (default backgroundToken="layer") */
  --cds-popover-background:        #f4f4f4;  /* layer-01 — gray-10 */
  --cds-popover-background-alt:    #ffffff;  /* background — when backgroundToken="background" */
  --cds-popover-text:               #161616;  /* text-primary — gray-100 */
  --cds-popover-border:             #c6c6c6;  /* border-subtle-01 — gray-30 (when [border]) */

  /* High-contrast variant inverts to background-inverse / text-inverse */
  --cds-popover-bg-high-contrast:   #393939;  /* background-inverse — gray-80 */
  --cds-popover-text-high-contrast: #ffffff;  /* text-inverse */

  /* TabTip trigger button — picks up layer-01 hover and focus ring */
  --cds-popover-trigger-hover:      #e8e8e8;  /* layer-hover-01 */
  --cds-popover-trigger-active:     #c6c6c6;  /* layer-active-01 */
  --cds-popover-icon-rest:          #525252;  /* icon-secondary (Toggletip default) */
  --cds-popover-icon-active:        #161616;  /* icon-primary (Toggletip hover/open) */

  /* Focus ring */
  --cds-popover-focus:              #0f62fe;  /* focus — blue-60 */

  /* Dimensional tokens (shared across themes) */
  --cds-popover-border-radius:      2px;        /* CARBON EXCEPTION */
  --cds-popover-offset:             0rem;       /* default; with [caret] becomes 0.625rem (10px); Toggletip is 0.8125rem (13px) */
  --cds-popover-caret-width:        0.75rem;    /* 12px */
  --cds-popover-caret-height:       0.375rem;   /* 6px */
  --cds-popover-drop-shadow:        drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2));
  --cds-popover-max-inline-size:    23rem;      /* 368px (popover) */
  --cds-popover-max-inline-toggletip: 18rem;    /* 288px (toggletip) */
  --cds-popover-padding:            1rem;       /* 16px ($spacing-05) */
  --cds-popover-tabtip-button-size: 2rem;       /* 32px square */
  --cds-popover-z-index:            8000;       /* z('floating') */
}

/* Light secondary — G10 */
[data-theme="g10"] {
  --cds-popover-background:        #ffffff;  /* layer-01 inverts to white in G10 */
  --cds-popover-background-alt:    #f4f4f4;  /* background — gray-10 in G10 */
  --cds-popover-text:               #161616;
  --cds-popover-border:             #e0e0e0;  /* border-subtle-01 — gray-20 in G10 */
  --cds-popover-bg-high-contrast:   #393939;
  --cds-popover-text-high-contrast: #ffffff;
  --cds-popover-trigger-hover:      #e8e8e8;
  --cds-popover-trigger-active:     #c6c6c6;
  --cds-popover-icon-rest:          #525252;
  --cds-popover-icon-active:        #161616;
  --cds-popover-focus:              #0f62fe;
  --cds-popover-border-radius:      2px;
  --cds-popover-offset:             0rem;
  --cds-popover-caret-width:        0.75rem;
  --cds-popover-caret-height:       0.375rem;
  --cds-popover-drop-shadow:        drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2));
  --cds-popover-padding:            1rem;
  --cds-popover-tabtip-button-size: 2rem;
}

/* Dark secondary — G90 */
[data-theme="g90"] {
  --cds-popover-background:        #393939;  /* layer-01 — gray-80 */
  --cds-popover-background-alt:    #262626;  /* background — gray-90 */
  --cds-popover-text:               #f4f4f4;  /* text-primary — gray-10 */
  --cds-popover-border:             #6f6f6f;  /* border-subtle-01 — gray-60 in G90 */
  --cds-popover-bg-high-contrast:   #f4f4f4;  /* background-inverse on G90 */
  --cds-popover-text-high-contrast: #161616;
  --cds-popover-trigger-hover:      #4c4c4c;  /* layer-hover-01 */
  --cds-popover-trigger-active:     #6f6f6f;
  --cds-popover-icon-rest:          #c6c6c6;  /* icon-secondary on G90 */
  --cds-popover-icon-active:        #f4f4f4;
  --cds-popover-focus:              #ffffff;  /* focus — white on dark */
  --cds-popover-border-radius:      2px;
  --cds-popover-offset:             0rem;
  --cds-popover-caret-width:        0.75rem;
  --cds-popover-caret-height:       0.375rem;
  --cds-popover-drop-shadow:        drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2));
  --cds-popover-padding:            1rem;
  --cds-popover-tabtip-button-size: 2rem;
}

/* Dark primary — G100 (mirrored on .dark for class-based dark-mode toggles) */
[data-theme="g100"],
.dark {
  --cds-popover-background:        #262626;  /* layer-01 — gray-90 */
  --cds-popover-background-alt:    #161616;  /* background — gray-100 */
  --cds-popover-text:               #f4f4f4;
  --cds-popover-border:             #525252;  /* border-subtle-01 — gray-70 in G100 */
  --cds-popover-bg-high-contrast:   #f4f4f4;
  --cds-popover-text-high-contrast: #161616;
  --cds-popover-trigger-hover:      #333333;  /* layer-hover-01 in G100 */
  --cds-popover-trigger-active:     #525252;
  --cds-popover-icon-rest:          #c6c6c6;
  --cds-popover-icon-active:        #f4f4f4;
  --cds-popover-focus:              #ffffff;
  --cds-popover-border-radius:      2px;
  --cds-popover-offset:             0rem;
  --cds-popover-caret-width:        0.75rem;
  --cds-popover-caret-height:       0.375rem;
  --cds-popover-drop-shadow:        drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2));
  --cds-popover-padding:            1rem;
  --cds-popover-tabtip-button-size: 2rem;
}
```

## Complete CSS (derived from `popover.scss` + `_popover.scss` + `_toggletip.scss`)

> Selectors mirror Carbon's source. Caret position math is computed from `$popover-caret-width` / `$popover-caret-height` and the popover offset — the source defines 12 alignment selectors (one per align value) which all flow through the same caret pseudo-element pattern. The block below covers `bottom` (the default) plus the layout primitives — `top` / `left` / `right` follow the same template with the caret rotated and inset properties swapped (see lines 191-1031 of `popover.wc.scss`).

```css
/* ----- POPOVER CONTAINER ----- */
.cds--popover-container,
:host(cds-popover) .cds--popover-container {
  display: inline-block;
}
.cds--popover-container:not(.cds--popover--auto-align) {
  /* autoAlign popovers cannot be position: relative — they would be clipped by overflow:hidden ancestors */
  position: relative;
}

/* ----- POPOVER (the floating wrapper) ----- */
.cds--popover,
:host(cds-tooltip-content) .cds--popover,
:host(cds-popover-content) .cds--popover {
  position: absolute;
  inset: 0;
  z-index: 8000;                      /* z('floating') */
  pointer-events: none;
}

/* Drop-shadow modifier — applied via filter (not box-shadow) so the caret inherits */
.cds--popover--drop-shadow .cds--popover,
:host(cds-popover-content[dropShadow]) .cds--popover,
:host(cds-tooltip-content[dropShadow]) .cds--popover {
  filter: drop-shadow(0 0.125rem 0.125rem rgba(0, 0, 0, 0.2));
}

/* ----- POPOVER CONTENT (the visible surface) ----- */
.cds--popover-content,
:host(cds-popover-content) .cds--popover-content,
:host(cds-tooltip-content) .cds--popover-content {
  position: absolute;
  z-index: 8000;
  display: none;                                  /* shown when [open] */
  /* CARBON EXCEPTION — Popover uses border-radius: 2px (not 0). */
  border-radius: 2px;
  background-color: var(--cds-layer-01, #f4f4f4); /* default backgroundToken="layer" */
  color: var(--cds-text-primary, #161616);
  inline-size: max-content;
  max-inline-size: 23rem;                          /* 368px */
  pointer-events: auto;
}

/* Open state */
.cds--popover--open > .cds--popover > .cds--popover-content,
:host(cds-popover-content[open]) .cds--popover-content,
:host(cds-tooltip-content[open]) .cds--popover-content {
  display: block;
}

/* backgroundToken="background" — surface uses --cds-background instead of --cds-layer */
.cds--popover--background-token__background > .cds--popover > .cds--popover-content,
:host(cds-popover-content[backgroundToken='background']:not([highContrast])) .cds--popover-content {
  background-color: var(--cds-background, #ffffff);
}

/* Bordered modifier */
.cds--popover--border > .cds--popover > .cds--popover-content,
:host(cds-popover-content[border]) .cds--popover-content,
:host(cds-tooltip-content[border]) .cds--popover-content {
  outline: 1px solid var(--cds-border-subtle-01, #c6c6c6);
  outline-offset: -1px;
}

/* High-contrast modifier — inverse background + inverse text */
.cds--popover--high-contrast .cds--popover .cds--popover-content,
:host(cds-popover[highContrast]) ::slotted(cds-popover-content) .cds--popover-content,
:host(cds-tooltip[highContrast]) ::slotted(cds-tooltip-content) .cds--popover-content {
  background-color: var(--cds-background-inverse, #393939);
  color: var(--cds-text-inverse, #ffffff);
}

/* Caret modifier — sets the offset to 10px so there's a 4px gap between caret tip and trigger */
.cds--popover--caret {
  --cds-popover-offset: 0.625rem;       /* 10px */
}

/* ----- POPOVER CARET ----- */
.cds--popover-caret,
:host(cds-popover-content[open][caret]) .cds--popover-caret,
:host(cds-tooltip-content[open][caret]) .cds--popover-caret {
  position: absolute;
  z-index: 8000;
  display: none;
  will-change: transform;               /* prevents subpixel-render seam between caret and surface */
}
.cds--popover--open > .cds--popover > .cds--popover-caret,
:host(cds-popover-content[open][caret]) .cds--popover-caret { display: block; }

.cds--popover-caret::after { /* caret fill */
  position: absolute;
  display: block;
  background: var(--cds-layer-01, #f4f4f4);
  content: '';
}
.cds--popover-caret::before { /* caret border (when [border]) */
  position: absolute;
  display: none;
  background-color: var(--cds-border-subtle-01, #c6c6c6);
  content: '';
}
.cds--popover--border .cds--popover-caret::before,
:host(cds-popover-content[open][caret][border]) .cds--popover-caret::before {
  display: block;
}

/* High-contrast caret fill */
.cds--popover--high-contrast .cds--popover-caret::after,
:host(cds-popover-content[open][caret][highContrast]) .cds--popover-caret::after {
  background: var(--cds-background-inverse, #393939);
}

/* Caret position — bottom alignments (the default).
   Repeat this block for top / left / right with inset properties swapped. */
.cds--popover--bottom .cds--popover-caret,
:host(cds-popover-content[align^='bottom']:not([autoalign])) .cds--popover-caret {
  block-size: 0.375rem;                 /* 6px caret height */
  inline-size: 0.75rem;                 /* 12px caret width */
  inset-block-end: 0;                   /* sits on the popover top edge */
  /* clip-path triangle, point-up — exact value from popover.wc.scss line 200-225 */
  clip-path: polygon(50% 0, 100% 100%, 0 100%);
  transform: translateY(-100%);
}
.cds--popover--bottom .cds--popover-caret::after,
:host(cds-popover-content[align^='bottom']:not([autoalign])) .cds--popover-caret::after {
  block-size: 0.375rem;
  inline-size: 0.75rem;
}
.cds--popover--bottom .cds--popover-caret::before,
:host(cds-popover-content[align^='bottom'][border]:not([autoalign])) .cds--popover-caret::before {
  block-size: 0.375rem;
  inline-size: calc(0.75rem - 1px);
}

/* ----- TAB-TIP TRIGGER BUTTON (32×32 with hover/focus) ----- */
.cds--popover--tab-tip__button,
::slotted(.cds--popover--tab-tip__button) {
  /* button-reset.reset() — strips default <button> styling */
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  block-size: 2rem;        /* 32px */
  inline-size: 2rem;       /* 32px */
  border: 0;
  background: transparent;
  cursor: pointer;
  color: inherit;
}
.cds--popover--tab-tip__button:hover,
::slotted(.cds--popover--tab-tip__button:hover) {
  background-color: var(--cds-layer-hover-01, #e8e8e8);
}
.cds--popover--tab-tip__button:focus,
::slotted(.cds--popover--tab-tip__button:focus) {
  outline: 2px solid var(--cds-focus, #0f62fe);
  outline-offset: -2px;
}
.cds--popover--tab-tip__button svg {
  fill: var(--cds-icon-primary, #161616);
}

/* When [tabTip][open], the trigger picks up the popover surface colour and a 2px overlay
   bridges the trigger and surface (so they read as one shape with no caret). */
.cds--popover--tab-tip.cds--popover--open .cds--popover--tab-tip__button,
:host(cds-popover[tabTip][open]) ::slotted(.cds--popover--tab-tip__button) {
  background: var(--cds-layer-01, #f4f4f4) !important;
  box-shadow: 0 0.125rem 0.125rem rgba(0, 0, 0, 0.2); /* spacing-01 spacing-01 — 2px 2px */
}
.cds--popover--tab-tip.cds--popover--open .cds--popover--tab-tip__button:not(:focus)::after,
:host(cds-popover[tabTip][open]) ::slotted(button[class*='cds--popover--tab-tip__button']:not(:focus))::after {
  position: absolute;
  z-index: 8001;                /* z('floating') + 1 */
  background: var(--cds-layer-01, #f4f4f4);
  block-size: 2px;
  content: '';
  inline-size: 100%;
  inset-block-end: 0;
}

/* TabTip popover surface — sharp corner against the trigger (the shared edge) */
.cds--popover--tab-tip .cds--popover-content,
:host(cds-popover-content[open][tabTip]) .cds--popover-content,
:host(cds-tooltip-content[open][tabTip]) .cds--popover-content {
  border-radius: 0;            /* TabTip overrides the 2px exception — sharp where it joins the trigger */
}

/* ----- TOGGLETIP (small click-revealed help-text popover) ----- */
.cds--toggletip {
  --cds-popover-offset: 0.8125rem;   /* 13px gap between trigger icon and popover surface */
  display: inline-flex;
  align-items: center;
}

.cds--toggletip-label {
  /* label-01: 12px / 16px / weight 400 / letter-spacing 0.32px */
  font-family: 'IBM Plex Sans', sans-serif;
  font-size: 0.75rem;
  line-height: 1rem;
  font-weight: 400;
  letter-spacing: 0.32px;
  color: var(--cds-text-secondary, #525252);
  margin-inline-end: 0.5rem;        /* $spacing-03 = 8px */
}

.cds--toggletip-button {
  /* button-reset */
  display: flex;
  align-items: center;
  border: 0;
  background: transparent;
  cursor: pointer;
  padding: 0;
  color: inherit;
}
.cds--toggletip-button svg {
  fill: var(--cds-icon-secondary, #525252);
}
.cds--toggletip-button:hover svg,
.cds--toggletip--open .cds--toggletip-button svg {
  fill: var(--cds-icon-primary, #161616);
}
.cds--toggletip-button:focus {
  outline: 2px solid var(--cds-focus, #0f62fe);
  outline-offset: -2px;
}

.cds--toggletip-content {
  /* Inverse surface — Toggletip differs from Popover here: it always uses background-inverse */
  --cds-button-focus-color: var(--cds-focus-inverse, #ffffff);
  --cds-link-text-color:    var(--cds-link-inverse, #78a9ff);
  --cds-link-hover-text-color: var(--cds-link-inverse-hover, #a6c8ff);
  --cds-link-visited-text-color: var(--cds-link-inverse-visited, #be95ff);
  --cds-link-focus-text-color:  var(--cds-focus-inverse, #ffffff);

  display: grid;
  padding: 1rem;                    /* $spacing-05 = 16px */
  max-inline-size: 18rem;           /* 288px */
  row-gap: 1rem;                    /* $spacing-05 between paragraph and actions */

  /* body-01: 14px / 20px / weight 400 / letter-spacing 0.16px */
  font-family: 'IBM Plex Sans', sans-serif;
  font-size: 0.875rem;
  line-height: 1.25rem;
  font-weight: 400;
  letter-spacing: 0.16px;

  background-color: var(--cds-background-inverse, #393939);
  color: var(--cds-text-inverse, #ffffff);
  border-radius: 2px;               /* CARBON EXCEPTION */
}
.cds--toggletip-content p {
  /* body-01 */
  font-size: 0.875rem;
  line-height: 1.25rem;
  font-weight: 400;
  letter-spacing: 0.16px;
}

.cds--toggletip-actions {
  display: flex;
  align-items: center;
  justify-content: space-between;
  column-gap: 1rem;                 /* $spacing-05 = 16px */
}

/* ----- ANIMATION (productive-entrance) ----- */
.cds--popover-content,
.cds--toggletip-content {
  transition:
    background-color var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9)),
    color            var(--cds-duration-fast-02, 110ms) var(--cds-easing-productive-entrance, cubic-bezier(0, 0, 0.38, 0.9));
}

@media (prefers-reduced-motion: reduce) {
  .cds--popover-content,
  .cds--toggletip-content,
  .cds--popover--tab-tip__button {
    transition: none;
  }
}
```

## States Reference (per variant × per state, from `popover.scss` + `_popover.scss` + `_toggletip.scss`)

> Hex values are White theme unless noted. For G100, swap to the dark-theme tokens in the Design Tokens section above.

**Popover surface** (`cds-popover-content`, default `backgroundToken="layer"`):

| State | Background | Color | Border | Other |
|---|---|---|---|---|
| Closed | — | — | — | `display: none` (no DOM cost beyond the wrapper) |
| Open (rest) | `#f4f4f4` (layer-01) | `#161616` (text-primary) | none (or `1px solid #c6c6c6` when `[border]`) | `border-radius: 2px`, `filter: drop-shadow(0 2px 2px rgba(0,0,0,0.2))` if `[dropShadow]` |
| Open (`backgroundToken="background"`) | `#ffffff` (background) | `#161616` | (rest) | caret fill matches surface |
| Open (`[highContrast]`) | `#393939` (background-inverse) | `#ffffff` (text-inverse) | (rest) | caret fill matches surface |
| Open (G100, dark primary) | `#262626` (layer-01) | `#f4f4f4` | optional `1px solid #525252` | drop-shadow inherited |
| Open (G100, `[highContrast]`) | `#f4f4f4` | `#161616` | (rest) | inverts on dark theme |

**Popover caret** (12 positions; `bottom` shown — others mirror):

| Slot | Dimensions | Background | Border (when `[border]`) |
|---|---|---|---|
| Caret fill (`::after`) | `width: 12px`, `height: 6px` (rotated for left/right) | `#f4f4f4` (layer-01) — matches surface, swaps with `backgroundToken` and `highContrast` | — |
| Caret border (`::before`) | `width: 11px`, `height: 6px` | `#c6c6c6` (border-subtle-01) | shown only with `[border]` |

**TabTip trigger button** (`<button class="cds--popover--tab-tip__button">`, 32×32):

| State | Background | Icon fill | Outline | Other |
|---|---|---|---|---|
| Rest | transparent | `#161616` (icon-primary) | none | `cursor: pointer` |
| Hover | `#e8e8e8` (layer-hover-01) | `#161616` | none | — |
| Focus-visible | (rest or hover) | `#161616` | `2px solid #0f62fe`, inset `-2px` | — |
| Active (`[open]`) | `#f4f4f4` (layer-01 — matches surface) | `#161616` | none | adds 2px overlay bridging trigger and popover; `box-shadow: 0 2px 2px rgba(0,0,0,0.2)` |
| Disabled | (rest) | `#c6c6c6` (icon-disabled) | none | `cursor: not-allowed` |

**Toggletip trigger** (`<button class="cds--toggletip-button">` wrapping the Information icon):

| State | Icon fill | Outline | Other |
|---|---|---|---|
| Rest | `#525252` (icon-secondary) | none | — |
| Hover | `#161616` (icon-primary) | none | — |
| Open | `#161616` (icon-primary) | none | — |
| Focus-visible | (rest) | `2px solid #0f62fe`, inset `-2px` | — |

**Toggletip surface** (`cds--toggletip-content`):

| State | Background | Color | Padding | Max width |
|---|---|---|---|---|
| Open (light themes) | `#393939` (background-inverse) | `#ffffff` (text-inverse) | 16px | 288px |
| Open (dark themes G90/G100) | `#f4f4f4` (background-inverse on dark) | `#161616` (text-inverse on dark) | 16px | 288px |
| Closed | — | — | — | — |

**Open / close behaviour:** Carbon does **not** apply an opacity or scale transition by default — `display: none ↔ block` is instant. Wrap in your own enter animation if you need entry motion (use `productive-entrance` cubic-bezier `(0, 0, 0.38, 0.9)` at duration `fast-02` 110ms; `expressive-entrance` `(0, 0, 0.3, 1)` at duration `slow-02` 700ms for AI-flavoured popovers).

## Animation & Motion

```css
/* Carbon's source applies hover/colour transitions but NO open/close transition.
   The open/close swap is instant via display: none → block. Add your own enter
   animation if you need motion. */

.cds--popover-content,
.cds--toggletip-content {
  transition:
    background-color var(--cds-duration-fast-02) var(--cds-easing-productive-entrance),
    color            var(--cds-duration-fast-02) var(--cds-easing-productive-entrance);
}

.cds--popover--tab-tip__button,
.cds--toggletip-button {
  transition:
    background-color var(--cds-duration-fast-01) var(--cds-easing-productive-standard),
    fill             var(--cds-duration-fast-01) var(--cds-easing-productive-standard);
}

/* Optional enter animation — apply if your product layer wants explicit motion.
   (Carbon's stories don't include this; the docs classify popover as productive-entrance.) */
@keyframes cds-popover-enter {
  from { opacity: 0; transform: translateY(-2px); }
  to   { opacity: 1; transform: translateY(0); }
}
.cds--popover--open .cds--popover-content,
.cds--toggletip--open .cds--toggletip-content {
  animation: cds-popover-enter 110ms cubic-bezier(0, 0, 0.38, 0.9);
}

@media (prefers-reduced-motion: reduce) {
  .cds--popover-content,
  .cds--toggletip-content,
  .cds--popover--tab-tip__button,
  .cds--toggletip-button,
  .cds--popover--open .cds--popover-content,
  .cds--toggletip--open .cds--toggletip-content {
    transition: none;
    animation: none;
  }
}
```

Token values (resolved from `overview.md`):

| Token | Value | When |
|---|---|---|
| `--cds-duration-fast-01` | `70ms` | trigger-button hover/focus colour swaps |
| `--cds-duration-fast-02` | `110ms` | popover surface colour transitions, optional enter animation |
| `--cds-duration-slow-02` | `700ms` | use for expressive AI popover reveals (Carbon docs guidance) |
| `--cds-easing-productive-standard` | `cubic-bezier(0.2, 0, 0.38, 0.9)` | hover/focus colour interpolation |
| `--cds-easing-productive-entrance` | `cubic-bezier(0, 0, 0.38, 0.9)` | optional open animation (productive surfaces) |
| `--cds-easing-expressive-entrance` | `cubic-bezier(0, 0, 0.3, 1)` | optional open animation (AI / marketing surfaces) |

## Accessibility (from Carbon's docs + source)

- **Semantic structure (Popover):** Trigger is a `<button type="button" aria-haspopup="dialog" aria-expanded="{open}" aria-controls="{popover-content-id}">`. The Storybook source places the trigger as the first child of `<Popover>` / `<cds-popover>` and the surface as `<PopoverContent>` / `<cds-popover-content>` — Carbon does not auto-add `role="dialog"`, so add it on the surface element manually with `aria-labelledby` (or `aria-label`) pointing at the popover title.
- **Semantic structure (Toggletip):** Trigger is `<ToggletipButton label="…">` which renders `<button aria-label="…" aria-haspopup="dialog" aria-expanded="{open}">`. The surface is `<ToggletipContent>` rendering `role="dialog"` automatically. Pair with `<ToggletipLabel>` (a `<span>` with `label-01` typography) **outside** the toggletip — never put the field label inside `<ToggletipContent>`.
- **Click trigger (NOT hover):** Popover and Toggletip are click-triggered surfaces — the user must click to open and click outside / press Escape to close. **Never** open them on hover; that's the Tooltip pattern. Hover reveal makes content unreachable for keyboard and touch users.
- **Keyboard:**
  - `Tab` / `Shift+Tab` — move focus to the trigger; the surface is **not** in the tab order until opened.
  - `Enter` / `Space` — toggles `open`.
  - `Escape` — closes the popover and returns focus to the trigger. The TabTip story binds this explicitly: `if (match(evt, keys.Escape)) setOpen(false);` — emit the same handler in your own composition.
  - `Tab` while open — moves focus through interactive content (radio group, checkboxes, links, buttons) inside the surface. Carbon does **not** trap focus by default (popover is non-modal).
  - Click outside — fires `onRequestClose` (React) / removes `[open]` (WC) so closes happen via the consuming app.
- **Focus management:** Trigger uses `:focus-visible` with the standard 2px focus ring (`#0f62fe` light / `#ffffff` dark, inset `-2px`). When the popover closes, **always return focus to the trigger** — this is what `onRequestClose` is wired up for. Toggletip handles this automatically via `<Toggletip>`.
- **`aria-expanded` is mandatory** — both stories set it on the trigger. Without it, screen readers cannot announce open/closed state.
- **Touch target:** TabTip trigger is `32×32px` — below the 44px touch minimum. For touch surfaces wrap the button in `min-block-size: 44px; min-inline-size: 44px` (or use the outer table/header row as the hit target). Toggletip button has no fixed size — its Information icon defaults to `16px` so the same 44px wrapper rule applies.
- **Color contrast (WCAG AA):**
  - Popover light surface `#161616` text on `#f4f4f4` — **17.4:1** (AAA).
  - Popover dark surface `#f4f4f4` text on `#262626` (G100) — **15.0:1** (AAA).
  - High-contrast `#ffffff` on `#393939` — **10.4:1** (AAA).
  - Toggletip surface `#ffffff` text on `#393939` (always inverted in light theme) — **10.4:1** (AAA).
- **`role="dialog"` vs `role="tooltip"`:** Carbon's Toggletip uses `role="dialog"` (not `role="tooltip"`) because the surface is **interactive** — it can contain links, buttons, and other actions (`<ToggletipActions>`). Use `role="tooltip"` only for hover-revealed read-only text — that's the Tooltip component, not Popover or Toggletip.
- **`aria-modal`:** Set `aria-modal="false"` on the surface — Popover does not trap focus or block underlying UI. (Modal does, and uses `aria-modal="true"`.)
- **Multiple popovers on a page:** Carbon supports multiple open popovers (the TabTip story shows two side-by-side). Give each surface a unique `id` and have each trigger reference its own `aria-controls`. Close-on-outside-click should still close ALL open popovers (escape closes only the focused one).

## Responsive behaviour

- **Default popover (`max-inline-size: 368px`):** wide enough for a small form panel (radio group + checkboxes, as in the TabTip story). On viewports `< 368px` (the WC `sm` breakpoint is 320px), the popover overflows — combine `autoAlign` with a `max-inline-size: calc(100vw - 32px)` override on `.cds--popover-content` to keep it inside the viewport with 16px gutters.
- **Toggletip (`max-inline-size: 288px`):** narrower — designed for a single paragraph of help text. Don't widen it; if your help text needs more room, switch to a Popover or a Modal.
- **autoAlign (`Floating UI`):** when set, Carbon auto-flips the surface across all 12 alignments to keep it inside the viewport (or `autoAlignBoundary` element). This is the right default for table-row TabTips, dashboard tiles, and any surface inside scrolling overflow regions. Carbon ships autoAlign as **experimental** — flag it for your team but keep using it (the API is stable, only the implementation may change).
- **Stacking:** popovers render at `z-index: 8000` (`z('floating')`). Modals render higher (`z('modal')` ≈ `9000`) — a popover opened inside a Modal works because the Modal's stacking context contains the popover. Don't stack two popovers from different ancestors at the same z-level — the visual order becomes DOM-order dependent.
- **Scroll containers:** if the trigger is inside an `overflow: hidden` ancestor, **always use `autoAlign`**. Without it, `position: relative` on `.cds--popover-container` causes the surface to be clipped. Carbon comments this in `_popover.scss` line 138-143.
- **RTL:** the TabTip story flips alignment based on `document?.dir === 'rtl'` (`bottom-right` → `bottom-left`, etc.). Mirror this when authoring RTL-capable UI; the WC element handles caret rotation but not align-flipping.
- **Mobile considerations:** TabTip is a desktop-first pattern (table-column settings) — on `sm` viewports, replace it with a full-width Modal or a SidePanel. The 32px trigger button + 368px popover surface is too cramped for thumb taps on mobile.

## Do / Don't

| Do | Don't |
|---|---|
| **Use `border-radius: 2px`** for Popover and Toggletip — they are 2 of the 4 Carbon shape exceptions (with Tag and Tooltip). | Don't change to `border-radius: 0` "for consistency". The 2px is intentional — it softens the floating surface against the sharp UI behind it. |
| **Use the verbatim `<cds-popover>` / `<Popover>` element** from the Storybook source. | Don't substitute a generic `<div class="dropdown">` — you lose tokens, caret rendering, autoAlign, and accessibility. |
| **Trigger on click**, not hover. Bind `onClick` to toggle `open` and `onRequestClose` to handle outside-click + Escape. | Don't trigger on hover — that's Tooltip. Hover-reveal makes interactive content (links, buttons) unreachable for keyboard and touch users. |
| **Set `aria-haspopup="dialog"`, `aria-expanded`, and `aria-controls`** on the trigger. Set `role="dialog"` and `aria-labelledby` on the surface. | Don't omit ARIA — screen readers cannot announce open/closed state without `aria-expanded`, and the surface has no semantics without `role="dialog"`. |
| **Return focus to the trigger** when the popover closes. Carbon's `onRequestClose` is the hook for this; Toggletip does it automatically. | Don't drop focus to `<body>` — keyboard users get stranded. |
| **Use TabTip for table-column popovers** (settings, sort, filter) where the popover and trigger should read as one shape. The TabTip's sharp inner edge + 2px lid line are diagnostic. | Don't add a caret to a TabTip — they are mutually exclusive (TabTip is the no-caret variant). |
| **Use Toggletip for help-text** (single paragraph + optional link / button). Pair with `<ToggletipLabel>` for the field label. | Don't put a Toggletip label **inside** the surface. The label is the field's persistent label; the surface is the help content. |
| **Use `autoAlign`** whenever the trigger lives inside a scrolling region or could be near a viewport edge. | Don't rely on a fixed `align="bottom"` if the trigger is in a scrolling table — the popover will clip. |
| **Use `dropShadow` on light themes** for the standard floating-surface look; **drop the shadow on dark themes** if your design system already uses elevation through `--cds-layer-*` tiers. Carbon's source applies the shadow regardless — override if you want the flatter look. | Don't replace `filter: drop-shadow(…)` with `box-shadow` — the caret needs the filter to inherit the shadow. `box-shadow` would clip at the surface edge and leave the caret unshadowed. |
| **Use `backgroundToken="layer"`** (the default) when the popover sits on a `--cds-background` page surface; switch to `backgroundToken="background"` when nested inside a `--cds-layer-01` container so the popover keeps its colour-tier separation. | Don't hard-code `background-color` on `.cds--popover-content` — that bypasses the token swap and breaks layer-tier nesting. |
| **Use `highContrast`** for callouts, onboarding tours, and one-off attention-getters where the inverted surface earns its weight. | Don't use `highContrast` for routine popovers — it loses meaning if every popover is inverted. |
| **Use 16px content padding** (`p-3` utility / `$spacing-05`) inside `<PopoverContent>`. The Storybook stories all use it. | Don't ship a popover with 8px or 24px padding — the rhythm with adjacent IBM Plex body-01 type breaks. |
| **Use `Escape` to close** and bind it explicitly with `keys.Escape` (the TabTip story does this). | Don't ship a popover that only closes on outside-click — keyboard users have no way out. |
| **Honour `prefers-reduced-motion`** — skip the optional enter animation block when set. | Don't fade-in the surface unconditionally; users with vestibular sensitivity get sick. |
| **Output the Storybook code AS-IS** when generating Carbon UI. | Don't paraphrase or rewrite — Carbon's source is the truth. The `Default`, `TabTip`, `Toggletip`, and `ExperimentalAutoAlign` exports above are the canonical examples. |
