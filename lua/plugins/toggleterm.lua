return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        size = 20,
        direction = "horizontal",
        persist_size = true,
        start_in_insert = true,   -- let toggleterm do the default thing
        close_on_exit = true,
      })

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          vim.schedule(function()
            if vim.bo.buftype == "terminal" then
              vim.cmd("startinsert")
            end
          end)
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "term://*",
        callback = function()
          vim.schedule(function()
            if vim.bo.buftype == "terminal" and vim.fn.mode() ~= "i" then
              vim.cmd("startinsert")
            end
          end)
        end,
      })

      vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
        pattern = "term://*",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"
        end,
      })

      vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<CR>", { noremap = true, silent = true })

    end
  }
}
