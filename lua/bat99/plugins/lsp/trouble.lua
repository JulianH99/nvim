return {
  "folke/trouble.nvim",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    {
      "<leader>tt",
      "<cmd>TodoTrouble<cr>",
      desc = "View todo comments in trouble list",
    },
    {
      "<leader>tw",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Workspace Diagnostics (trouble)",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
      desc = "Diagnostics (trouble)",
    },
    {
      "<leader>tr",
      "<cmd>Trouble lsp_references toggle focus=true<cr>",
      desc = "Lsp references",
    },
    {
      "<leader>ti",
      "<cmd>Trouble lsp_implementations toggle focus=true<cr>",
      desc = "Lsp implementations",
    },
  },
  config = true,
}
