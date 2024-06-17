return {
  dir = vim.fn.stdpath("config") .. "\\chameleon",
  dependencies = { "nvim-lualine/lualine.nvim" },
  config = function()
    require("chameleon").setup()
  end,
}
