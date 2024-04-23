return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gitsigns = package.loaded.gitsigns

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
        map("n", "<leader>hs", gitsigns.stage_hunk)
        map("n", "<leader>hr", gitsigns.reset_hunk)
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<leader>hS", gitsigns.stage_buffer)
        map("n", "<leader>hu", gitsigns.undo_stage_hunk)
        map("n", "<leader>hR", gitsigns.reset_buffer)
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
    },
  },
}

-- local function map(mode, l, r, desc)
--   vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
-- end
--
-- -- stylua: ignore start
-- map("n", "]h", gs.next_hunk, "Next Hunk")
-- map("n", "[h", gs.prev_hunk, "Prev Hunk")
-- map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
-- map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
-- map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
-- map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
-- map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
-- map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
-- map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
-- map("n", "<leader>ghd", gs.diffthis, "Diff This")
-- map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
-- end,
--   {
--
--     "lewis6991/gitsigns.nvim",
--     opts = {
--       ----------------------------
--       -- Signs for the signcolumn
--       ----------------------------
--       signs = {
--         add = { text = "▎" },
--         change = { text = "▎" },
--         delete = { text = "" },
--         topdelete = { text = "" },
--         changedelete = { text = "▎" },
--         untracked = { text = "▎" },
--       },
--       signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
--       numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
--       linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
--       word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
--       watch_gitdir = {
--         interval = 1000,
--         follow_files = true,
--       },
--       attach_to_untracked = true,
--
--       ----------------------------
--       -- Blame line settings
--       ----------------------------
--       current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
--       current_line_blame_opts = {
--         virt_text = true,
--         virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
--         delay = 1000,
--         ignore_whitespace = false,
--       },
--       current_line_blame_formatter_opts = {
--         relative_time = false,
--       },
--
--       ----------------------------
--       -- Other flags
--       ----------------------------
--       sign_priority = 6,
--       update_debounce = 100,
--       status_formatter = nil, -- Use default
--       max_file_length = 40000,
--       preview_config = {
--         -- Options passed to nvim_open_win
--         border = "single",
--         style = "minimal",
--         relative = "cursor",
--         row = 0,
--         col = 1,
--       },
--       yadm = {
--         enable = false,
--       },
--     },
--     on_attach = function(bufnr)
--       local gs = package.loaded.gitsigns
--
--       local function map(mode, l, r, desc)
--         vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
--       end
--
--       -- local function map(mode, l, r, desc)
--       --   -- opts = opts or {}
--       --   -- opts.uffer = bufnr
--       --   vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
--       -- end
--
--       -- Navigation
--       map("n", "]c", function()
--         if vim.wo.diff then
--           vim.cmd.normal({ "]c", bang = true })
--         else
--           gitsigns.nav_hunk("next")
--         end
--       end)
--
--       map("n", "[c", function()
--         if vim.wo.diff then
--           vim.cmd.normal({ "[c", bang = true })
--         else
--           gitsigns.nav_hunk("prev")
--         end
--       end)
--
--       -- Actions
--       map("n", "<leader>hs", gitsigns.stage_hunk)
--       map("n", "<leader>hr", gitsigns.reset_hunk)
--       map("v", "<leader>hs", function()
--         gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
--       end)
--       map("v", "<leader>hr", function()
--         gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
--       end)
--       map("n", "<leader>hS", gitsigns.stage_buffer)
--       map("n", "<leader>hu", gitsigns.undo_stage_hunk)
--       map("n", "<leader>hR", gitsigns.reset_buffer)
--       map("n", "<leader>hp", gitsigns.preview_hunk)
--       map("n", "<leader>hb", function()
--         gitsigns.blame_line({ full = true })
--       end)
--       map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
--       map("n", "<leader>hd", gitsigns.diffthis)
--       map("n", "<leader>hD", function()
--         gitsigns.diffthis("~")
--       end)
--       map("n", "<leader>td", gitsigns.toggle_deleted)
--
--       -- Text object
--       map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
--     end,
--   },
-- }
