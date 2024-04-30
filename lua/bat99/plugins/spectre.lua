return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>es" },
    { "<leader>esw" },
  },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>es", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
    keymap.set("n", "<leader>esw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      desc = "Search current word",
    })
    keymap.set("v", "<leader>esw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "Search current word",
    })
    keymap.set("n", "<leader>esc", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = "Search on current file",
    })
  end,
}
