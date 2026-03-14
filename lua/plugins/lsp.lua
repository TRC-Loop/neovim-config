return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local navic = require("nvim-navic")

      -- Attach navic via LspAttach autocmd
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.documentSymbolProvider then
            navic.attach(client, args.buf)
          end
        end,
      })

      -- Capabilities (merge cmp if available)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Server configs
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
        config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
        vim.lsp.config(server, config)
      end
      vim.lsp.enable(vim.tbl_keys(servers))

      vim.diagnostic.config({
        virtual_text = { prefix = "▎", spacing = 2 },
        signs = true,
        underline = true,
      })
    end,
  },
}
