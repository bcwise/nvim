return {
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },

    config = function()
      require("luasnip-latex-snippets").setup()

      -- Modify existing snippets using higher priority and util function from luasnip-latex-snippets
      local ls = require("luasnip")
      local s = ls.snippet
      local i = ls.insert_node
      local fmta = require("luasnip.extras.fmt").fmta
      local utils = require("luasnip-latex-snippets.util.utils")
      local not_math = utils.with_opts(utils.not_math, false) -- when using treesitter, change false to true

      ls.add_snippets("tex", {
        s(
          { trig = "mk", snippetType = "autosnippet", priority = 100 },
          fmta("$<>$<>", { i(1), i(2) }),
          { condition = not_math }
        ),
        -- ...
      })
    end,
    ft = "tex",

    config = function()
      require("luasnip-latex-snippets").setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup({ enable_autosnippets = true })
    end,
  },
}
