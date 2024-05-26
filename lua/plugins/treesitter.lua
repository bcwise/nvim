return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "arduino",
        "bash",
        "bibtex",
        "c",
        "cmake",
        "comment",
        "cpp",
        "disassembly",
        "diff",
        "dockerfile",
        "doxygen",
        "erlang",
        "gitattributes",
        "gitcommit",
        "git_config",
        "gitignore",
        "git_rebase",
        "go",
        "haskell",
        "haskell_persistent",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "objdump",
        "perl",
        "printf",
        "puppet",
        "python",
        "query",
        "readline",
        "regex",
        "ruby",
        "rust",
        "sql",
        "strace",
        "toml",
        "turtle",
        "typescript",
        "udev",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  --   {
  --     "nvim-treesitter/nvim-treesitter",
  --     opts = function(_, opts)
  --       -- add tsx and treesitter
  --       vim.list_extend(opts.ensure_installed, {
  --         "arduino",
  --         "bibtex",
  --         "cmake",
  --         "comment",
  --         "c",
  --         "cpp",
  --         "diff",
  --         "disassembly",
  --         "dockerfile",
  --         "doxygen",
  --         "erlang",
  --         "git_config",
  --         "git_rebase",
  --         "gitattributes",
  --         "gitcommit",
  --         "gitignore",
  --         "go",
  --         "haskell",
  --         "haskell_persistent",
  --         "html",
  --         "java",
  --         "javascript",
  --         "json",
  --         "latex",
  --         "make",
  --         "objdump",
  --         "perl",
  --         "printf",
  --         "puppet",
  --         "readline",
  --         "ruby",
  --         "rust",
  --         "sql",
  --         "strace",
  --         "toml",
  --         "turtle",
  --         "udev",
  --       })
  --     end,
  --   },
}
