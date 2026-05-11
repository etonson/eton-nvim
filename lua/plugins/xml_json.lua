return {
  ----------------------------------------------------------------------
  -- Treesitter (XML / JSON syntax + structure)
  ----------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "xml",
        "json",
        "json5",
        "jsonc",
      })
    end,
  },

  ----------------------------------------------------------------------
  -- Formatter: conform.nvim
  ----------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        xmllint = {
          command = "xmllint",
          args = { "--format", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        json = { "jq" },
        jsonc = { "jq" },
        json5 = { "jq" },
        xml = { "xmllint" },
      },
    },
  },

  ----------------------------------------------------------------------
  -- Structural outline (symbols sidebar)
  ----------------------------------------------------------------------
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      backends = { "treesitter", "lsp", "markdown" },
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
      end,
    },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial Symbols" },
    },
  },

  ----------------------------------------------------------------------
  -- Breadcrumbs (current scope path)
  ----------------------------------------------------------------------
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

  ----------------------------------------------------------------------
  -- JSON Schema support
  ----------------------------------------------------------------------
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          settings = {
            json = {
              validate = { enable = true },
              schemas = {},
            },
          },
          on_new_config = function(new_config)
            local schemas = require("schemastore").json.schemas()
            new_config.settings.json.schemas =
              vim.list_extend(new_config.settings.json.schemas or {}, schemas)
          end,
        },

        -- XML LSP
        lemminx = {},
      },
    },
  },

  ----------------------------------------------------------------------
  -- Auto tag for XML/HTML
  ----------------------------------------------------------------------
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  ----------------------------------------------------------------------
  -- Mason (tool installer)
  ----------------------------------------------------------------------
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "jq",
        "json-lsp",
        "lemminx",
      })
    end,
  },

  ----------------------------------------------------------------------
  -- Optional: better folding for XML/JSON
  ----------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "xml", "json" },
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        end,
      })
    end,
  },
}
