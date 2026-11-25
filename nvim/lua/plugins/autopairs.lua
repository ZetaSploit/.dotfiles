return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})

            -- Integrate with Blink.cmp if supported by your
            -- installed nvim-autopairs version.
            local ok, blink = pcall(require, "blink.cmp")

            if ok and blink.completion
                and blink.completion.accept
            then
            end
        end,
    },
}

