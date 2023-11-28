-- TODO Lismp
--  Configure EasyAlign correctly
--  Add DeleteTrailingWhitespace

local cmd = vim.cmd
local global = vim.g

return {

  --------------------------------------------------------------------
  -- DISABLE THE FOLLOWING PLUGINS
  --------------------------------------------------------------------
  { "simrat39/symbols-outline.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },

  --------------------------------------------------------------------
  -- PLUGIN:  better-escape.nvim
  -- GitHub: max397574/better-escape.nvim
  -- Comment: A better escape handler.
  --------------------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
    keys = {
      { "H", false },
    },
  },

  --------------------------------------------------------------------
  -- PLUGIN:  central.vim
  -- GitHub:  her/central.vim
  -- Comment: Manages your backup, swap, and undo directories and files.
  --------------------------------------------------------------------
  {
    "her/central.vim",
    lazy = false,
    config = function()
      cmd("let g:central_cleanup_enable = 30")
      cmd("let g:central_multiple_backup_enable = 50")
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  ChatGPT
  -- GitHub:  jackMort/ChatGPT
  -- Comment: ChatGPT interface
  --------------------------------------------------------------------
  {
    "jackMort/ChatGPT.nvim",
    lazy = false,
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  --------------------------------------------------------------------
  -- PLUGIN:  DeleteTrailingWhitespace.
  -- GitHub:  vim-scripts/deletetrailingwhitespace
  -- Comment: Adds the function to delete trailing whitespace.
  --------------------------------------------------------------------
  {
    "vim-scripts/deletetrailingwhitespace",
    lazy = false,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  EasyAlign
  -- GitHub:  junegunn/vim-easy-align
  -- Comment: Helps align text
  --------------------------------------------------------------------
  {
    "junegunn/vim-easy-align",
    lazy = false,
    config = function()
      vim.g.easy_align_indentation = "s"
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  gitsigns
  -- GitHub:  lewis6991/gitsigns
  -- Comment: Configure gitsigns.
  --------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      --          signs = {
      --            add = { text = "▎" },
      --         change = { text = "▎" },
      --         delete = { text = "" },
      --      topdelete = { text = "" },
      --   changedelete = { text = "▎" },
      --      untracked = { text = "▎" },
      -- },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  --------------------------------------------------------------------
  -- PLUGIN:  LuaSnip
  -- GitHub:  L3MON4D3/LuaSnip
  -- Comment: Disable default <tab> and s-tab> behavior in LuaSnip.
  --          We'll add tab support back in with Supertab in nvim-cmp.
  --------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  marks.nvim
  -- GitHub:  chentoast/marks.nvim
  -- Comment: Enhanced user experience with Vim marks.
  --------------------------------------------------------------------
  {
    "chentoast/marks.nvim",
    lazy = false,
    opts = {
      -- whether to map keybinds or not. default true
      default_mappings = true,
      -- which builtin marks to show. default {}
      builtin_marks = { ".", "<", ">", "^" },
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions.
      -- higher values will have better performance but may cause visual lag,
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      -- disables mark tracking for specific filetypes. default {}
      excluded_filetypes = {},
      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
      -- default virt_text is "".
      bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
        -- defaults to false.
        annotate = false,
      },
      mappings = {},
    },
  },

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

  --------------------------------------------------------------------
  -- PLUGIN: Window-Picker
  -- Github: s1n7ax/nvim-window-picker
  -- Comment: Adding clang options.
  --------------------------------------------------------------------
  {
    "s1n7ax/nvim-window-picker",
    lazy = false,
    name = "window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
} -- Return Plugins  !
