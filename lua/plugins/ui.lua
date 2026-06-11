return {
  -- 避免小型但單行較長的 XML/JSON 被誤判為大檔案
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        line_length = 10000,
      },
    },
  },

  -- 配色方案
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- 狀態列增強
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, {
        "fileformat",
        symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
      })
    end,
  },

  -- 結構大綱 (整合原 xml_json.lua)
  {
    "stevearc/aerial.nvim",
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

  -- 麵包屑導航
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

  -- 檔案系統編輯器 (建議新增)
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Markdown 增強渲染 (LazyVim 推薦)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown" },
    },
    ft = { "markdown" },
  },
}
