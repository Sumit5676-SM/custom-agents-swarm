---
name: design-system-spec
description: Guide for creating robust, accessible, and scalable Design Systems. Use when establishing design tokens (colors, WCAG contrast, modular typography, 8pt/4pt spacing, elevation shadows, iconography), atomic component architectures (atoms, molecules, organisms), and exhaustive interaction states.
---

# Design System Specification

A design system establishes a single source of truth for visual language, interactive behavior, and component architecture. It bridges design and engineering through structured design tokens and reusable atomic components.

---

## Core Workflow

```
[Design Tokens: Colors, Typography, Spacing, Icons] ──> [Atomic Components & 7 Interaction States]
                                                                      │
                                                                      ▼
             [Halt for User Feedback] <── [Verify WCAG 2.1 AA/AAA Contrast]
                         │
                         ▼ (On Approval)
   [Save to artifacts/design-systems/<initiative>-design-system.md]
```

### Step 1: Design Token Foundations

1. **Color Tokens & Contrast Verification**:
   - Organize colors into semantic tiers:
     - `brand`: Primary and secondary brand accents.
     - `neutral`: Slate/gray scales for text, backgrounds, and borders.
     - `feedback`: Success, Warning, Error, and Info palettes.
     - `surface`: Background elevations (page background, card surface, modal overlay).
   - **Accessibility Requirement**:
     - Body copy against background must meet **minimum 4.5:1** contrast ratio (WCAG AA).
     - Large text (18pt+ or 14pt bold) and active UI controls/borders must meet **minimum 3:0:1** contrast ratio.
     - Provide Dark Mode paired tokens where applicable.

2. **Typography Scale**:
   - Establish a modular type scale (e.g., 1.25 Major Third or 1.20 Minor Third).
   - Define exact parameters: `font-family`, `font-size` (rem/px), `font-weight`, `line-height` (relative unitless or rem), and `letter-spacing`.
   - Hierarchy: Display, Heading 1–4, Body Large/Default/Small, Caption/Overline, Monospace (data/code).

3. **Spatial Grid & Elevation Tokens**:
   - Strict **8pt / 4pt grid system**:
     - `space-1` (4px), `space-2` (8px), `space-3` (12px), `space-4` (16px), `space-6` (24px), `space-8` (32px), `space-12` (48px), `space-16` (64px).
   - Elevation shadows: `elevation-0` (flat), `elevation-1` (cards/dropdowns), `elevation-2` (popovers), `elevation-3` (modals/dialogs).
   - Border radius tokens: `radius-sm` (4px), `radius-md` (8px), `radius-lg` (12px), `radius-full` (9999px).

4. **Iconography Rules**:
   - Standard 24×24px bounding box (with 20×20px active live area).
   - Uniform 2px stroke width or consistent filled silhouette.
   - Optical centering for asymmetric icons (play buttons, arrows).
   - Paired with descriptive `aria-label` or marked `aria-hidden="true"` when accompanied by text.

---

### Step 2: Atomic Component Architecture & States

Organize components using Atomic Design:
- **Atoms**: Primitive building blocks (Button, Input field, Checkbox, Badge, Avatar, Spinner).
- **Molecules**: Compound combinations of atoms (Search input with clear button, Form field group with label & error text, Card header).
- **Organisms**: Complex interface assemblies (Top Navigation Bar, Data Table with pagination, Receipt Scan Modal).

#### The 7 Mandatory Interaction States
Every interactive component specification must explicitly detail how it renders across all 7 states:
1. **Default**: Base resting state.
2. **Hover**: Cursor hover (visual elevation or background tint change).
3. **Focused**: Keyboard focus indicator (mandatory high-contrast 2px focus ring; never `outline: none` without replacement).
4. **Active / Pressed**: Tap or mouse click-down state (scale down or darker tint).
5. **Disabled**: Inactive state (reduced opacity, cursor not-allowed, removed pointer events).
6. **Loading / Skeleton**: In-progress asynchronous state (spinner, pulse skeleton loader, disabled interactions).
7. **Error**: Invalid validation state (red border, alert icon, descriptive assistive error message).

---

## Interactive Rule: Halt for Feedback

Before committing the design system specification:
1. Present the color tokens, contrast ratios, type scale, and core component states to the user.
2. Ask for feedback: *"Do these brand colors, contrast levels, and component states match your design vision and platform requirements?"*
3. **Wait for user feedback and approval** before saving into `artifacts/design-systems/<initiative-name>-design-system.md`.

---

## Detailed References & Examples
- Deep-dive guide: [references/design_system_guide.md](./references/design_system_guide.md)
- Complete concrete example: [examples/sample_design_system.md](./examples/sample_design_system.md)
