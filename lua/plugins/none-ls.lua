--------------------------------------------------------------------
-- PLUGIN:  none-ls.nvim
-- GitHub:  nvimtools/none-ls.nvim
-- Comment: Manages LSPs.
--------------------------------------------------------------------
return {
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function(_, opts)
      local nls = require("null-ls")

      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, { nls.builtins.diagnostics.cmake_lint })
      opts.sources = vim.list_extend(opts.sources or {}, { nls.builtins.diagnostics.markdownlint })
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
      })
    end,
  },
}
