return {
  "folke/flash.nvim",
  event = "BufReadPre",
  config = function()
    local flash = require("flash")

    local set = vim.keymap.set

    set({ "n", "x", "o" }, "s", function()
      flash.jump({
        search = {
          mode = function(str)
            return "\\<" .. str
          end,
        },
      })
    end, {})
    set({ "n", "x", "o" }, "S", function()
      require("flash").treesitter()
    end, {})
    set("c", "<c-s>", function()
      flash.toggle()
    end, {})
  end,
}
