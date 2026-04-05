---
name: icons
description: Apple SF Symbols icon system for web — SVG specs, sizing, color tokens, 20-icon library, and accessibility
metadata:
  tags: icon, sf symbols, svg, symbol, glyph, pictogram, image, decorative
---

# Icons -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Format | SVG with `viewBox="0 0 24 24"` |
| Default stroke width | 1.5px (at 20-24px) |
| Stroke linecap | round |
| Stroke linejoin | round |
| Default fill | none (outline style) |
| Color method | `currentColor` on stroke/fill |
| Default size | 22px (navigation context) |
| Min touch target | 44x44px (when interactive) |
| CSS prefix | `.apple-icon` |

### Web-Safe Icon Libraries (Recommended)

SF Symbols are licensed for Apple platforms only — NOT for web redistribution. For web projects, use these alternatives that match the SF Symbols aesthetic:

| Library | Icons | License | CDN | Style Match |
|---------|-------|---------|-----|-------------|
| **Lucide** (recommended) | 1,400+ | MIT | `https://unpkg.com/lucide@latest` | Closest to SF Symbols — round strokes, 24x24, 2px weight |
| **Phosphor Icons** | 9,000+ | MIT | `https://unpkg.com/@phosphor-icons/web@latest` | 6 weights, very versatile |
| **Heroicons** | 300+ | MIT | `https://unpkg.com/heroicons@latest` | Tailwind team, clean outline style |
| **Feather Icons** | 280+ | MIT | `https://unpkg.com/feather-icons@latest` | Minimal, 24x24, 2px stroke |

**Loading Lucide (recommended approach):**
```html
<!-- Option 1: CDN script (auto-replaces <i> tags) -->
<script src="https://unpkg.com/lucide@latest"></script>
<i data-lucide="check-circle"></i>
<script>lucide.createIcons();</script>

<!-- Option 2: Individual SVG fetch -->
<img src="https://unpkg.com/lucide-static@latest/icons/check-circle.svg" alt="" width="24" height="24" />

<!-- Option 3: Inline SVG (from icons.md library below) -->
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">...</svg>
```

## Design Tokens

```css
:root {
  --apple-icon-primary: #1D1D1F;
  --apple-icon-secondary: rgba(60, 60, 67, 0.6);
  --apple-icon-tertiary: rgba(60, 60, 67, 0.3);
  --apple-icon-tint: #007AFF;
  --apple-icon-destructive: #FF3B30;
  --apple-icon-success: #34C759;
  --apple-icon-warning: #FF9500;
  --apple-icon-transition: color 150ms ease-out, opacity 150ms ease-out, transform 150ms ease-out;
  --apple-icon-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-icon-primary: #F5F5F7;
    --apple-icon-secondary: rgba(235, 235, 245, 0.6);
    --apple-icon-tertiary: rgba(235, 235, 245, 0.3);
    --apple-icon-tint: #0A84FF;
    --apple-icon-destructive: #FF453A;
    --apple-icon-success: #30D158;
    --apple-icon-warning: #FF9F0A;
  }
}
.dark {
  --apple-icon-primary: #F5F5F7;
  --apple-icon-secondary: rgba(235, 235, 245, 0.6);
  --apple-icon-tertiary: rgba(235, 235, 245, 0.3);
  --apple-icon-tint: #0A84FF;
  --apple-icon-destructive: #FF453A;
  --apple-icon-success: #30D158;
  --apple-icon-warning: #FF9F0A;
}
```

## Variants

| Style | Fill | Stroke | Use Case |
|-------|------|--------|----------|
| Outline (default) | `none` | `currentColor` 1.5px | Navigation, toolbars, lists |
| Filled | `currentColor` | `none` | Selected/active states, tab bar active |
| Hierarchical | `none` | multi-opacity layers | Emphasis within a single color |
| Palette | multi-color fills | per-layer stroke | Multi-color decorative icons |

## Sizes

