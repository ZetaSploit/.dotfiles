return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
    map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
  end,
}
