-- plugins/none-ls.lua
return { 
  "nvimtools/none-ls.nvim",
  config = function() -- config 函数开始
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    local lsp_s = require("config.lsp_settings")

    null_ls.setup({ -- null_ls.setup 表开始
      sources = {
        formatting.stylua.with({ filetypes = { "lua" } }),
        formatting.shfmt.with({ filetypes = { "sh", "bash", "zsh" } }),
        formatting.clang_format.with({ filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" } }),
        diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
      }, -- sources 表结束
      on_attach = lsp_s.on_attach,
    }) 
  end, 
} 
