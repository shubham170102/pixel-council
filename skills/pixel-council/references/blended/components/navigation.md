---
name: navigation
description: Blended bottom nav, sidebar, and tabs combining M3 indicators with Apple Liquid Glass blur
metadata:
  tags: navigation, nav bar, sidebar, tabs, bottom nav, top nav, menu
---

# Navigation -- Blended Recommendation

## Quick Reference

| Component | Height | Use Case |
|-----------|--------|----------|
| Bottom bar | 64px + safe area | Mobile primary nav, 3-5 items |
| Sidebar | 256px width | Desktop/tablet primary nav |
| Top bar | 56px | Page title, actions, back nav |
| Tabs | 48px | Content switching within a view |

---

## Design Tokens (Shared)

```css
:root {
  --nav-bg: #FFFFFF;
  --nav-bg-glass: rgba(255, 255, 255, 0.72);
  --nav-border: rgba(60, 60, 67, 0.29);
  --nav-active: #6750A4;
  --nav-inactive: #49454F;
  --nav-active-indicator: rgba(103, 80, 164, 0.12);
  --nav-surface: #FEF7FF;
  --nav-on-surface: #1D1B20;
  --nav-hover: rgba(0, 0, 0, 0.04);
}

@media (prefers-color-scheme: dark) {
  :root {
    --nav-bg: #141218;
    --nav-bg-glass: rgba(30, 30, 30, 0.72);
    --nav-border: rgba(84, 84, 88, 0.6);
    --nav-active: #D0BCFF;
    --nav-inactive: #CAC4D0;
    --nav-active-indicator: rgba(208, 188, 255, 0.16);
    --nav-surface: #141218;
    --nav-on-surface: #E6E0E9;
    --nav-hover: rgba(255, 255, 255, 0.06);
  }
}

.dark {
  --nav-bg: #141218;
  --nav-bg-glass: rgba(30, 30, 30, 0.72);
  --nav-border: rgba(84, 84, 88, 0.6);
  --nav-active: #D0BCFF;
  --nav-inactive: #CAC4D0;
  --nav-active-indicator: rgba(208, 188, 255, 0.16);
  --nav-surface: #141218;
  --nav-on-surface: #E6E0E9;
  --nav-hover: rgba(255, 255, 255, 0.06);
}
```

---

## 1. Bottom Tab Bar (Mobile)

### HTML

```html
<nav class="bottom-bar" role="navigation" aria-label="Main navigation">
  <a href="/home" class="bottom-bar__tab bottom-bar__tab--active" aria-current="page">
    <span class="bottom-bar__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="bottom-bar__label">Home</span>
  </a>
  <a href="/search" class="bottom-bar__tab">
    <span class="bottom-bar__icon" aria-hidden="true">
      <svg width="24" height="24"><!-- icon --></svg>
    </span>
    <span class="bottom-bar__badge" aria-label="3 new">3</span>
    <span class="bottom-bar__label">Search</span>
  </a>
</nav>
```

### CSS

```css
.bottom-bar {
  display: flex;
  align-items: stretch;
  justify-content: space-around;
  width: 100%;
  height: calc(64px + env(safe-area-inset-bottom, 0px));
  padding-bottom: env(safe-area-inset-bottom, 0px);
  background: var(--nav-bg-glass);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border-top: 0.5px solid var(--nav-border);
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 50;
}

.bottom-bar__tab {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex: 1;
  min-width: 48px;
  gap: 4px;
  padding: 8px 0 4px;
  text-decoration: none;
  cursor: pointer;
  position: relative;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
}

.bottom-bar__icon {
  width: 24px;
  height: 24px;
  color: var(--nav-inactive);
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.bottom-bar__tab--active .bottom-bar__icon { color: var(--nav-active); }

.bottom-bar__label {
  font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Text', Roboto, sans-serif;
  font-size: 11px;
  font-weight: 500;
  line-height: 14px;
  color: var(--nav-inactive);
  transition: color 200ms cubic-bezier(0.2, 0, 0, 1);
}

.bottom-bar__tab--active .bottom-bar__label { color: var(--nav-active); }

.bottom-bar__badge {
  position: absolute;
  top: 4px;
  left: calc(50% + 6px);
  min-width: 16px;
  height: 16px;
  padding: 0 4px;
  border-radius: 9999px;
  background: #B3261E;
  color: #FFFFFF;
  font-size: 10px;
  font-weight: 600;
  line-height: 16px;
  text-align: center;
}

.bottom-bar__tab:hover .bottom-bar__icon,
.bottom-bar__tab:hover .bottom-bar__label { opacity: 0.8; }

.bottom-bar__tab:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
  border-radius: 4px;
}

.bottom-bar__tab:active { opacity: 0.6; }
```

---

## 2. Sidebar (Desktop/Tablet)

### HTML

```html
<aside class="sidebar" role="navigation" aria-label="Main menu">
  <div class="sidebar__section-header">Main</div>
  <a href="/dashboard" class="sidebar__item sidebar__item--active" aria-current="page">
    <span class="sidebar__icon" aria-hidden="true">
      <svg width="20" height="20"><!-- icon --></svg>
    </span>
    <span class="sidebar__label">Dashboard</span>
  </a>
  <a href="/projects" class="sidebar__item">
    <span class="sidebar__icon" aria-hidden="true">
      <svg width="20" height="20"><!-- icon --></svg>
    </span>
    <span class="sidebar__label">Projects</span>
    <span class="sidebar__count">8</span>
  </a>
  <div class="sidebar__divider" aria-hidden="true"></div>
  <div class="sidebar__section-header">Settings</div>
  <a href="/settings" class="sidebar__item">
    <span class="sidebar__icon" aria-hidden="true">
      <svg width="20" height="20"><!-- icon --></svg>
    </span>
    <span class="sidebar__label">Preferences</span>
  </a>
</aside>
```

