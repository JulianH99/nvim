return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- "hrsh7th/cmp-nvim-lsp",
    "saghen/blink.cmp",
    -- "kevinhwang91/nvim-ufo",
    "ibhagwan/fzf-lua",
  },
  config = function()
    -- TODO: use mason tool installer
    -- TODO: move to lspconfig file and use autocmd to attach keybinds for lsp
    -- related stuff
    local mason = require("mason")
    local masonlsp = require("mason-lspconfig")
    local blink = require("blink.cmp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gT", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- show lsp type definitions

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    vim.filetype.add({ extension = { templ = "templ" } })

    capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())

    mason.setup()

    local html_file_types = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "liquid",
      "templ",
      "astro",
      "htmldjango",
      "php",
      "twig",
    }

    local css_file_types = {
      "css",
      "sass",
      "scss",
      "less",
    }
    local servers = {
      "ts_ls",
      "html",
      "cssls",
      "lua_ls",
      "emmet_ls",
      "gopls",
      "shopify_theme_ls",
      "templ",
      "astro",
      "jsonls",
      "eslint",
      "basedpyright",
      "vue_ls",
      "svelte",
      "csharp_ls",
      "lemminx",
    }

    for _, server in ipairs(servers) do
      if server == "ts_ls" then
        -- local mason_registry = require("mason-registry")
        -- mason_registry.refresh()
        -- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
        --   .. "/node_modules/@vue/language-server"

        vim.lsp.config("ts_ls", {
          on_attach = on_attach,
          -- init_options = {
          --   plugins = {
          --     {
          --       name = "@vue/typescript-plugin",
          --       location = vue_language_server_path,
          --       languages = { "vue" },
          --     },
          --   },
          -- },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          capabilities = capabilities,
          root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "angular.json" },
        })
      elseif server == "html" then
        vim.lsp.config("html", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = html_file_types,
        })
      elseif server == "lua_ls" then
        vim.lsp.config("lua_ls", {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "awesome", "screen", "client", "tag" },
              },
            },
          },
        })
      elseif server == "emmet_ls" then
        local file_types = vim.list_extend(html_file_types, css_file_types)
        file_types = vim.list_extend(file_types, { "htmlangular" })
        file_types = vim.list_extend(file_types, { "svelte" })
        vim.lsp.config("emmet_ls", {
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = file_types,
        })
      elseif server == "templ" then
        vim.lsp.config("templ", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "templ" },
        })
      --[[ elseif server == "omnisharp" then
        local pid = vim.fn.getpid()
        vim.lsp.config("omnisharp", {
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "cs", "cshtml", "razor" },
          cmd = { "omnisharp", "--languageserver", "--hostPID", pid },
        }) ]]
      else
        vim.lsp.config(server, {
          on_attach = on_attach,
          settings = {
            eslint = {
              settings = {
                workingDirectories = { mode = "auto" },
                useFlatConfig = true,
              },
            },
          },
        })
      end
    end

    masonlsp.setup({
      ensure_installed = servers,
      automatic_installation = true,
      automatic_enable = true,
    })

    -- set diagnostic keymab
  end,
}
