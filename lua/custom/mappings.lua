local M = {}

M.disabled = {
  n = {
    ["<C-c>"] = "",
  },
}

M.my_mappings = {
  n = {
    ["<leader>fg"] = {
      function()
        vim.ui.input({ prompt = "grep > " }, function(inp)
          require("telescope.builtin").grep_string {
            search = inp,
          }
        end)
      end,
    },
  },
}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
  },
}

return M
