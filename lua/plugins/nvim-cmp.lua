--------------------------------------------------------------------
-- PLUGIN:  CMP
-- GitHub:  hrsh7th/nvim-cmp
-- Comment: Adds SuperTab support in nvim-cmp.
--------------------------------------------------------------------
return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,

    dependencies = {
      { "hrsh7th/cmp-calc", lazy = false },
      { "hrsh7th/cmp-emoji", lazy = false },
      { "kdheepak/cmp-latex-symbols", lazy = false },
      { "hrsh7th/cmp-omni", lazy = false },
      { "ray-x/cmp-treesitter", lazy = false },
      { "onsails/lspkind.nvim", lazy = false },
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "calc" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "crates" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "latex" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "omni" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "treesitter" } }))

      table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      opts.formatting = {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            calc = "[Calc]",
            latex_symbols = "[Latex]",
            LuaSnip = "[LuaSnip]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            path = "[PATH]",
            omni = "[Omni]",
            snippy = "[Snippy]",
            treesitter = "[Tree]",
            ultisnips = "[US]",
            vsnip = "[VSnip]",
          },
        }),
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- cmp.confirm({ select = true })
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            -- elseif require("luasnip").expand_or_locally_jumpable() then
            --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
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
}
