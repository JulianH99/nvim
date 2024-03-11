return {
  "echasnovski/mini.surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      n_lines = 50,
    })
  end,
}
