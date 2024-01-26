-- guifont
if vim.g.neovide then
  vim.g.gui_font_default_size = 10
  vim.g.gui_font_size = vim.g.gui_font_default_size
  vim.g.gui_font_face = "JetBrainsMono Nerd Font"

  RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
  end
  ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
  end
  -- Call function on startup to set default value
  RefreshGuiFont()
  -- Keymaps
  local opts = { noremap = true, silent = false }
  vim.keymap.set({ "n", "i" }, "<C-+>", function()
    ResizeGuiFont(1)
  end, opts)
  vim.keymap.set({ "n", "i" }, "<C-->", function()
    ResizeGuiFont(-1)
  end, opts)

  vim.o.title = 1
  vim.o.titlestring = "Neovide: %{substitute(getcwd(), $HOME . '/', '', '') . '/'}"
  vim.g.neovide_cursor_vfx_mode = "ripple"
end
