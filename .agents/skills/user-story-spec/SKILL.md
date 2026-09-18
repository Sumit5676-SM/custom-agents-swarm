---
name: user-story-spec
description: Guide for writing high-quality User Stories and Feature Specifications based on Mike Cohn's agile practices. Use when writing sprint-ready backlog items, defining acceptance criteria (Given-When-Then / rule-based), applying the 3 C's (Card, Conversation, Confirmation), verifying INVEST criteria, and avoiding horizontal task-splitting anti-patterns.
---

# User Stories and Feature Specifications

Based on Mike Cohn's agile practices, user stories are not exhaustive specification documents. They are short descriptions of desired functionality told from the perspective of the person who benefits, serving as invitations to a conversation.

---

## The 3 C's Framework (Ron Jeffries)

Every user story consists of three essential components:

1. **Card**: The concise written reminder capturing who, what, and why.
2. **Conversation**: The collaborative dialogue between the product discovery specialist, engineers, designers, and stakeholders to uncover nuance, business rules, tradeoffs, and edge cases.
3. **Confirmation**: The acceptance criteria, examples, and tests that clearly demonstrate when the story is complete.

---

## Formulating Stories

### 1. The Standard User Story Template
```text
As a [type of user / role],
I [want / need / am required to] [perform an action / achieve a goal],
so that [benefit / business value / decision made].
```

> **Rule for Strong Stories**: Ensure the user role is specific (e.g., *"Traveling Sales Representative"*, not just *"User"*), the goal represents user intent (not UI widgets), and the "so that" explains the real value or decision supported.

### 2. Contextual Alternative: The Job Story Template
When the user's specific emotional or situational context drives the motivation more than their persona:
```text
When [situation / trigger],
I want to [motivation / action],
so that [expected outcome / job to be done].
```

---

## Quality Criteria: The INVEST Checklist

Every sprint-ready user story must satisfy the INVEST principles:
- **I — Independent**: As decoupled as possible from other stories in the sprint.
- **N — Negotiable**: Captures the problem and goal while leaving room for the team to co-design the best technical and UX solution.
- **V — Valuable**: Delivers demonstrable value to a user, customer, or business outcome.
- **E — Estimable**: Understood well enough by the engineering team to gauge effort and complexity.
- **S — Small**: Sized to be comfortably completed and tested within a single sprint.
- **T — Testable**: Contains clear confirmation criteria so everyone agrees on what "done" means.

---

## Defining Acceptance Criteria (Confirmation)

Acceptance criteria clarify expectations without turning the story into rigid waterfall requirements. Use two primary styles:

### Style A: Scenario-Based (Given-When-Then / BDD)
Best for state transitions, user interactions, and end-to-end flows:
```text
Scenario: Uploading a valid receipt image
  Given the employee is logged in and creating an expense report
  When the employee snaps or uploads a PNG/JPEG receipt under 10MB
  Then the receipt is attached to the report
  And the image preview is displayed with option to rotate or delete.
```

### Style B: Rule-Based Criteria
Best for data validations, calculations, business constraints, and permissions:
- Maximum upload file size is 10 MB.
- Allowed file formats: JPG, PNG, PDF.
- If a receipt image exceeds 10 MB, display an inline warning: *"File size exceeds 10 MB limit."*
- Unsaved changes must prompt a confirmation modal if the user attempts to navigate away.

---

## Vertical Thin Slicing (Avoid Horizontal Splitting)

- **Anti-Pattern (Horizontal Slicing)**: Splitting by architectural layers (e.g., Story 1: *"Create receipt database table"*, Story 2: *"Build backend API"*, Story 3: *"Build UI"*). None of these deliver standalone user value.
- **Best Practice (Vertical Thin Slicing)**: Slicing across all layers for a narrow capability (e.g., *"Upload single JPEG receipt and view thumbnail"*). The database, API, and UI are built together to deliver working software.

---

## Pre-Sprint Readiness Checklist

Before moving a story into sprint planning, confirm:
1. Who specifically benefits from this story?
2. What user outcome or decision does it support?
3. Why does this outcome matter now?
4. Is it small enough to be fully completed within one sprint?
5. Is it vertically sliced across layers?
6. Does it leave room for team conversation and design choices?
7. Do we have clear confirmation criteria for how to test it?

---

## Interactive Rule: Pause for Alignment

When drafting user stories:
1. Present the draft story and its acceptance criteria to the user.
2. Ask if any key business rules, edge cases, or permissions were missed.
3. **Wait for user feedback and approval** before finalizing the specification.

---

## Detailed References & Examples
- Deep-dive guide: [references/user_story_guide.md](./references/user_story_guide.md)
- Complete concrete examples: [examples/sample_user_stories.md](./examples/sample_user_stories.md)
