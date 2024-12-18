return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  version = "v0.*",
  opts = {
    keymap = { preset = "enter" },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "luasnip", "buffer" },
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
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
  end,
}
