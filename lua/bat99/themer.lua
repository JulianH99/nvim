local lualine_config = require("bat99.lualine_config")
local themes = {
  "kanagawa-dragon",
  "gruvbox-material",
  "everforest",
  "evergarden",
  "tundra",
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
  elseif colorscheme == "night-owl" then
    local night_owl = require("night-owl.palette")
    local colors = {
      dark = "#010d18",
      light = "#d6deeb",
      magenta = "#c792ea",
      green = "#c5e478",
      yellow = "#e2b93d",
      red = night_owl.red,
      cyan = "#6ae9f0",
      purple = night_owl.purple,
      blue = night_owl.blue,
      dark_blue = "#0e293f",
      light_blue = "#5f7e97",
    }
    local meta_colors = {
      -- lualine regions
      bg = colors.dark,
      bg_inactive = colors.dark_blue,

      fg = colors.light,
      fg_inactive = colors.light_blue,

      -- colors
      yellow = colors.yellow,
      red = colors.red,
      green = colors.green,
      blue = colors.blue,
      purple = colors.purple,
      aqua = colors.cyan,
    }

    return meta_colors
  end

  return M.default_colors
end

return M
