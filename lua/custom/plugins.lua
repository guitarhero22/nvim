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
      },
    },
  },

  -- install lsp's
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", -- for nvchad and lua configs
        "stylua", -- formatting lua
        "clang-format", -- formatting for c family
        "cmakelang", -- formatting cmake files
        "cmake-language-server", -- lsp for cmake
        "clangd", -- lsp for c family
        "gopls", -- lsp for go
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
    "psliwka/vim-smoothie",
    lazy = false, -- fix this later
  }, -- smooth vim scrolling

  {
    "tpope/vim-fugitive",
    lazy = false, -- fix this later
  }, -- vim fugitive

  -- YCM
  {
    "ycm-core/YouCompleteMe",
    build = "./install.py --clangd-completer",
  },
}

return plugins
