local function format_on_save_fn(bufnr)
  local lsp_format = "fallback"
  local no_fallback = { "json" }
  for _, ftype in ipairs(no_fallback) do
    if ftype == vim.bo[bufnr].filetype then
      lsp_format = "never"
    end
  end
  return {
    timeout_ms = 1000,
    lsp_format = lsp_format,
  }
end

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

  format_on_save = format_on_save_fn,
}

return options
