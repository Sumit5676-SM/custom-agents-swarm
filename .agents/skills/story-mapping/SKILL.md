---
name: story-mapping
description: Guide for creating Two-Dimensional User Story Maps based on Mike Cohn and Jeff Patton's framework. Use when breaking down high-level objectives into narrative sequences (horizontal backbone), mapping alternatives and variations (vertical dimension), conducting discovery walkthroughs, slicing releases (MVP / walking skeleton), and generating FigJam/Miro importable story maps.
---

# Two-Dimensional User Story Mapping

Story maps provide a two-dimensional visual representation of a user's journey to accomplish a goal. They prevent flat backlog clutter, create a shared understanding of how features connect, and enable clear release slicing.

---

## Core Dimensions of a Story Map

A story map is organized along two perpendicular axes:

```
           HORIZONTAL: Narrative Flow (Across, Left-to-Right)
                  "Step 1"  ──then──>  "Step 2"  ──then──>  "Step 3"
       ┌─────────────────────────────────────────────────────────────┐
       │ [BACKBONE: High-level Activity 1] | [Activity 2] | [Activity 3] │
       └─────────────────────────────────────────────────────────────┘
  V    │ User Step 1.1                     | User Step 2.1| User Step 3.1│
  E    ├─────────────────────────────────────────────────────────────┤ ◄── [MVP Release Slice]
  R  O │ Alternative 1.2                   | Alt 2.2      | Alt 3.2      │
  T  R ├─────────────────────────────────────────────────────────────┤ ◄── [Release 2 Slice]
  I    │ Alternative 1.3                   | Alt 2.3      | Alt 3.3      │
  C    └─────────────────────────────────────────────────────────────┘
  A    VERTICAL: Alternatives & Variations (Down, Top-to-Bottom)
  L    Read as "OR" — Prioritized from essential/simple down to optional/advanced
```

1. **Horizontal Dimension (Across, Left-to-Right)**:
   - Represents a sequence of user tasks.
   - Read by inserting the word **"THEN"** between cards (*"User does Step 1, then Step 2, then Step 3"*).
   - **The Backbone (Top Row)**: Activities or thematic areas that act like highway signs telling you what part of the system you are in (e.g., *"Log In"*, *"Create Report"*, *"Enter Expenses"*, *"Submit for Review"*).
   - Underneath activities sit the sequential user steps, written as short **3–4 word phrases** (e.g., *"Upload photo"*, *"Verify total"*, *"Choose currency"*).

2. **Vertical Dimension (Down, Top-to-Bottom)**:
   - Represents **alternatives**, variations, and details for performing each step.
   - Read by inserting the word **"OR"** when reading down a column (*"User creates a blank report, OR duplicates a recent report"*).
   - Arranged in **descending order of priority**: the most critical, basic path at the top, and advanced, edge-case, or optional paths lower down.

---

## The Story Mapping Workflow

### Step 1: Anchor on a Significant Objective or MVP
- Focus the story map on a single significant objective or MVP that can be achieved in a tangible timeframe (typically ~3 months).
- Avoid trying to map the entire universe of the company in one map; keep the scope tightly bounded to the objective.

### Step 2: Lay Out the Backbone & Steps Horizontally
- Lead a collaborative flow of the chronological steps a user takes from beginning to end.
- Use short, concise phrases on cards to keep mapping fast and fluid.

### Step 3: Flesh Out the Vertical Dimension (Alternatives & Options)
- For each step, brainstorm alternative methods, error recoveries, or different user preferences.
- Stack alternatives vertically in rough priority order.

### Step 4: Conversational Discovery Walkthrough
Walk through the map from the end-user's perspective with open curiosity. Explore questions conversationally rather than treating them as rigid checklists:
- What would the user naturally want to do next?
- Where might someone get confused, trip up, or make a mistake?
- Are there alternate user paths or edge cases we missed?
- What extra context or information does the user need at each step?

### Step 5: Keep Maps Lean with Submaps
- If a portion of the map becomes overly wide or deeply complex, treat that card as a **submap**.
- Mentally "double-click" the card to create a nested 2D map for that specific sub-activity.

### Step 6: Slice into Releases (Roadmap)
- Draw horizontal lines across the map to define release boundaries:
  - **Slice 1 (MVP / Walking Skeleton)**: The thinnest end-to-end slice across all backbone activities that allows a user to achieve the core goal.
  - **Slice 2 (Next Enhancement)**: The next priority layer of convenience, automation, or alternatives.
  - **Slice 3 (Future / Later)**: Edge cases, advanced integrations, or delight features.

---

## Output Format: Ready for FigJam & Miro

Always present the Story Map in two complementary formats:

### 1. Visual 2D Matrix (Markdown Table)
Columns represent sequential steps; rows represent the Backbone, MVP release slice, and subsequent release slices.

### 2. FigJam & Miro Importable CSV
Provide a copy-pasteable CSV block that users can paste directly onto a FigJam or Miro canvas to generate colored sticky notes grouped by activity and release:

