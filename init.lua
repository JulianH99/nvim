local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("bat99/set")

require("lazy").setup("bat99/plugins")

require('bat99/keymaps')

-- vim.cmd('colorscheme kanagawa-dragon')
vim.cmd('colorscheme rose-pine')

-- put transparent background
-- vim.cmd [[highlight Normal guibg=none]]
-- vim.cmd [[highlight NonText guibg=none]]

vim.o.guifont = "RecMonoDuotone NF:h12"
