# Custom Agents Swarm Template 🚀

A modular, reusable template and catalogue for custom AI agents, specialized skills, and workflow scripts.

Designed to be installed **globally** across your machines (so any new project automatically has access to your agents and skills) or cloned/scaffolded as a template for project-specific swarms.

> [!IMPORTANT]
> **Maintenance Note**: This `README.md` (and its catalogue tables below) should be updated every time new agents, skills, or scripts are added. Running `./scripts/push.sh` or `./scripts/update-catalogue.sh --write` will update the catalogue tables automatically.

---

## 📦 Catalogue

<!-- BEGIN_CATALOGUE -->
### 🤖 Registered Agents

| Agent Name | Description | Bundled Skills |
| :--- | :--- | :--- |
| [`full-stack-developer`](.agents/agents/full-stack-developer/agent.md) | Senior Full Stack Engineer specializing in Next.js 16+ App Router, TypeScript, Tailwind v4, shadcn/ui, and Supabase. Implements decoupled API abstractions, Supabase Edge Functions, and production-grade architectures. | `api-decoupling-adapter` `supabase-edge-functions` `supabase` `supabase-postgres-best-practices` |
| [`product-designer`](.agents/agents/product-designer/agent.md) | Expert Product Designer specializing in UX/UI best practices, user journey mapping, design systems, visual hierarchy, layout architecture, accessibility, motion, and interaction design. | `user-journey-mapping` `design-system-spec` `ui-interaction-design` `hi-fi-visual-design` |
| [`product-discovery-specialist`](.agents/agents/product-discovery-specialist/agent.md) | Expert Product Discovery Specialist focused on outcomes over outputs, addressing Value and Business Viability risks, and guiding discovery through Opportunity Solution Trees, Two-Dimensional Story Mapping, and User Story Specifications. | `opportunity-solution-tree` `story-mapping` `user-story-spec` |
| [`tech-architect`](.agents/agents/tech-architect/agent.md) | Master Systems Architect specializing in cloud-native Next.js 16+ App Router and Supabase architectures. Accountable for Feasibility Risk, relational schema, RLS policies, Edge Function boundaries, and API contracts. | `system-architecture-spec` `supabase-schema-and-rls` `supabase-postgres-best-practices` `supabase` |

### ⚡ Registered Skills

| Skill Name | Description | Location |
| :--- | :--- | :--- |
| [`api-decoupling-adapter`](.agents/skills/api-decoupling-adapter/SKILL.md) | Guide for creating decoupled API abstraction layers and contract adapters in Next.js 16+ App Router. Use when structuring src/lib/api/ to isolate UI components from database queries and Supabase Edge Function invocations. | `.agents/skills/api-decoupling-adapter` |
| [`design-system-spec`](.agents/skills/design-system-spec/SKILL.md) | Guide for creating robust, accessible, and scalable Design Systems. Use when establishing design tokens (colors, WCAG contrast, modular typography, 8pt/4pt spacing, elevation shadows, iconography), atomic component architectures (atoms, molecules, organisms), and exhaustive interaction states. | `.agents/skills/design-system-spec` |
| [`hi-fi-visual-design`](.agents/skills/hi-fi-visual-design/SKILL.md) | Guide for creating High-Fidelity Visual Designs, pixel-perfect UI mockups, interactive HTML/CSS prototypes, and visual design spec sheets. Use when translating wireframes and design systems into final visual deliverables, generating UI mockup images, and producing browser-previewable prototypes. | `.agents/skills/hi-fi-visual-design` |
| [`opportunity-solution-tree`](.agents/skills/opportunity-solution-tree/SKILL.md) | Guide for continuous product discovery using Teresa Torres' Opportunity Solution Tree (OST). Use when setting business and product outcomes, mapping customer opportunities from research, comparing competing solutions, designing rapid assumption tests, and generating FigJam/Miro importable discovery trees. | `.agents/skills/opportunity-solution-tree` |
| [`skill-creator`](.agents/skills/skill-creator/SKILL.md) | Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Antigravity's capabilities with specialized knowledge, workflows, or tool integrations. | `.agents/skills/skill-creator` |
| [`story-mapping`](.agents/skills/story-mapping/SKILL.md) | Guide for creating Two-Dimensional User Story Maps based on Mike Cohn and Jeff Patton's framework. Use when breaking down high-level objectives into narrative sequences (horizontal backbone), mapping alternatives and variations (vertical dimension), conducting discovery walkthroughs, slicing releases (MVP / walking skeleton), and generating FigJam/Miro importable story maps. | `.agents/skills/story-mapping` |
| [`supabase`](.agents/skills/supabase/SKILL.md) | "Use when doing ANY task involving Supabase. Triggers | `.agents/skills/supabase` |
| [`supabase-edge-functions`](.agents/skills/supabase-edge-functions/SKILL.md) | Guide for implementing and invoking Deno TypeScript Edge Functions in Next.js applications. Use when writing edge function business logic, third-party integrations, webhook handlers, and AI orchestration. Refer to supabase for general platform runtime settings. | `.agents/skills/supabase-edge-functions` |
| [`supabase-postgres-best-practices`](.agents/skills/supabase-postgres-best-practices/SKILL.md) | "Postgres best practices maintained by Supabase, for Postgres running anywhere. Load this skill BEFORE writing or changing anything that lives in a Postgres database | `.agents/skills/supabase-postgres-best-practices` |
| [`supabase-schema-and-rls`](.agents/skills/supabase-schema-and-rls/SKILL.md) | Application domain entity modeling, multi-tenant schema structures, and starter RLS policy templates for Supabase. Use when defining business entities, relationship models, and tenant isolation patterns. Consult supabase-postgres-best-practices for database performance, indexing, and lock avoidance, and supabase for platform security. | `.agents/skills/supabase-schema-and-rls` |
| [`system-architecture-spec`](.agents/skills/system-architecture-spec/SKILL.md) | Guide for architecting scalable cloud-native web systems using Next.js 16+ App Router and Supabase. Use when designing system topology, component and data flow boundaries, Edge Function allocation, API contract structures, and containerization specifications. | `.agents/skills/system-architecture-spec` |
| [`ui-interaction-design`](.agents/skills/ui-interaction-design/SKILL.md) | Guide for creating responsive UI layouts, visual hierarchy, motion principles, and screen wireframe specifications. Use when designing mobile/desktop grid layouts, defining micro-interactions and transitions, structuring screen wireframes, and detailing interaction callouts. | `.agents/skills/ui-interaction-design` |
| [`user-journey-mapping`](.agents/skills/user-journey-mapping/SKILL.md) | Guide for creating comprehensive User Journey Maps, empathy paths, and task flows. Use when visualizing user emotional curves, touchpoints, cognitive friction, and transitions based on story maps, and generating FigJam/Miro importable journey maps. | `.agents/skills/user-journey-mapping` |
| [`user-story-spec`](.agents/skills/user-story-spec/SKILL.md) | Guide for writing high-quality User Stories and Feature Specifications based on Mike Cohn's agile practices. Use when writing sprint-ready backlog items, defining acceptance criteria (Given-When-Then / rule-based), applying the 3 C's (Card, Conversation, Confirmation), verifying INVEST criteria, and avoiding horizontal task-splitting anti-patterns. | `.agents/skills/user-story-spec` |

