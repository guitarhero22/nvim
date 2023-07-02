local M = {}

M.ycm = {
  n = {
    ["<leader>gt"] = {"<cmd> YcmCompleter GoTo <CR>", "ycm goto"},
    ["<leader>fi"] = {"<cmd> YcmCompleter FixIt <CR>", "ycm fixit"},
    ["<leader>gr"] = {"<cmd> YcmCompleter GoToReferences <CR>", "ycm goto ref"}
  }
}

return M
