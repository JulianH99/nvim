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

table.insert(
	snippets,
	s({ trig = "observer", dscr = "Basic structure for observer" }, {

		t({ "const observer = new MutationObserver(() => {", "\t" }),
		i(2),
		t({ "", "});", "observer.observe(" }),
		i(1, "document.body"),
		t({ ", { attributes: true, childList: true, subtree: true });" }),
	})
)

return snippets
