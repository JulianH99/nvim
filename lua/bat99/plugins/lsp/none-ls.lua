return {
	"nvimtools/none-ls.nvim",
	config = function()
		local nls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

		nls.setup({
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.autopep8,
				nls.builtins.formatting.prettier,
				nls.builtins.formatting.gofmt,
				nls.builtins.formatting.goimports,

				nls.builtins.diagnostics.eslint_d,

				nls.builtins.code_actions.refactoring,
				nls.builtins.code_actions.eslint_d,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
