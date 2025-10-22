local autotag_filetypes = {
  "html",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "svelte",
  "vue",
  "tsx",
  "jsx",
  "rescript",
  "xml",
  "php",
  "markdown",
  "astro",
  "glimmer",
  "handlebars",
  "hbs",
  "liquid",
  "axaml",
}

return {
  "windwp/nvim-ts-autotag",
  event = "BufReadPre",
  ft = autotag_filetypes,
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
