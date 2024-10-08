-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
}

local get_navic_data = function()
  local navic = require "nvim-navic"
  if navic.is_available() then
    return navic.get_location()
  else
    return ""
  end
end

M.ui = {
  nvdash = { load_on_startup = true },
  statusline = {
    separator_style = "round",
    order = { "mode", "git", "%=", "navic", "lsp_msg", "%=", "lsp", "cwd" },
    modules = {
      navic = get_navic_data,
    },
  },
}

return M
