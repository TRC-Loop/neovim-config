local function datetime()
  return os.date("%Y-%m-%d %H:%M:%S") -- Configure your Datetime Format here.
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function python_venv()
      local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
      if venv then
        return "🐍 " .. vim.fn.fnamemodify(venv, ":t")
      end
      return ""
    end

    require("lualine").setup {
      options = {
        theme = {
          normal = {
            a = { fg = "#000000", bg = "#91f89c", gui = "bold" },  -- light green bg, black fg
            b = { fg = "#91f89c", bg = "#1f2227" },
            c = { fg = "#bbc2cf", bg = "#1f2227" },
          },
          insert = {
            a = { fg = "#000000", bg = "#91f89c", gui = "bold" },
          },
          visual = {
            a = { fg = "#000000", bg = "#91f89c", gui = "bold" },
          },
          replace = {
            a = { fg = "#000000", bg = "#91f89c", gui = "bold" },
          },
          command = {
            a = { fg = "#000000", bg = "#91f89c", gui = "bold" },
          },
          inactive = {
            a = { fg = "#91f89c", bg = "#1f2227", gui = "bold" },
            b = { fg = "#91f89c", bg = "#1f2227" },
            c = { fg = "#bbc2cf", bg = "#1f2227" },
          },
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          "filename",
          {
            python_venv,
            icon = "🐍",
            color = { fg = "#91f89c" },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location", datetime },
      },
    }
  end,
}
