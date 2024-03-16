--------------------------------------------------------------------------------
-- Plugin: neovim/nvim-lspconfig"
--------------------------------------------------------------------------------
return {
  "neovim/nvim-lspconfig",
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim.
  import = "lazyvim.plugins.extras.lang.typescript",
  opts = {
    ---@type lspconfig.options
    servers = {
      --------------------------------------------------------------------------
      -- Server: clangd
      -- Notes:
      --    Ensure mason installs the server
      --------------------------------------------------------------------------
      clangd = {
        mason = false, -- We will use our own clangd
        keys = {
          { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
            fname
          ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "/usr/bin/clangd",
          "-j6",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },

      --------------------------------------------------------------------------
      -- pyright will be automatically installed with mason and loaded with lspconfig
      --------------------------------------------------------------------------
      pyright = {},
      ruff_lsp = {
        keys = {
          {
            "<leader>co",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Organize Imports",
          },
        },
      },
    },
  },

  setup = {
    --------------------------------------------------------------------------
    -- Setup: clangd
    -- Notes:
    --------------------------------------------------------------------------
    clangd = function(_, opts)
      local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
      require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
      return false
    end,
  },

  --------------------------------------------------------------------------
  -- Setup: python
  -- Notes:
  --------------------------------------------------------------------------
  ruff_lsp = function()
    require("lazyvim.util").lsp.on_attach(function(client, _)
      if client.name == "ruff_lsp" then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    end)
  end,
}
