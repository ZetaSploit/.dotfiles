return {
  "mbbill/undotree",
  lazy = false, -- loads immediately (tiny plugin)
  config = function()
    -- optional: better look for diff window
    vim.g.undotree_WindowLayout = 3       -- horizontal split
    vim.g.undotree_SplitWidth = 40        -- width of the tree
    vim.g.undotree_SetFocusWhenToggle = 1 -- auto focus the pane

    -- Keymap: <leader>u to toggle Undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
