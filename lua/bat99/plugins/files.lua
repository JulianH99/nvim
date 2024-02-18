return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		local mini = require("mini.files")

		vim.keymap.set("n", "<leader>mf", mini.open)
	end,
	keys = { { "<leader>mf" } },
}
