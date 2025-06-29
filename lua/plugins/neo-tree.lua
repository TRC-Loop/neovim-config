return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "right",
        width = 20,
        mappings = {
          ["<CR>"] = function(state)
            local node = state.tree:get_node()
            local path = node and node.path
            local type = node and node.type

            if type == "file" and path then
              vim.cmd("tabnew " .. vim.fn.fnameescape(path))
            elseif type == "directory" then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            end
          end,
        },
      },
    },
  },
}
