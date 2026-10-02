# Design System Architecture Reference Guide

This reference provides technical guidance on design token nomenclature, WCAG color accessibility calculations, and atomic state design.

---

## 1. Token Taxonomy & Naming Conventions

Follow the standard three-tier token architecture:
1. **Global / Primitive Tokens**: Raw, context-agnostic values.
   - Example: `color-blue-600: #2563EB`, `spacing-16: 16px`, `font-inter: 'Inter', sans-serif`.
2. **Semantic / Contextual Tokens**: Describe intended role or purpose.
   - Example: `color-primary: var(--color-blue-600)`, `surface-card: var(--color-white)`, `text-secondary: var(--color-gray-500)`.
3. **Component-Specific Tokens**: Scoped to individual components for granular overrides.
   - Example: `button-primary-bg: var(--color-primary)`, `button-primary-hover-bg: var(--color-blue-700)`.

---

## 2. Accessibility & Contrast Calculation (WCAG 2.1)

Relative luminance formula dictates contrast ratio:
\[
\text{Ratio} = \frac{L_1 + 0.05}{L_2 + 0.05}
\]
where \(L_1\) is the relative luminance of the lighter color and \(L_2\) is the darker color.

### Compliance Thresholds
- **WCAG Level AA (Minimum)**:
  - Normal text (< 18pt or < 14pt bold): **4.5:1**
  - Large text (≥ 18pt or ≥ 14pt bold): **3.0:1**
  - UI components and graphical objects: **3.0:1**
- **WCAG Level AAA (Enhanced)**:
  - Normal text: **7.0:1**
  - Large text: **4.5:1**

*Never rely on color alone to convey meaning (e.g., pair red error borders with error icons and clear text).*

---

## 3. Typography Rhythm: Modular Scale

A modular scale creates harmonious proportional hierarchy. Common scales:
- **Major Second (1.125)**: Compact web applications with dense information tables.
- **Minor Third (1.200)**: Balanced enterprise dashboards.
- **Major Third (1.250)**: Standard SaaS apps and marketing sites.

```text
Display:     2.441rem (~39px) | Line-height: 1.20 | Weight: 700
Heading 1:   1.953rem (~31px) | Line-height: 1.25 | Weight: 700
Heading 2:   1.563rem (~25px) | Line-height: 1.30 | Weight: 600
Heading 3:   1.250rem (~20px) | Line-height: 1.35 | Weight: 600
Body Base:   1.000rem (16px)  | Line-height: 1.50 | Weight: 400 / 500
Caption:     0.800rem (~13px) | Line-height: 1.40 | Weight: 400
```
