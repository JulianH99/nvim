require('neo-tree').setup({
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				filesystem = {
								filtered_items = {
												visible = true
								},
								follow_current_file = true,
				},
				buffers = {
						follow_current_file = true,
				},
				window = {
								position = 'right',
				},
				source_selector = {
						winbar = true
				}
})
