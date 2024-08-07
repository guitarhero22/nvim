local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      renderer = {
        highlight_git = true,
        root_folder_label = true,
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

  -- syntax highlighting, install treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "c",
        "cmake",
        "json",
        "html",
        "markdown_inline",
        "markdown",
        "go",
        "python",
      },
    },
  },

  -- install lsp's
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",   -- for nvchad and lua configs
        "stylua",                -- formatting lua
        "clang-format",          -- formatting for c family
        "cmakelang",             -- formatting cmake files
        "cmake-language-server", -- lsp for cmake
        "clangd",                -- lsp for c family
        "gopls",                 -- lsp for go
        "buf-language-server",   -- language server for protobuf
        "cbfmt",
        "rust-analyzer",
        "rustfmt",
        "autopep8",
        "glow",
        "mdformat",
      },
    },
  },

  -- lsp configs
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "SmiteshP/nvim-navbuddy",
    },
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

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    config = function()
      require "custom.configs.null-ls"
    end,
  },

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
  },              -- smooth vim scrolling

  {
    "tpope/vim-fugitive",
    lazy = false, -- fix this later
  },              -- vim fugitive

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
}

return plugins
