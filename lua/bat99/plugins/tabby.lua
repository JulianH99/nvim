return {
  "nanozuki/tabby.nvim",
  event = "TabNew",
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail", {
      nerdfont = true,
      buf_name = {
        mode = "shorten",
      },
    })
  end,
}
