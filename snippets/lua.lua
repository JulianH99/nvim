local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

table.insert(
	snippets,
	s({ trig = "snippetfile", dscr = "Common boilerplate for luasnip snippets" }, {
		t({
			'local ls = require("luasnip")',
			"",
			"local s = ls.snippet",
			"local t = ls.text_node",
			"local i = ls.insert_node",
			"",
			"local snippets = {}",
			"",
		}),
		i(1),
		t({ "", "return snippets" }),
	})
)

table.insert(
	snippets,
	s({ trig = "snippet", dscr = "Snippet" }, {

		t({ "table.insert(", "\tsnippets,", '\ts({ trig ="' }),
		i(1),
		t({ '", dscr = "' }),
		i(2),
		t({ '"}, {', "\t" }),
		i(3),
		t({ "", "\t})", ")" }),
	})
)

return snippets
