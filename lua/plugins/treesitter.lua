--------------------------------------------------------------------
-- PLUGIN:  treesitter
-- GitHub:  "nvim-treesitter/nvim-treesitter",
-- Comment: Syntax parsing
--------------------------------------------------------------------
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c", "cpp" })
        vim.list_extend(opts.ensure_installed, { "cmake" })
        vim.list_extend(opts.ensure_installed, { "java" })
        vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" })
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
        vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
      end

      -----------------------------------------------------
      -- LaTeX
      -----------------------------------------------------
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
      end
      if type(opts.highlight.disable) == "table" then
        vim.list_extend(opts.highlight.disable, { "latex" })
      else
        opts.highlight.disable = { "latex" }
      end
    end,
  },
}
