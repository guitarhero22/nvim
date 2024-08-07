---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "doomchad",
  statusline = {
    overriden_modules = function(modules)
      local navic_data = function()
        local navic = require "nvim-navic"
        if navic.is_available() then
          return navic.get_location()
        else
          return ""
        end
      end
      table.insert(modules, 5, navic_data())
    end,
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
