return {
  -- Treesitter 語法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "xml",
        "json",
        "json5",
        "jsonc",
        "typescript",
        "tsx",
        "bash",
        "lua",
        "python",
        "toml",
        "yaml",
      })
    end,
  },

  -- 格式化工具 (整合原 xml_json.lua)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        xmllint = { command = "xmllint", args = { "--format", "-" }, stdin = true },
      },
      formatters_by_ft = {
        json = { "jq" },
        jsonc = { "jq" },
        json5 = { "jq" },
        python = { "ruff_format" },
        xml = { "xmllint" },
      },
    },
  },

  -- 自動閉合標籤
  { "windwp/nvim-ts-autotag", opts = {} },

  -- Mason 工具安裝管理
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- 核心工具
        "jq",
        "debugpy",
        "shellcheck",
        "shfmt",
        "stylua",
        -- LSP Servers
        "pyright",
        "ruff",
        "vtsls",
        "json-lsp",
        "yaml-language-server",
        "lemminx",
        -- Java (保留原 custom.lua)
        "jdtls",
        "java-debug-adapter",
        "java-test",
      })
    end,
  },
}
