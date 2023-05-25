require('nvim-treesitter.configs').setup {
	ensure_installed = { 'python', 'typescript', 'json', 'tsx', 'html', 'css', 'javascript' },
	highlight = {
		enable = true
	},
	endwise = {
		enable = true,
	},
	autotag = {
		enable = true
	},
	indent = {
		enable = true
	}
}

