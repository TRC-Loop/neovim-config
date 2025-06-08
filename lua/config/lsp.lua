local lspconfig = require('lspconfig')

-- LSP setups for all requested languages
lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } } }
  }
}
lspconfig.clangd.setup {}          -- C, C++
lspconfig.omnisharp.setup {}       -- C#
lspconfig.jdtls.setup {}           -- Java
lspconfig.kotlin_language_server = lspconfig.kotlin_language_server or nil -- fallback if installed
if lspconfig.kotlin_language_server then
  lspconfig.kotlin_language_server.setup {}
end
lspconfig.intelephense.setup {}    -- PHP
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.ts_ls.setup {}     -- JS/TS
lspconfig.gopls.setup {}
lspconfig.bashls.setup {}
lspconfig.powershell_es.setup {}   -- PowerShell
lspconfig.markdownls.setup {}