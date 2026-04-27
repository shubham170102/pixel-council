# Carbon Design System Integration — Design Spec

**Date:** 2026-04-25 (revised 2026-04-26)
**Status:** Approved (user delegated all four open questions on 2026-04-25 — defaulting to recommended options). Revised 2026-04-26 to mandate verbatim Storybook source code per user feedback.
**Source:** IBM Carbon Design System v11 (latest v11.106.0, Apr 2026), Apache 2.0 license

## REVISION 2026-04-26 — Verbatim Source Code Requirement

**The single most important rule for this integration:** every Carbon component reference file embeds the **actual Carbon source code from Storybook** — NOT paraphrased CSS+HTML, NOT recreated markup. Two code blocks per variant per component:

1. **React (verbatim from Storybook):** the exact `render()` function from `packages/react/src/components/{Component}/{Component}.stories.js` for each story variant (Default, Secondary, Tertiary, Ghost, Danger, etc.)
2. **Web Components (verbatim from Storybook):** the exact lit-html template from `packages/web-components/src/components/{component}/{component}.stories.ts` for the same variants

**Why this matters:** The user explicitly said "make sure you are coding and not use ur own things for ui components, u need to use things related to the carbon design only". Apple/Google reference files use paraphrased patterns because the goal there is "Apple-flavored" / "Material-flavored" output. Carbon is the exception — it's an open-source component library where the actual code IS the deliverable. A paraphrased Carbon button is a fake Carbon button.

**SKILL.md will be updated** to instruct the agent: when the locked design system is IBM/Carbon, output the embedded Storybook code AS-IS (with project-specific text/handler swaps) — do NOT regenerate the markup. This rule is Carbon-specific and overrides the general "translate the spec into your framework" guidance from Step 4A.

**Source URLs per component** (replace `{Name}` PascalCase / `{name}` kebab-case):
- React story: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/{Name}/{Name}.stories.js`
- WC story: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.stories.ts`
- React component source (for prop docs): `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/react/src/components/{Name}/{Name}.tsx`
- WC component source: `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.ts`
- WC SCSS (for class targeting): `https://raw.githubusercontent.com/carbon-design-system/carbon/main/packages/web-components/src/components/{name}/{name}.scss`
- Storybook live preview (for visual check, not scraping): `https://react.carbondesignsystem.com/?path=/story/components-{name}--default` and `https://web-components.carbondesignsystem.com/?path=/story/components-{name}--default`

**Pictogram rule (clarified):** when generating an IBM/Carbon page, the agent MUST use `@carbon/pictograms` SVGs (linked via unpkg or fetched from the repo). NO custom illustrations, NO emoji, NO icon-as-pictogram-substitute. This is enforced in SKILL.md Step 4B.

---

## 1. Goal

Add IBM Carbon Design System as a third selectable design system in the pixel-council plugin, alongside the existing Google Material Design 3 and Apple HIG references. The integration must match the depth, structure, and self-contained quality of the existing systems so the agent can read ONE component file and produce production-grade output without guessing values.

This makes pixel-council a true three-system tool: warm consumer (Apple), expressive product (Google M3), and **enterprise/data-dense/AI-era (Carbon)**.

---

## 2. Why Carbon belongs alongside Apple and Google

- **Different design ethos** that fills a real gap: enterprise-grade, data-dense, dashboard-first, sharp 90° corners (no rounded radii like Apple/Material).
- **Web-redistributable assets**: unlike Apple SF Symbols (Apple-platforms-only license), `@carbon/icons` is Apache 2.0 — we can use the actual icons, not approximations.
- **4-theme system** (White, G10, G90, G100) — two light + two dark — a unique capability vs the single light/dark pair of Apple/Google.
- **Productive vs Expressive** scales — built-in distinction between dense product UI and editorial/marketing typography.
- **AI/Chat tokens** (aiAura, aiBorder, chatBubble) — Carbon shipped first-class AI surface tokens in 2024+. No other design system has this.
- **Pictograms** — large illustrative SVGs for marketing pages. Apple/Google have nothing equivalent.

---

## 3. Folder structure

Match the existing company-name pattern (`google/`, `apple/`):

