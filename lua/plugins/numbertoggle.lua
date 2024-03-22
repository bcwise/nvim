--------------------------------------------------------------------
-- PLUGIN:  vim-numbertoggle
-- GitHub:  jeffkreeftmeijer/vim-numbertoggle
-- Comment: Switches between relative and hybrid number modes
--------------------------------------------------------------------
return {
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    keys = { { "<C-n>", ":set relativenumber!<cr>", desc = "Switch between number modes" } },
  },
}
