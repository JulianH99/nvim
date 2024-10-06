return {
  "echasnovski/mini.icons",
  version = "*",
  config = function()
    local miniIcons = require("mini.icons")
    miniIcons.setup()
    miniIcons.mock_nvim_web_devicons()
  end,
}
