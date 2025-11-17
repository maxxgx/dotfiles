-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle syntax highlighting
-- Store state in a variable to track current highlighting status
local syntax_enabled = false

vim.keymap.set("n", "<leader>ts", function()
  syntax_enabled = not syntax_enabled
  
  -- Toggle vim syntax (always works)
  if syntax_enabled then
    vim.cmd("syntax on")
  else
    vim.cmd("syntax off")
  end
  
  -- Toggle Treesitter highlighting using API (safely)
  local ts_configs_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
  if ts_configs_ok then
    local highlight_module = ts_configs.get_module("highlight")
    if highlight_module then
      highlight_module.enable = syntax_enabled
    end
  end
  
  -- Try Treesitter highlight module directly (safely)
  local ts_highlight_ok, ts_highlight = pcall(require, "nvim-treesitter.highlight")
  if ts_highlight_ok then
    local buf = vim.api.nvim_get_current_buf()
    if syntax_enabled then
      pcall(ts_highlight.attach, buf)
    else
      pcall(ts_highlight.detach, buf)
    end
  end
  
  vim.notify("Syntax highlighting: " .. (syntax_enabled and "ON" or "OFF"), vim.log.levels.INFO)
end, { desc = "Toggle Syntax Highlighting" })
