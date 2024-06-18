return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.load_extension("ui-select")

    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
        previewer = false,
      })
    end, {})
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fS", builtin.grep_string, { silent = true })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})

    telescope.setup({
      theme = "ivy",

      pickers = {
        live_grep = {
          theme = "ivy",
        },
        find_files = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        current_buffer_fuzzy_find = {
          theme = "ivy",
        },
        git_branches = {
          theme = "ivy",
        },
        git_files = {
          theme = "ivy",
          show_untracked = true,
        },
        lsp_references = {
          theme = "ivy",
        },
      },
      layout_config = {
        height = 10,
      },
      defaults = {
        theme = "ivy",
        previewer = true,
        layout_config = {
          bottom_pane = {
            height = 10,
          },
          height = 10,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
