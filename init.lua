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
require('config.neocord')
require('config.telescope')

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

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end
})


vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.api.nvim_create_user_command("Boil", function()
  vim.fn.feedkeys("iboil<Tab>")
end, {})

vim.o.termguicolors = true

vim.opt.colorcolumn = "120"

vim.cmd [[
  highlight ColorColumn ctermbg=15 guibg=#2e3440
]]
