---
name: hi-fi-visual-design
description: Guide for creating High-Fidelity Visual Designs, pixel-perfect UI mockups, interactive HTML/CSS prototypes, and visual design spec sheets. Use when translating wireframes and design systems into final visual deliverables, generating UI mockup images, and producing browser-previewable prototypes.
---

# High-Fidelity Visual Design

High-fidelity visual design translates wireframes and design tokens into polished, production-grade interface representations. It demonstrates exact styling, typography, elevation shadows, realistic data, and interactive feedback.

---

## The Three Core Deliverables of Hi-Fi Design

Every high-fidelity visual design initiative produces three complementary deliverables:

1. **Pixel-Perfect Visual Mockup Render (`.png`)**:
   - High-resolution visual render showing the exact aesthetic composition, lighting, contrast, and layout.
   - Generated using visual UI image generation (always rendering the raw interface canvas without surrounding laptop/phone device frames).
2. **Interactive Standalone HTML/CSS Prototype (`.html`)**:
   - Responsive, self-contained HTML/CSS prototype adhering to modern frontend best practices.
   - Accurately applies design tokens (colors, typography, spacing, shadows) and supports interactive hover, active, focus, and state transitions.
   - Can be previewed directly in an Antigravity browser preview or standalone browser.
3. **Hi-Fi Visual Design Spec Sheet (`.md`)**:
   - Detailed component dimensions, token mappings, typography specs, spacing measurements, and asset callouts for seamless engineering handoff.

---

## Core Workflow

```
[Ingest Wireframes & Design Tokens]
                │
                ▼
[1. Generate Pixel-Perfect Visual Mockup (.png)]
                │
                ▼
[2. Build Interactive HTML/CSS Prototype (.html)]
                │
                ▼
[3. Compile Visual Design Spec Sheet (.md)]
                │
                ▼
      [HALT FOR USER FEEDBACK] ──(Iterate on Feedback)──┐
                │                                       │
                ▼ (On Explicit Approval)                │
[Save Deliverables to artifacts/visual-designs/] <──────┘
```

### Step 1: Ingest Inputs
- Read the approved wireframe blueprint from `artifacts/wireframes-and-flows/`.
- Read the design tokens (colors, typography, spacing, shadows) from `artifacts/design-systems/`.

### Step 2: Generate High-Resolution Visual Mockup (`.png`)
When generating UI mockup images:
- **Aspect Ratio**: Match target form factor (`9:16` for mobile screens, `16:9` or `3:2` for desktop/tablet dashboards).
- **Prompting Guidelines**:
  - Focus strictly on the interface itself: clean, modern UI design, crisp typography, realistic data, high contrast, clean white/slate background.
  - **Never generate fake hardware bezels, laptop mockups, or hands holding phones** unless explicitly requested.
  - Name the file following convention: `artifacts/visual-designs/<initiative-name>-mockup.png`.

### Step 3: Build Interactive HTML/CSS Prototype (`.html`)
Construct a clean, responsive, single-file HTML/CSS document:
- Use semantic HTML5 elements (`<header>`, `<main>`, `<nav>`, `<article>`, `<button>`).
- Define CSS custom properties matching the design tokens (`--color-primary`, `--space-4`, etc.).
- Implement realistic component states (smooth CSS transitions, `:hover`, `:focus-visible`, `:active`).
- Ensure mobile-first responsiveness with media queries or fluid container units.
- Save to `artifacts/visual-designs/<initiative-name>-mockup.html`.

### Step 4: Compile Visual Design Spec Sheet (`.md`)
Document exact developer handoff values:
- CSS token mappings for every UI component.
- Padding, margin, and gap measurements on the 8pt grid.
- Exact typography styles (`font-size`, `font-weight`, `line-height`).
- Save to `artifacts/visual-designs/<initiative-name>-visual-spec.md`.

---

## Interactive Rule: Halt for Feedback

Before committing final deliverables to `artifacts/visual-designs/`:
1. Present the visual preview, design token application, and HTML/CSS structure to the user.
2. Solicit critique: *"How does this high-fidelity visual composition feel? Are the contrast, visual hierarchy, and component treatments aligned with your brand expectations?"*
3. **Wait for user feedback and approval** before finalizing the files.

---

## Detailed References & Examples
- Deep-dive guide: [references/visual_design_guidelines.md](./references/visual_design_guidelines.md)
- Complete concrete example: [examples/sample_hifi_mockup.html](./examples/sample_hifi_mockup.html)
