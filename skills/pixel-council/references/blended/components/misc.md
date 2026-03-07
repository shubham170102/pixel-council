---
name: misc
description: Blended avatar, badge, tooltip, divider, skeleton, empty-state, and kbd components
metadata:
  tags: avatar, badge, tooltip, divider, skeleton, empty state, keyboard shortcut, kbd, profile picture
---

# Miscellaneous Components -- Blended Recommendation

Seven mini-components: avatar, badge, tooltip, divider, skeleton, empty-state, kbd.

---

## 1. Avatar

```css
:root { --avatar-bg: #E8DEF8; --avatar-text: #1D192B; --avatar-border: #CAC4D0; }
.dark, :root:has(.dark) { --avatar-bg: #4A4458; --avatar-text: #E8DEF8; --avatar-border: #49454F; }
```

```html
<div class="avatar" role="img" aria-label="Jane Doe">
  <img src="photo.jpg" alt="" class="avatar__image" />
</div>
<div class="avatar avatar--initials" role="img" aria-label="Jane Doe">
  <span class="avatar__text">JD</span>
</div>
```

```css
.avatar {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 9999px;
  background: var(--avatar-bg);
  overflow: hidden;
  flex-shrink: 0;
}
.avatar--sm { width: 24px; height: 24px; }
.avatar--lg { width: 56px; height: 56px; }
.avatar__image { width: 100%; height: 100%; object-fit: cover; }
.avatar__text {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px; font-weight: 500; color: var(--avatar-text);
}
.avatar--sm .avatar__text { font-size: 10px; }
.avatar--lg .avatar__text { font-size: 20px; }
.avatar--bordered { border: 2px solid var(--avatar-border); }

@media (prefers-color-scheme: dark) {
  :root { --avatar-bg: #4A4458; --avatar-text: #E8DEF8; --avatar-border: #49454F; }
}
```

---

## 2. Badge

```css
:root { --badge-bg: #B3261E; --badge-text: #FFFFFF; }
.dark { --badge-bg: #F2B8B5; --badge-text: #601410; }
```

```html
<span class="badge-wrapper">
  <button aria-label="Notifications, 5 unread"><!-- icon --></button>
  <span class="badge" aria-hidden="true">5</span>
</span>
<span class="badge badge--dot" aria-hidden="true"></span>
```

```css
.badge-wrapper { position: relative; display: inline-flex; }
.badge {
  position: absolute; top: -4px; right: -4px;
  min-width: 18px; height: 18px; padding: 0 5px;
  border-radius: 9999px;
  background: var(--badge-bg); color: var(--badge-text);
  font-size: 11px; font-weight: 600; line-height: 18px;
  text-align: center; pointer-events: none; z-index: 1;
  border: 2px solid var(--nav-bg, #FFFFFF);
}
.badge--dot {
  min-width: 8px; width: 8px; height: 8px;
  padding: 0; top: -2px; right: -2px;
}

@media (prefers-color-scheme: dark) {
  :root { --badge-bg: #F2B8B5; --badge-text: #601410; }
  .badge { border-color: var(--nav-bg, #141218); }
}
```

---

## 3. Tooltip

```css
:root { --tooltip-bg: #322F35; --tooltip-text: #F5EFF7; }
.dark { --tooltip-bg: #E6E0E9; --tooltip-text: #322F35; }
```

```html
<span class="tooltip-wrapper">
  <button aria-describedby="tip-1">Hover</button>
  <span class="tooltip" id="tip-1" role="tooltip">Help text</span>
</span>
```

```css
.tooltip-wrapper { position: relative; display: inline-flex; }
.tooltip {
  position: absolute; bottom: calc(100% + 8px); left: 50%;
  transform: translateX(-50%);
  padding: 6px 10px; border-radius: 6px;
  background: var(--tooltip-bg); color: var(--tooltip-text);
  font-size: 12px; line-height: 16px; white-space: nowrap;
  max-width: 240px; z-index: 70;
  opacity: 0; pointer-events: none;
  transition: opacity 150ms ease;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}
.tooltip-wrapper:hover .tooltip,
.tooltip-wrapper:focus-within .tooltip {
  opacity: 1; transition-delay: 500ms;
}

@media (prefers-color-scheme: dark) {
  :root { --tooltip-bg: #E6E0E9; --tooltip-text: #322F35; }
}
@media (prefers-reduced-motion: reduce) {
  .tooltip { transition: none; }
}
```

---

## 4. Divider

```css
:root { --divider-color: #CAC4D0; }
.dark { --divider-color: #49454F; }
```

```html
<hr class="divider" aria-hidden="true" />
<hr class="divider divider--inset" aria-hidden="true" />
<div class="divider divider--vertical" aria-hidden="true"></div>
```

```css
.divider {
  width: 100%; height: 1px; border: none; margin: 0;
  background: var(--divider-color); flex-shrink: 0;
}
.divider--inset { margin-left: 16px; width: calc(100% - 16px); }
.divider--vertical {
  width: 1px; height: auto; align-self: stretch; display: inline-block;
}

@media (prefers-color-scheme: dark) {
  :root { --divider-color: #49454F; }
}
```

