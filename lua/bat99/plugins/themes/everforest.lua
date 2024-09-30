return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      background = "hard",
      italics = true,
      diagnostic_line_highlight = true,
      inlay_hints_background = "dimmed",
      diagnostic_text_highlight = false,
    })
  end,
}
