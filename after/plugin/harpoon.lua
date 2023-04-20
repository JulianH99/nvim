local mark = require('harpoon.mark')
local ui = require('harpoon.ui')



vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<c-n>', function() ui.nav_next() end, { noremap = true })
vim.keymap.set('n', '<c-m>', function() ui.nav_prev() end, { noremap = true })