| Context | Icon Size | Stroke Width | Padding to 44px target | Example |
|---------|-----------|-------------|----------------------|---------|
| Inline text | 17px | 1.5px | N/A (non-interactive) | Paragraph icon beside label |
| Navigation | 22px | 1.5px | 11px each side | Toolbar, nav bar icons |
| Feature small | 28px | 2px | 8px each side | Settings rows, list leading |
| Feature large | 48px | 2.5px | N/A (standalone) | Empty state, onboarding |
| Hero | 64px+ | 3px | N/A (standalone) | Hero banners, splash |

## HTML Structure

```html
<!-- Standalone decorative icon -->
<svg class="apple-icon" aria-hidden="true" width="22" height="22" viewBox="0 0 24 24"
  fill="none" stroke="currentColor" stroke-width="1.5"
  stroke-linecap="round" stroke-linejoin="round">
  <path d="M9 6l6 6-6 6"/>
</svg>

<!-- Icon inline with text -->
<span class="apple-icon-inline">
  <svg class="apple-icon apple-icon--sm" aria-hidden="true" width="17" height="17"
    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
    stroke-linecap="round" stroke-linejoin="round">
    <path d="M12 5v14M5 12h14"/>
  </svg>
  Add Item
</span>

<!-- Icon button (interactive) -->
<button class="apple-icon-button" type="button" aria-label="Close">
  <svg class="apple-icon" aria-hidden="true" width="22" height="22"
    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
    stroke-linecap="round" stroke-linejoin="round">
    <path d="M6 6l12 12M18 6L6 18"/>
  </svg>
</button>

<!-- Icon with visible label -->
<button class="apple-icon-button apple-icon-button--labeled" type="button">
  <svg class="apple-icon" aria-hidden="true" width="22" height="22"
    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
    stroke-linecap="round" stroke-linejoin="round">
    <circle cx="10" cy="10" r="6.5"/><path d="M15 15l5 5"/>
  </svg>
  <span>Search</span>
</button>

<!-- Feature icon (large, standalone) -->
<div class="apple-icon-feature" role="img" aria-label="Secure connection">
  <svg class="apple-icon apple-icon--xl" aria-hidden="true" width="48" height="48"
    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"
    stroke-linecap="round" stroke-linejoin="round">
    <rect x="5" y="11" width="14" height="10" rx="2"/>
    <path d="M8 11V7a4 4 0 1 1 8 0v4"/>
  </svg>
</div>
```

## Complete CSS

