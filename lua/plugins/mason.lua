--------------------------------------------------------------------------------
-- Plugin: williamboman/mason.nvim
--------------------------------------------------------------------------------
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "sqlls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
