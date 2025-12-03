local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- php initialization boilerplate
  s({
    trig = "phpinit",
    dscr = "Inserts the usual boilerplate for a php file",
  }, {
    t({ "<?php", "declare(strict_types=1);" }),
  }),

  s({
    trig = "iif",
    dscr = "Inline php if",
  }, {
    t({ "<?php if (" }),
    i(1),
    t({ ") : ?>", "" }),
    t({ "<?php endif; ?>" }),
  }),

  s({
    trig = "iecho",
    dscr = "Inline echo",
  }, {
    t({ "<?php echo " }),
    i(1),
    t({ " ?>" }),
  }),
}
