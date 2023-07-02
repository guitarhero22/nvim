-- enable python provider
vim.g['loaded_python3_provider'] = nil
vim.cmd('runtime python3_provider')

require 'custom.configs.gui'
