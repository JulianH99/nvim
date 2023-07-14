require('lualine').setup {
	options = {
		theme = 'kanagawa',
		disabled_filetypes = { 
			statusline = { 'packer', 'nvim-tree', 'undo-tree', 'NvimTree'} 
		},
		component_separators = { left = "|", right = "|"},
		section_separators = {left = "", right = ""},
	},
	sections = {
		lualine_a = {
			{ 'mode' }
		},
		lualine_c = {
			{'%=', separator={right = ""}},
			{'filename', path = 1, separator = {left = ""}},
		}
	},
}
