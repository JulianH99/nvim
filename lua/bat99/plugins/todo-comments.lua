-- example
-- TODO: example
-- FIX: example
-- HACK: example
-- PERF: example
-- NOTE: example
-- WARNING: example

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPre",
  opts = {},
  keys = {
    {
      "<leader>tt",
      "<cmd>TodoTrouble<cr>",
      desc = "View todo comments in trouble list",
    },
    {
      "]t",
      "<cmd>lua require('todo-comments').jump_next()<cr>",
    },
    {
      "[t",
      "<cmd>lua require('todo-comments').jump_prev()<cr>",
    },
  },
}
