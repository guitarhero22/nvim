-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local mk_config = require("configs.lsp_utils").mk_setup_config

local lspconfig = require "lspconfig"
-- lsps with default config
local servers = { "cmake", "clangd", "buf_ls", "rust_analyzer", "hls", "jsonls", "pylsp", "svelte", "html", "ts_ls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(mk_config(lsp))
end

vim.diagnostic.config {
  virtual_text = false,
}
