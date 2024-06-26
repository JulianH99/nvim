return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    nls.setup({
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.prettierd.with({
          filetypes = {
            "astro",
            "javascript",
            "typescript",
            "css",
            "scss",
            "sass",
            "javascriptreact",
            "typescriptreact",
          },
        }),
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.djlint,
        nls.builtins.formatting.phpcsfixer,

        nls.builtins.diagnostics.phpcs,
        nls.builtins.diagnostics.golangci_lint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              if vim.bo.filetype ~= "templ" then
                vim.lsp.buf.format({
                  filter = function(c)
                    return c.name == "null-ls"
                  end,
                })
              end
            end,
          })
        end
      end,
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
