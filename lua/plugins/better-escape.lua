local cmd = vim.cmd
local global = vim.g

return {

  --------------------------------------------------------------------
  -- PLUGIN:  better-escape.nvim
  -- GitHub: max397574/better-escape.nvim
  -- Comment: A better escape handler.
  --------------------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
    keys = {
      { "H", false },
    },
  },
} -- Return Plugins  !
