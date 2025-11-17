#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR=${NVIM_CONFIG_DIR:-"$HOME/.config/nvim"}
BACKUP_ROOT=${NVIM_BACKUP_ROOT:-"$HOME/.local/backups"}
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
DEST="$BACKUP_ROOT/nvim-$TIMESTAMP"

mkdir -p "$BACKUP_ROOT"

if [ ! -e "$CONFIG_DIR" ] && [ ! -L "$CONFIG_DIR" ]; then
  echo "No Neovim config found at $CONFIG_DIR; nothing to back up." >&2
  exit 0
fi

cp -a "$CONFIG_DIR" "$DEST"
echo "Backed up $CONFIG_DIR to $DEST"
