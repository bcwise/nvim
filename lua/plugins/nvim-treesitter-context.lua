--------------------------------------------------------------------------------
-- Plugin: nvim-treesitter-context
-- Comments: Show context of the current function
--------------------------------------------------------------------------------
return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = { mode = "cursor", max_lines = 3 },
}
