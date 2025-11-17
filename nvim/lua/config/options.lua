-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set default indent to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.softtabstop = 4  -- Number of spaces that a <Tab> counts for while editing

-- Disable vim syntax highlighting (treesitter handles most highlighting now)
vim.cmd("syntax off")
