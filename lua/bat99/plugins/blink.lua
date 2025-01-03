return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  version = "v0.*",
  opts = {
    enabled = function()
      return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
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
        selection = function(ctx)
          return ctx.mode == "cmdline" and "auto_insert" or "preselect"
        end,
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
        "lsp",
        "path",
        "luasnip",
        "buffer",
      },
    },
    snippets = {
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },
    signature = { enabled = true },
  },
}
