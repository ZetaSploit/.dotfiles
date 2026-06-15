return {
  {
    "mbbill/undotree",
    lazy = false,

    config = function()
      vim.g.undotree_WindowLayout = 3
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_SetFocusWhenToggle = 1

      vim.keymap.set(
        "n",
        "<leader>u",
        vim.cmd.UndotreeToggle,
        { desc = "Toggle Undotree" }
      )
    end,
  },
}
