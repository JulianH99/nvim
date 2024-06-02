return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  keys = { "<leader>gg" },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", {})
    require("neogit").setup({})
  end,
}
