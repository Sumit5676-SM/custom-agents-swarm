#!/usr/bin/env bash
# ==============================================================================
# install-project.sh
# Scaffolds or links custom agent swarms into a specific target project.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# ANSI color codes
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
BOLD="\033[1m"
NC="\033[0m"

print_help() {
  cat << EOF
Usage: $(basename "$0") <TARGET_PROJECT_PATH> [OPTIONS]

Installs .agents (agents & skills) into a target project repository.

Arguments:
  TARGET_PROJECT_PATH   Path to the destination project directory

Options:
  -c, --copy        Copy files into the project (Default: ensures project has standalone files)
  -s, --symlink     Symlink .agents directory into the project
  -f, --force       Overwrite existing .agents directory in target
  -h, --help        Show this help message

Examples:
  ./scripts/install-project.sh ~/Projects/my-new-app
  ./scripts/install-project.sh ../another-repo --symlink
EOF
}

if [ $# -eq 0 ]; then
  print_help
  exit 1
fi

TARGET_DIR=""
MODE="copy"
FORCE=false

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
    -h|--help)
      print_help
      exit 0
      ;;
    -*)
      echo -e "${RED}Error: Unknown option '$1'${NC}"
      print_help
      exit 1
      ;;
    *)
      if [ -z "$TARGET_DIR" ]; then
        TARGET_DIR="$1"
      else
        echo -e "${RED}Error: Unexpected argument '$1'${NC}"
        print_help
        exit 1
      fi
      shift
      ;;
  esac
done

if [ -z "$TARGET_DIR" ]; then
  echo -e "${RED}Error: Target project directory is required.${NC}"
  exit 1
fi

# Expand path
TARGET_DIR="$(cd "$(dirname "$TARGET_DIR")" 2>/dev/null && pwd)/$(basename "$TARGET_DIR")" || TARGET_DIR="$TARGET_DIR"

if [ ! -d "$TARGET_DIR" ]; then
  echo -e "${YELLOW}Target directory does not exist. Creating: ${TARGET_DIR}${NC}"
  mkdir -p "$TARGET_DIR"
fi

DEST_AGENTS_DIR="${TARGET_DIR}/.agents"

echo -e "${BOLD}${BLUE}=== Installing Swarm to Target Project ===${NC}"
echo -e "Source: ${REPO_ROOT}/.agents"
echo -e "Target: ${DEST_AGENTS_DIR}"
echo -e "Mode:   ${MODE}"
echo "--------------------------------------------------"

if [ -e "$DEST_AGENTS_DIR" ] || [ -L "$DEST_AGENTS_DIR" ]; then
  if [ "$FORCE" = true ]; then
    echo -e "${YELLOW}Removing existing ${DEST_AGENTS_DIR}...${NC}"
    rm -rf "$DEST_AGENTS_DIR"
  else
    echo -e "${RED}Error: ${DEST_AGENTS_DIR} already exists in target. Use --force to overwrite.${NC}"
    exit 1
  fi
fi

if [ "$MODE" = "symlink" ]; then
  ln -s "${REPO_ROOT}/.agents" "$DEST_AGENTS_DIR"
  echo -e "${GREEN}✔ Symlinked .agents into ${TARGET_DIR}${NC}"
else
  cp -R "${REPO_ROOT}/.agents" "$DEST_AGENTS_DIR"
  echo -e "${GREEN}✔ Copied .agents into ${TARGET_DIR}${NC}"
fi

echo -e "\n${BOLD}${GREEN}✔ Successfully installed custom agents & skills into target project!${NC}"
