return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard") -- Load the dashboard theme helpers

    vim.api.nvim_set_hl(0, "AppleGreen", { fg = "#91f89c" })
    vim.api.nvim_set_hl(0, "AppleYellow", { fg = "#f7cd7a" })
    vim.api.nvim_set_hl(0, "AppleRed", { fg = "#ed7773" })
    vim.api.nvim_set_hl(0, "ApplePink", { fg = "#f097db" })
    vim.api.nvim_set_hl(0, "ApplePurple", { fg = "#cfadfa" })

    local ascii_groups = {
      {
        [[                                #======*  ]],
        [[                            *--=++++=-=*% ]],
        [[                         **%+#@#+=---:=#  ]],
        [[                       =+%#%@@@@+-:::-*%  ]],
      },
      {
        [[                     =-=*%@@@@@#=::-=+#%  ]],
        [[                   %:=++#######-:-==+#%   ]],
        [[                 #%=++*#+==--:--==++#%    ]],
        [[          ######%%+****++=----==++*#      ]],
      },
      {
        [[        *######%%%##*++==-=-==++*#%       ]],
        [[      %+++***##%@#*++===##**#*##%         ]],
        [[     #====+++  %%+===+@#####%%@%          ]],
        [[    +-----=# @#%%+*%%#*%%%%%%             ]],
      },
      {
        [[           #--%#+@@%#%%%%##               ]],
        [[          -:::::@%%# ######               ]],
        [[       #+-::::%%%-  %######               ]],
        [[       =:-:::%*:  =*######                ]],
      },
      {
        [[      *=---:=-%   ++####                  ]],
        [[      +=+=+       ++*#                    ]],
        [[                  *                       ]],
      },
    }

    local header_sections = {}
    local hl_groups = { "AppleGreen", "AppleYellow", "AppleRed", "ApplePink", "ApplePurple" }

    for i, group in ipairs(ascii_groups) do
      table.insert(header_sections, {
        type = "text",
        val = group,
        opts = { hl = hl_groups[i], position = "center" },
      })
    end

    -- Refactored buttons using dashboard.button
    local buttons = {
      type = "group",
      val = {
        dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("n", "  New file", ":ene | startinsert<CR>"),
        dashboard.button("t", " Terminal", ":ToggleTerm direction=horizontal<CR>"),
        dashboard.button("e", " Neotree", ":Neotree toggle<CR>"),
        dashboard.button("l", "󰒲 Lazy", ":Lazy<CR>"),
        dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
      },
      opts = { spacing = 1, position = "center" },
    }

    local footer = {
      type = "text",
      val = "github.com/TRC-Loop/neovim-config",
      opts = { hl = "Comment", position = "center" },
    }

    local layout = {
      layout = {
        { type = "padding", val = 4 },
        header_sections[1], -- AppleGreen
        header_sections[2], -- AppleYellow
        header_sections[3], -- AppleRed
        header_sections[4], -- ApplePink
        header_sections[5], -- ApplePurple
        { type = "padding", val = 6 },
        buttons,
        { type = "padding", val = 2 },
        footer,
        { type = "padding", val = 3 },
      },
      opts = {},
    }

    alpha.setup(layout)
  end,
}
