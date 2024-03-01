--------------------------------------------------------------------
-- PLUGIN:  treesitter
-- GitHub:  "nvim-treesitter/nvim-treesitter",
-- Comment: Syntax parsing
--------------------------------------------------------------------
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "cmake",
          "dockerfile",
          "html",
          "java",
          "javascript",
          "json",
          "json5",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "ninja",
          "python",
          "query",
          "rst",
          "rust",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
      require("ts_context_commentstring").setup({})

      -----------------------------------------------------
      -- LaTeX
      -----------------------------------------------------
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
        end
        if type(opts.highlight.disable) == "table" then
          vim.list_extend(opts.highlight.disable, { "latex" })
        else
          opts.highlight.disable = { "latex" }
        end
      end
    end,
  },
}
