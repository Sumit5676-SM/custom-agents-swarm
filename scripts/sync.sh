#!/usr/bin/env bash
# ==============================================================================
# sync.sh
# Pulls latest updates from git and updates global links/agents on this machine.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

GREEN="\033[0;32m"
BLUE="\033[0;34m"
BOLD="\033[1m"
NC="\033[0m"

echo -e "${BOLD}${BLUE}=== Syncing Custom Agents Swarm Template ===${NC}"

cd "${REPO_ROOT}"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo -e "Pulling latest changes from Git..."
  git pull --rebase || echo "Note: Git pull skipped or not configured with upstream."
fi

echo -e "\nUpdating global configuration..."
"${SCRIPT_DIR}/setup-global.sh" --force

echo -e "\n${BOLD}${GREEN}✔ Template repository and global config are up to date!${NC}"
