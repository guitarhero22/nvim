return {
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup {
        width = 150,
        width_ratio = 0.8,
        height_ratio = 0.8,
      }
    end,
    cmd = "Glow",
  },
}
