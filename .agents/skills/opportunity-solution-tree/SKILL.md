---
name: opportunity-solution-tree
description: Guide for continuous product discovery using Teresa Torres' Opportunity Solution Tree (OST). Use when setting business and product outcomes, mapping customer opportunities from research, comparing competing solutions, designing rapid assumption tests, and generating FigJam/Miro importable discovery trees.
---

# Opportunity Solution Tree (OST)

The Opportunity Solution Tree (OST) is a visual framework developed by Teresa Torres for continuous product discovery. It connects high-level business and product outcomes to customer opportunities, competing solutions, and assumption tests.

---

## Core Workflow

```
[Business Outcome: Revenue vs Cost]
                 │
                 ▼
         [Product Outcome]
                 │
                 ▼
        [Customer Opportunities] (Parent & Sub-Opportunities)
                 │
                 ▼
        [Competing Solutions] (Compare & Contrast)
                 │
                 ▼
       [Assumption Tests & Experiments]
```

### Step 1: Clarify the Outcome (Business & Product Outcome)
1. **Always start by asking the user**:
   - Is the primary business outcome aimed at **Increasing Revenue** or **Reducing Cost** (or another strategic driver like retention/expansion)?
2. **Translate Business Outcome into a Product Outcome**:
   - A business outcome measures business performance (e.g., "Increase annual recurring revenue by \$2M", "Reduce customer support operational costs by 20%").
   - A product outcome measures human behavior within the product that drives the business outcome (e.g., "Increase percentage of trial users who complete onboarding within 48 hours", "Reduce time taken by employees to submit an expense report").
   - **Never proceed without aligning on a single clear product outcome.**

### Step 2: Map Opportunities (Customer Problems, Pains, and Desires)
- Opportunities represent customer problems, unmet needs, pain points, or desires uncovered through qualitative interviews and quantitative behavioral analytics.
- **Rules for Framing Opportunities**:
  - Express opportunities from the customer's perspective ("I struggle to...", "I don't know how to...", "It takes too long to...").
  - Do NOT frame solutions as opportunities (e.g., avoid "Users need a dashboard"; frame as "Users cannot see which expenses are pending manager approval").
  - Structure opportunities hierarchically into parent opportunities and specific sub-opportunities.

### Step 3: Ideate Competing Solutions
- Connect solutions directly under specific sub-opportunities.
- **Avoid the "Whether or Not" Trap**: Never evaluate a single solution in isolation ("Should we build feature X or not?"). Always generate at least 2–3 competing solutions for the target opportunity to compare and contrast.
- Ensure every solution explicitly addresses its parent opportunity.

### Step 4: Identify Assumptions & Design Fast Experiments
Deconstruct solutions into their critical underlying assumptions, prioritizing:
1. **Value Risk**: Will customers choose to use this solution over current alternatives?
2. **Viability Risk**: Does this solution drive the desired business outcome and fit within business constraints (legal, financial, operational)?
3. **Usability & Feasibility Risks**: Can users easily figure it out, and can our engineering team deliver it?

For the riskiest assumptions, define rapid, low-fidelity assumption tests (e.g., prototype tests, customer inquiry data, fake door tests, unmoderated usability tests) before committing delivery effort.

---

## Output Format: Ready for FigJam & Miro

Always present the Opportunity Solution Tree in two formats:

### 1. Visual Markdown Hierarchy
A clear, nested list or diagram showing:
- **Outcome**
  - 🟢 **Opportunity (Parent / Sub)**
    - 💡 **Solution**
      - 🧪 **Assumption Test**

### 2. FigJam & Miro Importable Table / CSV
Provide a raw, copy-pasteable table format that users can directly copy into their clipboard and paste onto a FigJam or Miro canvas to instantly create colored sticky notes:

```csv
Type,Level,Title,Details,Parent
Outcome,0,"Reduce expense processing cycle time","Drive cost reduction by accelerating submission to reimbursement","None"
Opportunity,1,"Employees forget to submit receipts immediately","Physical paper receipts get lost or crumpled during business trips","Reduce expense processing cycle time"
Opportunity,2,"Expense categorization feels tedious and confusing","Employees unsure which cost center or GL code to select","Employees forget to submit receipts immediately"
Solution,2,"Mobile Instant Receipt Snap & OCR","Camera captures receipt on the go and auto-extracts amount and merchant","Employees forget to submit receipts immediately"
Solution,2,"Credit Card Real-Time SMS Matching","Card swipe triggers SMS prompt with 1-click receipt photo reply","Employees forget to submit receipts immediately"
Assumption Test,3,"OCR Accuracy Test","Run 50 real crumpled receipts through OCR engine; target >90% extraction rate","Mobile Instant Receipt Snap & OCR"
```

> **How users import this into FigJam / Miro**:
> - In **FigJam**: Copy the CSV table text directly and press `Cmd/Ctrl + V` on the canvas (FigJam converts table rows into sticky notes or structured tables automatically).
> - In **Miro**: Copy cells and paste directly, or use Miro's "Upload CSV" feature to generate sticky notes.

---

## Interactive Rule: Pause for Alignment

Before moving to story mapping or backlog writing:
1. Review the generated tree with the user.
2. Be curious: ask which opportunity they believe holds the highest customer friction and business leverage.
3. **Wait for user feedback and approval** before generating downstream artifacts.

---

## Artifact Persistence

When finalizing the Opportunity Solution Tree for a project initiative, save the deliverable (including visual hierarchy and FigJam/Miro CSV) to:
- `artifacts/opportunity-solution-trees/<initiative-name>-ost.md`

---

## Detailed References & Examples
- Deep-dive guide: [references/ost_framework.md](./references/ost_framework.md)
- Complete concrete example: [examples/sample_ost.md](./examples/sample_ost.md)

## Visual Diagram Standards (FigJam & Miro-Compatible Mermaid)
When generating visual Mermaid diagrams:
1. Zero HTML tags: NEVER use <b>, <i>, <u>, or <br> inside Mermaid node labels.
2. Line Breaks: Use \n for line breaks inside double-quoted string labels.
4. Node Delimiters: Keep Mermaid node labels as standard double-quoted strings.3. Unicode Styling: Use Unicode Mathematical Bold (
5. Formatter Utility: Reference ~/.gemini/config/scripts/figjam_mermaid_formatter.py.
