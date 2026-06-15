return {
  -- VimTeX
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },
    init = function()
      require("configs.vimtex")
    end,
  },

  -- Math symbols completion
  {
    "kdheepak/cmp-latex-symbols",
    ft = { "tex", "plaintex" },
  },

  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "latex",
        "bibtex",
      })

      return opts
    end,
  },
}
