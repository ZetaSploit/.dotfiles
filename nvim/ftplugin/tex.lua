-- Spellcheck
vim.opt_local.spell = true

-- Wrap and linebreak in LaTeX files
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Conceal recommended by the tutorial
vim.opt_local.conceallevel = 2

-- Indentation
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- Math shortcuts for align, equation, itemize, etc.
vim.keymap.set("n", "<leader>be", "o\\begin{equation}<CR>\\end{equation}<ESC>O", { buffer = true })
vim.keymap.set("n", "<leader>ba", "o\\begin{align}<CR>\\end{align}<ESC>O", { buffer = true })
vim.keymap.set("n", "<leader>bi", "o\\begin{itemize}<CR>\\item <CR>\\end{itemize}<ESC>kA", { buffer = true })

-- Compile & view keymaps (VimTeX)
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { buffer = true })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { buffer = true })
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>", { buffer = true })
vim.keymap.set("n", "<leader>lC", "<cmd>VimtexClean<CR>", { buffer = true })

