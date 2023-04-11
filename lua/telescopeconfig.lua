require('telescope').load_extension('projects')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', ':Telescope projects<cr>',  { silent = true, noremap = true })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})

