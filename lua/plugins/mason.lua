--------------------------------------------------------------------
-- PLUGIN:  Mason
-- GitHub:  williamboman/mason.nvim
-- Comment: Manages LSPs
--          Add any tools you want to have installed below
--------------------------------------------------------------------
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Arduino
      vim.list_extend(opts.ensure_installed, { "arduino-language-server" })

      -- C, C++
      vim.list_extend(opts.ensure_installed, { "clangd" })
      vim.list_extend(opts.ensure_installed, { "clang-format" })
      vim.list_extend(opts.ensure_installed, { "cpplint" })

      -- cmake
      vim.list_extend(opts.ensure_installed, { "cmakelang", "cmakelint" })

      -- erlang
      vim.list_extend(opts.ensure_installed, { "erlang-ls" })

      -- Java
      vim.list_extend(opts.ensure_installed, { "java-test", "java-debug-adapter" })

      -- json
      -- vim.list_extend(opts.ensure_installed, { "json.lsp" })

      -- LaTeX, TeX, BibTeX
      vim.list_extend(opts.ensure_installed, { "latexindent" })
      vim.list_extend(opts.ensure_installed, { "texlab" })
      vim.list_extend(opts.ensure_installed, { "ltex-ls" })

      -- Lua
      vim.list_extend(opts.ensure_installed, { "lua-language-server" })
      vim.list_extend(opts.ensure_installed, { "luacheck" })
      vim.list_extend(opts.ensure_installed, { "luaformatter" })
      vim.list_extend(opts.ensure_installed, { "stylua" })

      -- CMake/Make
      vim.list_extend(opts.ensure_installed, { "cmake-language-server" })
      vim.list_extend(opts.ensure_installed, { "cmakelang" })
      vim.list_extend(opts.ensure_installed, { "cmakelint" })
      -- vim.list_extend(opts.ensure_installed, { "make-language-server" })

      -- Markdown
      vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })

      -- Protobufs
      vim.list_extend(opts.ensure_installed, { "buf" })
      vim.list_extend(opts.ensure_installed, { "buf-language-server" })

      -- Python
      vim.list_extend(opts.ensure_installed, { "debugpy" })
      vim.list_extend(opts.ensure_installed, { "flake8" })
      vim.list_extend(opts.ensure_installed, { "pyflakes" })
      vim.list_extend(opts.ensure_installed, { "pylama" })
      vim.list_extend(opts.ensure_installed, { "pylint" })
      vim.list_extend(opts.ensure_installed, { "pylyzer" })
      -- vim.list_extend(opts.ensure_installed, { "pyright" })
      vim.list_extend(opts.ensure_installed, { "python-lsp-server" })

      -- Rust
      vim.list_extend(opts.ensure_installed, { "rust-analyzer" })
      vim.list_extend(opts.ensure_installed, { "rustfmt" })

      -- Shell scrips
      vim.list_extend(opts.ensure_installed, { "bash-language-server" })
      vim.list_extend(opts.ensure_installed, { "shellcheck" })
      vim.list_extend(opts.ensure_installed, { "shfmt" })

      -- Spell
      vim.list_extend(opts.ensure_installed, { "codespell" })
      vim.list_extend(opts.ensure_installed, { "cspell" })
      vim.list_extend(opts.ensure_installed, { "misspell" })

      -- SQL
      vim.list_extend(opts.ensure_installed, { "sql-formatter" })
      vim.list_extend(opts.ensure_installed, { "sqlfluff" })
      vim.list_extend(opts.ensure_installed, { "sqlfmt" })
      vim.list_extend(opts.ensure_installed, { "sqlls" })

      -- Text
      -- vim.list_extend(opts.ensure_installed, { "vale" })

      -- Vim
      vim.list_extend(opts.ensure_installed, { "vim-language-server" })
      vim.list_extend(opts.ensure_installed, { "vint" })

      -- Web Dev
      -- vim.list_extend(opts.ensure_installed, { "html-lsp" })
      -- vim.list_extend(opts.ensure_installed, { "htmlbeautifier" })
      -- vim.list_extend(opts.ensure_installed, { "css-lsp" })
      -- vim.list_extend(opts.ensure_installed, { "typescript-language-server" })
      -- vim.list_extend(opts.ensure_installed, { "prettier" })

      -- YAML
      -- vim.list_extend(opts.ensure_installed, { "yamlfix" })
      -- vim.list_extend(opts.ensure_installed, { "yamlfmt" })
      -- vim.list_extend(opts.ensure_installed, { "yamllint" })
    end,
  },
}
