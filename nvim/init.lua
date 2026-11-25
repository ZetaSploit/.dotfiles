-- Load options and keymaps
require("config.options")
require("config.keymaps")

-- Load lazy.nvim plugin manager
require("config.lazy")

vim.deprecate = function() end
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
