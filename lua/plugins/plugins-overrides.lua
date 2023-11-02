return {

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "kdheepak/cmp-latex-symbols",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "f3fora/cmp-spell",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "calc" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmdline" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "latex-symbols" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "nvim-lsp-signature-help" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "spell" } }))
    end,
  },
  --------------------------------------------------------------------
  -- PLUGIN:  nvim-conv
  -- GitHub:  http://github.com/simonefranza/nvim-conv
  -- Comment: A simple converter that allows you to convert:
  --            numbers from a base to another
  --               * sequences of bytes to a string and vice-versa
  --               * values from one unit to another one (temperature, metric and imperial units, data transfer rate)
  --               * colors between hex, rgb, hslnumbers from a base to another
  --               * sequences of bytes to a string and vice-versa
  --               * values from one unit to another one (temperature, metric and imperial units, data transfer rate)
  --               * colors between hex, rgb, hsl
  --------------------------------------------------------------------
  {
    "simonefranza/nvim-conv",
    lazy = false,
  },
  --------------------------------------------------------------------
  -- PLUGIN:  telescope.nvim
  -- GitHub: nvim-telescope/telescope.nvim
  -- Comment: Displays
  --------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      completion = {
        completeopt = "menu,menuone",
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      prompt_prefix = "   ",
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        --
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          --     ["<Tab>"] = cmp.mapping(function(fallback)
          --       if cmp.visible() then
          --         cmp.select_next_item()
          --       elseif require("luasnip").expand_or_jumpable() then
          --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          --       else
          --         fallback()
          --       end
          --     end, {
          --       "i",
          --       "s",
          --     }),
          --     ["<S-Tab>"] = cmp.mapping(function(fallback)
          --       if cmp.visible() then
          --         cmp.select_prev_item()
          --       elseif require("luasnip").jumpable(-1) then
          --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          --       else
          --         fallback()
          --       end
          --     end, {
          --       "i",
          --       "s",
          --     }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end,
    },
  },
}
