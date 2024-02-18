return {
	"olimorris/persisted.nvim",
	config = function()
		require("persisted").setup({
			autoload = true,
			autosave = true,
		})
	end,
}
