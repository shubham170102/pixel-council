---
name: notification
description: Carbon Notification — status messaging across four delivery surfaces. Variants Toast (transient, bottom-right), Inline (full-width, in-flow), ActionableToast / ActionableInline (with CTA + escape-to-close), and Callout (static, page-level). Five status kinds (error, success, warning, info, info-square) at low-contrast (default) or high-contrast (filled inverse).
metadata:
  tags: notification, toast, inline, actionable, callout, alert, status, banner, snackbar, ibm, carbon, react, web-components
---

# Notification -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (Toast):** [`ToastNotification.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Notification/stories/ToastNotification.stories.js)
> - **React story (Inline):** [`InlineNotification.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Notification/stories/InlineNotification.stories.js)
> - **React story (Actionable):** [`ActionableNotification.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Notification/stories/ActionableNotification.stories.js)
> - **React story (Callout):** [`Callout.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Notification/stories/Callout.stories.js)
> - **React story (Static, deprecated):** [`StaticNotification.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Notification/stories/StaticNotification.stories.js)
> - **WC story (Inline):** [`inline-notification.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/notification/inline-notification.stories.ts)
> - **WC story (Toast):** [`toast-notification.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/notification/toast-notification.stories.ts)
> - **WC story (Actionable):** [`actionable-notification.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/notification/actionable-notification.stories.ts)
> - **WC story (Callout):** [`callout-notification.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/notification/callout-notification.stories.ts)
> - **WC SCSS (Inline):** [`_inline-notification.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/notification/_inline-notification.scss)
> - **WC SCSS (Toast):** [`_toast-notification.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/notification/_toast-notification.scss)
> - **WC SCSS (Actionable):** [`_actionable-notification.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/notification/_actionable-notification.scss)
> - **WC SCSS (mixins):** [`_mixins.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/notification/_mixins.scss)
> - **WC SCSS (tokens):** [`_tokens.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/notification/_tokens.scss)
> - **Storybook live (React, Toast):** https://react.carbondesignsystem.com/?path=/story/components-notifications-toast--default
> - **Storybook live (React, Inline):** https://react.carbondesignsystem.com/?path=/story/components-notifications-inline--default
> - **Storybook live (React, Actionable):** https://react.carbondesignsystem.com/?path=/story/components-notifications-actionable--default
> - **Storybook live (React, Callout):** https://react.carbondesignsystem.com/?path=/story/components-notifications-callout--default
> - **Storybook live (WC, Inline):** https://web-components.carbondesignsystem.com/?path=/story/components-notifications-inline--default
> - **Storybook live (WC, Toast):** https://web-components.carbondesignsystem.com/?path=/story/components-notifications-toast--default
> - **Storybook live (WC, Actionable):** https://web-components.carbondesignsystem.com/?path=/story/components-notifications-actionable--default
> - **Storybook live (WC, Callout):** https://web-components.carbondesignsystem.com/?path=/story/components-notifications-callout--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/notification/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

## Quick Reference

| Property | Value |
|---|---|
| **Surfaces (4)** | Toast, Inline, Actionable (toast or inline shape, with CTA), Callout (static page-level) |
| **Status kinds (5)** | `error`, `success`, `warning` (and `warning-alt`), `info` (and `info-square`) |
| **Contrast modes** | Low-contrast (`low-contrast` attr/prop, **default per UX guidance**) — pale tinted background. High-contrast (no `low-contrast`) — filled `--cds-background-inverse`. |
| Min block size (all surfaces) | `48px` (`min-block-size: 3rem`) |
| Min inline size (Inline, Actionable) | `288px` (`min-inline-size: 18rem`); fits any column down to `sm` (320px) |
| Max inline size (Inline) | `288px` < `sm`, `608px` ≥ `md` (672px), `736px` ≥ `lg` (1056px), `832px` ≥ `max` (1584px) |
| Toast width | `288px` (default), `352px` ≥ `max` breakpoint (1584px) |
| Padding inline-start (icon column) | `13px` (icon-to-text gutter via `padding-inline-start: 0.8125rem`) |
| Padding block (text wrapper) | `15px 0` (`.cds--inline-notification__text-wrapper { padding: 0.9375rem 0; }`) |
| Border-inline-start (low-contrast) | `3px solid` status color (e.g., `--cds-support-error` = `#da1e28`) |
| Border-inline-start (high-contrast) | `3px solid` *inverse* status color (e.g., `--cds-support-error-inverse` = `#fa4d56`) |
| Background (low-contrast) | `--cds-notification-background-{kind}` — pale tint of status color |
| Background (high-contrast) | `--cds-background-inverse` = `#393939` (light) / `#f4f4f4` (dark) |
| Status icon (left) | `20px × 20px`, fill = status color, `margin-block-start: 14px` (inline) / `16px` (toast) |
| Close button hit-area | `48px × 48px` square, no border, transparent bg, focus = `2px solid --cds-focus-inverse` outline-offset `-2px` |
| **Corner radius** | `0` — Notification is sharp-cornered like every other Carbon surface |
| Box-shadow (Toast only) | `0 2px 6px 0 rgba(0, 0, 0, 0.2)` — the single deviation from Carbon's flat language; Inline + Callout have no shadow |
| Type — title | `heading-compact-01` — IBM Plex Sans `14px` / line-height `18px`, weight `600`, letter-spacing `0.16px` |
| Type — subtitle, caption | `body-compact-01` — IBM Plex Sans `14px` / line-height `18px`, weight `400`, letter-spacing `0.16px` |
| Title→subtitle gap | `margin-inline-end: $spacing-02` (4px) — title and subtitle wrap inline on wide rows |
| Action button (Actionable) | Ghost button, `block-size: 32px`, `margin-block-end: 8px` (`$spacing-03`) — inverse color text on high-contrast, link-inverse on low-contrast |
| Auto-dismiss (Toast) | Driven by `timeout` prop — value in **ms** (NOT seconds). `0` = no auto-dismiss (default in Storybook). Carbon does not hard-code 6s; choose `4000`-`8000` for transient toasts. |
| Toast positioning | **Carbon does not ship a positioner** — the consumer fixes Toast at `bottom: $spacing-05; right: $spacing-05`. Stack vertically with `gap: $spacing-03`. |
| Focus ring (high-contrast) | `2px solid --cds-focus-inverse` (`#ffffff` light / `#0f62fe` dark), `outline-offset: -2px` |
| Focus ring (low-contrast) | `2px solid --cds-focus` (`#0f62fe` light / `#ffffff` dark), `outline-offset: -2px` (via `focus-outline('outline')` mixin) |
| Motion (close button + slide-in) | `$duration-fast-02` (`110ms`) `motion(standard, productive)` for the close button transition; toast slide-in uses `moderate-02` (`240ms`) `productive-entrance` per Carbon's motion guidance |
| Imports — React | `import { ToastNotification, InlineNotification, ActionableNotification, Callout } from '@carbon/react';` |
| Imports — WC | `import '@carbon/web-components/es/components/notification/index.js';` (registers `cds-toast-notification`, `cds-inline-notification`, `cds-actionable-notification`, `cds-actionable-notification-button`, `cds-callout-notification`) |

## Variants (from Storybook story exports)

The Notification family is split across **five Storybook story files** in React (one per surface) and **four** in WC (Callout joined v11 in 2025; the `Static` React variant is deprecated and becomes Callout via codemod). Each surface exposes a `Default` and a `Playground` variant; the Actionable and Callout files add small extras (`Inline`, `WithInteractiveElements`).

| Variant | React export | WC export | Element / component | Purpose |
|---|---|---|---|---|
| Toast | `ToastNotification.stories.js` → `Default` | `toast-notification.stories.ts` → `Default`, `Playground` | `<ToastNotification>` / `<cds-toast-notification>` | Transient floating message — appears at viewport corner, optionally auto-dismisses via `timeout`. Use for confirmations of background tasks. Includes a `caption` slot for timestamp/metadata. |
| Inline | `InlineNotification.stories.js` → `Default` | `inline-notification.stories.ts` → `Default`, `Playground` | `<InlineNotification>` / `<cds-inline-notification>` | In-flow status message rendered next to the content it relates to (e.g., above a form, beside a row in a table). Full-width-of-container, no auto-dismiss, no caption slot. |
| Actionable (default = toast shape) | `ActionableNotification.stories.js` → `Default` | `actionable-notification.stories.ts` → `Default`, `Playground` | `<ActionableNotification>` / `<cds-actionable-notification>` + `<cds-actionable-notification-button slot="action">` | Notification that **demands a decision** — an Action ghost button + close. Default `role="alertdialog"`; `closeOnEscape` is true by default. Use for "Connection lost. Retry?" and similar must-acknowledge prompts. |
| Actionable (inline shape) | `ActionableNotification.stories.js` → `Inline` (`{ inline: true }`) | `actionable-notification.stories.ts` → `Playground` w/ `inline=true` | `<ActionableNotification inline>` / `<cds-actionable-notification inline>` | Same as Actionable but rendered with the in-flow Inline geometry rather than the floating Toast geometry. |
| Callout (static page-level) | `Callout.stories.js` → `Default` | `callout-notification.stories.ts` → `Default` | `<Callout>` / `<cds-callout-notification>` | **Cannot be dismissed.** Page-level static info ("Maintenance scheduled" banners, FAQ help blocks). Replaces the deprecated `<StaticNotification>` (still in `Deprecated/preview__StaticNotification`; codemod: `npx @carbon/upgrade migrate refactor-to-callout --write`). Only `info` and `warning` kinds are supported. |
| Callout with interactive elements | `Callout.stories.js` → `WithInteractiveElements` | `callout-notification.stories.ts` → `WithInteractiveElements` | `<Callout>{children}</Callout>` | Callout whose subtitle slot contains a `<Link>` (or arbitrary anchor). Title gets a `titleId` so the inner link can `aria-describedby` it. |
| Static (deprecated) | `StaticNotification.stories.js` → `Default` | — | `<StaticNotification>` | Renamed to Callout. Storybook keeps the title/codemod hint visible under `Deprecated/preview__StaticNotification`. **Do not use for new work.** |

> Carbon ships no separate `Skeleton` story for Notification — the surface is small enough that loading is communicated by the *absence* of a notification, not by a placeholder.

## React (verbatim from Storybook)

> The five code blocks below are copied verbatim from each `*.stories.js` file under `packages/react/src/components/Notification/stories/` on the Carbon `main` branch. Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports — `ToastNotification.stories.js` (top of file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { ToastNotification } from '../../Notification';
import { action } from 'storybook/actions';
import mdx from '../Notification.mdx';
```

**Variant: Toast (Default)** — full file body, including `default` meta export:

```jsx
// eslint-disable-next-line storybook/csf-component
export default {
  title: 'Components/Notifications/Toast',
  component: ToastNotification,
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['actionButtonLabel', 'aria-label'],
    },
  },
  args: {
    kind: 'error',
    lowContrast: false,
    hideCloseButton: false,
    ['aria-label']: 'closes notification',
    statusIconDescription: 'notification',
    onClose: action('onClose'),
    onCloseButtonClick: action('onCloseButtonClick'),
  },
};

