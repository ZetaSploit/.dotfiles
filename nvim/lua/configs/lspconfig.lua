require("nvchad.configs.lspconfig").defaults()

vim.lsp.config.texlab = {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f",
        },
      },
      forwardSearch = {
        executable = "zathura",
        args = {
          "--synctex-forward",
          "%l:1:%f",
          "%p",
        },
      },
    },
  },
}

vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("texlab")
