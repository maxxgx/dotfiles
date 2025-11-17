# Dotfiles

Personal configuration files managed in a Git repo for easy syncing across
machines.

## Contents

- `nvim/`: LazyVim/Neovim configuration (tracks `init.lua`, `lua/`, and
  `lazy-lock.json` for reproducible plugins)
- `scripts/`: helper Bash scripts for backing up a local config and creating
  symlinks to this repo

## Initial setup on a new machine

1. Clone this repo somewhere convenient (e.g. `~/dotfiles`).
2. Back up any existing `~/.config/nvim` directory if you care about it.
3. Create a symlink so Neovim reads the tracked config:
   `ln -s ~/dotfiles/nvim ~/.config/nvim`.
4. Launch `nvim` once; LazyVim will install plugins based on `lazy-lock.json`.

## Migrating an existing setup

If you already have a customized `~/.config/nvim`, back it up and relink:

```
mv ~/.config/nvim ~/.config/nvim.backup
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Open `nvim` so LazyVim re-installs plugins as needed.

Keep secrets (API keys, tokens, etc.) out of the repo—reference them via
environment variables or external files ignored by Git.

## Helper scripts

Run these from the repo root (or add `~/dotfiles/scripts` to your `PATH`):

- `scripts/backup_nvim.sh` copies the current `~/.config/nvim` into
  `~/.local/backups/nvim-<timestamp>`. Override paths with
  `NVIM_CONFIG_DIR` or `NVIM_BACKUP_ROOT`.
- `scripts/setup_nvim.sh [--force]` creates (or replaces with `--force`) the
  `~/.config/nvim` symlink pointing at `~/dotfiles/nvim`. Override paths with
  `DOTFILES_NVIM_DIR` or `NVIM_CONFIG_DIR`.

