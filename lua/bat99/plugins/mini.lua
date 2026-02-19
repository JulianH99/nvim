return {
  {
    "echasnovski/mini.move",
    version = "*",
    event = { "BufReadPost", "BufNew" },
    config = true,
  },
  {
    "echasnovski/mini.ai",
    branch = "stable",
    config = true,
    event = { "BufReadPost", "BufNew" },
    opts = { n_lines = 500 },
  },
  {
    "echasnovski/mini.icons",
    version = "*",
    config = function()
      local miniIcons = require("mini.icons")
      miniIcons.setup()
      miniIcons.mock_nvim_web_devicons()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        n_lines = 50,
      })
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    version = "*",
    event = { "BufReadPost", "BufNew" },
    config = true,
  },
  {
    "echasnovski/mini.bracketed",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufReadPost", "BufNew" },
    config = true,
  },
  {
    "echasnovski/mini.notify",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-mini/mini.sessions",
    version = "*",
    config = function()
      require("mini.sessions").setup({})
      local write_as_cwd = function()
        local session_name = vim.fn.getcwd():gsub("/", "-")
        MiniSessions.write(session_name)
      end
      vim.keymap.set("n", "<Leader>ws", write_as_cwd)
    end,
  },
}
