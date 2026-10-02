# Sample Screen Blueprint & Interaction Spec: Mobile Expense Receipt Capture

**Feature**: Mobile Receipt Capture & Expense Summary  
**Scope Grounding**: [sample_story_map.md](file:///Users/sumeetmehta/Projects/custom-agents-swarm/artifacts/story-maps/sample_story_map.md) (MVP Slice: Snap photo -> OCR auto-fill -> Select category -> Submit)  
**Target Device**: Mobile (iOS / Android 390px base width) with Desktop responsive expansion.

---

## 1. Mobile Screen Blueprint (`390px` viewport)

```text
+-------------------------------------------------------------+
|  [< Back]               Expense Details             [Close] | [1]
+-------------------------------------------------------------+
|                                                             |
|  +-------------------------------------------------------+  |
|  |                    RECEIPT PREVIEW                    |  |
|  |                                                       |  | [2]
|  |          [  High-Res Scanned Receipt Image  ]         |  |
|  |                                                       |  |
|  |      [Retake Photo]               [Rotate Image]      |  |
|  +-------------------------------------------------------+  |
|                                                             |
|  TRANSACTION DETAILS (OCR Auto-Extracted)                   |
|                                                             |
|  Merchant Name *                                            |
|  +-------------------------------------------------------+  |
|  | Giotto's Italian Bistro                      [Check]  |  | [3]
|  +-------------------------------------------------------+  |
|                                                             |
|  Transaction Date *          Total Amount ($ USD) *         |
|  +------------------------+  +---------------------------+  |
|  | Oct 14, 2026           |  | $ 145.20                  |  | [4]
|  +------------------------+  +---------------------------+  |
|                                                             |
|  Expense Category *                                         |
|  +-------------------------------------------------------+  |
|  | Meals & Entertainment                         [ v ]   |  | [5]
|  +-------------------------------------------------------+  |
|  (i) Business lunch or dinner with clients / prospects       |
|                                                             |
|  Attendees (Required for Entertainment)                     |
|  +-------------------------------------------------------+  |
|  | Sarah Jenkins (Acme Corp), David Chen                 |  | [6]
|  +-------------------------------------------------------+  |
|                                                             |
|  +-------------------------------------------------------+  |
|  | [ SAVE & ATTACH TO EXPENSE REPORT ]                   |  | [7]
|  +-------------------------------------------------------+  |
+-------------------------------------------------------------+
```

---

## 2. Interaction & Visual Hierarchy Callouts

1. **[1] Top Navigation Bar**:
   - `44px` height, sticky at top. Back button returns to report overview without losing photo; confirmation prompt if unsaved form fields are dirty.
2. **[2] Receipt Preview Card**:
   - Aspect ratio `4:3` with pinch-to-zoom modal trigger on tap. Quick action chips for *"Retake"* (re-launches camera) and *"Rotate"* (rotates 90 deg clockwise with `200ms ease-out` transition).
3. **[3] Merchant Name Input**:
   - Green checkmark icon confirms OCR high-confidence match (>95%). Tapping input field enables full manual editing.
4. **[4] Two-Column Numeric Inputs (Date & Amount)**:
   - Sits on 2-column mobile layout. Amount input triggers numeric keypad (`inputmode="decimal"`) with auto-currency formatting.
5. **[5] Expense Category Dropdown (Smart Default)**:
   - Auto-selected by merchant category code. Helper icon shows tax explanation in a contextual floating popover (`elevation-2`).
6. **[6] Conditional Attendees Field**:
   - Dynamically slides into view (`200ms ease-out`) only when *"Meals & Entertainment"* is chosen. Disappears when standard categories like *"Parking"* are chosen.
7. **[7] Primary Sticky CTA Button**:
   - Full width, `52px` height, `color-primary-600` background.
   - Pinned at bottom of viewport above home indicator.
   - Tap state: scales to `0.98` with immediate haptic tap feedback. Transitions to loading spinner on save.

---

## 3. Desktop Responsive Adaptation (`>1024px`)

On desktop/laptop screens:
- Screen converts from single-column vertical stack into a **dual-pane side-by-side workspace** (12-column grid):
  - **Left Pane (5 columns)**: Zoomable, pan-enabled PDF/Image document viewer with rotation controls.
  - **Right Pane (7 columns)**: Structured form with 2-column input fields, category selector, audit flags, and approval workflow history.
