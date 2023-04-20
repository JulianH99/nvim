local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')


telescope.load_extension('projects')


vim.keymap.set('n', '<leader>ff', function() 
	builtin.find_files({ 	
		find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }, 
		previewer = false 
	}) end , {}
)	
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', ':Telescope projects<cr>',  { silent = true, noremap = true })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})


telescope.setup {
	theme = 'evil',
	defaults = {
		mappings = {
			n = {
				['<c-d>'] = actions.delete_buffer
			},
			i = {
				['<c-d>'] = actions.delete_buffer
			}
		}
	}
}
