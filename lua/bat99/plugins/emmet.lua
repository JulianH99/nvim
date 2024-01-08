return {
  'mattn/emmet-vim', 
  event = "BufReadPre",
  config = function()
    vim.g.user_emmet_install_global = 1
    vim.api.nvim_create_augroup("bat99", { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      command = "EmmetInstall",
      pattern = {"html", "css", "gotmpl", "liquid", "gohtml"},
      group = "bat99"
    })
  end
}
