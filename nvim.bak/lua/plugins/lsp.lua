return {

  ---------------------------------------------------------------------------
  -- Mason: install LSP servers (no auto-configuration)
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- PURE vim.lsp.config SETUP (NO lspconfig, NO deprecated APIs)
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig", 
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -----------------------------------------------------------------------
      -- Helper: define an LSP server using vim.lsp.config
      -----------------------------------------------------------------------
      local function define_server(name, opts)
        vim.lsp.config[name] = vim.tbl_extend("force", {
          name = name,
          cmd = opts.cmd,
          filetypes = opts.filetypes,
          root_dir = opts.root_dir or function(fname)
            return vim.fs.root(fname, {
              ".git",
            }) or vim.fs.dirname(fname)
          end,
          capabilities = capabilities,
        }, opts.settings or {})

        -- Autostart server for matching filetypes
        vim.api.nvim_create_autocmd("FileType", {
          pattern = opts.filetypes,
          callback = function(args)
            local buf = args.buf
            local fname = vim.api.nvim_buf_get_name(buf)

            -- avoid duplicate clients
            for _, c in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
              if c.name == name then
                return
              end
            end

            vim.lsp.start(vim.lsp.config[name], { bufnr = buf })
          end,
        })
      end

      -----------------------------------------------------------------------
      -- Modern LSP servers (NO lspconfig.setup)
      -----------------------------------------------------------------------

      define_server("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      })

      define_server("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
      })

      define_server("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })

      define_server("bashls", {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
      })

      define_server("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },
      })

      define_server("html", {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
      })

      define_server("cssls", {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
      })

      define_server("jsonls", {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json" },
      })

      define_server("yamlls", {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
      })

      define_server("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },

        root_dir = function(fname)
          return vim.fs.root(fname, {
            "go.work",
            "go.mod",
            ".git",
          }) or vim.fs.dirname(fname)
        end,
      })

      define_server("rust_analyzer", {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },

        root_dir = function(fname)
          return vim.fs.root(fname, {
            "Cargo.toml",
            "rust-project.json",
            ".git",
          }) or vim.fs.dirname(fname)
        end,

        settings = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      })
    end,
  },

}
