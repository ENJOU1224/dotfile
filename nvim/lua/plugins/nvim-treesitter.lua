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
}
