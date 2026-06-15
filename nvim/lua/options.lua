require "nvchad.options"

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
})

vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.updatetime = 200

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
