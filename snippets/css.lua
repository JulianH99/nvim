local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

table.insert(
	snippets,
	s({ trig = "abhide", dscr = "Data body and hide element" }, {

		t({ "body:not([" }),
		i(1),
		t({ "]) ." }),
		i(2),
		t({ " {", "\tdisplay: none;", "}" }),
	})
)

return snippets
