local M = {}
-- enable python provider
vim.g["loaded_python3_provider"] = nil
vim.cmd "runtime python3_provider"

require "custom.configs.gui"

-- tabs with vim
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

return M
