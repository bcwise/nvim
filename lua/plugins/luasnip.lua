--------------------------------------------------------------------------------
-- Plugin: L3MON4D3/LuaSnip
--------------------------------------------------------------------------------
return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  "L3MON4D3/LuaSnip",
  keys = function()
    return {}
  end,

  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}