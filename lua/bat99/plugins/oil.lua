return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-s>"] = false,
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
      },
    })

    vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Open parent directory" })
  end,
}
