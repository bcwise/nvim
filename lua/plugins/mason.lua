-- add any tools you want to have installed below
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "bash-language-server",
          "black",
          "cmake-language-server",
          "json-lsp",
          "lua-language-server",
          "marksman",
          "prettier",
          "python-lsp-server",
          "ruby-lsp",
          "rust-analyzer",
          "shellcheck",
          "sqls",
          "stylua",
          "texlab",
          "typescript-language-server",
        },
      })
    end,
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "bash-language-server",
  --       "cmake-language-server",
  --       "json-lsp",
  --       "lua-language-server",
  --       "ruby-lsp",
  --       "shellcheck",
  --       "sqls",
  --       "texlab",
  --       "typescript-language-server",
  --     },
  --   },
  -- },
}
