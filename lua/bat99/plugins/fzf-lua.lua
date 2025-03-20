return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    --TODO: action to set all elements to qflist
    local fzfLua = require("fzf-lua")

    local set = function(key, func, desc, mode)
      vim.keymap.set(mode or "n", key, func, { desc = desc, silent = true, noremap = true })
    end

    set("<leader>fa", function()
      fzfLua.files({
        fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude .venv --exclude .pycache",
      })
    end, "Find all files")

    set("<leader>ff", function()
      fzfLua.git_files({ cmd = "git ls-files --others --exclude-standard --cached" })
    end, "Find git files (shows untracked)")

    set("<leader>fh", function()
      fzfLua.help_tags()
    end, "Find help tags")

    set("<leader>fs", function()
      fzfLua.live_grep()
    end, "Find in project")

    set("<leader>fS", function()
      fzfLua.grep_cword()
    end, "Find word under cursor in project")

    set("<leader>fv", function()
      fzfLua.grep_visual()
    end, "Find current selection in project", "v")

    set("<leader>fc", function()
      fzfLua.grep_curbuf()
    end, "Find in current buffer")

    set("<leader>fl", function()
      fzfLua.lsp_document_symbols()
    end, "LSP Buffer symbols")

    local current_file_actions = require("fzf-lua").defaults.actions.files
    local actions = require("fzf-lua.actions")

    require("fzf-lua").setup({
      "ivy",
      previwers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
      files = {
        cwd_header = true,
        cwd_prompt = false,
        git_icons = false,
      },
      grep = {
        actions = {
          ["ctrl-h"] = { require("fzf-lua.actions").toggle_ignore },
        },
      },
      winopts = {
        height = 0.6,
        preview = {
          layout = "horizontal",
        },
      },
      actions = {
        files = vim.tbl_deep_extend("force", current_file_actions, {
          ["ctrl-q"] = {
            fn = actions.file_edit_or_qf,
            prefix = "select-all+",
          },
        }),
      },
    })
  end,
}
