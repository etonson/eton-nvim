return {
  -- Core: Treesitter for XML and JSON
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "xml", "json", "json5", "jsonc" })
      end
    end,
  },

  -- Formatting: conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "jq" },
        xml = { "xmlformat" },
      },
    },
  },

  -- Structural Navigation: aerial.nvim
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
      end,
    },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
  },

  -- Breadcrumbs: barbecue.nvim
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  -- JSON Schema: SchemaStore.nvim
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          -- SchemaStore setup
          settings = {
            json = {
              schemas = {},
              validate = { enable = true },
            },
          },
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
        },
        lemminx = {}, -- XML LSP
      },
    },
  },

  -- XML Auto-tag: nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- Ensure tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "xmlformat",
        "json-lsp",
        "lemminx",
        "jq",
      })
    end,
  },
}
