return{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function ()
    require('nvim-autopairs').setup()
    -- 如果使用 nvim-cmp，需要额外配置 cmp 来处理 autopairs 的行为
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