```
skills/pixel-council/references/ibm/
├── overview.md           # 4 themes, all token names, IBM Plex stack, 2x grid, motion tokens
├── icons.md              # @carbon/icons CDN reference + 24 inlined SVGs + sizing rules
├── pictograms.md         # NEW reference type — editorial illustrations for marketing
├── editorial-type.md     # Expressive + Fluid scale (max 88px display) — for marketing pages
├── page-patterns.md      # IBM.com sections, dashboard shells, data-dense layouts, app shell
└── components/           # 38 component spec files
```

**Decision rationale (folder name = `ibm/`):** Matches the existing convention where folders are named after the company (`google/` not `material/`, `apple/` not `hig/`). Keeps the SKILL.md routing logic symmetric.

---

## 4. Component inventory — 38 files

### 4.1 Standard 20 (parity with Apple/Google for cross-system swap)

| # | File | Carbon component(s) covered | Notes |
|---|------|------------------------------|-------|
| 1 | `button.md` | Button (primary, secondary, tertiary, ghost, danger, danger-ghost, danger-tertiary) | Sharp corners, 4 sizes (sm/md/lg/xl/2xl) |
| 2 | `checkbox.md` | Checkbox + CheckboxGroup | Indeterminate state |
| 3 | `radio-button.md` | RadioButton + RadioButtonGroup | |
| 4 | `toggle.md` | Toggle | Sm + md sizes |
| 5 | `text-input.md` | TextInput + PasswordInput | Sizes sm/md/lg, fluid variant |
| 6 | `text-area.md` | TextArea | Counter, resize behavior |
| 7 | `number-input.md` | NumberInput | Increment/decrement controls |
| 8 | `search.md` | Search + ExpandableSearch | |
| 9 | `select.md` | Select + SelectItem | Native select wrapper |
| 10 | `dropdown.md` | Dropdown | Custom select (non-native) |
| 11 | `multi-select.md` | MultiSelect | Tag-based selection |
| 12 | `combo-box.md` | ComboBox + ComboButton | Searchable dropdown |
| 13 | `date-picker.md` | DatePicker (single + range) | Flatpickr-based |
| 14 | `time-picker.md` | TimePicker | |
| 15 | `slider.md` | Slider | |
| 16 | `link.md` | Link | Inline + standalone |
| 17 | `accordion.md` | Accordion + AccordionItem | |
| 18 | `breadcrumb.md` | Breadcrumb + BreadcrumbItem | |
| 19 | `tabs.md` | Tabs (line, container, contained, icon-only, vertical) | |
| 20 | `modal.md` | Modal + ComposedModal + Dialog | Multiple passive/transactional patterns |

### 4.2 Carbon-distinctive 15 (unique strengths not in Apple/Google folders)

| # | File | Carbon component | Why it's distinctive |
|---|------|------------------|----------------------|
| 21 | `data-table.md` | DataTable | Carbon's flagship — sortable, filterable, expandable, batch actions, sticky header. The reason enterprises pick Carbon. |
| 22 | `tile.md` | Tile (clickable, expandable, selectable, multi-select, radio) | Carbon's card-equivalent with explicit interactivity variants |
| 23 | `tree-view.md` | TreeView | File browsers, nested navigation |
| 24 | `structured-list.md` | StructuredList | Tabular data without full table chrome |
| 25 | `contained-list.md` | ContainedList | Settings list with action affordances |
| 26 | `content-switcher.md` | ContentSwitcher | Carbon's segmented-control equivalent |
| 27 | `fluid-form.md` | FluidForm + Fluid* inputs | No-spacing form pattern (inputs share borders) — Carbon-only |
| 28 | `progress-indicator.md` | ProgressIndicator | Multi-step process / wizard stepper |
| 29 | `code-snippet.md` | CodeSnippet (inline, single-line, multi-line) | Developer-tooling component |
| 30 | `file-uploader.md` | FileUploader (drop zone + button variants) | |
| 31 | `notification.md` | Notification (inline, toast, actionable) | Status surfaces with optional CTA |
| 32 | `overflow-menu.md` | OverflowMenu + Menu + MenuButton | "..." menu pattern |
| 33 | `popover.md` | Popover + Toggletip | Click-triggered surface (vs hover-triggered tooltip) |
| 34 | `pagination.md` | Pagination + PaginationNav | |
| 35 | `tag.md` | Tag (filter, operational, selectable, dismissible) | |

### 4.3 AI/App-shell 3

