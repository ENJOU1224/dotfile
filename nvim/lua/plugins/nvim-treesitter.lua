return{
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "python", "make", "verilog"},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
          })
      end
}

-- return{
-- 	{
--     "nvim-treesitter/nvim-treesitter",
--     build = function()
--         require("nvim-treesitter.install").update({ with_sync = true })()
--     end,
-- 	}
-- }