```csv
RowType,BackboneActivity,StepName,ReleaseSlice,PriorityOrder,Notes
Backbone,"Authentication","Log In","Backbone",0,"Top row highway sign"
Step,"Authentication","Enter email & password","Slice 1 (MVP)",1,"Basic email login"
Alternative,"Authentication","Sign in with Google SSO","Slice 2",2,"Social / Enterprise SSO"
Backbone,"Report Creation","Create Expense Report","Backbone",0,"Top row highway sign"
Step,"Report Creation","Start blank report","Slice 1 (MVP)",1,"Default manual creation"
Alternative,"Report Creation","Duplicate past report","Slice 2",2,"Clone previous trip"
```

---

## Interactive Rule: Pause for Alignment

Before proceeding to write detailed user stories:
1. Review the proposed story map and release slicing with the user.
2. Ask if the MVP slice feels truly viable as a walking skeleton, or if any critical steps/alternatives are missing.
3. **Wait for user feedback and approval** before generating user story specifications.

---

## Artifact Persistence

When finalizing the Story Map for a project initiative, save the deliverable (including visual matrix and FigJam/Miro CSV) to:
- `artifacts/story-maps/<initiative-name>-story-map.md`

---

## Detailed References & Examples
- Deep-dive guide: [references/story_mapping_guide.md](./references/story_mapping_guide.md)
- Complete concrete example: [examples/sample_story_map.md](./examples/sample_story_map.md)

## Visual Diagram Standards (FigJam & Miro-Compatible Mermaid)
When generating visual Mermaid diagrams:
1. Zero HTML tags: NEVER use <b>, <i>, <u>, or <br> inside Mermaid node labels.
2. Line Breaks: Use \n for line breaks inside double-quoted string labels.
4. Node Delimiters: Keep Mermaid node labe4. Node Delimiters: Keep Mermaid node labe4. Node DelimitersReference ~/.gemini/config/scripts/figjam_me4. Node Delimiters: Keep Mermaid node labe4. Node Delimiters: Keep Merp ~/.gemin4. Node Delimiters: Keep Mermaid node labe4. Node Delimite~/.gemini/config/scripts3. Unicode Styling: Use Unicode Mathem3. Unicode Styling: Use Unicode Mathem3. Unicode  Italic (

# 3. Copy skills and agents globally
cp -R .agents/agents/* ~/.gemini/config/agents/
cp -R .agents/skills/* ~/.gemini/config/skills/

# 4. Create the global formatter script
cat << 'EOF' > ~/.gemini/config/scripts/figjam_mermaid_formatter.py
#!/usr/bin/env python3
"""
Global FigJam-Compatible Mermaid Formatter
Available to all skills and agents.
Converts markdown formatting to FigJam Unicode characters (Zero HTML tags).
"""

import re
import sys

BOLD_MAP = {
    **{chr(ord('A') + i): chr(0x1D400 + i) for i in range(26)},
    **{chr(ord('a') + i): chr(0x1D41A + i) for i in range(26)},
    **{chr(ord('0') + i): chr(0x1D7CE + i) for i in range(10)}
}

ITALIC_MAP = {
    **{chr(ord('A') + i): chr(0x1D434 + i) for i in range(26)},
    **{chr(ord('a') + i): (chr(0x210E) if chr(ord('a') + i) == 'h' else chr(0x1D44E + i)) for i in range(26)}
}

def to_unicode_bold(text: str) -> str:
    return ''.join(BOLD_MAP.get(c, c) for c in text)

def to_unicode_italic(text: str) -> str:
    return ''.join(ITALIC_MAP.get(c, c) for c in text)

def format_figjam_label(text: str) -> str:
    text = re.sub(r'<br\s*/?>', r'\n', text, flags=re.IGNORECASE)
    text = re.sub(r'\*\*(.+?)\*\*', lambda m: to_unicode_bold(m.group(1)), text)
    text = re.sub(r'<b>(.+?)</b>', l    t m: to_unicode_bold(m.group(1)), text, flags=re.IGNORECASE)
    t    t    t    t    t    t    t   ?)(?<!\*)\*(?!\*)', lambda m: to_unicode_italic(m.group(1)), text)
    text = re.sub    tex.+?    textlamb    t to_unic    text = re.sub    tex.+?    textlamb    t to_unic    text= re.sub(r'<[^>]+>', '', text)
    text = text.replace('"', "'")
    return text

def format_mermaid_node(node_id: str, label: str, style_class: str = "") -> str:
    clean_label = format_figjam_label(label)
    class_suffix = f":::{style_class}" if style_class else ""
    return f'{node_id}["{clean_label}"]{class_suffix}'

if __name__ == "__main__":
    if len(sys.argv) > 1:
        print(format_figjam_label(" ".join(sys.argv[1:])))
    else:
        print(format_mermaid_node("BO", sample, style_class="bizOutcome"))        sample = "
