-- add any tools you want to have installed below
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "black",
        "cmake-language-server",
        "json-lsp",
        "lua-language-server",
        "ruby-lsp",
        "shellcheck",
        "shfmt",
        "sqls",
        "stylua",
        "texlab",
        "typescript-language-server",
      },

      -- config = function()
      --   require("mason").setup({
      --     ui = {
      --       icons = {
      --         package_installed = "✓",
      --         package_pending = "➜",
      --         package_uninstalled = "✗",
      --       },
      --     },
      --   })
      -- end,
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
}
