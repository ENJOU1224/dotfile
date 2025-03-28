return{
	"L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
    local ls = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump() -- 支持片段展开与占位符跳转[1](@ref)
      end
    end)
    -- 专用反向跳转键（如 Ctrl-k）
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end)

    --vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
    --vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end
}
