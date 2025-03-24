return{
	{
		"williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" }, -- 声明前置依赖
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "clangd", "bashls", "markdown_oxide", "pyright", "svlangserver"},
			}
		end
	}
}
