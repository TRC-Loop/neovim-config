return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
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
      if entry then
        actions.close(prompt_bufnr)
        local file = entry.path or entry.filename or entry.value
        if file then
          vim.cmd("tabnew " .. vim.fn.fnameescape(file))
        end
      else
        -- No match: use the typed text as a file path and create it
        local picker = action_state.get_current_picker(prompt_bufnr)
        local input = picker:_get_prompt()
        actions.close(prompt_bufnr)
        if input and input ~= "" then
          -- Create parent directories if needed
          local dir = vim.fn.fnamemodify(input, ":h")
          if dir ~= "." then
            vim.fn.mkdir(dir, "p")
          end
          vim.cmd("tabnew " .. vim.fn.fnameescape(input))
        end
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
