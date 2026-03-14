vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

vim.cmd("command! Wq wq")
vim.cmd("command! WQ wq")
vim.cmd("command! Wqa wq")

vim.keymap.set('n', '<leader>+', ':tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader>-', ':tabclose<CR>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader>tt', ':tabs<CR>', { desc = 'List Tabs' })
vim.keymap.set('n', '<leader>l', ':tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader>h', ':tabprevious<CR>', { desc = 'Previous Tab' })

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt', { desc = 'Go to Tab ' .. i })
end

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buftype == "terminal" then
        vim.fn.jobstop(vim.b[buf].terminal_job_id)
      end
    end
  end,
})
