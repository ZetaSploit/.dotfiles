return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-omni" },
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- Function to check if we can jump backwards (used for <S-Tab>)
        local has_prev_snippet = function()
            return luasnip.jumpable(-1)
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- 1. Completion menu is visible: Select the next item
                        cmp.confirm({ select = true })
                    elseif luasnip.expand_or_jumpable() then
                        -- 2. Menu is hidden, but LuaSnip can expand or jump forward
                        luasnip.expand_or_jump()
                    else
                        -- 3. No completion/snippet action: Insert a tab character
                        fallback()
                    end
                end, { "i", "s" }), -- i: Insert mode, s: Snippet mode

                -- Fix <S-Tab> to jump backward in a snippet
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        -- Completion menu is visible: Select the previous item
                        cmp.select_prev_item()
                    elseif has_prev_snippet() then
                        -- Menu is hidden, jump backward in the snippet
                        luasnip.jump(-1)
                    else
                        -- No completion/snippet action: Insert a tab character
                        fallback()
                    end
                end, { "i", "s" }),

                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "omni" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
