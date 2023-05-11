require('lualine').setup {
	options = {
		theme = 'kanagawa',
		disabled_filetypes = { 
			statusline = { 'packer', 'nvim-tree', 'undo-tree' } 
		},
		component_separators = '|',
		section_separators = { left = '', right = '' },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '', right = '' }, right_padding = 1,
			fmt = function(str) return str:sub(1,1) end }
		},
		lualine_c = {}
	},
	winbar = {
		lualine_a = {
			{
				'filename',
				path = 1
			}
		}
	},
	inactive_winbar = {
		lualine_a = {
			'filename'
		}
	}
}
