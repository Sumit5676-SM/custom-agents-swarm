# High-Fidelity Visual Design Reference Guidelines

This guide details best practices for generating pixel-perfect UI mockup images, authoring standalone interactive HTML/CSS prototypes, and preparing visual specification sheets for developer handoff.

---

## 1. Visual Mockup Generation Prompting Best Practices

When crafting text prompts for UI image generation:
1. **Isolate the Interface**:
   - Explicitly instruct the model to render *only the user interface canvas itself*. Avoid terms like "iPhone on desk", "laptop on marble table", or "hand holding phone".
2. **Specify Visual Hierarchy & Style**:
   - Modern clean SaaS UI aesthetic, subtle card borders (`#E2E8F0`), soft ambient shadows, rounded card corners (`12px`), crisp typography (`Inter` or clean sans-serif).
   - High color contrast meeting WCAG AA standards with clear primary call-to-action buttons.
3. **Use Realistic Content**:
   - Avoid generic placeholder text like "Lorem Ipsum". Use realistic names, currencies, timestamps, and merchant descriptions (e.g., *"Giotto's Italian Bistro - $145.20"*).
4. **Define Aspect Ratios**:
   - Mobile Screens: `9:16`
   - Tablet / Dual-Pane Screens: `3:4` or `4:3`
   - Desktop Web Apps / Dashboards: `16:9`

---

## 2. Interactive Standalone HTML/CSS Prototype Architecture

When constructing `.html` prototype deliverables:
- **Zero External Heavy Dependencies**: Rely on standard CSS custom properties or Tailwind via CDN for standalone portability.
- **Accessible Typography & Focus**:
  - Load Google Fonts (e.g., `Inter`) via standard `<link>`.
  - Ensure `:focus-visible` rings are distinctly visible (`2px solid var(--color-primary)` with `2px offset`).
- **Interactive State Dynamics**:
  - Add realistic micro-interactions:
    - Button click active states (`transform: scale(0.98)`).
    - Smooth hover color transitions (`transition: all 150ms ease-out`).
    - Expandable dropdowns or toggles using lightweight vanilla JavaScript.
- **Responsive Layout**:
  - Use modern layout primitives (`display: grid`, `display: flex`, `gap`, `clamp()`).

---

## 3. Developer Handoff Specification Sheet

Every `.html` and `.png` deliverable should be accompanied by a `<initiative>-visual-spec.md` detailing:
- **Color Tokens**: Exact HEX and RGB values for backgrounds, surfaces, text, borders, and accents.
- **Component Geometry**: Widths, heights, corner radii, padding, margins, and elevation shadow CSS snippets.
- **Typography Matrix**: Font families, weights, font-sizes (rem/px), and unitless line-heights.
- **Assets & Icons**: SVG icon paths, image aspect ratios, and asset export checklist.
