return{
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({})
    ts.install({
      "c", "lua", "vim", "python",
      "make", "verilog", "bash", "scala",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c", "lua", "vim", "python",
        "make", "verilog", "sh", "scala",
      },
      callback = function(args)
        -- 解析器尚未安装完成时跳过
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}

