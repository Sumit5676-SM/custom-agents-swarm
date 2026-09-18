#!/usr/bin/env bash
# ==============================================================================
# update-catalogue.sh
# Generates markdown tables for agents, skills, and scripts.
# Can print to stdout or update README.md directly using --write.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

WRITE_TO_README=false

if [ "${1:-}" = "--write" ] || [ "${1:-}" = "-w" ]; then
  WRITE_TO_README=true
fi

generate_catalogue() {
  cat << 'EOF'
<!-- BEGIN_CATALOGUE -->
### 🤖 Registered Agents

| Agent Name | Description | Bundled Skills |
| :--- | :--- | :--- |
EOF

  for agent_dir in "${REPO_ROOT}/.agents/agents"/*; do
    [ -d "$agent_dir" ] || continue
    agent_file="${agent_dir}/agent.md"
    if [ -f "$agent_file" ]; then
      name="$(basename "$agent_dir")"
      desc="$(awk -F': ' '/^description:/ {print $2; exit}' "$agent_file" | sed 's/^ *//; s/ *$//')"
      skills="$(awk '/^skills:/{flag=1; next} /^[a-zA-Z]/{flag=0} flag && /^[ ]*- /{sub(/^[ ]*- /,""); print "`" $0 "`"}' "$agent_file" | tr '\n' ' ' | sed 's/ $//')"
      echo "| [\`${name}\`](.agents/agents/${name}/agent.md) | ${desc} | ${skills:-None} |"
    fi
  done

  cat << 'EOF'

### ⚡ Registered Skills

| Skill Name | Description | Location |
| :--- | :--- | :--- |
EOF

  for skill_dir in "${REPO_ROOT}/.agents/skills"/*; do
    [ -d "$skill_dir" ] || continue
    skill_file="${skill_dir}/SKILL.md"
    if [ -f "$skill_file" ]; then
      name="$(basename "$skill_dir")"
      desc="$(awk -F': ' '/^description:/ {print $2; exit}' "$skill_file" | sed 's/^ *//; s/ *$//')"
      echo "| [\`${name}\`](.agents/skills/${name}/SKILL.md) | ${desc} | \`.agents/skills/${name}\` |"
    fi
  done

  cat << 'EOF'

### 🛠 Automation Scripts

| Script | Description | Usage |
| :--- | :--- | :--- |
| [`scripts/setup-global.sh`](scripts/setup-global.sh) | Links or copies all agents and skills into the machine's global config (`~/.gemini/config/`) | `./scripts/setup-global.sh` |
| [`scripts/push.sh`](scripts/push.sh) | Updates README, imports new global items, commits, and pushes to Git | `./scripts/push.sh "commit message"` |
| [`scripts/sync.sh`](scripts/sync.sh) | Pulls latest updates from git and updates global links | `./scripts/sync.sh` |
| [`scripts/install-project.sh`](scripts/install-project.sh) | Copies or symlinks `.agents/` into a specific project folder | `./scripts/install-project.sh <project_path>` |
| [`scripts/update-catalogue.sh`](scripts/update-catalogue.sh) | Automatically scans and updates catalogue tables in README.md | `./scripts/update-catalogue.sh [--write]` |
<!-- END_CATALOGUE -->
EOF
}

if [ "$WRITE_TO_README" = true ]; then
  README_FILE="${REPO_ROOT}/README.md"
  NEW_CATALOGUE="$(generate_catalogue)"

  python3 -c "
import sys
readme_path = sys.argv[1]
new_catalogue = sys.stdin.read().strip()

with open(readme_path, 'r', encoding='utf-8') as f:
    content = f.read()

start_tag = '<!-- BEGIN_CATALOGUE -->'
end_tag = '<!-- END_CATALOGUE -->'

if start_tag in content and end_tag in content:
    pre = content.split(start_tag)[0]
    post = content.split(end_tag)[1]
    updated = pre + new_catalogue + post
    with open(readme_path, 'w', encoding='utf-8') as f:
        f.write(updated)
    print('✔ Successfully updated README.md with the latest catalogue!')
else:
    print('Error: Could not find BEGIN_CATALOGUE and END_CATALOGUE tags in README.md', file=sys.stderr)
    sys.exit(1)
" "$README_FILE" <<< "$NEW_CATALOGUE"
else
  generate_catalogue
fi
