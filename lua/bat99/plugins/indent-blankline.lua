return { 
  "lukas-reineke/indent-blankline.nvim", 
  main = "ibl", 
  opts = {}, 
  event = "BufReadPre",
  config = function()
    local blankline = require('ibl')
    blankline.setup { }
  end
}
