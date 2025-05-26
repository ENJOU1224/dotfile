-- plugins/mason-lspconfig.lua
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local lsp_s = require("config.lsp_settings")
    local common_on_attach = lsp_s.on_attach           -- 获取通用的 on_attach
    local common_capabilities = lsp_s.capabilities     -- 获取通用的 capabilities

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd", "bashls", "markdown_oxide", "pyright", "svlangserver" },
      handlers = {
        -- 默认 handler: 应用于 ensure_installed 中所有未在下面明确指定的服务器
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = common_on_attach,
            capabilities = common_capabilities,
          })
        end,

        -- clangd 的特殊 handler
        ["clangd"] = function()
          local clangd_capabilities = vim.deepcopy(common_capabilities) -- 深拷贝
          if clangd_capabilities.textDocument then
            clangd_capabilities.textDocument.formatting = false
            clangd_capabilities.textDocument.rangeFormatting = false
            clangd_capabilities.textDocument.onTypeFormatting = false
          end

          -- **关键：实际调用 clangd.setup**
          require("lspconfig").clangd.setup({
            on_attach = common_on_attach,       -- 使用通用的 on_attach
            capabilities = clangd_capabilities, -- 使用修改后的 capabilities
            -- 你可以在这里添加其他特定于 clangd 的顶层设置 (cmd, root_dir, etc.)
          })
        end,

        -- 如果其他 LSP (例如 lua_ls) 也需要非常特殊的 settings，可以在这里添加它们的 handler
        -- 例如：
        -- ["lua_ls"] = function()
        --   require("lspconfig").lua_ls.setup({
        --     on_attach = common_on_attach,
        --     capabilities = common_capabilities,
        --     settings = {
        --       Lua = {
        --         diagnostics = { globals = { "vim" } },
        --       },
        --     },
        --   })
        -- end,
      }
    })
  end
}
