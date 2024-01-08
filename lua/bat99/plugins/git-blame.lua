return {
  'f-person/git-blame.nvim',
  config = function()
    vim.cmd [[GitBlameDisable]]
  end,
  cmd = "GitBlameEnable"
}
