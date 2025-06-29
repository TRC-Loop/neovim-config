vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

vim.cmd("command! Wq wq")
vim.cmd("command! WQ wq")

vim.keymap.set('n', '<leader>+', ':tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader>-', ':tabclose<CR>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader>tt', ':tabs<CR>', { desc = 'List Tabs' })
vim.keymap.set('n', '<leader>l', ':tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader>h', ':tabprevious<CR>', { desc = 'Previous Tab' })

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt', { desc = 'Go to Tab ' .. i })
end
