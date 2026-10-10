-- plugins/mason-lspconfig.lua
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = {
    exclude = { "metals" },
  },
  },
  dependencies = { 
    {"mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig" 
  },
}
