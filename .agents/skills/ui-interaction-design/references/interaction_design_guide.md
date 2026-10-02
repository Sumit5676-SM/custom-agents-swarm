# Interaction Design & Layout Principles Reference Guide

This reference outlines interaction design heuristics, visual hierarchy laws, responsive container mechanics, and motion choreography.

---

## 1. Core Laws of UX & Interaction Design

1. **Fitts's Law**:
   - The time to acquire a target is a function of the distance to and size of the target.
   - *Design Application*: Make primary mobile touch targets at least **48×48px** (or 44×44pt on iOS) and place primary actions within the natural thumb zone (bottom 1/3 of the screen).
2. **Hick's Law**:
   - The time it takes to make a decision increases logarithmically with the number and complexity of choices.
   - *Design Application*: Use progressive disclosure to reveal secondary actions or advanced filters only when needed.
3. **Jakob's Law**:
   - Users spend most of their time on other sites. They expect your site or app to work the same way as all the other apps they know.
   - *Design Application*: Maintain conventional positions for back buttons, navigation tabs, search inputs, and modal close triggers.
4. **Miller's Law & Chunking**:
   - The average person can only keep 7 (plus or minus 2) items in their working memory.
   - *Design Application*: Group complex forms into distinct visual cards or multi-step wizards with clear step indicators.

---

## 2. Responsive Container & Adaptive Layout Mechanics

- **Fluid Containers**: Prefer `minmax()` and `clamp()` for scalable typography and layout bounds rather than hardcoded fixed widths.
- **Adaptive Touch vs Hover Modes**:
  - Touch interfaces require explicit tap targets and cannot rely on hover tooltips for critical info.
  - Always provide persistent icon labels or tapped bottom sheets on touch devices.

---

## 3. Motion Choreography & Transition Principles

When transitioning between screens or opening overlays:
- **Spatial Consistency**: If an element opens from the bottom (e.g., mobile action sheet), it must swipe down to close. If an element expands from a thumbnail card, it should morph back into the card on dismissal.
- **Choreographed Staggering**: When presenting lists of items (e.g., search results), stagger child animations by 30ms–50ms to create organic visual flow without delaying total load perception.
- **Zero Latency Feedback**: Touch/click triggers must reflect the pressed state in **0ms** (active state tint); asynchronous network spinup follows immediately if response exceeds 150ms.
