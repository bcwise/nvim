local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN:  LuaSnip
  -- GitHub:  L3MON4D3/LuaSnip
  -- Comment: Disable default <tab> and s-tab> behavior in LuaSnip.
  --          We'll add tab support back in with Supertab in nvim-cmp.
  --------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
} -- Return Plugins  !
