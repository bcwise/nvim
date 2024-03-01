local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN: Window-Picker
  -- Github: s1n7ax/nvim-window-picker
  -- Comment: Adding clang options.
  --------------------------------------------------------------------
  {
    "s1n7ax/nvim-window-picker",
    lazy = false,
    name = "window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
} -- Return Plugins  !
