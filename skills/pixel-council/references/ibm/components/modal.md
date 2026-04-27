---
name: modal
description: Carbon Modal — focus-trapping dialog surface that slides in from above with an overlay backdrop. Variants: Default, Danger, FullWidth, PassiveModal, WithStateManager, WithScrollingContent, WithInlineLoading, withAILabel — plus the lower-level ComposedModal API (ModalHeader / ModalBody / ModalFooter) for full layout control.
metadata:
  tags: modal, dialog, overlay, popup, danger, passive, transactional, full-width, scrolling, ai-label, composed-modal, ibm, carbon, react, web-components
---

# Modal -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (Modal):** [`Modal.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/Modal/Modal.stories.js)
> - **React story (ComposedModal):** [`ComposedModal.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/ComposedModal/ComposedModal.stories.js)
> - **WC story:** [`modal.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/modal/modal.stories.ts)
> - **SCSS source:** [`_modal.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/modal/_modal.scss)
> - **Storybook live (React Modal):** https://react.carbondesignsystem.com/?path=/story/components-modal--default
> - **Storybook live (React ComposedModal):** https://react.carbondesignsystem.com/?path=/story/components-composedmodal--default
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-modal--default
> - **Docs page:** https://v11.carbondesignsystem.com/components/modal/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

Modal is Carbon's focus-trapping dialog surface — a sharp-cornered card that slides 24px down from above on entry, sits on top of a 50%-black overlay, and locks the rest of the page from scrolling. Carbon ships modal as **two** related APIs: the high-level `Modal` (one component, every prop on one element — for transactional flows) and the lower-level `ComposedModal` family (`ComposedModal` + `ModalHeader` + `ModalBody` + `ModalFooter` — for fully custom layouts). Both render the same DOM and same SCSS; choose based on whether you want convenience props or slot-level control.

The visual signature you must preserve: footer buttons stretch to **half-width** each, sit flush against each other (NO gap, NO padding between them), and the primary button always sits on the right. The header includes an optional `label-01` eyebrow above a `heading-03` title, with the close `X` pinned to the top-right corner inside a 48×48px hit area. Carbon never rounds Modal corners.

## Quick Reference

| Property | Value |
|---|---|
| Sizes | `xs` / `sm` / `md` (default) / `lg` |
| Width — `xs` (md / lg / xlg breakpoints) | `48%` / `32%` / `24%` |
| Width — `sm` (md / lg / xlg breakpoints) | `60%` / `42%` / `36%` |
| Width — `md` (md / lg / xlg breakpoints) | `84%` / `60%` / `48%` |
| Width — `lg` (md / lg / xlg breakpoints) | `96%` / `84%` / `72%` |
| Max height | `100%` (mobile) → `90%` (md) → `84%` (lg, xs `48%` / sm `72%` / lg `96%`) |
| Header padding | `16px 64px 0 16px` (`$spacing-05` top, `$spacing-09` end-inline for close X, `$spacing-05` start-inline) |
| Header heading typography | `heading-03` (20px / 28px line-height / 400 weight) |
| Header label typography | `label-01` (12px / 16px line-height / 400 weight, `text-secondary`) |
| Body padding | `8px 16px 64px 16px` (`$spacing-03` top, `$spacing-09` bottom for footer clearance) |
| Body typography | `body-01` (14px / 20px line-height / 400 weight) |
| Footer height | `64px` (`4rem`) |
| Footer button flex | `0 1 50%` (two buttons) / `0 1 25%` (three buttons) — buttons touch, NO gap |
| Footer button padding | `calc($spacing-05 - 2px) $spacing-07` = `14px 32px` (top), `32px` bottom |
| Close button (X) | `48px × 48px` hit area, `12px` icon padding, `20px × 20px` icon, positioned absolute `top: 0; right: 0` |
| Corner radius | `0` (Carbon: sharp by default) |
| Border (modal-container) | `1px solid var(--cds-border-subtle-01)` |
| Outline (modal-container) | `3px solid transparent` (focus-visible recipient) at `outline-offset: -3px` |
| Background (modal-container) | `var(--cds-layer)` (resolves per-theme — see Design Tokens) |
| Overlay backdrop | `var(--cds-overlay)` — `rgba(22, 22, 22, 0.5)` (White) / `rgba(0, 0, 0, 0.65)` (G100) |
| Overlay covers | `100vw × 100vh`, `position: fixed`, `inset: 0`, `display: flex`, centered |
| Body class while open | `.cds--body--with-modal-open` sets `overflow: hidden` (page lock) |
| Z-index | `z('modal')` (Carbon's modal layer in the z-index stack) |
| Open animation | overlay opacity `0→1` + container `translate3d(0, -24px, 0) → translate3d(0, 0, 0)` over `240ms` (`$duration-moderate-02`) `motion(entrance, expressive)` = `cubic-bezier(0, 0, 0.3, 1)` |
| Close animation | reverse: overlay `1→0` + container `(0,0)→(0,-24px)` over `240ms` `motion(exit, expressive)` = `cubic-bezier(0.4, 0.14, 1, 1)` |
| Close button hover | `background: var(--cds-layer-hover)` (`#e8e8e8` White / `#333333` G100) |
| Close button focus | `border: 2px solid var(--cds-focus)`, `outline: none` (the border IS the focus ring on the close X) |
| Focus ring (modal content) | `2px solid var(--cds-focus)` (`outline` recipient) when content scrolls |
| React import (Modal) | `import Modal from '@carbon/react';` |
| React import (ComposedModal) | `import { ComposedModal, ModalBody, ModalHeader, ModalFooter } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/modal/index.js';` |
| Custom elements | `<cds-modal>`, `<cds-modal-header>`, `<cds-modal-close-button>`, `<cds-modal-label>`, `<cds-modal-heading>`, `<cds-modal-body>`, `<cds-modal-body-content>`, `<cds-modal-footer>`, `<cds-modal-footer-button>` |

## Variants (from Storybook story exports)

Modal ships **eight** named exports across the `Modal` React story file plus **seven** more from the `ComposedModal` story file (significant overlap), and **eight** across Web Components. They are:

| Variant | React story export (Modal) | React story export (ComposedModal) | WC story export | Purpose |
|---|---|---|---|---|
| Default | `Default` | `Default` | `Default` | Transactional modal with header label + heading, scroll-safe body containing form fields, and a 2-button footer (Cancel / Add). The canonical "Add a custom domain" example. |
| Danger | `DangerModal` | (use `Default` + `danger` prop on `ModalFooter`) | `DangerModal` | `danger` flag swaps the primary footer button to the destructive `red-60` (`#da1e28`) treatment. Use for "are you sure you want to delete?" confirmations. |
| Full Width | `FullWidth` | `FullWidth` | `FullWidth` | `isFullWidth` strips body padding (`padding: 0; margin: 0`) so a full-bleed `<StructuredList>` / `<DataTable>` butts to the modal's edges. Pricing-tier compares typically use this. |
| Passive | `PassiveModal` | `PassiveModal` | `PassiveModal` | `passiveModal` (React) / no `<cds-modal-footer>` (WC) — modal has only header + body, no actions. Used for status acknowledgements ("You are now signed out."). User dismisses via the close X or click-outside (if `preventCloseOnClickOutside` is false). |
| With State Manager | `WithStateManager` | `WithStateManager` | `WithStateManager` | Pattern reference — wraps the modal in a portal-mounted state-manager component and shows the launcher button passing `launcherButtonRef` so focus returns to the launcher on close. |
| With Scrolling Content | `WithScrollingContent` | `WithScrollingContent` | `WithScrollingContent` | `hasScrollingContent` opts-in to the scrollable body region (mask-image gradient at the top + bottom edges signals the scroll affordance). Body content longer than the max-height triggers internal scroll while header + footer stay pinned. |
| With Inline Loading | `WithInlineLoading` | `WithInlineLoading` | `WithInlineLoading` | `loadingStatus="inactive" \| "active" \| "finished" \| "error"` swaps the primary footer button into an `InlineLoading` indicator while async work runs. Status auto-resets via `onLoadingSuccess` callback. |
| With AI Label | `withAILabel` | `_withAILabel` | `WithAILabel` | Decorates the modal header with an `<AILabel>` / `<cds-ai-label>` popover trigger. Modal container gets the AI gradient outline + `inset 0 -80px 70px -65px $ai-inner-shadow` + `0 24px 40px -24px $ai-drop-shadow` AI-aura treatment. |

The ComposedModal story file additionally demonstrates that `ComposedModal` accepts the same `isFullWidth`, `decorator`, and `launcherButtonRef` props as `Modal` — they share an underlying implementation.

## React (verbatim from Storybook — Modal)

> The code blocks below are copied exactly from `Modal.stories.js` on the Carbon `main` branch (`packages/react/src/components/Modal/Modal.stories.js`). Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + default export + helpers (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useState } from 'react';
import ReactDOM from 'react-dom';
import { action } from 'storybook/actions';
import Modal from './Modal';
import Button from '../Button';
import Select from '../Select';
import { MultiSelect } from '../MultiSelect';
import { Checkbox as CheckboxIcon } from '@carbon/icons-react';
import { Popover, PopoverContent } from '../Popover';
import Dropdown from '../Dropdown';
import SelectItem from '../SelectItem';
import TextInput from '../TextInput';
import ComboBox from '../ComboBox';
import mdx from './Modal.mdx';
import {
  StructuredListWrapper,
  StructuredListHead,
  StructuredListBody,
  StructuredListRow,
  StructuredListCell,
} from '../StructuredList';
import TextArea from '../TextArea';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import Checkbox from '../Checkbox';
import CheckboxGroup from '../CheckboxGroup';

const buttons = {
  'One (1)': '1',
  'Two (2)': '2',
  'Three (3)': '3',
};

export default {
  title: 'Components/Modal',
  component: Modal,
  parameters: {
    docs: {
      page: mdx,
    },
  },
  argTypes: {
    'aria-label': {
      control: 'text',
    },
    modalHeading: {
      control: 'text',
    },
    modalLabel: {
      control: 'text',
    },
    numberOfButtons: {
      description: 'Count of Footer Buttons',
      options: Object.keys(buttons),
      mapping: buttons,
      control: {
        type: 'inline-radio',
        labels: Object.keys(buttons),
      },
    },
    onKeyDown: {
      action: 'onKeyDown',
    },
    onRequestSubmit: {
      action: 'onRequestSubmit',
    },

    preventCloseOnClickOutside: {
      control: 'boolean',
    },
    primaryButtonText: {
      control: 'text',
    },
  },
};

const modalFooter = (numberOfButtons) => {
  const secondaryButtons = () => {
    switch (numberOfButtons) {
      case '1':
        return {
          secondaryButtons: [],
        };
      case '2':
        return {
          secondaryButtonText: 'Cancel',
        };
      case '3':
        return {
          secondaryButtons: [
            {
              buttonText: 'Keep both',
              onClick: action('onClick'),
            },
            {
              buttonText: 'Rename',
              onClick: action('onClick'),
            },
          ],
        };
      default:
        return null;
    }
  };
  return {
    ...secondaryButtons(),
  };
};

const sharedParameters = {
  controls: {
    exclude: [
      'id',
      'launcherButtonRef',
      'secondaryButtons',
      'secondaryButtonText',
      'selectorPrimaryFocus',
      'selectorsFloatingMenus',
    ],
  },
};
```

**Variant: Default**

```jsx
export const Default = ({ numberOfButtons, ...args }) => {
  const [open, setOpen] = useState(true);
  const [popoverOpen, setPopoverOpen] = useState(false);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        onRequestClose={(e) => {
          action(e);
          setOpen(false);
        }}
        modalHeading="Add a custom domain"
        primaryButtonText="Add"
        secondaryButtonText="Cancel"
        aria-label="Modal content"
        open={open}
        {...args}
        {...modalFooter(numberOfButtons)}>
        <p style={{ marginBottom: '2rem' }}>
          Custom domains direct requests for your apps in this Cloud Foundry
          organization to a URL that you own. A custom domain can be a shared
          domain, a shared subdomain, or a shared domain and host.
        </p>
        <TextInput
          data-modal-primary-focus
          id="text-input-1"
          labelText="Domain name"
          placeholder="For example, GitHub.com"
          style={{ marginBottom: '24px' }}
        />
        <div style={{ marginBottom: '24px' }}>
          <Select id="select-1" defaultValue="us-south" labelText="Region">
            <SelectItem value="us-south" text="US South" />
            <SelectItem value="us-east" text="US East" />
          </Select>
        </div>
        <div style={{ marginBottom: '24px' }}>
          <ComboBox
            allowCustomValue
            autoAlign={true}
            id="carbon-combobox"
            items={['Viewer', 'Editor', 'Manager']}
            titleText="Permissions (Example of Floating UI)"
          />
        </div>
        <div style={{ marginBottom: '24px' }}>
          <Dropdown
            autoAlign={true}
            id="default"
            titleText="TLS (Example of Floating UI)"
            label="Option 1"
            items={[
              {
                id: 'option-0',
                text: '1.0',
              },
              {
                id: 'option-1',
                text: '1.1',
              },
              {
                id: 'option-2',
                text: '1.2',
              },
            ]}
            itemToString={(item) => (item ? item.text : '')}
          />
        </div>
        <div style={{ marginBottom: '24px' }}>
          <MultiSelect
            id="test"
            label="Choose options"
            titleText="Mapping domain"
            autoAlign
            items={[
              {
                id: 'downshift-1-item-0',
                text: 'Cloud Foundry',
              },
              {
                id: 'downshift-1-item-1',
                text: 'Kubernetes Ingress',
              },
              {
                id: 'downshift-1-item-2',
                text: 'VPC Load Balancer',
              },
            ]}
            itemToString={(item) => (item ? item.text : '')}
          />
        </div>
        <CheckboxGroup legendText="Terms of Agreement">
          <Checkbox
            id="checkbox-label-1"
            labelText="I confirm domain ownership and accept IBM service terms and applicable charges."
          />
        </CheckboxGroup>
      </Modal>
    </>
  );
};

