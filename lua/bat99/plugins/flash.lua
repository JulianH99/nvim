return {
  "folke/flash.nvim",
  event = "BufReadPre",
  config = function()
    local flash = require("flash")

    local set = vim.keymap.set

    set({ "n", "x", "o" }, "m", function()
      flash.jump({
        search = {
          mode = function(str)
            return "\\<" .. str
          end,
        },
      })
    end, {})
    set({ "n", "x", "o" }, "M", function()
      require("flash").treesitter()
    end, {})
    set("c", "<c-s>", function()
      flash.toggle()
    end, {})

    flash.setup()
  end,
}
