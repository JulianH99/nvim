return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects'
		}
	},
	'nvim-treesitter/nvim-treesitter-context',
	'windwp/nvim-ts-autotag',
	'neovim/nvim-lspconfig',
	{ 'neoclide/coc.nvim', branch = 'release' },
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 
			{
				'nvim-tree/nvim-web-devicons', opt = true
			} 
		}
	},
	'f-person/git-blame.nvim',
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		'mattn/emmet-vim', 
		event = "VeryLazy",
		config = function()
			vim.g.user_emmet_install_global = 0
			vim.api.nvim_create_augroup("bat99", { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				command = "EmmetInstall",
				pattern = {"html" , "css","gotmpl","liquid","gohtml"},
				group = "bat99"
			})
		end
	},
	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = "doom",
				config = {
					header = {
						"",
						"",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠿⠟⠛⠿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡆⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠳⠄⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣢⣴⣦⣴⣪⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
						"⣿⣿⣿⣿⡿⠿⠟⠋⠁⠒⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠈⠙⠻⠿⠿⣿⣿⣿⣿",
						"⣿⠟⠉⠀⠀⠀⠀⠀⠀⢀⡰⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣦⡀⠀⠀⠀⠀⠈⠻⣿",
						"⣏⠀⠀⢀⣤⠆⠀⠀⠀⠤⢚⢩⣽⣿⣿⣿⣿⣿⣯⢅⡂⠈⠉⠀⠠⣀⡀⠀⠰⣹",
						"⣿⢀⣴⣿⣣⡄⠀⢀⡴⠊⠁⠀⠙⠿⠋⠉⠿⠛⠁⠀⠈⠢⡀⠀⠀⣈⣻⣷⣦⣿",
						"⣿⣿⣿⣿⣿⣾⣴⣯⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣬⣦⣼⣿⣿⣿⣿⣿",
						"",
						""
					},
					center = {
						{

							desc = "Projects",
							desc_hl = "string",
							key = "p",
							keymap = "SPC f p",
							key_hl = "number"
						}
					}
				}
			}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	"windwp/nvim-autopairs",
	{"mbbill/undotree", event = "VeryLazy"},
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	{ 'sainnhe/gruvbox-material' },
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"tpope/vim-surround",
	{'nanozuki/tabby.nvim', event = "VeryLazy"},
	'nvim-telescope/telescope-ui-select.nvim',
	{ 'echasnovski/mini.ai', branch = 'stable' },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy"
	},
	{ 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
	{ "anuvyklack/windows.nvim",
		dependencies = "anuvyklack/middleclass",
		event = "VeryLazy",
		config = function()
			require('windows').setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy"

	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
		event = "VeryLazy"
	}
}
