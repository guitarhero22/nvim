-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad",
  hl_override = {
    FloatBorder = { fg = "one_bg2" },
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
    ["String"] = { italic = true },
    ["Function"] = { italic = true },
  },
}

local cat_shadow = {
  "       ▄▀▄     ▄▀▄       ",
  "      ▄█░░▀▀▀▀▀░░█▄      ",
  "  ▄▄  █░░░░░░░░░░░█  ▄▄  ",
  " █▄▄█ █░░▀░░┬░░▀░░█ █▄▄█ ",
  "‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾",
}

M.nvdash = {
  load_on_startup = true,
  header = cat_shadow,
}

local get_navic_data = function()
  local navic = require "nvim-navic"
  if navic.is_available() then
    return navic.get_location()
  else
    return ""
  end
end

local function get_file_path()
  local icon = "󰈚"
  local path = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0))
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

  if name ~= "Empty" then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    if devicons_present then
      local ft_icon = devicons.get_icon(name)
      icon = (ft_icon ~= nil and ft_icon) or icon
    end
  else
    path = vim.fn.getcwd()
  end

  return "%#St_file# " .. icon .. " " .. path .. " "
end

M.ui = {
  statusline = {
    separator_style = "block",
    order = { "mode", "filepath", "git", "%=", "navic", "lsp_msg", "%=", "lsp", "cwd" },
    modules = {
      navic = get_navic_data,
      -- clock = function()
      --   return "" .. os.date "%Y-%m-%d %H:%M  "
      -- end,
      filepath = get_file_path,
    },
  },
  telescope = { style = "bordered" },
}

return M
