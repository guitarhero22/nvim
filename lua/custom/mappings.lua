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

return M
