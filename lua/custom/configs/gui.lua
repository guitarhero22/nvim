-- guifont
if vim.g.neovide then
  vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h10" }

  vim.o.title = 1
  vim.o.titlestring = "Neovide: %{substitute(getcwd(), $HOME . '/', '', '') . '/'}"
end
