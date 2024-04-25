-- add any tools you want to have installed below
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "cmake-language-server",
      "flake8",
      "json-lsp",
      "lua-language-server",
      "pyright",
      "ruby-lsp",
      "shellcheck",
      "sqls",
      "texlab",
      "typescript-language-server",
    },
  },
}
