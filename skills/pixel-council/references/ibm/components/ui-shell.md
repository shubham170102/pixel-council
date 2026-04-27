---
name: ui-shell
description: Carbon UIShell — the full app-shell composite that frames every Carbon product UI. A 48px fixed `Header` across the top (hamburger + product name + top-nav + global-actions row), a 256px-wide collapsible `SideNav` on the left (or 48px Rail with hover-expand), an optional right-aligned `HeaderPanel` drawer (320px), and an `App Switcher` dropdown for cross-product navigation. Variants: HeaderBase, HeaderBaseWActions, HeaderBaseWActionsRightPanel, HeaderBaseWActionsSwitcher, HeaderBaseWNavigation, HeaderBaseWNavigationActions, HeaderBaseWNavigationActionsAndSideNav, HeaderBaseWSideNav, HeaderBaseWSkipToContent, HeaderWNavigation, HeaderWNavigationAndActions, HeaderWNavigationActionsAndSideNav, HeaderWSideNav, HeaderWActionsAndRightPanel, HeaderWActionsAndSwitcher, FixedSideNav, FixedSideNavWIcons, FixedSideNavWDivider, SideNavRail, SideNavRailWHeader, SideNavWLargeSideNavItems.
metadata:
  tags: ui-shell, app-shell, header, side-nav, sidenav, global-action, switcher, header-panel, navigation, app-bar, drawer, rail, persistent-nav, ibm, carbon, react, web-components, enterprise
---

# UIShell -- IBM Carbon Design System