export const Default = (args) => <ToastNotification {...args} />;

Default.argTypes = {
  onClose: {
    action: 'onClose',
  },
  onCloseButtonClick: {
    action: 'onCloseButtonClick',
  },
};
Default.args = {
  role: 'status',
  caption: '00:00:00 AM',
  timeout: 0,
  title: 'Notification title',
  subtitle: 'Subtitle text goes here',
};
```

**Imports — `InlineNotification.stories.js` (top of file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { InlineNotification } from '../../Notification';
import { action } from 'storybook/actions';
import mdx from '../Notification.mdx';
```

**Variant: Inline (Default)** — full file body:

```jsx
// eslint-disable-next-line storybook/csf-component
export default {
  title: 'Components/Notifications/Inline',
  component: InlineNotification,
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['actionButtonLabel', 'aria-label'],
    },
  },
  args: {
    kind: 'error',
    lowContrast: false,
    hideCloseButton: false,
    ['aria-label']: 'closes notification',
    statusIconDescription: 'notification',
    onClose: action('onClose'),
    onCloseButtonClick: action('onCloseButtonClick'),
  },
};

export const Default = (args) => <InlineNotification {...args} />;

Default.argTypes = {
  onClose: {
    action: 'onClose',
  },
  onCloseButtonClick: {
    action: 'onCloseButtonClick',
  },
};
Default.args = {
  title: 'Notification title',
  subtitle: 'Subtitle text goes here',
};
```

**Imports — `ActionableNotification.stories.js` (top of file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2026
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { ActionableNotification } from '../../Notification';
import { action } from 'storybook/actions';
import mdx from '../Notification.mdx';
```

**Variants: ActionableToast (`Default`) + ActionableInline (`Inline`)** — full file body, including the `default` meta export and the spread-from-Default `Inline` variant:

```jsx
// eslint-disable-next-line storybook/csf-component
export default {
  title: 'Components/Notifications/Actionable',
  component: ActionableNotification,
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: ['aria-label', 'hasFocus'],
    },
  },
  args: {
    actionButtonLabel: 'Action',
    inline: false,
    closeOnEscape: true,
    title: 'Notification title',
    subtitle: 'Subtitle text goes here',
    kind: 'error',
    lowContrast: false,
    hideCloseButton: false,
    ['aria-label']: 'close notification',
    statusIconDescription: 'notification',
    onClose: action('onClose'),
    onCloseButtonClick: action('onCloseButtonClick'),
    onActionButtonClick: action('onActionButtonClick'),
  },
  argTypes: {
    onActionButtonClick: {
      action: 'onActionButtonClick',
    },
    onClose: {
      action: 'onClose',
    },
    onCloseButtonClick: {
      action: 'onCloseButtonClick',
    },
  },
};

export const Default = (args) => (
  <ActionableNotification {...args}></ActionableNotification>
);

export const Inline = {
  ...Default,
  args: {
    inline: true,
  },
  tags: ['!dev', '!autodocs'],
};
```

**Imports — `Callout.stories.js` (top of file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import { Callout } from '../../Notification';
import { Link } from '../../Link';
import mdx from '../Notification.mdx';
```

**Variant: Callout (`Default` + `WithInteractiveElements`)** — full file body:

```jsx
export default {
  title: 'Components/Notifications/Callout',
  component: Callout,
  parameters: {
    docs: {
      page: mdx,
    },
  },
  args: {
    kind: 'info',
    lowContrast: false,
    statusIconDescription: 'notification',
  },
};

export const Default = (args) => (
  <Callout
    title="Notification title"
    subtitle="Subtitle text goes here"
    {...args}
  />
);

export const WithInteractiveElements = () => (
  <Callout
    title="Notification title"
    titleId="my fancy id 123"
    kind="info"
    lowContrast>
    <div className="cds--inline-notification__subtitle">
      Additional text can describe the notification, or a link to{' '}
      <Link inline href="#" aria-describedby="my fancy id 123">
        learn more
      </Link>
    </div>
  </Callout>
);

Default.argTypes = {
  kind: {
    options: ['info', 'warning'],
    control: { type: 'select' },
  },
};
```

