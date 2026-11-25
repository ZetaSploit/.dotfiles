
return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        opts = {
            -- Familiar Vim-style completion controls
            keymap = {
                preset = "default",
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "cancel", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                -- Keep selection predictable; do not preselect an item
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },

                -- Show useful documentation after a short delay
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 400,
                    window = {
                        border = "rounded",
                    },
                },

                -- Preview suggestions without inserting them
                ghost_text = {
                    enabled = true,
                    show_with_selection = true,
                    show_without_selection = false,
                },

                menu = {
                    border = "rounded",
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                        },
                    },
                },

                accept = {
                    -- Let the LSP handle brackets where appropriate
                    auto_brackets = {
                        enabled = true,
                    },
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },

                providers = {
                    lsp = {
                        score_offset = 10,
                    },

                    path = {
                        score_offset = 5,
                    },

                    snippets = {
                        score_offset = 0,
                    },

                    buffer = {
                        score_offset = -5,
                        min_keyword_length = 3,
                    },
                },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },

            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        enabled = false,
    },
}

