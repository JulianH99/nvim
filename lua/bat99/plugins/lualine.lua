return  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 
    {
      'nvim-tree/nvim-web-devicons', opt = true
    } 
  },
  config = function()
    local lualine = require('lualine')

    lualine.setup {
      options = {
        theme = 'gruvbox-material',
        component_separators = { left = "|", right = "|"},
        section_separators = {left = "", right = ""},
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = ''} },
        },
        lualine_b = {
          { 'filetype', separator = { }, icon_only = true, icon = { align = 'right' } },
          { 'filename',  path = 1, separator = { right  = ""} }
        },
        lualine_c = {
          {'diff', separator = { right = ''}},
          {'diagnostics'}
        },
        lualine_x = {
          {'encoding'},
          {'fileformat'},
          {'searchcount'},
          {'selectioncount'}
        },
        lualine_y = {
          { 'branch', separator = { left = '', right = ''} }
        }
      },
    }
  end
}
