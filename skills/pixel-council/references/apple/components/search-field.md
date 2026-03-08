---
name: search-field
description: Apple search field — search bar, suggestions, scope bar, cancel button, tokens
metadata:
  tags: search, search field, search bar, query, filter, scope, suggestions, find
---

# Search Field -- Apple Human Interface Guidelines

## Quick Reference

| Property | Value |
|----------|-------|
| Height | 36px (field), 44px (touch target) |
| Corner radius | 10px continuous |
| Font | SF Pro, 17px/22px, weight 400 |
| Placeholder color (light) | rgba(60,60,67,0.3) |
| Placeholder color (dark) | rgba(235,235,245,0.3) |
| Background (light) | rgba(120,120,128,0.12) |
| Background (dark) | rgba(120,120,128,0.24) |
| Icon color (light) | rgba(60,60,67,0.6) |
| Icon color (dark) | rgba(235,235,245,0.6) |
| CSS prefix | `.apple-search` |

## Design Tokens

```css
:root {
  --apple-search-bg: rgba(120, 120, 128, 0.12);
  --apple-search-text: #000000;
  --apple-search-placeholder: rgba(60, 60, 67, 0.3);
  --apple-search-icon: rgba(60, 60, 67, 0.6);
  --apple-search-tint: #007AFF;
  --apple-search-cancel: #007AFF;
  --apple-search-scope-bg: rgba(120, 120, 128, 0.16);
  --apple-search-scope-selected-bg: #FFFFFF;
  --apple-search-separator: rgba(60, 60, 67, 0.29);
  --apple-search-focus-ring: rgba(0, 122, 255, 0.6);
  --apple-search-clear-bg: rgba(60, 60, 67, 0.3);
  --apple-search-font: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text',
    'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media (prefers-color-scheme: dark) {
  :root {
    --apple-search-bg: rgba(120, 120, 128, 0.24);
    --apple-search-text: #FFFFFF;
    --apple-search-placeholder: rgba(235, 235, 245, 0.3);
    --apple-search-icon: rgba(235, 235, 245, 0.6);
    --apple-search-tint: #0A84FF;
    --apple-search-cancel: #0A84FF;
    --apple-search-scope-bg: rgba(120, 120, 128, 0.36);
    --apple-search-scope-selected-bg: rgba(120, 120, 128, 0.36);
    --apple-search-separator: rgba(84, 84, 88, 0.6);
    --apple-search-focus-ring: rgba(10, 132, 255, 0.6);
    --apple-search-clear-bg: rgba(235, 235, 245, 0.3);
  }
}
.dark {
  --apple-search-bg: rgba(120, 120, 128, 0.24);
  --apple-search-text: #FFFFFF;
  --apple-search-placeholder: rgba(235, 235, 245, 0.3);
  --apple-search-icon: rgba(235, 235, 245, 0.6);
  --apple-search-tint: #0A84FF;
  --apple-search-cancel: #0A84FF;
  --apple-search-scope-bg: rgba(120, 120, 128, 0.36);
  --apple-search-scope-selected-bg: rgba(120, 120, 128, 0.36);
  --apple-search-separator: rgba(84, 84, 88, 0.6);
  --apple-search-focus-ring: rgba(10, 132, 255, 0.6);
  --apple-search-clear-bg: rgba(235, 235, 245, 0.3);
}
```

## Variants

| Style | Description | Background | Has Scope Bar |
|-------|-------------|------------|---------------|
| Standard | Basic search field in navigation bar | tertiary fill | No |
| With Scope | Search with segmented scope filter below | tertiary fill | Yes |
| With Cancel | Shows cancel button when focused | tertiary fill | No |
| With Tokens | Displays search tokens/chips in field | tertiary fill | No |
| Prominent | Standalone search (not embedded in nav) | secondary fill | Optional |

## HTML Structure

