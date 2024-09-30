local home = os.getenv("USERPROFILE")

if vim.loop.os_uname().sysname == "Linux" then
  home = os.getenv("HOME")
end

vim.g.netrw_liststyle = 3

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.editorconfig = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd("set textwidth=80")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.inccommand = "split"

vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.title = true
vim.opt.titlestring = vim.loop.cwd()

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.listchars:append({
  eol = "↵",
  tab = "» ",
  trail = "·",
  nbsp = "␣",
})

vim.opt.fillchars = { eob = " " }
vim.opt.list = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

vim.opt.backspace = "indent,eol,start"

vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false
vim.opt.clipboard = "unnamedplus"
