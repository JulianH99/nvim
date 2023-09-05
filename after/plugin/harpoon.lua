local ok, harpoon = pcall(require, 'harpoon')

if ok then
	local mark = require('harpoon.mark')
	local ui = require('harpoon.ui')

	local map = vim.keymap.set
	local options = { noremap = true, silent = true }

	map('n', '<leader>ha', mark.add_file, options)
	map('n', '<C-e>', ui.toggle_quick_menu, options)


	map('n', '<leader>hq', function() ui.nav_file(1) end, options)
	map('n', '<leader>hw', function() ui.nav_file(2) end, options)
	map('n', '<leader>he', function() ui.nav_file(3) end, options)
	map('n', '<leader>hr', function() ui.nav_file(4) end, options)
end