```html
<!-- Standard Search Field -->
<div class="apple-search" role="search">
  <div class="apple-search__field">
    <svg class="apple-search__icon" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <circle cx="6.5" cy="6.5" r="5.5" fill="none" stroke="currentColor" stroke-width="1.5"/>
      <line x1="10.5" y1="10.5" x2="15" y2="15" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
    </svg>
    <input type="search" class="apple-search__input" placeholder="Search"
           aria-label="Search" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" />
    <button class="apple-search__clear" aria-label="Clear search" hidden>
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <circle cx="8" cy="8" r="7" fill="currentColor"/>
        <path d="M5.5 5.5L10.5 10.5M10.5 5.5L5.5 10.5" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
    </button>
  </div>
  <button class="apple-search__cancel" hidden>Cancel</button>
</div>

<!-- Search with Scope Bar -->
<div class="apple-search apple-search--with-scope" role="search">
  <div class="apple-search__field">
    <svg class="apple-search__icon" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <circle cx="6.5" cy="6.5" r="5.5" fill="none" stroke="currentColor" stroke-width="1.5"/>
      <line x1="10.5" y1="10.5" x2="15" y2="15" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
    </svg>
    <input type="search" class="apple-search__input" placeholder="Search"
           aria-label="Search" />
    <button class="apple-search__clear" aria-label="Clear search" hidden>
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <circle cx="8" cy="8" r="7" fill="currentColor"/>
        <path d="M5.5 5.5L10.5 10.5M10.5 5.5L5.5 10.5" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
    </button>
  </div>
  <div class="apple-search__scope" role="tablist" aria-label="Search scope">
    <button class="apple-search__scope-item apple-search__scope-item--selected" role="tab" aria-selected="true">All</button>
    <button class="apple-search__scope-item" role="tab" aria-selected="false">People</button>
    <button class="apple-search__scope-item" role="tab" aria-selected="false">Places</button>
  </div>
</div>

<!-- Search with Suggestions -->
<div class="apple-search apple-search--active" role="search">
  <div class="apple-search__field">
    <svg class="apple-search__icon" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
      <circle cx="6.5" cy="6.5" r="5.5" fill="none" stroke="currentColor" stroke-width="1.5"/>
      <line x1="10.5" y1="10.5" x2="15" y2="15" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
    </svg>
    <input type="search" class="apple-search__input" placeholder="Search" value="App"
           aria-label="Search" aria-expanded="true" aria-controls="search-suggestions" />
    <button class="apple-search__clear" aria-label="Clear search">
      <svg width="16" height="16" viewBox="0 0 16 16" aria-hidden="true">
        <circle cx="8" cy="8" r="7" fill="currentColor"/>
        <path d="M5.5 5.5L10.5 10.5M10.5 5.5L5.5 10.5" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
    </button>
  </div>
  <button class="apple-search__cancel">Cancel</button>
  <ul class="apple-search__suggestions" id="search-suggestions" role="listbox">
    <li class="apple-search__suggestion" role="option">
      <svg class="apple-search__suggestion-icon" aria-hidden="true"><!-- magnifying glass --></svg>
      <span>Apple Music</span>
    </li>
    <li class="apple-search__suggestion" role="option">
      <svg class="apple-search__suggestion-icon" aria-hidden="true"><!-- magnifying glass --></svg>
      <span>App Store</span>
    </li>
  </ul>
</div>
```

## Complete CSS

```css
.apple-search {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  font-family: var(--apple-search-font);
  -webkit-font-smoothing: antialiased;
  position: relative;
}

.apple-search__field {
  display: flex;
  align-items: center;
  flex: 1;
  height: 36px;
  padding: 0 8px;
  background: var(--apple-search-bg);
  border-radius: 10px;
  border: none;
  gap: 6px;
  transition: background-color 150ms ease-out;
}

.apple-search__icon {
  color: var(--apple-search-icon);
  flex-shrink: 0;
  width: 16px;
  height: 16px;
}

.apple-search__input {
  flex: 1;
  background: none;
  border: none;
  outline: none;
  font-family: var(--apple-search-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  color: var(--apple-search-text);
  padding: 0;
  min-width: 0;
}
.apple-search__input::placeholder {
  color: var(--apple-search-placeholder);
}
.apple-search__input::-webkit-search-cancel-button {
  -webkit-appearance: none;
  display: none;
}

/* Clear button */
.apple-search__clear {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 16px;
  height: 16px;
  padding: 0;
  background: none;
  border: none;
  color: var(--apple-search-clear-bg);
  cursor: pointer;
  flex-shrink: 0;
  transition: opacity 150ms ease-out;
}
.apple-search__clear:active { opacity: 0.5; }

/* Cancel button */
.apple-search__cancel {
  background: none;
  border: none;
  color: var(--apple-search-cancel);
  font-family: var(--apple-search-font);
  font-size: 17px;
  font-weight: 400;
  line-height: 22px;
  letter-spacing: -0.41px;
  padding: 8px 0;
  cursor: pointer;
  white-space: nowrap;
  transition: opacity 150ms ease-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-search__cancel:active { opacity: 0.5; }

/* Scope bar */
.apple-search__scope {
  display: flex;
  gap: 0;
  background: var(--apple-search-scope-bg);
  border-radius: 8px;
  padding: 2px;
  margin: 0 16px 8px;
}
.apple-search__scope-item {
  flex: 1;
  background: none;
  border: none;
  font-family: var(--apple-search-font);
  font-size: 13px;
  font-weight: 500;
  line-height: 18px;
  color: var(--apple-search-text);
  padding: 5px 12px;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 200ms ease-in-out;
  -webkit-tap-highlight-color: transparent;
}
.apple-search__scope-item--selected {
  background: var(--apple-search-scope-selected-bg);
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.06);
  font-weight: 600;
}

/* Suggestions dropdown */
.apple-search__suggestions {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: var(--apple-search-scope-selected-bg, #FFFFFF);
  border-bottom: 0.5px solid var(--apple-search-separator);
  list-style: none;
  margin: 0;
  padding: 0;
  z-index: 10;
}
.apple-search__suggestion {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 11px 16px;
  font-size: 17px;
  line-height: 22px;
  color: var(--apple-search-text);
  cursor: pointer;
  border-bottom: 0.5px solid var(--apple-search-separator);
}
.apple-search__suggestion:last-child { border-bottom: none; }

.apple-search__suggestion-icon {
  color: var(--apple-search-icon);
  width: 20px;
  height: 20px;
  flex-shrink: 0;
}

/* Focus */
.apple-search__field:focus-within {
  outline: 4px solid var(--apple-search-focus-ring);
  outline-offset: 1px;
}

/* Hover (desktop) */
@media (hover: hover) {
  .apple-search__suggestion:hover {
    background: var(--apple-search-bg);
  }
  .apple-search__scope-item:hover:not(.apple-search__scope-item--selected) {
    background: rgba(120, 120, 128, 0.08);
  }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
  .apple-search__suggestions {
    background: #1C1C1E;
  }
  .apple-search__field:focus-within {
    outline-color: rgba(10, 132, 255, 0.6);
  }
}
.dark .apple-search__suggestions {
  background: #1C1C1E;
}
.dark .apple-search__field:focus-within {
  outline-color: rgba(10, 132, 255, 0.6);
}
```

