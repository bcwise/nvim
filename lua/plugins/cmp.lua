return {

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"
          return kind
        end,
      }

      opts.window = {
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            col_offset = -3,
            side_padding = 0,
          }),
        },
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            -- elseif luasnip.expand_or_jumpable() then
          elseif luasnip.expand_or_locally_jumpable() then
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

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  ------------------------------------------------------------------------------
  -- Adding clangd
  ------------------------------------------------------------------------------
  -- {
  --   "nvim-cmp",
  --   opts = function(_, opts)
  --     table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
  --   end,
  -- },

  ------------------------------------------------------------------------------
  -- Adding lspkind
  ------------------------------------------------------------------------------
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     opts.formatting = {
  --       fields = { "kind", "abbr", "menu" },
  --       format = function(entry, item)
  --         local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
  --         local strings = vim.split(kind.kind, "%s", { trimempty = true })
  --         kind.kind = " " .. (strings[1] or "") .. " "
  --         kind.menu = "    (" .. (strings[2] or "") .. ")"
  --         return kind
  --       end,
  --     }
  --   end,
  -- },
}
