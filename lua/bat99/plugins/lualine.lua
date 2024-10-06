local themer = require("bat99.themer")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  priority = 10000,
  dependencies = {
    {
      "echasnovski/mini.icons",
      opt = true,
    },
  },
  config = false,
}
