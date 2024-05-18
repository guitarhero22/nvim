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
M.servers = { "cmake", "clangd", "bufls", "rust_analyzer", "hls" }

for _, lspc in ipairs(M.servers) do
  local setup_config = {
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

  if lspc == "clangd" then
    setup_config.filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
  end
  lspconfig[lspc].setup(setup_config)
end

vim.diagnostic.config {
  float = {
    border = "single",
    focusable = false,
  },
}

return M
