require('lualine').setup {
	options = {
		theme = 'kanagawa',
		disabled_filetypes = { 
			statusline = { 'packer', 'nvim-tree', 'undo-tree' } 
		},
		component_separators = { left = "|", right = "|"},
		section_separators = {left = "", right = ""},
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ 'mode' }
		},
		lualine_c = {}
	},
	winbar = {
		lualine_a = {
			{'%=', separator = {left = "", right = ""} },
			{
				'filename',
				path = 1,
				separator = { left = "", right = ""}
			},
			{
				'%=', separator = { left = "", right = "" }
			}
		}
	},
	inactive_winbar = {
		lualine_c = {
			'filename'
		}
	}
}