```css
/* ---- Base Icon ---- */
.apple-icon {
  display: inline-block;
  width: 22px;
  height: 22px;
  color: var(--apple-icon-primary);
  flex-shrink: 0;
  vertical-align: middle;
  transition: var(--apple-icon-transition);
}

/* ---- Size Modifiers ---- */
.apple-icon--sm { width: 17px; height: 17px; }
.apple-icon--md { width: 22px; height: 22px; }
.apple-icon--lg { width: 28px; height: 28px; }
.apple-icon--xl { width: 48px; height: 48px; }
.apple-icon--hero { width: 64px; height: 64px; }

/* ---- Color Modifiers ---- */
.apple-icon--secondary { color: var(--apple-icon-secondary); }
.apple-icon--tertiary { color: var(--apple-icon-tertiary); }
.apple-icon--tint { color: var(--apple-icon-tint); }
.apple-icon--destructive { color: var(--apple-icon-destructive); }
.apple-icon--success { color: var(--apple-icon-success); }
.apple-icon--warning { color: var(--apple-icon-warning); }

/* ---- Inline Icon + Text ---- */
.apple-icon-inline {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-family: var(--apple-icon-font);
  font-size: 17px;
  line-height: 22px;
  color: var(--apple-icon-primary);
}

/* ---- Icon Button ---- */
.apple-icon-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 44px;
  min-height: 44px;
  padding: 8px;
  border: none;
  border-radius: 12px;
  background: transparent;
  color: var(--apple-icon-tint);
  cursor: pointer;
  transition: var(--apple-icon-transition);
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}
.apple-icon-button .apple-icon { color: inherit; }

.apple-icon-button--labeled {
  gap: 6px;
  padding: 8px 14px;
  font-family: var(--apple-icon-font);
  font-size: 17px;
  line-height: 22px;
}

/* ---- Feature Icon Container ---- */
.apple-icon-feature {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 80px;
  height: 80px;
  border-radius: 20px;
  background: rgba(120, 120, 128, 0.08);
  color: var(--apple-icon-tint);
}
.apple-icon-feature .apple-icon { color: inherit; }

/* ---- Hover (desktop) ---- */
@media (hover: hover) {
  .apple-icon-button:hover {
    background: rgba(120, 120, 128, 0.08);
  }
  .apple-icon-button:hover .apple-icon {
    transform: scale(1.05);
  }
}

/* ---- Active / Pressed ---- */
.apple-icon-button:active {
  opacity: 0.7;
  transform: scale(0.96);
}

/* ---- Focus ---- */
.apple-icon-button:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.4);
  outline-offset: 1px;
}

/* ---- Disabled ---- */
.apple-icon-button:disabled,
.apple-icon-button[aria-disabled="true"] {
  opacity: 0.3;
  cursor: not-allowed;
  pointer-events: none;
}

/* ---- Dark Mode (CSS overrides) ---- */
@media (prefers-color-scheme: dark) {
  .apple-icon-button:focus-visible {
    outline-color: rgba(10, 132, 255, 0.4);
  }
  .apple-icon-feature {
    background: rgba(120, 120, 128, 0.16);
  }
}
.dark .apple-icon-button:focus-visible {
  outline-color: rgba(10, 132, 255, 0.4);
}
.dark .apple-icon-feature {
  background: rgba(120, 120, 128, 0.16);
}
```

## States Reference

| State | Icon Button | Inline Icon | Feature Icon | Cursor |
|-------|------------|-------------|-------------|--------|
| Default | tint color, transparent bg | primary color | tint on subtle bg | pointer / default |
| Hover | subtle fill bg, scale 1.05 | — | — | pointer |
| Focus | 4px blue ring, 1px offset | — | — | pointer |
| Active | opacity 0.7, scale 0.96 | — | — | pointer |
| Disabled | opacity 0.3 | opacity 0.3 | opacity 0.3 | not-allowed |

## SVG Icon Library

20 commonly-needed icons drawn in SF Symbols style. Each uses `viewBox="0 0 24 24"`, `fill="none"`, `stroke="currentColor"`, `stroke-width="1.5"`, `stroke-linecap="round"`, `stroke-linejoin="round"`.

### chevron.right
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
```

### chevron.left
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M15 6l-6 6 6 6"/></svg>
```

### chevron.down
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg>
```

### checkmark
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 12.5l5 5 11-11"/></svg>
```

### xmark
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M6 6l12 12M18 6L6 18"/></svg>
```

### plus
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>
```

### minus
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/></svg>
```

### magnifyingglass
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="10.5" cy="10.5" r="6.5"/><path d="M15.5 15.5l5 5"/></svg>
```

### gear
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09a1.65 1.65 0 0 0-1.08-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09a1.65 1.65 0 0 0 1.51-1.08 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1.08 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9c.26.604.852.997 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1.08z"/></svg>
```

### person
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M5 21v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1"/></svg>
```

### bell
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
```

### lock
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V7a4 4 0 1 1 8 0v4"/></svg>
```

### globe
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M3.6 9h16.8M3.6 15h16.8"/><path d="M12 3a15.3 15.3 0 0 1 4 9 15.3 15.3 0 0 1-4 9 15.3 15.3 0 0 1-4-9 15.3 15.3 0 0 1 4-9z"/></svg>
```

### star
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87L18.18 22 12 18.56 5.82 22 7 14.14l-5-4.87 6.91-1.01z"/></svg>
```

