return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzfLua = require("fzf-lua")
    local actions = require("fzf-lua.actions")

    local set = function(key, func, desc, mode)
      vim.keymap.set(mode or "n", key, func, { desc = desc, silent = true, noremap = true })
    end

    set("<leader>ff", function()
      fzfLua.git_files()
    end, "Find git files")

    set("<leader>fF", function()
      fzfLua.files()
    end, "Find files with grep")

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

    require("fzf-lua").setup({
      "default-title",
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
        preview = {
          layout = "vertical",
        },
      },
      actions = {
        files = {
          ["ctrl-q"] = {
            fn = actions.file_edit_or_qf,
            prefix = "select-all+",
          },
        },
      },
    })
  end,
}