### 🛠 Automation Scripts

| Script | Description | Usage |
| :--- | :--- | :--- |
| [`scripts/setup-global.sh`](scripts/setup-global.sh) | Links or copies all agents and skills into the machine's global config (`~/.gemini/config/`) | `./scripts/setup-global.sh` |
| [`scripts/push.sh`](scripts/push.sh) | Updates README, imports new global items, commits, and pushes to Git | `./scripts/push.sh "commit message"` |
| [`scripts/sync.sh`](scripts/sync.sh) | Pulls latest updates from git and updates global links | `./scripts/sync.sh` |
| [`scripts/install-project.sh`](scripts/install-project.sh) | Copies or symlinks `.agents/` into a specific project folder | `./scripts/install-project.sh <project_path>` |
| [`scripts/update-catalogue.sh`](scripts/update-catalogue.sh) | Automatically scans and updates catalogue tables in README.md | `./scripts/update-catalogue.sh [--write]` |
<!-- END_CATALOGUE -->

---

## 🌐 Quickstart: Global Access on Any Machine

Whenever you are on a new machine (laptop, desktop, or cloud workstation) and want all your projects to access your custom agents and skills automatically:

### 1. Clone this repository
```bash
git clone <YOUR_REPO_URL> ~/Projects/custom-agents-swarm
cd ~/Projects/custom-agents-swarm
```

### 2. Run the global setup
```bash
./scripts/setup-global.sh
```

By default, this creates symlinks from this repository into `~/.gemini/config/agents` and `~/.gemini/config/skills`.
- **Immediate updates**: Any edits you make in this repository are immediately reflected across all projects on your machine.
- If you prefer copying files instead of symlinks, run `./scripts/setup-global.sh --copy`.

### 3. Verify in your agent
Open any project on your machine — the custom agents (e.g. `@product-discovery-specialist`) and skills will be discovered and available immediately in chat.

---

## 🚀 Pushing & Syncing Across Machines

### When You Add or Update Agents/Skills (Pushing):
Whether you edited files in this repository or added new agents in `~/.gemini/config/`, simply run:

```bash
./scripts/push.sh "Add agile coach agent and retrospective skill"
```

This single command:
1. Detects and imports any new agents/skills created directly in `~/.gemini/config/`.
2. Automatically updates the catalogue tables in `README.md`.
3. Ensures all global symlinks are active.
4. Stages and commits all changes with your message.
5. Pushes the commit to your remote Git repository.

### When You Move to Another Machine (Pulling):
To pull down the latest agents and skills on your other machine, simply run:

```bash
cd ~/Projects/custom-agents-swarm
./scripts/sync.sh
```

---

## 📁 Project-Specific Usage

If you are starting a new project and want to commit a dedicated copy of `.agents/` directly to that repository:

```bash
# Copy into an existing or new project repository
./scripts/install-project.sh ~/Projects/my-new-project
```

Or symlink it:
```bash
./scripts/install-project.sh ~/Projects/my-new-project --symlink
```
