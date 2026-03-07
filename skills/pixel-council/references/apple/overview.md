---
name: apple-hig-overview
description: Apple system colors, SF Pro typography, Liquid Glass effects, shadows, focus ring, vibrancy
metadata:
  tags: apple, hig, human interface guidelines, system colors, sf pro, liquid glass, vibrancy, theme
---

# Apple Human Interface Guidelines -- Design System Reference

> Source: [apple-hig](https://github.com/6639835/apple-hig) -- 117 documents, 874 images

## Core Design Philosophy

Apple prioritizes **clarity**, **consistency**, and **user-centric experiences**:
- **Deference** -- UI helps people interact with content, never competing with it
- **Clarity** -- Text is legible, icons precise, adornments subtle, function drives design
- **Depth** -- Visual layers and realistic motion communicate hierarchy

---

## Complete CSS Design Token Foundation

Copy-paste this block as the starting point for any Apple-style web project.

```css
:root {
  /* ===== SYSTEM COLORS (Light) ===== */
  --apple-color-blue: #007AFF;
  --apple-color-green: #34C759;
  --apple-color-indigo: #5856D6;
  --apple-color-orange: #FF9500;
  --apple-color-pink: #FF2D55;
  --apple-color-purple: #AF52DE;
  --apple-color-red: #FF3B30;
  --apple-color-teal: #5AC8FA;
  --apple-color-yellow: #FFCC00;
  --apple-color-gray: #8E8E93;
  --apple-color-gray2: #AEAEB2;
  --apple-color-gray3: #C7C7CC;
  --apple-color-gray4: #D1D1D6;
  --apple-color-gray5: #E5E5EA;
  --apple-color-gray6: #F2F2F7;

  /* ===== BACKGROUNDS (Light) ===== */
  --apple-bg-primary: #FFFFFF;
  --apple-bg-secondary: #F2F2F7;
  --apple-bg-tertiary: #FFFFFF;
  --apple-bg-grouped: #F2F2F7;
  --apple-bg-grouped-secondary: #FFFFFF;
  --apple-bg-grouped-tertiary: #F2F2F7;

  /* ===== LABELS (Light) ===== */
  --apple-label-primary: #000000;
  --apple-label-secondary: rgba(60, 60, 67, 0.6);
  --apple-label-tertiary: rgba(60, 60, 67, 0.3);
  --apple-label-quaternary: rgba(60, 60, 67, 0.18);
  --apple-label-placeholder: rgba(60, 60, 67, 0.3);

  /* ===== SEPARATORS & FILLS (Light) ===== */
  --apple-separator: rgba(60, 60, 67, 0.29);
  --apple-separator-opaque: #C6C6C8;
  --apple-fill-primary: rgba(120, 120, 128, 0.2);
  --apple-fill-secondary: rgba(120, 120, 128, 0.16);
  --apple-fill-tertiary: rgba(118, 118, 128, 0.12);
  --apple-fill-quaternary: rgba(116, 116, 128, 0.08);

  /* ===== SHADOWS (5-level system) ===== */
  --apple-shadow-0: none;
  --apple-shadow-1: 0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06);
  --apple-shadow-2: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
  --apple-shadow-3: 0 10px 15px rgba(0,0,0,0.08), 0 4px 6px rgba(0,0,0,0.05);
  --apple-shadow-4: 0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04);
  --apple-shadow-5: 0 25px 50px rgba(0,0,0,0.15);

  /* ===== FONT STACK ===== */
  --apple-font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display',
    'SF Pro Text', 'Helvetica Neue', Helvetica, Arial, sans-serif;

  /* ===== CORNER RADII ===== */
  --apple-radius-sm: 6px;
  --apple-radius-md: 10px;
  --apple-radius-lg: 13px;
  --apple-radius-xl: 16px;
  --apple-radius-2xl: 20px;
  --apple-radius-full: 9999px;

  /* ===== FOCUS RING ===== */
  --apple-focus-ring: 4px solid rgba(0, 122, 255, 0.6);
  --apple-focus-ring-offset: 1px;
}

/* ===== DARK THEME ===== */
@media (prefers-color-scheme: dark) {
  :root {
    --apple-color-blue: #0A84FF;
    --apple-color-green: #30D158;
    --apple-color-indigo: #5E5CE6;
    --apple-color-orange: #FF9F0A;
    --apple-color-pink: #FF375F;
    --apple-color-purple: #BF5AF2;
    --apple-color-red: #FF453A;
    --apple-color-teal: #64D2FF;
    --apple-color-yellow: #FFD60A;
    --apple-color-gray: #8E8E93;
    --apple-color-gray2: #636366;
    --apple-color-gray3: #48484A;
    --apple-color-gray4: #3A3A3C;
    --apple-color-gray5: #2C2C2E;
    --apple-color-gray6: #1C1C1E;

    --apple-bg-primary: #000000;
    --apple-bg-secondary: #1C1C1E;
    --apple-bg-tertiary: #2C2C2E;
    --apple-bg-grouped: #000000;
    --apple-bg-grouped-secondary: #1C1C1E;
    --apple-bg-grouped-tertiary: #2C2C2E;

    --apple-label-primary: #FFFFFF;
    --apple-label-secondary: rgba(235, 235, 245, 0.6);
    --apple-label-tertiary: rgba(235, 235, 245, 0.3);
    --apple-label-quaternary: rgba(235, 235, 245, 0.16);
    --apple-label-placeholder: rgba(235, 235, 245, 0.3);

    --apple-separator: rgba(84, 84, 88, 0.6);
    --apple-separator-opaque: #38383A;
    --apple-fill-primary: rgba(120, 120, 128, 0.36);
    --apple-fill-secondary: rgba(120, 120, 128, 0.32);
    --apple-fill-tertiary: rgba(118, 118, 128, 0.24);
    --apple-fill-quaternary: rgba(118, 118, 128, 0.18);
  }
}

/* Class-based dark mode (for manual toggle) */
.dark {
  --apple-color-blue: #0A84FF;
  --apple-color-green: #30D158;
  --apple-color-indigo: #5E5CE6;
  --apple-color-orange: #FF9F0A;
  --apple-color-pink: #FF375F;
  --apple-color-purple: #BF5AF2;
  --apple-color-red: #FF453A;
  --apple-color-teal: #64D2FF;
  --apple-color-yellow: #FFD60A;
  --apple-color-gray: #8E8E93;
  --apple-color-gray2: #636366;
  --apple-color-gray3: #48484A;
  --apple-color-gray4: #3A3A3C;
  --apple-color-gray5: #2C2C2E;
  --apple-color-gray6: #1C1C1E;

  --apple-bg-primary: #000000;
  --apple-bg-secondary: #1C1C1E;
  --apple-bg-tertiary: #2C2C2E;
  --apple-bg-grouped: #000000;
  --apple-bg-grouped-secondary: #1C1C1E;
  --apple-bg-grouped-tertiary: #2C2C2E;

  --apple-label-primary: #FFFFFF;
  --apple-label-secondary: rgba(235, 235, 245, 0.6);
  --apple-label-tertiary: rgba(235, 235, 245, 0.3);
  --apple-label-quaternary: rgba(235, 235, 245, 0.16);
  --apple-label-placeholder: rgba(235, 235, 245, 0.3);

  --apple-separator: rgba(84, 84, 88, 0.6);
  --apple-separator-opaque: #38383A;
  --apple-fill-primary: rgba(120, 120, 128, 0.36);
  --apple-fill-secondary: rgba(120, 120, 128, 0.32);
  --apple-fill-tertiary: rgba(118, 118, 128, 0.24);
  --apple-fill-quaternary: rgba(118, 118, 128, 0.18);
}
```

---

## Color System

### System Colors (Light / Dark)

| Color | Light | Dark | Purpose |
|-------|-------|------|---------|
| Blue | `#007AFF` | `#0A84FF` | Links, interactive elements |
| Green | `#34C759` | `#30D158` | Success, positive states |
| Indigo | `#5856D6` | `#5E5CE6` | Accent |
| Orange | `#FF9500` | `#FF9F0A` | Warnings |
| Pink | `#FF2D55` | `#FF375F` | Accent |
| Purple | `#AF52DE` | `#BF5AF2` | Accent |
| Red | `#FF3B30` | `#FF453A` | Errors, destructive actions |
| Teal | `#5AC8FA` | `#64D2FF` | Accent |
| Yellow | `#FFCC00` | `#FFD60A` | Caution, highlights |
| Gray | `#8E8E93` | `#8E8E93` | Neutral |
| Gray 2 | `#AEAEB2` | `#636366` | Secondary neutral |
| Gray 3 | `#C7C7CC` | `#48484A` | Tertiary neutral |
| Gray 4 | `#D1D1D6` | `#3A3A3C` | Quaternary neutral |
| Gray 5 | `#E5E5EA` | `#2C2C2E` | Quinary neutral |
| Gray 6 | `#F2F2F7` | `#1C1C1E` | Lightest neutral |

### Background Colors (Light / Dark)

| Token | Light | Dark |
|-------|-------|------|
| systemBackground | `#FFFFFF` | `#000000` |
| secondarySystemBackground | `#F2F2F7` | `#1C1C1E` |
| tertiarySystemBackground | `#FFFFFF` | `#2C2C2E` |
| systemGroupedBackground | `#F2F2F7` | `#000000` |
| secondarySystemGroupedBackground | `#FFFFFF` | `#1C1C1E` |
| tertiarySystemGroupedBackground | `#F2F2F7` | `#2C2C2E` |

### Label Colors (Light / Dark)

| Token | Light | Dark |
|-------|-------|------|
| label | `#000000` | `#FFFFFF` |
| secondaryLabel | `rgba(60,60,67,0.6)` | `rgba(235,235,245,0.6)` |
| tertiaryLabel | `rgba(60,60,67,0.3)` | `rgba(235,235,245,0.3)` |
| quaternaryLabel | `rgba(60,60,67,0.18)` | `rgba(235,235,245,0.16)` |
| placeholderText | `rgba(60,60,67,0.3)` | `rgba(235,235,245,0.3)` |

### Separator & Fill Colors (Light / Dark)

| Token | Light | Dark |
|-------|-------|------|
| separator | `rgba(60,60,67,0.29)` | `rgba(84,84,88,0.6)` |
| opaqueSeparator | `#C6C6C8` | `#38383A` |
| systemFill | `rgba(120,120,128,0.2)` | `rgba(120,120,128,0.36)` |
| secondarySystemFill | `rgba(120,120,128,0.16)` | `rgba(120,120,128,0.32)` |
| tertiarySystemFill | `rgba(118,118,128,0.12)` | `rgba(118,118,128,0.24)` |
| quaternarySystemFill | `rgba(116,116,128,0.08)` | `rgba(118,118,128,0.18)` |

### Dark Mode Principles
- Never hard-code color values; use semantic/dynamic tokens
- Maintain proper contrast in both light and dark contexts
- Use darker backgrounds with lighter foreground content
- Four material levels: ultrathin, thin, regular, thick

---

## Shadow System (5 Levels)

| Level | CSS box-shadow | Use Case |
|-------|---------------|----------|
| 0 | `none` | Flat elements |
| 1 | `0 1px 3px rgba(0,0,0,0.08), 0 1px 2px rgba(0,0,0,0.06)` | Cards, subtle lift |
| 2 | `0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06)` | Raised cards |
| 3 | `0 10px 15px rgba(0,0,0,0.08), 0 4px 6px rgba(0,0,0,0.05)` | Popovers |
| 4 | `0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04)` | Sheets |
| 5 | `0 25px 50px rgba(0,0,0,0.15)` | Modals |

---

## Focus Ring (Web CSS)

```css
:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}
```

---

## Liquid Glass (Web CSS Approximation)

```css
.apple-liquid-glass {
  background: rgba(255, 255, 255, 0.72);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border: 0.5px solid rgba(255, 255, 255, 0.3);
  border-radius: var(--apple-radius-lg, 13px);
}

@media (prefers-color-scheme: dark) {
  .apple-liquid-glass {
    background: rgba(30, 30, 30, 0.72);
    border-color: rgba(255, 255, 255, 0.1);
  }
}

.dark .apple-liquid-glass {
  background: rgba(30, 30, 30, 0.72);
  border-color: rgba(255, 255, 255, 0.1);
}
```

Use for navigation bars, tab bars, sidebars -- NOT content layers.
Two variants: **Regular** (blurs + adjusts luminosity) and **Clear** (highly translucent).

---

## Typography System

Font stack: `-apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', 'Helvetica Neue', Helvetica, Arial, sans-serif`

### iOS Type Scale (Default "Large" Dynamic Type)

| Style | Size | Weight | Leading | Letter-Spacing |
|-------|------|--------|---------|----------------|
| Large Title | 34px | 400 | 41px | 0.37px |
| Title 1 | 28px | 400 | 34px | 0.36px |
| Title 2 | 22px | 400 | 28px | 0.35px |
| Title 3 | 20px | 400 | 25px | 0.38px |
| Headline | 17px | 600 | 22px | -0.41px |
| Body | 17px | 400 | 22px | -0.41px |
| Callout | 16px | 400 | 21px | -0.32px |
| Subheadline | 15px | 400 | 20px | -0.24px |
| Footnote | 13px | 400 | 18px | -0.08px |
| Caption 1 | 12px | 400 | 16px | 0px |
| Caption 2 | 11px | 400 | 13px | 0.07px |

### macOS Type Scale

| Style | Size | Weight |
|-------|------|--------|
| Large Title | 26px | 400 |
| Title 1 | 22px | 400 |
| Title 2 | 17px | 400 |
| Title 3 | 15px | 400 |
| Headline | 13px | 700 |
| Body | 13px | 400 |
| Callout | 12px | 400 |
| Subheadline | 11px | 400 |
| Footnote | 10px | 400 |
| Caption 1 | 10px | 400 |
| Caption 2 | 10px | 500 |

### Typography Rules
- Prefer Regular, Medium, Semibold, or Bold weights (avoid Light)
- Minimize the number of typefaces used
- Support Dynamic Type (200% text enlargement minimum)
- Support Bold Text accessibility feature

---

## Layout & Spacing

### Touch Targets & Control Sizes

| Platform | Minimum Size |
|----------|-------------|
| iOS/iPadOS | 44x44pt (tap), 28x28pt (visual) |
| macOS | 20x20pt |
| tvOS | 56x56pt |
| visionOS | 60pt between interactive centers |

### Padding Guidelines
- ~12pt padding around bezeled elements
- ~24pt for borderless controls
- Safe area insets for notch/Dynamic Island/home indicator

---

## Motion & Animation

### Core Principles
1. **Purposeful** -- support the experience without overshadowing it
2. **Optional** -- respect "Reduce Motion" accessibility setting
3. **Realistic** -- follow user gestures logically
4. **Brief** -- keep under 300ms for responsiveness
5. **Cancellable** -- let users interrupt animations
6. **Restrained** -- don't over-animate frequent interactions

### Animation Timing
- Spring-based animations for natural feel
- Use ease-in-out for most transitions
- Stagger list animations subtly

---

## Accessibility Requirements

- Support VoiceOver with proper labeling
- Meet WCAG AA contrast ratios (4.5:1 text, 3:1 large/bold)
- Never rely on color alone for information
- Minimum control sizes (44x44pt on iOS)
- Support Full Keyboard Access
- Respect Reduce Motion preference
- Double confirmation for destructive actions

---

## Component Categories

### Input & Actions
- **Buttons** -- bordered, borderless, prominent, destructive
- **Segmented Controls** -- 2-5 segments
- **Toggles/Switches**, **Sliders**, **Steppers**
- **Text Fields** -- rounded, plain
- **Pickers** -- date, time, value

### Navigation
- **Tab Bar** -- bottom, 3-5 tabs
- **Sidebar** -- iPad/Mac, collapsible
- **Navigation Bar** -- top, back button, title
- **Toolbar**, **Search Bar**

### Content
- **Lists/Tables** -- plain, inset, grouped
- **Cards** -- rounded corners, subtle shadow
- **Collection Views**, **Scroll Views**

### Feedback
- **Alerts**, **Action Sheets**
- **Progress Indicators**, **Activity Indicators**
- **Banners/Toasts**

### Presentation
- **Sheets** -- bottom sheet, half-sheet
- **Popovers**, **Modals**

---

## Visual Hierarchy Layers

| Layer | Content |
|-------|---------|
| Background | App background, wallpaper |
| Base | Primary content surface |
| Elevated | Cards, sheets, raised surfaces |
| Overlay | Navigation bars, tab bars, toolbars |
| Modal | Dialogs, popovers, action sheets |
