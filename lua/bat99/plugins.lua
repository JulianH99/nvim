return {
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-context',
	'windwp/nvim-ts-autotag',
	'neovim/nvim-lspconfig',
	{ 'neoclide/coc.nvim', branch = 'release' },
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "nvim-telescope/telescope-project.nvim" },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 
			{
				'nvim-tree/nvim-web-devicons', opt = true
			} 
		}
	},
	{"akinsho/toggleterm.nvim", version = '*'},
	'f-person/git-blame.nvim',
	{'lewis6991/gitsigns.nvim', event = 'VeryLazy'},
	{'mattn/emmet-vim', event = "VeryLazy"},
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
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{ 'sainnhe/gruvbox-material' },
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	"lukas-reineke/indent-blankline.nvim",
	"tpope/vim-surround",
	{'nanozuki/tabby.nvim', event = "VeryLazy"},
	{ 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
	'nvim-telescope/telescope-ui-select.nvim',
	{ 'echasnovski/mini.ai', branch = 'stable' },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	"folke/flash.nvim",
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
	}
}
