return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  -- version = "0.1.x",
  version = false,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "tsakirist/telescope-lazy.nvim" },
  },
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")
    local open_with_trouble = require("trouble.sources.telescope").open

    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top", width = 0.99, height = 0.99, preview_width = 0.7 },
          -- sorting_strategy = "ascending",
        },
        prompt_prefix = "🔍 ",
        borderchars = {
          { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
        set_env = { ["COLORTERM"] = "truecolor" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        file_ignore_patterns = {
          ".git/",
          ".cache",
          ".next",
          "%.o",
          "%.a",
          "%.out",
          "%.class",
          "%.pdf",
          "%.mkv",
          "%.mp4",
          "%.zip",
          "node_modules",
          "target",
        },
        path_display = { truncate = 5 },
        hidden = true,
        color_devicons = true,
        mappings = {
          i = {
            ["<C-p>"] = actions.preview_scrolling_up,
            ["<c-t>"] = open_with_trouble,
            ["<C-n>"] = actions.preview_scrolling_down,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["q"] = actions.close,
            ["<C-c>"] = actions.close,
            ["<c-t>"] = open_with_trouble,
          },
        },
      },

      pickers = {
        find_files = {
          find_command = { "fd", "--no-ignore", "--type", "f", "--strip-cwd-prefix", "--color=auto" },
          hidden = true,
        },
        live_grep = {
          additional_args = { "--hidden", "--ignore-case" },
          only_sort_text = true,
        },
        buffers = { path_display = { "tail" } },
        colorscheme = {
          enable_preview = true,
        },
      },

      extensions = {
        rooter = {
          enable = true,
          patterns = { ".git", "node_modules" },
          debug = false,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    local extension = require("telescope").load_extension

    extension("fzf")
    extension("projects")
    extension("lazy")
    extension("notify")
  end,
}
