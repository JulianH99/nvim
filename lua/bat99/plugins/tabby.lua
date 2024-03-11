return {
  "nanozuki/tabby.nvim",
  event = "TabEnter",
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail", {
      nerdfont = false,
      buf_name = {
        mode = "relative",
      },
    })
  end,
}
