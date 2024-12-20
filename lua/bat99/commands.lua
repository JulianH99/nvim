vim.api.nvim_create_user_command("W", function()
  vim.cmd([[noa w]])
end, {})

vim.api.nvim_create_user_command("RandomTheme", function()
  require("bat99.themer").pick_random_colorscheme()
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.html",
  callback = function()
    local manage_path = vim.fs.normalize(vim.loop.cwd() .. "/manage.py")

    if vim.fn.filereadable(manage_path) == 1 then
      vim.cmd("set ft=htmldjango")
    end
  end,
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
