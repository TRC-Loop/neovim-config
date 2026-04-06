return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local navic = require("nvim-navic")

      -- Servers and their configs
      local servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "basic",
              },
            },
            pyright = {
              inlayHints = {
                functionReturnTypes = true,
                variableTypes = true,
                callArgumentNames = "all",
                pytestParameters = true,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
              hint = { enable = true },
            },
          },
        },
        clangd = {},
        omnisharp = {},
        jdtls = {},
        kotlin_language_server = {},
        intelephense = {
          settings = {
            intelephense = {
              hints = {
                parameterNames = true,
                parameterTypes = true,
                returnTypes = true,
                variableTypes = true,
              },
            },
          },
        },
        html = { cmd = { "html-languageserver", "--stdio" } },
        cssls = {},
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        bashls = {},
        powershell_es = {},
      }

      -- Auto-install LSPs via mason-lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      -- Capabilities (merge cmp if available)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Configure all servers
      for server, config in pairs(servers) do
        config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
        vim.lsp.config(server, config)
      end
      vim.lsp.enable(vim.tbl_keys(servers))

      -- ccl-lsp (not in Mason registry, registered manually)
      local lspconfig = require("lspconfig")
      local lspconfig_configs = require("lspconfig.configs")
      if not lspconfig_configs.ccl_lsp then
        lspconfig_configs.ccl_lsp = {
          default_config = {
            cmd = { "ccl-lsp" },
            filetypes = { "ccl" },
            root_dir = lspconfig.util.root_pattern(".git", ".ccolonfmt"),
            single_file_support = true,
          },
        }
      end
      lspconfig.ccl_lsp.setup({
        capabilities = capabilities,
      })

      -- Attach navic + enable inlay hints on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, args.buf)
          end
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })

      -- Inlay hint styling (grey, italic — like JetBrains)
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6e7381", italic = true })

      vim.diagnostic.config({
        virtual_text = { prefix = "▎", spacing = 2 },
        signs = true,
        underline = true,
      })
    end,
  },
}
