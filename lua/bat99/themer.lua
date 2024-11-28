local lualine_config = require("bat99.lualine_config")
local themes = {
  "kanagawa-dragon",
  "gruvbox-material",
  "everforest",
  "evergarden",
  "monokai",
  "monokai_pro",
  "alduin",
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
  elseif colorscheme == "rose-pine" then
    local rose_pine = require("rose-pine.palette")

    local meta_colors = {
      -- lualine regions
      bg = rose_pine.base,
      bg_inactive = rose_pine.muted,

      fg = rose_pine.text,
      fg_inactive = rose_pine.highlight_med,

      -- colors
      yellow = rose_pine.gold,
      red = rose_pine.love,
      green = rose_pine.pine,
      blue = rose_pine.foam,
      purple = rose_pine.iris,
      aqua = rose_pine.Foam,
    }

    return meta_colors
  elseif colorscheme == "sonokai" then
    local meta_colors = {
      bg = "#2d2a2e",
      bg_inactive = "#3b383e",

      fg = "#e3e1e4",
      fg_inactive = "#848089",

      -- colors
      yellow = "#e5c463",
      red = "#ff6188",
      green = "#a9dc76",
      blue = "#78dce8",
      purple = "#ab9df2",
      aqua = "#46d9ff",
    }

    return meta_colors
  end

  return M.default_colors
end

return M
