return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            text = {
              top = "Command",
            },
          },
        },
      },
    })
    local bg = "#151624"
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",       { bg = bg, fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = bg, fg = "#5f5f87" })
  end,
}
