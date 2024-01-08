return {
  'nanozuki/tabby.nvim', 
  event = "TabEnter",
  config = function()

    require('tabby.tabline').use_preset('tab_only', {
      nerdfont = true,
      buf_name = {
        mode = "relative"
      }
    })

  end
}
