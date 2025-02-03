require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local telescope_grep = function()
  vim.ui.input({ prompt = "grep > " }, function(inp)
    require("telescope.builtin").grep_string {
      search = inp,
    }
  end)
end

map("n", "<leader>fg", telescope_grep, { desc = "grep" })
map("n", "<leader>N", function()
  require("nvim-navbuddy").open()
end, { desc = "open nav buddy" })

map("n", "<C-h>", "<cmd> ")

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
-- map("n", "<C-n>", function()
--   require("oil").open()
-- end)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- delete keybindings
local nomap = vim.keymap.del

nomap("n", "<C-c>")
