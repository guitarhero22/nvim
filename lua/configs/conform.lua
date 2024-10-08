local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
    go = { "gofmt" },
    proto = { "buf" },
    rust = { "rustfmt" },
    python = { "autopep8" },
    md = { "mdformat" },
    haskell = { "fourmolu" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
