--------------------------------------------------------------------
-- PLUGIN:  crates
-- GitHub:  Saecki/crates.nvim
-- Comment: Cargo LSP
--------------------------------------------------------------------
return {
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      src = {
        cmp = { enabled = true },
      },
    },
  },
}
