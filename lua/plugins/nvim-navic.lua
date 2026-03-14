return {
  "SmiteshP/nvim-navic",
  lazy = true,
  opts = {
    highlight = true,
    separator = " > ",
  },
  init = function()
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}
