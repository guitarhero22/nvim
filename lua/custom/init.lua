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

return M
