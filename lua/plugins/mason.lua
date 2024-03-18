--------------------------------------------------------------------------------
-- Plugin: williamboman/mason.nvim
--------------------------------------------------------------------------------
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "sqls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
