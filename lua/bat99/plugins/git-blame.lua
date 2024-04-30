return {
  "f-person/git-blame.nvim",
  config = function()
    vim.keymap.set("n", "<leader>gbe", "<cmd>GitBlameEnable<cr>", {})
    vim.keymap.set("n", "<leader>gbd", "<cmd>GitBlameDisable<cr>", {})
    vim.cmd([[GitBlameDisable]])
  end,
  cmd = "GitBlameEnable",
}
