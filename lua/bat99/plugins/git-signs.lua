return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        -- add = { text = "+" },
        -- change = { text = "~" },
        -- delete = { text = "_" },
        -- topdelete = { text = "‾" },
        -- changedelete = { text = "~" },
      },
      on_attach = function()
        vim.keymap.set("n", "]c", [[<cmd>Gitsigns nav_hunk next<CR>]], { desc = "Next change" })
        vim.keymap.set("n", "[c", [[<cmd>Gitsigns nav_hunk prev<CR>]], { desc = "Prev change" })

        vim.keymap.set("n", "<leader>gbg", "[[<cmd>Gitsigns blame<CR>]]", { desc = "Open git blame" })
        vim.keymap.set("n", "<leader>gbl", "[[<cmd>Gitsigns blame_line<CR>]]", { desc = "Blame line" })
        vim.keymap.set("n", "<leader>gbv", "[[<cmd>Gitsigns toggle_current_line_blame<CR>]]", { desc = "Blame line" })

        vim.keymap.set("n", "<leader>gph", "[[<cmd>Gitsigns preview_hunk<CR>]]", { desc = "Preview hunk" })
      end,
    })
  end,
  event = "BufEnter",
}
