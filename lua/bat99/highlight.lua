local colors = require("bat99.colors")

local diagnostic_colors = {
	DiagnosticError = colors.red,
	DiagnosticWarn = colors.yellow,
	DiagnosticInfo = colors.blue,
	DiagnosticHint = colors.aqua,
	DaignosticOk = colors.green,
}

for diagnostic, color in pairs(diagnostic_colors) do
	vim.api.nvim_set_hl(0, diagnostic, { fg = color })
end
