return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  branch = "main",
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
    require("nvim-treesitter").install({
      "python",
      "typescript",
      "json",
      "tsx",
      "html",
      "css",
      "javascript",
      "lua",
      "go",
      "astro",
      "templ",
      "scss",
      "angular",
      "sql",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "<filetype>" },
      callback = function()
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    --[[ local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", "gohtml" },
    } ]]

    require("treesitter-context").setup({
      enable = true,
      max_lines = 2,
      line_numbers = true,
      multiline_threshold = 20,
    })
  end,
}