### heart
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78L12 21.23l8.84-8.84a5.5 5.5 0 0 0 0-7.78z"/></svg>
```

### envelope
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3 7l9 6 9-6"/></svg>
```

### clock
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
```

### bolt
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L4 14h7l-1 8 9-12h-7l1-8z"/></svg>
```

### arrow.right
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/><path d="M13 5l7 7-7 7"/></svg>
```

### doc.text
```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><path d="M14 2v6h6"/><path d="M9 13h6M9 17h4"/></svg>
```

## Animation & Motion

```css
/* Icon entrance */
@keyframes apple-icon-pop {
  0% { transform: scale(0); opacity: 0; }
  60% { transform: scale(1.15); }
  100% { transform: scale(1); opacity: 1; }
}

/* Filled toggle (e.g., heart, star) */
@keyframes apple-icon-fill {
  0% { transform: scale(1); }
  40% { transform: scale(1.25); }
  100% { transform: scale(1); }
}

/* Continuous spin (loading, gear) */
@keyframes apple-icon-spin {
  to { transform: rotate(360deg); }
}

.apple-icon--pop { animation: apple-icon-pop 300ms cubic-bezier(0.2, 0.8, 0.2, 1); }
.apple-icon--fill-toggle { animation: apple-icon-fill 350ms cubic-bezier(0.2, 0.8, 0.2, 1); }
.apple-icon--spin { animation: apple-icon-spin 700ms linear infinite; }

@media (prefers-reduced-motion: reduce) {
  .apple-icon,
  .apple-icon-button {
    transition: none;
  }
  .apple-icon--pop,
  .apple-icon--fill-toggle,
  .apple-icon--spin {
    animation: none;
  }
}
```

## Accessibility

- **ARIA**: decorative icons use `aria-hidden="true"`; standalone meaningful icons use `role="img"` with `aria-label`
- **Icon buttons**: `<button>` with `aria-label` describing the action, SVG gets `aria-hidden="true"`
- **Focus ring**: 4px solid blue at 40% opacity, 1px offset on interactive icon containers
- **Touch target**: minimum 44x44px on all interactive icon elements (pad with min-width/min-height)
- **Keyboard**: Tab to focus icon buttons, Enter/Space to activate
- **Screen reader**: never expose raw SVG paths; always provide text alternative via `aria-label` or adjacent visible text
- **High contrast**: `currentColor` inheritance ensures icons follow system high-contrast settings

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Use 22px navigation icons; 44px min touch targets; feature icons at 48px |
| 600-1024px | Same sizing; icon buttons may appear in toolbars with labels hidden |
| > 1024px | Can reduce touch target to 34px (macOS pointer); 17px inline icons beside text |

## Do / Don't

| Do | Don't |
|----|-------|
| Use `currentColor` for stroke and fill | Hardcode hex colors directly in SVG paths |
| Match stroke weight to adjacent text weight | Use a single 1.5px stroke at every size |
| Use `stroke-linecap="round"` and `stroke-linejoin="round"` | Use square or butt linecap on SF Symbol-style icons |
| Scale stroke width with icon size (1.5px at 22px, 2.5px at 48px, 3px at 64px) | Keep 1.5px stroke width at 48px or larger |
| Export from SF Symbols app and convert to SVG when possible | Use emoji characters as icon replacements |
| Use outline style by default | Use filled variant unless in active/selected state |
| Add `aria-hidden="true"` on decorative icons | Leave icons without accessible context for screen readers |
| Provide `aria-label` on icon-only buttons | Assume the icon alone communicates meaning |
| Use Lucide/Phosphor for web projects (MIT licensed) | Extract SF Symbols and redistribute on web (license violation) |
| Use native Unicode emoji for decorative accents at 48px | Use Apple emoji PNGs from any CDN (copyrighted) |
