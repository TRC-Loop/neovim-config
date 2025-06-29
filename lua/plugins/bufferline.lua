
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "tabs", -- or "buffers"
      show_buffer_close_icons = false,
      show_close_icon = true,
      separator_style = "slant",
    },
  },
}
