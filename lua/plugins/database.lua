return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    -- 預留連線資訊位置
    vim.g.dbs = {
      -- dev_db = "mssql://sa:YourPassword@192.168.1.xxx:1433/YourDB"
    }
  end,
}
