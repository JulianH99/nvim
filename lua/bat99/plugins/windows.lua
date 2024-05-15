return {
  "anuvyklack/windows.nvim",
  dependencies = "anuvyklack/middleclass",
  event = { "WinEnter", "WinNew" },
  config = function()
    require("windows").setup()
  end,
}
