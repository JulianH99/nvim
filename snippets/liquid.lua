local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

-- for loop
table.insert(
  snippets,
  s({ trig = "forloop", dscr = "For loop in liquid" }, {
    t("{%- for "),
    i(1),
    t(" in "),
    i(2),
    t({ " -%}", "\t" }),
    i(3),
    t({ "", "{%- endfor -%}" }),
  })
)

-- if
table.insert(
  snippets,
  s({ trig = "if", dscr = "If condition" }, {
    t("{%- if "),
    i(1),
    t({ " -%}", "\t" }),
    i(2),
    t({ "", "{%- endif -%}" }),
  })
)

-- else if
table.insert(
  snippets,
  s({ trig = "ifelse", dscr = "If else" }, {
    t("{%- if "),
    i(1),
    t({ " -%}", "\t" }),
    i(2),
    t({ "", "{%- else -%}", "\t" }),
    i(3),
    t({ "", "{%- endif -%}" }),
  })
)

-- assign
table.insert(
  snippets,
  s({ trig = "assign", dscr = "Assign a variable" }, {
    t("{%- assign "),
    i(1),
    t(" = "),
    i(2),
    t(" -%}"),
  })
)

-- liquid code
table.insert(
  snippets,
  s({ trig = "liquid", dscr = "Liquid code" }, {
    t({ "{%- liquid", "" }),
    i(1),
    t({ "", "-%}" }),
  })
)

-- stylesheet tag
table.insert(
  snippets,
  s({ trig = "style", dscr = "Stylesheet tag" }, {
    t('{{ "'),
    i(1),
    t('.css" | asset_url | stylesheet_tag }}'),
  })
)

-- script
table.insert(
  snippets,
  s({ trig = "script", dscr = "script" }, {
    t('<script src="{{ "'),
    i(1),
    t('.js"| asset_url }}"></script>'),
  })
)

-- schema
table.insert(
  snippets,
  s({ trig = "schema", dscr = "Generate a schema section" }, {
    t({ "{% schema %}", "{", '\t"name": "' }),
    i(1),
    t({ '",', '\t"settings": [', "\t" }),
    i(2),
    t({ "", "\t]", "}", "{% endschema %}" }),
  })
)

-- setting
table.insert(
  snippets,
  s({ trig = "setting", dscr = "Generate a common setting structure" }, {
    t({ "{", '\t"type": "' }),
    i(1),
    t({ '",', '\t"id": "' }),
    i(2),
    t({ '",', '\t"label": "' }),
    i(3),
    t({ '"', "}" }),
  })
)

-- blocks
table.insert(
  snippets,
  s({ trig = "blocks", dscr = "Generate blocks setting" }, {
    t({ '"blocks": [', "\t{", '\t\t"type": "' }),
    i(1),
    t({ '",', '\t\t"name": "' }),
    i(2),
    t({ '",', '\t\t"settings": []', "\t}", "]" }),
  })
)

return snippets