### CSS

```css
.sidebar {
  display: flex;
  flex-direction: column;
  width: 256px;
  height: 100%;
  background: var(--nav-bg);
  border-right: 1px solid var(--nav-border);
  padding: 12px 8px;
  overflow-y: auto;
  transition: width 250ms ease-in-out;
}

.sidebar--collapsed {
  width: 64px;
  padding: 12px 8px;
}

.sidebar--collapsed .sidebar__label,
.sidebar--collapsed .sidebar__count,
.sidebar--collapsed .sidebar__section-header { display: none; }

.sidebar__section-header {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 12px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: var(--nav-inactive);
  padding: 24px 12px 4px;
}

.sidebar__item {
  display: flex;
  align-items: center;
  height: 40px;
  padding: 0 12px;
  gap: 12px;
  border-radius: 8px;
  text-decoration: none;
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  user-select: none;
  transition: background-color 150ms ease;
}

.sidebar__item--active {
  background: var(--nav-active-indicator);
}

.sidebar__icon {
  width: 20px;
  height: 20px;
  flex-shrink: 0;
  color: var(--nav-inactive);
}

.sidebar__item--active .sidebar__icon { color: var(--nav-active); }

.sidebar__label {
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px;
  font-weight: 400;
  line-height: 20px;
  color: var(--nav-on-surface);
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.sidebar__item--active .sidebar__label {
  font-weight: 500;
  color: var(--nav-active);
}

.sidebar__count {
  font-size: 12px;
  color: var(--nav-inactive);
}

.sidebar__divider {
  height: 1px;
  background: var(--nav-border);
  margin: 8px 12px;
}

.sidebar__item:hover { background: var(--nav-hover); }
.sidebar__item--active:hover { background: var(--nav-active-indicator); }

.sidebar__item:focus-visible {
  outline: 4px solid rgba(0, 122, 255, 0.6);
  outline-offset: 1px;
}

.sidebar__item:active { opacity: 0.8; }
```

---

## 3. Tabs (Content Switching)

### HTML

```html
<div class="tabs" role="tablist" aria-label="Content sections">
  <button class="tabs__tab tabs__tab--active" role="tab"
          aria-selected="true" aria-controls="panel-1" id="tab-1">Overview</button>
  <button class="tabs__tab" role="tab"
          aria-selected="false" aria-controls="panel-2" id="tab-2" tabindex="-1">Details</button>
</div>
```

### CSS

```css
.tabs {
  display: flex;
  gap: 0;
  border-bottom: 1px solid var(--nav-border);
  background: var(--nav-bg);
  overflow-x: auto;
  scrollbar-width: none;
}

.tabs::-webkit-scrollbar { display: none; }

.tabs__tab {
  flex: 1;
  min-width: 72px;
  height: 48px;
  padding: 0 16px;
  border: none;
  background: transparent;
  font-family: -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
  font-size: 14px;
  font-weight: 500;
  color: var(--nav-inactive);
  cursor: pointer;
  position: relative;
  white-space: nowrap;
  -webkit-tap-highlight-color: transparent;
  transition: color 200ms ease;
}

.tabs__tab--active { color: var(--nav-active); }

.tabs__tab--active::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 16px;
  right: 16px;
  height: 3px;
  background: var(--nav-active);
  border-radius: 3px 3px 0 0;
}

.tabs__tab:hover { background: var(--nav-hover); }
.tabs__tab:focus-visible { outline: 4px solid rgba(0,122,255,0.6); outline-offset: -2px; }
.tabs__tab:active { opacity: 0.7; }
```

---

## Responsive Switching

```css
/* Mobile: show bottom bar, hide sidebar */
@media (max-width: 767px) {
  .sidebar { display: none; }
  .bottom-bar { display: flex; }
}

/* Tablet: show collapsed sidebar */
@media (min-width: 768px) and (max-width: 1023px) {
  .bottom-bar { display: none; }
  .sidebar { width: 64px; }
  .sidebar .sidebar__label,
  .sidebar .sidebar__count,
  .sidebar .sidebar__section-header { display: none; }
}

/* Desktop: show full sidebar */
@media (min-width: 1024px) {
  .bottom-bar { display: none; }
  .sidebar { width: 256px; }
}

@media (prefers-reduced-motion: reduce) {
  .sidebar,
  .bottom-bar__icon,
  .bottom-bar__label,
  .tabs__tab {
    transition: none;
  }
}
```

## Accessibility

- Bottom bar: `role="navigation"`, `aria-label`, `aria-current="page"`
- Sidebar: `role="navigation"`, `aria-label`, `aria-current="page"`
- Tabs: `role="tablist"`, `role="tab"`, `aria-selected`, `aria-controls`
- Keyboard: Tab to enter; Arrow keys to navigate; Enter/Space to activate
- Focus: 4px solid `rgba(0,122,255,0.6)` outline
- Touch targets: Min 44x44px on all interactive elements

## Do / Don't

| Do | Don't |
|----|-------|
| Switch from bottom bar to sidebar at breakpoints | Show both bottom bar and sidebar simultaneously |
| Keep 3-5 items in bottom bar | Use bottom bar on desktop |
| Use collapsed sidebar on tablets | Force full sidebar on narrow screens |
| Preserve navigation state across switches | Reset state when layout changes |
