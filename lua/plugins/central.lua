local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN:  central.vim
  -- GitHub:  her/central.vim
  -- Comment: Manages your backup, swap, and undo directories and files.
  --------------------------------------------------------------------
  {
    "her/central.vim",
    lazy = false,
    config = function()
      cmd("let g:central_cleanup_enable = 30")
      cmd("let g:central_multiple_backup_enable = 50")
    end,
  },
} -- Return Plugins  !
