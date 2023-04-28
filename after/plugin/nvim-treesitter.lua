require('nvim-treesitter.configs').setup {
	ensure_installed = { 'python', 'typescript', 'json', 'tsx', 'html', 'css' },
	endwise = {
		enable = true,
	}
}

