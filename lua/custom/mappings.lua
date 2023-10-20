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

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>sh"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage Hunk",
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
