# Custom Agents Swarm Template 🚀

A modular, reusable template and catalogue for custom AI agents, specialized skills, and workflow scripts.

Designed to be installed **globally** across your machines (so any new project automatically has access to your agents and skills) or cloned/scaffolded as a template for project-specific swarms.

> [!IMPORTANT]
> **Maintenance Note**: This `README.md` (and its catalogue tables below) should be updated every time new agents, skills, or scripts are added. You can run `./scripts/update-catalogue.sh` to generate the latest markdown tables.

---

## 📦 Catalogue

### 🤖 Registered Agents

| Agent Name | Description | Bundled Skills |
| :--- | :--- | :--- |
| [`product-discovery-specialist`](.agents/agents/product-discovery-specialist/agent.md) | Expert Product Discovery Specialist focused on outcomes over outputs, addressing Value and Business Viability risks, and guiding discovery through Opportunity Solution Trees, Two-Dimensional Story Mapping, and User Story Specifications. | `opportunity-solution-tree`, `story-mapping`, `user-story-spec` |

### ⚡ Registered Skills

| Skill Name | Description | Location |
| :--- | :--- | :--- |
| [`opportunity-solution-tree`](.agents/skills/opportunity-solution-tree/SKILL.md) | Guide for continuous product discovery using Teresa Torres' Opportunity Solution Tree (OST). Use when setting business and product outcomes, mapping customer opportunities from research, comparing competing solutions, designing rapid assumption tests, and generating FigJam/Miro importable discovery trees. | `.agents/skills/opportunity-solution-tree` |
| [`story-mapping`](.agents/skills/story-mapping/SKILL.md) | Guide for creating Two-Dimensional User Story Maps based on Mike Cohn and Jeff Patton's framework. Use when breaking down high-level objectives into narrative sequences (horizontal backbone), mapping alternatives and variations (vertical dimension), conducting discovery walkthroughs, slicing releases (MVP / walking skeleton), and generating FigJam/Miro importable story maps. | `.agents/skills/story-mapping` |
| [`user-story-spec`](.agents/skills/user-story-spec/SKILL.md) | Guide for writing high-quality User Stories and Feature Specifications based on Mike Cohn's agile practices. Use when writing sprint-ready backlog items, defining acceptance criteria (Given-When-Then / rule-based), applying the 3 C's (Card, Conversation, Confirmation), verifying INVEST criteria, and avoiding horizontal task-splitting anti-patterns. | `.agents/skills/user-story-spec` |

### 🛠 Automation Scripts

| Script | Description | Usage |
| :--- | :--- | :--- |
| [`scripts/setup-global.sh`](scripts/setup-global.sh) | Links or copies all agents and skills into the machine's global config (`~/.gemini/config/`) | `./scripts/setup-global.sh` |
| [`scripts/install-project.sh`](scripts/install-project.sh) | Copies or symlinks `.agents/` into a specific project folder | `./scripts/install-project.sh <project_path>` |
| [`scripts/sync.sh`](scripts/sync.sh) | Pulls latest updates from git and updates global links | `./scripts/sync.sh` |
| [`scripts/update-catalogue.sh`](scripts/update-catalogue.sh) | Automatically scans and generates catalogue tables | `./scripts/update-catalogue.sh` |

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

---

## 🔄 Multi-Machine Workflow

When you improve a skill or add a new agent on one machine:

1. **Push your changes**:
   ```bash
   git add .
   git commit -m "Add new agile coach agent and retrospective skill"
   git push origin main
   ```

2. **Update on your other machines**:
   ```bash
   cd ~/Projects/custom-agents-swarm
   ./scripts/sync.sh
   ```

---

## ➕ Adding New Agents and Skills

1. **To add an agent**:
   - Create `.agents/agents/<agent-name>/agent.md`.
   - Specify name, description, role, and any bundled skills in the YAML frontmatter.

2. **To add a skill**:
   - Create `.agents/skills/<skill-name>/SKILL.md`.
   - Add reference guides, templates, and examples inside `references/` and `examples/` subfolders as needed.

3. **Update Catalogue and Sync**:
   - Run `./scripts/update-catalogue.sh` to get the updated markdown tables.
   - Update this `README.md`.
   - Run `./scripts/setup-global.sh --force` (or `./scripts/sync.sh`) to link new additions globally.
