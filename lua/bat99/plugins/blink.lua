return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  version = "1.*",
  opts = {
    enabled = function()
      return not vim.list_contains({ "DressingInput" }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
    end,
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "fallback" },
      ["<S-Tab>"] = { "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = {
        "snippet_backward",
        -- "select_prev",
        "fallback",
      },
      ["<C-n>"] = {
        "snippet_forward",
        -- "select_next",
        "fallback",
      },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      list = {
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
          auto_insert = function(ctx)
            return ctx.mode == "cmdline"
          end,
        },
      },
      trigger = {
        prefetch_on_insert = true,
        show_on_insert = false,
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon", "label", "label_description", gap = 1 },
            { "kind" },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
      documentation = { auto_show = true },
      accept = { auto_brackets = { enabled = false } },
    },

    sources = {
      default = {
        "lazydev",
        "lsp",
        "path",
        "snippets",
        "buffer",
        "blink-shopify-input-types",
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        ["blink-shopify-input-types"] = {
          name = "Blink Shopify Input Types",
          module = "blink-shopify-input-types",
        },
        snippets = {
          score_offset = 1,
        },
      },
    },
    snippets = { preset = "luasnip" },

    signature = { enabled = true },
  },
}
