-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 当光标停留在某处时，自动在浮动窗口中打开诊断信息
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, {
			focus = false, -- 保持焦点在编辑窗口
			scope = "cursor", -- 只显示光标处的诊断
		})
	end,
})
