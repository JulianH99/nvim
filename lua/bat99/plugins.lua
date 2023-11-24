return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects'
		},
		config = function()

			require('nvim-tree').setup({
				respect_buf_cwd = true,
				sync_root_with_cwd = true,
				filters = {
					dotfiles = false,
					custom = { "__pycache__" },
					exclude = {".env"}
				},
				view = {
					side = "right",
				},
				modified = {
					enable = true
				}
			})

		end
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
	{
		'f-person/git-blame.nvim',
		config = function()
			vim.cmd [[GitBlameDisable]]
		end,
		cmd = "GitBlameEnable"
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
		event = "BufReadPre"
	},
	{
		'mattn/emmet-vim', 
		event = "BufReadPre",
		config = function()
			vim.g.user_emmet_install_global = 1
			vim.api.nvim_create_augroup("bat99", { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				command = "EmmetInstall",
				pattern = {"html", "css", "gotmpl", "liquid", "gohtml"},
				group = "bat99"
			})
		end
	},
	{
		'echasnovski/mini.starter', 
		event = "VimEnter",
		version = false,
		config = function ()
			require('mini.starter').setup({
				header = [[ 
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠿⠟⠛⠿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡆⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠳⠄⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣢⣴⣦⣴⣪⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				⣿⣿⣿⣿⡿⠿⠟⠋⠁⠒⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠈⠙⠻⠿⠿⣿⣿⣿⣿
				⣿⠟⠉⠀⠀⠀⠀⠀⠀⢀⡰⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣦⡀⠀⠀⠀⠀⠈⠻⣿
				⣏⠀⠀⢀⣤⠆⠀⠀⠀⠤⢚⢩⣽⣿⣿⣿⣿⣿⣯⢅⡂⠈⠉⠀⠠⣀⡀⠀⠰⣹
				⣿⢀⣴⣿⣣⡄⠀⢀⡴⠊⠁⠀⠙⠿⠋⠉⠿⠛⠁⠀⠈⠢⡀⠀⠀⣈⣻⣷⣦⣿
				⣿⣿⣿⣿⣿⣾⣴⣯⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣬⣦⣼⣿⣿⣿⣿⣿
				]]
			})
		end
	},
	{
		"windwp/nvim-autopairs", 
		event = {"InsertEnter"},
		config = function()

			local remap = vim.api.nvim_set_keymap
			local npairs = require('nvim-autopairs')
			npairs.setup({map_cr=false, touch = true})

			-- skip it, if you use another global object
			_G.MUtils= {}

			-- old version
			-- MUtils.completion_confirm=function()
			-- if vim.fn["coc#pum#visible"]() ~= 0 then
			-- return vim.fn["coc#_select_confirm"]()
			-- else
			-- return npairs.autopairs_cr()
			-- end
			-- end

			-- new version for custom pum
			MUtils.completion_confirm=function()
				if vim.fn["coc#pum#visible"]() ~= 0  then
					return vim.fn["coc#pum#confirm"]()
				else
					return npairs.autopairs_cr()
				end
			end

			remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
		end
	},
	{
		"mbbill/undotree", 
		keys = {{ "<leader>u" }},
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end
	},
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	},
	{ 
		'sainnhe/gruvbox-material',
		config = function ()
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.cmd('colorscheme gruvbox-material')
		end
	},
	{
		'numToStr/Comment.nvim',
		event = {"BufReadPre", "BufRead"},
		config = function()
			require('Comment').setup()
		end
	},
	{ 
		"lukas-reineke/indent-blankline.nvim", 
		main = "ibl", 
		opts = {}, 
		event = "BufReadPre",
		config = function()
			local ok, blankline = pcall(require, 'ibl')
			if ok then
				blankline.setup { }
			end
		end
	},
	{ "tpope/vim-surround", event = "BufReadPre"},
	{
		'nanozuki/tabby.nvim', 
		event = "TabEnter",
		config = function()

			require('tabby.tabline').use_preset('tab_only', {
				nerdfont = true,
				buf_name = {
					mode = "relative"
				}
			})

		end
	},
	'nvim-telescope/telescope-ui-select.nvim',
	{ 'echasnovski/mini.ai', branch = 'stable', config = true, event = "BufReadPre" },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"folke/flash.nvim",
		event = "BufReadPre",
		config = function() 

			local flash = require('flash')

			local set = vim.keymap.set

			set({ "n", "x", "o" }, "<cr>", function() flash.jump({
				search = {
					mode = function(str)
						return "\\<" .. str
					end,
				},
			}) end, {})
			set("c", "<c-s>", function() flash.toggle() end, {})

		end
	},
	{ 
		'kevinhwang91/nvim-ufo', 
		dependencies = 'kevinhwang91/promise-async', 
		event = "BufReadPre",
		config = function() 

			vim.o.foldcolumn = '1' -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


			require('ufo').setup()
		end
	},
	{ "anuvyklack/windows.nvim",
		dependencies = "anuvyklack/middleclass",
		event = "BufReadPre",
		config = function()
			require('windows').setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		keys = {
			{ "<leader>es" }
		},
		config = function()
			local keymap = vim.keymap

			keymap.set('n', '<leader>es', '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre"
			})
			keymap.set('n', '<leader>esw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
				desc = "Search current word"
			})
			keymap.set('v', '<leader>esw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word"
			})
			keymap.set('n', '<leader>esc', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
				desc = "Search on current file"
			})
		end

	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		cmd = "ZenMode"
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
		event = "VeryLazy"
	}
}
