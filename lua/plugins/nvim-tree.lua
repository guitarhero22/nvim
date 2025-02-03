return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "left",
        preserve_window_proportions = true,
        float = {
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * 0.8
            local window_h = screen_h * 0.8
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local corner_x = (screen_w - window_w) / 2
            local corner_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              relative = "win",
              width = window_w_int,
              height = window_h_int,
              row = corner_y,
              col = corner_x,
              border = "rounded",
            }
          end,
          enable = true,
        },
      },
      renderer = {
        highlight_git = true,
        root_folder_label = function(path)
          return path
        end,
        icons = {
          show = {
            git = true,
          },
        },
      },
      git = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    },
  },
}
