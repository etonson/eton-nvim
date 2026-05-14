-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

----------------------------------------------------------------------
-- 1. 仿 IDEA 快速功能
----------------------------------------------------------------------

-- 雙擊 Space (其實是 Space Space) 搜尋檔案
map("n", "<leader><leader>", ":Telescope find_files<cr>", { desc = "Search Files (IDEA style)" })

-- 快速開啟資料庫 UI
map("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Database UI" })

----------------------------------------------------------------------
-- 2. Bun / Podman 自動化開發流
----------------------------------------------------------------------

-- 快速存檔並執行目前的 Bun 腳本
map("n", "<leader>r", function()
  vim.cmd("w")
  require("toggleterm").exec("bun run " .. vim.fn.expand("%"))
end, { desc = "Run Bun Script" })

-- 快速查看 Podman Log (需自行更換容器名稱)
map("n", "<leader>pl", function()
  require("toggleterm").exec("podman logs -f your_container_name")
end, { desc = "Podman Logs" })

----------------------------------------------------------------------
-- 3. 其他便捷功能
----------------------------------------------------------------------

-- 快速開啟 Oil (檔案管理)
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Parent Directory (Oil)" })

-- XML/JSON 智慧格式化
map("n", "<leader>f", function()
  local ok, conform = pcall(require, "conform")
  if not ok then return end

  local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
  if filesize > 2097152 then
    if vim.fn.confirm("檔案較大，是否確定格式化？", "&Yes\n&No") ~= 1 then return end
  end

  conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format Buffer" })
