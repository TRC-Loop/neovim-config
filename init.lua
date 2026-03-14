vim.g.mapleader = " "

-- Options (loaded before plugins for faster startup)
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"
vim.wo.number = true
vim.wo.relativenumber = true

require("config.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Autocmds
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
  end,
})

vim.api.nvim_create_user_command("Boil", function()
  vim.fn.feedkeys("iboil\t")
end, {})

vim.cmd [[highlight ColorColumn ctermbg=15 guibg=#2e3440]]

-- File types
vim.filetype.add({
  extension = { j2 = "php" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    if vim.fn.expand("%:e") == "j2" then
      vim.cmd([[syntax include @jinja syntax/jinja.vim]])
      vim.cmd([[syntax region jinjaRegion start="{{" end="}}" contains=@jinja]])
      vim.cmd([[syntax region jinjaTag start="{%" end="%}" contains=@jinja]])
    end
  end,
})
