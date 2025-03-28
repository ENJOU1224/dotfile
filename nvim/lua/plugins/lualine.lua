return{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local custom_gruvbox = require'lualine.themes.gruvbox'
    -- Change the background of lualine_c section for normal mode
    custom_gruvbox.normal.c.bg = '#555533'
    local lualine = require'lualine'
      lualine.setup{
        options = { theme = 'gruvbox'},
      }
  end
}
