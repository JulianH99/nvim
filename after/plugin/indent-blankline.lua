vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2A2A37 gui=nocombine]]

require('indent_blankline').setup {
	-- show_current_context = true,
	-- show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1"	
	}
}
