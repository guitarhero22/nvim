-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"

local function mk_setup_config(server)
  local setup_config = {
    on_attach = function(client, buffer)
      nvlsp.on_attach(client, buffer)
      if client.server_capabilities.documentSymbolProvider then
        local navic = require "nvim-navic"
        navic.attach(client, buffer)
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if server == "clangd" then
    setup_config.filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
  end

  return setup_config
end

return {
  mk_setup_config = mk_setup_config,
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
