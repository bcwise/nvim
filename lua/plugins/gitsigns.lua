return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({

        -- opts = {

        signs = {
          add = { text = "▎" }, -- (green) vertical bar
          change = { text = "▎" }, -- (orange) vertical bar
          delete = { text = "" },
          topdelete = { text = "" }, -- (pink) right arrowhead
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gitsigns = package.loaded.gitsigns
          local border = {
            { "🭽", "FloatBorder" },
            { "▔", "FloatBorder" },
            { "🭾", "FloatBorder" },
            { "▕", "FloatBorder" },
            { "🭿", "FloatBorder" },
            { "▁", "FloatBorder" },
            { "🭼", "FloatBorder" },
            { "▏", "FloatBorder" },
          }
          gitsigns.signcolumn = true
          gitsigns.numhl = false -- Toggle with `:Gitsigns toggle_numhl`
          gitsigns.linehl = false -- Toggle with `:Gitsigns toggle_linehl`
          gitsigns.word_diff = false -- Toggle with `:Gitsigns toggle_word_diff`
          gitsigns.watch_gitdir = {
            interval = 1000,
            follow_files = true,
          }
          gitsigns.auto_attach = true
          gitsigns.attach_to_untracked = true

          gitsigns.sign_priority = 6
          gitsigns.update_debounce = 100
          gitsigns.status_formatter = nil -- Use default
          gitsigns.max_file_length = 100000
          gitsigns.yadm = { enable = false }
          gitsigns.preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
          }

          ----------------------------
          -- Blame line settings
          ----------------------------
          gitsigns.current_line_blame = true -- Toggle with `:Gitsigns toggle_current_line_blame`
          gitsigns.current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
          }
          gitsigns.current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>"
          gitsigns.current_line_blame_formatter_opts = {
            relative_time = false,
          }

          ----------------------------
          -- Mapping
          ----------------------------
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]h", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[h", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>hr", gitsigns.reset_hunk)
          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          map("n", "<leader>hR", gitsigns.reset_buffer)
          map("n", "<leader>hS", gitsigns.stage_buffer)
          map("n", "<leader>hu", gitsigns.undo_stage_hunk)
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end)
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>hd", gitsigns.diffthis)
          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end)
          map("n", "<leader>td", gitsigns.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
        -- },
      })
    end,
  },
}
