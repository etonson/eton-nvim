-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 將 .si 檔案視為 XML 格式
vim.filetype.add({
  extension = {
    si = "xml",
  },
})

-- 小檔案 (100KB以下) 開啟時自動格式化 XML/JSON
local function format_small_data_file(buf)
  if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then return end
  if not vim.tbl_contains({ "xml", "json" }, vim.bo[buf].filetype) then return end

  local filename = vim.api.nvim_buf_get_name(buf)
  local filesize = vim.fn.getfsize(filename)
  if filesize <= 0 or filesize >= 102400 then return end

  local ok, conform = pcall(require, "conform")
  if ok then conform.format({ bufnr = buf }) end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "xml", "json" },
  callback = function(args)
    format_small_data_file(args.buf)
  end,
})

-- 此檔案在 VeryLazy 階段載入，啟動時的 FileType 事件可能已經發生。
vim.schedule(function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    format_small_data_file(buf)
  end
end)

-- 強制所有檔案使用 Unix 格式 (LF)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function()
    if vim.opt.fileformat:get() ~= "unix" then
      vim.opt.fileformat = "unix"
    end
  end,
})
