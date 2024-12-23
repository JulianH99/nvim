return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    -- "kevinhwang91/nvim-ufo",
  },
  config = function()
    -- TODO: use mason tool installer
    -- TODO: move to lspconfig file and use autocmd to attach keybinds for lsp
    -- related stuff
    local mason = require("mason")
    local masonlsp = require("mason-lspconfig")
    local lsp = require("lspconfig")
    local cmplsp = require("cmp_nvim_lsp")

    local neodev = require("neodev")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gT", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    vim.filetype.add({ extension = { templ = "templ" } })

    capabilities = vim.tbl_deep_extend("force", capabilities, cmplsp.default_capabilities())

    mason.setup()

    local html_file_types = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "liquid",
      "templ",
      "astro",
      "htmldjango",
      "php",
      "twig",
    }

    neodev.setup({})
    masonlsp.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "emmet_ls",
        "gopls",
        "theme_check",
        "templ",
        "astro",
        "jsonls",
        "eslint",
        "basedpyright",
        "eslint",
      },

      automatic_installation = true,
      handlers = {
        function(server_name) -- default handler (optional)
          lsp[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["ts_ls"] = function()
          local mason_registry = require("mason-registry")
          local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
            .. "/node_modules/@vue/language-server"

          lsp["ts_ls"].setup({
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = { "vue" },
                },
              },
            },
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          })
        end,
        ["html"] = function()
          lsp.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = html_file_types,
          })
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "awesome", "screen", "client", "tag" },
                },
              },
              eslint = {
                settings = {
                  workingDirectories = { mode = "auto" },
                  useFlatConfig = true,
                },
              },
            },
          })
        end,
        ["emmet_ls"] = function()
          lsp["emmet_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = html_file_types,
          })
        end,
        ["templ"] = function()
          lsp.templ.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "templ" },
          })
        end,
        ["volar"] = function()
          lsp.volar.setup({
            filetypes = { "vue" },
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      },
    })

    -- set diagnostic keymab
  end,
}
