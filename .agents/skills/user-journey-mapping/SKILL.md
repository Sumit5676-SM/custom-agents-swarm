---
name: user-journey-mapping
description: Guide for creating comprehensive User Journey Maps, empathy paths, and task flows. Use when visualizing user emotional curves, touchpoints, cognitive friction, and transitions based on story maps, and generating FigJam/Miro importable journey maps.
---

# User Journey Mapping

User journey maps visualize the step-by-step experience an individual goes through to achieve a specific goal. They synthesize qualitative insights, emotional highs and lows, and operational touchpoints across channels.

---

## Core Workflow

```
[Inspect artifacts/story-maps/] ──> [Define Persona & Scenario] ──> [Map Chronological Stages]
                                                                             │
                                                                             ▼
[Halt for Feedback] <── [Format for FigJam / Miro] <── [Detail Actions, Thoughts, Feelings & Touchpoints]
        │
        ▼ (On Approval)
[Save to artifacts/journey-maps/]
```

### Step 1: Ingest Scope from Story Map
- **Inspect `artifacts/story-maps/` first** to ground the journey map in the approved Backbone activities, sequential user steps, and MVP release slice.
- Identify the target user persona and their primary objective for the journey.

### Step 2: Establish Journey Phases (Chronological Columns)
Organize the journey into 4–6 clear chronological phases (e.g., *Awareness / Initiation*, *First-Time Setup*, *Active Task Completion*, *Error / Edge-Case Handling*, *Resolution / Confirmation*).

### Step 3: Populate Experience Dimensions (Rows)
For each journey phase, map out:
1. **User Actions**: What physical or digital steps does the user perform?
2. **User Thoughts & Expectations**: What is the user asking themselves? What assumptions do they carry?
3. **Touchpoints & Context**: Devices, UI surfaces, notifications, physical environment, or secondary tools involved.
4. **Emotional Arc & Experience Level**:
   - `+` (Delighted / Relieved / Confident)
   - `~` (Neutral / Focused)
   - `-` (Anxious / Confused / Frustrated)
5. **Pain Points & Friction**: Where does the experience stutter, introduce anxiety, or demand excessive effort?
6. **Design Opportunities**: How can interaction design, smart defaults, or visual clarity solve this friction?

### Step 4: Output Formats

Always present the Journey Map in two complementary formats:

#### 1. Visual Markdown Journey Matrix & Mermaid Diagram
A structured markdown table detailing the phases and rows, accompanied by a Mermaid `journey` chart visualizing the emotional score.

#### 2. FigJam & Miro Importable CSV
A copy-pasteable table that users can paste directly onto a FigJam or Miro canvas to generate color-coded sticky notes:

```csv
Phase,Dimension,Content,SentimentScore,Notes
"1. Initiate Report","User Action","Opens mobile app after dinner on business trip","0","Starting trigger"
"1. Initiate Report","User Thought","'I hope this doesn't take 20 minutes to fill out'","-1","Anticipatory anxiety"
"1. Initiate Report","Touchpoint","iOS / Android Native App","0","Mobile context"
"1. Initiate Report","Pain Point","Remembering password after 60 days of inactivity","-2","Friction point"
"1. Initiate Report","Design Opportunity","Enable biometric (FaceID) unlock on repeat app launches","+2","UX improvement"
```

---

## Interactive Rule: Halt for Feedback

Before committing the file to disk:
1. Present the draft journey map and highlight the critical friction areas and proposed design opportunities.
2. Ask the user for their critique: *"Does this emotional arc capture the user's real-world frustrations? Are there additional touchpoints or edge cases we should account for?"*
3. **Wait for user feedback and approval** before saving into `artifacts/journey-maps/<initiative-name>-journey-map.md`.

---

## Detailed References & Examples
- Deep-dive guide: [references/journey_mapping_guide.md](./references/journey_mapping_guide.md)
- Complete concrete example: [examples/sample_journey_map.md](./examples/sample_journey_map.md)
