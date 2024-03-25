return {
  "sainnhe/gruvbox-material",
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_foreground = "mix"
    vim.cmd("colorscheme gruvbox-material")
  end,
}
