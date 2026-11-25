return {
    "rmagatti/auto-session",

    config = function()
        require("auto-session").setup({
            auto_restore_enabled = false,

            auto_session_suppress_dirs = {
                "~/",
                "~/Downloads",
            },

            pre_save_cmds = {
                "tabdo NvimTreeClose",
            },
        })

        vim.keymap.set(
            "n",
            "<leader>wr",
            "<cmd>AutoSession restore<CR>",
            { desc = "Restore session" }
        )
    end,
}
