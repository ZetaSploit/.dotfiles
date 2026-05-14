return {

  ---------------------------------------------------------------------------
  -- Treesitter for LaTeX
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "latex", "bibtex" })
      return opts
    end,
  },

  ---------------------------------------------------------------------------
  -- LuaSnip + Snippets + Keymaps
  ---------------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    config = function()
      local ls = require("luasnip")
      -----------------------------------------------------------------------
      -- Load all snippet sources
      -----------------------------------------------------------------------
      ls.config.set_config({
        enable_autosnippets = true,
        update_events = "TextChanged, TextChangedI"
      })

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/lua/snippets",
      })

      -----------------------------------------------------------------------
      -- Snippet keymaps (LaTeX only)
      -----------------------------------------------------------------------
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex" },
        callback = function(event)
          local opts = { silent = true, buffer = event.buf }

          -- EXPAND or JUMP forward
          vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end, opts)

          -- JUMP backward
          vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end, opts)

          -- CHOOSE (for choice nodes)
          vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, opts)

          -- Manually reload snippets
          vim.keymap.set("n", "<leader>rs", function()
            require("luasnip.loaders.from_lua").load({
              paths = "~/.config/nvim/snippets",
            })
            print("Snippets reloaded")
          end, opts)
        end,
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Math symbols in completion
  ---------------------------------------------------------------------------
  {
    "kdheepak/cmp-latex-symbols",
    ft = { "tex", "plaintex" },
  },

  ---------------------------------------------------------------------------
  -- VimTeX (Core LaTeX engine)
  ---------------------------------------------------------------------------
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },

    init = function()
      vim.g.tex_flavor = "latex"

      -----------------------------------------------------------------------
      -- Viewer Settings (Zathura + inverse search)
      -----------------------------------------------------------------------
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_general_options = {
        "--synctex-forward",
        "@line:@col:@tex",
        "@pdf",
        "--synctex-editor-command",
        "nvr --remote-silent +%{line} %{input}",
      }

      -----------------------------------------------------------------------
      -- Compiler: latexmk (continuous)
      -----------------------------------------------------------------------
      vim.g.vimtex_compiler_method = "latexmk"

      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-lualatex",
      }

      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-interaction=nonstopmode",
          "-synctex=1",
          "-shell-escape",
        },
      }

      -----------------------------------------------------------------------
      -- Misc VimTeX settings
      -----------------------------------------------------------------------
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_complete_enabled = 1
    end,
  },

}

