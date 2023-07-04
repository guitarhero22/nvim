-- entry point to neovim
-- loads NvChad
-- NvChad will internally load custom/init
-- do not change this

local runtime_paths = vim.api.nvim_list_runtime_paths()
for i = 1, #runtime_paths do
  package.path = package.path .. ";" .. runtime_paths[i] .. "/?/init.lua"
  package.path = package.path .. ";" .. runtime_paths[i] .. "/NvChad/lua/?.lua"
  package.path = package.path .. ";" .. runtime_paths[i] .. "/NvChad/lua/?/init.lua"
end

require "NvChad"
