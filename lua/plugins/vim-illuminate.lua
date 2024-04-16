--------------------------------------------------------------------
-- PLUGIN:  vim-illuminate
-- Comment: Neovim plugin to highlight other matches of words under
--          the cursor.
--------------------------------------------------------------------
return {
  {
    "RRethy/vim-illuminate",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
  },
} -- Return Plugins  !
