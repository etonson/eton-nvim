# Neovim 常見功能速查

這份文件整理目前設定中已經啟用的常用功能。`<leader>` 預設是 Space。

## 導航與搜尋

| 操作 | 功能 | 來源 |
| --- | --- | --- |
| `<leader><leader>` | 搜尋檔案，接近 IDEA 的快速開檔體驗 | Telescope / LazyVim |
| `Ctrl + 左鍵` | 跳到滑鼠點擊位置的函數、型別或符號定義 | LSP |
| `Ctrl + 右鍵` | 跳回上一個位置 | Neovim jumplist |
| `Ctrl + o` | 跳回上一個位置 | Neovim jumplist |
| `Ctrl + i` | 往前回到下一個跳轉位置 | Neovim jumplist |
| `<leader>cs` | 開關程式碼結構大綱 | Aerial |
| `{` / `}` | 在 Aerial 支援的 buffer 中切到上一個/下一個 symbol | Aerial |

`Ctrl + 左鍵` 需要目前檔案有可用的 LSP server。若跳不進去，先確認該語言的 LSP 已啟動。

## 檔案管理

| 操作 | 功能 | 來源 |
| --- | --- | --- |
| `-` | 開啟目前檔案所在目錄的 Oil 檔案管理器 | Oil |

Oil 可以像編輯文字一樣操作檔案名稱，適合快速移動、改名或建立檔案。

## 格式化

| 操作 | 功能 | 來源 |
| --- | --- | --- |
| `<leader>f` | 格式化目前 buffer | Conform |

目前格式化器設定：

| 檔案類型 | 格式化器 |
| --- | --- |
| JSON / JSONC / JSON5 | `jq` |
| XML / `.si` | `xmllint` |
| Python | `ruff_format` |

XML 和 JSON 小檔案在開啟時會自動格式化。檔案大於等於 100KB 時不會自動格式化；手動按 `<leader>f` 時，如果檔案超過 2MB，會先跳出確認。

`.si` 副檔名會被視為 XML。

## 終端機與開發流程

| 操作 | 功能 | 來源 |
| --- | --- | --- |
| `Ctrl + t` | 開關下方水平終端機 | ToggleTerm |
| `<leader>r` | 存檔並執行目前檔案：`bun run <current-file>` | ToggleTerm |
| `<leader>pl` | 開啟 Podman log follow 指令 | ToggleTerm |

`<leader>pl` 目前使用 placeholder 容器名稱 `your_container_name`，需要到 `lua/config/keymaps.lua` 改成實際容器名稱。

## 資料庫

| 操作 | 功能 | 來源 |
| --- | --- | --- |
| `<leader>db` | 開關資料庫 UI | Dadbod UI |

資料庫連線設定放在 `lua/plugins/database.lua` 的 `vim.g.dbs`。目前預留了連線範例位置，尚未啟用實際連線。

## LSP 與語言支援

目前 LSP 設定包含：

| 語言 / 格式 | LSP |
| --- | --- |
| TypeScript / Bun | `vtsls` |
| JSON | `jsonls` |
| YAML | `yamlls` |
| XML | `lemminx` |
| Python | `pyright`, `ruff` |

Mason 會確保常用工具與 LSP server 安裝在本機，包括 `jq`、`debugpy`、`shellcheck`、`shfmt`、`stylua`、`pyright`、`ruff`、`vtsls`、`json-lsp`、`yaml-language-server`、`lemminx`、`jdtls`、`java-debug-adapter`、`java-test`。

## UI 與閱讀輔助

| 功能 | 說明 |
| --- | --- |
| Treesitter | 已安裝 XML、JSON、TypeScript、TSX、Bash、Lua、Python、TOML、YAML 等 parser |
| Lualine | 狀態列會顯示 LF / CRLF / CR 檔案換行格式 |
| Barbecue | 顯示 breadcrumb 導航 |
| Render Markdown | Markdown 檔案有增強渲染 |
| Snacks bigfile | 放寬單行長度判斷，避免小型 XML/JSON 被誤判為大檔案 |

## 換行格式

新檔案預設使用 Unix LF。讀取或建立檔案時，也會把 fileformat 強制維持為 `unix`。
