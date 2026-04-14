return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        astro = { "prettierd" },
        typescript = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        go = { "gofmt", "goimports", "gofumpt" },
        templ = { "templ" },
        -- svelte = { "prettierd" },
        liquid = { nil },
        cs = { "csharpier" },
        htmlangular = { "prettierd" },

        -- FIXME: install dotnet?
        -- cs = { "csharpier" },
        -- csharp = { "csharpier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
