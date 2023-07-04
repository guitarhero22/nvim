local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false }
  ),
}

local lspconfig = require "lspconfig"
M.servers = { "cmake", "clangd" } -- not using clangd rn

for _, lspc in ipairs(M.servers) do
  lspconfig[lspc].setup {
    on_attach = function(client, buffer)
      on_attach(client, buffer)
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        callback = function()
          vim.diagnostic.open_float()
        end,
      })
    end,
    capabilities = capabilities,
    handlers = handlers,
  }
end

vim.diagnostic.config {
  float = {
    border = "single",
    focusable = false,
  },
}

return M
