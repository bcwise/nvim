-- TODO List
--  Configure EasyAlign correctly
--  Add DeleteTrailingWhitespace

local cmd = vim.cmd

local clangd_cmd_args = {
  "clangd",
  -- "/home/nemesis3/bwise/opt/llvm-16.0.3/root/bin/clangd",
  "-j=6",
  "--background-index",
  "--clang-tidy",
  "--clang-tidy-checks=*",
  "--completion-style=detailed",
  "--function-arg-placeholders",
  "--fallback-style=llvm",
  "--header-insertion=iwyu",
  "--clang-tidy-checks=*",
  -- "--clang-tidy-checks=cppcoreguidelines," ..
  -- "bugprone-argument-comment," ..
  -- "bugprone-assert-side-effect",
  -- "--some-other-option=foo",
  -- "--yet-another-option=bar",
}

return {

  --------------------------------------------------------------------
  -- DISABLE THE FOLLOWING PLUGINS
  --------------------------------------------------------------------
  { "simrat39/symbols-outline.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },

  --------------------------------------------------------------------
  -- PLUGIN:  Aerial
  -- GitHub: stevearc/aerial.nvim
  -- Comment: A code outline
  --------------------------------------------------------------------
  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = function()
      local opts = {
        show_guides = true,
        layout = {
          -- resize_to_content = false,
          win_opts = {
            winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
            signcolumn = "yes",
            statuscolumn = " ",
          },
        },
        filter_kind = {
          -- Default settings
          -- "Class",
          -- "Constructor",
          -- "Enum",
          -- "Function",
          -- "Interface",
          -- "Module",
          -- "Method",
          -- "Struct",
          "Array",
          "Boolean",
          "Class",
          "Constant",
          "Constructor",
          "Enum",
          "EnumMember",
          "Event",
          "Field",
          "File",
          "Function",
          "Interface",
          "Key",
          "Method",
          "Module",
          "Namespace",
          "Null",
          "Number",
          "Object",
          "Operator",
          "Package",
          "Property",
          "String",
          "Struct",
          "TypeParameter",
          "Variable",
        },
      }
      return opts
    end,
    keys = {
      { "<leader>o", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
  },

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
  -- PLUGIN: ClangD Extensions
  -- Github: p00f/clangd_extensions.nvim
  -- Comment: Adding clang extensions.
  --------------------------------------------------------------------
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
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
    keys = {
      {
        "ea",
        "<cmd>EasyAlign<cr>",
        desc = "Align text columns",
      },
    },
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
  -- PLUGIN:  treesitter
  -- GitHub:  "nvim-treesitter/nvim-treesitter",
  -- Comment: Syntax parsing
  --------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "cpp",
        })
      end
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  vimtex
  -- GitHub:
  -- Comment: Shortcuts for writing in LaTeX
  --------------------------------------------------------------------
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })

      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

      -- Configs copied from NvChad config:
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      -- Disable imaps (using Ultisnips)
      vim.g.vimtex_imaps_enabled = 0
      -- Do not open pdfviwer on compile
      vim.g.vimtex_view_automatic = 0
      -- Disable conceal
      vim.g.vimtex_syntax_conceal = {
        accents = 0,
        cites = 0,
        fancy = 0,
        greek = 0,
        math_bounds = 0,
        math_delimiters = 0,
        math_fracs = 0,
        math_super_sub = 0,
        math_symbols = 0,
        sections = 0,
        styles = 0,
      }
      -- Disable quickfix auto open
      vim.g.vimtex_quickfix_ignore_mode = 0
      vim.g.vimtex_compiler_progname = "nvr"
      -- PDF viewer settings
      vim.g.vimtex_view_general_viewer = "SumatraPDF"
      vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
      -- Do not auto open quickfix on compile erros
      vim.g.vimtex_quickfix_mode = 0
      -- Latex warnings to ignore
      vim.g.vimtex_quickfix_ignore_filters = {
        "Command terminated with space",
        "LaTeX Font Warning: Font shape",
        "Package caption Warning: The option",
        [[Underfull \\hbox (badness [0-9]*) in]],
        "Package enumitem Warning: Negative labelwidth",
        [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
        [[Package caption Warning: Unused \\captionsetup]],
        "Package typearea Warning: Bad type area settings!",
        [[Package fancyhdr Warning: \\headheight is too small]],
        [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
        "Package hyperref Warning: Token not allowed in a PDF string",
        [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
      }
      vim.g.vimtex_fold_enabled = 0
      vim.g.vimtex_fold_manual = 1
      vim.g.vimtex_fold_types = {
        cmd_addplot = {
          cmds = { "addplot[+3]?" },
        },
        cmd_multi = {
          cmds = {
            "%(re)?new%(command|environment)",
            "providecommand",
            "presetkeys",
            "Declare%(Multi|Auto)?CiteCommand",
            "Declare%(Index)?%(Field|List|Name)%(Format|Alias)",
          },
        },
        cmd_single = {
          cmds = { "hypersetup", "tikzset", "pgfplotstableread", "lstset" },
        },
        cmd_single_opt = {
          cmds = { "usepackage", "includepdf" },
        },
        comments = {
          enabled = 0,
        },
        env_options = vim.empty_dict(),
        envs = {
          blacklist = {},
          whitelist = {
            "figure",
            "frame",
            "table",
            "example",
            "answer",
            "titlepage",
            "cvskills",
            "cventries",
            "cvhonors",
          },
        },
        items = {
          enabled = 0,
        },
        markers = vim.empty_dict(),
        preamble = {
          enabled = 0,
        },
        sections = {
          parse_levels = 0,
          parts = { "appendix", "frontmatter", "mainmatter", "backmatter" },
          sections = {
            "%(add)?part",
            "%(chapter|addchap)",
            "%(section|section\\*)",
            "%(subsection|subsection\\*)",
            "%(subsubsection|subsubsection\\*)",
            "paragraph",
          },
        },
      }
    end,
  },
} -- Return Plugins
