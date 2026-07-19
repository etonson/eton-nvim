return {
  -- 核心 LSP 配置
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    opts = {
      servers = {
        -- TypeScript / Bun 支援
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
            },
          },
        },
        -- JSON 支援
        jsonls = {
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },
        -- YAML 支援
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
              },
            },
          },
        },
        -- XML 支援
        lemminx = {},
        -- Python 支援
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
              },
            },
          },
        },
        ruff = {},
      },
    },
  },
}
