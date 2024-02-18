local colors = {
	bg = "#282828",
	bg_inactive = "#504945",

	fg = "#ebdbb2",
	fg_inactive = "#a89984",

	-- colors
	yellow = "#fabd2f",
	red = "#fb4934",
	green = "#b8bb26",
	blue = "#83a598",
	purple = "#d3869b",
	aqua = "#8ec97c",
}

local old_config = {
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" } },
		},
		lualine_b = {
			{
				function()
					return vim.fn.fnamemodify(vim.loop.cwd(), ":t")
				end,
			},
			{ "filetype", separator = {}, icon_only = true, icon = { align = "right" } },
			{ "filename", path = 1, separator = { right = "" } },
		},
		lualine_c = {
			{ "diff", separator = { right = "" } },
			{ "diagnostics" },
		},
		lualine_x = {
			{ "encoding" },
			{ "fileformat" },
			{ "searchcount" },
			{ "selectioncount" },
		},
		lualine_y = {
			{ "branch", separator = { left = "", right = "" } },
		},
	},
}

local config = {
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg_inactive, bg = colors.bg_inactive } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- filled later
		lualine_c = {},
		lualine_x = {},
	},
}

local function left(component, inactive)
	if not inactive then
		table.insert(config.sections.lualine_c, component)
	else
		table.insert(config.inactive_sections.lualine_c, component)
	end
end

local function right(component, inactive)
	if not inactive then
		table.insert(config.sections.lualine_x, component)
	else
		table.insert(config.inactive_sections.lualine_x, component)
	end
end

-- left components

left({
	-- "mode",
	function()
		local modes = {

			n = "NORM",
			i = "INS",
			v = "VIS",
			[""] = "NONE",
			V = "VIL",
			c = "CMD",

			no = "OP",
			nov = "OP",
			noV = "OP",

			s = "SEC",
			S = "SEL",

			ic = "INC",
			R = "REP",
			Rv = "VREP",

			cv = "VEX",
			r = "PROMPT",
			rm = "MPROMT",
			["r?"] = "CONFR",
			["!"] = "SHELL",
			t = "TERM",
		}
		return modes[vim.fn.mode()]
	end,
	color = function()
		local mode_color = {
			n = colors.green,
			i = colors.blue,
			v = colors.red,
			[""] = colors.green,
			V = colors.red,
			c = colors.yellow,

			no = colors.green,
			nov = colors.green,
			noV = colors.green,

			s = colors.purple,
			S = colors.purple,

			ic = colors.aqua,
			R = colors.purple,
			Rv = colors.purple,

			cv = colors.aqua,
			r = colors.purple,
			rm = colors.purple,
			["r?"] = colors.aqua,
			["!"] = colors.aqua,
			t = colors.fg,
		}

		return { fg = mode_color[vim.fn.mode()], gui = "bold" }
	end,
})

left({ "branch", color = { fg = colors.green } })

left({
	function()
		return "[" .. vim.bo.filetype .. "]"
	end,
	padding = 0,
	color = { fg = colors.aqua },
})

left({ "filename", path = 1, padding = 1, color = { fg = colors.blue } })
-- left({
-- 	function()
-- 		local filename = vim.fn.expand("%")
-- 		local filetype = vim.bo.filetype
--
-- 		return "{" .. filetype .. "}" .. " " .. filename
-- 	end,
-- 	color = { fg = colors.blue },
-- })

left({
	"diff",
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	symbols = { added = "+", modified = "~", removed = "-" },
})

-- right components
--

right({
	"diagnostics",
	symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.blue },
		hint = { fg = colors.aqua },
	},
})

right({
	function()
		return "[" .. vim.fn.fnamemodify(vim.loop.cwd(), ":t") .. "]"
	end,
	color = { fg = colors.blue, gui = "bold" },
})

right({
	"o:encoding",
	fmt = string.upper,
	color = { fg = colors.green },
})

right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false,
	color = { fg = colors.purple },
})

-- inactive components
--
left({
	"filename",
	path = 1,
}, true)

left({
	function()
		return "{" .. vim.bo.filetype .. "}"
	end,
}, true)

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
	},
	config = function()
		local lualine = require("lualine")

		lualine.setup(config)
	end,
}
