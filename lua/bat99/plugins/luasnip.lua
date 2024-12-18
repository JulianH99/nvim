return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
  end,
}
