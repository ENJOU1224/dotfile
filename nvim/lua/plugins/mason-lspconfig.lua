return{
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "clangd", "bashls", "markdown_oxide", "pyright", "svlangserver"},
			}
		end
	}
}
