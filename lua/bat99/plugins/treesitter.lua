return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
			"liquid",
		}
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"python",
				"typescript",
				"json",
				"tsx",
				"html",
				"css",
				"javascript",
				"lua",
				"go",
				"astro",
				"templ",
			},
			highlight = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
			autotag = {
				enable = true,
				filetypes = filetypes,
			},
			indent = {
				enable = true,
			},
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.gotmpl = {
			install_info = {
				url = "https://github.com/ngalaiko/tree-sitter-go-template",
				files = { "src/parser.c" },
			},
			filetype = "gotmpl",
			used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", "gohtml" },
		}
	end,
}
