#!/usr/bin/env bash
# ==============================================================================
# push.sh
# 1. Imports any new items created directly in ~/.gemini/config/
# 2. Updates catalogue tables in README.md
# 3. Ensures global symlinks are active
# 4. Commits and pushes changes to the remote Git repository
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

GLOBAL_CONFIG_DIR="${GEMINI_CONFIG_DIR:-${HOME}/.gemini/config}"
GLOBAL_SKILLS_DIR="${GLOBAL_CONFIG_DIR}/skills"
GLOBAL_AGENTS_DIR="${GLOBAL_CONFIG_DIR}/agents"

COMMIT_MSG="${1:-}"

cd "${REPO_ROOT}"

echo -e "${BOLD}${BLUE}=== Pushing Custom Agents Swarm Updates ===${NC}"

# 1. Import any new non-symlinked folders created in ~/.gemini/config
import_untracked() {
  local global_base="$1"
  local repo_base="$2"
  local type_name="$3"

  if [ ! -d "$global_base" ]; then
    return 0
  fi

  for item in "$global_base"/*; do
    [ -e "$item" ] || continue
    # If it is a directory and NOT a symlink, it was created directly in global path
    if [ -d "$item" ] && [ ! -L "$item" ]; then
      local name="$(basename "$item")"
      local repo_dest="${repo_base}/${name}"
      echo -e "${YELLOW}Discovered new ${type_name} in global path: ${name}${NC}"
      echo -e "Importing into repository: ${repo_dest}..."
      mkdir -p "$repo_base"
      mv "$item" "$repo_dest"
      ln -s "$repo_dest" "$item"
      echo -e "${GREEN}✔ Imported and linked ${name}${NC}"
    fi
  done
}

import_untracked "${GLOBAL_SKILLS_DIR}" "${REPO_ROOT}/.agents/skills" "skill"
import_untracked "${GLOBAL_AGENTS_DIR}" "${REPO_ROOT}/.agents/agents" "agent"

# 2. Ensure global links are up to date
"${SCRIPT_DIR}/setup-global.sh" --force >/dev/null 2>&1 || true

# 3. Auto-update README.md catalogue
echo -e "\nUpdating catalogue in README.md..."
"${SCRIPT_DIR}/update-catalogue.sh" --write

# 4. Check git status
echo -e "\nChecking Git status..."
CHANGES="$(git status --porcelain)"

if [ -n "$CHANGES" ]; then
  git status -s
  
  if [ -z "$COMMIT_MSG" ]; then
    echo ""
    read -rp "Enter commit message (or press enter for default): " user_input
    COMMIT_MSG="${user_input:-feat: update custom agents, skills and catalogue}"
  fi

  echo -e "\nStaging and committing changes..."
  git add .
  git commit -m "$COMMIT_MSG"
  echo -e "${GREEN}✔ Committed changes: ${COMMIT_MSG}${NC}"
else
  echo "No local uncommitted changes."
fi

# 5. Push to remote
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")"
REMOTE_EXISTS="$(git remote 2>/dev/null || echo "")"

if [ -z "$REMOTE_EXISTS" ]; then
  echo -e "\n${YELLOW}Note: No Git remote configured yet.${NC}"
  echo -e "To link and push to your remote repository, run:"
  echo -e "  ${BOLD}git remote add origin <YOUR_REMOTE_REPO_URL>${NC}"
  echo -e "  ${BOLD}git push -u origin ${CURRENT_BRANCH}${NC}"
else
  echo -e "\nPushing to remote (${CURRENT_BRANCH})..."
  if git push origin "${CURRENT_BRANCH}"; then
    echo -e "\n${BOLD}${GREEN}✔ Successfully pushed all updates to remote repository!${NC}"
  else
    echo -e "\n${RED}Push failed. If upstream is not set, try: git push -u origin ${CURRENT_BRANCH}${NC}"
  fi
fi
