vim.g.tex_flavor = "latex"

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options = {
  "--synctex-forward",
  "@line:@col:@tex",
  "@pdf",
  "--synctex-editor-command",
  "nvr --remote-silent +%{line} %{input}",
}

vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-lualatex",
}

vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-interaction=nonstopmode",
    "-synctex=1",
    "-shell-escape",
  },
}

vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_complete_enabled = 1
