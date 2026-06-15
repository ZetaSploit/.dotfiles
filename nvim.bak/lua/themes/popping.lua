return {
  "randoneering/popping-and-locking.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("popping_and_locking").setup({
      transparent = false,
      italic_comments = true,
      overrides = {},
    })
  end,
}
