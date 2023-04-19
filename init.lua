vim.g.mapleader = ' '
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set textwidth=80')
vim.cmd('set foldmethod=syntax')
-- vim.g.tokyodark_transparent_background = false
vim.cmd('colorscheme tokyonight-night')
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
vim.opt.undofile = true


vim.cmd [[packadd packer.nvim]]

require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'gpanders/editorconfig.nvim'}
  use 'folke/tokyonight.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
	use {
    "ahmedkhalf/project.nvim",
		config = function()
				require("project_nvim").setup {
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
						statusline = { 'packer', 'nvim-tree' } 
					}
				}
			}
		end
	}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			insert_mappings = true,
			persist_size = true,
			auto_scroll = true,
			direction = 'horizontal',
			shell = 'pwsh'
		})
	end}
	use 'f-person/git-blame.nvim'
	use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
	use 'mattn/emmet-vim'
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
			require"startup".setup({
				theme = 'evil'
			})
		end
	}
	use {
		"windwp/nvim-autopairs",
	}
	use 'tpope/vim-fugitive'
	use {'stevearc/dressing.nvim'}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use 'ThePrimeagen/harpoon'
	use("mbbill/undotree")
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
			require("nvim-tree").setup {}
		end
	}
end)



require('keymaps')

-- setup plugins
--
-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'html', 'css', 'json' },
	highlight = {
		enable = true
	},
	autotag = {
    enable = true,
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

-- configure autopair with coc
require('autopairconfig')

-- configurte lualine
require('luaconfig')


