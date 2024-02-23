return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufEnter",
  config = function()
    local harpoon = require("harpoon")
    local set = vim.keymap.set
    local opts = { silent = true }

    harpoon:setup()

    -- Add to list
    opts.desc = "Add file to list"
    set("n", "<leader>a", function()
      harpoon:list():append()
    end, opts)

    -- show list
    opts.desc = "Show harpoon list"
    set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, opts)

    -- map access
    opts.desc = "Access files in harpoon list"

    set("n", "<leader>ha", function()
      harpoon:list():select(1)
    end, opts)
    set("n", "<leader>hr", function()
      harpoon:list():select(2)
    end, opts)
    set("n", "<leader>hs", function()
      harpoon:list():select(3)
    end, opts)
    set("n", "<leader>ht", function()
      harpoon:list():select(4)
    end, opts)
  end,
}
