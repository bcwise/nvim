return {
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@class ConformOpts
      local opts = {
        ---@type table<string, conform.FormatterUnit[]>
        formatters_by_ft = {
          c = { "clang-format" },
          -- cmake = { "cmake_format" },
          cpp = { "clang-format" },
          css = { "prettier" },
          graphql = { "prettier" },
          handlebars = { "prettier" },
          html = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          jsonc = { "prettier" },
          json = { "prettier" },
          latex = { "latexindent" },
          less = { "prettier" },
          lua = { "stylua" },
          markdown = { "prettier", "markdown-toc" },
          perl = { "perltidy" },
          python = { "black" },
          rust = { "rustfmt" },
          scss = { "prettier" },
          sh = { "shfmt" },
          sql = { "sqlfluff", "sqlfmt" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          yaml = { "prettier", "yamlfix", "yamlfmt" },
        },

        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          "awk",
          buf,
          codespell,
          prettier,
          shellcheck,
          shellharden,
          shfmt,
          trim_newlines,
          trim_whitespace,
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          shfmt = {
            prepend_args = { "-i", "2", "-ci" },
          },
        },
        --he options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
      }
      return opts
    end,
  },
}
