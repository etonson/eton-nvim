# Neovim 配置：後端自動化中心 (Backend Automation Center)

這是一套基於 **LazyVim** 的模組化配置，專為後端工程師在 **Ubuntu + Podman + Bun (TS)** 環境下設計。

## 🚀 核心設計理念
1. **模組化分類**：將 LSP、終端機、資料庫與 UI 拆分，易於維護。
2. **自動化開發流**：整合 Bun 與 Podman 的常用指令，提升開發效率。
3. **IDEA 習慣整合**：保留部分 IntelliJ IDEA 的操作直覺。

## 📁 目錄結構
- `lua/config/keymaps.lua`：自定義快捷鍵與自動化指令。
- `lua/plugins/lsp.lua`：TypeScript (vtsls)、JSON、XML 與 YAML 的語法支援。
- `lua/plugins/terminal.lua`：ToggleTerm 配置（水平開啟，適合監控 Log）。
- `lua/plugins/database.lua`：SQL Server / MySQL 等資料庫連線管理。
- `lua/plugins/ui.lua`：包含 Oil.nvim (檔案管理)、Aerial (結構大綱) 等介面增強。
- `lua/plugins/editor.lua`：格式化、Treesitter 語法高亮與工具自動安裝清單。

## ⌨️ 常用快捷鍵

### 自動化指令
- `<leader>r`：一鍵**存檔並執行**目前的 Bun 腳本。
- `<leader>pl`：查看 **Podman** 容器日誌 (Logs)。

### 導航與搜尋
- `<leader><leader>` (雙擊 Space)：仿 IDEA 的**快速搜尋檔案**。
- `-`：開啟 **Oil** 檔案編輯器（像編輯文字一樣移動/重命名檔案）。
- `<leader>cs`：開啟 **Aerial** 程式碼結構大綱。

### 終端機與資料庫
- `Ctrl + t`：開關下方終端機。
- `<leader>db`：開關 **Dadbod UI** 資料庫介面。

### 格式化
- `<leader>f`：XML/JSON/TS 等檔案格式化（整合 Conform.nvim）。

## 🛠️ 維護說明
- 所有工具（如 LSP Servers, Formatters）會透過 **Mason** 自動安裝。
- 若要新增連線，請修改 `lua/plugins/database.lua` 中的 `vim.g.dbs`。
- 若要修改 Podman 容器名稱，請至 `lua/config/keymaps.lua` 調整。
