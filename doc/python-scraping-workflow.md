# Neovim Python 爬蟲開發說明

這份設定讓 Neovim 適合開發 Python 爬蟲專案：LSP 使用 `pyright`，lint/format 使用 `ruff`，除錯工具使用 `debugpy`，專案管理建議使用 `uv`。

## Neovim 已配置項目

- LazyVim Python extra：啟用 Python 常用整合。
- Treesitter：加入 `python`、`toml` 語法支援。
- Mason：自動安裝 `pyright`、`ruff`、`debugpy`。
- LSP：
  - `pyright`：補全、跳轉、型別分析。
  - `ruff`：快速 lint 與部分 code action。
- Formatter：Python 使用 `ruff_format`。

首次啟動 Neovim 後，執行：

```vim
:Lazy sync
:Mason
```

確認 `pyright`、`ruff`、`debugpy` 都已安裝。

## 建議 Python 專案初始化

```bash
uv init scraper-project
cd scraper-project
uv add httpx beautifulsoup4 lxml pydantic pandas
uv add --dev ruff pyright pytest pytest-asyncio ipython
```

如果目標網站需要 JavaScript 渲染或登入流程：

```bash
uv add playwright
uv run playwright install
```

如果是中大型爬蟲、需要排程、pipeline、middleware：

```bash
uv add scrapy
```

## 推薦目錄結構

```text
scraper-project/
├── pyproject.toml
├── uv.lock
├── src/
│   └── scraper_project/
│       ├── clients/
│       ├── parsers/
│       ├── pipelines/
│       └── main.py
├── tests/
│   ├── fixtures/
│   └── test_parsers.py
└── data/
    ├── raw/
    └── processed/
```

## 開發工作流

1. 先用瀏覽器 DevTools 找 API 或 HTML 結構。
2. 靜態頁面優先用 `httpx + beautifulsoup4/lxml`。
3. 需要互動、登入、JS 渲染時再用 `playwright`。
4. 大量頁面、retry、pipeline、middleware 需求明確時用 `scrapy`。
5. 把下載到的 HTML 存進 `tests/fixtures/`。
6. Parser 寫成純函式，先對 fixture 寫測試。
7. 最後才加入排程、proxy、資料庫或檔案輸出。

## 常用指令

```bash
uv run python src/scraper_project/main.py
uv run pytest
uv run ruff check .
uv run ruff format .
uv run pyright
```

在 Neovim 裡可以用 `<C-t>` 開啟 ToggleTerm，直接執行上述指令。

## 爬蟲選型

- `httpx`：適合 API 或靜態 HTML，速度快、依賴少。
- `beautifulsoup4`：適合寬鬆 HTML 解析。
- `lxml`：適合 XPath、速度較快。
- `scrapy`：適合大量頁面、pipeline、retry、middleware。
- `playwright`：適合 JS-heavy、登入、點擊、等待畫面狀態。
- `pydantic`：適合整理與驗證輸出資料。
- `pandas`：適合 CSV、Excel、資料清洗。

## pyproject.toml 範例

```toml
[tool.ruff]
line-length = 100
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "I", "B", "UP"]

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["src"]
```
