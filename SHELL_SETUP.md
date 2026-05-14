# Shell 腳本開發環境設定 (Shell Setup)

本文件記錄了如何設定 Shell 腳本的開發環境，包含 Linter 設定與換行符號 (Line Endings) 的處理。

## 🛠 工具安裝

### 1. 系統層級工具
安裝 `shellcheck` (靜態分析工具) 與 `dos2unix` (格式轉換工具)：
```bash
sudo apt update
sudo apt install -y shellcheck dos2unix
```

## ⚙️ Neovim 設定

### 1. 啟用 Shell 語言支援
目前透過 `lua/plugins/editor.lua` 與 `lua/plugins/lsp.lua` 進行手動配置與工具管理，確保安裝：
- **Linter**: `shellcheck`
- **Formatter**: `shfmt`

### 2. Mason 自動安裝
在 `lua/plugins/editor.lua` 中已將 `shellcheck` 與 `shfmt` 加入 `ensure_installed` 清單，Mason 會在啟動時自動處理。

### 3. 強制使用 Unix 換行符號 (LF)
為了避免在 Linux 執行腳本時出現 `\r` 錯誤，在 `lua/config/options.lua` 中做了以下設定：
```lua
vim.opt.fileformat = "unix"      -- 預設新檔案使用 LF
vim.opt.fileformats = "unix"     -- 強制只使用 unix 格式，無視 dos 偵測
```

## 🔍 常見問題處理

### 遇到 `rm: 無法刪除 ... \r: 沒有此一檔案或目錄`
這表示檔案使用了 Windows 的 CRLF 格式。

**解法 A：使用 dos2unix (推薦)**
```bash
dos2unix <filename>
```

**解法 B：在 Neovim 中轉換**
1. 開啟檔案。
2. 執行指令 `:set ff=unix`。
3. 存檔 `:w`。

**解法 C：使用 sed 快速修復**
```bash
sed -i 's/\r$//' <filename>
```
