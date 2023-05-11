local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local project = require('project_nvim')


project.setup({
	manual_mode = false,
	patterns = { ".git" },
	detection_methods = { "patterns" }
})

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
vim.keymap.set('n', '<leader>fr', builtin.git_files, { noremap =  true, silent = true })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

telescope.setup {
	theme = 'evil',

	pickers = {
		live_grep = {
			theme = 'dropdown',
			preview = true
		},
		find_files = {
			theme = 'dropdown',
			preview = false
		},
		buffers = {
			theme = 'dropdown',
			preview = false,
		},
		projects = { 
			theme = 'dropdown'
		},
		current_buffer_fuzzy_find = {
			theme = 'dropdown',
			preview = true
		},
		git_branches = {
			theme = 'dropdown'
		},
		git_files = {
			theme = 'dropdown',
			show_untracked = true,
		}
	},
	defaults = {
		preview = false,	
		mappings = {
			n = {
				['<c-d>'] = actions.delete_buffer
			},
			i = {
				['<c-d>'] = actions.delete_buffer
			}
		}
	},
	extensions = {
		project = {
			theme = 'dropdown',
			preview = false
		}
	}
}
