return {
  "olimorris/persisted.nvim",
  config = function()
    require("persisted").setup({
      autoload = false,
      autosave = true,
      use_git_branch = true,
    })
  end,
}
