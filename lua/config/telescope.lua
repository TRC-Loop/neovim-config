local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = function(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          vim.cmd('tabnew ' .. vim.fn.fnameescape(entry.path or entry.value))
        end
      },
      n = {
        ['<CR>'] = function(prompt_bufnr)
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          vim.cmd('tabnew ' .. vim.fn.fnameescape(entry.path or entry.value))
        end
      }
    }
  }
}
