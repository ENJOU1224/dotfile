return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt", "java" },

  opts = function()
    local config = require("metals").bare_config()
    config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    config.on_attach = require("config.lsp_settings").on_attach
    return config
  end,

  config = function(plugin, config)
    local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = plugin.ft,
      group = group,
      callback = function()
        require("metals").initialize_or_attach(config)
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = group,
      pattern = "*.scala",
      callback = function(args)
        if #vim.lsp.get_clients({
          bufnr = args.buf,
          name = "metals",
        }) == 0 then
          vim.api.nvim_buf_call(args.buf, function()
            require("metals").initialize_or_attach(config)
          end)
        end
      end,
    })
  end,
}
