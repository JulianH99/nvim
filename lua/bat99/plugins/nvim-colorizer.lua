return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPre",
  lazy = true,
  config = function()
    require("nvim-highlight-colors").setup({
      render = "virtual",
      virtual_symbol_position = "inline",
    })
  end,
}