Default.argTypes = {
  onSecondarySubmit: {
    action: 'onSecondarySubmit',
  },
};

Default.parameters = { ...sharedParameters };
```

**Variant: FullWidth**

```jsx
export const FullWidth = ({ numberOfButtons, ...args }) => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        open={open}
        onRequestClose={() => setOpen(false)}
        isFullWidth
        modalHeading="Full width modal"
        modalLabel="An example of a modal with no padding"
        primaryButtonText="Add"
        secondaryButtonText="Cancel"
        {...args}
        {...modalFooter(numberOfButtons)}>
        <StructuredListWrapper style={{ marginBottom: '48px' }}>
          <StructuredListHead>
            <StructuredListRow head>
              <StructuredListCell head noWrap>
                Default size
              </StructuredListCell>
              <StructuredListCell head noWrap>
                Features
              </StructuredListCell>
              <StructuredListCell head noWrap>
                Pricing
              </StructuredListCell>
            </StructuredListRow>
          </StructuredListHead>
          <StructuredListBody>
            <StructuredListRow>
              <StructuredListCell noWrap>Lite</StructuredListCell>
              <StructuredListCell>2 vCPUs | 4GB RAM</StructuredListCell>
              <StructuredListCell>$0.12 USD / hourly</StructuredListCell>
            </StructuredListRow>
            <StructuredListRow>
              <StructuredListCell noWrap>Graduated tier</StructuredListCell>
              <StructuredListCell>2 vCPUs | 8GB RAM</StructuredListCell>
              <StructuredListCell>$0.13 USD / hourly</StructuredListCell>
            </StructuredListRow>
            <StructuredListRow>
              <StructuredListCell noWrap>Premium</StructuredListCell>
              <StructuredListCell>4 vCPUs | 10GB RAM</StructuredListCell>
              <StructuredListCell>$0.20 USD / hourly</StructuredListCell>
            </StructuredListRow>
          </StructuredListBody>
        </StructuredListWrapper>
      </Modal>
    </>
  );
};

FullWidth.parameters = { ...sharedParameters };
```

**Variant: DangerModal**

```jsx
export const DangerModal = ({ numberOfButtons, ...args }) => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        open={open}
        onRequestClose={() => setOpen(false)}
        danger
        modalHeading="Are you sure you want to delete this custom domain?"
        modalLabel="Account resources"
        primaryButtonText="Delete"
        secondaryButtonText="Cancel"
        {...args}
        {...modalFooter(numberOfButtons)}>
        <p>
          Check for dependencies on the domain before deletion. For instance, if
          the domain is used as a primary domain for users or if it's associated
          with critical applications or services, those connections will need to
          be removed or reconfigured first.
        </p>
      </Modal>
    </>
  );
};

DangerModal.parameters = { ...sharedParameters };
```

**Variant: WithScrollingContent**

```jsx
export const WithScrollingContent = ({ numberOfButtons, ...args }) => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        open={open}
        onRequestClose={() => setOpen(false)}
        hasScrollingContent
        modalHeading="Add a custom domain"
        modalLabel="Account resources"
        primaryButtonText="Add"
        secondaryButtonText="Cancel"
        {...args}
        {...modalFooter(numberOfButtons)}>
        <p style={{ marginBottom: '1rem' }}>
          Custom domains direct requests for your apps in this Cloud Foundry
          organization to a URL that you own. A custom domain can be a shared
          domain, a shared subdomain, or a shared domain and host.
        </p>
        <p style={{ marginBottom: '2rem' }}>
          Domain mappings provide the URL route to your Code Engine application
          or function within a project. With Code Engine, these mappings are
          automatically created, by default, whenever you deploy an application
          or create a function. However, you can map your own custom domain to a
          Code Engine application or function. This option routes requests from
          your custom URL to your application or function. You can use the Code
          Engine CLI.
        </p>
        <div style={{ marginBottom: '24px' }}>
          <TextInput
            data-modal-primary-focus
            id="text-input-1"
            labelText="Domain name"
            placeholder="For example, GitHub.com"
          />
        </div>
        <div style={{ marginBottom: '24px' }}>
          <Select id="select-1" defaultValue="us-south" labelText="Region">
            <SelectItem value="us-south" text="US South" />
            <SelectItem value="us-east" text="US East" />
          </Select>
        </div>
        <div style={{ marginBottom: '24px' }}>
          <ComboBox
            allowCustomValue
            autoAlign={true}
            id="carbon-combobox"
            items={['Viewer', 'Editor', 'Manager']}
            titleText="Permissions (Example of Floating UI)"
          />
        </div>
        <MultiSelect
          id="test"
          label="Choose options"
          titleText="Mapping domain"
          autoAlign
          items={[
            {
              id: 'downshift-1-item-0',
              text: 'Cloud Foundry',
            },
            {
              id: 'downshift-1-item-1',
              text: 'Kubernetes Ingress',
            },
            {
              id: 'downshift-1-item-2',
              text: 'VPC Load Balancer',
            },
          ]}
          itemToString={(item) => (item ? item.text : '')}
        />
      </Modal>
    </>
  );
};

WithScrollingContent.parameters = { ...sharedParameters };
```

**Variant: WithStateManager**

```jsx
export const WithStateManager = ({ numberOfButtons, ...args }) => {
  /**
   * Simple state manager for modals.
   */
  const ModalStateManager = ({
    renderLauncher: LauncherContent,
    children: ModalContent,
  }) => {
    const [open, setOpen] = React.useState(false);
    return (
      <>
        {!ModalContent || typeof document === 'undefined'
          ? null
          : ReactDOM.createPortal(
              <ModalContent open={open} setOpen={setOpen} />,
              document.body
            )}
        {LauncherContent && <LauncherContent open={open} setOpen={setOpen} />}
      </>
    );
  };

  const button = React.useRef();

  return (
    <ModalStateManager
      renderLauncher={({ setOpen }) => (
        <Button ref={button} onClick={() => setOpen(true)}>
          Launch modal
        </Button>
      )}>
      {({ open, setOpen }) => (
        <Modal
          launcherButtonRef={button}
          modalHeading="Add a custom domain"
          modalLabel="Account resources"
          primaryButtonText="Add"
          secondaryButtonText="Cancel"
          open={open}
          onRequestClose={() => setOpen(false)}
          {...args}
          {...modalFooter(numberOfButtons)}>
          <p style={{ marginBottom: '1rem' }}>
            Custom domains direct requests for your apps in this Cloud Foundry
            organization to a URL that you own. A custom domain can be a shared
            domain, a shared subdomain, or a shared domain and host.
          </p>
          <TextInput
            data-modal-primary-focus
            id="text-input-1"
            labelText="Domain name"
            placeholder="e.g. github.com"
            style={{ marginBottom: '1rem' }}
          />
          <Select id="select-1" defaultValue="us-south" labelText="Region">
            <SelectItem value="us-south" text="US South" />
            <SelectItem value="us-east" text="US East" />
          </Select>
        </Modal>
      )}
    </ModalStateManager>
  );
};

