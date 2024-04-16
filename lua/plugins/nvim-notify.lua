--------------------------------------------------------------------
-- PLUGIN:  nvim-notify
-- GitHub:  rcarriga/nvim-notify
-- Comment: A fancy, configurable, notification manager for Neovim.
--------------------------------------------------------------------
return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    keys = {
      {
        "<leader>n",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Open Yank History",
      },
    },
  },
}
