return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_in_tab(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      local file = entry.path or entry.filename or entry.value
      if file then
        vim.cmd("tabnew " .. vim.fn.fnameescape(file))
      end
    end

    require("telescope").setup({
      defaults = {
        mappings = {
          i = { ["<CR>"] = open_in_tab },
          n = { ["<CR>"] = open_in_tab },
        },
      },
    })
  end,
}
