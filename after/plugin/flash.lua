local flash = require('flash')

local set = vim.keymap.set

set({ "n", "x", "o" }, "s", function() flash.jump({
  search = {
    mode = function(str)
      return "\\<" .. str
    end,
  },
}) end, {})
set({ "n", "o", "x" }, "S", function() flash.treesitter() end, {})
set("o", "r", function() flash.remote() end, {})
set({ "o", "x" }, "R",  function() flash.treesitter_search() end, {})
set("c", "<c-s>", function() flash.toggle() end, {})
