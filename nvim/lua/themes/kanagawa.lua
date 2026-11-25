return {
  "rebelot/kanagawa.nvim",

  priority = 1000,

  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = false },
      functionStyle = { bold = false },
      keywordStyle = { bold = false },
      statementStyle = { bold = false },
      typeStyle = { bold = false },

      transparent = false,

      dimInactive = false,

      colors = {
        theme = {
          wave = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    })

  end,
}
