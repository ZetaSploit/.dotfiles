-- Load options and keymaps
require("config.options")
require("config.keymaps")

-- Load lazy.nvim plugin manager
require("config.lazy")

vim.deprecate = function() end
vim.opt.guifont = "FiraCode:h12"
