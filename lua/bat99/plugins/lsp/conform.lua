return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
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
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
