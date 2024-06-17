local themer = require("bat99.themer")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  priority = 10000,
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      opt = true,
    },
  },
  config = false,
}
