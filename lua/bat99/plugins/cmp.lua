return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- lsp kind
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = "text",
          maxwidth = 80,
          ellipisis_char = "...",
        }),
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-2),
        ["<C-f>"] = cmp.mapping.scroll_docs(2),
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<c-n>"] = cmp.mapping(function()
          luasnip.jump(1)
        end, { "i", "s" }),
        ["<c-p>"] = cmp.mapping(function()
          luasnip.jump(-1)
        end, { "i", "s" }),
      }),
      -- configure sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = true,
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
