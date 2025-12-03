return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_insalled = {
        "stylua",
        "prettierd",
        "eslint_d",
        "gofmt",
        "goimports",
        "gofumpt",
        "golangci_lint",
        "phpcs",
        "htmlhint",
      },
      integrations = {
        ["mason-lspconfig"] = true,
      },
    })
  end,
}
