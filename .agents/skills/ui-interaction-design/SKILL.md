---
name: ui-interaction-design
description: Guide for creating responsive UI layouts, visual hierarchy, motion principles, and screen wireframe specifications. Use when designing mobile/desktop grid layouts, defining micro-interactions and transitions, structuring screen wireframes, and detailing interaction callouts.
---

# UI & Interaction Design Specification

This skill guides the creation of responsive user interfaces, structural wireframes, visual hierarchy, and interaction mechanics. It ensures that layouts adapt gracefully across screen sizes while providing smooth, accessible feedback loops.

---

## Core Workflow

```
[Determine Screen Context & Scope] ──> [Structure Visual Hierarchy & Grid Layout]
                                                       │
                                                       ▼
[Halt for User Feedback] <── [Define Motion Timings & Micro-Interactions]
           │
           ▼ (On Approval)
[Save to artifacts/wireframes-and-flows/<initiative>-wireframes.md]
```

### Step 1: Establish Visual Hierarchy & Scanning Patterns
- **F-Pattern (Content-Heavy / Lists)**: Top horizontal banner, secondary horizontal scan, followed by vertical left-edge skimming (used for report lists, data tables, feeds).
- **Z-Pattern (Landing Pages / Dashboards)**: Top left (logo/context) across to top right (primary action/profile), diagonally down to bottom left, across to bottom right (conversion call-to-action).
- **Optical Weight**: Ensure primary actions (e.g., *"Submit"*, *"Capture"*) possess dominant visual weight compared to secondary or destructive actions (*"Cancel"*, *"Delete"*).

---

### Step 2: Responsive & Adaptive Grid System

Design across standard breakpoints using fluid layout containers:

| Breakpoint | Target Screen | Columns | Margin | Gutter | Container Behavior |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Mobile (`<640px`)** | iPhone / Android Phone | 4 | 16px | 12px | Full width, vertical single-column stack |
| **Tablet (`640px–1024px`)** | iPad / Tablets | 8 | 24px | 16px | 2-column split (master-detail / dual pane) |
| **Desktop (`>1024px`)** | Laptop / External Monitor | 12 | 32px | 24px | Max-width 1280px, multi-column workspace |

---

### Step 3: Motion Principles & Micro-Interactions

Motion must be functional, subtle, and meaningful—never gratuitous or disorienting.

1. **Duration Standards**:
   - *Micro-interactions (icon morphs, button clicks)*: **100ms – 150ms**
   - *Element transitions (dropdowns, tooltips, toasts)*: **150ms – 250ms**
   - *Structural transitions (modals, slide-in sheets, page reflows)*: **250ms – 350ms**
   - *Never exceed 400ms* (feels sluggish and impedes power users).

2. **Easing Curves**:
   - **Enter (Ease-out)**: `cubic-bezier(0.0, 0.0, 0.2, 1)` — Elements enter briskly and decelerate into resting position.
   - **Exit (Ease-in)**: `cubic-bezier(0.4, 0.0, 1, 1)` — Elements accelerate off-screen quickly.
   - **State Morph (Ease-in-out)**: `cubic-bezier(0.4, 0.0, 0.2, 1)` — Smooth acceleration and deceleration for expanding cards or accordions.

3. **Motion Accessibility**:
   - Always declare a `@media (prefers-reduced-motion: reduce)` fallback replacing sliding or scale animations with a subtle instant opacity fade.

---

### Step 4: Screen Wireframe Blueprint Format

Present screen specifications using structured ASCII / Markdown layout boxes paired with numbered callout annotations:

```text
+-------------------------------------------------------------+
| [Header] < Chicago Q3 Trip Report                 (Status)  | [1]
+-------------------------------------------------------------+
|                                                             |
|  Total Reimbursement:  $432.50                              | [2]
|  2 of 3 Receipts Attached                                   |
|                                                             |
|  +-------------------------------------------------------+  |
|  | [Camera Icon]  SNAP NEW RECEIPT                       |  | [3]
|  +-------------------------------------------------------+  |
|                                                             |
|  RECEIPT LIST                                               |
|  +-------------------------------------------------------+  |
|  | [IMG] Dinner with Client (Giotto's)         $145.20   |  | [4]
|  |       Meals & Entertainment  •  Approved             |  |
|  +-------------------------------------------------------+  |
|  | [IMG] Taxi to O'Hare Airport                 $48.30   |  |
|  |       Travel / Rideshare     •  Pending Review       |  |
|  +-------------------------------------------------------+  |
|                                                             |
|  +-------------------------------------------------------+  |
|  | [ SUBMIT EXPENSE REPORT TO MANAGER ]                  |  | [5]
|  +-------------------------------------------------------+  |
+-------------------------------------------------------------+
```

---

## Interactive Rule: Halt for Feedback

Before committing the screen wireframe specification to disk:
1. Present the wireframe blueprint, responsive layout rules, and interaction annotations to the user.
2. Ask for feedback: *"Does this visual hierarchy and layout flow feel clear? Would you like any adjustments to the responsive behavior or interaction transitions?"*
3. **Wait for user feedback and approval** before saving into `artifacts/wireframes-and-flows/<initiative-name>-wireframes.md`.

---

## Detailed References & Examples
- Deep-dive guide: [references/interaction_design_guide.md](./references/interaction_design_guide.md)
- Complete concrete example: [examples/sample_screen_spec.md](./examples/sample_screen_spec.md)
