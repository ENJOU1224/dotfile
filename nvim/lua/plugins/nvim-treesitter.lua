<<<<<<< HEAD
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
=======
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    -- main 告诉 lazy 这个插件的主模块名叫什么，lazy 会自动帮你 require
    main = "nvim-treesitter.configs",
    -- opts 里面的内容会自动传递给 setup() 函数
    opts = {
        ensure_installed = { "c", "lua", "vim", "python", "make", "verilog", "bash" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    }
>>>>>>> d5e3df9520f1cd1605f7bef4e3e80b6b7ed43d3b
}
