return {
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        opts = { lsp = { auto_attach = true } },
      },
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = { auto_attach = true },
      window = {
        border = "rounded",
        size = "80%",
        sections = {
          left = {
            size = "20%",
          },
          mid = {
            size = "20%",
          },
        },
      },
    },
  },
}
