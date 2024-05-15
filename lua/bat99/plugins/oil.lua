return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = { "icon " },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-s>"] = false,
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
      },
    })

    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
  end,
}
