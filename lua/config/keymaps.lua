-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep (Root Dir)" })

-- XML/JSON 智慧格式化快捷鍵
map("n", "<leader>f", function()
  local ok, conform = pcall(require, "conform")
  if not ok then
    vim.notify("未找到 conform.nvim 套件", vim.log.levels.ERROR)
    return
  end

  local filesize = vim.fn.getfsize(vim.fn.expand("%:p"))
  -- 如果檔案大於 2MB
  if filesize > 2097152 then
    local confirm = vim.fn.confirm("檔案較大 (" .. math.floor(filesize / 1024 / 1024) .. "MB)，是否確定執行縮排？", "&Yes\n&No")
    if confirm ~= 1 then
      return
    end
  end

  conform.format({
    async = true,
    lsp_fallback = true,
  })
  vim.notify("正在執行格式化 (XML/JSON)...", vim.log.levels.INFO)
end, { desc = "Format Buffer (XML/JSON)" })
