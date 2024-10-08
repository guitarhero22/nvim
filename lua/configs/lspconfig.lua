-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false }
  ),
}
local nvlsp = require "nvchad.configs.lspconfig"
local servers = { "cmake", "clangd", "bufls", "rust_analyzer", "hls", "jsonls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  local setup_config = {
    on_attach = function(client, buffer)
      nvlsp.on_attach(client, buffer)
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        callback = function()
          vim.diagnostic.open_float()
        end,
      })
      -- navic
      if client.server_capabilities.documentSymbolProvider then
        local navic = require "nvim-navic"
        navic.attach(client, buffer)
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    handlers = handlers,
  }

  if lsp == "clangd" then
    setup_config.filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
  end

  lspconfig[lsp].setup(setup_config)
end

vim.diagnostic.config {
  float = {
    border = "single",
    focusable = false,
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
