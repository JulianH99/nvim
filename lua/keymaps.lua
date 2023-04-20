local map = vim.api.nvim_set_keymap
map('n', '<leader>bb', ':NeoTreeShowToggle<cr>' ,{ noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

map('n', '<leader>lg', ':Gtabedit :<cr>', { noremap = true, silent = true })

map('n', '<leader>bb', ':NvimTreeToggle<cr>', { noremap = true, silent =  true })

map('n', '<leader>gpm', ':Git push origin main<cr>', { noremap = true })
map('n', '<leader>gpp', ':Git pull origin main<cr>', { noremap = true })

map('n', '<c-d>', '<c-d>zz', { noremap = true })
map('n', '<c-u>', '<c-u>zz', { noremap = true })
