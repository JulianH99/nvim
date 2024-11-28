local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {}

table.insert(
  snippets,
  s({ trig = "swiper", dscr = "Swiper" }, {
    t({ '<div class="swiper">', "\t" }),
    t({ '<div class="swiper-wrapper">', "\t" }),
    t({ '<div class="swiper-slide">Slide 1</div>' }),
    t({ "</div>" }),
    t({ '<div class="swiper-pagination"></div>' }),
    t({ '<div class="swiper-button-prev"></div>' }),
    t({ '<div class="swiper-button-next"></div>' }),
    t({ "</div>" }),
  })
)
