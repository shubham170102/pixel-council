---
name: ibm-carbon-overview
description: Complete Carbon v11 token system — 4 themes (White/G10/G90/G100), IBM Plex type scale (productive + expressive), motion tokens, 2x grid, shape rules
metadata:
  tags: ibm, carbon, design tokens, themes, ibm plex, motion, 2x grid, enterprise, dark mode, ai
---

# Overview -- IBM Carbon Design System

> Source: [v11.carbondesignsystem.com](https://v11.carbondesignsystem.com/) — IBM Carbon v11 (Apache 2.0 license)
> Packages: `@carbon/colors`, `@carbon/themes`, `@carbon/type`, `@carbon/motion`, `@carbon/grid`, `@carbon/icons`, `@carbon/pictograms`, `@carbon/layout`

## Core Philosophy

Carbon is IBM's open-source design system for products, websites, and AI experiences. It is built for **enterprise scale** — data-dense dashboards, complex workflows, multi-theme deployments, and AI-augmented surfaces. Where Apple optimizes for warmth and consumer delight, and Material 3 optimizes for personalized expression, Carbon optimizes for **clarity at density** and **trustable depth of information**.

Five principles distinguish Carbon from every other major system:

1. **Sharp by default** — every component uses `border-radius: 0`. The few exceptions (Tag, Tooltip, Popover at `2px`) are explicit. Rounded corners are the single biggest tell that an output is non-Carbon.
2. **Four themes**, not two — White and G10 are light variants; G90 and G100 are dark variants. The same UI can be deployed across any combination, and product teams pick the pair that matches their context.
3. **Productive vs Expressive** — two parallel type and motion ladders. Productive (compact, fast) for product UI; Expressive (large, deliberate) for marketing and editorial.
4. **Layer tier nesting** — surface elevation is communicated through tokenised background tiers (`background → layer-01 → layer-02 → layer-03`), not through drop shadows. Carbon is FLAT.
5. **First-class AI tokens** — Carbon was the first major system to ship dedicated tokens for AI surfaces (aiAura gradients, AI popovers, chat shells). These are part of the foundation, not an add-on.

The `--cds-*` CSS custom property prefix used throughout this file maps 1:1 to Carbon's official `cds--` Sass prefix (dehyphenated for CSS variables).

---

## Shape Rules — READ FIRST

Carbon is **sharp by default**. The vast majority of components use `border-radius: 0`. This is Carbon's most recognisable visual signature.

| Component | Border radius |
|---|---|
| Button (all variants — primary, secondary, tertiary, ghost, danger) | `0` |
| Tile (clickable, expandable, selectable, multi-select, radio) | `0` |
| TextInput, TextArea, NumberInput, PasswordInput | `0` |
| Dropdown, Select, MultiSelect, ComboBox | `0` |
| Modal, ComposedModal, Dialog | `0` |
| Notification (inline, toast, actionable) | `0` |
| DataTable rows and headers | `0` |
| Accordion, Tabs, ContentSwitcher | `0` |
| Skeleton placeholder | `0` |
| Checkbox, RadioButton (inputs themselves) | `0` (checkbox), `50%` (radio circle only) |
| Tag (filter, operational, selectable, dismissible) | `2px` |
| Tooltip, Popover, Toggletip | `2px` |

**Never** add `border-radius` to a Carbon component beyond these explicit values. If you find yourself reaching for `border-radius: 4px` or `8px`, you are not building Carbon — you are building Material or Apple. Stop and reset to `0`.

---

## Color Palette (`@carbon/colors`)

The base palette is 122 hex values: black, white, plus 12 colour scales (3 neutrals + 9 chromatic) at 10 grades each. Every semantic theme token below resolves to one of these literals.

```css
:root {
  /* ===== ABSOLUTES ===== */
  --cds-color-black: #000000;
  --cds-color-white: #ffffff;

  /* ===== GRAY (neutral) ===== */
  --cds-color-gray-10: #f4f4f4;
  --cds-color-gray-20: #e0e0e0;
  --cds-color-gray-30: #c6c6c6;
  --cds-color-gray-40: #a8a8a8;
  --cds-color-gray-50: #8d8d8d;
  --cds-color-gray-60: #6f6f6f;
  --cds-color-gray-70: #525252;
  --cds-color-gray-80: #393939;
  --cds-color-gray-90: #262626;
  --cds-color-gray-100: #161616;

  /* ===== COOL GRAY (neutral, slight blue tint) ===== */
  --cds-color-cool-gray-10: #f2f4f8;
  --cds-color-cool-gray-20: #dde1e6;
  --cds-color-cool-gray-30: #c1c7cd;
  --cds-color-cool-gray-40: #a2a9b0;
  --cds-color-cool-gray-50: #878d96;
  --cds-color-cool-gray-60: #697077;
  --cds-color-cool-gray-70: #4d5358;
  --cds-color-cool-gray-80: #343a3f;
  --cds-color-cool-gray-90: #21272a;
  --cds-color-cool-gray-100: #121619;

  /* ===== WARM GRAY (neutral, slight red tint) ===== */
  --cds-color-warm-gray-10: #f7f3f2;
  --cds-color-warm-gray-20: #e5e0df;
  --cds-color-warm-gray-30: #cac5c4;
  --cds-color-warm-gray-40: #ada8a8;
  --cds-color-warm-gray-50: #8f8b8b;
  --cds-color-warm-gray-60: #726e6e;
  --cds-color-warm-gray-70: #565151;
  --cds-color-warm-gray-80: #3c3838;
  --cds-color-warm-gray-90: #272525;
  --cds-color-warm-gray-100: #171414;

  /* ===== BLUE (interactive, primary brand) ===== */
  --cds-color-blue-10: #edf5ff;
  --cds-color-blue-20: #d0e2ff;
  --cds-color-blue-30: #a6c8ff;
  --cds-color-blue-40: #78a9ff;
  --cds-color-blue-50: #4589ff;
  --cds-color-blue-60: #0f62fe;
  --cds-color-blue-70: #0043ce;
  --cds-color-blue-80: #002d9c;
  --cds-color-blue-90: #001d6c;
  --cds-color-blue-100: #001141;

  /* ===== RED (error, danger) ===== */
  --cds-color-red-10: #fff1f1;
  --cds-color-red-20: #ffd7d9;
  --cds-color-red-30: #ffb3b8;
  --cds-color-red-40: #ff8389;
  --cds-color-red-50: #fa4d56;
  --cds-color-red-60: #da1e28;
  --cds-color-red-70: #a2191f;
  --cds-color-red-80: #750e13;
  --cds-color-red-90: #520408;
  --cds-color-red-100: #2d0709;

  /* ===== MAGENTA ===== */
  --cds-color-magenta-10: #fff0f7;
  --cds-color-magenta-20: #ffd6e8;
  --cds-color-magenta-30: #ffafd2;
  --cds-color-magenta-40: #ff7eb6;
  --cds-color-magenta-50: #ee5396;
  --cds-color-magenta-60: #d02670;
  --cds-color-magenta-70: #9f1853;
  --cds-color-magenta-80: #740937;
  --cds-color-magenta-90: #510224;
  --cds-color-magenta-100: #2a0a18;

  /* ===== PURPLE ===== */
  --cds-color-purple-10: #f6f2ff;
  --cds-color-purple-20: #e8daff;
  --cds-color-purple-30: #d4bbff;
  --cds-color-purple-40: #be95ff;
  --cds-color-purple-50: #a56eff;
  --cds-color-purple-60: #8a3ffc;
  --cds-color-purple-70: #6929c4;
  --cds-color-purple-80: #491d8b;
  --cds-color-purple-90: #31135e;
  --cds-color-purple-100: #1c0f30;

  /* ===== CYAN ===== */
  --cds-color-cyan-10: #e5f6ff;
  --cds-color-cyan-20: #bae6ff;
  --cds-color-cyan-30: #82cfff;
  --cds-color-cyan-40: #33b1ff;
  --cds-color-cyan-50: #1192e8;
  --cds-color-cyan-60: #0072c3;
  --cds-color-cyan-70: #00539a;
  --cds-color-cyan-80: #003a6d;
  --cds-color-cyan-90: #012749;
  --cds-color-cyan-100: #061727;

  /* ===== TEAL ===== */
  --cds-color-teal-10: #d9fbfb;
  --cds-color-teal-20: #9ef0f0;
  --cds-color-teal-30: #3ddbd9;
  --cds-color-teal-40: #08bdba;
  --cds-color-teal-50: #009d9a;
  --cds-color-teal-60: #007d79;
  --cds-color-teal-70: #005d5d;
  --cds-color-teal-80: #004144;
  --cds-color-teal-90: #022b30;
  --cds-color-teal-100: #081a1c;

  /* ===== GREEN (success) ===== */
  --cds-color-green-10: #defbe6;
  --cds-color-green-20: #a7f0ba;
  --cds-color-green-30: #6fdc8c;
  --cds-color-green-40: #42be65;
  --cds-color-green-50: #24a148;
  --cds-color-green-60: #198038;
  --cds-color-green-70: #0e6027;
  --cds-color-green-80: #044317;
  --cds-color-green-90: #022d0d;
  --cds-color-green-100: #071908;

  /* ===== YELLOW (caution) ===== */
  --cds-color-yellow-10: #fcf4d6;
  --cds-color-yellow-20: #fddc69;
  --cds-color-yellow-30: #f1c21b;
  --cds-color-yellow-40: #d2a106;
  --cds-color-yellow-50: #b28600;
  --cds-color-yellow-60: #8e6a00;
  --cds-color-yellow-70: #684e00;
  --cds-color-yellow-80: #483700;
  --cds-color-yellow-90: #302400;
  --cds-color-yellow-100: #1c1500;

  /* ===== ORANGE (warning) ===== */
  --cds-color-orange-10: #fff2e8;
  --cds-color-orange-20: #ffd9be;
  --cds-color-orange-30: #ffb784;
  --cds-color-orange-40: #ff832b;
  --cds-color-orange-50: #eb6200;
  --cds-color-orange-60: #ba4e00;
  --cds-color-orange-70: #8a3800;
  --cds-color-orange-80: #5e2900;
  --cds-color-orange-90: #3e1a00;
  --cds-color-orange-100: #231000;
}
```

---

## Theme: White (light primary, default)

White is Carbon's **default light theme**. Background is pure white; surfaces lift through Layer-01 (gray-10) tinted backgrounds, not shadows. Use White for product UI, dashboards, and most marketing pages where you want maximum contrast against text.

```css
[data-theme="white"] {
  /* Backgrounds */
  --cds-background: #ffffff;
  --cds-background-inverse: #393939;
  --cds-background-brand: #0f62fe;
  --cds-background-active: rgba(141, 141, 141, 0.5);
  --cds-background-hover: rgba(141, 141, 141, 0.12);
  --cds-background-selected: rgba(141, 141, 141, 0.2);
  --cds-background-selected-hover: rgba(141, 141, 141, 0.32);
  --cds-background-inverse-hover: #4c4c4c;

  /* Layer tiers */
  --cds-layer-01: #f4f4f4;
  --cds-layer-02: #ffffff;
  --cds-layer-03: #f4f4f4;
  --cds-layer-hover-01: #e8e8e8;
  --cds-layer-hover-02: #e8e8e8;
  --cds-layer-hover-03: #e8e8e8;
  --cds-layer-active-01: #c6c6c6;
  --cds-layer-active-02: #c6c6c6;
  --cds-layer-active-03: #c6c6c6;
  --cds-layer-selected-01: #e0e0e0;
  --cds-layer-selected-02: #e0e0e0;
  --cds-layer-selected-03: #e0e0e0;
  --cds-layer-selected-inverse: #161616;
  --cds-layer-accent-01: #e0e0e0;
  --cds-layer-accent-02: #e0e0e0;
  --cds-layer-accent-03: #e0e0e0;

  /* Field (form input backgrounds) */
  --cds-field-01: #f4f4f4;
  --cds-field-02: #ffffff;
  --cds-field-03: #f4f4f4;
  --cds-field-hover-01: #e8e8e8;
  --cds-field-hover-02: #e8e8e8;
  --cds-field-hover-03: #e8e8e8;

  /* Borders */
  --cds-border-subtle-00: #e0e0e0;
  --cds-border-subtle-01: #c6c6c6;
  --cds-border-subtle-02: #e0e0e0;
  --cds-border-subtle-03: #c6c6c6;
  --cds-border-strong-01: #8d8d8d;
  --cds-border-strong-02: #8d8d8d;
  --cds-border-strong-03: #8d8d8d;
  --cds-border-tile-01: #c6c6c6;
  --cds-border-tile-02: #a8a8a8;
  --cds-border-tile-03: #c6c6c6;
  --cds-border-inverse: #161616;
  --cds-border-interactive: #0f62fe;
  --cds-border-disabled: #c6c6c6;

  /* Text */
  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-placeholder: #a8a8a8;
  --cds-text-helper: #6f6f6f;
  --cds-text-error: #da1e28;
  --cds-text-inverse: #ffffff;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #8d8d8d;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  /* Links */
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;
  --cds-link-secondary: #0043ce;
  --cds-link-visited: #8a3ffc;
  --cds-link-inverse: #78a9ff;

  /* Icons */
  --cds-icon-primary: #161616;
  --cds-icon-secondary: #525252;
  --cds-icon-inverse: #ffffff;
  --cds-icon-on-color: #ffffff;
  --cds-icon-on-color-disabled: #8d8d8d;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-interactive: #0f62fe;

  /* Support / status */
  --cds-support-error: #da1e28;
  --cds-support-success: #24a148;
  --cds-support-warning: #f1c21b;
  --cds-support-info: #0043ce;
  --cds-support-error-inverse: #fa4d56;
  --cds-support-success-inverse: #42be65;
  --cds-support-warning-inverse: #f1c21b;
  --cds-support-info-inverse: #4589ff;
  --cds-support-caution-minor: #f1c21b;
  --cds-support-caution-major: #ff832b;
  --cds-support-caution-undefined: #8a3ffc;

  /* Focus */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
  --cds-focus-inverse: #ffffff;

  /* Buttons */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0050e6;
  --cds-button-primary-active: #002d9c;
  --cds-button-secondary: #393939;
  --cds-button-secondary-hover: #4c4c4c;
  --cds-button-secondary-active: #6f6f6f;
  --cds-button-tertiary: #0f62fe;
  --cds-button-tertiary-hover: #0050e6;
  --cds-button-tertiary-active: #002d9c;
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #da1e28;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;
  --cds-button-disabled: #c6c6c6;
  --cds-button-separator: #e0e0e0;

  /* Interactive */
  --cds-interactive: #0f62fe;
  --cds-highlight: #d0e2ff;
  --cds-overlay: rgba(22, 22, 22, 0.5);
  --cds-toggle-off: #8d8d8d;
  --cds-shadow: rgba(0, 0, 0, 0.3);
  --cds-skeleton-background: #e8e8e8;
  --cds-skeleton-element: #c6c6c6;

  /* AI surfaces (Carbon v11.40+) */
  --cds-ai-aura-start: rgba(69, 137, 255, 0.1);
  --cds-ai-aura-end: rgba(255, 255, 255, 0);
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-hover-end: rgba(255, 255, 255, 0);
  --cds-ai-aura-hover-background: #edf5ff;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #78a9ff;
  --cds-ai-border-strong: #4589ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-ai-drop-shadow: rgba(15, 98, 254, 0.1);
  --cds-ai-popover-background: #ffffff;
  --cds-ai-popover-shadow-outer-01: rgba(0, 0, 0, 0.06);
  --cds-ai-popover-shadow-outer-02: rgba(0, 0, 0, 0.04);
  --cds-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-ai-skeleton-background: #4589ff;
  --cds-ai-skeleton-element-background: rgba(15, 98, 254, 0.3);

  /* Chat surfaces */
  --cds-chat-prompt-background: #ffffff;
  --cds-chat-prompt-border-start: #f4f4f4;
  --cds-chat-prompt-border-end: rgba(244, 244, 244, 0);
  --cds-chat-bubble-user: #e0e0e0;
  --cds-chat-bubble-agent: #ffffff;
  --cds-chat-bubble-border: #e0e0e0;
  --cds-chat-avatar-bot: #6f6f6f;
  --cds-chat-avatar-agent: #393939;
  --cds-chat-avatar-user: #0f62fe;
  --cds-chat-shell-background: #ffffff;
  --cds-chat-header-background: #ffffff;
  --cds-chat-button: #525252;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.12);
  --cds-chat-button-text-hover: #0043ce;
  --cds-chat-button-active: rgba(141, 141, 141, 0.5);
  --cds-chat-button-selected: #d0e2ff;
  --cds-chat-button-text-selected: #0043ce;
}
```

---

## Theme: G10 (light alternate)

G10 inverts the surface relationship of White: the page background is `gray-10` (`#f4f4f4`), and content tiles use white on top. Use G10 when you want soft contrast (forms, settings, secondary marketing pages) or when alternating bands with White sections.

```css
[data-theme="g10"] {
  /* Backgrounds */
  --cds-background: #f4f4f4;
  --cds-background-inverse: #393939;
  --cds-background-brand: #0f62fe;
  --cds-background-active: rgba(141, 141, 141, 0.5);
  --cds-background-hover: rgba(141, 141, 141, 0.12);
  --cds-background-selected: rgba(141, 141, 141, 0.2);
  --cds-background-selected-hover: rgba(141, 141, 141, 0.32);
  --cds-background-inverse-hover: #4c4c4c;

  /* Layer tiers (note: layer-01 is white in G10, inverting White's relationship) */
  --cds-layer-01: #ffffff;
  --cds-layer-02: #f4f4f4;
  --cds-layer-03: #ffffff;
  --cds-layer-hover-01: #e8e8e8;
  --cds-layer-hover-02: #e8e8e8;
  --cds-layer-hover-03: #e8e8e8;
  --cds-layer-active-01: #c6c6c6;
  --cds-layer-active-02: #c6c6c6;
  --cds-layer-active-03: #c6c6c6;
  --cds-layer-selected-01: #e0e0e0;
  --cds-layer-selected-02: #e0e0e0;
  --cds-layer-selected-03: #e0e0e0;
  --cds-layer-selected-inverse: #161616;
  --cds-layer-accent-01: #e0e0e0;
  --cds-layer-accent-02: #e0e0e0;
  --cds-layer-accent-03: #e0e0e0;

  /* Field */
  --cds-field-01: #ffffff;
  --cds-field-02: #f4f4f4;
  --cds-field-03: #ffffff;
  --cds-field-hover-01: #e8e8e8;
  --cds-field-hover-02: #e8e8e8;
  --cds-field-hover-03: #e8e8e8;

  /* Borders */
  --cds-border-subtle-00: #c6c6c6;
  --cds-border-subtle-01: #e0e0e0;
  --cds-border-subtle-02: #c6c6c6;
  --cds-border-subtle-03: #e0e0e0;
  --cds-border-strong-01: #8d8d8d;
  --cds-border-strong-02: #8d8d8d;
  --cds-border-strong-03: #8d8d8d;
  --cds-border-tile-01: #c6c6c6;
  --cds-border-tile-02: #a8a8a8;
  --cds-border-tile-03: #c6c6c6;
  --cds-border-inverse: #161616;
  --cds-border-interactive: #0f62fe;
  --cds-border-disabled: #c6c6c6;

  /* Text (same as White) */
  --cds-text-primary: #161616;
  --cds-text-secondary: #525252;
  --cds-text-placeholder: #a8a8a8;
  --cds-text-helper: #6f6f6f;
  --cds-text-error: #da1e28;
  --cds-text-inverse: #ffffff;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #8d8d8d;
  --cds-text-disabled: rgba(22, 22, 22, 0.25);

  /* Links */
  --cds-link-primary: #0f62fe;
  --cds-link-primary-hover: #0043ce;
  --cds-link-secondary: #0043ce;
  --cds-link-visited: #8a3ffc;
  --cds-link-inverse: #78a9ff;

  /* Icons */
  --cds-icon-primary: #161616;
  --cds-icon-secondary: #525252;
  --cds-icon-inverse: #ffffff;
  --cds-icon-on-color: #ffffff;
  --cds-icon-on-color-disabled: #8d8d8d;
  --cds-icon-disabled: rgba(22, 22, 22, 0.25);
  --cds-icon-interactive: #0f62fe;

  /* Support / status */
  --cds-support-error: #da1e28;
  --cds-support-success: #24a148;
  --cds-support-warning: #f1c21b;
  --cds-support-info: #0043ce;
  --cds-support-error-inverse: #fa4d56;
  --cds-support-success-inverse: #42be65;
  --cds-support-warning-inverse: #f1c21b;
  --cds-support-info-inverse: #4589ff;
  --cds-support-caution-minor: #f1c21b;
  --cds-support-caution-major: #ff832b;
  --cds-support-caution-undefined: #8a3ffc;

  /* Focus */
  --cds-focus: #0f62fe;
  --cds-focus-inset: #ffffff;
  --cds-focus-inverse: #ffffff;

  /* Buttons */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0050e6;
  --cds-button-primary-active: #002d9c;
  --cds-button-secondary: #393939;
  --cds-button-secondary-hover: #4c4c4c;
  --cds-button-secondary-active: #6f6f6f;
  --cds-button-tertiary: #0f62fe;
  --cds-button-tertiary-hover: #0050e6;
  --cds-button-tertiary-active: #002d9c;
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #da1e28;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;
  --cds-button-disabled: #c6c6c6;
  --cds-button-separator: #e0e0e0;

  /* Interactive */
  --cds-interactive: #0f62fe;
  --cds-highlight: #d0e2ff;
  --cds-overlay: rgba(22, 22, 22, 0.5);
  --cds-toggle-off: #8d8d8d;
  --cds-shadow: rgba(0, 0, 0, 0.3);
  --cds-skeleton-background: #e8e8e8;
  --cds-skeleton-element: #c6c6c6;

  /* AI surfaces */
  --cds-ai-aura-start: rgba(69, 137, 255, 0.1);
  --cds-ai-aura-end: rgba(244, 244, 244, 0);
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-hover-end: rgba(244, 244, 244, 0);
  --cds-ai-aura-hover-background: #edf5ff;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #78a9ff;
  --cds-ai-border-strong: #4589ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.1);
  --cds-ai-drop-shadow: rgba(15, 98, 254, 0.1);
  --cds-ai-popover-background: #ffffff;
  --cds-ai-overlay: rgba(0, 0, 0, 0.5);
  --cds-ai-skeleton-background: #4589ff;
  --cds-ai-skeleton-element-background: rgba(15, 98, 254, 0.3);

  /* Chat surfaces */
  --cds-chat-prompt-background: #f4f4f4;
  --cds-chat-prompt-border-start: #ffffff;
  --cds-chat-prompt-border-end: rgba(255, 255, 255, 0);
  --cds-chat-bubble-user: #e0e0e0;
  --cds-chat-bubble-agent: #ffffff;
  --cds-chat-bubble-border: #e0e0e0;
  --cds-chat-avatar-bot: #6f6f6f;
  --cds-chat-avatar-agent: #393939;
  --cds-chat-avatar-user: #0f62fe;
  --cds-chat-shell-background: #f4f4f4;
  --cds-chat-header-background: #f4f4f4;
  --cds-chat-button: #525252;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.12);
  --cds-chat-button-text-hover: #0043ce;
  --cds-chat-button-active: rgba(141, 141, 141, 0.5);
  --cds-chat-button-selected: #d0e2ff;
  --cds-chat-button-text-selected: #0043ce;
}
```

---

## Theme: G90 (dark alternate)

G90 is Carbon's **dark alternate**. Background is `gray-90` (`#262626`), one step lighter than G100. Use G90 for marketing/editorial dark pages where you want surfaces to read as elevated rather than as the deepest possible dark.

```css
[data-theme="g90"] {
  /* Backgrounds */
  --cds-background: #262626;
  --cds-background-inverse: #f4f4f4;
  --cds-background-brand: #0f62fe;
  --cds-background-active: rgba(141, 141, 141, 0.4);
  --cds-background-hover: rgba(141, 141, 141, 0.16);
  --cds-background-selected: rgba(141, 141, 141, 0.24);
  --cds-background-selected-hover: rgba(141, 141, 141, 0.32);
  --cds-background-inverse-hover: #e8e8e8;

  /* Layer tiers (lighter as you nest deeper, opposite of light themes) */
  --cds-layer-01: #393939;
  --cds-layer-02: #525252;
  --cds-layer-03: #6f6f6f;
  --cds-layer-hover-01: #4c4c4c;
  --cds-layer-hover-02: #636363;
  --cds-layer-hover-03: #5e5e5e;
  --cds-layer-active-01: #6f6f6f;
  --cds-layer-active-02: #8d8d8d;
  --cds-layer-active-03: #393939;
  --cds-layer-selected-01: #525252;
  --cds-layer-selected-02: #6f6f6f;
  --cds-layer-selected-03: #525252;
  --cds-layer-selected-inverse: #f4f4f4;
  --cds-layer-accent-01: #525252;
  --cds-layer-accent-02: #6f6f6f;
  --cds-layer-accent-03: #525252;

  /* Field */
  --cds-field-01: #393939;
  --cds-field-02: #525252;
  --cds-field-03: #6f6f6f;
  --cds-field-hover-01: #4c4c4c;
  --cds-field-hover-02: #636363;
  --cds-field-hover-03: #5e5e5e;

  /* Borders */
  --cds-border-subtle-00: #525252;
  --cds-border-subtle-01: #6f6f6f;
  --cds-border-subtle-02: #8d8d8d;
  --cds-border-subtle-03: #6f6f6f;
  --cds-border-strong-01: #a8a8a8;
  --cds-border-strong-02: #c6c6c6;
  --cds-border-strong-03: #a8a8a8;
  --cds-border-tile-01: #6f6f6f;
  --cds-border-tile-02: #8d8d8d;
  --cds-border-tile-03: #a8a8a8;
  --cds-border-inverse: #f4f4f4;
  --cds-border-interactive: #4589ff;
  --cds-border-disabled: rgba(141, 141, 141, 0.5);

  /* Text (inverted) */
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-placeholder: #6f6f6f;
  --cds-text-helper: #c6c6c6;
  --cds-text-error: #ffb3b8;
  --cds-text-inverse: #161616;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #6f6f6f;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  /* Links */
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-link-secondary: #a6c8ff;
  --cds-link-visited: #be95ff;
  --cds-link-inverse: #0f62fe;

  /* Icons */
  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-inverse: #161616;
  --cds-icon-on-color: #ffffff;
  --cds-icon-on-color-disabled: #6f6f6f;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-interactive: #ffffff;

  /* Support / status */
  --cds-support-error: #ff8389;
  --cds-support-success: #42be65;
  --cds-support-warning: #f1c21b;
  --cds-support-info: #4589ff;
  --cds-support-error-inverse: #da1e28;
  --cds-support-success-inverse: #24a148;
  --cds-support-warning-inverse: #f1c21b;
  --cds-support-info-inverse: #0043ce;
  --cds-support-caution-minor: #f1c21b;
  --cds-support-caution-major: #ff832b;
  --cds-support-caution-undefined: #a56eff;

  /* Focus */
  --cds-focus: #ffffff;
  --cds-focus-inset: #262626;
  --cds-focus-inverse: #0f62fe;

  /* Buttons */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0353e9;
  --cds-button-primary-active: #002d9c;
  --cds-button-secondary: #6f6f6f;
  --cds-button-secondary-hover: #5e5e5e;
  --cds-button-secondary-active: #393939;
  --cds-button-tertiary: #ffffff;
  --cds-button-tertiary-hover: #f4f4f4;
  --cds-button-tertiary-active: #c6c6c6;
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #ff8389;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;
  --cds-button-disabled: rgba(141, 141, 141, 0.3);
  --cds-button-separator: #161616;

  /* Interactive */
  --cds-interactive: #4589ff;
  --cds-highlight: #002d9c;
  --cds-overlay: rgba(0, 0, 0, 0.65);
  --cds-toggle-off: #8d8d8d;
  --cds-shadow: rgba(0, 0, 0, 0.8);
  --cds-skeleton-background: #333333;
  --cds-skeleton-element: #525252;

  /* AI surfaces */
  --cds-ai-aura-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-end: rgba(38, 38, 38, 0);
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.6);
  --cds-ai-aura-hover-end: rgba(38, 38, 38, 0);
  --cds-ai-aura-hover-background: #333333;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #4589ff;
  --cds-ai-border-strong: #78a9ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-ai-drop-shadow: rgba(0, 0, 0, 0.28);
  --cds-ai-popover-background: #393939;
  --cds-ai-overlay: rgba(0, 0, 0, 0.65);
  --cds-ai-skeleton-background: #78a9ff;
  --cds-ai-skeleton-element-background: rgba(255, 255, 255, 0.3);

  /* Chat surfaces */
  --cds-chat-prompt-background: #262626;
  --cds-chat-prompt-border-start: #525252;
  --cds-chat-prompt-border-end: rgba(82, 82, 82, 0);
  --cds-chat-bubble-user: #525252;
  --cds-chat-bubble-agent: #393939;
  --cds-chat-bubble-border: #525252;
  --cds-chat-avatar-bot: #c6c6c6;
  --cds-chat-avatar-agent: #f4f4f4;
  --cds-chat-avatar-user: #4589ff;
  --cds-chat-shell-background: #262626;
  --cds-chat-header-background: #262626;
  --cds-chat-button: #c6c6c6;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.16);
  --cds-chat-button-text-hover: #a6c8ff;
  --cds-chat-button-active: rgba(141, 141, 141, 0.4);
  --cds-chat-button-selected: #002d9c;
  --cds-chat-button-text-selected: #a6c8ff;
}
```

---

## Theme: G100 (dark primary, default dark)

G100 is Carbon's **default dark theme** and the canonical pair for White (light → dark toggle). Background is `gray-100` (`#161616`), the deepest neutral. Use G100 for product UI in dark mode, OLED-friendly contexts, and AI surfaces where the aiAura gradient reads strongest. The `.dark` class block mirrors the `[data-theme="g100"]` block so both selector strategies work.

```css
[data-theme="g100"],
.dark {
  /* Backgrounds */
  --cds-background: #161616;
  --cds-background-inverse: #f4f4f4;
  --cds-background-brand: #0f62fe;
  --cds-background-active: rgba(141, 141, 141, 0.4);
  --cds-background-hover: rgba(141, 141, 141, 0.16);
  --cds-background-selected: rgba(141, 141, 141, 0.24);
  --cds-background-selected-hover: rgba(141, 141, 141, 0.32);
  --cds-background-inverse-hover: #e8e8e8;

  /* Layer tiers */
  --cds-layer-01: #262626;
  --cds-layer-02: #393939;
  --cds-layer-03: #525252;
  --cds-layer-hover-01: #333333;
  --cds-layer-hover-02: #474747;
  --cds-layer-hover-03: #636363;
  --cds-layer-active-01: #525252;
  --cds-layer-active-02: #6f6f6f;
  --cds-layer-active-03: #8d8d8d;
  --cds-layer-selected-01: #393939;
  --cds-layer-selected-02: #525252;
  --cds-layer-selected-03: #6f6f6f;
  --cds-layer-selected-inverse: #f4f4f4;
  --cds-layer-accent-01: #393939;
  --cds-layer-accent-02: #525252;
  --cds-layer-accent-03: #6f6f6f;

  /* Field */
  --cds-field-01: #262626;
  --cds-field-02: #393939;
  --cds-field-03: #525252;
  --cds-field-hover-01: #333333;
  --cds-field-hover-02: #474747;
  --cds-field-hover-03: #636363;

  /* Borders */
  --cds-border-subtle-00: #393939;
  --cds-border-subtle-01: #525252;
  --cds-border-subtle-02: #6f6f6f;
  --cds-border-subtle-03: #8d8d8d;
  --cds-border-strong-01: #6f6f6f;
  --cds-border-strong-02: #8d8d8d;
  --cds-border-strong-03: #a8a8a8;
  --cds-border-tile-01: #525252;
  --cds-border-tile-02: #6f6f6f;
  --cds-border-tile-03: #8d8d8d;
  --cds-border-inverse: #f4f4f4;
  --cds-border-interactive: #4589ff;
  --cds-border-disabled: rgba(141, 141, 141, 0.5);

  /* Text */
  --cds-text-primary: #f4f4f4;
  --cds-text-secondary: #c6c6c6;
  --cds-text-placeholder: #6f6f6f;
  --cds-text-helper: #c6c6c6;
  --cds-text-error: #ff8389;
  --cds-text-inverse: #161616;
  --cds-text-on-color: #ffffff;
  --cds-text-on-color-disabled: #6f6f6f;
  --cds-text-disabled: rgba(244, 244, 244, 0.25);

  /* Links */
  --cds-link-primary: #78a9ff;
  --cds-link-primary-hover: #a6c8ff;
  --cds-link-secondary: #a6c8ff;
  --cds-link-visited: #be95ff;
  --cds-link-inverse: #0f62fe;

  /* Icons */
  --cds-icon-primary: #f4f4f4;
  --cds-icon-secondary: #c6c6c6;
  --cds-icon-inverse: #161616;
  --cds-icon-on-color: #ffffff;
  --cds-icon-on-color-disabled: #6f6f6f;
  --cds-icon-disabled: rgba(244, 244, 244, 0.25);
  --cds-icon-interactive: #ffffff;

  /* Support / status */
  --cds-support-error: #fa4d56;
  --cds-support-success: #42be65;
  --cds-support-warning: #f1c21b;
  --cds-support-info: #4589ff;
  --cds-support-error-inverse: #da1e28;
  --cds-support-success-inverse: #24a148;
  --cds-support-warning-inverse: #f1c21b;
  --cds-support-info-inverse: #0043ce;
  --cds-support-caution-minor: #f1c21b;
  --cds-support-caution-major: #ff832b;
  --cds-support-caution-undefined: #a56eff;

  /* Focus — pure white in dark themes */
  --cds-focus: #ffffff;
  --cds-focus-inset: #161616;
  --cds-focus-inverse: #0f62fe;

  /* Buttons */
  --cds-button-primary: #0f62fe;
  --cds-button-primary-hover: #0353e9;
  --cds-button-primary-active: #002d9c;
  --cds-button-secondary: #6f6f6f;
  --cds-button-secondary-hover: #5e5e5e;
  --cds-button-secondary-active: #393939;
  --cds-button-tertiary: #ffffff;
  --cds-button-tertiary-hover: #f4f4f4;
  --cds-button-tertiary-active: #c6c6c6;
  --cds-button-danger-primary: #da1e28;
  --cds-button-danger-secondary: #fa4d56;
  --cds-button-danger-hover: #b81921;
  --cds-button-danger-active: #750e13;
  --cds-button-disabled: rgba(141, 141, 141, 0.3);
  --cds-button-separator: #000000;

  /* Interactive */
  --cds-interactive: #4589ff;
  --cds-highlight: #002d9c;
  --cds-overlay: rgba(0, 0, 0, 0.65);
  --cds-toggle-off: #8d8d8d;
  --cds-shadow: rgba(0, 0, 0, 0.8);
  --cds-skeleton-background: #292929;
  --cds-skeleton-element: #393939;

  /* AI surfaces — strongest aiAura in this theme */
  --cds-ai-aura-start: rgba(69, 137, 255, 0.4);
  --cds-ai-aura-end: rgba(22, 22, 22, 0);
  --cds-ai-aura-hover-start: rgba(69, 137, 255, 0.6);
  --cds-ai-aura-hover-end: rgba(22, 22, 22, 0);
  --cds-ai-aura-hover-background: #333333;
  --cds-ai-border-start: rgba(166, 200, 255, 0.36);
  --cds-ai-border-end: #4589ff;
  --cds-ai-border-strong: #78a9ff;
  --cds-ai-inner-shadow: rgba(69, 137, 255, 0.16);
  --cds-ai-drop-shadow: rgba(0, 0, 0, 0.28);
  --cds-ai-popover-background: #262626;
  --cds-ai-popover-shadow-outer-01: rgba(0, 0, 0, 0.16);
  --cds-ai-popover-shadow-outer-02: rgba(0, 0, 0, 0.24);
  --cds-ai-overlay: rgba(0, 0, 0, 0.65);
  --cds-ai-skeleton-background: #78a9ff;
  --cds-ai-skeleton-element-background: rgba(255, 255, 255, 0.3);

  /* Chat surfaces */
  --cds-chat-prompt-background: #161616;
  --cds-chat-prompt-border-start: #393939;
  --cds-chat-prompt-border-end: rgba(57, 57, 57, 0);
  --cds-chat-bubble-user: #393939;
  --cds-chat-bubble-agent: #262626;
  --cds-chat-bubble-border: #393939;
  --cds-chat-avatar-bot: #c6c6c6;
  --cds-chat-avatar-agent: #f4f4f4;
  --cds-chat-avatar-user: #4589ff;
  --cds-chat-shell-background: #161616;
  --cds-chat-header-background: #161616;
  --cds-chat-button: #c6c6c6;
  --cds-chat-button-hover: rgba(141, 141, 141, 0.16);
  --cds-chat-button-text-hover: #a6c8ff;
  --cds-chat-button-active: rgba(141, 141, 141, 0.4);
  --cds-chat-button-selected: #002d9c;
  --cds-chat-button-text-selected: #a6c8ff;
}
```

---

## Theme Switching Pattern

Carbon supports two parallel selector strategies: `[data-theme="..."]` for explicit per-region theming (the canonical Carbon way), and `.dark` class on `<html>` for class-toggle dark mode (matches the convention used by Apple/Google reference files in this project). Both blocks above must exist so either strategy works.

```html
<!-- Default: White theme -->
<html data-theme="white">
  <body>
    <!-- Optional: nest a darker region for an inverted CTA strip -->
    <section data-theme="g100">
      ...content rendered with G100 tokens...
    </section>
  </body>
</html>
```

```js
// Auto: prefer the system color scheme, default to White ↔ G100 pair
function applyCarbonTheme() {
  const isDark = matchMedia('(prefers-color-scheme: dark)').matches;
  document.documentElement.setAttribute('data-theme', isDark ? 'g100' : 'white');
}
applyCarbonTheme();
matchMedia('(prefers-color-scheme: dark)').addEventListener('change', applyCarbonTheme);

// Manual toggle (theme-toggle button on standalone pages)
function toggleCarbonTheme() {
  const current = document.documentElement.getAttribute('data-theme') || 'white';
  const next = current === 'white' || current === 'g10' ? 'g100' : 'white';
  document.documentElement.setAttribute('data-theme', next);
  document.documentElement.classList.toggle('dark', next === 'g100' || next === 'g90');
  localStorage.setItem('cds-theme', next);
}
```

**Default pair:** White ↔ G100. **Alternate pair:** G10 ↔ G90 (softer, less contrast).

---

## Typography — IBM Plex

Carbon uses **IBM Plex** as its corporate typeface family: Plex Sans (UI + display), Plex Serif (rarely, for editorial), Plex Mono (code).

```css
:root {
  --cds-font-sans: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
  --cds-font-serif: 'IBM Plex Serif', Georgia, 'Times New Roman', serif;
  --cds-font-mono: 'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', 'Courier New', monospace;

  --cds-font-weight-light: 300;
  --cds-font-weight-regular: 400;
  --cds-font-weight-semibold: 600;
  --cds-font-weight-bold: 700;
}

body {
  font-family: var(--cds-font-sans);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

Load IBM Plex from Google Fonts:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
  rel="stylesheet"
  href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@300;400;600;700&family=IBM+Plex+Mono:wght@400;500&display=swap"
/>
```

---

## Productive Type Scale

The **productive scale** is fixed (non-responsive) — used for product UI: dashboards, forms, data tables, settings, navigation. Sizes derive from Carbon's `scale[]` array: `[12, 14, 16, 18, 20, 24, 28, 32, 36, 42, 54, 60, 76]px`.

| Token | Size | Line-height | Weight | Letter-spacing | Use |
|---|---|---|---|---|---|
| `caption-01` | 12px | 16px (1.33333) | 400 regular | 0.32px | Caption / metadata |
| `caption-02` | 14px | 18px (1.28572) | 400 regular | 0.32px | Larger caption |
| `label-01` | 12px | 16px (1.33333) | 400 regular | 0.32px | Form labels, eyebrows |
| `label-02` | 14px | 18px (1.28572) | 400 regular | 0.16px | Larger form labels |
| `helper-text-01` | 12px | 16px (1.33333) | 400 regular | 0.32px | Helper / hint copy |
| `helper-text-02` | 14px | 18px (1.28572) | 400 regular | 0.16px | Larger helper |
| `legal-01` | 12px | 16px (1.33333) | 400 regular | 0.32px | Legal disclaimer |
| `legal-02` | 14px | 18px (1.28572) | 400 regular | 0.16px | Larger legal copy |
| `code-01` | 12px | 16px (1.33333) | 400 regular | 0.32px | Inline code, mono |
| `code-02` | 14px | 20px (1.42857) | 400 regular | 0.32px | Code block, mono |
| `body-compact-01` | 14px | 18px (1.28572) | 400 regular | 0.16px | Compact body, tight UI |
| `body-compact-02` | 16px | 22px (1.375) | 400 regular | 0 | Compact body, larger |
| `body-01` | 14px | 20px (1.42857) | 400 regular | 0.16px | Default body |
| `body-02` | 16px | 24px (1.5) | 400 regular | 0 | Long-form body |
| `heading-compact-01` | 14px | 18px (1.28572) | 600 semibold | 0.16px | Compact heading (cards) |
| `heading-compact-02` | 16px | 22px (1.375) | 600 semibold | 0 | Compact heading (larger) |
| `heading-01` | 14px | 20px (1.42857) | 600 semibold | 0.16px | h6-equivalent |
| `heading-02` | 16px | 24px (1.5) | 600 semibold | 0 | h5-equivalent |
| `heading-03` | 20px | 28px (1.4) | 400 regular | 0 | h4-equivalent |
| `heading-04` | 28px | 36px (1.28572) | 400 regular | 0 | h3-equivalent |
| `heading-05` | 32px | 40px (1.25) | 400 regular | 0 | h2-equivalent |
| `heading-06` | 42px | 50px (1.199) | 300 light | 0 | h1-equivalent |
| `heading-07` | 60px | 70px (1.199) | 300 light | 0 | Display heading (productive max) |

**Weight rule:** product headings ≤ `heading-05` use `regular (400)`; `heading-06` and `heading-07` use `light (300)`. Compact + small headings use `semibold (600)` for legibility at size.

**Letter-spacing rule:** `0.32px` at 12px, `0.16px` at 14px, `0` at ≥16px.

---

## Expressive Type Scale

The **expressive scale** is responsive — sizes step up at the `lg` (1056px) breakpoint and again at `max` (1584px) for the largest tokens. Used for marketing pages, landing heroes, editorial sections.

| Token | sm/md size | lg size (≥1056) | max size (≥1584) | Weight | Use |
|---|---|---|---|---|---|
| `expressive-heading-01` | 14px | 14px | 14px | 600 semibold | Eyebrow, small heading |
| `expressive-heading-02` | 16px | 16px | 16px | 600 semibold | Card heading |
| `expressive-heading-03` | 20px | 20px | 20px | 400 regular | Section sub-heading |
| `expressive-heading-04` | 28px | 28px | 28px | 400 regular | Feature title |
| `expressive-heading-05` | 32px | 32px | 32px | 400 regular | Section heading |
| `expressive-heading-06` | 32px | 42px | 42px | 300 light | Section super-heading |
| `expressive-paragraph-01` | 24px | 32px | 36px | 300 light | Long-form lead paragraph |
| `quotation-01` | 20px | 24px | 28px | 400 regular | Pull quote (small) |
| `quotation-02` | 32px | 36px | 42px | 300 light | Pull quote (large) |

Convention: every `-01` suffix means **productive (fixed)**; every `-02` suffix in expressive headings means a **larger / more dramatic** variant.

---

## Display + Fluid Scale

**Display tokens** are the largest type Carbon ships — for marketing heroes, full-bleed CTA bands, and brand moments. **Fluid** variants use CSS `clamp()` to scale smoothly between viewport widths instead of stepping at breakpoints.

| Token | sm size | max size | Weight | Use |
|---|---|---|---|---|
| `display-01` | 42px | 42px | 300 light | Display, fixed |
| `display-02` | 54px | 54px | 300 light | Display, fixed |
| `display-03` | 60px | 60px | 300 light | Display, fixed |
| `display-04` | 76px | 76px | 300 light | Display, fixed (largest) |
| `fluid-display-01` | 42px | 76px | 300 light | Display, fluid |
| `fluid-display-02` | 42px | 76px | 300 light | Display, fluid (alt) |
| `fluid-display-03` | 42px | 76px | 300 light | Section display, fluid |
| `fluid-display-04` | 42px | 92px | 300 light | Hero headline, fluid (largest) |
| `fluid-heading-03` | 20px | 24px | 400 regular | Card subtitle, fluid |
| `fluid-heading-04` | 28px | 32px | 400 regular | Card / feature title, fluid |
| `fluid-heading-05` | 32px | 60px | 400 regular | Sub-hero headline, fluid |
| `fluid-heading-06` | 32px | 60px | 300 light | Section super-heading, fluid |

Example fluid implementation using `clamp()`:

```css
.cds--fluid-display-04 {
  /* 42px (2.625rem) at sm 320, scaling to 92px (5.75rem) at max 1584 */
  font-size: clamp(2.625rem, 2.625rem + (5.75 - 2.625) * ((100vw - 20rem) / (99 - 20)), 5.75rem);
  line-height: 1.199;
  font-weight: 300;
  letter-spacing: 0;
}

.cds--fluid-heading-05 {
  font-size: clamp(2rem, 2rem + (3.75 - 2) * ((100vw - 20rem) / (99 - 20)), 3.75rem);
  line-height: 1.25;
  font-weight: 400;
}
```

**When to use which:** `display-*` (fixed) for desktop-only marketing where you control the viewport; `fluid-display-*` for responsive marketing where one headline must work from mobile to ultra-wide.

---

## Motion Tokens

Carbon ships **6 durations** and **6 easing curves**, paired into Productive (fast UI feedback) and Expressive (slower, more deliberate entrances).

```css
:root {
  /* Durations */
  --cds-duration-fast-01: 70ms;
  --cds-duration-fast-02: 110ms;
  --cds-duration-moderate-01: 150ms;
  --cds-duration-moderate-02: 240ms;
  --cds-duration-slow-01: 400ms;
  --cds-duration-slow-02: 700ms;

  /* Easing curves */
  --cds-easing-productive-standard: cubic-bezier(0.2, 0, 0.38, 0.9);
  --cds-easing-productive-entrance: cubic-bezier(0, 0, 0.38, 0.9);
  --cds-easing-productive-exit: cubic-bezier(0.2, 0, 1, 0.9);
  --cds-easing-expressive-standard: cubic-bezier(0.4, 0.14, 0.3, 1);
  --cds-easing-expressive-entrance: cubic-bezier(0, 0, 0.3, 1);
  --cds-easing-expressive-exit: cubic-bezier(0.4, 0.14, 1, 1);
}

@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

### Productive vs Expressive (when to use which)

| Use case | Duration | Easing |
|---|---|---|
| Button hover / active | `fast-01` 70ms | `productive-standard` |
| Dropdown open / close | `fast-02` 110ms | `productive-entrance` / `productive-exit` |
| Tooltip appear | `fast-02` 110ms | `productive-entrance` |
| Tab switch | `moderate-01` 150ms | `productive-standard` |
| Notification toast slide-in | `moderate-02` 240ms | `productive-entrance` |
| Modal / dialog open | `moderate-02` 240ms | `expressive-entrance` |
| Sidebar / SideNav slide | `moderate-02` 240ms | `expressive-standard` |
| Page transition / hero entrance | `slow-01` 400ms | `expressive-standard` |
| Large surface fade-in (AI popover, marketing reveal) | `slow-02` 700ms | `expressive-entrance` |

**Rule of thumb:** Productive (`fast-*` + `moderate-01`, productive easings) for UI feedback that must feel instant. Expressive (`moderate-02` + `slow-*`, expressive easings) for entrances of large surfaces where the motion *is* the moment.

---

## Spacing Scale

Carbon's spacing scale is a 13-step ladder anchored to a 4px base (with `01` and `02` as fractional 2px / 4px steps). Use these tokens for `padding`, `margin`, `gap`, and any layout offset.

```css
:root {
  --cds-spacing-01: 0.125rem;  /*   2px */
  --cds-spacing-02: 0.25rem;   /*   4px */
  --cds-spacing-03: 0.5rem;    /*   8px */
  --cds-spacing-04: 0.75rem;   /*  12px */
  --cds-spacing-05: 1rem;      /*  16px */
  --cds-spacing-06: 1.5rem;    /*  24px */
  --cds-spacing-07: 2rem;      /*  32px */
  --cds-spacing-08: 2.5rem;    /*  40px */
  --cds-spacing-09: 3rem;      /*  48px */
  --cds-spacing-10: 4rem;      /*  64px */
  --cds-spacing-11: 5rem;      /*  80px */
  --cds-spacing-12: 6rem;      /*  96px */
  --cds-spacing-13: 10rem;     /* 160px */
}
```

| Token | px | Common use |
|---|---|---|
| `spacing-01` | 2px | Hairline offset |
| `spacing-02` | 4px | Icon-to-text gap |
| `spacing-03` | 8px | Tight padding (compact buttons) |
| `spacing-04` | 12px | Field internal padding |
| `spacing-05` | 16px | Default container padding |
| `spacing-06` | 24px | Card padding |
| `spacing-07` | 32px | Section gutters |
| `spacing-08` | 40px | Larger section gap |
| `spacing-09` | 48px | Hero internal padding |
| `spacing-10` | 64px | Section vertical rhythm (small) |
| `spacing-11` | 80px | Section vertical rhythm (medium) |
| `spacing-12` | 96px | Section vertical rhythm (large, marketing) |
| `spacing-13` | 160px | Full-bleed marketing band |

---

## 2x Grid

Carbon's **2x Grid** is a 16-column system with three gutter modes. The grid scales across 5 breakpoints; column count adapts at smaller breakpoints. Max content width is **1584px** — content wider than that is centered.

| Breakpoint | Min width | Columns | Margin | Gutter (wide) | Gutter (narrow) | Gutter (condensed) |
|---|---|---|---|---|---|---|
| `sm` | 320px | 4 | 16px | 32px | 16px | 1px |
| `md` | 672px | 8 | 16px | 32px | 16px | 1px |
| `lg` | 1056px | 16 | 16px | 32px | 16px | 1px |
| `xlg` | 1312px | 16 | 16px | 32px | 16px | 1px |
| `max` | 1584px | 16 | 24px | 32px | 16px | 1px |

```css
:root {
  --cds-grid-max-width: 1584px;
  --cds-grid-gutter: 32px;          /* wide (default) */
  --cds-grid-gutter-narrow: 16px;
  --cds-grid-gutter-condensed: 1px;
  --cds-grid-margin: 16px;
  --cds-grid-margin-max: 24px;

  --cds-breakpoint-sm: 320px;
  --cds-breakpoint-md: 672px;
  --cds-breakpoint-lg: 1056px;
  --cds-breakpoint-xlg: 1312px;
  --cds-breakpoint-max: 1584px;
}

.cds--grid {
  max-width: var(--cds-grid-max-width);
  margin-right: auto;
  margin-left: auto;
  padding-right: var(--cds-grid-margin);
  padding-left: var(--cds-grid-margin);
}

.cds--grid--narrow {
  padding-right: 0;
  padding-left: 0;
}

.cds--grid--condensed .cds--row {
  margin-right: 0;
  margin-left: 0;
}

.cds--row {
  display: flex;
  flex-wrap: wrap;
  margin-right: calc(-1 * var(--cds-grid-gutter) / 2);
  margin-left: calc(-1 * var(--cds-grid-gutter) / 2);
}

[class*="cds--col-"] {
  width: 100%;
  padding-right: calc(var(--cds-grid-gutter) / 2);
  padding-left: calc(var(--cds-grid-gutter) / 2);
}

/* sm 4-col */
.cds--col-sm-1  { flex: 0 0 25%; }
.cds--col-sm-2  { flex: 0 0 50%; }
.cds--col-sm-3  { flex: 0 0 75%; }
.cds--col-sm-4  { flex: 0 0 100%; }

/* md 8-col */
@media (min-width: 672px) {
  .cds--col-md-1 { flex: 0 0 12.5%; }
  .cds--col-md-2 { flex: 0 0 25%; }
  .cds--col-md-3 { flex: 0 0 37.5%; }
  .cds--col-md-4 { flex: 0 0 50%; }
  .cds--col-md-5 { flex: 0 0 62.5%; }
  .cds--col-md-6 { flex: 0 0 75%; }
  .cds--col-md-7 { flex: 0 0 87.5%; }
  .cds--col-md-8 { flex: 0 0 100%; }
}

/* lg 16-col */
@media (min-width: 1056px) {
  .cds--col-lg-1  { flex: 0 0 6.25%; }
  .cds--col-lg-2  { flex: 0 0 12.5%; }
  .cds--col-lg-3  { flex: 0 0 18.75%; }
  .cds--col-lg-4  { flex: 0 0 25%; }
  .cds--col-lg-5  { flex: 0 0 31.25%; }
  .cds--col-lg-6  { flex: 0 0 37.5%; }
  .cds--col-lg-7  { flex: 0 0 43.75%; }
  .cds--col-lg-8  { flex: 0 0 50%; }
  .cds--col-lg-9  { flex: 0 0 56.25%; }
  .cds--col-lg-10 { flex: 0 0 62.5%; }
  .cds--col-lg-11 { flex: 0 0 68.75%; }
  .cds--col-lg-12 { flex: 0 0 75%; }
  .cds--col-lg-13 { flex: 0 0 81.25%; }
  .cds--col-lg-14 { flex: 0 0 87.5%; }
  .cds--col-lg-15 { flex: 0 0 93.75%; }
  .cds--col-lg-16 { flex: 0 0 100%; }
}
```

**Wide (default) vs Narrow vs Condensed:**
- **Wide** — 32px gutters between columns. Default. Use for marketing pages and standard product UI.
- **Narrow** — 16px gutters. Use when content is dense and the wide gutter would feel too airy (dashboards with many tiles).
- **Condensed** — 1px gutters (effectively a hairline). Use for data-dense grids where you want columns to read as one continuous surface (DataTable replacements, image galleries).

---

## Layer Tier System

Carbon does not use drop shadows for surface elevation. Instead, every theme defines four background tiers — `background`, `layer-01`, `layer-02`, `layer-03` — that get progressively *more contrasted* against the body as you nest deeper. Components signal their nesting depth via the `data-layer` attribute, which auto-switches their background, hover, and selected tokens to the next tier.

```html
<body data-theme="white">
  <!-- tier 0: page background = #ffffff -->
  <main class="cds--page">
    <section style="background: var(--cds-layer-01)">
      <!-- tier 1: nested surface = #f4f4f4 (gray-10) -->
      <div data-layer="01">
        <article style="background: var(--cds-layer-02)">
          <!-- tier 2: card on the nested surface = #ffffff again -->
          <div data-layer="02">
            <aside style="background: var(--cds-layer-03)">
              <!-- tier 3: sub-card = #f4f4f4 -->
            </aside>
          </div>
        </article>
      </div>
    </section>
  </main>
</body>
```

**Visual logic per theme:**

| Tier | White | G10 | G90 | G100 |
|---|---|---|---|---|
| `background` | `#ffffff` | `#f4f4f4` | `#262626` | `#161616` |
| `layer-01` | `#f4f4f4` | `#ffffff` | `#393939` | `#262626` |
| `layer-02` | `#ffffff` | `#f4f4f4` | `#525252` | `#393939` |
| `layer-03` | `#f4f4f4` | `#ffffff` | `#6f6f6f` | `#525252` |

In light themes the tiers alternate (white → gray-10 → white → gray-10) for contrast without elevation. In dark themes the tiers ramp lighter (gray-100 → gray-90 → gray-80 → gray-70) so deeper-nested surfaces read as more elevated.

**Rule:** if a component would normally use `--cds-layer-01` and you place it inside a parent with `data-layer="01"`, it should bind to `--cds-layer-02` instead. Carbon's component tokens ship with `--cds-layer` (context-aware) variants for this purpose.

---

## Focus Ring

Carbon's focus ring is a **double-ring** style: a 2px solid outline in the theme's focus colour, with a 1px inset using the background colour to create a thin separator between the focus ring and the component edge. This is a defining visual signature — do not substitute a single-ring outline.

```css
:focus-visible {
  outline: 2px solid var(--cds-focus);
  outline-offset: 0;                                /* Carbon does NOT use offset */
  box-shadow: inset 0 0 0 1px var(--cds-background); /* Inner separator ring */
}

/* For elements on coloured fills (primary buttons, danger buttons), invert the inset */
.cds--btn--primary:focus-visible,
.cds--btn--danger:focus-visible {
  outline: 2px solid var(--cds-focus);
  outline-offset: 0;
  box-shadow: inset 0 0 0 1px var(--cds-focus-inset);
}

/* For elements on inverted backgrounds (e.g., G100 region inside a White page) */
.cds--btn--inverse:focus-visible {
  outline: 2px solid var(--cds-focus-inverse);
  outline-offset: 0;
  box-shadow: inset 0 0 0 1px var(--cds-background);
}
```

In light themes (White, G10): focus = `#0f62fe` (blue-60), inset = `#ffffff`.
In dark themes (G90, G100): focus = `#ffffff`, inset = matches the component's background tier.

**Never** use `outline-offset > 0` for Carbon focus rings. **Never** use the Apple-style soft halo (`box-shadow: 0 0 0 4px rgba(...)`); Carbon's ring is always crisp and on-edge.

---

## Productive vs Expressive — Closing Philosophy

Every token category in Carbon ships in a parallel pair: **Productive** for product UI, **Expressive** for editorial/marketing. They are not interchangeable.

| Dimension | Productive | Expressive |
|---|---|---|
| Type scale | Fixed sizes from `caption-01` through `heading-07` | Responsive sizes from `expressive-heading-01` through `fluid-display-04` |
| Largest size | `heading-07` 60px | `fluid-display-04` 92px |
| Default heading weight | 400 regular (light at 42px+) | 300 light at 28px+ |
| Motion duration | 70-150ms (`fast-*`, `moderate-01`) | 240-700ms (`moderate-02`, `slow-*`) |
| Motion easing | `productive-*` curves | `expressive-*` curves |
| Spacing rhythm | 16-32px between elements | 96-160px between sections |
| Surface chrome | Layer tiers + 1px borders | Generous whitespace + full-bleed bands |
| Use in | Dashboards, settings, forms, data tables, in-app chrome | Landing pages, blog posts, marketing heroes, CTA strips |

**One-line guide:** if a user can stay on the surface for hours doing work, use Productive. If they will scroll past it in seconds, use Expressive.

When in doubt for a Carbon page: if it's a product UI, default to White theme + Productive scale + Productive motion. If it's a marketing/AI experience, default to G100 theme + Expressive scale + Expressive motion + AI tokens. Both surfaces use the same sharp corners, same IBM Plex font, same focus ring, same 2x grid — Carbon's coherence comes from these shared primitives, not from collapsing the two scales into one.
