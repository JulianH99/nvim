local map = vim.keymap.set
map('n', '<leader>bb', ':NeoTreeShowToggle<cr>' ,{ noremap = true, silent = true })

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
map('n', '<leader>v', [["+p]], {})
map('c', '<c-v>', '<c-r>+', {})
map({"n", "v"}, "<leader>d", [["_d]], {})

-- i hate page up and down
map({"i", "n", "v"}, "<PageUp>", "<nop>")
map({"i", "n", "v"}, "<PageDown>", "<nop>")

-- easily change buffers
map('n', '<tab>', '<cmd>bnext<cr>', {})
map('n', '<s-tab>', '<cmd>bprevious<cr>', {})
