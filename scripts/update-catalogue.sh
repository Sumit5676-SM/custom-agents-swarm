#!/usr/bin/env bash
# ==============================================================================
# update-catalogue.sh
# Generates or prints a summary table of all agents, skills, and scripts for README.md.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "### 🤖 Registered Agents"
echo ""
echo "| Agent Name | Description | Bundled Skills |"
echo "| :--- | :--- | :--- |"

for agent_dir in "${REPO_ROOT}/.agents/agents"/*; do
  [ -d "$agent_dir" ] || continue
  agent_file="${agent_dir}/agent.md"
  if [ -f "$agent_file" ]; then
    name="$(basename "$agent_dir")"
    desc="$(awk -F': ' '/^description:/ {print $2; exit}' "$agent_file" | sed 's/^ *//; s/ *$//')"
    skills="$(awk '/^skills:/{flag=1; next} /^[a-zA-Z]/{flag=0} flag && /^[ ]*- /{sub(/^[ ]*- /,""); print "`" $0 "`"}' "$agent_file" | tr '\n' ' ' | sed 's/ $//')"
    echo "| \`${name}\` | ${desc} | ${skills:-None} |"
  fi
done

echo ""
echo "### ⚡ Registered Skills"
echo ""
echo "| Skill Name | Description |"
echo "| :--- | :--- |"

for skill_dir in "${REPO_ROOT}/.agents/skills"/*; do
  [ -d "$skill_dir" ] || continue
  skill_file="${skill_dir}/SKILL.md"
  if [ -f "$skill_file" ]; then
    name="$(basename "$skill_dir")"
    desc="$(awk -F': ' '/^description:/ {print $2; exit}' "$skill_file" | sed 's/^ *//; s/ *$//')"
    echo "| \`${name}\` | ${desc} |"
  fi
done

echo ""
echo "### 🛠 Automation Scripts"
echo ""
echo "| Script | Purpose | Usage |"
echo "| :--- | :--- | :--- |"
echo "| \`scripts/setup-global.sh\` | Installs/symlinks agents and skills to \`~/.gemini/config/\` | \`./scripts/setup-global.sh [--symlink\|--copy]\` |"
echo "| \`scripts/install-project.sh\` | Copies or links \`.agents\` to a target project repository | \`./scripts/install-project.sh <path-to-project>\` |"
echo "| \`scripts/sync.sh\` | Pulls latest template repo changes and refreshes global links | \`./scripts/sync.sh\` |"
echo "| \`scripts/update-catalogue.sh\` | Auto-generates markdown tables for agents and skills | \`./scripts/update-catalogue.sh\` |"