WithStateManager.parameters = { ...sharedParameters };
```

**Variant: PassiveModal**

```jsx
export const PassiveModal = ({ numberOfButtons, ...args }) => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        open={open}
        onRequestClose={() => setOpen(false)}
        passiveModal
        modalHeading="You are now signed out."
        {...args}
        {...modalFooter(numberOfButtons)}
      />
    </>
  );
};

PassiveModal.parameters = {
  controls: {
    include: [
      'aria-label',
      'closeButtonLabel',
      'hasScrollingContent',
      'isFullWidth',
      'modalAriaLabel',
      'modalHeading',
      'modalLabel',
      'open',
      'preventCloseOnClickOutside',
      'size',
    ],
  },
};
```

**Variant: WithInlineLoading**

```jsx
export const WithInlineLoading = (args) => {
  const [status, setStatus] = useState('inactive');
  const [description, setDescription] = useState('Deleting...');

  const fakePromise = () => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve();
      }, 2000);
    });
  };

  const submit = async () => {
    setStatus('active');

    await fakePromise();

    setDescription('Deleted!');
    setStatus('finished');
  };

  const resetStatus = () => {
    setStatus('inactive');
    setDescription('Deleting...');
  };

  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch modal</Button>
      <Modal
        open={open}
        danger
        modalHeading="Are you sure you want to delete this custom domain?"
        modalLabel="Account resources"
        primaryButtonText="Delete"
        secondaryButtonText="Cancel"
        loadingStatus={status}
        loadingDescription={description}
        {...args}
        onRequestClose={() => setOpen(false)}
        onRequestSubmit={submit}
        onLoadingSuccess={resetStatus}
      />
    </>
  );
};

WithInlineLoading.parameters = {
  controls: {
    exclude: [
      'loadingStatus',
      'loadingDescription',
      'numberOfButtons',
      'id',
      'launcherButtonRef',
      'secondaryButtons',
      'secondaryButtonText',
      'selectorPrimaryFocus',
      'selectorsFloatingMenus',
    ],
  },
};
```

**Variant: withAILabel**

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

export const withAILabel = {
  render: ({ numberOfButtons, ...args }) => {
    const [open, setOpen] = useState(true); // eslint-disable-line
    return (
      <div className="ai-label-modal">
        <Button onClick={() => setOpen(true)}>Launch modal</Button>
        <Button onClick={() => setOpen2(true)}>
          Launch modal decorator tooltip
        </Button>
        <Modal
          open={open}
          onRequestClose={() => setOpen(false)}
          modalHeading="Add a custom domain"
          modalLabel="Account resources"
          primaryButtonText="Add"
          secondaryButtonText="Cancel"
          decorator={aiLabel}
          {...args}
          {...modalFooter(numberOfButtons)}>
          <p style={{ marginBottom: '2rem' }}>
            Custom domains direct requests for your apps in this Cloud Foundry
            organization to a URL that you own. A custom domain can be a shared
            domain, a shared subdomain, or a shared domain and host.
          </p>
          <TextInput
            data-modal-primary-focus
            id="text-input-1"
            labelText="Domain name"
            placeholder="For example, GitHub.com"
            style={{ marginBottom: '24px' }}
          />
          <div style={{ marginBottom: '24px' }}>
            <Select id="select-1" defaultValue="us-south" labelText="Region">
              <SelectItem value="us-south" text="US South" />
              <SelectItem value="us-east" text="US East" />
            </Select>
          </div>
          <TextArea labelText="Comments" style={{ height: '80px' }} />
        </Modal>
      </div>
    );
  },
};
withAILabel.parameters = { ...sharedParameters };
```

## React (verbatim from Storybook — ComposedModal)

> The ComposedModal API breaks Modal apart into `ComposedModal` + `ModalHeader` + `ModalBody` + `ModalFooter` so you can fully control the DOM/layout. Code below is copied exactly from `ComposedModal.stories.js` on the Carbon `main` branch.

**Imports + default export (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2025
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useState } from 'react';
import ReactDOM from 'react-dom';
import ComposedModal, { ModalBody } from './ComposedModal';
import { ModalHeader } from './ModalHeader';
import { ModalFooter } from './ModalFooter';
import { MultiSelect } from '../MultiSelect';
import Dropdown from '../Dropdown';
import Select from '../Select';
import SelectItem from '../SelectItem';
import TextInput from '../TextInput';
import Button from '../Button';
import {
  StructuredListWrapper,
  StructuredListHead,
  StructuredListBody,
  StructuredListRow,
  StructuredListCell,
} from '../StructuredList';
import { AILabel, AILabelContent, AILabelActions } from '../AILabel';
import { IconButton } from '../IconButton';
import { View, FolderOpen, Folders } from '@carbon/icons-react';
import mdx from './ComposedModal.mdx';

export default {
  title: 'Components/ComposedModal',
  component: ComposedModal,
  subcomponents: {
    ModalHeader,
    ModalBody,
    ModalFooter,
  },
  parameters: {
    docs: {
      page: mdx,
    },
    controls: {
      exclude: [
        'containerClassName',
        'launcherButtonRef',
        'selectorPrimaryFocus',
        'selectorsFloatingMenus',
      ],
    },
  },
};

const sharedArgTypes = {
  onClose: {
    action: 'onClose',
  },
  onKeyDown: {
    action: 'onKeyDown',
  },
};
```

**Variant: Default (ComposedModal)**

```jsx
export const Default = (args) => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Button onClick={() => setOpen(true)}>Launch composed modal</Button>
      <ComposedModal {...args} open={open} onClose={() => setOpen(false)}>
        <ModalHeader
          label="Account resources"
          title="Add a custom domain"
          {...args}
        />
        <ModalBody>
          <p style={{ marginBottom: '1rem' }}>
            Custom domains direct requests for your apps in this Cloud Foundry
            organization to a URL that you own. A custom domain can be a shared
            domain, a shared subdomain, or a shared domain and host.
          </p>
          <TextInput
            data-modal-primary-focus
            id="text-input-1"
            labelText="Domain name"
            placeholder="e.g. github.com"
            style={{ marginBottom: '1rem' }}
          />
          <Select id="select-1" defaultValue="us-south" labelText="Region">
            <SelectItem value="us-south" text="US South" />
            <SelectItem value="us-east" text="US East" />
          </Select>
        </ModalBody>
        <ModalFooter
          primaryButtonText="Add"
          secondaryButtonText="Cancel"
          {...args}
        />
      </ComposedModal>
    </>
  );
};

Default.argTypes = { ...sharedArgTypes };
```

**Variant: FullWidth (ComposedModal) — condensed**

Same shape as ComposedModal `Default` above, but pass `isFullWidth` on `<ComposedModal>` and put a `<StructuredListWrapper>` (3 columns: Column A/B/C × 3 lorem-ipsum rows) inside `<ModalBody>` instead of form inputs. The `isFullWidth` prop strips `<ModalBody>` padding so the table butts to the modal edges. Footer: `<ModalFooter primaryButtonText="Add" secondaryButtonText="Cancel" />`. Full source:
`https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/ComposedModal/ComposedModal.stories.js`

**Variant: PassiveModal (ComposedModal) — condensed**

Same shape as ComposedModal `Default` above, but with `<ModalHeader title="You have been successfully signed out" />` (no `label` prop), an empty `<ModalBody />`, and **no** `<ModalFooter>`. Used for status acknowledgements. Full source: same URL as above.

**Variant: WithStateManager / WithScrollingContent / WithInlineLoading / _withAILabel (ComposedModal)**

> These four ComposedModal exports follow the same patterns as the Modal-API versions above — wrap a portal-mounted state manager around `<ComposedModal>`, set `hasScrollingContent` on `<ModalBody>` for scroll, set `loadingStatus`/`loadingDescription` on `<ModalFooter>` for inline loading, and pass `decorator={aiLabel}` for the AI variant. Refer to the Modal stories above for the full pattern shape; the only difference here is the slot-based markup (`<ModalHeader>`, `<ModalBody>`, `<ModalFooter>`) instead of the consolidated `Modal` props (`modalHeading`, `modalLabel`, `primaryButtonText`, `secondaryButtonText`).

The verbatim ComposedModal source for these variants lives at:
`https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/ComposedModal/ComposedModal.stories.js`

Below is the `_withAILabel` ComposedModal helper (the AILabel JSX is identical to the Modal version) and the export — included because it demonstrates the `secondaryButtons` array form on `<ModalFooter>` (vs. `secondaryButtonText` string form):

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
        <IconButton kind="ghost" label="View"><View /></IconButton>
        <IconButton kind="ghost" label="Open Folder"><FolderOpen /></IconButton>
        <IconButton kind="ghost" label="Folders"><Folders /></IconButton>
        <Button>View details</Button>
      </AILabelActions>
    </AILabelContent>
  </AILabel>
);

export const _withAILabel = {
  render: () => {
    const [open, setOpen] = useState(true);
    return (
      <div className="ai-label-modal">
        <Button onClick={() => setOpen(true)}>Launch composed modal</Button>
        <ComposedModal
          open={open}
          onClose={() => setOpen(false)}
          decorator={aiLabel}>
          <ModalHeader label="Account resources" title="Add a custom domain" />
          <ModalBody>
            {/* body paragraphs + TextInput + Select — see Modal withAILabel for full body content */}
          </ModalBody>
          <ModalFooter
            primaryButtonText="Save"
            secondaryButtons={[{ buttonText: 'Cancel' }]}
          />
        </ComposedModal>
      </div>
    );
  },
};
```

