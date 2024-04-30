--------------------------------------------------------------------
-- PLUGIN:  yanky.lua
-- GitHub:  gbprod/yanky.nvim
-- Comment: Neovim plugin to browse the file system and other tree-like
--          structures.
--------------------------------------------------------------------
local map = vim.keymap.set

return {
  {
    "gbprod/yanky.nvim",
    keys = {
      {
        "<leader>y",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
    },
    opts = {
      ring = {
        history_length = 100,
        storage = "shada",
        storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
        update_register_on_cycle = false,
      },
      picker = {
        select = {
          action = nil, -- nil to use default put action
        },
        telescope = {
          use_default_mappings = true, -- if default mappings should be used
          mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
        },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
      preserve_cursor_position = {
        enabled = true,
      },
      textobj = {
        enabled = true,
      },
    },
  },
} -- Return Plugins  !
