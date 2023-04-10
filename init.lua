vim.g.mapleader = ' '
vim.cmd('set tabstop=2')


vim.cmd [[packadd packer.nvim]]

require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'gpanders/editorconfig.nvim'}
  use 'folke/tokyonight.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
	use {
    "ahmedkhalf/project.nvim",
    config = function()
    			require("project_nvim").setup {
			      -- your configuration comes here
			      -- or leave it empty to use the default settings
			      -- refer to the configuration section below
			}
		end
	}
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require'lualine'.setup {
				options = {
				  theme = 'tokyonight',
					disabled_filetypes = { 
						statusline = { 'packer', 'NvimTree' } 
					}
				}
			}
		end
	}
	use {
    'akinsho/bufferline.nvim', 
		tag = "v3.*", 
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			vim.opt.termguicolors = true
			require('bufferline').setup({
				options = {
					separator_style = "slope"
				}
			})
  end}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			insert_mappings = true,
			persist_size = true,
			auto_scroll = true,
			direction = 'horizontal'
		})
	end}
end)



require('keymaps')

-- vim.g.tokyodark_transparent_background = false
vim.cmd('colorscheme tokyonight-night')
vim.cmd('set number')



-- setup plugins
--
-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'html', 'css', 'json' },
	highlight = {
		enable = true
	}
}

-- lspconfig
--
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}


-- configure coc
require('cocsettings')


-- configure telescope
require('telescopeconfig')


-- configure neotree
require('neotreeconfig')
