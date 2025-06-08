
local lspconfig = require('lspconfig')

-- Helper to safely setup LSP if installed
local function try_setup(server, config)
  if lspconfig[server] then
    lspconfig[server].setup(config or {})
  end
end

try_setup('pyright')

try_setup('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    }
  }
})

try_setup('clangd')
try_setup('omnisharp')
try_setup('jdtls')
try_setup('kotlin_language_server')
try_setup('intelephense')
try_setup('html')
try_setup('cssls')
try_setup('ts_ls')
try_setup('gopls')
try_setup('bashls')
try_setup('powershell_es')