**Variant: Static (deprecated)** — `StaticNotification.stories.js` exists only to surface the codemod hint `npx @carbon/upgrade migrate refactor-to-callout --write`. Use `Callout` for all new work; the Static element accepts the same `title` / `subtitle` / `kind` props but is locked under `Deprecated/preview__StaticNotification` in Storybook and will be removed in a future major release.

## Web Components (verbatim from Storybook)

> The four code blocks below are copied verbatim from each `*.stories.ts` file under `packages/web-components/src/components/notification/` on the Carbon `main` branch. Use these for non-React projects (lit-html templates).

**Imports — `inline-notification.stories.ts` (top of file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import storyDocs from './notification.mdx';
import { NOTIFICATION_KIND } from './inline-notification';
import { prefix } from '../../globals/settings';
import kinds from './stories/helper';

const noop = () => {};

const args = {
  hideCloseButton: false,
  kind: NOTIFICATION_KIND.INFO,
  lowContrast: false,
  role: 'status',
  statusIconDescription: 'notification',
  subtitle: 'Subtitle text goes here',
  title: 'Notification title',
};

const argTypes = {
  hideCloseButton: {
    control: 'boolean',
    description: 'Specify the close button should be disabled, or not.',
  },
  kind: {
    control: 'select',
    description: 'Specify what state the notification represents.',
    options: kinds,
  },
  lowContrast: {
    control: 'boolean',
    description:
      'Specify whether you are using the low contrast variant of the InlineNotification.',
  },
  role: {
    control: 'select',
    description:
      'By default, this value is "status". You can also provide an alternate role if it makes sense from the accessibility-side.',
    options: { alert: 'alert', log: 'log', status: 'status' },
  },
  statusIconDescription: {
    control: 'text',
    description:
      'Provide a description for "status" icon that can be read by screen readers.',
  },
  subtitle: {
    control: 'text',
    description: 'Specify the subtitle.',
  },
  title: {
    control: 'text',
    description: 'Specify the title.',
  },
  onBeforeClose: {
    action: `${prefix}-notification-beingclosed`,
  },
  onClose: {
    action: `${prefix}-notification-closed`,
  },
};
```

**Variant: Inline (`Default`)** — verbatim lit-html template:

```html
export const Default = {
  render: () => {
    return html`
      <cds-inline-notification
        kind="${NOTIFICATION_KIND.ERROR}"
        title="Notification title"
        subtitle="Subtitle text goes here">
      </cds-inline-notification>
    `;
  },
};
```

**Variant: Inline (`Playground`)** — verbatim:

```html
export const Playground = {
  args,
  argTypes,
  render: (args) => {
    const {
      kind,
      title,
      subtitle,
      hideCloseButton,
      lowContrast,
      role,
      statusIconDescription,
      timeout,
      disableClose,
      onBeforeClose = noop,
      onClose = noop,
    } = args ?? {};
    const handleBeforeClose = (event: CustomEvent) => {
      onBeforeClose(event);
      if (disableClose) {
        event.preventDefault();
      }
    };
    return html`
      <cds-inline-notification
        kind="${ifDefined(kind)}"
        title="${ifDefined(title)}"
        subtitle="${ifDefined(subtitle)}"
        ?hide-close-button="${hideCloseButton}"
        ?low-contrast="${lowContrast}"
        role="${ifDefined(role)}"
        status-icon-description="${ifDefined(statusIconDescription)}"
        timeout="${ifDefined(timeout)}"
        @cds-notification-beingclosed="${handleBeforeClose}"
        @cds-notification-closed="${onClose}">
      </cds-inline-notification>
    `;
  },
};

const meta = {
  title: 'Components/Notifications/Inline',
  parameters: {
    docs: {
      page: storyDocs,
    },
  },
};

export default meta;
```

**Imports — `toast-notification.stories.ts` (top of file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { NOTIFICATION_KIND } from './inline-notification';
import './toast-notification';
import storyDocs from './notification.mdx';
import { prefix } from '../../globals/settings';
import kinds from './stories/helper';

const noop = () => {};

const args = {
  caption: '00:00:00 AM',
  hideCloseButton: false,
  kind: NOTIFICATION_KIND.INFO,
  lowContrast: false,
  role: 'status',
  statusIconDescription: 'notification',
  subtitle: 'Subtitle text goes here',
  timeout: '0',
  title: 'Notification title',
};

const argTypes = {
  caption: {
    control: 'text',
    description: 'Specify the caption.',
  },
  hideCloseButton: {
    control: 'boolean',
    description: 'Specify the close button should be disabled, or not.',
  },
  kind: {
    control: 'select',
    description: 'Specify what state the notification represents.',
    options: kinds,
  },
  lowContrast: {
    control: 'boolean',
    description:
      'Specify whether you are using the low contrast variant of the Toast Notification.',
  },
  role: {
    control: 'select',
    description:
      'By default, this value is "status". You can also provide an alternate role if it makes sense from the accessibility-side.',
    options: { alert: 'alert', log: 'log', status: 'status' },
  },
  statusIconDescription: {
    control: 'text',
    description:
      'Provide a description for "status" icon that can be read by screen readers.',
  },
  subtitle: {
    control: 'text',
    description: 'Specify the subtitle.',
  },
  timeout: {
    control: 'text',
    description:
      'Specify an optional duration the notification should be closed in.',
  },
  title: {
    control: 'text',
    description: 'Specify the title.',
  },
  onBeforeClose: {
    action: `${prefix}-notification-beingclosed`,
  },
  onClose: {
    action: `${prefix}-notification-closed`,
  },
};
```

**Variant: Toast (`Default`)** — verbatim lit-html template:

```html
export const Default = {
  render: () => {
    return html`
      <cds-toast-notification
        kind="${NOTIFICATION_KIND.ERROR}"
        title="Notification title"
        subtitle="Subtitle text goes here"
        caption="00:00:00 AM"
        role="status"
        timeout="0">
      </cds-toast-notification>
    `;
  },
};
```

**Variant: Toast (`Playground`)** — verbatim:

```html
export const Playground = {
  args,
  argTypes,
  render: (args) => {
    const {
      kind,
      title,
      subtitle,
      caption,
      hideCloseButton,
      statusIconDescription,
      lowContrast,
      timeout,
      role,
      disableClose,
      onBeforeClose = noop,
      onClose = noop,
    } = args ?? {};
    const handleBeforeClose = (event: CustomEvent) => {
      onBeforeClose(event);
      if (disableClose) {
        event.preventDefault();
      }
    };
    return html`
      <cds-toast-notification
        kind="${ifDefined(kind)}"
        title="${ifDefined(title)}"
        subtitle="${ifDefined(subtitle)}"
        caption="${ifDefined(caption)}"
        role="${ifDefined(role)}"
        ?hide-close-button="${hideCloseButton}"
        ?low-contrast="${lowContrast}"
        status-icon-description="${ifDefined(statusIconDescription)}"
        timeout="${ifDefined(timeout)}"
        @cds-notification-beingclosed="${handleBeforeClose}"
        @cds-notification-closed="${onClose}">
      </cds-toast-notification>
    `;
  },
};

const meta = {
  title: 'Components/Notifications/Toast',
  parameters: {
    docs: {
      page: storyDocs,
    },
  },
};

export default meta;
```

**Imports — `actionable-notification.stories.ts` (top of file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { NOTIFICATION_KIND } from './inline-notification';
import './actionable-notification';
import './actionable-notification-button';
import storyDocs from './notification.mdx';
import { prefix } from '../../globals/settings';
import kinds from './stories/helper';
import '../button/button';

const noop = () => {};

const args = {
  actionButtonLabel: 'Action',
  closeOnEscape: true,
  hasFocus: false,
  hideCloseButton: false,
  inline: false,
  kind: NOTIFICATION_KIND.ERROR,
  lowContrast: false,
  role: 'alertdialog',
  subtitle: 'Subtitle text goes here',
  statusIconDescription: 'notification',
  title: 'Notification title',
};

const argTypes = {
  actionButtonLabel: {
    control: 'text',
    description:
      'Pass in the action button label that will be rendered within the ActionableNotification.',
  },
  caption: {
    control: 'text',
    description: 'Specify the caption.',
  },
  closeOnEscape: {
    control: 'boolean',
    description:
      'Specify if pressing the escape key should close notifications.',
  },
  hasFocus: {
    control: 'boolean',
    description:
      'Specify if focus should be moved to the component when the notification contains actions.',
  },
  hideCloseButton: {
    control: 'boolean',
    description: 'Specify the close button should be disabled, or not.',
  },
  inline: {
    control: 'boolean',
  },
  kind: {
    control: 'select',
    description: 'Specify what state the notification represents.',
    options: kinds,
  },
  lowContrast: {
    control: 'boolean',
    description:
      'Specify whether you are using the low contrast variant of the ActionableNotification.',
  },
  role: {
    control: 'text',
    description:
      'By default, this value is "alertdialog". You can also provide an alternate role if it makes sense from from an accessibility perspective.',
  },
  subtitle: {
    control: 'text',
    description: 'Specify the subtitle.',
  },
  statusIconDescription: {
    control: 'text',
    description:
      'Provide a description for "status" icon that can be read by screen readers.',
  },
  title: {
    control: 'text',
    description: 'Specify the title.',
  },
  onBeforeClose: {
    action: `${prefix}-notification-beingclosed`,
  },
  onClose: {
    action: `${prefix}-notification-closed`,
  },
};
```

**Variant: Actionable (`Default`)** — verbatim lit-html template:

```html
export const Default = {
  render: () => {
    return html`
      <cds-actionable-notification
        kind="${NOTIFICATION_KIND.ERROR}"
        title="Notification title"
        subtitle="Subtitle text goes here">
        <cds-actionable-notification-button slot="action"
          >Action</cds-actionable-notification-button
        >
      </cds-actionable-notification>
    `;
  },
};
```

**Variant: Actionable (`Playground`)** — verbatim (note the `?inline="${inline}"` boolean attribute that flips Toast geometry to Inline geometry):

```html
export const Playground = {
  args,
  argTypes,
  render: (args) => {
    const {
      actionButtonLabel,
      caption,
      closeOnEscape,
      hasFocus,
      kind,
      title,
      subtitle,
      hideCloseButton,
      lowContrast,
      role,
      inline,
      statusIconDescription,
      disableClose,
      onBeforeClose = noop,
      onClose = noop,
    } = args ?? {};
    const handleBeforeClose = (event: CustomEvent) => {
      onBeforeClose(event);
      if (disableClose) {
        event.preventDefault();
      }
    };
    return html`
      <cds-actionable-notification
        ?close-on-escape="${closeOnEscape}"
        ?has-focus="${hasFocus}"
        caption="${ifDefined(caption)}"
        kind="${ifDefined(kind)}"
        title="${ifDefined(title)}"
        subtitle="${ifDefined(subtitle)}"
        role="${ifDefined(role)}"
        ?inline="${inline}"
        ?hide-close-button="${hideCloseButton}"
        ?low-contrast="${lowContrast}"
        status-icon-description="${ifDefined(statusIconDescription)}"
        @cds-notification-beingclosed="${handleBeforeClose}"
        @cds-notification-closed="${onClose}">
        <cds-actionable-notification-button slot="action"
          >${actionButtonLabel}</cds-actionable-notification-button
        >
      </cds-actionable-notification>
    `;
  },
};

const meta = {
  title: 'Components/Notifications/Actionable',
  parameters: {
    docs: {
      page: storyDocs,
    },
  },
};

export default meta;
```

**Imports — `callout-notification.stories.ts` (top of file):**

```ts
/**
 * Copyright IBM Corp. 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { ifDefined } from 'lit/directives/if-defined.js';
import { NOTIFICATION_KIND } from './inline-notification';
import './callout-notification';
import './actionable-notification-button';
import storyDocs from './notification.mdx';
import { prefix } from '../../globals/settings';

const args = {
  actionButtonLabel: '',
  kind: NOTIFICATION_KIND.INFO,
  lowContrast: false,
  statusIconDescription: 'notification',
  subtitle: 'Subtitle text goes here',
  title: 'Notification title',
  titleId: '',
};

const argTypes = {
  actionButtonLabel: {
    control: 'text',
    description:
      'Pass in the action button label that will be rendered within the Callout.',
  },
  kind: {
    control: 'select',
    description: 'Specify what state the notification represents.',
    options: {
      [`Info (${NOTIFICATION_KIND.INFO})`]: NOTIFICATION_KIND.INFO,
      [`Warning (${NOTIFICATION_KIND.WARNING})`]: NOTIFICATION_KIND.WARNING,
    },
  },
  lowContrast: {
    control: 'boolean',
    description:
      'Specify whether you are using the low contrast variant of the Callout.',
  },
  statusIconDescription: {
    control: 'text',
    description:
      'Provide a description for "status" icon that can be read by screen readers.',
  },
  subtitle: {
    control: 'text',
    description: 'Specify the subtitle.',
  },
  title: {
    control: 'text',
    description: 'Specify the title.',
  },
  titleId: {
    control: 'text',
    description: 'Specify the id for the title element.',
  },
  onActionButtonClick: {
    action: 'onActionButtonClick',
  },
};
```

**Variant: Callout (`Default`)** — verbatim lit-html template (note the conditional `actionButtonLabel` slot):

```html
export const Default = {
  args,
  argTypes,
  render: (args) => {
    const {
      actionButtonLabel,
      kind,
      title,
      subtitle,
      lowContrast,
      statusIconDescription,
      titleId,
    } = args ?? {};

    return html`
      <cds-callout-notification
        kind="${ifDefined(kind)}"
        title="${ifDefined(title)}"
        subtitle="${ifDefined(subtitle)}"
        ?low-contrast="${lowContrast}"
        status-icon-description="${ifDefined(statusIconDescription)}"
        title-id="${ifDefined(titleId)}">
        ${actionButtonLabel
          ? html`<cds-actionable-notification-button slot="action" kind="ghost"
              >${actionButtonLabel}</cds-actionable-notification-button
            >`
          : ''}
      </cds-callout-notification>
    `;
  },
};
```

**Variant: Callout (`WithInteractiveElements`)** — verbatim:

```html
export const WithInteractiveElements = {
  render: () => {
    return html`
      <cds-callout-notification
        kind="${NOTIFICATION_KIND.INFO}"
        title="Notification title"
        title-id="callout-title-interactive"
        ?low-contrast="${true}">
        <div class="${prefix}--actionable-notification__subtitle">
          Additional text can describe the notification, or a link to
          <a href="#" aria-describedby="callout-title-interactive"
            >learn more</a
          >
        </div>
      </cds-callout-notification>
    `;
  },
};

const meta = {
  title: 'Components/Notifications/Callout',
  parameters: {
    docs: {
      page: storyDocs,
    },
  },
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (`${ifDefined(x)}`, `?attr="${bool}"`) resolved to static attributes. Use this for hand-coded HTML without a component framework. Custom elements (`<cds-toast-notification>` etc.) still need the WC bundle registered — see "Imports — WC" in Quick Reference.

**Variant: Toast (Default — error, high-contrast, with caption + status role)**

```html
<cds-toast-notification
  kind="error"
  title="Notification title"
  subtitle="Subtitle text goes here"
  caption="00:00:00 AM"
  role="status"
  timeout="0">
</cds-toast-notification>
```

**Variant: Toast (low-contrast success, auto-dismiss after 6 seconds)**

```html
<cds-toast-notification
  kind="success"
  low-contrast
  title="Saved"
  subtitle="Your changes have been saved."
  caption="2 minutes ago"
  role="status"
  timeout="6000"
  status-icon-description="success notification">
</cds-toast-notification>
```

**Variant: Inline (low-contrast warning, no close button — for non-dismissable form errors)**

```html
<cds-inline-notification
  kind="warning"
  low-contrast
  hide-close-button
  title="Heads up"
  subtitle="This account has unsaved changes."
  role="alert"
  status-icon-description="warning notification">
</cds-inline-notification>
```

**Variant: Actionable (Default — toast geometry, error, with Action button)**

```html
<cds-actionable-notification
  kind="error"
  title="Notification title"
  subtitle="Subtitle text goes here"
  role="alertdialog"
  close-on-escape
  status-icon-description="notification">
  <cds-actionable-notification-button slot="action">
    Action
  </cds-actionable-notification-button>
</cds-actionable-notification>
```

**Variant: Actionable (inline geometry — `inline` attribute flips to in-flow layout)**

```html
<cds-actionable-notification
  inline
  kind="error"
  title="Notification title"
  subtitle="Subtitle text goes here"
  role="alertdialog"
  close-on-escape
  status-icon-description="notification">
  <cds-actionable-notification-button slot="action">
    Action
  </cds-actionable-notification-button>
</cds-actionable-notification>
```

**Variant: Callout (low-contrast info, with interactive link inside subtitle slot)**

```html
<cds-callout-notification
  kind="info"
  low-contrast
  title="Notification title"
  title-id="callout-title-interactive">
  <div class="cds--actionable-notification__subtitle">
    Additional text can describe the notification, or a link to
    <a href="#" aria-describedby="callout-title-interactive">learn more</a>
  </div>
</cds-callout-notification>
```

**Variant: Callout with Action button (warning kind)**

```html
<cds-callout-notification
  kind="warning"
  low-contrast
  title="Maintenance scheduled"
  subtitle="The platform will be unavailable Saturday 2-4am UTC."
  status-icon-description="warning notification"
  title-id="callout-maintenance">
  <cds-actionable-notification-button slot="action" kind="ghost">
    View details
  </cds-actionable-notification-button>
</cds-callout-notification>
```

## Design Tokens (component-scoped)

> All hex values below are resolved from `overview.md` (`themes.$white` and `themes.$g100`) and from the Carbon `@carbon/themes/scss/component-tokens` map. The four `notification-background-{kind}` tokens are *component tokens* (not shipped in the global `--cds-*` scale) but are exposed as CSS custom properties at runtime by `_tokens.scss` via the `component-tokens.get-var()` helper.

```css
/* WHITE THEME (default light) */
[data-theme="white"] {
  /* Status colors (border-inline-start, status icon fill — high-contrast) */
  --cds-support-error:            #da1e28;  /* red-60 */
  --cds-support-success:          #24a148;  /* green-60 */
  --cds-support-warning:          #f1c21b;  /* yellow-30 */
  --cds-support-info:             #0043ce;  /* blue-70 */
  /* Status colors (low-contrast — used as border + icon when low-contrast filled bg is showing) */
  --cds-support-error-inverse:    #fa4d56;  /* red-50 */
  --cds-support-success-inverse:  #42be65;  /* green-50 */
  --cds-support-warning-inverse:  #f1c21b;  /* yellow-30 */
  --cds-support-info-inverse:     #4589ff;  /* blue-50 */

  /* Notification surface backgrounds (low-contrast) */
  --cds-notification-background-error:    #fff1f1;  /* red-10 */
  --cds-notification-background-success:  #defbe6;  /* green-10 */
  --cds-notification-background-info:     #edf5ff;  /* blue-10 */
  --cds-notification-background-warning:  #fdf6dd;  /* yellow-10 (with alpha) */

  /* Notification surface background (high-contrast — both inline + toast) */
  --cds-background-inverse:        #393939;  /* gray-80 */
  --cds-background-inverse-hover:  #474747;  /* gray-80 hover */

  /* Text + icon (high-contrast — text sits on dark inverse bg) */
  --cds-text-inverse:    #ffffff;
  --cds-icon-inverse:    #ffffff;
  --cds-link-inverse:    #78a9ff;  /* blue-40 */
  --cds-focus-inverse:   #ffffff;

  /* Text + icon (low-contrast — text sits on pale tinted bg) */
  --cds-text-primary:    #161616;
  --cds-icon-primary:    #161616;
  --cds-focus:           #0f62fe;  /* blue-60 */

  /* Action button hover (low-contrast ghost button hover bg) */
  --cds-notification-action-hover:  #ffffff;  /* white-theme value from _tokens.scss */

  /* Tertiary action button on inverse surface (used by Carbon's high-contrast Action button) */
  --cds-notification-action-tertiary-inverse:        #ffffff;
  --cds-notification-action-tertiary-inverse-text:   #161616;
  --cds-notification-action-tertiary-inverse-hover:  #f4f4f4;
  --cds-notification-action-tertiary-inverse-active: #c6c6c6;
}

/* G100 THEME (dark) — high-contrast and low-contrast token roles flip vs White */
[data-theme="g100"],
.dark {
  /* Status colors (high-contrast — note inverse / non-inverse roles swap in dark themes) */
  --cds-support-error:            #fa4d56;  /* red-50 */
  --cds-support-success:          #42be65;  /* green-50 */
  --cds-support-warning:          #f1c21b;
  --cds-support-info:             #4589ff;  /* blue-50 */
  --cds-support-error-inverse:    #da1e28;
  --cds-support-success-inverse:  #24a148;
  --cds-support-warning-inverse:  #f1c21b;
  --cds-support-info-inverse:     #0043ce;

  /* Notification surface backgrounds (low-contrast — Carbon uses dark gray-80 in g100, not pale tints) */
  --cds-notification-background-error:    #393939;  /* gray-80 */
  --cds-notification-background-success:  #393939;
  --cds-notification-background-info:     #393939;
  --cds-notification-background-warning:  #393939;

  /* Notification surface background (high-contrast — flips to light gray-10 on dark theme) */
  --cds-background-inverse:        #f4f4f4;  /* gray-10 */
  --cds-background-inverse-hover:  #e8e8e8;

  /* Text + icon (high-contrast — text sits on light inverse bg) */
  --cds-text-inverse:    #161616;
  --cds-icon-inverse:    #161616;
  --cds-link-inverse:    #0f62fe;  /* blue-60 */
  --cds-focus-inverse:   #0f62fe;

  /* Text + icon (low-contrast — text sits on dark tinted bg) */
  --cds-text-primary:    #f4f4f4;
  --cds-icon-primary:    #f4f4f4;
  --cds-focus:           #ffffff;

  /* Action button hover (low-contrast ghost button hover bg — uses $layer-hover in g100) */
  --cds-notification-action-hover:  #4c4c4c;  /* layer-hover-01 g100 */

  /* Tertiary action button on inverse surface */
  --cds-notification-action-tertiary-inverse:        #393939;
  --cds-notification-action-tertiary-inverse-text:   #ffffff;
  --cds-notification-action-tertiary-inverse-hover:  #474747;
  --cds-notification-action-tertiary-inverse-active: #6f6f6f;
}
```

> **Why `notification-background-warning` ≈ `#fdf6dd` (not `yellow-10` `#fcf4d6`):** Carbon themes apply ~50% alpha over a white base for the warning tint so it reads softer next to error and info. The exact value ships in `@carbon/themes/scss/component-tokens` as `#fdf6dd`; agents should copy this exact hex when reproducing the surface, not derive it from `yellow-10`.

> **Why `g100`'s low-contrast backgrounds collapse to `#393939`:** in dark themes, the low-contrast tints lose their distinguishing pale color (a pale red on dark gray would be muddy), so Carbon falls back to `gray-80` for all four kinds and relies on the 3px border-inline-start + status icon fill to communicate kind. Light themes use four distinct pale tints; dark themes use one shared gray-80.

## States Reference (from .scss)

> Pulled from `_inline-notification.scss`, `_toast-notification.scss`, `_actionable-notification.scss`, `_mixins.scss`, and `_tokens.scss` on the Carbon `main` branch. All hex values resolve via the White theme; `[]` notes the G100 inversion where it differs.

### Inline Notification — by status × contrast

| State | Background | Color (text) | Border-inline-start | Status icon fill | Other |
|---|---|---|---|---|---|
| Error, low-contrast | `#fff1f1` `[#393939]` | `#161616` `[#f4f4f4]` | `3px solid #da1e28` `[#fa4d56]` | `#da1e28` `[#fa4d56]` | `::before` 1px outline `#da1e28` filtered to `opacity: 0.4` |
| Error, high-contrast | `#393939` `[#f4f4f4]` | `#ffffff` `[#161616]` | `3px solid #fa4d56` `[#da1e28]` | `#fa4d56` `[#da1e28]` | No `::before` outline |
| Success, low-contrast | `#defbe6` `[#393939]` | `#161616` `[#f4f4f4]` | `3px solid #24a148` `[#42be65]` | `#24a148` `[#42be65]` | `::before` outline `#24a148` opacity `0.4` |
| Success, high-contrast | `#393939` `[#f4f4f4]` | `#ffffff` `[#161616]` | `3px solid #42be65` `[#24a148]` | `#42be65` `[#24a148]` | — |
| Warning, low-contrast | `#fdf6dd` `[#393939]` | `#161616` `[#f4f4f4]` | `3px solid #f1c21b` | `#f1c21b` (inner `path[opacity='0']` filled `#000000` for the exclamation) | `::before` outline `#f1c21b` opacity `0.4` |
| Warning, high-contrast | `#393939` `[#f4f4f4]` | `#ffffff` `[#161616]` | `3px solid #f1c21b` | `#f1c21b` | — |
| Info, low-contrast | `#edf5ff` `[#393939]` | `#161616` `[#f4f4f4]` | `3px solid #0043ce` `[#4589ff]` | `#0043ce` `[#4589ff]` | `::before` outline `#0043ce` opacity `0.4` |
| Info, high-contrast | `#393939` `[#f4f4f4]` | `#ffffff` `[#161616]` | `3px solid #4589ff` `[#0043ce]` | `#4589ff` `[#0043ce]` | — |
| Info-square (alias) | (same as Info) | (same) | (same) | (same — square icon variant only) | The square icon is the only difference; surface tokens are shared. |

### Inline Notification — close button + action button

| State | Element | Background | Color | Border / outline | Notes |
|---|---|---|---|---|---|
| Close (rest) | `.cds--inline-notification__close-button` | `transparent` | icon = `#ffffff` (high-contrast) / `#161616` (low-contrast) | `none` | `48px × 48px` square hit target; positioned absolutely (`inset-block-start: 0; inset-inline-end: 0`) on `< md`, then static at `≥ md` |
| Close (focus) | (same, `:focus`) | `transparent` | (rest) | `outline: 2px solid #ffffff` (focus-inverse, high-contrast) / `outline: 2px solid #0f62fe` (focus, low-contrast) `outline-offset: -2px` | Always preserved — never `outline: none` |
| Action ghost (rest, high-contrast) | `.cds--inline-notification__action-button.cds--btn--ghost` | `transparent` | `#78a9ff` (`--cds-link-inverse`) | `none` | `block-size: 32px`, `margin-block-end: $spacing-03`, `margin-inline-start: $spacing-08` |
| Action ghost (rest, low-contrast) | (same) | `transparent` | `#0f62fe` (`--cds-link-primary`) | `none` | (same dimensions) |
| Action ghost (hover, high-contrast) | (same `:hover`) | `#474747` (`--cds-background-inverse-hover`) | (rest) | `none` | — |
| Action ghost (hover, low-contrast) | (same) | `#ffffff` (`--cds-notification-action-hover` white-theme) `[#4c4c4c]` (g100 layer-hover) | (rest) | `none` | — |
| Action ghost (focus, high-contrast) | (same `:focus`) | (rest) | (rest) | `outline: 2px solid #ffffff; outline-offset: -2px; border-color: transparent; box-shadow: none;` | — |
| Action ghost (focus, low-contrast) | (same) | (rest) | (rest) | `outline: 2px solid #0f62fe; outline-offset: -2px;` | — |

### Toast Notification — by status × contrast

> Toast shares the **exact same status × contrast color matrix as Inline above**. The only Toast-specific additions are: fixed `inline-size: 288px` (`352px` ≥ max bp), `padding-inline-start: 13px`, and `box-shadow: 0 2px 6px 0 rgba(0,0,0,0.2)`. Read the Inline matrix above and apply those three overrides — every status × contrast combination has the same background / text / border-inline-start tokens for both surfaces.

### Toast — caption row + close button

| State | Element | Background | Color | Other |
|---|---|---|---|---|
| Caption (high-contrast) | `.cds--toast-notification__caption` | (parent) | `#ffffff` (`--cds-text-inverse`) | `body-compact-01`; `padding-block-start: $spacing-03` (8px) |
| Caption (low-contrast) | (same) | (parent) | `#161616` (`--cds-text-primary`) | (same) |
| Title | `.cds--toast-notification__title` | (parent) | (per contrast) | `heading-compact-01`; `font-weight: 600`; `margin-block-start: $spacing-05` (16px); `word-break: break-word` |
| Subtitle | `.cds--toast-notification__subtitle` | (parent) | (per contrast) | `body-compact-01`; `margin-block: 0 $spacing-05` (0 16px) |
| Close (rest) | `.cds--toast-notification__close-button` | `transparent` | (per contrast — `#ffffff` high-contrast / `#161616` low-contrast) | `48px × 48px`, `margin-inline-start: auto`, `transition: outline + bg $transition-base` |
| Close (focus) | (same `:focus`) | `transparent` | (rest) | `outline: 2px solid (#ffffff or #0f62fe per contrast); outline-offset: -2px` |

### Actionable — additional rules vs Inline / Toast

| Rule | Source SCSS | Effect |
|---|---|---|
| `.cds--actionable-notification--toast` | `actionable-notification-toast-base` mixin | `flex-wrap: wrap; box-shadow: 0 2px 6px 0 rgb(0 0 0 / 20%); max-inline-size: 288px; min-inline-size: 288px;` — when `inline` is **false** the actionable adopts toast geometry |
| `.cds--actionable-notification__details` | `actionable-notification` mixin | `display: flex; flex-grow: 1; margin-inline: 13px $spacing-09;` (then `0 13px` ≥ md when not toast) |
| `.cds--actionable-notification__text-wrapper` | (same) | `padding: 15px 0;` (default) — toast variant: `padding: 15px 0 23px 0;` (extra block-end so title doesn't crowd CTA) |
| `.cds--actionable-notification__title` | (same) | `heading-compact-01; font-weight: 600; margin-inline-end: $spacing-02;` (4px) — toast variant zeroes the inline-end margin |
| `.cds--actionable-notification__subtitle` | (same) | `body-compact-01;` color = `--cds-text-inverse` (high-contrast) or `--cds-text-primary` (low-contrast) |
| `.cds--actionable-notification__caption` | (same) | `body-compact-01; padding-block-start: $spacing-06;` (24px — larger than Toast's 8px because there's an extra Action row above) |
| `.cds--actionable-notification__action-button.cds--btn--ghost` | (same) | `block-size: 32px; margin-block-end: $spacing-03; margin-inline-start: $spacing-08;` (then `$spacing-03 0` ≥ md) |
| Action ghost color (high-contrast) | (same) | `color: var(--cds-link-inverse)` = `#78a9ff` |
| Action ghost color (low-contrast) | (same) | `color: var(--cds-link-primary)` = `#0f62fe` |
| Action ghost hover (high-contrast) | (same) | `background-color: var(--cds-background-inverse-hover)` = `#474747` |
| Action ghost hover (low-contrast) | (same) | `background-color: var(--cds-notification-action-hover)` = `#ffffff` (white) / `#4c4c4c` (g100) |
| Action ghost focus (high-contrast) | (same) | `outline: 2px solid var(--cds-focus-inverse); outline-offset: -2px; border-color: transparent; box-shadow: none;` |
| Action ghost focus (low-contrast) | (same) | `outline-color: var(--cds-focus);` (otherwise same) |

### Callout — additional rules

| Rule | Source | Effect |
|---|---|---|
| Callout reuses `<cds-callout-notification>` element which inherits the inline geometry | `callout-notification.ts` | `min-block-size: 48px`, no close button (intentional — Callouts are static), supports `low-contrast` only sensibly with `info` and `warning` kinds |
| Action slot on Callout always renders as `kind="ghost"` | `callout-notification.stories.ts` Default | The story unconditionally passes `kind="ghost"` to the inner `<cds-actionable-notification-button>` |
| `titleId` (React) / `title-id` (WC) | Both stories | Sets `id` on the title `<p>` so inner anchors can `aria-describedby` it (see `WithInteractiveElements`) |

## Animation & Motion

Carbon's source uses these motion tokens for Notification (extracted from `_inline-notification.scss`, `_toast-notification.scss`, `_actionable-notification.scss`):

```css
/* Close button — outline ring + background-color cross-fade on focus / hover */
.cds--inline-notification__close-button,
.cds--toast-notification__close-button,
.cds--actionable-notification__close-button {
  transition:
    outline          var(--cds-duration-fast-02) var(--cds-easing-productive-standard),
    background-color var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* duration-fast-02 = 110ms; easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

/* Toast slide-in (consumer-implemented; Carbon ships no positioner — see overview.md motion table) */
@keyframes cds-toast-enter {
  from { transform: translateX(100%); opacity: 0; }
  to   { transform: translateX(0);     opacity: 1; }
}
.cds--toast-notification {
  animation: cds-toast-enter var(--cds-duration-moderate-02) var(--cds-easing-productive-entrance) both;
  /* moderate-02 = 240ms; productive-entrance = cubic-bezier(0, 0, 0.38, 0.9) */
}

/* Toast slide-out — productive-exit reverses the entrance curve */
@keyframes cds-toast-exit {
  from { transform: translateX(0);     opacity: 1; }
  to   { transform: translateX(100%);  opacity: 0; }
}
.cds--toast-notification[data-closing] {
  animation: cds-toast-exit var(--cds-duration-moderate-02) var(--cds-easing-productive-exit) both;
  /* productive-exit = cubic-bezier(0.2, 0, 1, 0.9) */
}

/* Auto-dismiss progress bar (optional; consumer-implemented) — countdown to timeout */
.cds--toast-notification__progress {
  block-size: 2px;
  inline-size: 100%;
  background: var(--cds-support-info);  /* match status color */
  transform-origin: left;
  animation: cds-toast-progress var(--cds-toast-timeout, 6000ms) linear forwards;
}
@keyframes cds-toast-progress {
  from { transform: scaleX(1); }
  to   { transform: scaleX(0); }
}

/* Reduced-motion override — Carbon respects user preference */
@media (prefers-reduced-motion: reduce) {
  .cds--inline-notification__close-button,
  .cds--toast-notification__close-button,
  .cds--actionable-notification__close-button,
  .cds--toast-notification {
    transition: none;
    animation: none;
  }
}
```

**Motion summary:** the close button cross-fades on hover/focus at `fast-02` (`110ms`) on the productive-standard curve. Toast entrances ride `moderate-02` (`240ms`) `productive-entrance` per Carbon's overview motion table. Inline and Callout do not slide — they appear in-flow. Carbon source does **not** ship a slide animation for Toast (the `_toast-notification.scss` file only animates the close button) — it leaves the entrance to the consumer's positioner. The keyframes above are the canonical Carbon motion-token recipe consumers use.

## Accessibility (from Carbon's docs + source)

- **Default `role` per surface** (set in the `args` block of each WC story):
  - **Toast:** `role="status"` — non-critical, polite (do not interrupt SR reading).
  - **Inline:** `role="status"` — same default; switch to `role="alert"` only for *truly* critical errors (e.g., "Connection lost — work will not be saved").
  - **Actionable (toast or inline):** `role="alertdialog"` — Carbon picks alertdialog because the user *must* decide on the action; the surface acts like a transient dialog.
  - **Callout:** no default explicit role; the surface inherits `role="status"` from its inline parent.
  - All four surfaces accept `role` as a prop/attribute — choose `alert` (assertive), `status` (polite), `log` (cumulative), or `alertdialog` (action required).

- **`aria-live` semantics** (driven by `role`):
  - `role="status"` → `aria-live="polite"` implicitly. Screen readers wait for the user to pause before announcing.
  - `role="alert"` → `aria-live="assertive"`. Interrupts current SR speech. Use sparingly — only when the user must hear the message *now*.
  - `role="alertdialog"` → focus is moved into the dialog (Actionable's `hasFocus` prop opt-in); pair with `closeOnEscape: true` (the Actionable default).

- **`status-icon-description` (WC) / `statusIconDescription` (React):** the SVG status icon is decorative for sighted users but Carbon adds an `<title>` element inside it sourced from this prop so screen readers announce "warning notification" / "error notification". **Always provide it** — Carbon defaults it to `"notification"` which is too generic.

- **`aria-label` on the close button:** Carbon's stories default the close button label to `"closes notification"` (Toast/Inline) and `"close notification"` (Actionable). Always pass an explicit `aria-label` prop — never rely on the default for production UI; use the localized string for the user's locale.

- **Keyboard:**
  - `Tab` / `Shift+Tab` — cycle through focusable controls inside the notification (Action button → Close button).
  - `Enter` / `Space` — activate the focused button.
  - `Escape` — closes Actionable when `closeOnEscape` is `true` (default). Inline and Toast do not respond to Escape.
  - On Inline/Toast, the close button is the only keyboard target. Actionable adds the Action button as a second target (focused first per source order).
  - `hasFocus` (Actionable, default `false`): when `true`, focus is moved into the notification on mount (matching alertdialog behavior). Use for critical "must-respond" surfaces.

- **Touch target:** Close button is a guaranteed `48px × 48px` square — exceeds the Apple HIG (44pt) and Carbon's own 32px minimum. Action button is `32px` block-size — meets WCAG 2.5.5 minimum (24px) but consider wrapping the entire mobile notification in a `min-height: 48px` container for richer tap zones around the Action.

- **Focus management:** Carbon's CSS provides `outline: 2px solid var(--cds-focus-inverse)` (high-contrast) or `var(--cds-focus)` (low-contrast) with `outline-offset: -2px` on the close + action buttons. The inset offset (`-2px`) keeps the ring inside the button silhouette so it doesn't bleed past the notification edge. **Do not remove or override.**

- **Color contrast:**
  - High-contrast Toast/Inline: `#ffffff` text on `#393939` bg = **12.63:1** (WCAG AAA).
  - Low-contrast Inline error: `#161616` text on `#fff1f1` bg = **15.74:1** (AAA).
  - Low-contrast Inline warning: `#161616` text on `#fdf6dd` bg = **15.91:1** (AAA).
  - Low-contrast Inline success: `#161616` text on `#defbe6` bg = **14.91:1** (AAA).
  - Low-contrast Inline info: `#161616` text on `#edf5ff` bg = **15.49:1** (AAA).
  - All four pass AAA — Carbon's pale tints were tuned specifically so secondary text colors (`text-secondary` `#525252`) still pass AA at 4.5:1 inside the surface.

- **High Contrast Mode (Windows):** Carbon includes `@include high-contrast-mode('outline')` on each surface — in HCM the notification gets a forced 1px outline of the system "WindowText" color so it remains visible against the system background.

- **Don't rely on color alone:** the status icon is the primary kind affordance (and gets a description for SR). The 3px border-inline-start is secondary. Color of the bg/icon is tertiary. This three-channel encoding (icon + border + color) ensures color-blind users can still distinguish error / success / warning / info.

## Responsive Behavior

| Breakpoint | Inline / Actionable max-inline-size | Toast inline-size | Layout adaptation |
|---|---|---|---|
| `sm` (≥ 320px) | `288px` | `288px` | Close button is **absolutely positioned** at top-right (`inset-block-start: 0; inset-inline-end: 0`); flex-wrap allows title + subtitle to stack |
| `md` (≥ 672px) | `608px` | `288px` | Close button becomes **static** (in-flow, sits at the row's end after the text wrapper); flex-nowrap lets title + subtitle ride one row when short |
| `lg` (≥ 1056px) | `736px` | `288px` | Same as md, just wider container |
| `xlg` (≥ 1312px) | `736px` | `288px` | (no further changes) |
| `max` (≥ 1584px) | `832px` | `352px` | Toast widens to 352px to balance with the wider page grid |

The Inline notification expands from `288px` (matches Carbon's `sm` 4-column grid width minus margins) to `832px` at `max`. This means a single Inline can sit cleanly inside a Carbon column at every breakpoint — no manual width override is needed. Toast deliberately stays at 288–352px so it doesn't dominate the viewport corner.

**Mobile-first stacking:** below `md`, the close button absolutely overlays the top-right corner. The text wrapper has `padding-inline-end` of `48px` so the title/subtitle never run under the close. Above `md`, the close button rejoins the flex row at the end. This is why the WC SCSS adds `position: absolute` then later `position: static` — read both rules together, not in isolation.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — copy the imports, the `(args) =>` signatures, the prop bindings, and the `<cds-*-notification>` element names | Don't paraphrase or rewrite — the verbatim Storybook code IS the spec. Modifications drift away from Carbon and break the design tokens that bind to the cds class names |
| Pick the right surface: **Toast** for transient confirmations, **Inline** for in-flow status, **Actionable** for must-decide prompts (Toast or Inline shape), **Callout** for static page-level info | Don't use Toast for errors that block work — Toasts auto-dismiss and the user may miss them. Use Actionable (`role="alertdialog"`) instead |
| Default to **low-contrast** (`lowContrast: true` / `low-contrast` attr) per Carbon UX guidance — high-contrast is reserved for high-priority interrupts | Don't ship the high-contrast variant as your default. The dark `--cds-background-inverse` reads as a system-level alert and overwhelms calmer status surfaces around it |
| Always pass `statusIconDescription` and an `aria-label` on the close button — Carbon's defaults (`"notification"`, `"closes notification"`) are placeholders for testing | Don't ship the default `statusIconDescription="notification"` — screen reader users get no context about whether it's an error or info |
| Match `role` to severity: `status` for polite, `alert` only for critical interrupts, `alertdialog` for must-decide actions | Don't blanket every notification with `role="alert"` — assertive announcements interrupt SR users mid-sentence and are exhausting |
| For Toast positioning, fix to `position: fixed; bottom: 16px; right: 16px;` and stack vertically with `gap: 8px` (`$spacing-03`) | Don't put Toast into the document flow — Carbon ships no positioner because Toast is meant to float. An in-flow Toast collapses to its `288px` width with no container reference |
| Provide `timeout` in **milliseconds** (`timeout: 6000` for 6 seconds, `timeout: 0` for sticky) | Don't pass `timeout` in seconds — the Carbon source treats the value as milliseconds; `timeout: 6` would auto-dismiss in 6 ms (effectively immediately) |
| Use Callout — not Inline — for static page-level info banners (maintenance windows, FAQ blocks, deprecated-feature warnings) | Don't use the deprecated `<StaticNotification>` — Storybook explicitly displays the codemod hint: `npx @carbon/upgrade migrate refactor-to-callout --write` |
| Sharp corners (`border-radius: 0`) on every notification surface | Don't add `border-radius: 4px` / `8px` — that's Material/Apple, not Carbon. The 3px border-inline-start is the only rule that breaks the orthogonal silhouette |
| Honor `prefers-reduced-motion: reduce` — the SCSS already disables transitions for the close button. Disable your Toast slide-in keyframes the same way | Don't add custom `transform: scale()` or `bounce` animations on Notification — Carbon's productive motion is restricted to `opacity`, `background-color`, and `translateX` |
| For Actionable, keep `closeOnEscape: true` (Carbon's default) and pair with `hasFocus: true` for truly critical prompts so SR users land inside the dialog immediately | Don't disable `closeOnEscape` on Actionable — Carbon's `role="alertdialog"` semantic *requires* an Escape key path; without it you fail WCAG 2.1.2 (No Keyboard Trap) |
| Wrap your page in `[data-theme="white"]`, `[data-theme="g10"]`, `[data-theme="g90"]`, or `[data-theme="g100"]` — the four official themes | Don't define your own theme classes (`.dark-mode`, `.theme-night`) — the `--cds-notification-background-{kind}` tokens won't bind to them and you'll lose all four pale tints |
| Use the dedicated `<cds-actionable-notification-button slot="action">` element — not a plain `<cds-button>` — when adding a CTA to Actionable or Callout | Don't drop a `<cds-button kind="ghost">` into the action slot — Carbon's actionable-notification-button has scoped styles for the inset focus ring + ghost-on-inverse colors that a plain ghost button lacks |
| Communicate kind through three channels (status icon + border-inline-start color + bg color) so color-blind users can distinguish error/warning/info | Don't substitute the status icon with a custom icon — Carbon's icon SVGs include `<title>` for SR and a specific path-fill quirk for the warning exclamation (`path[opacity='0']` filled `#000000`); custom SVGs break this |
| Keep the focus ring intact (`2px solid var(--cds-focus-inverse)` + inset `-2px`) on close + action buttons | Don't `outline: none` on focus — the inset offset is what keeps the ring inside the notification silhouette; remove it and the ring bleeds past the 3px border-inline-start |
