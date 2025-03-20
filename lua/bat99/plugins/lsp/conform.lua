return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "eslint_d" },
        astro = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        css = { "prettierd" },
        scss = { "prettierd" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        go = { "gofmt", "goimports", "gofumpt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
