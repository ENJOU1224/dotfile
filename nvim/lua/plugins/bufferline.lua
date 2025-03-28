return{
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function ()
    local bufferline = require('bufferline')
    bufferline.setup{
      options = {
        mode = "tabs", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
        indicator = {
            style = 'underline',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        offsets = { -- 为其他插件腾出空间（如文件树）
          {
            filetype = "NvimTree",
            text = "文件管理器",
            text_align = "left",
            separator = true
          }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        custom_filter = function(buf_number)
          return vim.bo[buf_number].filetype ~= "NvimTree"
        end,
        get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thick",  -- 可选值：slant/slope/thick/thin 或自定义分隔符对 { '▎', '▎' }
      }
    }
  end
}
