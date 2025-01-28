local opts = {}

opts.ensure_installed = {
  "lua-language-server", -- for nvchad and lua configs
  "stylua", -- formatting lua
  "clang-format", -- formatting for c family
  "cmakelang", -- formatting cmake files
  "cmake-language-server", -- lsp for cmake
  "clangd", -- lsp for c family
  "gopls", -- lsp for go
  "buf-language-server", -- language server for protobuf
  "cbfmt",
  "rust-analyzer",
  "rustfmt",
  "glow",
  "mdformat",
  "json-lsp",
  "python-lsp-server",
}

return opts
