return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNew" },
  config = function()
    local augroup = vim.api.nvim_create_augroup("NvimLintAuGroup", { clear = true })

    require("lint").linters_by_ft = {
      go = { "golangcilint" },
      -- php = { "phpcs" },
      html = { "htmlhint" },
      -- css = { "stylelint" },
      -- scss = { "stylelint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = augroup,
      pattern = "*",
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
