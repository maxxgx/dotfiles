return {
  -- Disable LSP document highlighting
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = false,
      },
    },
  },
  -- Disable Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = false,
      },
    },
  },
}
