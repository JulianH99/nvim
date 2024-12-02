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

    -- find git files
    vim.keymap.set("n", "<leader>ff", function()
      builtin.git_files({ previewer = false })
    end, { noremap = true, silent = true, desc = "Find git files" })

    -- find all files
    vim.keymap.set("n", "<leader>fF", builtin.find_files, { silent = true, desc = "Find files with grep" })

    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { silent = true, desc = "Find in project" })
    vim.keymap.set("n", "<leader>fS", builtin.grep_string, { silent = true, desc = "Find current word in project" })
    vim.keymap.set(
      "n",
      "<leader>fc",
      builtin.current_buffer_fuzzy_find,
      { silent = true, desc = "Find in current buffer" }
    )

    telescope.setup({
      theme = "ivy",

      pickers = {
        grep_string = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        find_files = {
          theme = "ivy",
          previewer = false,
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {
            "node_modules",
            ".venv",
            ".git",
          },
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
