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
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "xml", "json" },
  callback = function(args)
    local filename = vim.api.nvim_buf_get_name(args.buf)
    local filesize = vim.fn.getfsize(filename)
    -- 小於 100KB 且檔案存在時自動執行
    if filesize > 0 and filesize < 102400 then
      local ok, conform = pcall(require, "conform")
      if ok then
        conform.format({ bufnr = args.buf })
      end
    end
  end,
})

-- 強制所有檔案使用 Unix 格式 (LF)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function()
    if vim.opt.fileformat:get() ~= "unix" then
      vim.opt.fileformat = "unix"
    end
  end,
})
