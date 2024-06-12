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

require("bat99.set")

require("lazy").setup({
  { import = "bat99/plugins" },
  { import = "bat99/plugins/lsp" },
  { import = "bat99/plugins/themes" },
}, {
  change_detection = {
    notify = false,
  },
})
require("bat99.keymaps")
require("bat99.commands")

-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme evergarden")

require("bat99.highlight")

-- put transparent background
-- vim.cmd([[highlight Normal guibg=none]])
-- vim.cmd([[highlight NonText guibg=none]])
--
-- set random colorscheme
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_foreground = "original"

local colorschemes = { "kanagawa-dragon", "gruvbox-material", "rose-pine" }
math.randomseed(os.time())
math.random()
local random_index = math.random(1, #colorschemes)

vim.cmd("colorscheme " .. colorschemes[random_index])
