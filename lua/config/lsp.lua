local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

-- Attach navic when supported
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- Setup helper
local function try_setup(server, config)
  if lspconfig[server] then
    config = config or {}
    config.on_attach = on_attach
    lspconfig[server].setup(config)
  end
end

-- Language servers
try_setup("pyright")
try_setup("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})
try_setup("clangd")
try_setup("omnisharp")
try_setup("jdtls")
try_setup("kotlin_language_server")
try_setup("intelephense")
try_setup("html", {
  cmd = { "html-languageserver", "--stdio" },
})
try_setup("cssls")
try_setup("ts_ls")
try_setup("gopls")
try_setup("bashls")
try_setup("powershell_es")

-- Diagnostics appearance
vim.diagnostic.config({
  virtual_text = {
    prefix = "▎",
    spacing = 2,
  },
  signs = true,
  underline = true,
})

-- File Types

vim.filetype.add({
  extension = {
    j2 = "html",
  }
})
