return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, 
  config = function()
    require("config.theme").setup()
  end,
}