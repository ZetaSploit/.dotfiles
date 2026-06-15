return {
  "EdenEast/nightfox.nvim",

  lazy = false,
  priority = 1000,

  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,

        styles = {
          comments = "italic",
          keywords = "NONE",
          types = "NONE",
        },

        inverse = {
          match_paren = false,
          visual = false,
          search = false,
        },
      },
    })

  end,
}
