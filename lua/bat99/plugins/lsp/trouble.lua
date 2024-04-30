return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local opts = { noremap = true, silent = true }

    local keymap = vim.keymap.set

    keymap("n", "<leader>tt", "<cmd>TroubleToggle<cr>", opts)
    keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
    keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", opts)
    keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", opts)
    keymap("n", "<leader>ti", "<cmd>Trouble lsp_implementations<cr>", opts)

    require("trouble").setup()
  end,
}
