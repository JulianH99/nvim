local filetypes = {
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
    'xml',
    'php',
    'markdown',
    'astro', 'glimmer', 'handlebars', 'hbs', 'liquid'
}
require('nvim-treesitter.configs').setup {
	ensure_installed = { 'python', 'typescript', 'json', 'tsx', 'html', 'css', 'javascript', 'lua', 'go' },
	highlight = {
		enable = true
	},
	endwise = {
		enable = true,
	},
	autotag = {
		enable = true,
		filetypes = filetypes
	},
	indent = {
		enable = true
	}
}

