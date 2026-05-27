vim.api.nvim_create_user_command("W", function()
  vim.cmd([[noa w]])
end, {})

vim.api.nvim_create_user_command("RandomTheme", function()
  require("bat99.themer").pick_random_colorscheme()
end, {})

local bufgroups = vim.api.nvim_create_augroup("BufFileTypeGroup", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.html",
  group = bufgroups,
  callback = function()
    local manage_path = vim.fs.normalize(vim.loop.cwd() .. "/manage.py")

    if vim.fn.filereadable(manage_path) == 1 then
      vim.cmd("set ft=htmldjango")
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.axaml",
  group = bufgroups,
  command = [[set ft=xml]],
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Higlight when yanking text",
  group = vim.api.nvim_create_augroup("yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.templ" },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd("e!")
        end
      end,
    })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "docker-compose.yml", "docker-compose.yaml" },
  command = [[set filetype=yaml.docker-compose]],
})

-- leave the cursor in the last position where it was
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end
  end,
})

-- no auto comment
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("NoAutoComment", { clear = true }),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- angular
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.component.html", "*.container.html", "*.page.html" },
  callback = function()
    vim.treesitter.start(nil, "angular")
    vim.bo.filetype = "htmlangular"
  end,
})

-- start treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    -- exclude oil

    local exclude = {
      "oil",
      "fzf",
      "mininotify",
      "blink-cmp-documentation",
      "blink-cmp-menu",
      "blink-cmp-menu",
      "blink-cmp-signature",
      "trouble",
      "DressingInput",
      "oil-preview",
      "harpoon",
    }

    if vim.tbl_contains(exclude, vim.bo.filetype) then
      return
    end
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
