# Neovim 環境備份與還原指南

本文件說明如何備份此 Neovim 設定，並在重灌系統或新環境中快速還原。

## 1. 備份方式 (推送到 Git)

建議將此設定檔目錄 (`~/.config/nvim`) 託管於 GitHub 或 GitLab。

```bash
# 如果尚未設定遠端倉庫
git remote add origin <您的倉庫網址>

# 提交並推送變更
git add .
git commit -m "update: 備份最新設定"
git push -u origin master
```

---

## 2. 還原方式 (在新電腦上)

只需執行以下三行指令即可恢復完整環境：

```bash
# 1. 下載設定檔
git clone <您的倉庫網址> ~/.config/nvim
cd ~/.config/nvim

# 2. 執行自動設定腳本
bash setup.sh
```

---

## 3. 腳本 (`setup.sh`) 內容說明

`setup.sh` 會自動處理以下事項：
1. **安裝系統依賴**：`jq` (JSON)、`xmllint` (XML)、`curl`、`git`、`build-essential`。
2. **安裝 Neovim**：若系統未安裝，自動下載並設定穩定版。
3. **插件同步**：自動執行 `Lazy.nvim` 同步插件。
4. **工具安裝**：自動執行 `Mason` 安裝相關 LSP 與格式化工具。

---

## 4. 常見問題

### Q: 自動排版沒反應？
- 請確保系統已安裝 `jq` 與 `xmllint` (腳本會自動安裝)。
- 檢查 `:ConformInfo` 查看格式化工具狀態。

### Q: 如何手動觸發排版？
- 使用快捷鍵 `<leader>f` (空格 + f)。
- 或存檔時 (`:w`) 會自動觸發。

### Q: .si 檔案有支援嗎？
- 有的，設定中已將 `.si` 關聯為 XML 格式。
