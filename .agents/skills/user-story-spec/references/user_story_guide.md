# User Story & Feature Specification Guide

This reference provides techniques for writing, splitting, and refining user stories based on Mike Cohn's foundational agile literature.

---

## 1. Common User Story Anti-Patterns to Avoid

1. **Treating the Written Story as an Exhaustive Requirement**:
   - The card is only a placeholder for a conversation. If you attempt to specify every database column, CSS class, and edge-case up front, you waste tokens and eliminate team collaboration.
2. **Writing Stories That Are Too Large**:
   - Large stories (epics) create the illusion of progress. Stories that span multiple sprints lead to code that is "90% done" but delivers zero working software to users.
3. **Splitting Stories into Technical Tasks**:
   - Creating separate stories for frontend, backend, and QA destroys accountability. A story must describe an outcome that an end-user or system consumer can experience and test.
4. **Writing from the Product Owner's Perspective**:
   - Avoid stories like *"As a Product Owner, I want a report so I can see metrics."* Frame stories from the perspective of the actual persona experiencing the problem (e.g., *"As a Regional Sales Manager, I need to compare monthly revenue by territory so I can spot underperforming regions"*).
5. **Adding Too Much Detail Too Soon**:
   - Keep stories lower in the backlog broad and lightweight. Add detailed acceptance criteria and rule specifications only when a story approaches the upcoming sprint.

---

## 2. Proven Story Splitting Patterns

When a story is too large to complete in a sprint, use these splitting heuristics:

1. **Workflow Steps**:
   - Split by chronological user journey phases (e.g., first slice: basic manual data entry; second slice: preview and review; third slice: auto-save drafts).
2. **Business Rule Variations**:
   - Start with the simple default rule, then carve complex rules into follow-up stories (e.g., first slice: standard business travel expense; second slice: multi-currency foreign travel with tax withholdings).
3. **Data Variations / Formats**:
   - Split by input type (e.g., first slice: accept JPEG images only; second slice: accept multi-page PDF documents).
4. **Major Effort vs Simple Effort**:
   - Break out the complex edge case (e.g., first slice: submit on time; second slice: handle late submissions requiring VP secondary sign-off).
5. **Simple / Complex Paths**:
   - Implement the happy path first to achieve an end-to-end walking skeleton, then layer on advanced filters, search, or bulk operations.

---

## 3. Decorated User Roles

A generic persona like *"As a user"* fails to provide context. Use decorated roles to add clear intent:
- *First-time traveler* vs *Frequent business traveler*
- *Department budget approver* vs *Central payroll auditor*
- *Self-employed contractor* vs *Full-time enterprise employee*
