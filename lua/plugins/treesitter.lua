--------------------------------------------------------------------------------
-- Plugin: nvim-treesitter/nvim-treesitter
-- Comment: Add more treesitter parsers
--------------------------------------------------------------------------------
return {
  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists,
  -- use the code below to extend the default config.
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "c",
      "cpp",
      "html",
      "java",
      "lua",
      "markdown",
      -- "markdown-incline",
      "ninja",
      "python",
      "query",
      "regex",
      "rst",
      "ruby",
      "rust",
      "toml",
      "vim",
      "tsx",
      "typescript",
    })
  end,
}
