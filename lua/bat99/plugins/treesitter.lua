return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
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
      },
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      endwise = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", "gohtml" },
    }

    require("treesitter-context").setup({
      enable = true,
      max_lines = 2,
      line_numbers = true,
      multiline_threshold = 20,
    })
  end,
}
