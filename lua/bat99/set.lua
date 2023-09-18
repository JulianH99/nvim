vim.g.mapleader = ' '
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set textwidth=80')
vim.cmd('set foldmethod=syntax')
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.title = true
vim.opt.titlestring = vim.loop.cwd()