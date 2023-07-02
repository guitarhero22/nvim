local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
M.servers = { 'cmake' } -- not using clangd rn

for _, lspc in ipairs(M.servers) do
  lspconfig[lspc].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

return M
