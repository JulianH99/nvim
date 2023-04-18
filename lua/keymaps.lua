local map = vim.api.nvim_set_keymap
map('n', '<leader>bb', ':NeoTreeShowToggle<cr>' ,{ noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

map('n', '<leader>lg', ':Git<cr>', { noremap = true, silent = true })