| # | File | Carbon component | Why |
|---|------|------------------|-----|
| 36 | `ai-label.md` | AILabel + AISkeleton + ChatButton + AI tokens | Carbon's 2024+ first-class AI surface system. Aura gradient borders, AI popover, chat bubble. |
| 37 | `ui-shell.md` | Header + SideNav + Switcher + GlobalAction | Carbon's full app-shell pattern. Apple has sidebar, Google has navigation-drawer, but Carbon's UIShell is a complete shell with header + nav + product switcher. |
| 38 | `page-header.md` | PageHeader | Product page header with breadcrumb + title + actions (distinct from marketing hero) |

**Total: 38 component files** (vs Apple 33 / Google 32 — the +5 reflects Carbon's enterprise depth).

---

## 5. Token strategy

### 5.1 Color palette (in `overview.md`)

Embed the full `@carbon/colors` palette as CSS custom properties (already captured during research):

- **Neutral**: gray, cool-gray, warm-gray (each: 10/20/30/40/50/60/70/80/90/100)
- **Brand/status**: blue, red, magenta, purple, cyan, teal, green, yellow, orange (each: 10/20/30/40/50/60/70/80/90/100)
- **Absolutes**: black `#000000`, white `#ffffff`

Hex values for all 12 scales captured in research notes. Each scale gives 10 grades = 120 base hex values + black/white = 122 tokens.

### 5.2 Theme tokens (semantic layer)

Document **all 4 themes** in `overview.md`:
- **White** — light primary (background `#ffffff`)
- **G10** — light alternate (background `#f4f4f4`)
- **G90** — dark alternate (background `#262626`)
- **G100** — dark primary (background `#161616`)

Each theme exposes the same semantic token names (already captured during research):
- Background: `background`, `background-inverse`, `background-brand`, `background-active`, `background-hover`, `background-selected`, `background-selected-hover`
- Layer (3 nesting tiers): `layer-01/02/03`, `layer-active-*`, `layer-hover-*`, `layer-selected-*`, `layer-accent-*`
- Field: `field-01/02/03`, `field-hover-*`
- Border: `border-subtle-00/01/02/03`, `border-strong-01/02/03`, `border-tile-*`, `border-inverse`, `border-interactive`, `border-disabled`
- Text: `text-primary`, `text-secondary`, `text-placeholder`, `text-helper`, `text-error`, `text-inverse`, `text-on-color`, `text-disabled`
- Link: `link-primary`, `link-primary-hover`, `link-secondary`, `link-inverse`, `link-visited`
- Icon: `icon-primary`, `icon-secondary`, `icon-inverse`, `icon-on-color`, `icon-disabled`, `icon-interactive`
- Support (status): `support-error`, `support-success`, `support-warning`, `support-info`, `support-caution-minor/major/undefined`
- **AI** (Carbon's 2024+ unique tokens): `ai-aura-start/end`, `ai-aura-hover-start/end`, `ai-border-start/end/strong`, `ai-inner-shadow`, `ai-drop-shadow`, `ai-popover-background`, `ai-overlay`, `ai-skeleton-*`
- **Chat**: `chat-prompt-*`, `chat-bubble-user/agent`, `chat-avatar-bot/agent/user`, `chat-shell-background`, `chat-header-*`, `chat-button*`

Default pairing for `.dark` toggle: **White → G100**. G10 and G90 documented as alternates with quick-swap snippets.

### 5.3 Typography (IBM Plex)

Font stack:
```css
--cds-font-sans: 'IBM Plex Sans', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif;
--cds-font-serif: 'IBM Plex Serif', Georgia, serif;
--cds-font-mono: 'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', monospace;
```

Type scale (already captured during research) covers:
- **Utility**: caption-01/02, label-01/02, helper-text-01/02, legal-01/02, code-01/02
- **Body**: body-01/02, body-compact-01/02
- **Heading (productive)**: heading-01..07 + heading-compact-01/02
- **Heading (expressive)**: expressive-heading-01..06 (responsive at breakpoints)
- **Fluid heading**: fluid-heading-03..06 (clamps between viewport sizes)
- **Display**: display-01..04 (fixed) + fluid-display-01..04 (responsive)
- **Quotation**: quotation-01/02
- **Expressive paragraph**: expressive-paragraph-01

Productive vs Expressive convention: `-01` suffix = productive (fixed), `-02` suffix = expressive (responsive).

### 5.4 Motion tokens (already captured)

- **Durations**: `fast-01: 70ms`, `fast-02: 110ms`, `moderate-01: 150ms`, `moderate-02: 240ms`, `slow-01: 400ms`, `slow-02: 700ms`
- **Easing curves** (6 total):
  - `productive-standard`: `cubic-bezier(0.2, 0, 0.38, 0.9)`
  - `productive-entrance`: `cubic-bezier(0, 0, 0.38, 0.9)`
  - `productive-exit`: `cubic-bezier(0.2, 0, 1, 0.9)`
  - `expressive-standard`: `cubic-bezier(0.4, 0.14, 0.3, 1)`
  - `expressive-entrance`: `cubic-bezier(0, 0, 0.3, 1)`
  - `expressive-exit`: `cubic-bezier(0.4, 0.14, 1, 1)`

### 5.5 Spacing & layout

- **Spacing scale** (in `overview.md`): `spacing-01: 2px`, `02: 4px`, `03: 8px`, `04: 12px`, `05: 16px`, `06: 24px`, `07: 32px`, `08: 40px`, `09: 48px`, `10: 64px`, `11: 80px`, `12: 96px`, `13: 160px`
- **2x grid**: 16 columns, 32px gutters (wide), 16px (narrow), 1px (condensed). Max width 1584px.
- **Breakpoints**: sm `320px` (4-col), md `672px` (8-col), lg `1056px` (16-col), xlg `1312px` (16-col), max `1584px` (16-col)
- **Container queries** documented in page-patterns.md

### 5.6 Shape (corner radius — Carbon's signature constraint)

Carbon is **sharp by default**: most components use `0` border-radius. The few exceptions:
- Tag, Tooltip, Popover: `2px`
- Buttons: `0` (sharp)
- Tile: `0` (sharp)

This is a **defining visual differentiator** — agent must NOT round Carbon corners under any circumstances. Documented prominently in overview.md with a "Shape Rules" callout.

---

## 6. Icon strategy (Carbon's web-redistribution win)

### 6.1 `icons.md` structure

Unlike Apple's icons.md (which falls back to Lucide because SF Symbols are license-restricted), Carbon icons are **directly usable on the web** under Apache 2.0. So:

1. **Primary loading approach** — npm/CDN reference:
   ```html
   <!-- React/build-based projects -->
   import { Add16, Settings20, ChevronRight24 } from '@carbon/icons-react';

   <!-- HTML projects via unpkg -->
   <script type="module" src="https://unpkg.com/@carbon/icons@latest"></script>
   ```

2. **24 inlined SVGs** for offline/single-file output — covering: add, close, checkmark, chevron-right/down/left, arrow-right/left, settings, search, menu, filter, edit, trash-can, copy, download, upload, user, notification, warning, error, information, help, view, view-off

3. **Size system** documented: 16/20/24/32px (Carbon's standard sizes — match the icon to component density)
   - 16px: inline with body text, dense UI
   - 20px: icon buttons sm/md, inline notifications
   - 24px: standard icon button md, navigation
   - 32px: large icon button, feature illustrations

4. **Color tokens**: `icon-primary`, `icon-secondary`, `icon-on-color`, `icon-interactive`, `icon-disabled`, `icon-inverse`

### 6.2 NEW reference type: `pictograms.md`

Carbon has a separate `@carbon/pictograms` library (~200+ illustrative SVGs at 32-64px+) for marketing/editorial use. Apple and Google have no equivalent — emoji is banned, regular icons are too small for marketing sections.

`pictograms.md` will document:
- CDN/npm loading (`@carbon/pictograms-react` or unpkg)
- Recommended sizing in marketing contexts (64-128px)
- Color treatment (single-color vs duo-tone variants)
- 12 inlined pictogram examples (analytics, data, security, cloud, ai, automation, sustainability, accessibility, transformation, network, devices, integration)
- Usage rules: pictograms in feature sections, NOT in dense UI

This is a **new reference file type** that doesn't exist in google/ or apple/ folders — it's documented in SKILL.md as Carbon-only.

---

## 7. Page patterns (`page-patterns.md`)

### 7.1 IBM.com marketing patterns

- **Hero**: Left-aligned (NOT centered), expressive scale (display-04 = 54-92px responsive), pictogram or full-bleed photo on right. Eyebrow → headline → body → primary + secondary buttons.
- **Section rhythm**: Heavy whitespace (96-160px between sections), G10 background alternating with white, NO drop shadows, NO card grids in marketing.
- **Feature sections**: Pictogram + headline (expressive-heading-04) + body + Link, in 2-3 column grid. Sharp dividers, not borders.
- **Stats / numbers**: Display-02 (large numerics) + label-01 (caption below).
- **Quote sections**: quotation-02 (44-72px) + author label.
- **CTA strip**: Full-bleed dark band (G100), display-03 headline, white primary button.

### 7.2 Product/dashboard patterns

- **UIShell layout**: Header (48px) at top + SideNav (256px expanded / 48px rail) on left + main content area. Header contains: hamburger, product name, global actions (search, switcher, notifications, user).
- **Dashboard grid**: 2x grid with Tile components in 4-2-1 column responsive grid. Cards use Layer-01 background nested in main Background.
- **Data-dense view**: DataTable as primary component, batch action bar appears on selection, pagination at bottom, optional filter sidebar.
- **Settings page**: PageHeader + Tabs + ContainedList sections + FluidForm groupings + Save/Cancel button bar.

### 7.3 AI patterns

- **AI surface**: Tile or Modal with AI Aura border (gradient), AI popover for explanations, AILabel inline ("AI" badge with tooltip).
- **Chat shell**: chat-shell background, message list with chat-bubble-user (right) / chat-bubble-agent (left), prompt input at bottom with chatPromptBackground.

### 7.4 Layout primitives

- `cds--page` wrapper (max-width 1584px, centered)
- `cds--dashboard` (full-width fill, no max-width — for app shells)
- `cds--grid` (16-col 2x grid)
- `cds--row` / `cds--col-{breakpoint}-{n}`
- Layer nesting via `<div data-layer="01">` for tiered backgrounds

---

## 8. SKILL.md updates

### 8.1 System detection (Step 0)

Add detection rules:
- "IBM" / "Carbon" / "Plex" / "enterprise dashboard" / "data table" → Carbon
- "AI app" / "chat interface" / "agent UI" → suggest Carbon (has dedicated AI tokens)

### 8.2 Reference table (Step 1)

Add row:
```
references/ibm/overview.md          # 4 themes (White/G10/G90/G100), IBM Plex, 2x grid, motion
references/ibm/components/*.md      # 38 component specs
references/ibm/icons.md             # @carbon/icons (Apache 2.0, web-OK)
references/ibm/pictograms.md        # NEW: editorial illustrations
references/ibm/editorial-type.md    # Expressive scale
references/ibm/page-patterns.md     # IBM.com sections, UIShell, dashboards
```

### 8.3 Component File Mapping table

Add **IBM column** alongside Google/Apple/Blended. Map standard 20 components to Carbon equivalents. Add new rows for Carbon-distinctive components (data-table, tile, tree-view, etc.) with `—` in Google/Apple/Blended columns where they don't exist.

### 8.4 Reading order (Step 3.4)

Add Carbon row to the "read first / then read components" table:

| User chose | Read first | Then read components |
|---|---|---|
| IBM / Carbon / enterprise | `ibm/overview.md` + page-level files | `ibm/components/{component}.md` for ALL identified |

### 8.5 Platform-specific polish (Step 4C)

Add **IBM Carbon** subsection alongside Google/Apple:

```
**IBM Carbon Design System:**

- SHARP corners by default (border-radius: 0). Only Tag/Tooltip/Popover use 2px.
- Layer tier nesting: Background → Layer-01 → Layer-02 → Layer-03 (use data-layer attribute)
- IBM Plex font stack with -webkit-font-smoothing: antialiased
- Productive motion (70-150ms) for UI feedback, Expressive motion (240-400ms) for entrances
- 2x grid: 16-column, 32px gutters, max-width 1584px
- Focus ring: 2px solid focus token, 1px inset white border (NOT outline-offset)
- AI surfaces: aiAura gradient border, aiInnerShadow inner glow, AILabel "AI" badge
- Hover state on filled buttons = darker shade (NOT opacity, NOT state layer)
- Spacing on 4px grid (spacing-01 = 2px, then doubles)
- DO NOT use Material's tonal elevation or Apple's Liquid Glass — Carbon is FLAT
```

### 8.6 Page-level rules (Step 4B)

Add **Carbon pages** subsection:
- Use Pictograms for feature sections (NOT icons, NOT card grids with shadows)
- Expressive type scale for marketing (44-92px), Productive scale for product UI
- LEFT-aligned heroes (not centered) — IBM.com convention
- Heavy whitespace (96-160px between sections)
- NO drop shadows on cards/tiles in marketing — use Layer tiers instead
- NO emoji — use @carbon/icons or @carbon/pictograms
- For dashboards: UIShell + DataTable + Tile grids on G10/White backgrounds

### 8.7 Update plugin metadata

- Update `.claude-plugin/plugin.json` description to mention Carbon
- Update `SKILL.md` frontmatter description from "86 reference files" to actual new count
- Update Step 1 file count display (currently "32 files / 33 files / 12 files" → add "/ 38 files" for IBM)

### 8.8 README + CLAUDE.md

- Add Carbon to the project structure diagram
- Update reference file count totals
- Add Carbon to the supported design systems list

---

## 9. Reference file template / depth standard

Each Carbon component file is structured to deliver verbatim Carbon source code, then context. The 12 sections in order:

1. **YAML frontmatter** — `name`, `description`, `metadata.tags`
2. **H1 + source attribution** — links to (a) v11 docs page, (b) React Storybook live, (c) WC Storybook live, (d) React stories source on GitHub, (e) WC stories source on GitHub
3. **Quick Reference table** — height, padding, radius (always 0 for Carbon, except Tag/Tooltip/Popover at 2px), font, primary color in 4 themes, key tokens
4. **Variants list** — every story export from the Storybook stories files (e.g., button: Default, Secondary, Tertiary, Ghost, Danger, DangerTertiary, DangerGhost, IconButton, IconButtonWithBadge, Skeleton)
5. **React source (verbatim from Storybook)** — for each variant, embed the EXACT `render()` body or template from `{Component}.stories.js`. Each variant gets its own ` ```jsx ``` ` block. Include the imports from the stories file at the top.
6. **Web Components source (verbatim from Storybook)** — for each variant, embed the EXACT lit-html template from `{component}.stories.ts`. Each variant gets its own ` ```html ``` ` block. Include the `<cds-button>` markup with all attributes/slots.
7. **Plain HTML + class names** (derived) — the WC version stripped of lit-html bindings, suitable for non-framework projects. Same variants.
8. **Design Tokens (component-scoped)** — CSS custom properties for the component, scoped with `[data-theme="white"]` and `[data-theme="g100"]` (and `.dark`). Values resolved to literal hex (cross-reference overview.md theme blocks).
9. **States Reference table** — rest/hover/active/focus-visible/disabled values per variant. Pull from the `.scss` source.
10. **Animation & Motion** — duration + easing tokens used (from `--cds-duration-*` and `--cds-easing-*`), `prefers-reduced-motion` handling
11. **Accessibility** — ARIA roles, keyboard, focus management, touch targets (Carbon uses 32-48px on desktop, 44px on mobile)
12. **Do/Don't tables** — Carbon-specific gotchas ("DO copy the Storybook code AS-IS for Carbon outputs; DON'T paraphrase"), plus shape/spacing rules

**Priority order when authoring:** sections 5-6 (verbatim source) first — they are the bulk and the reason the file exists. Sections 1-4 + 8-12 frame and contextualize the source. Section 7 (plain HTML) is mechanically derivable from section 6.

**Target file size:** 350-600 lines per component (raised from Apple/Google's 250-450 range because verbatim Storybook source per variant adds ~150-250 lines on average).

---

## 10. Total file count delta

| File type | Before | After | Delta |
|---|---|---|---|
| Reference files (overview/icons/type/patterns) | 6 (3 systems × 2 avg) | **11** (3 systems × 4 avg + Carbon's pictograms) | +5 |
| Component spec files | 77 (Google 32 + Apple 33 + Blended 12) | **115** (+ Carbon 38) | +38 |
| **Total reference files** | **86** (current claim in SKILL.md frontmatter) | **129** | **+43** |

Update SKILL.md frontmatter and README accordingly.

---

## 11. Out of scope (explicitly NOT doing)

- Generating ALL ~2,500 Carbon icons inline — we reference the CDN/npm and inline only ~24 essentials
- Generating ALL ~200 pictograms inline — reference + inline ~12 essentials
- Translating Carbon's React/Sass source — we produce framework-agnostic HTML+CSS specs that the agent translates per project
- Adding Carbon to `blended/` — Blended stays as Apple+Google fusion; Carbon is its own system
- Carbon Charts / data viz palettes — separate library, not in initial scope (can add later as `ibm/data-viz.md`)
- Web Components / React component code generation — out of scope; we document specs only
- v10 backwards compatibility — v11 is the authoritative source; v10 tokens not documented

---

## 12. Risks & mitigations

| Risk | Mitigation |
|---|---|
| Agent forgets Carbon's sharp-corner rule and adds border-radius | Document prominently in overview.md "Shape Rules" callout + every component Quick Reference shows `border-radius: 0` + Step 4C SKILL.md note |
| 38 component files is too much to maintain | Mitigated by template — each follows the same 12-section structure, can be authored in batches |
| AI tokens are bleeding-edge and may change | Document as "Carbon v11.40+" with note that values may evolve. Include the frozen current values. |
| Pictograms.md sets a precedent that Apple/Google lack | Acceptable — pictograms are genuinely Carbon-unique. Document in SKILL.md that this file is Carbon-only. |
| 4 themes complicate agent decision-making | Default to White/G100 pair. Document G10/G90 as alternates with one-line "swap to G10 by adding theme=g10 to body" instructions. |

---

## 13. Acceptance criteria

The integration is complete when:

1. ✅ `references/ibm/` exists with 6 top-level reference files + `components/` subdirectory containing 38 spec files
2. ✅ Each component file follows the 12-section template and totals 250-450 lines
3. ✅ All hex color values for the 4 themes resolve correctly (no token references that point to nothing)
4. ✅ `@carbon/icons` CDN URL works and loads icons in a test page
5. ✅ SKILL.md detects "Carbon"/"IBM"/"Plex" keywords and routes to `ibm/` references
6. ✅ SKILL.md Component File Mapping has full IBM column populated
7. ✅ SKILL.md Step 4C has IBM Carbon platform polish subsection
8. ✅ A test prompt ("build a Carbon-styled enterprise dashboard with sidebar and data table") triggers the skill, reads ibm/ files only, and produces an output with: sharp corners, IBM Plex font, Layer-tiered backgrounds, AI Aura on at least one surface, both White and G100 themes, UIShell pattern, DataTable component
9. ✅ README + CLAUDE.md updated with Carbon mention and accurate file counts
10. ✅ `install.sh` reinstalls cleanly and the dynamic file count display shows the new total (129)

---

## 14. Implementation phasing (preview — to be detailed in implementation plan)

The implementation plan (next step via `superpowers:writing-plans`) will break this into phases. Preview:

- **Phase 1: Foundation** — Create `references/ibm/` directory + write `overview.md` (all tokens, all 4 themes, motion, spacing, grid, shape rules)
- **Phase 2: Page-level files** — `icons.md`, `pictograms.md`, `editorial-type.md`, `page-patterns.md`
- **Phase 3: Standard components (20 files)** — button → modal, parity with Apple/Google
- **Phase 4: Carbon-distinctive components (15 files)** — data-table → tag, the unique ones
- **Phase 5: AI/App-shell components (3 files)** — ai-label, ui-shell, page-header
- **Phase 6: SKILL.md integration** — detection rules, mapping table, reading order, platform polish, page rules
- **Phase 7: Plugin metadata** — `.claude-plugin/plugin.json`, README.md, CLAUDE.md, SKILL.md frontmatter file count
- **Phase 8: Verification** — run install.sh, run the acceptance-criteria test prompt, fix gaps

Each phase has a verification gate before the next phase begins. Phases 3-5 (component files) can be parallelized via subagents since each component file is independent.

---

## 15. Open questions resolved

| Question | Decision | Reasoning |
|---|---|---|
| Folder name `ibm/` vs `carbon/` | **`ibm/`** | Matches existing company-name convention (`google/`, `apple/`) |
| Component count 38 vs trim to 25 | **38** | Carbon's value IS its enterprise depth; trimming defeats the purpose |
| Include AI/Chat tokens | **Yes** | Carbon's unique 2024+ advantage; aligns with current AI-app demand |
| Add `pictograms.md` as 7th reference type | **Yes** | Carbon-only differentiator; no Apple/Google equivalent |
