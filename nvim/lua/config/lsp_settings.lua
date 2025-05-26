-- lua/config/lsp_settings.lua
local M = {}
local keymaps_config = require("config.keymaps")

function M.on_attach(client, bufnr)
  local client_can_format = client.supports_method("textDocument/formatting") or client.supports_method("textDocument/rangeFormatting")

  -- 调用 keymap 模块的函数来设置快捷键
  if type(keymaps_config.setup_lsp_buffer_keymaps) == "function" then
    keymaps_config.setup_lsp_buffer_keymaps(bufnr, client.name, client_can_format)
  end
end

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M
