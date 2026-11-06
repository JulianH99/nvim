return {
  dir = "~/external/projects/personal/nvim-plugins/chameleon.nvim/",
  config = true,
  opts = {
    lualine = {
      {
        section = "x",
        component_index = 1,
        change = "bg",
      },
    },
  },
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      "nvim-lualine/lualine.nvim",
    },
  },
}
