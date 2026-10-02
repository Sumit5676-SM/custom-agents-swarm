# User Journey Mapping Reference Guide

This guide provides foundational UX principles for mapping customer journeys, empathy states, and multi-channel touchpoints.

---

## 1. Principles of Effective Journey Mapping

1. **Grounded in Validated User Scope**:
   - Always anchor the journey map in the user steps and MVP release slices defined in `artifacts/story-maps/`. Journey mapping is about deepening our empathy for *how* users experience those steps.
2. **Action vs Thought vs Feeling**:
   - *Actions* are observable behaviors (what the user clicked, typed, or did).
   - *Thoughts* are the internal monologue (doubts, questions, mental models).
   - *Feelings* reflect the emotional state (frustration, confidence, relief).
   - A great journey map highlights the gap between what users *have* to do and what they *wish* they could do.
3. **The "Moments of Truth"**:
   - Identify the 1 or 2 critical moments in the journey where customer perception is made or broken (e.g., the moment a receipt is snapped and the system instantly recognizes the merchant, vs when OCR fails and asks the user to manually re-type everything).

---

## 2. Emotional Arc Scoring Framework

Quantify the emotional trajectory across stages on a 5-point scale:
- `+2`: Delighted / Empowered (unexpected speed, seamless automation, clear feedback)
- `+1`: Confident / Satisfied (intuitive flow, effortless task execution)
- ` 0`: Neutral / Functional (standard cognitive effort)
- `-1`: Hesitant / Mildly Anxious (unclear labels, ambiguous next step)
- `-2`: Frustrated / Blocked (error messages, lost progress, excessive manual entry)

Visualizing the emotional dip helps engineers, designers, and PMs prioritize where UI polish matters most.

---

## 3. FigJam & Miro Import Guidelines

- Provide CSV columns: `Phase`, `Dimension`, `Content`, `SentimentScore`, `Notes`.
- Recommended sticky note color coding for boards:
  - **Phases / Headers**: Navy Blue / Dark Purple
  - **User Actions**: Light Blue
  - **Thoughts & Mental Models**: Light Yellow
  - **Touchpoints**: Grey / Slate
  - **Pain Points**: Soft Red / Coral
  - **Design Opportunities**: Vibrant Green
