local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>h", ":nohlsearch<CR>")

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-1<CR>==")

-- LuaSnip keymaps (lazy-loaded safely)
vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    local ls = require("luasnip")

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end)

    vim.keymap.set("n", "<leader>rs", function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
      print("LuaSnip: reloaded snippets")
    end)

    vim.keymap.set("v", "<C-k>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-repeat", true, true, true), "v", true)
    vim.api.nvim_feedkeys("s", "n", true)
    end)

  end,
})

