return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    triggers = {
      { "<leader>", mode = { "n", "v" } },
      { "[", mode = { "n" } },
      { "]", mode = { "n" } },
    },
    preset = "modern",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show which key keymaps",
    },
  },
}
