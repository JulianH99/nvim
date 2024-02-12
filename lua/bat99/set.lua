vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.cmd("set textwidth=80")
vim.cmd("set foldmethod=syntax")

vim.opt.autoindent = true
vim.opt.smartindent = true

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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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
	tab = "  ",
})
vim.opt.list = true

vim.api.nvim_create_user_command("W", function()
	vim.cmd([[noa w]])
end, {})

-- move to another file later

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.html",
	callback = function()
		local manage_path = vim.fs.normalize(vim.loop.cwd() .. "/manage.py")
		print(manage_path)

		if vim.fn.filereadable(manage_path) == 1 then
			vim.cmd("set ft=htmldjango")
		end
	end,
})
