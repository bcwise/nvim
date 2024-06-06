return {

  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        cmake = { "cmake-lint" },
        javascript = { "jshint" },
        latex = { "chktex", "lacheck" },
        -- lua = { "luacheck" },
        make = { "checkmake" },
        patch = { "checkpath" },
        perl = { "perlcritic" },
        python = { "flake8", "pycodestyle", "pydocstyle", "pylint", "vulture" },
        yaml = { "yamllint" },
        zsh = { "zsh" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
        -- ["*"] = { "typos" },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.j
      ---@type table<string,table>
      linters = {
        blocklint,
        "clang-tidy",
        codespell,
        commitlint,
        htmlhint,
        jsonlint,
        languagetool,
        markdownlint,
        proselint,
        protolint,
        puppetlint,
        rstcheck,
        saltlint,
        ShellCheck,
        sqlfluff,
        stylelint,
        systemdlint,
        typos,
        vint,
        "write-good",
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
  },
}