## States Reference

| State | Field Background | Icon | Cancel | Clear | Cursor |
|-------|-----------------|------|--------|-------|--------|
| Default (empty) | tertiary fill | secondary label | hidden | hidden | text |
| Focused (empty) | tertiary fill | secondary label | visible | hidden | text |
| Focused (typing) | tertiary fill | secondary label | visible | visible | text |
| Hover (desktop) | slightly darker fill | — | — | — | text |
| Disabled | tertiary fill, 0.4 opacity | dimmed | hidden | hidden | not-allowed |

## Animation & Motion

```css
/* Cancel button reveal */
.apple-search__cancel {
  transition: opacity 200ms ease-out, max-width 200ms ease-out;
}
.apple-search__cancel[hidden] {
  opacity: 0;
  max-width: 0;
  overflow: hidden;
  padding: 0;
}

/* Scope selection slide */
.apple-search__scope-item {
  transition: background-color 200ms ease-in-out, box-shadow 200ms ease-in-out;
}

@media (prefers-reduced-motion: reduce) {
  .apple-search__cancel,
  .apple-search__scope-item,
  .apple-search__field,
  .apple-search__clear {
    transition: none;
  }
}
```

## Accessibility

- **ARIA**: `role="search"` on container, `aria-label="Search"` on input, `aria-expanded` when suggestions visible, `aria-controls` linking input to suggestions, `role="listbox"` on suggestions
- **Keyboard**: Tab to focus field, Escape to clear/dismiss, Up/Down arrows to navigate suggestions, Enter to select suggestion
- **Focus ring**: 4px solid blue at 60% opacity on field container
- **Touch target**: 36px field height with 8px vertical padding = 44px touch target
- **Screen reader**: Search icon is `aria-hidden`, clear button has `aria-label="Clear search"`
- **Autocomplete**: `autocomplete="off"` to prevent browser suggestions, custom suggestions via ARIA

## Responsive

| Breakpoint | Behavior |
|-----------|----------|
| < 600px | Full width with 16px margins, cancel animates in on focus |
| 600-1024px | Can be placed in navigation bar, narrower margins |
| > 1024px | Fixed max-width (~400px), can be part of toolbar |

## Do / Don't

| Do | Don't |
|----|-------|
| Use placeholder "Search" or contextual "Search [content type]" | Leave placeholder empty or use "Type here..." |
| Show clear button only when text is present | Always show the clear button |
| Animate cancel button in/out on focus | Show cancel button at all times |
| Provide search suggestions for faster discovery | Leave suggestions list unstyled or without keyboard nav |
| Use scope bar when content has 2-4 clear categories | Use scope bar with more than 5 segments |
