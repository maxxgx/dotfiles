# Dotfiles

Personal configuration files managed in a Git repo for easy syncing across
machines.

## Contents

- `nvim/`: LazyVim/Neovim configuration (tracks `init.lua`, `lua/`, and
  `lazy-lock.json` for reproducible plugins)

## Initial setup on a new machine

1. Clone this repo somewhere convenient (e.g. `~/dotfiles`).
2. Back up any existing `~/.config/nvim` directory if you care about it.
3. Create a symlink so Neovim reads the tracked config:
   `ln -s ~/dotfiles/nvim ~/.config/nvim`.
4. Launch `nvim` once; LazyVim will install plugins based on `lazy-lock.json`.

Keep secrets (API keys, tokens, etc.) out of the repo—reference them via
environment variables or external files ignored by Git.

