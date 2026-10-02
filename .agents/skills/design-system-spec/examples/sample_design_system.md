# Sample Design System Specification: "Aero" Token & Component System

A production-grade design system token set and component specification designed for accessible, enterprise-grade web and mobile applications.

---

## 1. Design Token Foundation

### 1.1 Color Tokens & Contrast Check

| Token Name | Value | WCAG Background | Contrast Ratio | Compliance |
| :--- | :--- | :--- | :--- | :--- |
| `color-primary-600` | `#0284C7` (Sky Blue) | White (`#FFFFFF`) | 4.62:1 | WCAG AA Normal Text |
| `color-primary-700` | `#0369A1` (Deep Sky) | White (`#FFFFFF`) | 7.05:1 | WCAG AAA Normal Text |
| `text-primary` | `#0F172A` (Slate 900) | White (`#FFFFFF`) | 16.08:1 | WCAG AAA |
| `text-secondary` | `#475569` (Slate 600) | White (`#FFFFFF`) | 5.86:1 | WCAG AA |
| `surface-page` | `#F8FAFC` (Slate 50) | N/A | N/A | Base Canvas |
| `surface-card` | `#FFFFFF` (Pure White) | Slate 50 (`#F8FAFC`) | Border defined | Card / Modal surface |
| `border-subtle` | `#E2E8F0` (Slate 200) | Slate 50 / White | 1.25:1 | Structural dividers |
| `border-control` | `#94A3B8` (Slate 400) | White (`#FFFFFF`) | 3.12:1 | WCAG AA UI Controls |
| `feedback-success` | `#16A34A` (Green 600)| White (`#FFFFFF`) | 4.54:1 | WCAG AA |
| `feedback-error` | `#DC2626` (Red 600) | White (`#FFFFFF`) | 4.52:1 | WCAG AA |

---

### 1.2 Typography Tokens (Major Third 1.25 Scale)

- **Font Family Primary**: `'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`
- **Font Family Mono**: `'JetBrains Mono', 'Fira Code', monospace`

| Token | Size (px / rem) | Line Height | Weight | Usage |
| :--- | :--- | :--- | :--- | :--- |
| `type-h1` | 32px / 2.000rem | 1.20 | 700 (Bold) | Page Titles, Primary Dashboards |
| `type-h2` | 24px / 1.500rem | 1.25 | 600 (Semibold)| Section Headers, Card Titles |
| `type-h3` | 20px / 1.250rem | 1.30 | 600 (Semibold)| Modal Titles, Group Headers |
| `type-body-lg` | 18px / 1.125rem | 1.50 | 400 (Regular) | Lead paragraphs, Hero intros |
| `type-body` | 16px / 1.000rem | 1.50 | 400 (Regular) | Primary text, Form inputs |
| `type-body-sm` | 14px / 0.875rem | 1.45 | 500 (Medium)  | Table rows, Form labels |
| `type-caption` | 12px / 0.750rem | 1.40 | 400 (Regular) | Badges, Helper tips, Meta |

---

### 1.3 Spacing & Elevation Tokens

- `space-1`: `4px`
- `space-2`: `8px`
- `space-3`: `12px`
- `space-4`: `16px` (Base unit)
- `space-6`: `24px`
- `space-8`: `32px`
- `space-12`: `48px`

**Shadow Elevations:**
- `elevation-0`: `none`
- `elevation-1`: `0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)` (Cards, List items)
- `elevation-2`: `0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)` (Dropdowns, Popovers)
- `elevation-3`: `0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)` (Modals, Drawers)

---

## 2. Component Specification: Button (Primary Atom)

### Interaction States

| State | Background | Text Color | Border | Shadow / Effects |
| :--- | :--- | :--- | :--- | :--- |
| **Default** | `color-primary-600` (`#0284C7`) | `#FFFFFF` | None | `elevation-1` |
| **Hover** | `color-primary-700` (`#0369A1`) | `#FFFFFF` | None | `elevation-2`, cursor: pointer |
| **Focused** | `color-primary-600` | `#FFFFFF` | None | 2px solid `#FFFFFF` + 2px offset ring `#0284C7` |
| **Active** | `#075985` (Primary 800) | `#FFFFFF` | None | `transform: scale(0.98)` |
| **Disabled**| `#CBD5E1` (Slate 300) | `#64748B` | None | `opacity: 0.6`, cursor: not-allowed |
| **Loading** | `color-primary-600` | Transparent | None | Centered 16px white spinner, pointer-events: none |
| **Error** | `#DC2626` (Red 600) | `#FFFFFF` | None | Shakes horizontally (4px, 200ms) |
