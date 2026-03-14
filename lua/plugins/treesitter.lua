return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "json", "html", "bash", "php", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aC"] = "@conditional.outer",
              ["iC"] = "@conditional.inner",
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
}
