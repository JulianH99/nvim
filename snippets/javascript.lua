local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

table.insert(
	snippets,
	s({ trig = "load", dscr = "attach DOMContentLoaded to document" }, {
		t({ 'document.addEventListener("DOMContentLoaded", () => {', "\t" }),
		i(1),
		t({ "", "})" }),
	})
)

return snippets
