#!/usr/bin/env bash
# ==============================================================================
# setup-global.sh
# Links or copies agents, skills, and rules from this repository into the global
# Antigravity/Gemini configuration directory (~/.gemini/config).
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Global configuration paths
GLOBAL_CONFIG_DIR="${GEMINI_CONFIG_DIR:-${HOME}/.gemini/config}"
GLOBAL_SKILLS_DIR="${GLOBAL_CONFIG_DIR}/skills"
GLOBAL_AGENTS_DIR="${GLOBAL_CONFIG_DIR}/agents"
GLOBAL_RULES_DIR="${GLOBAL_CONFIG_DIR}/rules"

# Options
MODE="symlink" # or "copy"
FORCE=false
DRY_RUN=false

# ANSI color codes
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m" # No Color

print_help() {
  cat << EOF
Usage: $(basename "$0") [OPTIONS]

Installs agents and skills into the global Antigravity configuration directory:
${GLOBAL_CONFIG_DIR}

Options:
  -s, --symlink     Create symbolic links to the repo files (Default - updates in repo reflect immediately)
  -c, --copy        Copy files instead of symlinking
  -f, --force       Overwrite existing destinations without prompting
  -d, --dry-run     Show what actions would be taken without making changes
  -h, --help        Show this help message

Examples:
  ./scripts/setup-global.sh
  ./scripts/setup-global.sh --copy --force
  ./scripts/setup-global.sh --dry-run
EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -s|--symlink)
      MODE="symlink"
      shift
      ;;
    -c|--copy)
      MODE="copy"
      shift
      ;;
    -f|--force)
      FORCE=true
      shift
      ;;
    -d|--dry-run)
      DRY_RUN=true
      shift
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      echo -e "${RED}Error: Unknown option '$1'${NC}"
      print_help
      exit 1
      ;;
  esac
done

echo -e "${BOLD}${BLUE}=== Antigravity Global Customizations Setup ===${NC}"
echo -e "Repository:     ${REPO_ROOT}"
echo -e "Target Dir:     ${GLOBAL_CONFIG_DIR}"
echo -e "Install Mode:   ${MODE}"
echo -e "Dry Run:        ${DRY_RUN}"
echo "--------------------------------------------------"

# Ensure global directories exist
if [ "$DRY_RUN" = false ]; then
  mkdir -p "${GLOBAL_SKILLS_DIR}" "${GLOBAL_AGENTS_DIR}" "${GLOBAL_RULES_DIR}"
fi

install_items() {
  local src_base="$1"
  local target_base="$2"
  local item_type="$3"

  if [ ! -d "$src_base" ]; then
    return 0
  fi

  echo -e "\n${BOLD}Processing ${item_type}...${NC}"

  for item in "$src_base"/*; do
    [ -e "$item" ] || continue
    local name="$(basename "$item")"
    local dest="${target_base}/${name}"

    if [ "$DRY_RUN" = true ]; then
      echo -e "  ${YELLOW}[DRY RUN]${NC} Would install ${item_type} '${name}' -> ${dest} (${MODE})"
      continue
    fi

    # Handle existing destination
    if [ -L "$dest" ] || [ -e "$dest" ]; then
      if [ "$FORCE" = true ]; then
        rm -rf "$dest"
      else
        echo -e "  ${YELLOW}[SKIP]${NC} Destination already exists: ${dest} (Use --force to overwrite)"
        continue
      fi
    fi

    if [ "$MODE" = "symlink" ]; then
      ln -s "$item" "$dest"
      echo -e "  ${GREEN}[LINKED]${NC} ${name} -> ${dest}"
    else
      cp -R "$item" "$dest"
      echo -e "  ${GREEN}[COPIED]${NC} ${name} -> ${dest}"
    fi
  done
}

# 1. Install Skills
install_items "${REPO_ROOT}/.agents/skills" "${GLOBAL_SKILLS_DIR}" "Skills"

# 2. Install Agents
install_items "${REPO_ROOT}/.agents/agents" "${GLOBAL_AGENTS_DIR}" "Agents"

# 3. Install Rules (if any exist)
install_items "${REPO_ROOT}/.agents/rules" "${GLOBAL_RULES_DIR}" "Rules"

echo -e "\n${BOLD}${GREEN}✔ Global configuration setup completed successfully!${NC}"
echo -e "All projects on this machine will now have access to these agents and skills."
