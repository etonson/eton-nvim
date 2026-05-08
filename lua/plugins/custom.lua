return {
  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      shade_terminals = true,
    },
  },

  -- database
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI config here
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- mason ensure installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "shellcheck",
      })
    end,
  },
}
