--------------------------------------------------------------------
-- PLUGIN:  colorizer
-- Comment: A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
--------------------------------------------------------------------
return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
}
