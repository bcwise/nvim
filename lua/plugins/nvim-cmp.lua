--------------------------------------------------------------------------------
-- Plugin: hrsh7th/nvim-cmp
--------------------------------------------------------------------------------
return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        completion = {
          -- completeopt = "menu,menuone,noinsert,noselect",
          completeopt = "menu,menuone,noinsert",
        },
        sources = cmp.config.sources({
          { name = "calc" }, -- snippets
          { name = "crates" }, -- snippets
          { name = "latex" }, -- snippets
          { name = "omni" }, -- snippets
          { name = "path" }, -- file system paths
          { name = "treesitter" }, -- snippets
          { name = "luasnip" },
          { name = "nvim_lsp" },
        }, { { name = "buffer" } }),
      })
    end,

    opts = function(_, opts)
      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      table.insert(opts.sources, { name = "luasnip" })

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- configure lspkind for vs-code like pictograms in completion menu formatting = {
      opts.format = lspkind.cmp_format({
        maxwidth = 50,
        mode = "symbol_text",
        ellipsis_char = "...",
        menu = {
          buffer = "[Buffer]",
          calc = "[Calc]",
          latex_symbols = "[Latex]",
          luasnip = "[LuaSnip]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[PATH]",
          omni = "[Omni]",
          snippy = "[Snippy]",
          snippet = "[Snippet]",
          treesitter = "[Tree]",
          ultisnips = "[US]",
          vsnip = "[VSnip]",
        },
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
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

      -- sources for autocompletion
      sources =
        cmp.config.sources({
          { name = "buffer" }, -- text within current buffer
          { name = "calc" }, -- snippets
          { name = "crates" }, -- snippets
          { name = "latex" }, -- snippets
          { name = "luasnip" }, -- snippets
          { name = "nvim_lsp" },
          { name = "omni" }, -- snippets
          { name = "path" }, -- file system paths
          { name = "treesitter" }, -- snippets
        }),
        -- Scoring
        table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
    end,
  },
}
