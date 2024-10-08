local opts = {
  renderer = {
    highlight_git = true,
    root_folder_label = function()
      return vim.fs.normalize(vim.fn.getcwd())
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
}

return opts
