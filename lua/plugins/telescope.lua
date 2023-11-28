--------------------------------------------------------------------
-- PLUGIN:  telescope
-- GitHub:  nvim-telescope/telescope.nvim
-- Comment: Telescope stuff
--------------------------------------------------------------------
return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      local Util = require("lazy.core.util")
      ----------------------------------------------
      -- Aerial
      ----------------------------------------------
      -- Util.on_load("telescope.nvim", function()
      --   require("telescope").load_extension("aerial")
      -- end)
    end,
    ----------------------------------------------
    -- Keys
    ----------------------------------------------
    keys = {
      {
        "<leader>ss",
        "<cmd>Telescope aerial<cr>",
        desc = "Goto Symbol (Aerial)",
      },
    },
  },
}
