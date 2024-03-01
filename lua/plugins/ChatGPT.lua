local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN:  ChatGPT
  -- GitHub:  jackMort/ChatGPT
  -- Comment: ChatGPT interface
  --------------------------------------------------------------------
  {
    "jackMort/ChatGPT.nvim",
    lazy = false,
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
} -- Return Plugins  !
