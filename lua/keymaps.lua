local map = vim.keymap.set
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


map('n', [[<c-\>]], [[<c-\>i]], { noremap = true })

map({'n', 'v'}, '<leader>y', [["+y]], {})
map('n', '<leader>Y', [["+Y]], {})


map({"n", "v"}, "<leader>d", [["_d]], {})


map({"i", "n", "v"}, "<PageUp>", "<nop>")
map({"i", "n", "v"}, "<PageDown>", "<nop>")


map('n', '<tab>', '<cmd>bnext<cr>', {})
map('n', '<s-tab>', '<cmd>bprevious<cr>', {})
