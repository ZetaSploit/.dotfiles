require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>h", "<cmd>nohlsearch<CR>")

map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-1<CR>==")

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

map("n", "<leader>e", "<cmd>Neotree toggle<CR>")
