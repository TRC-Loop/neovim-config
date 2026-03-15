return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    "*",
    css = { css = true },
    html = { css = true },
  },
}
