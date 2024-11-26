-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.keymap.set

-- nvim-tree的快捷键
map('n', '<c-n>', ':nvimtreetoggle<cr>', opts)

-- 快捷切换窗口
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- 重复调整缩进
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- 行首行尾
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
map('n', 'dL', 'd$', opts)
map('n', 'yL', 'y$', opts)

-- 格式化
-- map('v', '<leader>f', '=', opts)

-- 分窗
map('n', '<leader>sv', '<c-w>v', opts)
map('n', '<leader>sh', '<c-w>s', opts)

