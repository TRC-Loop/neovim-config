return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local navic = require("nvim-navic")

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      local defaults = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local servers = {
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
        clangd = {},
        omnisharp = {},
        jdtls = {},
        kotlin_language_server = {},
        intelephense = {},
        html = { cmd = { "html-languageserver", "--stdio" } },
        cssls = {},
        ts_ls = {},
        gopls = {},
        bashls = {},
        powershell_es = {},
      }

      for server, config in pairs(servers) do
        config = vim.tbl_deep_extend("force", defaults, config)
        lspconfig[server].setup(config)
      end

      vim.diagnostic.config({
        virtual_text = { prefix = "▎", spacing = 2 },
        signs = true,
        underline = true,
      })
    end,
  },
}
