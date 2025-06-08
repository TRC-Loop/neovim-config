return {
  "hrsh7th/nvim-cmp",
  event = "CmdlineEnter",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
  },
  opts = function()
    local cmp = require("cmp")
    return {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup.cmdline(":", opts)
  end,
}
