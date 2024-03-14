return {
  "mbbill/undotree",
  keys = { { "<leader>u" } },
  config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  end,
}
