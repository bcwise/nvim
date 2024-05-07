return {

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "petertriho/cmp-git",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```

    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local lspconfig = require("lspconfig")
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      local buffer_option = {
        -- Complete from all visible buffers (splits)
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      }
      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        experimental = { ghost_text = true },
        lazy = false,
        completion = cmp.mapping.preset.cmdline({ completeopt = "menu,menuone,noinsert" }),

        formatting = {
          fields = { "kind", "menu", "abbr" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({
              show_labelDetails = true,
              mode = "symbol_text",
              maxwidth = 50,
              minwidth = 40,
              menu = {
                buffer = "[Buffer]",
                calc = "[Calc]",
                latex_symbols = "[Latex]",
                LuaSnip = "[LuaSnip]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                path = "[PATH]",
                snippy = "[Snippy]",
                treesitter = "[Tree]",
                ultisnips = "[US]",
                vsnip = "[VSnip]",
              },
            })(entry, vim_item)

            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "(" .. (strings[2] or "") .. ")"
            return kind
          end,
        },

        -- formatting = {
        --   -- fields = { "kind", "abbr", "menu" },
        --   fields = { "kind", "menu", "abbr" },
        --   format = lspkind.cmp_format({
        --     with_text = false,
        --     maxwidth = 50,
        --     show_labelDetails = false,
        --     mode = "symbol_text",
        --     menu = {
        --       buffer = "[Buffer]",
        --       calc = "[Calc]",
        --       cmdline = "[Cmd]",
        --       friendly = "[Friend]",
        --       latex_symbols = "[LaTeX]",
        --       luasnip = "[LuaSnip]",
        --       lsp = "[LSP]",
        --       nvim_lsp = "[LSP]",
        --       nvim_lua = "[Lua]",
        --       path = "[PATH]",
        --       snippy = "[Snippy]",
        --       treesitter = "[Tree]",
        --       ultisnips = "[US]",
        --       vsnip = "[VSnip]",
        --     },
        --   }),
        -- },

        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = function(fallback)
            -- Reference: https://github.com/hrsh7th/nvim-cmp/issues/429#issuecomment-954121524
            cmp.abort()
          end,
          ["<Space>"] = function(fallback)
            -- Reference: https://github.com/hrsh7th/nvim-cmp/issues/429#issuecomment-954121524
            cmp.abort()
            fallback()
          end,
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert, -- Don't delete the word to the right
            select = false,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- expand_or_locally_jumpable prevents the snippet from being re-entered.
              --
              -- Reference: https://github.com/L3MON4D3/LuaSnip/issues/799
              --
              -- elseif require("luasnip").expand_or_jumpable() then
              --
              -- There's apparently other approaches that do the same thing which I haven't tried.
              --
              -- e.g. ``region_check_events`` from https://github.com/L3MON4D3/LuaSnip/issues/770
              -- e.g. ``leave_snippet`` from https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
              --
            elseif require("luasnip").expand_or_locally_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },

        sources = {
          { name = "copilot", max_item_count = 3 },
          { name = "nvim_lsp", priority = 20, max_item_count = 5, entry_filter = limit_lsp_types },
          { name = "buffer", priority = 10, keyword_length = 2, max_item_count = 5, option = buffer_option },
          { name = "npm", priority = 9 },
          { name = "git" },
          { name = "luasnip", max_item_count = 5 },
          { name = "friendly-snippets", priority = 7, max_item_count = 5 },
          { name = "spell", priority = 5 },
          -- {
          --   name = "spell",
          --   option = {
          --     keep_all_entries = false,
          --     enable_in_context = function()
          --       return require("cmp.config.context").in_treesitter_capture("spell")
          --     end,
          --   },
          -- },
          { name = "cmdline" },
          { name = "path", priority = 10 },
          { name = "calc" },
          { name = "emoji" },
        },

        sorting = {
          priority_weight = 2,
          comparators = {
            -- deprioritize_snippet,
            -- copilot_cmp_comparators.prioritize or function() end,
            cmp.config.compare.exact,
            cmp.config.compare.locality,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.offset,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
          },
        },

        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            col_offset = -3,
            side_padding = 0,
          }),
        }, -- window
      }) -- cmp.setp()

      -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).

      -- cmp.setp.cmdline({ "/", "?" }, {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer" },
      --   },
      -- })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }, {
          { name = "buffer" },
        }),
      })
    end,

    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local defaults = require("cmp.config.default")()
      local lspkind = require("lspkind")

      --- Get completion context, i.e., auto-import/target module location.
      --- Depending on the LSP this information is stored in different parts of the
      --- lsp.CompletionItem payload. The process to find them is very manual: log the payloads
      --- And see where useful information is stored.
      ---@param completion lsp.CompletionItem
      ---@param source cmp.Source
    end,

    opts = function(_, opts)
      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      table.insert(opts.sources, { name = "luasnip" })
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
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
    end,
  },

  ------------------------------------------------------------------------------
  -- Adding lspkind
  ------------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- opts.formatting = {
      --   fields = { "kind", "abbr", "menu" },
      --   format = function(entry, item)
      --     local kind = require("lspkind").cmp_format({
      --       show_labelDetails = true,
      --       mode = "symbol_text",
      --       -- maxwidth = 50,
      --       -- minwidth = 40,
      --       -- menu = {
      --       --   buffer = "[Buffer]",
      --       --   calc = "[Calc]",
      --       --   latex_symbols = "[Latex]",
      --       --   LuaSnip = "[LuaSnip]",
      --       --   nvim_lsp = "[LSP]",
      --       --   nvim_lua = "[Lua]",
      --       --   path = "[PATH]",
      --       --   snippy = "[Snippy]",
      --       --   treesitter = "[Tree]",
      --       --   ultisnips = "[US]",
      --       --   vsnip = "[VSnip]",
      --       -- },
      --     })(entry, item)
      --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
      --     kind.kind = (strings[1] or "")
      --     kind.menu = "    (" .. (strings[2] or "") .. ")"
      --     return kind
      --   end,
      -- }
    end,
  },
}
