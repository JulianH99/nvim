return {
	"anuvyklack/windows.nvim",
	dependencies = "anuvyklack/middleclass",
	event = "BufReadPre",
	config = function()
		require("windows").setup()
	end,
}