The other three ComposedModal variants are removed from this reference for brevity (the patterns are identical to the Modal API versions above — just swap consolidated props for slot children). Pull the full source from the Storybook URL above when you need them verbatim.


## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `modal.stories.ts` on the Carbon `main` branch (`packages/web-components/src/components/modal/modal.stories.ts`). Use these for non-React projects.

**Imports + helpers (from the top of the stories file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import '../structured-list';
import { MODAL_SIZE } from './modal';
import { iconLoader } from '../../globals/internal/icon-loader';
import View16 from '@carbon/icons/es/view/16.js';
import FolderOpen16 from '@carbon/icons/es/folder--open/16.js';
import Folders16 from '@carbon/icons/es/folders/16.js';
import './index';
import '../ai-label';
import '../icon-button';
import '../form';
import '../select';
import '../textarea';
import '../combo-box';
import '../checkbox';

const toggleButton = () => {
  document.querySelector('cds-modal')?.toggleAttribute('open');
};

const sizes = {
  [`Extra small size (${MODAL_SIZE.EXTRA_SMALL})`]: MODAL_SIZE.EXTRA_SMALL,
  [`Small size (${MODAL_SIZE.SMALL})`]: MODAL_SIZE.SMALL,
  [`Medium size (${MODAL_SIZE.MEDIUM})`]: MODAL_SIZE.MEDIUM,
  [`Large size (${MODAL_SIZE.LARGE})`]: MODAL_SIZE.LARGE,
};

const buttons = {
  'One (1)': 1,
  'Two (2)': 2,
  'Three (3)': 3,
};

const defaultArgs = {
  alert: false,
  ariaLabel: '',
  closeButtonLabel: 'Close',
  danger: false,
  fullWidth: false,
  hasScrollingContent: false,
  modalHeading: 'Add a custom domain',
  modalLabel: '',
  numberOfButtons: 2,
  open: true,
  passiveModal: false,
  preventCloseOnClickOutside: true,
  primaryButtonDisabled: false,
  size: null,
  loadingStatus: 'inactive',
  loadingDescription: '',
  loadingIconDescription: 'Loading',
  shouldSubmitOnEnter: false,
};

const controls = {
  alert: {
    control: 'boolean',
    description:
      'Specify whether the Modal is displaying an alert, error or warning Should go hand in hand with the danger prop.',
  },
  ariaLabel: {
    control: 'text',
    description: 'Required props for the accessibility label of the header.',
  },
  closeButtonLabel: {
    control: 'text',
    description: 'Required props for the accessibility label of the header.',
  },
  danger: {
    control: 'boolean',
    description: 'Specify whether the Modal is for dangerous actions.',
  },
  fullWidth: {
    control: 'boolean',
    description:
      'Specify whether or not the Modal content should have any inner padding.',
  },
  hasScrollingContent: {
    control: 'boolean',
    description: 'Specify whether the modal contains scrolling content.',
  },
  modalHeading: {
    control: 'text',
    description: 'Specify the content of the modal header title.',
  },
  modalLabel: {
    control: 'text',
    description: 'Specify the content of the modal header label.',
  },
  numberOfButtons: {
    control: 'radio',
    description: 'Count of Footer Buttons',
    options: buttons,
  },
  open: {
    control: 'boolean',
    description: 'Specify whether the modal is currently open.',
  },
  passiveModal: {
    control: 'boolean',
    description: 'Specify whether the Modal should be passive, or not.',
  },
  preventCloseOnClickOutside: {
    control: 'boolean',
    description: 'Prevent close on click outside.',
  },
  primaryButtonDisabled: {
    control: 'boolean',
    description: 'Primary button disabled.',
  },
  size: {
    control: 'select',
    description: 'Modal size.',
    options: sizes,
  },
  loadingStatus: {
    control: 'radio',
    description: 'Specify loading status',
    options: ['inactive', 'active', 'finished', 'error'],
  },
  loadingIconDescription: {
    description: 'Specify the description for the loading icon',
  },
  loadingDescription: {
    description: 'Specify the description for the loading text',
  },
  shouldSubmitOnEnter: {
    description:
      'Specify if Enter key should be used as "submit" action that clicks the primary footer button',
  },
};
```

**Variant: Default**

```html
export const Default = {
  args: defaultArgs,
  argTypes: controls,
  render: ({
    alert,
    ariaLabel,
    danger,
    open,
    closeButtonLabel,
    hasScrollingContent,
    fullWidth,
    modalHeading,
    modalLabel,
    numberOfButtons,
    passiveModal,
    preventCloseOnClickOutside,
    primaryButtonDisabled,
    size,
    loadingDescription,
    loadingStatus,
    loadingIconDescription,
    shouldSubmitOnEnter,
  }) => html`
    <cds-modal
      aria-label=${ariaLabel}
      ?prevent-close-on-click-outside=${preventCloseOnClickOutside}
      ?alert=${alert}
      size="${size}"
      ?open=${open}
      ?full-width=${fullWidth}
      ?has-scrolling-content="${hasScrollingContent}"
      loading-description="${loadingDescription}"
      loading-status="${loadingStatus}"
      loading-icon-description="${loadingIconDescription}"
      ?should-submit-on-enter="${shouldSubmitOnEnter}">
      <cds-modal-header>
        <cds-modal-close-button
          close-button-label=${closeButtonLabel}></cds-modal-close-button>
        ${modalLabel && html`<cds-modal-label>${modalLabel}</cds-modal-label>`}
        <cds-modal-heading>${modalHeading}</cds-modal-heading>
      </cds-modal-header>
      <cds-modal-body>
        <cds-modal-body-content description>
          Custom domains direct requests for your apps in this Cloud Foundry
          organization to a URL that you own. A custom domain can be a shared
          domain, a shared subdomain, or a shared domain and host.
        </cds-modal-body-content>
        <div style="margin-bottom: 24px;">
          <cds-text-input
            data-modal-primary-focus
            placeholder="For example, GitHub.com"
            label="Domain name">
          </cds-text-input>
        </div>
        <div style="margin-bottom: 24px;">
          <cds-select placeholder="US South" label-text="Region">
            <cds-select-item value="us-south">US South</cds-select-item>
            <cds-select-item value="us-east">US East</cds-select-item>
          </cds-select>
        </div>
        <div style="margin-bottom: 24px;">
          <cds-combo-box
            autoalign
            title-text="Permissions (Example of Floating UI)">
            <cds-combo-box-item value="viewer">Viewer</cds-combo-box-item>
            <cds-combo-box-item value="editor">Editor</cds-combo-box-item>
            <cds-combo-box-item value="manager">Manager</cds-combo-box-item>
          </cds-combo-box>
        </div>
        <div style="margin-bottom: 24px;">
          <cds-dropdown
            autoalign
            label="Option 1"
            title-text="TLS (Example of Floating UI)">
            <cds-dropdown-item value="1.0">1.0</cds-dropdown-item>
            <cds-dropdown-item value="1.1">1.1</cds-dropdown-item>
            <cds-dropdown-item value="1.2">1.2</cds-dropdown-item>
          </cds-dropdown>
        </div>
        <div style="margin-bottom: 24px;">
          <cds-multi-select label="Choose Options" title-text="Mapping Domain">
            <cds-multi-select-item value="cloud-foundry"
              >Cloud Foundry</cds-multi-select-item
            >
            <cds-multi-select-item value="kubernetes-ingress"
              >Kubernetes Ingress</cds-multi-select-item
            >
            <cds-multi-select-item value="vpc-load-balancer"
              >VPC Load Balancer</cds-multi-select-item
            >
          </cds-multi-select>
        </div>
        <div style="margin-bottom: 24px;">
          <cds-checkbox-group legend-text="Terms of Agreement">
            <cds-checkbox id="checkbox-label-1"
              >I confirm domain ownership and accept IBM service terms and
              applicable charges</cds-checkbox
            >
          </cds-checkbox-group>
        </div>
      </cds-modal-body>

      ${passiveModal
        ? ``
        : html` <cds-modal-footer>
            ${numberOfButtons > 2
              ? html` <cds-modal-footer-button kind="secondary"
                  >Keep both</cds-modal-footer-button
                >`
              : ``}
            ${numberOfButtons >= 2
              ? html` <cds-modal-footer-button kind="secondary"
                  >${numberOfButtons === 2
                    ? html`Cancel`
                    : 'Rename'}</cds-modal-footer-button
                >`
              : ``}

            <cds-modal-footer-button
              ?disabled=${primaryButtonDisabled}
              kind="${danger ? 'danger' : 'primary'}"
              >Add</cds-modal-footer-button
            >
          </cds-modal-footer>`}
    </cds-modal>
    <cds-button @click="${toggleButton}">Launch modal</cds-button>
  `,
};
```

**Variant: DangerModal**

> The render template is identical to `Default` (same destructured args, same `<cds-modal>` shell, same footer-button conditional). Only `args:` and the body content differ. The footer's primary button binds `kind="${danger ? 'danger' : 'primary'}"` — flipping `danger: true` swaps the right-side button to the red destructive treatment.

```html
export const DangerModal = {
  args: {
    ...defaultArgs,
    danger: true,
    modalHeading: 'Are you sure you want to delete this custom domain?',
    modalLabel: 'Account resources',
  },
  argTypes: controls,
  render: (args) => html`
    {/* same render template as Default — see above */}
    {/* only body content differs: */}
    <cds-modal-body>
      <cds-modal-body-content>
        Check for dependencies on the domain before deletion. For instance, if
        the domain is used as a primary domain for users or if it's associated
        with critical applications or services, those connections will need to
        be removed or reconfigured first.
      </cds-modal-body-content>
    </cds-modal-body>
    {/* and primary footer button text changes from "Add" to "Delete" */}
    <cds-modal-footer-button kind="${danger ? 'danger' : 'primary'}">Delete</cds-modal-footer-button>
  `,
};
```

**Variant: FullWidth — condensed**

Same render shape as `Default` above (same args destructure, same `<cds-modal>` root with `?full-width=${fullWidth}` already wired). Args override: `fullWidth: true`, `modalHeading: 'Full width modal'`, `modalLabel: 'An example of a modal with no padding'`. Body content swaps the form-input stack for a single `<cds-structured-list>` with 3 columns (Default size / Features / Pricing) and 3 rows (Lite, Graduated tier, Premium — vCPU/RAM + USD/hourly cells). Footer is unchanged. The `full-width` attribute zeroes `<cds-modal-body>` padding so the table butts to the modal edges. Full source:
`https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/modal/modal.stories.ts`

**Variant: PassiveModal**

```html
export const PassiveModal = {
  args: {
    ...defaultArgs,
    passiveModal: true,
    modalHeading: 'You are now signed out.',
  },
  argTypes: controls,
  parameters: {
    controls: {
      include: [
        'ariaLabel',
        'closeButtonLabel',
        'hasScrollingContent',
        'fullWidth',
        'modalHeading',
        'modalLabel',
        'open',
        'preventCloseOnClickOutside',
        'size',
      ],
    },
  },
  render: ({
    ariaLabel,
    open,
    closeButtonLabel,
    hasScrollingContent,
    fullWidth,
    modalHeading,
    modalLabel,
    preventCloseOnClickOutside,
    size,
  }) => html`
    <cds-modal
      aria-label=${ariaLabel}
      ?prevent-close-on-click-outside=${preventCloseOnClickOutside}
      size="${size}"
      ?open=${open}
      ?full-width=${fullWidth}
      ?has-scrolling-content="${hasScrollingContent}">
      <cds-modal-header>
        <cds-modal-close-button
          close-button-label=${closeButtonLabel}></cds-modal-close-button>
        ${modalLabel && html`<cds-modal-label>${modalLabel}</cds-modal-label>`}
        <cds-modal-heading>${modalHeading}</cds-modal-heading>
      </cds-modal-header>
      <cds-modal-body></cds-modal-body>
    </cds-modal>
    <cds-button @click="${toggleButton}">Launch modal</cds-button>
  `,
};
```

**Variant: WithAILabel — condensed**

> Render template is identical to `Default` (same destructured args, same shell, same footer-conditional). Only the header gets an extra `<cds-ai-label alignment="bottom-end">${content}${actions}</cds-ai-label>` element BEFORE `<cds-modal-label>`, and the body uses a `<cds-textarea label="Comments">` after the standard text-input + select. The `content` and `actions` consts (defined at the bottom of the stories file) are reused — see them below.

```html
export const WithAILabel = {
  args: { ...defaultArgs, modalLabel: 'Account Resources' },
  argTypes: controls,
  render: (args) => html`
    {/* same render template as Default — see above; differences: */}
    <cds-modal-header>
      <cds-modal-close-button close-button-label=${closeButtonLabel}></cds-modal-close-button>
      <cds-ai-label alignment="bottom-end">
        ${content}${actions}
      </cds-ai-label>
      ${modalLabel && html`<cds-modal-label>${modalLabel}</cds-modal-label>`}
      <cds-modal-heading>${modalHeading}</cds-modal-heading>
    </cds-modal-header>
    <cds-modal-body>
      <cds-modal-body-content description style="margin-bottom: 2rem;">
        Custom domains direct requests for your apps in this Cloud Foundry
        organization to a URL that you own. A custom domain can be a shared
        domain, a shared subdomain, or a shared domain and host.
      </cds-modal-body-content>
      <div style="margin-bottom: 24px">
        <cds-text-input data-modal-primary-focus placeholder="For example, GitHub.com" label="Domain name"></cds-text-input>
      </div>
      <div style="margin-bottom: 24px">
        <cds-select placeholder="US South" label-text="Region">
          <cds-select-item value="us-south">US South</cds-select-item>
          <cds-select-item value="us-east">US East</cds-select-item>
        </cds-select>
      </div>
      <cds-textarea label="Comments"></cds-textarea>
    </cds-modal-body>
  `,
};
```


**Variant: WithInlineLoading / WithScrollingContent / WithStateManager (WC) — REMOVED FOR BREVITY**

> These three WC story exports duplicate the Default render template with different `defaultArgs` overrides:
> - `WithInlineLoading`: sets `danger: true`, wires `loading-status="active|finished"` attribute updates via `setTimeout`, uses `data-modal-close` on the secondary button.
> - `WithScrollingContent`: sets `hasScrollingContent: true`, body has multiple `<cds-modal-body-content description>` paragraphs to overflow.
> - `WithStateManager`: sets `open: false` (shows the launcher pattern); render template is byte-identical to Default.
>
> Pull the verbatim source from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/modal/modal.stories.ts` when you need them. The shape is: the render template is the SAME as Default — only `args:` and `parameters:` blocks differ.


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

const meta = {
  title: 'Components/Modal',
};

export default meta;
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html bindings (e.g., `${args.danger}` → `danger` or removed) resolved to static attributes. Use this for hand-coded HTML without a component framework. The `<cds-*>` custom elements still need the `@carbon/web-components` package loaded — these are the static-attribute equivalents of the dynamic story renders above.

**Variant: Default (transactional, 2-button footer)**

```html
<cds-modal
  aria-label="Modal content"
  prevent-close-on-click-outside
  size=""
  open
  loading-status="inactive"
  loading-icon-description="Loading">
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-label>Account resources</cds-modal-label>
    <cds-modal-heading>Add a custom domain</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body>
    <cds-modal-body-content description>
      Custom domains direct requests for your apps in this Cloud Foundry
      organization to a URL that you own. A custom domain can be a shared
      domain, a shared subdomain, or a shared domain and host.
    </cds-modal-body-content>
    <div style="margin-bottom: 24px;">
      <cds-text-input
        data-modal-primary-focus
        placeholder="For example, GitHub.com"
        label="Domain name">
      </cds-text-input>
    </div>
    <div style="margin-bottom: 24px;">
      <cds-select placeholder="US South" label-text="Region">
        <cds-select-item value="us-south">US South</cds-select-item>
        <cds-select-item value="us-east">US East</cds-select-item>
      </cds-select>
    </div>
  </cds-modal-body>
  <cds-modal-footer>
    <cds-modal-footer-button kind="secondary">Cancel</cds-modal-footer-button>
    <cds-modal-footer-button kind="primary">Add</cds-modal-footer-button>
  </cds-modal-footer>
</cds-modal>
```

**Variant: DangerModal (destructive confirmation)**

```html
<cds-modal
  aria-label="Modal content"
  prevent-close-on-click-outside
  size=""
  open>
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-label>Account resources</cds-modal-label>
    <cds-modal-heading>Are you sure you want to delete this custom domain?</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body>
    <cds-modal-body-content>
      Check for dependencies on the domain before deletion. For instance, if
      the domain is used as a primary domain for users or if it's associated
      with critical applications or services, those connections will need to
      be removed or reconfigured first.
    </cds-modal-body-content>
  </cds-modal-body>
  <cds-modal-footer>
    <cds-modal-footer-button kind="secondary" data-modal-close>Cancel</cds-modal-footer-button>
    <cds-modal-footer-button kind="danger">Delete</cds-modal-footer-button>
  </cds-modal-footer>
</cds-modal>
```

**Variant: FullWidth (no body padding — for tables / pricing grids)**

```html
<cds-modal
  aria-label="Modal content"
  prevent-close-on-click-outside
  size=""
  open
  full-width>
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-label>An example of a modal with no padding</cds-modal-label>
    <cds-modal-heading>Full width modal</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body>
    <div style="margin-bottom: 48px;">
      <cds-structured-list>
        <cds-structured-list-head>
          <cds-structured-list-header-row>
            <cds-structured-list-header-cell>Default size</cds-structured-list-header-cell>
            <cds-structured-list-header-cell>Features</cds-structured-list-header-cell>
            <cds-structured-list-header-cell>Pricing</cds-structured-list-header-cell>
          </cds-structured-list-header-row>
        </cds-structured-list-head>
        <cds-structured-list-body>
          <cds-structured-list-row>
            <cds-structured-list-cell>Lite</cds-structured-list-cell>
            <cds-structured-list-cell>2 vCPUs | 4GB RAM</cds-structured-list-cell>
            <cds-structured-list-cell>$0.12 USD / hourly</cds-structured-list-cell>
          </cds-structured-list-row>
          <cds-structured-list-row>
            <cds-structured-list-cell>Graduated tier</cds-structured-list-cell>
            <cds-structured-list-cell>2 vCPUs | 8GB RAM</cds-structured-list-cell>
            <cds-structured-list-cell>$0.13 USD / hourly</cds-structured-list-cell>
          </cds-structured-list-row>
          <cds-structured-list-row>
            <cds-structured-list-cell>Premium</cds-structured-list-cell>
            <cds-structured-list-cell>4 vCPUs | 10GB RAM</cds-structured-list-cell>
            <cds-structured-list-cell>$0.20 USD / hourly</cds-structured-list-cell>
          </cds-structured-list-row>
        </cds-structured-list-body>
      </cds-structured-list>
    </div>
  </cds-modal-body>
  <cds-modal-footer>
    <cds-modal-footer-button kind="secondary" data-modal-close>Cancel</cds-modal-footer-button>
    <cds-modal-footer-button kind="primary">Add</cds-modal-footer-button>
  </cds-modal-footer>
</cds-modal>
```

**Variant: PassiveModal (no footer)**

```html
<cds-modal
  aria-label="Modal content"
  prevent-close-on-click-outside
  size=""
  open>
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-heading>You are now signed out.</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body></cds-modal-body>
</cds-modal>
```

**Variant: 3-button footer (Keep both / Rename / Add)**

```html
<cds-modal aria-label="Modal content" size="" open>
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-label>Account resources</cds-modal-label>
    <cds-modal-heading>A file with this name already exists</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body>
    <cds-modal-body-content description>
      Choose how you want to resolve this conflict.
    </cds-modal-body-content>
  </cds-modal-body>
  <cds-modal-footer>
    <cds-modal-footer-button kind="secondary">Keep both</cds-modal-footer-button>
    <cds-modal-footer-button kind="secondary">Rename</cds-modal-footer-button>
    <cds-modal-footer-button kind="primary">Replace</cds-modal-footer-button>
  </cds-modal-footer>
</cds-modal>
```

**Variant: WithScrollingContent**

```html
<cds-modal
  aria-label="Modal content"
  prevent-close-on-click-outside
  size=""
  open
  has-scrolling-content>
  <cds-modal-header>
    <cds-modal-close-button close-button-label="Close"></cds-modal-close-button>
    <cds-modal-label>Account Resources</cds-modal-label>
    <cds-modal-heading>Add a custom domain</cds-modal-heading>
  </cds-modal-header>
  <cds-modal-body>
    <cds-modal-body-content description>
      Custom domains direct requests for your apps in this Cloud Foundry
      organization to a URL that you own. A custom domain can be a shared
      domain, a shared subdomain, or a shared domain and host.
    </cds-modal-body-content>
    <cds-modal-body-content description style="margin-bottom: 2rem;">
      Domain mappings provide the URL route to your Code Engine application
      or function within a project.
    </cds-modal-body-content>
    <div style="margin-bottom: 24px;">
      <cds-text-input data-modal-primary-focus placeholder="For example, GitHub.com" label="Domain name"></cds-text-input>
    </div>
  </cds-modal-body>
  <cds-modal-footer>
    <cds-modal-footer-button kind="secondary">Cancel</cds-modal-footer-button>
    <cds-modal-footer-button kind="primary">Add</cds-modal-footer-button>
  </cds-modal-footer>
</cds-modal>
```

## Design Tokens (component-scoped)

Every Carbon theme resolves these semantic Modal tokens to the literal hex values shown. The four canonical themes (`White`, `G10`, `G90`, `G100`) are listed; the `.dark` selector mirrors `[data-theme="g100"]` for both-selector compatibility.

```css
[data-theme="white"] {
  /* Modal container — surface */
  --cds-modal-background: #ffffff;            /* layer (resolves to layer-01 = #f4f4f4 by default; modal sits on layer = #ffffff in White at root) */
  --cds-modal-border: #c6c6c6;                /* border-subtle-01 */
  --cds-modal-text: #161616;                  /* text-primary */
  --cds-modal-text-secondary: #525252;        /* text-secondary — for the modal label eyebrow */

  /* Overlay backdrop */
  --cds-modal-overlay: rgba(22, 22, 22, 0.5); /* overlay token */

  /* Close button (X) */
  --cds-modal-close-icon: #161616;            /* icon-primary */
  --cds-modal-close-hover-bg: #e8e8e8;        /* layer-hover */
  --cds-modal-close-focus-border: #0f62fe;    /* focus */

  /* Footer buttons — primary */
  --cds-modal-button-primary: #0f62fe;        /* button-primary (blue-60) */
  --cds-modal-button-primary-hover: #0050e6;  /* button-primary-hover */
  --cds-modal-button-primary-active: #002d9c; /* button-primary-active */

  /* Footer buttons — secondary */
  --cds-modal-button-secondary: #393939;      /* button-secondary (gray-80) */
  --cds-modal-button-secondary-hover: #4c4c4c;
  --cds-modal-button-secondary-active: #6f6f6f;

  /* Footer buttons — danger primary */
  --cds-modal-button-danger: #da1e28;         /* button-danger-primary (red-60) */
  --cds-modal-button-danger-hover: #b81921;   /* button-danger-hover (red-70) */
  --cds-modal-button-danger-active: #750e13;  /* button-danger-active (red-80) */

  /* Focus rings */
  --cds-modal-focus: #0f62fe;                 /* focus (blue-60) */
  --cds-modal-focus-inset: #ffffff;           /* focus-inset = background */

  /* AI variant — only when decorator/AI-label is attached */
  --cds-modal-ai-overlay: rgba(0, 0, 0, 0.5); /* ai-overlay */
  --cds-modal-ai-inner-shadow: rgba(69, 137, 255, 0.1);  /* ai-inner-shadow */
  --cds-modal-ai-drop-shadow: rgba(15, 98, 254, 0.1);    /* ai-drop-shadow */
}

[data-theme="g10"] {
  --cds-modal-background: #ffffff;            /* layer-01 = #ffffff in G10 (modal lifts white above the gray-10 page) */
  --cds-modal-border: #e0e0e0;                /* border-subtle-01 */
  --cds-modal-text: #161616;
  --cds-modal-text-secondary: #525252;

  --cds-modal-overlay: rgba(22, 22, 22, 0.5);

  --cds-modal-close-icon: #161616;
  --cds-modal-close-hover-bg: #e8e8e8;
  --cds-modal-close-focus-border: #0f62fe;

  --cds-modal-button-primary: #0f62fe;
  --cds-modal-button-primary-hover: #0050e6;
  --cds-modal-button-primary-active: #002d9c;

  --cds-modal-button-secondary: #393939;
  --cds-modal-button-secondary-hover: #4c4c4c;
  --cds-modal-button-secondary-active: #6f6f6f;

  --cds-modal-button-danger: #da1e28;
  --cds-modal-button-danger-hover: #b81921;
  --cds-modal-button-danger-active: #750e13;

  --cds-modal-focus: #0f62fe;
  --cds-modal-focus-inset: #f4f4f4;           /* focus-inset = background of g10 body */

  --cds-modal-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-modal-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-modal-ai-drop-shadow: rgba(15, 98, 254, 0.1);
}

[data-theme="g90"] {
  --cds-modal-background: #393939;            /* layer-01 in G90 */
  --cds-modal-border: #525252;                /* border-subtle-01 in G90 */
  --cds-modal-text: #f4f4f4;                  /* text-primary inverts in dark themes */
  --cds-modal-text-secondary: #c6c6c6;

  --cds-modal-overlay: rgba(0, 0, 0, 0.65);   /* deeper overlay in dark themes */

  --cds-modal-close-icon: #f4f4f4;
  --cds-modal-close-hover-bg: #4c4c4c;        /* layer-hover in G90 */
  --cds-modal-close-focus-border: #ffffff;    /* focus inverts to white */

  --cds-modal-button-primary: #0f62fe;
  --cds-modal-button-primary-hover: #0050e6;
  --cds-modal-button-primary-active: #002d9c;

  --cds-modal-button-secondary: #6f6f6f;      /* secondary lightens in dark themes */
  --cds-modal-button-secondary-hover: #5e5e5e;
  --cds-modal-button-secondary-active: #393939;

  --cds-modal-button-danger: #da1e28;
  --cds-modal-button-danger-hover: #b81921;
  --cds-modal-button-danger-active: #750e13;

  --cds-modal-focus: #ffffff;                 /* focus inverts to white in dark themes */
  --cds-modal-focus-inset: #262626;

  --cds-modal-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-modal-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-modal-ai-drop-shadow: rgba(0, 0, 0, 0.32);
}

[data-theme="g100"],
.dark {
  --cds-modal-background: #262626;            /* layer-01 in G100 */
  --cds-modal-border: #393939;                /* border-subtle-01 in G100 */
  --cds-modal-text: #f4f4f4;
  --cds-modal-text-secondary: #c6c6c6;

  --cds-modal-overlay: rgba(0, 0, 0, 0.65);

  --cds-modal-close-icon: #f4f4f4;
  --cds-modal-close-hover-bg: #333333;        /* layer-hover in G100 */
  --cds-modal-close-focus-border: #ffffff;

  --cds-modal-button-primary: #0f62fe;
  --cds-modal-button-primary-hover: #0050e6;
  --cds-modal-button-primary-active: #002d9c;

  --cds-modal-button-secondary: #6f6f6f;
  --cds-modal-button-secondary-hover: #5e5e5e;
  --cds-modal-button-secondary-active: #393939;

  --cds-modal-button-danger: #da1e28;
  --cds-modal-button-danger-hover: #b81921;
  --cds-modal-button-danger-active: #750e13;

  --cds-modal-focus: #ffffff;
  --cds-modal-focus-inset: #161616;           /* focus-inset = background of G100 body */

  --cds-modal-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-modal-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-modal-ai-drop-shadow: rgba(0, 0, 0, 0.32);
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/modal/_modal.scss`. Values resolved against the **White theme**; substitute the matching token from the Design Tokens block above for G10 / G90 / G100.

### `.cds--modal` (root overlay)

| State | Background | Position | Display | Other |
|---|---|---|---|---|
| Closed (initial) | `var(--cds-overlay)` (`rgba(22, 22, 22, 0.5)`) | `position: fixed; inset: 0` | `display: flex; align-items: center; justify-content: center` | `opacity: 0; visibility: hidden`; `block-size: 100vh; inline-size: 100vw`; `z-index: z('modal')` |
| Open (`.is-visible`) | (same overlay) | (same) | (same) | `opacity: 1; visibility: inherit`; transition `opacity 240ms motion(entrance, expressive)` |
| With AI-label decorator | `var(--cds-ai-overlay)` (`rgba(0, 0, 0, 0.5)`) | (same) | (same) | overlay swaps to `ai-overlay` token when `.cds--modal--slug` or `.cds--modal--decorator:has(.cds--ai-label)` is present |

### `.cds--modal-container` (modal card surface)

| State | Background | Border | Outline | Other |
|---|---|---|---|---|
| Rest | `var(--cds-layer)` (`#ffffff` White) | `1px solid var(--cds-border-subtle-01)` (`#c6c6c6`) | `3px solid transparent` (recipient for focus visible if applied), `outline-offset: -3px` | `position: fixed`; `display: grid`; `grid-template-rows: auto 1fr auto`; `inline-size: 100%` (mobile) / responsive widths above; `max-block-size: 100%` (mobile) / `90%` (md) / `84%` (lg) |
| Open animation start | (same) | (same) | (same) | `transform: translate3d(0, -24px, 0)` |
| Open animation end | (same) | (same) | (same) | `transform: translate3d(0, 0, 0)`, transition `240ms motion(entrance, expressive)` |
| Close animation | (same) | (same) | (same) | `transform: translate3d(0, 0, 0) → translate3d(0, -24px, 0)`, transition `240ms motion(exit, expressive)` |
| With AI-label decorator | `var(--cds-layer)` + AI gradient `::before` overlay | `1px solid transparent` + gradient outline | (same) | adds `box-shadow: inset 0 -80px 70px -65px var(--cds-ai-inner-shadow), 0 24px 40px -24px var(--cds-ai-drop-shadow)` |
| With AI-label + footer | (same) | (same) | (same) | shadow extends: `inset 0 -80px 0 -16px var(--cds-layer), inset 0 -160px 70px -65px var(--cds-ai-inner-shadow), 0 24px 40px -24px var(--cds-ai-drop-shadow)` |

### `.cds--modal-header`

| Property | Value |
|---|---|
| Grid placement | `grid-column: 1/-1; grid-row: 1/1` |
| Margin block end | `$spacing-03` (`8px`) |
| Padding block start | `$spacing-05` (`16px`) |
| Padding inline | `$spacing-05 $spacing-09` (`16px` start, `64px` end — leaves room for the close X) |
| Max block size | `50vh` |
| Overflow Y | `auto` |

### `.cds--modal-header__label` and `.cds--modal-header__heading`

| Element | Type-style | Color | Other |
|---|---|---|---|
| Label (eyebrow) | `label-01` (12px / 16px line-height / 400 weight) | `var(--cds-text-secondary)` (`#525252`) | `margin-block-end: $spacing-02` (`4px`) |
| Heading (title) | `heading-03` (20px / 28px line-height / 400 weight) | `var(--cds-text-primary)` (`#161616`) | `padding-inline-end: calc(20% - $spacing-09)` (extra runway so long titles don't collide with close X) |

### `.cds--modal-content` (body)

| State | Background | Color | Padding | Other |
|---|---|---|---|---|
| Rest | (transparent — inherits modal-container `--cds-layer`) | `var(--cds-text-primary)` (`#161616`) | `padding-block: $spacing-03 $spacing-09` (`8px` top / `64px` bottom for footer clearance); `padding-inline: $spacing-05 $spacing-05` (`16px`) | `type-style: body-01` (14px / 20px / 400); `font-weight: 400`; `position: relative`; `grid-row: 2/-2`; `overflow-y: auto` |
| Focus (when scrollable) | (same) | (same) | (same) | `outline: 2px solid var(--cds-focus)`, with the inset focus mixin |
| Body paragraph (`> p`) | (inherit) | (inherit) | `padding-inline-end: calc(20% - $spacing-07)` (`24px` reduction so paragraphs don't run too wide) | `type-style: body-01` |
| With form (`--with-form`) | (inherit) | (inherit) | `padding-inline-end: $spacing-05` (`16px`) | tighter end-inline padding when wrapping form fields |
| Full-width (`--full-width`) | (inherit) | (inherit) | `padding: 0; margin: 0` | strips ALL padding so child tables/lists butt to edges |
| Scrolling (`--scroll-content`) | (inherit) | (inherit) | (rest) | adds `border-block-end: 2px solid transparent` and a `mask-image` linear-gradient that fades the bottom 80px of content (signals "more below"); `> *:last-child { margin-block-end: $spacing-06 }` (`24px`) |

### `.cds--modal-footer`

| Property | Value |
|---|---|
| Display | `flex` |
| Justify | `flex-end` |
| Block size | `64px` (`4rem`) |
| Grid placement | `grid-column: 1/-1; grid-row: -1/-1` |
| Margin block start | `auto` |

### `.cds--modal-footer .cds--btn` (footer buttons)

| State | Flex | Block size | Padding | Other |
|---|---|---|---|---|
| 2-button rest | `0 1 50%` | `64px` | `padding-block: calc($spacing-05 - 2px) $spacing-07` (`14px` top / `32px` bottom) | `align-items: baseline`; `margin: 0`; `max-inline-size: none`; **NO gap** between buttons (visually flush) |
| 3-button rest | `0 1 25%` | `64px` | (same) | `align-items: flex-start` (text top-aligns within the taller button hit area) |
| Primary | `var(--cds-button-primary)` (`#0f62fe`) bg, `#ffffff` text | (same) | (same) | sits on the right (justify-content: flex-end pushes it last) |
| Primary hover | `var(--cds-button-primary-hover)` (`#0050e6`) | (same) | (same) | `transition: background 70ms motion(standard, productive)` |
| Primary active | `var(--cds-button-primary-active)` (`#002d9c`) | (same) | (same) | — |
| Primary focus-visible | (rest bg) | (same) | (same) | `box-shadow: inset 0 0 0 2px var(--cds-focus)` + `inset 0 0 0 3px var(--cds-focus-inset)` (Carbon's signature double-ring) |
| Primary disabled | `var(--cds-button-disabled)` (`#c6c6c6`) | (same) | (same) | `cursor: not-allowed` |
| Secondary | `var(--cds-button-secondary)` (`#393939`) bg, `#ffffff` text | (same) | (same) | sits to the left of primary |
| Secondary hover | `var(--cds-button-secondary-hover)` (`#4c4c4c`) | (same) | (same) | — |
| Secondary active | `var(--cds-button-secondary-active)` (`#6f6f6f`) | (same) | (same) | — |
| Danger primary (`kind="danger"`) | `var(--cds-button-danger-primary)` (`#da1e28`) bg, `#ffffff` text | (same) | (same) | only used when modal is in danger mode |
| Danger hover | `#b81921` (red-70) | (same) | (same) | — |
| Danger active | `#750e13` (red-80) | (same) | (same) | — |

### `.cds--modal-close` (close X button)

| State | Background | Border | Block size | Inline size | Other |
|---|---|---|---|---|---|
| Rest | `transparent` | `2px solid transparent` | `3rem` (`48px`) | `3rem` (`48px`) | `padding: 12px`; `cursor: pointer`; `position: absolute; inset-block-start: 0; inset-inline-end: 0`; `transition: background-color 110ms motion(standard, productive)` |
| Hover | `var(--cds-layer-hover)` (`#e8e8e8` White / `#333333` G100) | `2px solid transparent` | (same) | (same) | — |
| Focus | (rest) | `2px solid var(--cds-focus)` (`#0f62fe` light / `#ffffff` dark) | (same) | (same) | `outline: none` — the colored border IS the focus ring on the close X (unique to this control) |

The close X icon itself: `block-size: 1.25rem` (`20px`) × `inline-size: 1.25rem` (`20px`), `fill: var(--cds-icon-primary)` (`#161616` light / `#f4f4f4` dark).

### Size variants — `.cds--modal-container--{xs,sm,md,lg}`

The modal width is responsive **per breakpoint** (`md = 672px`, `lg = 1056px`, `xlg = 1312px`) within each size variant. From the SCSS:

| Size | mobile | md (≥672px) | lg (≥1056px) | xlg (≥1312px) | max-block-size override |
|---|---|---|---|---|---|
| `xs` | `inline-size: 100%` | `48%` | `32%` | `24%` | lg: `48%` |
| `sm` | `100%` | `60%` | `42%` | `36%` | lg: `72%` |
| `md` (default) | `100%` | `84%` | `60%` | `48%` | md: `90%`, lg: `84%` |
| `lg` | `100%` | `96%` | `84%` | `72%` | lg: `96%` |

Body text wrap also tightens per-size: `xs` and `sm` paragraphs get `padding-inline-end: 0` (mobile) / `padding-inline-end: 20%` (lg+), so titles/copy don't run too wide on the smaller cards.

### `.cds--body--with-modal-open` (page lock)

Carbon adds `.cds--body--with-modal-open` to `<body>` whenever any modal is open. This sets `overflow: hidden` so the body cannot scroll while the modal is up. Inner overflow-menus and tooltips inside the modal get bumped to `z-index: z('modal')` so they sit above the modal-container itself.

## Animation & Motion

Carbon's source uses these motion tokens for Modal (extracted from `_modal.scss`):

```css
/* Overlay fade-in/out + container slide */
.cds--modal {
  opacity: 0;
  visibility: hidden;
  transition:
    opacity var(--cds-duration-moderate-02) var(--cds-easing-expressive-exit),
    visibility 0ms linear var(--cds-duration-moderate-02);
  /* duration-moderate-02 = 240ms; easing-expressive-exit = cubic-bezier(0.4, 0.14, 1, 1) */
}

.cds--modal.is-visible {
  opacity: 1;
  visibility: inherit;
  transition:
    opacity var(--cds-duration-moderate-02) var(--cds-easing-expressive-entrance),
    visibility 0ms linear;
  /* easing-expressive-entrance = cubic-bezier(0, 0, 0.3, 1) */
}

.cds--modal-container {
  transform: translate3d(0, -24px, 0);
  transition: transform var(--cds-duration-moderate-02) var(--cds-easing-expressive-exit);
}

.cds--modal.is-visible .cds--modal-container {
  transform: translate3d(0, 0, 0);
  transition: transform var(--cds-duration-moderate-02) var(--cds-easing-expressive-entrance);
}

/* Presence-API alternate: explicit @keyframes + animation forwards */
@keyframes cds--presence-modal__enter {
  from { opacity: 0; }
  to   { opacity: 1; }
}

@keyframes cds--presence-modal__exit {
  from { opacity: 1; }
  to   { opacity: 0; }
}

@keyframes cds--presence-modal-container__enter {
  from { transform: translate3d(0, -24px, 0); }
  to   { transform: translate3d(0, 0, 0); }
}

@keyframes cds--presence-modal-container__exit {
  from { transform: translate3d(0, 0, 0); }
  to   { transform: translate3d(0, -24px, 0); }
}

/* Close X — fast hover */
.cds--modal-close {
  transition: background-color var(--cds-duration-fast-02) var(--cds-easing-productive-standard);
  /* duration-fast-02 = 110ms; easing-productive-standard = cubic-bezier(0.2, 0, 0.38, 0.9) */
}

/* Reduced-motion override — Carbon respects user preference */
@media screen and (prefers-reduced-motion: reduce) {
  .cds--modal,
  .cds--modal.is-visible,
  .cds--modal-container,
  .cds--modal.is-visible .cds--modal-container {
    transition: none;
  }
}
```

**Why expressive-entrance for Modal?** Per the overview's motion ladder: Modal/dialog open uses `moderate-02` (240ms) + `expressive-entrance` because it's a "large surface entrance where the motion *is* the moment" — distinct from productive UI feedback (button hover at 70ms, dropdown at 110ms). The 24px upward translate gives the modal a sense of landing into the viewport rather than just appearing.

The two entrance/exit easings are deliberately different:
- **Entrance** (`cubic-bezier(0, 0, 0.3, 1)`) starts immediately at full speed and decelerates — content arrives confidently and settles.
- **Exit** (`cubic-bezier(0.4, 0.14, 1, 1)`) accelerates away — once the user dismisses, get out of the way fast.

## Accessibility (from Carbon's docs + source)

- **Semantic elements:**
  - `<cds-modal>` (and React `<Modal>` / `<ComposedModal>`) renders a `<div role="dialog">` with `aria-modal="true"` set when `open`. The modal container is the dialog; the overlay is decorative.
  - `<cds-modal-close-button>` renders a real `<button type="button">` (NOT a `<div>` with click handlers).
  - `<cds-modal-footer-button>` renders a `<cds-button>` (which itself renders a `<button>`) — `kind="primary" | "secondary" | "danger" | "ghost" | "tertiary"` matches the standard Button API.

- **ARIA Carbon's source applies:**
  - `role="dialog"` — set automatically on the modal-container.
  - `aria-modal="true"` — set automatically when `open`. Tells assistive tech that the rest of the page is inert.
  - `aria-label` (on `<cds-modal>` / `<Modal aria-label="...">`) — REQUIRED. The dialog must announce its purpose. If the modal has a visible heading, use `aria-labelledby` to point at that heading instead; otherwise provide `aria-label`.
  - `aria-labelledby` — Carbon's React `Modal` will auto-set this to the heading element when both are present.
  - `aria-describedby` — pass on the modal if a paragraph in the body should be announced as the description.
  - `close-button-label` (WC) / `closeButtonLabel` (React, default `"Close"`) — accessible label for the X button. Always pass this even if the icon is "obvious" — screen readers need text.
  - `data-modal-primary-focus` — on the first focusable input inside the body, marks it as the receiving focus when the modal opens. If absent, focus lands on the modal-container itself.
  - `data-modal-close` — on a footer button (or any inner element), instructs Carbon to close the modal when that element is clicked. Used to wire the secondary "Cancel" button to the same dismiss flow as the X.

- **Keyboard:**
  - `Tab` / `Shift+Tab` — cycles focus among the modal's interactive children. **Focus is trapped** — Tab from the last interactive child wraps to the first, never escaping the modal.
  - `Escape` — closes the modal (calls `onRequestClose` / `onClose` / dispatches `cds-modal-closed` event).
  - `Enter` — when `should-submit-on-enter` (WC) / `shouldSubmitOnEnter` (React) is set, Enter from any input acts as a click on the primary footer button (form-submit behavior).
  - `Space` — activates the focused button (close X, primary, secondary).
  - **Click outside** — closes the modal UNLESS `prevent-close-on-click-outside` (WC) / `preventCloseOnClickOutside` (React) is set. Per `defaultArgs`, the WC stories ship `preventCloseOnClickOutside: true` — the recommended default, since click-outside is easy to trigger accidentally.

- **Focus management:**
  - On `open`, focus moves to the element matching `data-modal-primary-focus` (or, if absent, to the modal-container with `tabindex="-1"`).
  - On `close`, focus returns to the launcher — pass `launcherButtonRef={ref}` (React) to point Carbon at the trigger button so focus snaps back. WC mirrors this via the launcher's outer `cds-button` reference.
  - The signature double-ring focus style (`outline: 2px solid var(--cds-focus)` + `box-shadow: inset 0 0 0 1px var(--cds-background)`) applies to focusable children. The close X is the exception — its focus is communicated via a colored `border: 2px solid var(--cds-focus)` (no outline, no inset).
  - `.cds--body--with-modal-open` adds `overflow: hidden` to `<body>` so the page underneath cannot scroll. Inner overflow-menus + tooltips get `z-index: z('modal')` so they layer above the dialog.

- **Touch target:** Close X is `48px × 48px` (3rem) — comfortably above WCAG 2.5.5 minimum (24px) and Apple/Google touch-target recommendation (44-48px). Footer buttons are `64px` tall — even more generous, and they each occupy half (or a quarter) of the modal's width, so the click area is huge.

- **Color contrast:** Heading (`#161616` on `#ffffff` White) is 16.05:1 — WCAG AAA. Label/eyebrow (`#525252` on `#ffffff`) is 7.46:1 — passes AAA for normal text. Primary button (`#ffffff` on `#0f62fe`) is 4.62:1 — passes AA for UI components and large text. Danger button (`#ffffff` on `#da1e28`) is 4.83:1 — passes AA. In G100, all pairings invert and stay above WCAG AA.

- **Scrolling content + AAA hidden affordance:** when `has-scrolling-content` is set, Carbon adds a CSS `mask-image` linear-gradient to the bottom 80px of the body content. This visually fades content as it approaches the bottom edge, signalling there's more below. Pair this with proper `tabindex="-1"` on the scrollable region (Carbon does this automatically) so keyboard users can scroll with arrow keys.

- **AI variant accessibility:** when `decorator={<AILabel>}` is passed, the AI Label popover trigger appears in the header — it must have its own accessible name (`aria-label="AI Label"` — Carbon applies this automatically). The AI gradient outline is purely decorative (no `aria-*`); screen readers announce only the dialog + heading + body + label, not the visual aura.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — copy the imports, copy the `(args) =>` / `({...})` signatures, copy the prop bindings | Don't paraphrase or rewrite — the verbatim Storybook code IS the spec; modifications drift away from Carbon |
| Sharp corners (`border-radius: 0`) on every Modal variant | Don't add `border-radius: 4px` / `8px` — that's Material/Apple. Carbon Modal corners are SHARP; the only legitimate radius is on the AI-decorator gradient outline (which Carbon's mixin handles for you) |
| Footer buttons stretch to **half-width** (`flex: 0 1 50%`), sit **flush against each other** with NO gap, primary on the right | Don't add `gap: 8px` between footer buttons; don't make them fixed-width; don't put the primary on the left. The flush-touching footer is Carbon's most distinctive Modal signature — breaking it makes the modal not look like Carbon |
| Use `<Modal>` (one component, all props in one place) for transactional flows where you want convenience props (`primaryButtonText`, `secondaryButtonText`, `danger`, `passiveModal`) | Don't use `<Modal>` when you need a custom header/body/footer layout — drop down to `<ComposedModal>` + `<ModalHeader>` + `<ModalBody>` + `<ModalFooter>` for slot-level control |
| Use `<ComposedModal>` for fully custom dialogs — you control which slots render and what's inside each | Don't bypass ComposedModal slots and manually construct `<div class="cds--modal-header">` etc. — you'll lose the focus-trap wiring and the shared SCSS hooks |
| Use `passiveModal` for status acknowledgements with no actions (e.g., "You are signed out") — user dismisses via close X | Don't use a passive modal as a "fancy alert" with implicit Cancel — passive modals have NO footer, so any required action must be in the body itself (which is bad pattern). Use Notification instead |
| Use `danger` flag for destructive confirmations — primary button swaps to red-60 (`#da1e28`) | Don't recolor the primary button manually with `style={{background: 'red'}}` — `danger` triggers the entire danger token cascade (hover, active, focus) correctly. Manual recolor gets one state and breaks the rest |
| Use `hasScrollingContent` when body content might exceed the modal's max-height — Carbon adds the bottom-fade mask + scroll affordance | Don't let body content overflow without `hasScrollingContent` — the modal will still scroll, but the user gets no visual cue that there's more below |
| Use `isFullWidth` for tables, structured lists, pricing grids — body padding strips to 0 so children butt to the edges | Don't use `isFullWidth` for forms — the forms expect the standard 16px inline padding; full-width forms look unfinished |
| Pass `data-modal-primary-focus` on the first input inside the body — focus lands there on open | Don't omit it for forms — focus will land on the modal-container itself, requiring the user to Tab into the form. Bad UX |
| Pass `launcherButtonRef={ref}` so focus returns to the trigger on close | Don't omit it — focus will return to `<body>`, breaking the user's keyboard flow. Required for accessibility |
| Pass `aria-label` (or rely on auto-`aria-labelledby` from `modalHeading`) on every modal | Don't ship a modal with no accessible name — screen readers will announce "dialog" with no context |
| Pass `closeButtonLabel="Close"` (default) or a localized string — never an empty string | Don't ship `closeButtonLabel=""` — the X button becomes anonymous to screen readers |
| Default `preventCloseOnClickOutside: true` for all transactional modals | Don't allow click-outside-to-close on forms with unsaved input — users will lose data accidentally. Reserve click-outside-close for passive/informational modals |
| Render the launcher button OUTSIDE the modal — wrap both in the same parent | Don't render the launcher INSIDE the modal — it disappears when the modal closes, breaking the re-open flow |
| Wrap your page in `[data-theme="white"]`, `[data-theme="g10"]`, `[data-theme="g90"]`, or `[data-theme="g100"]` | Don't define your own theme classes — the four official themes are all Carbon ships, and the `--cds-*` tokens already invert correctly inside them |
| Keep the focus rings intact (close X: `border: 2px solid var(--cds-focus)`; footer buttons: signature double-ring; modal-content: outline when scrollable) | Don't `outline: none` anywhere — you'll fail WCAG 2.4.7 |
| Honor `prefers-reduced-motion: reduce` — the SCSS already disables the slide + fade transitions for users who request reduced motion | Don't add custom `transform`, `scale`, or `rotate` animations on the modal-container — Carbon's expressive motion is restricted to translateY + opacity. Anything else breaks the system's motion language |
| Use the WC `data-modal-close` attribute on the secondary "Cancel" button so click handling routes through Carbon's dismiss flow | Don't bind your own `onClick={() => setOpen(false)}` to a button when `data-modal-close` would do the same job — you bypass Carbon's lifecycle events (`onRequestClose`, `cds-modal-closed`) |
| Use `cds--*` class names from the WC source (or rely on the React shadow-DOM styling) | Don't invent your own classes (`.my-dialog`, `.popup-card`) — Carbon's tokens won't bind to them, and your modal will not look like Carbon |
