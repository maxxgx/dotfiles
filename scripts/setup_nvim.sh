#!/usr/bin/env bash
set -euo pipefail

REPO_DIR=${DOTFILES_NVIM_DIR:-"$(cd "$(dirname "$0")/.." && pwd)/nvim"}
TARGET_DIR=${NVIM_CONFIG_DIR:-"$HOME/.config/nvim"}
FORCE=0

usage() {
  cat <<USAGE
Usage: $(basename "$0") [--force]

Creates a symlink from the tracked nvim config in this repo to
$TARGET_DIR.

Options:
  --force    Remove an existing target before linking.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
end

if [ ! -d "$REPO_DIR" ]; then
  echo "Expected LazyVim config at $REPO_DIR" >&2
  exit 1
fi

if [ -e "$TARGET_DIR" ] || [ -L "$TARGET_DIR" ]; then
  if [ $FORCE -eq 1 ]; then
    rm -rf "$TARGET_DIR"
  else
    echo "$TARGET_DIR already exists. Use --force to replace it." >&2
    exit 1
  fi
fi

ln -s "$REPO_DIR" "$TARGET_DIR"
echo "Linked $TARGET_DIR -> $REPO_DIR"
