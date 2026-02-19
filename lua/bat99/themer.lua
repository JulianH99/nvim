local lualine_config = require("bat99.lualine_config")
local themes = {
  "kanagawa-dragon",
  "gruvbox-material",
  "everforest",
  "tundra",
  "catppuccin",
}

local M = {
  -- this is the default colorscheme applied to gruvbox-material
  default_colors = {
    bg = "#282828",
    bg_inactive = "#504945",

    fg = "#ebdbb2",
    fg_inactive = "#a89984",

    -- colors
    yellow = "#fabd2f",
    red = "#fb4934",
    green = "#b8bb26",
    blue = "#83a598",
    purple = "#d3869b",
    aqua = "#8ec97c",
  },
}

function M.configure_lualine(colors)
  local lualine = require("lualine")
  local config = lualine_config.get_config(colors)
  lualine.setup(config)
end

function M.pick_random_colorscheme()
  math.randomseed(os.time())
  math.random()
  local random_index = math.random(1, #themes)
  local chosen_color = themes[random_index]

  vim.cmd("colorscheme " .. chosen_color)

  local palette = M.get_palette_from_colorscheme(chosen_color)
  M.configure_lualine(palette)
end

function M.get_palette_from_colorscheme(colorscheme)
  if colorscheme == "kanagawa-dragon" then
    local kanagawa_theme = require("kanagawa.colors").setup({ theme = "dragon" })
    local palette = kanagawa_theme.palette
    local meta_colors = {
      -- lualine regions
      bg = palette.sumiInk0,
      bg_inactive = palette.sumiInk2,

      fg = palette.fujiWhite,
      fg_inactive = palette.oldWhite,

      -- colors
      yellow = palette.carpYellow,
      red = palette.peachRed,
      green = palette.springGreen,
      blue = palette.lightBlue,
      purple = palette.sakuraPink,
      aqua = palette.lightBlue,
    }

    return meta_colors
  elseif colorscheme == "catppuccin" then
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    local meta_colors = {
      -- lualine regions
      bg = mocha.base,
      bg_inactive = mocha.mantle,

      fg = mocha.text,
      fg_inactive = mocha.overlay0,

      -- colors
      yellow = mocha.yellow,
      red = mocha.red,
      green = mocha.green,
      blue = mocha.blue,
      purple = mocha.pink,
      aqua = mocha.teal,
    }

    return meta_colors
  end

  return M.default_colors
end

return M