> Source (verbatim Storybook code embedded below):
> - **React story (Header):** [`UIShell.HeaderBase.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/UIShell/UIShell.HeaderBase.stories.js)
> - **React story (SideNav):** [`UIShell.SideNav.stories.js`](https://github.com/carbon-design-system/carbon/blob/main/packages/react/src/components/UIShell/UIShell.SideNav.stories.js)
> - **WC story:** [`ui-shell.stories.ts`](https://github.com/carbon-design-system/carbon/blob/main/packages/web-components/src/components/ui-shell/ui-shell.stories.ts)
> - **SCSS — header:** [`_header.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/ui-shell/header/_header.scss)
> - **SCSS — side-nav:** [`_side-nav.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/ui-shell/side-nav/_side-nav.scss)
> - **SCSS — header-panel:** [`_header-panel.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/ui-shell/header-panel/_header-panel.scss)
> - **SCSS — switcher:** [`_switcher.scss`](https://github.com/carbon-design-system/carbon/blob/main/packages/styles/scss/components/ui-shell/switcher/_switcher.scss)
> - **Storybook live (React Header):** https://react.carbondesignsystem.com/?path=/story/components-ui-shell-header--header-w-navigation
> - **Storybook live (React SideNav):** https://react.carbondesignsystem.com/?path=/story/components-ui-shell-sidenav--fixed-side-nav
> - **Storybook live (WC):** https://web-components.carbondesignsystem.com/?path=/story/components-ui-shell--header-base
> - **Docs page (Header):** https://v11.carbondesignsystem.com/components/UI-shell-header/usage/
> - **Docs page (SideNav):** https://v11.carbondesignsystem.com/components/UI-shell-left-panel/usage/
> - **License:** Apache 2.0 — embedded source code is reproduced verbatim under that license

UIShell is Carbon's full **app-shell composite**. It is not one component — it is the framing chrome that every Carbon product UI sits inside. Conceptually it is to Carbon what the menu bar + dock is to MacOS, or what `<MaterialAppBar>` + `<NavigationDrawer>` is to Material Design — except Carbon ships them as one tightly-integrated system with shared focus, shared `[Tab]` order, and shared responsive collapse rules.

The shell has **three structural slots**:

1. **`Header`** — a 48px-tall fixed bar across the top, containing (in left-to-right order) the hamburger toggle (`HeaderMenuButton`), product branding (`HeaderName` with optional `prefix="IBM"`), the top-nav row (`HeaderNavigation` → `HeaderMenuItem` / `HeaderMenu`), and the right-aligned global-actions row (`HeaderGlobalBar` → `HeaderGlobalAction` icon buttons for search, notification, user menu, app switcher).
2. **`SideNav`** — the left vertical navigation. Three modes: **default** (256px-wide drawer that overlays content on small screens, persists on large), **rail** (48px-wide collapsed strip that expands to 256px on hover/focus), and **fixed** (always 256px-wide, no collapse). Items are `SideNavLink` (single link) or `SideNavMenu` → `SideNavMenuItem` (collapsible category).
3. **`HeaderPanel`** — a right-aligned drawer (320px wide) that slides out from the right edge for notifications, user menu, or the cross-product `Switcher`.

Carbon's shell uses **flat tonal layering, not shadows**. The header sits on `background` (white `#ffffff` in White theme, gray-100 `#161616` in G100), divided from content by a single `1px solid border-subtle-00` border. Active global-action buttons get a `layer-01` tint (`#f4f4f4` White / `#262626` G100). Active sidenav items get a 3px-wide `border-interactive` (blue-60 `#0f62fe` in light, blue-50 `#4589ff` in dark) accent on their left edge. Border-radius is `0` everywhere.

The shell is responsive by design: on screens narrower than `lg` (1056px), `SideNav` collapses to width:0 and the hamburger toggle slides it in as an overlay over the content; on rail mode it stays as 48px and expands on hover.

## Quick Reference

| Property | Value |
|---|---|
| **Header** — height | `48px` (`mini-units(6)` = `3rem`) |
| **Header** — position | `fixed; inset-block-start: 0; inset-inline: 0;` |
| **Header** — z-index | `z('header')` (Carbon's header layer) |
| **Header** — background | `var(--cds-background)` (`#ffffff` White / `#161616` G100) |
| **Header** — border-bottom | `1px solid var(--cds-border-subtle-00)` (`#e0e0e0` White / `#393939` G100) |
| **HeaderName** — typography | `body-compact-01` `400` weight + bold `prefix` segment, `padding: 0 spacing-05` (16px), `border: 2px solid transparent` for focus |
| **HeaderName** — text color | `var(--cds-text-primary)` (`#161616` White / `#f4f4f4` G100) |
| **HeaderMenuItem** — height | full Header height (`48px`) |
| **HeaderMenuItem** — padding | `0 mini-units(2)` (`0 16px`) |
| **HeaderMenuItem** — text color (rest) | `var(--cds-text-secondary)` (`#525252` White / `#c6c6c6` G100) |
| **HeaderMenuItem** — text color (hover) | `var(--cds-text-primary)` (`#161616` White / `#f4f4f4` G100) |
| **HeaderMenuItem** — background hover | `var(--cds-background-hover)` (`rgba(141,141,141,0.12)` White) |
| **HeaderMenuItem** — current-page accent | `3px` bottom bar via `::before`, `background: var(--cds-border-interactive)` (`#0f62fe` White / `#4589ff` G100) |
| **HeaderGlobalAction** — size | `48px × 48px` (`mini-units(6)`) |
| **HeaderGlobalAction** — icon size | `20px × 20px` (`Search20`, `Notification20`, `Switcher20`) |
| **HeaderGlobalAction** — icon fill (rest) | `var(--cds-icon-secondary)` (`#525252` White / `#c6c6c6` G100) |
| **HeaderGlobalAction** — icon fill (hover/active) | `var(--cds-icon-primary)` (`#161616` White / `#f4f4f4` G100) |
| **HeaderGlobalAction** — background hover | `var(--cds-background-hover)` |
| **HeaderGlobalAction** — background active | `var(--cds-layer-01)` (`#f4f4f4` White / `#262626` G100) + `1px` side borders |
| **HeaderGlobalAction** — focus | `border: 1px solid var(--cds-focus)` (`#0f62fe` White / `#ffffff` G100), `outline: none` |
| **SideNav** — expanded width | `256px` (`mini-units(32)` = `16rem`) |
| **SideNav** — rail width (collapsed) | `48px` (`mini-units(6)` = `3rem`) |
| **SideNav** — hidden width | `0` |
| **SideNav** — position | `fixed; inset-block: 0; inset-inline-start: 0;` (when child of `Header`, `inset-block-start: spacing-09` = `48px` to clear header) |
| **SideNav** — background | `var(--cds-background)` (`#ffffff` White / `#161616` G100) |
| **SideNav** — text color | `var(--cds-text-secondary)` (`#525252` White / `#c6c6c6` G100) |
| **SideNav** — transition | `inline-size 0.11s cubic-bezier(0.2, 0, 1, 0.9), transform 0.11s cubic-bezier(0.2, 0, 1, 0.9)` |
| **SideNav** — z-index | `z('header')` |
| **SideNavMenu / SideNavLink** — height (default) | `32px` (`mini-units(4)`) |
| **SideNavMenu / SideNavLink** — height (large) | `48px` (`mini-units(6)`) |
| **SideNavMenuItem** — height | `32px` (`mini-units(4)`) |
| **SideNavMenuItem** — padding | `padding-inline-start: mini-units(4)` = `32px` (or `mini-units(9)` = `72px` when nested under icon menu) |
| **SideNav item** — padding (link, no icon) | `0 mini-units(2)` = `0 16px` |
| **SideNav item** — background hover | `var(--cds-background-hover)` (`rgba(141,141,141,0.12)` White / `rgba(141,141,141,0.16)` G100) |
| **SideNav item** — background selected (active) | `var(--cds-background-selected)` (`rgba(141,141,141,0.2)` White / `rgba(141,141,141,0.24)` G100) |
| **SideNav active item** — left accent bar | `3px` wide `var(--cds-border-interactive)` (`#0f62fe` White / `#4589ff` G100) absolute-positioned on left edge |
| **SideNav** — focus outline | `2px solid var(--cds-focus)` (inset, via `focus-outline('outline')` mixin) |
| **SideNav icon** — size | `16px × 16px` (`Fade16`) |
| **SideNav submenu chevron** — size | `16px × 16px`, rotates `180°` on `aria-expanded='true'` |
| **SideNavDivider** — height | `1px`, `background: var(--cds-border-subtle-00)`, `margin: spacing-03 0` |
| **HeaderPanel** — width (collapsed) | `0` |
| **HeaderPanel** — width (expanded) | `256px` (`mini-units(32)`) |
| **HeaderPanel** — position | `fixed; inset-block: mini-units(6) 0; inset-inline-end: 0;` (sits below header, full height) |
| **HeaderPanel** — background | `var(--cds-layer-01)` (`#f4f4f4` White / `#262626` G100) |
| **HeaderPanel** — text color | `var(--cds-text-secondary)` |
| **HeaderPanel** — border (expanded) | `1px solid var(--cds-border-subtle-00)` on inline-start + inline-end |
| **HeaderPanel** — transition | `width var(--cds-duration-fast-02) motion(exit, productive)` (`110ms cubic-bezier(0.2, 0, 1, 0.9)`) |
| **Switcher item** — height | `48px` (`spacing-07`) |
| **Switcher item link** — typography | `heading-compact-01` (`14px / 18px / 600`), `padding: 6px spacing-05` (`6px 16px`) |
| **Switcher item** — background hover | `var(--cds-layer-hover-01)` (`#e8e8e8` White / `#333333` G100) |
| **Switcher item** — background selected | `var(--cds-layer-selected-01)` (`#e0e0e0` White / `#393939` G100) |
| **SwitcherDivider** — dimensions | `224px × 1px`, `margin: spacing-03 spacing-05` (`8px 16px`), `background: var(--cds-border-subtle-00)` |
| **Overlay (mobile sidenav backdrop)** | `100vw × 100vh`, `background: var(--cds-overlay)` (`rgba(22,22,22,0.5)` White / `rgba(0,0,0,0.65)` G100) |
| **SkipToContent** — focus position | `top: 0; left: 0`, `padding: 0 1rem`, `border: 4px solid var(--cds-focus)`, `background: var(--cds-background)`, `color: var(--cds-text-secondary)` |
| Corner radius (entire shell) | `0` (Carbon: sharp by default — Header, SideNav, HeaderPanel, Switcher, all action buttons) |
| Font | IBM Plex Sans, `body-compact-01` (`14px / 18px / 400`) for nav items |
| Focus ring (interactive elements) | `1-2px solid var(--cds-focus)` (`#0f62fe` White / `#ffffff` G100), inset where space-constrained |
| Responsive collapse breakpoint | `lg` (1056px) — below `lg`, default SideNav becomes `width: 0` and toggles via hamburger as overlay |
| React import | `import { Header, HeaderContainer, HeaderMenuButton, HeaderName, HeaderNavigation, HeaderMenu, HeaderMenuItem, HeaderGlobalBar, HeaderGlobalAction, HeaderPanel, HeaderSideNavItems, SkipToContent, SideNav, SideNavDivider, SideNavItems, SideNavLink, SideNavMenu, SideNavMenuItem, Switcher, SwitcherItem, SwitcherDivider, Content } from '@carbon/react';` |
| WC import | `import '@carbon/web-components/es/components/ui-shell/index.js';` |

## Variants (from Storybook story exports)

UIShell ships **two React story files** (one for the Header family, one for the SideNav family) and **one WC story file** that consolidates everything. Below is the full export inventory across both libraries.

### React story exports (`UIShell.HeaderBase.stories.js`)

| Variant | Story export | Purpose |
|---|---|---|
| Header w/ Navigation | `HeaderWNavigation` | Header + hamburger + `HeaderName` + `HeaderNavigation` (4 top-nav links incl. one `HeaderMenu` dropdown). Hamburger toggles `SideNav` containing the same nav repeated as `HeaderSideNavItems` (small-screen mirror). Canonical "platform with top nav" baseline. |
| Header w/ Navigation and Actions | `HeaderWNavigationAndActions` | Adds `HeaderGlobalBar` with three `HeaderGlobalAction`s (Search, Notification, App Switcher icons) to the right of the nav. Default for IBM Cloud-style product headers. |
| Header w/ Navigation, Actions and SideNav | `HeaderWNavigationActionsAndSideNav` | Full-house example: hamburger + name + top-nav + global actions + persistent left `SideNav` containing `HeaderSideNavItems` divider, three `SideNavMenu` categories (one `isActive`), and two standalone `SideNavLink`s. The most complete shell layout. |
| Header w/ SideNav | `HeaderWSideNav` | Header + hamburger + name + `SideNav` only (no top-nav, no global actions). For dashboard products where left-rail navigation dominates. |
| Header w/ Actions and Right Panel | `HeaderWActionsAndRightPanel` | Header + name + global actions, with the Notification action toggling a `HeaderPanel` (right-aligned drawer). Demonstrates `badgeCount` prop for unread count, `togglePanel`/`closePanel`/`handleKeyDown` (Escape) state pattern. |
| Header w/ Actions and Switcher | `HeaderWActionsAndSwitcher` | Header + global actions + the App Switcher icon toggles a `HeaderPanel` containing a `Switcher` with `SwitcherItem`s (Link 1-6) split by `SwitcherDivider`s. The cross-product navigation pattern. |

### React story exports (`UIShell.SideNav.stories.js`)

| Variant | Story export | Purpose |
|---|---|---|
| Fixed SideNav | `FixedSideNav` | `<SideNav isFixedNav expanded isChildOfHeader={false}>` — always-256px-wide left nav that does not collapse. Three `SideNavMenu` categories ("L0 menu") with `SideNavMenuItem` children, plus two standalone `SideNavLink`s. Use when navigation depth requires permanent visibility. |
| Fixed SideNav w/ Icons | `FixedSideNavWIcons` | Same as Fixed SideNav but each `SideNavMenu` and `SideNavLink` declares `renderIcon={Fade}` for the leading 16px category icon. The icon-led pattern most product dashboards use. |
| Fixed SideNav w/ Divider | `FixedSideNavWDivider` | Adds a `<SideNavDivider />` separating the menu group from the standalone links — visual grouping inside the rail. |
| SideNav Rail w/ Header | `SideNavRailWHeader` | The **Rail** mode: `<SideNav isRail>` collapses to `48px` showing only icons. Hovering or focusing expands to `256px` with full labels. Combined with a Header that has hamburger + top-nav + global actions; when the hamburger expands the SideNav, `HeaderSideNavItems` are rendered inside it. The space-saving default for data-dense apps. |
| SideNav w/ large side nav items | `SideNavWLargeSideNavItems` | Each `SideNavMenu` and `SideNavLink` has the `large` prop, doubling row height to `48px` for chunkier touch targets. Used in tablet-leaning experiences and "settings"-style hierarchical navigation. |

### Web Components story exports (`ui-shell.stories.ts`)

| Variant | Story export | Purpose |
|---|---|---|
| Header Base | `HeaderBase` | Bare `<cds-header>` + `<cds-header-name>` only. The minimum viable shell. |
| Header Base w/ Actions | `HeaderBaseWActions` | Adds `<div class="cds--header__global">` containing three `<cds-header-global-action>`s (Search, Notification, App Switcher). `tooltipAlignment="right"` aligns the right-most tooltip to the screen edge. |
| Header Base w/ Actions and Right Panel | `HeaderBaseWActionsRightPanel` | Adds `<cds-header-panel id="notification-panel">` linked via `panel-id="notification-panel"` on the Notification action. Includes `<cds-badge-indicator count=${badgeCount}>` — the experimental badge for unread count (controllable via Storybook `args.badgeCount`). |
| Header Base w/ Actions and Switcher | `HeaderBaseWActionsSwitcher` | App Switcher icon's `panel-id="switcher-panel"` opens a `<cds-header-panel>` containing `<cds-switcher>` + `<cds-switcher-item>`s + `<cds-switcher-divider>`s. The cross-product launcher. |
| Header Base w/ Navigation, Actions and SideNav | `HeaderBaseWNavigationActionsAndSideNav` | Full shell — `<cds-header-menu-button>` + `<cds-header-name>` + `<cds-header-nav>` (with `<cds-header-menu>` dropdown) + global actions div + `<cds-side-nav>` with `collapse-mode="responsive"`. |
| Header Base w/ Navigation and Actions | `HeaderBaseWNavigationActions` | Adds top-nav and global actions; uses `is-not-persistent` SideNav (only visible when expanded). |
| Header Base w/ Navigation | `HeaderBaseWNavigation` | Header + hamburger + name + top-nav + collapsible non-persistent SideNav. The `is-active` attribute on `<cds-header-menu-item>` marks the current page. |
| Header Base w/ SideNav | `HeaderBaseWSideNav` | Header + hamburger + name + persistent (`collapse-mode="responsive"`) SideNav with three icon categories. |
| Header Base w/ SkipToContent | `HeaderBaseWSkipToContent` | Header with `<cds-skip-to-content>` as the first child — the visually-hidden-until-focus a11y skip link. |
| SideNav Rail | `SideNavRail` | Standalone `<cds-side-nav collapse-mode="rail">` with three icon menus + two icon links. Hover-to-expand pattern. |
| SideNav Rail w/ Header | `SideNavRailWHeader` | Rail SideNav alongside a full Header with top-nav and global actions. |
| Fixed SideNav | `FixedSideNav` | `is-not-child-of-header` + `usage-mode="regular"` + `collapse-mode="fixed"` + `expanded` — the always-open variant. |
| Fixed SideNav w/Divider | `FixedSideNavDivider` | Fixed SideNav with `<cds-side-nav-divider>` separator. |
| Fixed SideNav w/ Icons | `FixedSideNavIcons` | Fixed SideNav where each `<cds-side-nav-menu>` declares `<cds-icon slot="title-icon">`. |
| SideNav w/ large side nav items | `SideNavWLargeSideNavItems` | Each menu/link has the `large` attribute for `48px` row height. |

## React (verbatim from Storybook — Header)

> The code blocks below are copied exactly from `UIShell.HeaderBase.stories.js` on the Carbon `main` branch (`packages/react/src/components/UIShell/UIShell.HeaderBase.stories.js`). Do NOT edit them — the Carbon source is the truth. The agent should output these as-is when generating Carbon UI.

**Imports + StoryContent helper (from the top of the stories file):**

```jsx
/**
 * Copyright IBM Corp. 2016, 2023
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { useState } from 'react';
import { action } from 'storybook/actions';
import cx from 'classnames';
import {
  Content,
  Header,
  HeaderContainer,
  HeaderMenuButton,
  HeaderName,
  HeaderNavigation,
  HeaderMenu,
  HeaderMenuItem,
  HeaderGlobalBar,
  HeaderGlobalAction,
  HeaderPanel,
  HeaderSideNavItems,
  SkipToContent,
  SideNav,
  SideNavDivider,
  SideNavItems,
  SideNavLink,
  SideNavMenu,
  SideNavMenuItem,
  Switcher,
  SwitcherItem,
  SwitcherDivider,
} from '.';
import { HeaderMenu as HeaderMenuNative } from './HeaderMenu';
import Modal from '../Modal';
import Button from '../Button';
import {
  Search,
  Notification,
  Fade,
  Switcher as SwitcherIcon,
} from '@carbon/icons-react';
import mdx from './UIShell.mdx';

/* eslint-disable react/prop-types */
const StoryContent = ({ useResponsiveOffset = true }) => {
  const [open, setOpen] = useState(false);
  const classNameFirstColumn = cx({
    'cds--col-lg-13': true,
    'cds--offset-lg-3': useResponsiveOffset,
  });
  const content = (
    <div className="cds--grid">
      <div className="cds--row">
        <div className={classNameFirstColumn}>
          <h2 style={{ margin: '0 0 30px' }}>Purpose and function</h2>
          <p>
            The shell is perhaps the most crucial piece of any UI built with
            <a href="www.carbondesignsystem.com"> Carbon</a>. It contains the
            shared navigation framework for the entire design system and ties
            the products in IBM’s portfolio together in a cohesive and elegant
            way. The shell is the home of the topmost navigation, where users
            can quickly and dependably gain their bearings and move between
            pages.
          </p>
          <h2 style={{ margin: '30px 0' }}>Header responsive behavior</h2>
          <p>
            As a header scales down to fit smaller screen sizes, headers with
            persistent side nav menus should have the side nav collapse into
            “hamburger” menu. See the example to better understand responsive
            behavior of the header.
          </p>
          <h2 style={{ margin: '30px 0' }}>Secondary navigation</h2>
          <p>
            The side-nav contains secondary navigation and fits below the
            header. It can be configured to be either fixed-width or flexible,
            with only one level of nested items allowed. Both links and category
            lists can be used in the side-nav and may be mixed together.
          </p>
          <Button onClick={() => setOpen(true)}>Launch modal</Button>
          <Modal
            modalHeading="Add a custom domain"
            modalLabel="Account resources"
            primaryButtonText="Add"
            secondaryButtonText="Cancel"
            open={open}
            onRequestClose={() => setOpen(false)}>
            <p style={{ marginBottom: '1rem' }}>
              Custom domains direct requests for your apps in this Cloud Foundry
              organization to a URL that you own. A custom domain can be a
              shared domain, a shared subdomain, or a shared domain and host.
            </p>
          </Modal>
        </div>
      </div>
    </div>
  );
  const style = {
    height: '100%',
  };
  if (useResponsiveOffset) {
    style.margin = '0';
    style.width = '100%';
  }
  return (
    <Content id="main-content" style={style}>
      {content}
    </Content>
  );
};
```

**Variant: Header w/ Navigation**

```jsx
export const HeaderWNavigation = () => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <SkipToContent />
          <HeaderMenuButton
            aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
            onClick={onClickSideNavExpand}
            isActive={isSideNavExpanded}
            aria-expanded={isSideNavExpanded}
          />
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <HeaderNavigation aria-label="IBM [Platform]">
            <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
            <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
              <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
              <HeaderMenuItem isActive href="#">
                Sub-link 2
              </HeaderMenuItem>
              <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
            </HeaderMenu>
          </HeaderNavigation>
          <SideNav
            aria-label="Side navigation"
            expanded={isSideNavExpanded}
            isPersistent={false}
            onSideNavBlur={onClickSideNavExpand}>
            <SideNavItems>
              <HeaderSideNavItems>
                <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
                <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
                  <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
                  <HeaderMenuItem isActive href="#">
                    Sub-link 2
                  </HeaderMenuItem>
                  <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
                </HeaderMenu>
              </HeaderSideNavItems>
            </SideNavItems>
          </SideNav>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

HeaderWNavigation.storyName = 'Header w/ Navigation';
```

**Variant: Header w/ Navigation and Actions**

```jsx
export const HeaderWNavigationAndActions = () => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <SkipToContent />
          <HeaderMenuButton
            aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
            onClick={onClickSideNavExpand}
            isActive={isSideNavExpanded}
            aria-expanded={isSideNavExpanded}
          />
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <HeaderNavigation aria-label="IBM [Platform]">
            <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
            <HeaderMenu isActive aria-label="Link 4" menuLinkName="Link 4">
              <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
              <HeaderMenuItem href="#">Sub-link 2</HeaderMenuItem>
              <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
            </HeaderMenu>
          </HeaderNavigation>
          <HeaderGlobalBar>
            <HeaderGlobalAction
              aria-label="Search"
              onClick={action('search click')}>
              <Search size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="Notifications"
              onClick={action('notification click')}>
              <Notification size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="App Switcher"
              onClick={action('app-switcher click')}
              tooltipAlignment="end">
              <SwitcherIcon size={20} />
            </HeaderGlobalAction>
          </HeaderGlobalBar>
          <SideNav
            aria-label="Side navigation"
            expanded={isSideNavExpanded}
            isPersistent={false}
            onSideNavBlur={onClickSideNavExpand}>
            <SideNavItems>
              <HeaderSideNavItems>
                <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
                <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
                  <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
                  <HeaderMenuItem href="#">Sub-link 2</HeaderMenuItem>
                  <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
                </HeaderMenu>
              </HeaderSideNavItems>
            </SideNavItems>
          </SideNav>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

HeaderWNavigationAndActions.storyName = 'Header w/ Navigation and Actions';
```

**Variant: Header w/ Navigation, Actions and SideNav**

```jsx
export const HeaderWNavigationActionsAndSideNav = () => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <SkipToContent />
          <HeaderMenuButton
            aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
            onClick={onClickSideNavExpand}
            isActive={isSideNavExpanded}
            aria-expanded={isSideNavExpanded}
          />
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <HeaderNavigation aria-label="IBM [Platform]">
            <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
            <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
              <HeaderMenuItem href="#one">Sub-link 1</HeaderMenuItem>
              <HeaderMenuItem href="#two">Sub-link 2</HeaderMenuItem>
              <HeaderMenuItem href="#three">Sub-link 3</HeaderMenuItem>
            </HeaderMenu>
          </HeaderNavigation>
          <HeaderGlobalBar>
            <HeaderGlobalAction
              aria-label="Search"
              onClick={action('search click')}
              tooltipAlignment="start">
              <Search size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="Notifications"
              onClick={action('notification click')}>
              <Notification size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="App Switcher"
              onClick={action('app-switcher click')}
              tooltipAlignment="end">
              <SwitcherIcon size={20} />
            </HeaderGlobalAction>
          </HeaderGlobalBar>
          <SideNav
            aria-label="Side navigation"
            expanded={isSideNavExpanded}
            onSideNavBlur={onClickSideNavExpand}
            href="#main-content">
            <SideNavItems>
              <HeaderSideNavItems hasDivider={true}>
                <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
                <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
                <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
                  <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
                  <HeaderMenuItem href="#">Sub-link 2</HeaderMenuItem>
                  <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
                </HeaderMenu>
              </HeaderSideNavItems>
              <SideNavMenu
                renderIcon={Fade}
                title="Category title"
                tabIndex={0}>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 5
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 6
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 7
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu
                renderIcon={Fade}
                title="Category title"
                tabIndex={0}>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 8
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 9
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 10
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu
                renderIcon={Fade}
                title="Category title"
                isActive={true}
                tabIndex={0}>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 11
                </SideNavMenuItem>
                <SideNavMenuItem
                  aria-current="page"
                  href="https://www.carbondesignsystem.com/">
                  Link 12
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link 13
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
            </SideNavItems>
          </SideNav>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

HeaderWNavigationActionsAndSideNav.storyName =
  'Header w/ Navigation, Actions and SideNav';
```

**Variant: Header w/ SideNav**

```jsx
export const HeaderWSideNav = () => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <SkipToContent />
          <HeaderMenuButton
            aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
            onClick={onClickSideNavExpand}
            isActive={isSideNavExpanded}
            aria-expanded={isSideNavExpanded}
          />
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <SideNav
            aria-label="Side navigation"
            expanded={isSideNavExpanded}
            onSideNavBlur={onClickSideNavExpand}
            href="#main-content">
            <SideNavItems>
              <SideNavMenu renderIcon={Fade} title="Category title">
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu
                renderIcon={Fade}
                title="Category title"
                isActive={true}>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem
                  aria-current="page"
                  href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu renderIcon={Fade} title="Category title">
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
            </SideNavItems>
          </SideNav>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

HeaderWSideNav.storyName = 'Header w/ SideNav';
```

**Variant: Header w/ Actions and Right Panel**

```jsx
export const HeaderWActionsAndRightPanel = (args) => {
  // Add state to control panel expansion
  const [isPanelExpanded, setIsPanelExpanded] = useState(false);

  // Toggle the notification panel when the icon is clicked
  const togglePanel = () => {
    setIsPanelExpanded((prev) => !prev);
  };

  // Function to close panel specifically
  const closePanel = () => {
    setIsPanelExpanded(false);
  };

  // Close the panel when Escape key is pressed
  const handleKeyDown = (event) => {
    if (event.key === 'Escape') {
      closePanel();
    }
  };

  return (
    <>
      <Header aria-label="IBM Platform Name">
        <HeaderName href="#" prefix="IBM">
          [Platform]
        </HeaderName>
        <HeaderGlobalBar>
          <HeaderGlobalAction
            aria-label="Search"
            onClick={action('search click')}>
            <Search size={20} />
          </HeaderGlobalAction>
          <HeaderGlobalAction
            aria-label="Notifications"
            badgeCount={args.badgeCount}
            isActive={isPanelExpanded}
            onClick={togglePanel}
            onBlur={closePanel}
            onKeyDown={handleKeyDown}
            tooltipAlignment="center"
            id="notification-button">
            <Notification size={20} />
          </HeaderGlobalAction>
          <HeaderGlobalAction
            aria-label="App Switcher"
            onClick={action('app-switcher click')}
            tooltipAlignment="end">
            <SwitcherIcon size={20} />
          </HeaderGlobalAction>
        </HeaderGlobalBar>
        <HeaderPanel expanded={isPanelExpanded} href="#notification-button">
          {/* Notification panel content here */}
        </HeaderPanel>
      </Header>
      <StoryContent />
    </>
  );
};

HeaderWActionsAndRightPanel.storyName = 'Header w/ Actions and Right Panel';

HeaderWActionsAndRightPanel.argTypes = {
  badgeCount: {
    description:
      ' **Experimental**: Display a badge on the button. An empty/dot badge if 0, a numbered badge if > 0. Must be used with size="lg" and kind="ghost"',
    control: {
      type: 'number',
    },
  },
};

HeaderWActionsAndRightPanel.args = {
  badgeCount: 4,
};
```

**Variant: Header w/ Actions and Switcher**

```jsx
export const HeaderWActionsAndSwitcher = () => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <HeaderGlobalBar>
            <HeaderGlobalAction
              aria-label="Search"
              onClick={action('search click')}>
              <Search size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="Notifications"
              onClick={action('notification click')}>
              <Notification size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label={
                isSideNavExpanded ? 'Close switcher' : 'Open switcher'
              }
              aria-expanded={isSideNavExpanded}
              isActive={isSideNavExpanded}
              onClick={onClickSideNavExpand}
              tooltipAlignment="end"
              id="switcher-button">
              <SwitcherIcon size={20} />
            </HeaderGlobalAction>
          </HeaderGlobalBar>
          <HeaderPanel
            expanded={isSideNavExpanded}
            onHeaderPanelFocus={onClickSideNavExpand}
            href="#switcher-button">
            <Switcher
              aria-label="Switcher Container"
              expanded={isSideNavExpanded}>
              <SwitcherItem aria-label="Link 1" href="#">
                Link 1
              </SwitcherItem>
              <SwitcherDivider />
              <SwitcherItem href="#" aria-label="Link 2">
                Link 2
              </SwitcherItem>
              <SwitcherItem href="#" aria-label="Link 3">
                Link 3
              </SwitcherItem>
              <SwitcherItem href="#" aria-label="Link 4">
                Link 4
              </SwitcherItem>
              <SwitcherItem href="#" aria-label="Link 5">
                Link 5
              </SwitcherItem>
              <SwitcherDivider />
              <SwitcherItem href="#" aria-label="Link 6">
                Link 6
              </SwitcherItem>
            </Switcher>
          </HeaderPanel>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

HeaderWActionsAndSwitcher.storyName = 'Header w/ Actions and Switcher';
```

## React (verbatim from Storybook — SideNav)

> The code blocks below are copied exactly from `UIShell.SideNav.stories.js` on the Carbon `main` branch (`packages/react/src/components/UIShell/UIShell.SideNav.stories.js`). The imports and `StoryContent` helper are identical to the Header story file above.

**Variant: Fixed SideNav**

```jsx
export const FixedSideNav = () => (
  <>
    <Header aria-label="IBM Platform Name">
      <SkipToContent />
      <HeaderName href="#" prefix="IBM">
        [Platform]
      </HeaderName>
    </Header>
    <SideNav
      isFixedNav
      expanded={true}
      isChildOfHeader={false}
      aria-label="Side navigation">
      <SideNavItems>
        <SideNavMenu title="L0 menu">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu title="L0 menu" isActive={true}>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem
            aria-current="page"
            href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu title="L0 menu">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavLink href="https://www.carbondesignsystem.com/">
          L0 link
        </SideNavLink>
        <SideNavLink href="https://www.carbondesignsystem.com/">
          L0 link
        </SideNavLink>
      </SideNavItems>
    </SideNav>
    <StoryContent useResponsiveOffset={false} />
  </>
);

FixedSideNav.storyName = 'Fixed SideNav';
```

**Variant: Fixed SideNav w/ Icons**

```jsx
export const FixedSideNavWIcons = () => (
  <>
    <Header aria-label="IBM Platform Name">
      <SkipToContent />
      <HeaderName href="#" prefix="IBM">
        [Platform]
      </HeaderName>
    </Header>
    <SideNav
      isFixedNav
      expanded={true}
      isChildOfHeader={false}
      aria-label="Side navigation">
      <SideNavItems>
        <SideNavMenu renderIcon={Fade} title="Category title">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu renderIcon={Fade} title="Category title" isActive={true}>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem
            aria-current="page"
            href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu renderIcon={Fade} title="Category title">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Link
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavLink
          renderIcon={Fade}
          href="https://www.carbondesignsystem.com/">
          Link
        </SideNavLink>
        <SideNavLink
          renderIcon={Fade}
          href="https://www.carbondesignsystem.com/">
          Link
        </SideNavLink>
      </SideNavItems>
    </SideNav>
    <StoryContent useResponsiveOffset={false} />
  </>
);

FixedSideNavWIcons.storyName = 'Fixed SideNav w/ Icons';
```

**Variant: Fixed SideNav w/ Divider**

```jsx
export const FixedSideNavWDivider = () => (
  <>
    <Header aria-label="IBM Platform Name">
      <SkipToContent />
      <HeaderName href="#" prefix="IBM">
        [Platform]
      </HeaderName>
    </Header>
    <SideNav
      isFixedNav
      expanded={true}
      isChildOfHeader={false}
      aria-label="Side navigation">
      <SideNavItems>
        <SideNavMenu title="L0 menu">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu title="L0 menu" isActive={true}>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem
            aria-current="page"
            href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavMenu title="L0 menu">
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            L0 menu item
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavDivider />
        <SideNavLink href="https://www.carbondesignsystem.com/">
          L0 link
        </SideNavLink>
        <SideNavLink href="https://www.carbondesignsystem.com/">
          L0 link
        </SideNavLink>
      </SideNavItems>
    </SideNav>
    <StoryContent useResponsiveOffset={false} />
  </>
);

FixedSideNavWDivider.storyName = 'Fixed SideNav w/ Divider';
```

**Variant: SideNav Rail w/ Header**

```jsx
export const SideNavRailWHeader = (args) => (
  <HeaderContainer
    render={({ isSideNavExpanded, onClickSideNavExpand }) => (
      <>
        <Header aria-label="IBM Platform Name">
          <SkipToContent />
          <HeaderMenuButton
            aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
            onClick={onClickSideNavExpand}
            isActive={isSideNavExpanded}
            aria-expanded={isSideNavExpanded}
          />
          <HeaderName href="#" prefix="IBM">
            [Platform]
          </HeaderName>
          <HeaderNavigation aria-label="IBM [Platform]">
            <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
            <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
            <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
              <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
              <HeaderMenuItem href="#">Sub-link 2</HeaderMenuItem>
              <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
            </HeaderMenu>
          </HeaderNavigation>
          <HeaderGlobalBar>
            <HeaderGlobalAction
              aria-label="Search"
              onClick={action('search click')}>
              <Search size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="Notifications"
              onClick={action('notification click')}>
              <Notification size={20} />
            </HeaderGlobalAction>
            <HeaderGlobalAction
              aria-label="App Switcher"
              onClick={action('app-switcher click')}
              tooltipAlignment="end">
              <SwitcherIcon size={20} />
            </HeaderGlobalAction>
          </HeaderGlobalBar>
          <SideNav
            aria-label="Side navigation"
            expanded={isSideNavExpanded}
            onOverlayClick={onClickSideNavExpand}
            href="#main-content"
            onSideNavBlur={onClickSideNavExpand}
            isRail
            {...args}>
            <SideNavItems>
              {isSideNavExpanded && (
                <HeaderSideNavItems hasDivider={true}>
                  <HeaderMenuItem href="#">Link 1</HeaderMenuItem>
                  <HeaderMenuItem href="#">Link 2</HeaderMenuItem>
                  <HeaderMenuItem href="#">Link 3</HeaderMenuItem>
                  <HeaderMenu aria-label="Link 4" menuLinkName="Link 4">
                    <HeaderMenuItem href="#">Sub-link 1</HeaderMenuItem>
                    <HeaderMenuItem href="#">Sub-link 2</HeaderMenuItem>
                    <HeaderMenuItem href="#">Sub-link 3</HeaderMenuItem>
                  </HeaderMenu>
                </HeaderSideNavItems>
              )}
              <SideNavMenu renderIcon={Fade} title="Category title">
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu renderIcon={Fade} title="Category title">
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem
                  aria-current="page"
                  href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavMenu renderIcon={Fade} title="Category title">
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
                <SideNavMenuItem href="https://www.carbondesignsystem.com/">
                  Link
                </SideNavMenuItem>
              </SideNavMenu>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
              <SideNavLink
                renderIcon={Fade}
                href="https://www.carbondesignsystem.com/">
                Link
              </SideNavLink>
            </SideNavItems>
          </SideNav>
        </Header>
        <StoryContent />
      </>
    )}
  />
);

SideNavRailWHeader.argTypes = {
  isRail: {
    control: {
      type: 'boolean',
    },
    defaultValue: true,
    table: {
      defaultValue: { summary: true },
    },
    description:
      "Optional prop to display the side nav rail. It doesn't work along side with `isFixedNav` prop.",
  },
  isFixedNav: {
    control: {
      type: 'boolean',
    },
    defaultValue: false,
    table: {
      defaultValue: { summary: false },
    },
    description:
      "Optional prop to set a fixed side nav. It doesn't work along side with `isRail` prop.",
  },
  enterDelayMs: {
    control: {
      type: 'number',
    },
    table: {
      defaultValue: { summary: 100 },
    },
    defaultValue: 100,
    description:
      'Specify the duration in milliseconds to delay before displaying the sidenav',
  },
};

SideNavRailWHeader.storyName = 'SideNav Rail w/Header';
```

**Variant: SideNav w/ large side nav items**

```jsx
export const SideNavWLargeSideNavItems = () => (
  <>
    <Header aria-label="IBM Platform Name">
      <SkipToContent />
      <HeaderName href="#" prefix="IBM">
        [Platform]
      </HeaderName>
    </Header>
    <SideNav
      expanded={true}
      isChildOfHeader={false}
      aria-label="Side navigation">
      <SideNavItems>
        <SideNavMenu title="Large menu" large>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 1
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 2
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 3
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavLink href="https://www.carbondesignsystem.com/" large>
          Large link
        </SideNavLink>
        <SideNavMenu renderIcon={Fade} title="Large menu w/icon" large>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 1
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 2
          </SideNavMenuItem>
          <SideNavMenuItem href="https://www.carbondesignsystem.com/">
            Menu 3
          </SideNavMenuItem>
        </SideNavMenu>
        <SideNavLink
          renderIcon={Fade}
          href="https://www.carbondesignsystem.com/"
          large>
          Large link w/icon
        </SideNavLink>
      </SideNavItems>
    </SideNav>
    <StoryContent />
  </>
);

SideNavWLargeSideNavItems.storyName = 'SideNav w/ large side nav items';
```

## Web Components (verbatim from Storybook)

> The code blocks below are copied exactly from `ui-shell.stories.ts` on the Carbon `main` branch (`packages/web-components/src/components/ui-shell/ui-shell.stories.ts`). Use these for non-React projects.

**Imports + StoryContent helper (from the top of the stories file):**

```ts
/**
 * Copyright IBM Corp. 2019, 2024
 *
 * This source code is licensed under the Apache-2.0 license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { html } from 'lit';
import { iconLoader } from '../../globals/internal/icon-loader';
// Below path will be there when an application installs `@carbon/web-components` package.
// In our dev env, we auto-generate the file and re-map below path to to point to the generated file.
// eslint-disable-next-line @typescript-eslint/ban-ts-comment -- https://github.com/carbon-design-system/carbon/issues/20452
// @ts-ignore
import Fade16 from '@carbon/icons/es/fade/16.js';
import Search20 from '@carbon/icons/es/search/20.js';
import Notification20 from '@carbon/icons/es/notification/20.js';
import SwitcherIcon20 from '@carbon/icons/es/switcher/20.js';
import contentStyles from '@carbon/styles/scss/components/ui-shell/content/_content.scss?lit';
import { SIDE_NAV_COLLAPSE_MODE, SIDE_NAV_USAGE_MODE } from './side-nav';
import { classMap } from 'lit/directives/class-map.js';
import './index';
import '../skip-to-content';
import '../modal/modal';
import '../button/button';
import styles from './ui-shell-story.scss?lit';
import { prefix } from '../../globals/settings';
import '../badge-indicator/index';
const linksHref = 'https://www.carbondesignsystem.com/';

const StoryContent = ({ useResponsiveOffset = true }) => {
  const firstColumnClasses = classMap({
    [`${prefix}--col-lg-13`]: true,
    [`${prefix}--offset-lg-3`]: useResponsiveOffset,
  });
  const toggleButton = () => {
    document.querySelector('cds-modal')?.toggleAttribute('open');
  };
  return html`
    <style type="text/css">
      ${contentStyles.cssText}
    </style>
    <main class="${prefix}--content ${prefix}-ce-demo-devenv--ui-shell-content">
      <div class="${prefix}--grid">
        <div class="${prefix}--row">
          <div
            class="${firstColumnClasses}"
            style="${!useResponsiveOffset ? `margin-left: 16rem;` : ''}">
            <h2 style="margin: 0 0 30px">Purpose and function</h2>
            <p>The shell is perhaps the most crucial piece of any UI built with Carbon...</p>
          </div>
        </div>
      </div>
    </main>
  `;
};
```

**Variant: Header Base**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
</cds-header>
```

**Variant: Header Base w/ Actions**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="Notification"
      tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="App Switcher"
      tooltip-text="App Switcher"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
</cds-header>
```

**Variant: Header Base w/ Actions and Right Panel**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      panel-id="notification-panel"
      aria-label="Notification"
      tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
      ${badgeCount > 0
        ? html`<cds-badge-indicator
            count=${badgeCount}></cds-badge-indicator>`
        : html`<cds-badge-indicator></cds-badge-indicator>`}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="App Switcher"
      tooltip-text="App Switcher"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
  <cds-header-panel
    id="notification-panel"
    aria-label="Header Panel"></cds-header-panel>
</cds-header>
```

**Variant: Header Base w/ Actions and Switcher**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="Notification"
      tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      button-label-active="Close switcher"
      button-label-inactive="Open switcher"
      tooltip-text="Open switcher"
      panel-id="switcher-panel"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
  <cds-header-panel id="switcher-panel" aria-label="Header Panel">
    <cds-switcher aria-label="Switcher Container">
      <cds-switcher-item aria-label="Link 1" href="#"
        >Link 1</cds-switcher-item
      >
      <cds-switcher-divider></cds-switcher-divider>
      <cds-switcher-item aria-label="Link 2" href="#"
        >Link 2</cds-switcher-item
      >
      <cds-switcher-item aria-label="Link 3" href="#"
        >Link 3</cds-switcher-item
      >
      <cds-switcher-item aria-label="Link 4" href="#"
        >Link 4</cds-switcher-item
      >
      <cds-switcher-item aria-label="Link 5" href="#"
        >Link 5</cds-switcher-item
      >
      <cds-switcher-divider></cds-switcher-divider>
      <cds-switcher-item aria-label="Link 6" href="#"
        >Link 6</cds-switcher-item
      >
    </cds-switcher>
  </cds-header-panel>
</cds-header>
${StoryContent({ useResponsiveOffset: true })}
```

**Variant: Header Base w/ Navigation, Actions and SideNav**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-menu-button
    button-label-active="Close menu"
    button-label-inactive="Open menu"></cds-header-menu-button>
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <cds-header-nav menu-bar-label="IBM [Platform]">
    <cds-header-nav-item href="javascript:void 0"
      >Link 1</cds-header-nav-item
    >
    <cds-header-nav-item href="javascript:void 0"
      >Link 2</cds-header-nav-item
    >
    <cds-header-nav-item href="javascript:void 0"
      >Link 3</cds-header-nav-item
    >
    <cds-header-menu menu-label="Link 4" trigger-content="Link 4">
      <cds-header-menu-item href="javascript:void 0"
        >Sub-link 1</cds-header-menu-item
      >
      <cds-header-menu-item href="javascript:void 0"
        >Sub-link 2</cds-header-menu-item
      >
      <cds-header-menu-item href="javascript:void 0"
        >Sub-link 3</cds-header-menu-item
      >
    </cds-header-menu>
  </cds-header-nav>
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="Notification"
      tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="App Switcher"
      tooltip-text="App Switcher"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
  <cds-side-nav
    aria-label="Side navigation"
    collapse-mode="${SIDE_NAV_COLLAPSE_MODE.RESPONSIVE}">
    <cds-side-nav-items>
      <cds-header-side-nav-items has-divider>
        <cds-side-nav-link href="javascript:void(0)"> Link 1 </cds-side-nav-link>
        <cds-side-nav-link href="javascript:void(0)"> Link 2 </cds-side-nav-link>
        <cds-side-nav-link href="javascript:void(0)"> Link 3 </cds-side-nav-link>
        <cds-side-nav-menu title="Link 4">
          <cds-side-nav-menu-item href="${linksHref}"> Sub-link 1 </cds-side-nav-menu-item>
          <cds-side-nav-menu-item href="${linksHref}"> Sub-link 2 </cds-side-nav-menu-item>
          <cds-side-nav-menu-item href="${linksHref}"> Sub-link 3 </cds-side-nav-menu-item>
        </cds-side-nav-menu>
      </cds-header-side-nav-items>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item aria-current="page" href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item active href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-link href="javascript:void(0)"
        >${iconLoader(Fade16, { slot: 'title-icon' })}
        Link</cds-side-nav-link
      >
      <cds-side-nav-link href="javascript:void(0)"
        >${iconLoader(Fade16, { slot: 'title-icon' })}
        Link</cds-side-nav-link
      >
    </cds-side-nav-items>
  </cds-side-nav>
</cds-header>
${StoryContent({ useResponsiveOffset: true })}
```

**Variant: Header Base w/ SkipToContent**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-skip-to-content></cds-skip-to-content>
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="Notification"
      tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="App Switcher"
      tooltip-text="App Switcher"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
</cds-header>
${StoryContent({ useResponsiveOffset: true })}
```

**Variant: SideNav Rail (standalone)**

```html
<style>
  ${styles}
</style>
<cds-side-nav
  aria-label="Side navigation"
  collapse-mode="${SIDE_NAV_COLLAPSE_MODE.RAIL}">
  <cds-side-nav-items>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link href="javascript:void(0)"
      >${iconLoader(Fade16, { slot: 'title-icon' })}Link</cds-side-nav-link
    >
    <cds-side-nav-link href="javascript:void(0)"
      >${iconLoader(Fade16, { slot: 'title-icon' })}Link</cds-side-nav-link
    >
  </cds-side-nav-items>
</cds-side-nav>
${StoryContent({ useResponsiveOffset: true })}
```

**Variant: SideNav Rail w/ Header**

```html
<style>
  ${styles}
</style>
<cds-header aria-label="IBM Platform Name">
  <cds-header-menu-button
    button-label-active="Close menu"
    button-label-inactive="Open menu"></cds-header-menu-button>
  <cds-header-name href="javascript:void 0" prefix="IBM"
    >[Platform]</cds-header-name
  >
  <cds-header-nav menu-bar-label="IBM [Platform]">
    <cds-header-nav-item href="javascript:void 0">Link 1</cds-header-nav-item>
    <cds-header-nav-item href="javascript:void 0">Link 2</cds-header-nav-item>
    <cds-header-nav-item href="javascript:void 0">Link 3</cds-header-nav-item>
    <cds-header-menu menu-label="Link 4" trigger-content="Link 4">
      <cds-header-menu-item href="javascript:void 0">Sub-link 1</cds-header-menu-item>
      <cds-header-menu-item href="javascript:void 0">Sub-link 2</cds-header-menu-item>
      <cds-header-menu-item href="javascript:void 0">Sub-link 3</cds-header-menu-item>
    </cds-header-menu>
  </cds-header-nav>
  <div class="${prefix}--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      ${iconLoader(Search20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action aria-label="Notification" tooltip-text="Notification">
      ${iconLoader(Notification20, { slot: 'icon' })}
    </cds-header-global-action>
    <cds-header-global-action
      aria-label="App Switcher"
      tooltip-text="App Switcher"
      tooltip-alignment="right">
      ${iconLoader(SwitcherIcon20, { slot: 'icon' })}
    </cds-header-global-action>
  </div>
  <cds-side-nav
    aria-label="Side navigation"
    collapse-mode="${SIDE_NAV_COLLAPSE_MODE.RAIL}">
    <cds-side-nav-items>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item active aria-current="page" href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-menu title="Category title">
        ${iconLoader(Fade16, { slot: 'title-icon' })}
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-link href="javascript:void(0)"
        >${iconLoader(Fade16, { slot: 'title-icon' })}Link</cds-side-nav-link
      >
      <cds-side-nav-link href="javascript:void(0)"
        >${iconLoader(Fade16, { slot: 'title-icon' })}Link</cds-side-nav-link
      >
    </cds-side-nav-items>
  </cds-side-nav>
</cds-header>
${StoryContent({ useResponsiveOffset: true })}
```

**Variant: Fixed SideNav**

```html
<style>
  ${styles}
</style>
<cds-side-nav
  is-not-child-of-header
  usage-mode="${SIDE_NAV_USAGE_MODE.REGULAR}"
  aria-label="Side navigation"
  collapse-mode="${SIDE_NAV_COLLAPSE_MODE.FIXED}"
  expanded>
  <cds-side-nav-items>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" target="_blank" href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link href="javascript:void(0)">L0 link</cds-side-nav-link>
    <cds-side-nav-link href="javascript:void(0)">L0 link</cds-side-nav-link>
  </cds-side-nav-items>
</cds-side-nav>
${StoryContent({ useResponsiveOffset: false })}
```

**Variant: Fixed SideNav w/Divider**

```html
<style>
  ${styles}
</style>
<cds-side-nav
  is-not-child-of-header
  aria-label="Side navigation"
  collapse-mode="${SIDE_NAV_COLLAPSE_MODE.FIXED}"
  expanded>
  <cds-side-nav-items>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> L0 menu item </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-divider></cds-side-nav-divider>
    <cds-side-nav-link href="javascript:void(0)">L0 link</cds-side-nav-link>
    <cds-side-nav-link href="javascript:void(0)">L0 link</cds-side-nav-link>
  </cds-side-nav-items>
</cds-side-nav>
${StoryContent({ useResponsiveOffset: false })}
```

**Variant: Fixed SideNav w/ Icons**

```html
<style>
  ${styles}
</style>
<cds-side-nav
  is-not-child-of-header
  aria-label="Side navigation"
  collapse-mode="${SIDE_NAV_COLLAPSE_MODE.FIXED}"
  expanded>
  <cds-side-nav-items>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-menu title="Category title">
      ${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Link </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link href="javascript:void(0)"
      >${iconLoader(Fade16, { slot: 'title-icon' })} Link</cds-side-nav-link
    >
    <cds-side-nav-link href="javascript:void(0)"
      >${iconLoader(Fade16, { slot: 'title-icon' })} Link</cds-side-nav-link
    >
  </cds-side-nav-items>
</cds-side-nav>
${StoryContent({ useResponsiveOffset: false })}
```

**Variant: SideNav w/ large side nav items**

```html
<style>
  ${styles}
</style>
<cds-side-nav
  is-not-child-of-header
  aria-label="Side navigation"
  collapse-mode="${SIDE_NAV_COLLAPSE_MODE.FIXED}"
  expanded>
  <cds-side-nav-items>
    <cds-side-nav-menu large title="Large menu">
      <cds-side-nav-menu-item href="${linksHref}"> Menu 1 </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Menu 2 </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Menu 3 </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link large href="javascript:void(0)">Large link</cds-side-nav-link>
    <cds-side-nav-menu large title="Large menu w/icon"
      >${iconLoader(Fade16, { slot: 'title-icon' })}
      <cds-side-nav-menu-item href="${linksHref}"> Menu 1 </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Menu 2 </cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="${linksHref}"> Menu 3 </cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link large href="javascript:void(0)">
      ${iconLoader(Fade16, { slot: 'title-icon' })} Large link w/icon</cds-side-nav-link
    >
  </cds-side-nav-items>
</cds-side-nav>
${StoryContent({ useResponsiveOffset: true })}
```

## Plain HTML (derived from Web Components)

> The same markup as the WC section, with lit-html `${...}` bindings resolved to static attributes (`collapse-mode="rail"` instead of `collapse-mode="${SIDE_NAV_COLLAPSE_MODE.RAIL}"`, etc.) and the `${iconLoader(Fade16, { slot: 'title-icon' })}` calls replaced with literal `<svg slot="title-icon">…</svg>` markup. The custom-element tag names (`<cds-header>`, `<cds-side-nav>`, etc.) are identical to the WC section. Use this for hand-coded HTML without a component framework.

**Variant: Full app shell (plain HTML — Header + responsive SideNav, the canonical Carbon product chrome)**

```html
<cds-header aria-label="IBM Platform Name">
  <cds-skip-to-content></cds-skip-to-content>
  <cds-header-menu-button
    button-label-active="Close menu"
    button-label-inactive="Open menu"></cds-header-menu-button>
  <cds-header-name href="#" prefix="IBM">[Platform]</cds-header-name>
  <cds-header-nav menu-bar-label="IBM [Platform]">
    <cds-header-nav-item href="#">Link 1</cds-header-nav-item>
    <cds-header-nav-item href="#">Link 2</cds-header-nav-item>
    <cds-header-nav-item href="#">Link 3</cds-header-nav-item>
    <cds-header-menu menu-label="Link 4" trigger-content="Link 4">
      <cds-header-menu-item href="#">Sub-link 1</cds-header-menu-item>
      <cds-header-menu-item href="#">Sub-link 2</cds-header-menu-item>
      <cds-header-menu-item href="#">Sub-link 3</cds-header-menu-item>
    </cds-header-menu>
  </cds-header-nav>
  <div class="cds--header__global">
    <cds-header-global-action aria-label="Search" tooltip-text="Search">
      <!-- @carbon/icons/es/search/20.js — paste the verbatim SVG, viewBox 0 0 32 32 -->
      <svg slot="icon" width="20" height="20" viewBox="0 0 32 32" fill="currentColor"><path d="M29 27.586l-7.552-7.552a11.018 11.018 0 1 0-1.414 1.414L27.586 29zM4 13a9 9 0 1 1 9 9 9.01 9.01 0 0 1-9-9z"/></svg>
    </cds-header-global-action>
    <cds-header-global-action aria-label="Notification" tooltip-text="Notification">
      <!-- @carbon/icons/es/notification/20.js -->
      <svg slot="icon" width="20" height="20" viewBox="0 0 32 32" fill="currentColor"><path d="M28.71 24.29L26 21.59V14a10 10 0 0 0-8-9.8V2h-2v2.2A10 10 0 0 0 6 14v7.59l-2.71 2.7A1 1 0 0 0 3 25v3a1 1 0 0 0 1 1h7v.14a5.07 5.07 0 0 0 4.36 5A5 5 0 0 0 21 29h7a1 1 0 0 0 1-1v-3a1 1 0 0 0-.29-.71zM19 29a3 3 0 1 1-6 0v-.14h6zm8-2H5v-1.59l2.71-2.7A1 1 0 0 0 8 22v-8a8 8 0 0 1 16 0v8a1 1 0 0 0 .29.71L27 25.41z"/></svg>
    </cds-header-global-action>
    <cds-header-global-action aria-label="App Switcher" tooltip-text="App Switcher" tooltip-alignment="right">
      <!-- @carbon/icons/es/switcher/20.js -->
      <svg slot="icon" width="20" height="20" viewBox="0 0 32 32" fill="currentColor"><path d="M12 4H6a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2zM6 12V6h6v6zm20-8h-6a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2zm-6 8V6h6v6zm-8 6H6a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2zm-6 8v-6h6v6zm20-8h-6a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-6a2 2 0 0 0-2-2zm-6 8v-6h6v6z"/></svg>
    </cds-header-global-action>
  </div>
  <cds-side-nav aria-label="Side navigation" collapse-mode="responsive">
    <cds-side-nav-items>
      <cds-header-side-nav-items has-divider>
        <cds-side-nav-link href="#">Link 1</cds-side-nav-link>
        <cds-side-nav-link href="#">Link 2</cds-side-nav-link>
        <cds-side-nav-link href="#">Link 3</cds-side-nav-link>
        <cds-side-nav-menu title="Link 4">
          <cds-side-nav-menu-item href="#">Sub-link 1</cds-side-nav-menu-item>
          <cds-side-nav-menu-item href="#">Sub-link 2</cds-side-nav-menu-item>
          <cds-side-nav-menu-item href="#">Sub-link 3</cds-side-nav-menu-item>
        </cds-side-nav-menu>
      </cds-header-side-nav-items>
      <cds-side-nav-menu title="Category title">
        <!-- @carbon/icons/es/fade/16.js — replace with your category icon -->
        <svg slot="title-icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor"><path d="M8.667 14.667A6.674 6.674 0 0 1 2 8c0-3.578 2.836-6.5 6.366-6.66l.045 1c-3.001.135-5.41 2.617-5.41 5.66 0 3.124 2.542 5.667 5.666 5.667z"/></svg>
        <cds-side-nav-menu-item href="#">Link 5</cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="#">Link 6</cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="#">Link 7</cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-menu title="Category title">
        <svg slot="title-icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor"><path d="M8.667 14.667A6.674 6.674 0 0 1 2 8c0-3.578 2.836-6.5 6.366-6.66z"/></svg>
        <cds-side-nav-menu-item href="#">Link 8</cds-side-nav-menu-item>
        <cds-side-nav-menu-item active aria-current="page" href="#">Link 9</cds-side-nav-menu-item>
        <cds-side-nav-menu-item href="#">Link 10</cds-side-nav-menu-item>
      </cds-side-nav-menu>
      <cds-side-nav-link href="#">
        <svg slot="title-icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor"><path d="M8.667 14.667A6.674 6.674 0 0 1 2 8c0-3.578 2.836-6.5 6.366-6.66z"/></svg>
        Link
      </cds-side-nav-link>
    </cds-side-nav-items>
  </cds-side-nav>
</cds-header>

<!-- Main content placement: clear the fixed Header (48px / 3rem) + SideNav (256px / 16rem when expanded) -->
<main class="cds--content" id="main-content" style="margin-left: 16rem; margin-top: 3rem;">
  <div class="cds--grid">
    <div class="cds--row">
      <div class="cds--col-lg-13 cds--offset-lg-3">
        <!-- Page content here -->
      </div>
    </div>
  </div>
</main>
```

**Variant: Standalone Fixed SideNav, Rail SideNav, and HeaderPanel + Switcher (plain HTML)**

```html
<!-- 1. Fixed SideNav (always 256px, never collapses) — for nav-dominant dashboards -->
<cds-side-nav is-not-child-of-header usage-mode="regular" aria-label="Side navigation"
  collapse-mode="fixed" expanded>
  <cds-side-nav-items>
    <cds-side-nav-menu title="L0 menu">
      <cds-side-nav-menu-item href="#">L0 menu item</cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" href="#">L0 menu item</cds-side-nav-menu-item>
      <cds-side-nav-menu-item href="#">L0 menu item</cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-divider></cds-side-nav-divider>
    <cds-side-nav-link href="#">L0 link</cds-side-nav-link>
  </cds-side-nav-items>
</cds-side-nav>

<!-- 2. Rail SideNav (48px collapsed, 256px on hover/focus) — for data-dense apps -->
<cds-side-nav aria-label="Side navigation" collapse-mode="rail">
  <cds-side-nav-items>
    <cds-side-nav-menu title="Category title">
      <svg slot="title-icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor"><path d="M8.667 14.667A6.674 6.674 0 0 1 2 8c0-3.578 2.836-6.5 6.366-6.66z"/></svg>
      <cds-side-nav-menu-item href="#">Link</cds-side-nav-menu-item>
      <cds-side-nav-menu-item active aria-current="page" href="#">Link</cds-side-nav-menu-item>
    </cds-side-nav-menu>
    <cds-side-nav-link href="#">
      <svg slot="title-icon" width="16" height="16" viewBox="0 0 16 16" fill="currentColor"><path d="M8.667 14.667A6.674 6.674 0 0 1 2 8c0-3.578 2.836-6.5 6.366-6.66z"/></svg>
      Link
    </cds-side-nav-link>
  </cds-side-nav-items>
</cds-side-nav>

<!-- 3. HeaderPanel hosting Switcher (cross-product launcher; place INSIDE <cds-header>) -->
<cds-header-panel id="switcher-panel" aria-label="Header Panel">
  <cds-switcher aria-label="Switcher Container">
    <cds-switcher-item aria-label="Link 1" href="#">Link 1</cds-switcher-item>
    <cds-switcher-divider></cds-switcher-divider>
    <cds-switcher-item aria-label="Link 2" href="#">Link 2</cds-switcher-item>
    <cds-switcher-item aria-label="Link 3" href="#">Link 3</cds-switcher-item>
    <cds-switcher-divider></cds-switcher-divider>
    <cds-switcher-item aria-label="Link 4" href="#">Link 4</cds-switcher-item>
  </cds-switcher>
</cds-header-panel>
```

## Design Tokens (component-scoped)

Carbon's UIShell consumes the following theme tokens. Resolve the `var(--cds-*)` references against the global theme block in `references/ibm/overview.md` for the full picture; the values below are the literal hex resolved per theme.

```css
/* ============== WHITE THEME (default light) ============== */
[data-theme="white"] {
  /* Header */
  --cds-ui-shell-header-background: #ffffff;        /* var(--cds-background) */
  --cds-ui-shell-header-border: #e0e0e0;            /* var(--cds-border-subtle-00) */
  --cds-ui-shell-header-text: #161616;              /* var(--cds-text-primary) */
  --cds-ui-shell-header-text-secondary: #525252;    /* var(--cds-text-secondary) */
  --cds-ui-shell-header-icon: #525252;              /* var(--cds-icon-secondary) */
  --cds-ui-shell-header-icon-active: #161616;       /* var(--cds-icon-primary) */
  --cds-ui-shell-header-action-hover: rgba(141, 141, 141, 0.12); /* var(--cds-background-hover) */
  --cds-ui-shell-header-action-active: rgba(141, 141, 141, 0.5);  /* var(--cds-background-active) */
  --cds-ui-shell-header-action-active-bg: #f4f4f4;  /* var(--cds-layer-01) when isActive */
  --cds-ui-shell-header-focus: #0f62fe;             /* var(--cds-focus) */
  --cds-ui-shell-header-current-page-accent: #0f62fe; /* var(--cds-border-interactive) — 3px bottom bar */

  /* SideNav */
  --cds-ui-shell-side-nav-background: #ffffff;      /* var(--cds-background) */
  --cds-ui-shell-side-nav-text: #525252;            /* var(--cds-text-secondary) */
  --cds-ui-shell-side-nav-text-active: #161616;     /* var(--cds-text-primary) */
  --cds-ui-shell-side-nav-icon: #525252;            /* var(--cds-icon-secondary) */
  --cds-ui-shell-side-nav-icon-active: #161616;     /* var(--cds-icon-primary) */
  --cds-ui-shell-side-nav-item-hover: rgba(141, 141, 141, 0.12); /* var(--cds-background-hover) */
  --cds-ui-shell-side-nav-item-selected: rgba(141, 141, 141, 0.2); /* var(--cds-background-selected) */
  --cds-ui-shell-side-nav-item-selected-hover: rgba(141, 141, 141, 0.32); /* var(--cds-background-selected-hover) */
  --cds-ui-shell-side-nav-active-accent: #0f62fe;   /* var(--cds-border-interactive) — 3px left bar */
  --cds-ui-shell-side-nav-divider: #e0e0e0;         /* var(--cds-border-subtle-00) */
  --cds-ui-shell-side-nav-focus: #0f62fe;           /* var(--cds-focus) */
  --cds-ui-shell-side-nav-overlay: rgba(22, 22, 22, 0.5); /* var(--cds-overlay) — mobile backdrop */

  /* HeaderPanel */
  --cds-ui-shell-header-panel-background: #f4f4f4;  /* var(--cds-layer-01) */
  --cds-ui-shell-header-panel-text: #525252;        /* var(--cds-text-secondary) */
  --cds-ui-shell-header-panel-border: #e0e0e0;      /* var(--cds-border-subtle-00) */

  /* Switcher (cross-product launcher) */
  --cds-ui-shell-switcher-text: #525252;            /* var(--cds-text-secondary) */
  --cds-ui-shell-switcher-text-active: #161616;     /* var(--cds-text-primary) */
  --cds-ui-shell-switcher-item-hover: #e8e8e8;      /* var(--cds-layer-hover-01) */
  --cds-ui-shell-switcher-item-active: #c6c6c6;     /* var(--cds-layer-active-01) */
  --cds-ui-shell-switcher-item-selected: #e0e0e0;   /* var(--cds-layer-selected-01) */
  --cds-ui-shell-switcher-divider: #e0e0e0;         /* var(--cds-border-subtle-00) */

  /* SkipToContent (focus-only a11y link) */
  --cds-ui-shell-skip-to-content-bg: #ffffff;       /* var(--cds-background) */
  --cds-ui-shell-skip-to-content-text: #525252;     /* var(--cds-text-secondary) */
  --cds-ui-shell-skip-to-content-focus: #0f62fe;    /* 4px solid var(--cds-focus) */
}

/* ============== G100 THEME (default dark) ============== */
[data-theme="g100"],
.dark {
  /* Header */
  --cds-ui-shell-header-background: #161616;        /* var(--cds-background) */
  --cds-ui-shell-header-border: #393939;            /* var(--cds-border-subtle-00) */
  --cds-ui-shell-header-text: #f4f4f4;              /* var(--cds-text-primary) */
  --cds-ui-shell-header-text-secondary: #c6c6c6;    /* var(--cds-text-secondary) */
  --cds-ui-shell-header-icon: #c6c6c6;              /* var(--cds-icon-secondary) */
  --cds-ui-shell-header-icon-active: #f4f4f4;       /* var(--cds-icon-primary) */
  --cds-ui-shell-header-action-hover: rgba(141, 141, 141, 0.16); /* var(--cds-background-hover) */
  --cds-ui-shell-header-action-active: rgba(141, 141, 141, 0.4);  /* var(--cds-background-active) */
  --cds-ui-shell-header-action-active-bg: #262626;  /* var(--cds-layer-01) when isActive */
  --cds-ui-shell-header-focus: #ffffff;             /* var(--cds-focus) — pure white in dark themes */
  --cds-ui-shell-header-current-page-accent: #4589ff; /* var(--cds-border-interactive) */

  /* SideNav */
  --cds-ui-shell-side-nav-background: #161616;      /* var(--cds-background) */
  --cds-ui-shell-side-nav-text: #c6c6c6;            /* var(--cds-text-secondary) */
  --cds-ui-shell-side-nav-text-active: #f4f4f4;     /* var(--cds-text-primary) */
  --cds-ui-shell-side-nav-icon: #c6c6c6;            /* var(--cds-icon-secondary) */
  --cds-ui-shell-side-nav-icon-active: #f4f4f4;     /* var(--cds-icon-primary) */
  --cds-ui-shell-side-nav-item-hover: rgba(141, 141, 141, 0.16); /* var(--cds-background-hover) */
  --cds-ui-shell-side-nav-item-selected: rgba(141, 141, 141, 0.24); /* var(--cds-background-selected) */
  --cds-ui-shell-side-nav-item-selected-hover: rgba(141, 141, 141, 0.32); /* var(--cds-background-selected-hover) */
  --cds-ui-shell-side-nav-active-accent: #4589ff;   /* var(--cds-border-interactive) */
  --cds-ui-shell-side-nav-divider: #393939;         /* var(--cds-border-subtle-00) */
  --cds-ui-shell-side-nav-focus: #ffffff;           /* var(--cds-focus) */
  --cds-ui-shell-side-nav-overlay: rgba(0, 0, 0, 0.65); /* var(--cds-overlay) */

  /* HeaderPanel */
  --cds-ui-shell-header-panel-background: #262626;  /* var(--cds-layer-01) */
  --cds-ui-shell-header-panel-text: #c6c6c6;        /* var(--cds-text-secondary) */
  --cds-ui-shell-header-panel-border: #393939;      /* var(--cds-border-subtle-00) */

  /* Switcher */
  --cds-ui-shell-switcher-text: #c6c6c6;            /* var(--cds-text-secondary) */
  --cds-ui-shell-switcher-text-active: #f4f4f4;     /* var(--cds-text-primary) */
  --cds-ui-shell-switcher-item-hover: #333333;      /* var(--cds-layer-hover-01) */
  --cds-ui-shell-switcher-item-active: #525252;     /* var(--cds-layer-active-01) */
  --cds-ui-shell-switcher-item-selected: #393939;   /* var(--cds-layer-selected-01) */
  --cds-ui-shell-switcher-divider: #393939;         /* var(--cds-border-subtle-00) */

  /* SkipToContent */
  --cds-ui-shell-skip-to-content-bg: #161616;       /* var(--cds-background) */
  --cds-ui-shell-skip-to-content-text: #c6c6c6;     /* var(--cds-text-secondary) */
  --cds-ui-shell-skip-to-content-focus: #ffffff;    /* var(--cds-focus) */
}
```

## States Reference (from .scss)

> Pulled from `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/styles/scss/components/ui-shell/header/_header.scss`, `.../side-nav/_side-nav.scss`, `.../header-panel/_header-panel.scss`, and `.../switcher/_switcher.scss`. Hex values resolved per the Theme blocks above.

### Header (`.cds--header`)

| Property | Value |
|---|---|
| Position | `fixed` |
| z-index | `z('header')` |
| Block-size (height) | `mini-units(6)` = `48px` |
| Background | `var(--cds-background)` (`#ffffff` White / `#161616` G100) |
| Border-block-end | `1px solid var(--cds-border-subtle-00)` (`#e0e0e0` White / `#393939` G100) |
| Inset | `inset-block-start: 0; inset-inline: 0;` |
| Display | `flex; align-items: center` |

### HeaderName (`.cds--header__name`)

| State | Background | Color | Border |
|---|---|---|---|
| Rest | (header bg) | `var(--cds-text-primary)` | `2px solid transparent` |
| Hover | (header bg) | `var(--cds-text-primary)` | `2px solid transparent` |
| Focus | (header bg) | `var(--cds-text-primary)` | `2px solid var(--cds-focus)` |

Padding: `0 mini-units(4) 0 mini-units(2)` = `0 32px 0 16px` (`@include breakpoint-up('md')` → `0 spacing-05` = `0 16px`). Type: `body-compact-01` `font-weight: 400`; the `prefix` segment uses `font-weight: 600`. Line-height: `1.25rem`.

### HeaderGlobalAction (`.cds--header__action`)

| State | Background | Icon fill | Border |
|---|---|---|---|
| Rest | transparent | `var(--cds-icon-secondary)` | `1px solid transparent` |
| Hover | `var(--cds-background-hover)` | `var(--cds-icon-primary)` | `1px solid transparent` |
| Active (`:active`) | `var(--cds-background-active)` | `var(--cds-icon-primary)` | `1px solid transparent` |
| isActive (panel open) | `var(--cds-layer-01)` | `var(--cds-icon-primary)` | bottom transparent + sides `1px solid var(--cds-border-subtle-00)` |
| Focus-visible | (rest) | (rest) | `1px solid var(--cds-focus)`, `outline: none` |
| Disabled | n/a (action is icon-only button — uses `cds--btn--disabled`) | dimmed via opacity | n/a |

Dimensions: `block-size: 48px; inline-size: 48px`. SVG icon: `20px × 20px`. Below `md` breakpoint: `min-inline-size: spacing-09` (= `48px`). Transition: `background-color $duration-fast-02, border-color $duration-fast-02` (`110ms`).

### HeaderMenuItem (`.cds--header__menu-item`)

| State | Background | Color | Border / Indicator |
|---|---|---|---|
| Rest | `var(--cds-background)` | `var(--cds-text-secondary)` | `2px solid transparent` |
| Hover | `var(--cds-background-hover)` | `var(--cds-text-primary)` | `2px solid transparent` |
| Active (`:active`) | `var(--cds-background-active)` | `var(--cds-text-primary)` | — |
| Focus | (rest) | (rest) | `2px solid var(--cds-focus)`, `outline: none` |
| Current page (`[aria-current='page']` / `.cds--header__menu-item--current`) | (rest) | `var(--cds-text-primary)` | `::after` `3px` bottom bar `background: var(--cds-border-interactive)` |
| Current page + focus | (rest) | `var(--cds-text-primary)` | full `2px solid var(--cds-focus)` border (the bottom indicator is replaced by the focus border) |

Padding: `0 mini-units(2)` = `0 16px`. Type: `body-compact-01` (`14px / 18px / 400`). Transition: `background-color $duration-fast-02, border-color $duration-fast-02, color $duration-fast-02`.

### HeaderMenu submenu items (inside `<HeaderMenu>` dropdown)

| State | Background | Color |
|---|---|---|
| Rest | `var(--cds-layer)` (= `var(--cds-layer-01)`) | `var(--cds-text-secondary)` |
| Hover | `var(--cds-layer-hover-01)` (`#e8e8e8` White / `#333333` G100) | `var(--cds-text-primary)` |
| Active | `var(--cds-layer-active-01)` (`#c6c6c6` White / `#525252` G100) | `var(--cds-text-primary)` |
| Selected (`isActive` on `<HeaderMenu>`) | `var(--cds-layer-selected-01)` (`#e0e0e0` White / `#393939` G100) | `var(--cds-text-primary)` |
| Selected + hover | `var(--cds-layer-selected-hover)` (`rgba(141,141,141,0.32)`) | `var(--cds-text-primary)` |

### SideNav (`.cds--side-nav`)

| Property | Value |
|---|---|
| Position | `fixed` |
| z-index | `z('header')` |
| Background | `var(--cds-background)` |
| Color | `var(--cds-text-secondary)` |
| Inset | `inset-block: 0; inset-inline-start: 0` (or `inset-block-start: spacing-09` = `48px` when `isChildOfHeader`) |
| Inline-size (default — collapsed/hidden) | `mini-units(6)` = `48px` |
| Inline-size — `--ux` mode (default with header) | `mini-units(32)` = `256px` |
| Inline-size — `--rail` | `mini-units(6)` = `48px` |
| Inline-size — `--hidden` | `0` |
| Inline-size — `--expanded` | `mini-units(32)` = `256px` |
| Max-inline-size | `mini-units(32)` = `256px` |
| Transition | `inline-size 0.11s cubic-bezier(0.2, 0, 1, 0.9), transform 0.11s cubic-bezier(0.2, 0, 1, 0.9)` |
| Will-change | `inline-size` |
| Below `lg` (1056px) | `inline-size: 0` (overlay mode) |

### SideNavMenu / SideNavLink (`.cds--side-nav__submenu`, `.cds--side-nav__link`)

| State | Background | Color | Other |
|---|---|---|---|
| Rest | (parent SideNav bg) | `var(--cds-text-secondary)` | `padding: 0 mini-units(2)` = `0 16px`, `block-size: mini-units(4)` = `32px` |
| Hover (non-active) | `var(--cds-background-hover)` | `var(--cds-text-primary)` | — |
| Focus-visible | (rest) | (rest) | `2px solid var(--cds-focus)` outline (inset, via `focus-outline('outline')` mixin) |
| Active (`.cds--side-nav__item--active`) | `var(--cds-background-selected)` | `var(--cds-text-primary)` | `::before` 3px wide left bar `background: var(--cds-border-interactive)` |
| Active + hover | `var(--cds-background-selected)` | `var(--cds-text-primary)` | — |
| Active submenu (collapsed `aria-expanded='false'`) | `var(--cds-background-selected)` | `var(--cds-text-primary)` | left accent bar |
| `large` variant | (above) | (above) | `block-size: mini-units(6)` = `48px` (chunkier touch target) |

Transition: `background-color $duration-fast-02` (`110ms`).

### SideNavMenuItem (nested children of `SideNavMenu`)

| State | Background | Color | Padding |
|---|---|---|---|
| Rest | (parent bg) | `var(--cds-text-secondary)` | `padding-inline-start: mini-units(4)` = `32px` |
| Rest (under icon menu) | (parent bg) | `var(--cds-text-secondary)` | `padding-inline-start: mini-units(9)` = `72px` |
| Hover | `var(--cds-background-hover)` | `var(--cds-text-primary)` | (above) |
| Active (`active` / `aria-current="page"`) | `var(--cds-background-selected)` | `var(--cds-text-primary)` | (above) — also gets the 3px left accent bar |
| Focus | (rest) | (rest) | `2px solid var(--cds-focus)` outline (inset) |

Block-size: `min-block-size: mini-units(4)` = `32px`. Submenu max-block-size: `0` (collapsed) → `1500px` (expanded — `aria-expanded='true'`).

### SideNavDivider (`.cds--side-nav__divider`)

| Property | Value |
|---|---|
| Background | `var(--cds-border-subtle-00)` |
| Block-size | `1px` |
| Inline-size | `auto` |
| Margin (block) | `mini-units(2)` = `16px` (Carbon source: `block-size: auto; inline-size: auto`) |

### HeaderPanel (`.cds--header-panel`)

| State | Inline-size | Border |
|---|---|---|
| Collapsed (rest) | `0` | `none` |
| Expanded (`.cds--header-panel--expanded`) | `mini-units(32)` = `256px` | `border-inline-end: 1px solid var(--cds-border-subtle-00); border-inline-start: 1px solid var(--cds-border-subtle-00)` |

| Property | Value |
|---|---|
| Position | `fixed` |
| z-index | `z('header')` |
| Background | `var(--cds-layer-01)` |
| Color | `var(--cds-text-secondary)` |
| Inset | `inset-block: mini-units(6) 0; inset-inline-end: 0;` (drops below header, full height to bottom) |
| Transition | `width var(--cds-duration-fast-02) motion(exit, productive)` (`110ms cubic-bezier(0.2, 0, 1, 0.9)`) |
| Overflow-y (when expanded) | `auto` |

### Switcher item link (`.cds--switcher__item-link`)

| State | Background | Color |
|---|---|---|
| Rest | (panel bg) | `var(--cds-text-secondary)` |
| Hover (non-selected) | `var(--cds-layer-hover-01)` | `var(--cds-text-primary)` |
| Active (`:active`) | `var(--cds-layer-active-01)` | `var(--cds-text-primary)` |
| Selected (`.cds--switcher__item-link--selected`) | `var(--cds-layer-selected-01)` | `var(--cds-text-primary)` |
| Focus | (rest) | (rest) — `outline: 2px solid var(--cds-focus); outline-offset: -2px` |

Type: `heading-compact-01` (`14px / 18px / 600`). Padding: `6px spacing-05` = `6px 16px`. Block-size: `spacing-07` = `48px`. Cursor on hover: `pointer`.

### SwitcherDivider (`.cds--switcher__item--divider`)

| Property | Value |
|---|---|
| Background | `var(--cds-border-subtle-00)` |
| Block-size | `1px` |
| Inline-size | `224px` |
| Margin | `spacing-03 spacing-05` = `8px 16px` |
| Display | `block` |
| Border | `none` |

### Overlay (mobile sidenav backdrop, `.cds--side-nav__overlay-active`)

| Property | Value |
|---|---|
| Position | `fixed` |
| z-index | `z('overlay')` |
| Background | `var(--cds-overlay)` (`rgba(22,22,22,0.5)` White / `rgba(0,0,0,0.65)` G100) |
| Block-size | `100vh` |
| Inline-size | `100vw` |
| Inset-block-start | `48px` (clears header) |
| Opacity | `1` (active) / `0` (inactive) |
| Transition | `opacity $transition-expansion $standard-easing, background-color $transition-expansion $standard-easing` |
| Visibility | `@include breakpoint-down('lg')` only (only renders below 1056px) |

### SkipToContent (`.cds--skip-to-content`)

| State | Position | Visibility |
|---|---|---|
| Rest | absolute, off-screen via clipping | hidden until `:focus` |
| Focus | `top: 0; left: 0` | visible: `padding: 0 1rem; border: 4px solid var(--cds-focus); background: var(--cds-background); color: var(--cds-text-secondary)` |

## Animation & Motion

Carbon's UIShell uses three motion durations and one easing curve from `@carbon/motion`. All transitions respect `prefers-reduced-motion: reduce`.

```css
/* SideNav expand / collapse — fastest, productive */
.cds--side-nav {
  transition:
    inline-size 0.11s cubic-bezier(0.2, 0, 1, 0.9),    /* productive standard */
    transform 0.11s cubic-bezier(0.2, 0, 1, 0.9);
  will-change: inline-size;
}

/* Header action button hover/focus (110ms = $duration-fast-02) */
.cds--header__action {
  transition:
    background-color 110ms,
    border-color 110ms;
}

/* HeaderMenuItem text + bg + border transitions */
.cds--header__menu-item {
  transition:
    background-color 110ms,
    border-color 110ms,
    color 110ms;
}

/* SideNav item background transition */
.cds--side-nav__submenu,
.cds--side-nav__link {
  transition: background-color 110ms;
}

/* HeaderPanel slide-in (exit-productive easing on close, entrance on open) */
.cds--header-panel {
  transition: width 110ms cubic-bezier(0.2, 0, 1, 0.9);
  will-change: width;
}

/* Mobile SideNav overlay fade (slower — $transition-expansion = 200ms, $standard-easing) */
.cds--side-nav__overlay {
  transition:
    opacity 200ms cubic-bezier(0.2, 0, 0.38, 0.9),
    background-color 200ms cubic-bezier(0.2, 0, 0.38, 0.9);
}

/* Submenu chevron rotation on expand */
.cds--side-nav__submenu[aria-expanded='true']
  .cds--side-nav__submenu-chevron > svg {
  transform: rotate(180deg);
  transition: transform 110ms cubic-bezier(0.2, 0, 1, 0.9);
}

/* Submenu height collapse/expand */
.cds--side-nav__menu {
  max-block-size: 0;
  transition: max-block-size 110ms cubic-bezier(0.2, 0, 1, 0.9);
}
.cds--side-nav__submenu[aria-expanded='true']
  + .cds--side-nav__menu {
  max-block-size: 1500px;
}

@media (prefers-reduced-motion: reduce) {
  .cds--side-nav,
  .cds--header__action,
  .cds--header__menu-item,
  .cds--side-nav__submenu,
  .cds--side-nav__link,
  .cds--header-panel,
  .cds--side-nav__overlay,
  .cds--side-nav__menu {
    transition: none;
  }
  .cds--side-nav__submenu-chevron > svg {
    transition: none;
  }
}
```

**Token resolution** (from `@carbon/motion`):

| Token | Value |
|---|---|
| `$duration-fast-01` | `70ms` (used for icon transitions) |
| `$duration-fast-02` | `110ms` (used for header actions, side-nav items, header-panel) |
| `$duration-moderate-01` | `150ms` |
| `$duration-moderate-02` | `240ms` |
| `$transition-expansion` | `200ms` (used for mobile overlay) |
| `$standard-easing` | `cubic-bezier(0.2, 0, 0.38, 0.9)` |
| `motion(exit, productive)` | `cubic-bezier(0.2, 0, 1, 0.9)` |
| `motion(entrance, productive)` | `cubic-bezier(0, 0, 0.38, 0.9)` |

## Accessibility (from Carbon's docs + source)

### Semantic elements

| Component | Rendered element | Notes |
|---|---|---|
| `Header` / `<cds-header>` | `<header>` | `role` is implicit. Carbon adds `aria-label` (required prop). |
| `HeaderMenuButton` / `<cds-header-menu-button>` | `<button>` | The hamburger toggle. `aria-label` toggles between "Open menu" / "Close menu". |
| `HeaderName` / `<cds-header-name>` | `<a>` | Anchor with `prefix` segment in a `<span>`. |
| `HeaderNavigation` / `<cds-header-nav>` | `<nav>` | `aria-label` required to distinguish from SideNav. |
| `HeaderMenuItem` / `<cds-header-nav-item>` | `<li><a>` | The current-page item gets `aria-current="page"`. |
| `HeaderMenu` / `<cds-header-menu>` | `<li><a aria-haspopup="true" aria-expanded="…">` + `<ul>` | The dropdown trigger uses `aria-haspopup` and toggles `aria-expanded`. |
| `HeaderGlobalBar` | `<div>` | Container; no role. |
| `HeaderGlobalAction` / `<cds-header-global-action>` | `<button>` | Always include `aria-label` (icon-only). `isActive` toggles. |
| `HeaderPanel` / `<cds-header-panel>` | `<aside>` | Right-aligned drawer; `aria-label` required. |
| `SideNav` / `<cds-side-nav>` | `<nav>` | `aria-label` required. |
| `SideNavItems` / `<cds-side-nav-items>` | `<ul>` | Semantic list. |
| `SideNavLink` / `<cds-side-nav-link>` | `<li><a>` | The current-page item gets `aria-current="page"`. |
| `SideNavMenu` / `<cds-side-nav-menu>` | `<li><button aria-expanded="…">` + `<ul>` | Disclosure pattern. |
| `SideNavMenuItem` / `<cds-side-nav-menu-item>` | `<li><a>` | Use `aria-current="page"` to mark the active sub-item. |
| `SideNavDivider` / `<cds-side-nav-divider>` | `<hr>` | Semantic divider. |
| `Switcher` / `<cds-switcher>` | `<ul>` | `aria-label="Switcher Container"` recommended. |
| `SwitcherItem` / `<cds-switcher-item>` | `<li><a>` | `aria-label` required (for screen-reader context). |
| `SwitcherDivider` / `<cds-switcher-divider>` | `<hr>` | Visual + semantic divider. |
| `SkipToContent` / `<cds-skip-to-content>` | `<a href="#main-content">` | First focusable element in the header. Always render it. |

### ARIA the source applies

- `aria-label` is **required** on `Header`, `HeaderNavigation`, `SideNav`, `HeaderPanel`, `Switcher`, and every `HeaderGlobalAction` / `SwitcherItem`.
- `aria-expanded` on `HeaderMenuButton` toggles synchronously with `isActive`.
- `aria-expanded` on `SideNavMenu` and `HeaderMenu` flips with the disclosure state; the chevron rotates via `[aria-expanded='true']` selector.
- `aria-current="page"` marks the active leaf nav item (both `SideNavMenuItem` and `HeaderMenuItem`). The 3px accent bar / underline is bound to the `[aria-current='page']` selector.
- `aria-haspopup="true"` on `HeaderMenu` triggers.
- `id` + `panel-id` (WC) or `href="#notification-button"` (React `HeaderPanel`) wires the panel to its trigger for `aria-controls`-style relationship.
- `tooltip-text` (WC) / tooltip rendered via `<HeaderGlobalAction>` (React) gives screen-reader-redundant labels for the icon buttons.

### Keyboard

| Key | Behavior |
|---|---|
| `[Tab]` | Moves through `SkipToContent` → `HeaderMenuButton` → `HeaderName` → `HeaderNavigation` items → `HeaderGlobalAction`s → `HeaderPanel` content (when open) → `SideNav` items → main content. The `[Tab]` order is intentionally header-first so screen-reader users land on global navigation immediately. |
| `[Enter]` / `[Space]` | Activates buttons (`HeaderMenuButton`, `HeaderGlobalAction`, `SideNavMenu` toggle), follows links (`HeaderMenuItem`, `SideNavLink`, `SideNavMenuItem`, `SwitcherItem`). |
| `[Escape]` | Closes any open `HeaderPanel` (the React story's `HeaderWActionsAndRightPanel` shows the canonical `handleKeyDown(event)` pattern). Also closes the `HeaderMenu` dropdown. |
| `[Arrow Down]` / `[Arrow Up]` | Inside an open `HeaderMenu` dropdown: navigates between sub-items. Inside `HeaderNavigation`: moves focus between top-level menu items. |
| `[Arrow Right]` / `[Arrow Left]` | Inside `HeaderNavigation`: moves focus between sibling top-level items (menubar pattern). |
| `[Home]` / `[End]` | Jumps to first / last item inside a menubar. |

### Focus management

- **Focus ring**: Carbon uses a `1-2px solid var(--cds-focus)` border (NOT outline) on most shell elements — `1px` for `HeaderGlobalAction` and `2px` for `HeaderName` / `HeaderMenuItem`. SideNav items use the `focus-outline('outline')` mixin which applies a `2px solid var(--cds-focus)` inset outline. **Never remove these focus indicators** — they are the keyboard-navigation backbone.
- **Focus-trap**: When the SideNav opens as an overlay (mobile `breakpoint-down('lg')`), Carbon's `onSideNavBlur` and `onOverlayClick` callbacks dismiss it — but the focus does NOT trap (Carbon's SideNav is intentionally non-modal). To trap focus, compose with `<FocusTrap>` from `@carbon/react`.
- **HeaderPanel**: The right-side drawer auto-closes on blur (`closePanel` pattern in the story), but does NOT trap focus by default. For modal-style behavior, use the `Modal` component instead.
- **Skip link**: `SkipToContent` href targets `#main-content` — this id MUST exist on your `<Content>` / `<main>` element. Without it, the skip link is broken.

### Touch targets

- `HeaderGlobalAction`: `48px × 48px` — meets WCAG 2.5.5 (minimum 44×44 CSS pixels).
- `HeaderMenuButton` (hamburger): `48px × 48px` — meets WCAG.
- `HeaderName`: full header height (`48px`) — adequate.
- `HeaderMenuItem`: full header height (`48px`) tall, variable width — adequate.
- `SideNavMenu` / `SideNavLink` (default): `32px` tall — **does NOT meet WCAG 2.5.5 minimum** (44px). For mobile-first products, use the `large` prop to bump to `48px`. For desktop-only enterprise tools (Carbon's primary audience), `32px` is the documented Carbon convention; the height density is a deliberate tradeoff for data-dense apps.
- `SideNavMenuItem`: `32px` tall — same caveat as above. The `padding-inline-start` of `32px` (or `72px` under icon menu) leaves the click area generous despite the short height.

### Screen reader behavior

- The hamburger announces "Open menu" / "Close menu" on toggle (the `aria-label` is bound to `isSideNavExpanded` state).
- Active sidenav items announce as "current page" via `aria-current="page"`.
- Open `HeaderMenu` dropdowns announce as "expanded" via `aria-expanded="true"`.
- `HeaderGlobalAction` icons announce by their `aria-label` — never ship an icon button without a label.

## Do / Don't

| Do | Don't |
|---|---|
| Output the Storybook code AS-IS for Carbon outputs — every `<Header>`, `<SideNav>`, `<HeaderGlobalAction>` element name and prop is from the Carbon source | Don't paraphrase or rewrite — use the verbatim code; don't substitute `<header>` with a generic `<div role="banner">` |
| Use `border-radius: 0` on every shell element (Header, SideNav, HeaderPanel, Switcher items, action buttons) | Don't add `border-radius: 4px` or `8px` to the shell — that immediately reads as Material/Apple, not Carbon |
| Wrap the page in `[data-theme="white"]` (light) or `[data-theme="g100"]` (dark) on `<html>` or a parent container | Don't define your own theme classes (`.theme-light`, `.dark-mode`) — they won't pick up `--cds-*` tokens |
| Use Carbon's tonal layering for active states (`background-selected` for sidenav active, `layer-01` for active header action) | Don't use drop-shadows for elevation — Carbon shell is FLAT |
| Use the 3px `border-interactive` left bar on active `SideNavMenuItem` / `SideNavLink`, and 3px `border-interactive` bottom bar on `aria-current="page"` `HeaderMenuItem` | Don't substitute the active accent with a fill color or outline — the accent bar is the recognisable Carbon signature |
| Keep `HeaderGlobalAction` icons at `20px × 20px` and `SideNav` icons at `16px × 16px` | Don't mix icon sizes — Carbon's grid is 20px for header actions and 16px for sidenav category icons |
| Always include `<SkipToContent />` as the first child of `<Header>` (and an `id="main-content"` on your `<Content>`) | Don't omit the skip link — it's WCAG 2.4.1 |
| Always provide `aria-label` on `Header`, `HeaderNavigation`, `SideNav`, `HeaderGlobalAction`, `HeaderPanel`, and `Switcher` | Don't ship icon-only `HeaderGlobalAction` without `aria-label` — screen readers will announce "button" with no context |
| Use `HeaderContainer` to manage `isSideNavExpanded` state (it provides `onClickSideNavExpand` callback) | Don't wire your own `useState` if you can avoid it — `HeaderContainer` is the canonical hook for shell state |
| Use `collapse-mode="responsive"` (WC) / default `<SideNav>` (React) for products that need persistent left nav on desktop and overlay on mobile | Don't use `collapse-mode="fixed"` on screens narrower than `lg` — fixed nav at 256px on a 360px phone leaves no room for content |
| Use Rail mode (`isRail` / `collapse-mode="rail"`) for data-dense apps (DataTables, dashboards) where every horizontal pixel matters | Don't use Rail mode if your `SideNavMenu` titles are >8 chars — they'll truncate before they're useful |
| Pin `HeaderPanel` to a specific `HeaderGlobalAction` via `href="#button-id"` (React) or `panel-id="panel-id"` (WC) | Don't open multiple `HeaderPanel`s simultaneously — Carbon expects one drawer at a time |
| Use `Switcher` inside a `HeaderPanel` for cross-product navigation (the IBM Cloud / IBM Watson app launcher pattern) | Don't put a `Switcher` directly in the header — it must be in a `HeaderPanel` to get the right-aligned slide-in behavior |
| For the active state, set `isActive={true}` on `<SideNavMenu>` AND `aria-current="page"` on the deepest `<SideNavMenuItem>` — both are needed | Don't rely on color-only signaling for the active page — `aria-current` is the screen-reader contract |
| Compose the layout: `<Header>` (fixed top) + `<SideNav>` (fixed left) + `<Content id="main-content">` with `margin-left: 16rem; margin-top: 3rem` | Don't manually position the shell — Carbon's `<Content>` component handles the offset; for plain HTML, use the documented margins |
| Respect `prefers-reduced-motion` — Carbon's source disables all transitions in that mode (extend the same to your custom shell additions) | Don't add custom 500ms slide animations — Carbon shell is fast (110ms productive) by design |
