# Opportunity Solution Tree Framework Reference

This reference provides deep guidance on applying Teresa Torres' Opportunity Solution Tree (OST) framework in continuous discovery.

---

## 1. Framing Outcomes: Business vs Product Outcome

A product discovery effort must be anchored by a single metric that creates mutual value for both the business and the customer.

### Business Outcomes: Increasing Revenue vs Reducing Cost
Always verify which primary business lever the initiative serves:
- **Increasing Revenue**:
  - New customer acquisition / conversion rates
  - Expansion / upsell / average revenue per user (ARPU)
  - Retention / churn reduction
  - Customer lifetime value (LTV)
- **Reducing Cost**:
  - Operational overhead & manual processing hours
  - Customer support ticket volume and resolution time
  - Server / infrastructure / transaction fees
  - Fraud, compliance penalties, or chargeback losses

### Product Outcomes
A business outcome cannot be manipulated directly; you can only change user behavior. A **Product Outcome** is a measurable change in customer or user behavior within the product that leads to the business outcome.
- *Poor*: "Ship the mobile expense app by Q3" (This is an output).
- *Better*: "Decrease average expense report submission turnaround from 14 days to 3 days" (Behavioral product outcome driving cost reduction).

---

## 2. Discovering and Structuring Opportunities

Opportunities are unmet needs, pain points, and desires expressed by customers.

### How to Extract Opportunities from Continuous Customer Interviews
- Ask users to recount specific past stories ("Tell me about the last time you submitted an expense report").
- Listen for moments of friction, hesitation, frustration, workarounds, or delays.
- Avoid asking customers what features they want built; instead, uncover the context behind why a task felt painful.

### Structuring Hierarchical Opportunity Trees
Break broad opportunities into specific, actionable sub-opportunities:
```
[Parent Opportunity]: "Managing paper receipts while traveling is chaotic"
  ├── [Sub-Opportunity]: "Receipts fade, get lost, or crumble in pockets"
  ├── [Sub-Opportunity]: "Foreign currency conversions require manual math"
  └── [Sub-Opportunity]: "Digital email receipts require printing or manual downloading"
```
Structuring opportunities hierarchically prevents overwhelming the team and reveals targeted intervention points.

---

## 3. Ideating and Comparing Solutions

- For each prioritized sub-opportunity, generate **at least 2–3 diverse solutions**.
- **Compare and Contrast**: Instead of debating whether Solution A is "good enough," evaluate Solution A vs Solution B vs Solution C against:
  - Expected customer value and impact on the opportunity
  - Business viability and strategic fit
  - Speed of validation and implementation effort

---

## 4. Assumption Mapping & Fast Experimentation

Before writing production code, extract the leap-of-faith assumptions for the chosen solution:
1. **Value Assumptions**: Will users bother to use this? Will it be valuable enough to alter their behavior?
2. **Viability Assumptions**: Will this comply with financial, tax, legal, and operational policies? Does it align with our business model?
3. **Usability Assumptions**: Can users complete the flow intuitively without guidance?
4. **Feasibility Assumptions**: Does third-party OCR API provide acceptable latency and accuracy?

### Designing Assumption Tests
- **Customer Prototype Walkthrough**: 15-minute test with a clickable Figma wireframe to test value and usability.
- **Data Query / Telemetry Spike**: Analyze existing user logs to verify how often a specific trigger event actually occurs.
- **Concierge / Wizard of Oz Test**: Manually perform the backend step for 20 users to test if value is realized before automating it in software.

---

## 5. FigJam & Miro Import Guidelines

To enable immediate collaboration with stakeholders in FigJam or Miro:
- Output a clean tabular structure with columns: `Type`, `Level`, `Title`, `Details`, `Parent`.
- Users can highlight the CSV block, copy it, and paste it directly into FigJam or Miro to spawn individual sticky notes.
- Recommended visual color coding for sticky notes:
  - **Outcome**: Blue / Indigo
  - **Opportunities**: Yellow / Orange
  - **Solutions**: Green
  - **Assumption Tests**: Pink / Purple
