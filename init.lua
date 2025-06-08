-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.keymaps")
require("lazy").setup("plugins")
require('config.lsp')
require('config.theme')

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true       -- use spaces instead of tabs
vim.opt.shiftwidth = 2         -- number of spaces per indent
vim.opt.tabstop = 2            -- number of spaces a tab counts for
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})
