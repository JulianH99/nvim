return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close folds" })

    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold" })

    require("ufo").setup({
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
        c = { "comment", "region" },
      },
      provider_selector = function(bufnr, ft, buft)
        return { "treesitter", "indent" }
      end,
    })
  end,
}
