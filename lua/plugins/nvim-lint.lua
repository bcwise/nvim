--------------------------------------------------------------------
-- PLUGIN:  nvim-lint
-- GitHub:  mfussenegger/nvim-lint
-- Comment: LSP Linter
--------------------------------------------------------------------
return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = { cmake = { "cmakelint" }, markdown = { "markdownlint" } },
    },
  },
}
