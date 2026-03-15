# Composition Principles

Apply these principles to every page you build. Think like a designer, not a template filler.

## Typography as a Primary Design Tool

- Use the design system's **FULL type scale** — not just one body size everywhere
- Hero/display text should be noticeably larger than section headings, which are noticeably larger than body
- Map at least 3-4 levels: Display → Headline → Title → Body → Label
- Proper `line-height`, `letter-spacing`, and `font-weight` from the overview file — these details separate polished from generic

## Color Distribution with Intention

- Primary color appears on CTAs, key interactive elements, and selected states — NOT splashed on every surface
- Surface colors create the spatial foundation (Surface, Surface-Container, Surface-Container-High from M3; or System Background tiers from Apple)
- Use the `on-` counterpart tokens for text on colored backgrounds — never guess contrast
- **One bold accent + restrained surfaces** >>> multiple competing colors

## Spatial Composition

- Establish clear visual hierarchy through size contrast, spacing, and weight — not just color
- Give major sections generous whitespace (48-64px vertical between page sections at minimum)
- Group related items with tighter spacing (8-16px) to create visual clusters
- Use the design system's spacing grid consistently (4px/8px increments for M3, 8pt grid for Apple)
- Break monotony: not every section should be full-width centered content. Consider asymmetric layouts, offset grids, or mixed widths where they serve the content

## Purposeful Motion

- **Page load**: Stagger the reveal of major sections using `animation-delay` (0ms, 50ms, 100ms, 150ms...) with fade-in + slight translate-Y. This creates a choreographed entrance, not an abrupt flash.
- **Scroll interactions**: Elements that appear on scroll should animate in (use `IntersectionObserver` + CSS classes). Cards, features, stats — these feel alive when they enter smoothly.
- **Micro-interactions**: Hover lifts on cards (subtle `translateY(-2px)` + shadow increase), button press feedback, toggle animations. Use the easing curves from the reference files.
- **`prefers-reduced-motion`**: Always include. Remove `animation-delay`, `transform`, and `transition` under this media query.
- Use the **EXACT easing values** from the reference: `cubic-bezier(0.2, 0, 0, 1.0)` for M3 standard, `cubic-bezier(0.05, 0.7, 0.1, 1)` for M3 decelerate, `ease-out` with specific durations for Apple.

## Atmosphere and Depth

- Don't default to flat solid-color backgrounds. Use the design system's elevation system to create depth:
  - **M3**: Tonal elevation (Surface → Surface-Container → Surface-Container-High) + `box-shadow` from elevation tokens
  - **Apple**: Layered materials with `backdrop-filter: blur()` (Liquid Glass), layered shadows at multiple offsets
- Consider subtle background treatments for hero/CTA sections — a gentle gradient using surface variants, or a pattern that fits the design system's character
- Shadows should match the reference file exactly — not `shadow-md` guesses but the precise `box-shadow` values from the elevation tokens
