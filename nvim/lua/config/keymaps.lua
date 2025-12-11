-- -- define common options
local M = {}

local function get_buf_map_opts(bufnr, desc_text)
  return { noremap = true, silent = true, buffer = bufnr, desc = desc_text }
end

local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.keymap.set
vim.g.mapleader = '\\'

-- 关闭的快捷键
map('n', '<c-q>', ':close<cr>', opts)

-- nvim-tree的快捷键
map('n', '<c-n>', ':NvimTreeToggle<cr>', opts)

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

-- 分窗
map('n', '<leader>sv', '<c-w>v', opts)
map('n', '<leader>sh', '<c-w>s', opts)

-- 注释
map_buf('n', '<leader>cc', 'gcc', { remap = true, silent = true })      
map_buf('v', '<leader>cc', 'gc', { remap = true, silent = true })  

-- 函数：设置 LSP 相关的缓冲区本地快捷键
function M.setup_lsp_buffer_keymaps(bufnr, client_name, client_supports_formatting_flag)

  local map_buf = function(mode, lhs, rhs, desc_text)
      vim.keymap.set(mode, lhs, rhs, get_buf_map_opts(bufnr, desc_text))
  end

  map_buf('n', 'gd', vim.lsp.buf.definition, 'LSP Go to Definition')
  map_buf('n', 'K', vim.lsp.buf.hover, 'LSP Hover Documentation')
  map_buf('n', '<leader>vd', vim.lsp.buf.type_definition, 'LSP View Type Definition')
  map_buf('n', '<leader>rn', vim.lsp.buf.rename, 'LSP Rename Symbol')
  map_buf('n', '<leader>ca', vim.lsp.buf.code_action, 'LSP Code Actions')
  map_buf('n', 'gr', vim.lsp.buf.references, 'LSP Go to References')

  if client_supports_formatting_flag then
    map_buf({'n', 'v'}, '<leader>f', function() vim.lsp.buf.format({ bufnr = bufnr, async = true }) end, 'LSP Format (File/Selection)')
  end
end

return M
