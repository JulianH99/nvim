return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup()

		require("kanagawa").load("dragon")
	end,
}