---

## 5. Skeleton

```css
:root { --skeleton-bg: #E6E0E9; --skeleton-shine: #F7F2FA; }
.dark { --skeleton-bg: #36343B; --skeleton-shine: #49454F; }
```

```html
<div class="skeleton skeleton--text" aria-hidden="true"></div>
<div class="skeleton skeleton--circle" aria-hidden="true"></div>
<div class="skeleton skeleton--rect" aria-hidden="true"></div>
```

```css
.skeleton {
  background: var(--skeleton-bg);
  border-radius: 4px;
  position: relative;
  overflow: hidden;
}
.skeleton--text { height: 16px; width: 100%; border-radius: 4px; }
.skeleton--circle { width: 40px; height: 40px; border-radius: 9999px; }
.skeleton--rect { width: 100%; height: 120px; border-radius: 8px; }

@keyframes skeleton-shimmer {
  from { transform: translateX(-100%); }
  to { transform: translateX(100%); }
}
.skeleton::after {
  content: "";
  position: absolute; inset: 0;
  background: linear-gradient(90deg, transparent, var(--skeleton-shine), transparent);
  animation: skeleton-shimmer 1.5s ease-in-out infinite;
}

@media (prefers-color-scheme: dark) {
  :root { --skeleton-bg: #36343B; --skeleton-shine: #49454F; }
}
@media (prefers-reduced-motion: reduce) {
  .skeleton::after { animation: none; }
}
```

---

## 6. Empty State

```css
:root { --empty-title: #1D1B20; --empty-desc: #49454F; --empty-icon: #CAC4D0; }
.dark { --empty-title: #E6E0E9; --empty-desc: #CAC4D0; --empty-icon: #49454F; }
```

```html
<div class="empty-state" role="status">
  <div class="empty-state__icon" aria-hidden="true">
    <svg width="64" height="64"><!-- illustration --></svg>
  </div>
  <h3 class="empty-state__title">No results found</h3>
  <p class="empty-state__description">Try adjusting your search or filters.</p>
  <button class="empty-state__action">Clear filters</button>
</div>
```

```css
.empty-state {
  display: flex; flex-direction: column; align-items: center;
  justify-content: center; text-align: center;
  padding: 48px 24px; max-width: 320px; margin: 0 auto;
}
.empty-state__icon { color: var(--empty-icon); margin-bottom: 16px; }
.empty-state__title {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 18px; font-weight: 600; line-height: 24px;
  color: var(--empty-title); margin: 0 0 8px;
}
.empty-state__description {
  font-size: 14px; line-height: 20px; color: var(--empty-desc);
  margin: 0 0 20px; max-width: 280px;
}
.empty-state__action {
  padding: 10px 24px; border-radius: 9999px; border: none;
  background: #6750A4; color: #FFFFFF;
  font-size: 14px; font-weight: 500; cursor: pointer;
}
.empty-state__action:hover { opacity: 0.9; }
.empty-state__action:focus-visible {
  outline: 4px solid rgba(0,122,255,0.6); outline-offset: 2px;
}

@media (prefers-color-scheme: dark) {
  :root { --empty-title: #E6E0E9; --empty-desc: #CAC4D0; --empty-icon: #49454F; }
  .empty-state__action { background: #D0BCFF; color: #381E72; }
}
.dark .empty-state__action { background: #D0BCFF; color: #381E72; }
```

---

## 7. Kbd (Keyboard Shortcut)

```css
:root { --kbd-bg: #F3EDF7; --kbd-text: #1D1B20; --kbd-border: #CAC4D0; }
.dark { --kbd-bg: #2B2930; --kbd-text: #E6E0E9; --kbd-border: #49454F; }
```

```html
<p>Press <kbd class="kbd">Ctrl</kbd> + <kbd class="kbd">S</kbd> to save</p>
```

```css
.kbd {
  display: inline-block;
  padding: 2px 6px;
  border-radius: 4px;
  background: var(--kbd-bg);
  color: var(--kbd-text);
  border: 1px solid var(--kbd-border);
  font-family: -apple-system, BlinkMacSystemFont, 'SF Mono', 'Roboto Mono', monospace;
  font-size: 12px;
  line-height: 18px;
  font-weight: 500;
  white-space: nowrap;
  box-shadow: 0 1px 0 var(--kbd-border);
  vertical-align: baseline;
}

@media (prefers-color-scheme: dark) {
  :root { --kbd-bg: #2B2930; --kbd-text: #E6E0E9; --kbd-border: #49454F; }
}
```

---

## Accessibility Notes

- **Avatar**: `role="img"` with `aria-label` for name
- **Badge**: `aria-hidden="true"` on badge; count in parent `aria-label`
- **Tooltip**: `role="tooltip"`, `aria-describedby` on trigger
- **Divider**: `aria-hidden="true"` for decorative; `role="separator"` for semantic
- **Skeleton**: `aria-hidden="true"` (loading placeholder)
- **Empty state**: `role="status"` for live region; action button focusable
- **Kbd**: Semantic `<kbd>` element; no additional ARIA needed
