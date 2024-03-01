local cmd = vim.cmd
local global = vim.g

return {
  --------------------------------------------------------------------
  -- PLUGIN:  Scroll
  -- GitHub:  karb94/neoscroll.nvim
  -- Comment: A smooth scrolling neovim plugin.
  --------------------------------------------------------------------
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    name = "neoscroll",
    config = function()
      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      -- Use the "sine" easing function
      t["<C-u>"] = { "scroll", { "-0.50", "true", "50", [['quadratic']] } }
      t["<C-d>"] = { "scroll", { "0.50", "true", "50", [['quadratic']] } }
      -- Use the "circular" easing function
      t["<C-b>"] = { "scroll", { "-0.50", "false", "50", [['circular']] } }
      t["<C-f>"] = { "scroll", { "0.50", "false", "50", [['circular']] } }
      -- Pass "nil" to disable the easing animation (constant scrolling speed)
      t["<C-y>"] = { "scroll", { "-0.10", "false", "100", [['quadratic']] } }
      t["<C-e>"] = { "scroll", { " 0.10", "false", "100", [['quadratic']] } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      t["zt"] = { "zt", { "10" } }
      t["zz"] = { "zz", { "10" } }
      t["zb"] = { "zb", { "10" } }

      require("neoscroll.config").set_mappings(t)
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
      require("neoscroll.config").set_mappings(t)
    end,
  },
} -- Return Plugins  !
