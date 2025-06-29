return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'python', 'json', 'html', 'bash' },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
        },
      }
    end
  }
}
