local lsp_utils = require "configs.lsp_utils"
local pylsp_default = require("lspconfig.configs.pylsp").default_config
local my_pylsp_config = lsp_utils.mk_setup_config "pylsp"
my_pylsp_config.cmd = "pylsp"
my_pylsp_config.filetypes = { "python" }
my_pylsp_config.root_dir = "/home/jovyan/ml-experiments/llama-ftw"
my_pylsp_config = vim.tbl_deep_extend("keep", my_pylsp_config, pylsp_default)

local servers = {
  ["*"] = {
    lsp = {
      ["pylsp_distant"] = my_pylsp_config,
    },
  },
}

require("distant"):setup { servers = servers }
