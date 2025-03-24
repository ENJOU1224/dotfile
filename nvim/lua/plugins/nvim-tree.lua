return {
  "nvim-tree/nvim-tree.lua",
  event = "BufEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
