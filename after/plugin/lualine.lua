require('lualine').setup {
	options = {
		theme = 'kanagawa',
		disabled_filetypes = { 
			statusline = { 'packer', 'nvim-tree' } 
		},
		component_separators = '|',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_c = {
			{
				'filename',
				path = 1
			}
		}
	}
}
