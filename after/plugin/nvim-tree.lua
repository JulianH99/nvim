require('nvim-tree').setup({
	respect_buf_cwd = true,
  sync_root_with_cwd = true,
	filters = {
		dotfiles = false,
		custom = { "__pycache__" },
		exclude = {".env"}
	},
	view = {
		side = "right",
	},
	modified = {
		enable = true
	}
})

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)
