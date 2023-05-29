local map = vim.keymap.set

-- confort keymaps
map('n', '<c-a>', 'gg<s-v>G', { noremap = true })
map('t', '<ESC>', '<c-\\><c-n>', { noremap = true })
map('n', '<c-c>', '<esc>', { noremap = true })

-- window focusing
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- git diff view plugin keymaps
map('n', '<leader>dfo', ':DiffviewOpen<cr>', { noremap = true, silent = true })
map('n', '<leader>dfc', ':DiffviewClose<cr>', { noremap = true, silent = true })
map('n', '<leader>dfh', ':DiffviewFileHistory<cr>', { noremap = true, silent = true })


map('n', '<leader>b', ':NvimTreeToggle<cr>', { noremap = true, silent =  true })

-- better centering when navigating up and down
map('n', '<c-d>', '<c-d>zz', { noremap = true })
map('n', '<c-u>', '<c-u>zz', { noremap = true })

-- clipboard stuff
map({'n', 'v'}, '<leader>y', [["+y]], {})
map('n', '<leader>Y', [["+Y]], {})
map('n', '<A-p>', [["+p]], {})
map('c', '<c-v>', '<c-r>+', {})
map({"n", "v"}, "<leader>d", [["_d]], {})

-- i hate page up and down
map({"i", "n", "v"}, "<PageUp>", "<nop>")
map({"i", "n", "v"}, "<PageDown>", "<nop>")

-- easily change buffers
map('n', '<tab>', '<cmd>w<cr>', {})
map('n', '<s-tab>', '<cmd>noa w<cr>', {})
