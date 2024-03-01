local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN:  EasyAlign
  -- GitHub:  junegunn/vim-easy-align
  -- Comment: Helps align text
  --------------------------------------------------------------------
  {
    "junegunn/vim-easy-align",
    lazy = false,
    config = function()
      vim.g.easy_align_indentation = "s"
    end,
  },
} -- Return Plugins  !
