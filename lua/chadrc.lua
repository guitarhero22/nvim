-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad",
  hl_override = {
    ["@comment"] = {
      italic = true,
    },
    ["@method"] = {
      italic = true,
    },
    ["@function"] = {
      italic = true,
    },
    ["@function.call"] = {
      italic = true,
    },
    ["@string"] = { italic = true },
  },
}

local apt_shadow = {
  " █████╗ ██████╗ ████████╗",
  "██╔══██╗██╔══██╗╚══██╔══╝",
  "███████║██████╔╝   ██║   ",
  "██╔══██║██╔═══╝    ██║   ",
  "██║  ██║██║        ██║   ",
  "╚═╝  ╚═╝╚═╝        ╚═╝   ",
  "",
  "",
}

M.nvdash = {
  load_on_startup = true,
  header = apt_shadow,
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
  statusline = {
    separator_style = "round",
    order = { "mode", "git", "%=", "navic", "lsp_msg", "%=", "clock", "lsp", "cwd" },
    modules = {
      navic = get_navic_data,
      clock = function()
        return "" .. os.date "%Y-%m-%d %H:%M  "
      end,
    },
  },
}

return M
