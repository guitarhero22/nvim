return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      -- "jose-elias-alvarez/null-ls.nvim",
      "SmiteshP/nvim-navbuddy",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  -- syntax highlighting, install treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  -- install lsp's
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

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

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   lazy = true,
  --   config = function()
  --     require "custom.configs.null-ls"
  --   end,
  -- },

  {
    "RaafatTurki/hex.nvim",
    lazy = false,
    config = function()
      require("hex").setup()
    end,
  },

  {
    "psliwka/vim-smoothie",
    lazy = false, -- fix this later
  }, -- smooth vim scrolling

  {
    "tpope/vim-fugitive",
    lazy = false, -- fix this later
  }, -- vim fugitive

  {
    "lewis6991/gitsigns.nvim",
    -- event = "User FilePost",
    opts = require "configs.gitsigns",
  },

  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  -- tmux + vim
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/zen-mode.nvim",
    lazy = false,
  },

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

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
    lazy = false,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
  },
}
