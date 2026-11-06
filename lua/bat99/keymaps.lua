local map = vim.keymap.set

-- confort keymaps
map("n", "<c-a>", "gg<s-v>G", { noremap = true, desc = "Select all text" })
map("n", "<c-c>", "<esc>", { noremap = true, desc = "Escape" })

-- window focusing
map("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Go to right window" })

-- better centering when navigating up and down
map("n", "<c-d>", "<c-d>zz", { noremap = true, desc = "Center screen on down" })
map("n", "<c-u>", "<c-u>zz", { noremap = true, desc = "Center screen on up" })

-- center screen on n and N
map("n", "n", "nzz", { noremap = true, desc = "Center screen on n" })
map("n", "N", "Nzz", { noremap = true, desc = "Center screen on N" })

-- clipboard stuff
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste without overwriting register" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })
map("n", "<A-p>", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "x", "x", {})

-- i hate page up and down
map({ "i", "n", "v" }, "<PageUp>", "<nop>")
map({ "i", "n", "v" }, "<PageDown>", "<nop>")

-- utils
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer with LSP" })

-- undotree
map("n", "<leader>u", function()
  require("undotree").open()
end, { desc = "Toggle undo tree" })
