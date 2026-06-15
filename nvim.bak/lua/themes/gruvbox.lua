return {
  "ellisonleao/gruvbox.nvim",

  priority = 1000,

  config = function()
    require("gruvbox").setup({
      contrast = "medium",

      italic = {
        comments = false,
        strings = false,
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
