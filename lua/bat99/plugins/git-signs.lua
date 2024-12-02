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
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Next change" })
        vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Prev change" })
      end,
    })
  end,
  event = "BufEnter",
}
