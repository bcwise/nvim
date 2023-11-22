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
  -- "--clang-tidy-checks=cppcoreguidelines," ..
  -- "bugprone-argument-comment," ..
  -- "bugprone-assert-side-effect",
  -- "--some-other-option=foo",
  -- "--yet-another-option=bar",
  -- "--fallback-style=/software/clang/.clang-format",
  -- "--style=/software/clang/.clang-format",
  -- "--fallback-style={" "}"
}

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
  -- PLUGIN:  CMP
  -- GitHub:  hrsh7th/nvim-cmp
  -- Comment: Adds SuperTab support in nvim-cmp.
  --------------------------------------------------------------------
  -- {
  --   "hrsh7th/nvim-cmp",
  --   lazy = false,
  --
  --   dependencies = {
  --     { "hrsh7th/cmp-emoji", lazy = false },
  --     { "kdheepak/cmp-latex-symbols", lazy = false },
  --     { "hrsh7th/cmp-omni", lazy = false },
  --     { "ray-x/cmp-treesitter", lazy = false },
  --     { "onsails/lspkind.nvim", lazy = false },
  --   },
  --
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "latex" } }))
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "omni" } }))
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "treesitter" } }))
  --
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local lspkind = require("lspkind")
  --     local luasnip = require("luasnip")
  --     local cmp = require("cmp")
  --
  --     opts.formatting = {
  --     --   format = lspkind.cmp_format({
  --     --     with_text = false,
  --     --     maxwidth  = 50,
  --     --     mode      = "symbol_text",
  --     --     menu      = ({
  --     --       buffer        = "[Buffer]",
  --     --       calc          = "[Calc]",
  --     --       latex_symbols = "[Latex]",
  --     --       LuaSnip       = "[LuaSnip]",
  --     --       nvim_lsp      = "[LSP]",
  --     --       nvim_lua      = "[Lua]",
  --     --       path          = "[PATH]",
  --     --       omni          = "[Omni]",
  --     --       snippy        = "[Snippy]",
  --     --       treesitter    = "[Tree]",
  --     --       ultisnips     = "[US]",
  --     --       vsnip         = "[VSnip]",
  --     --     }),
  --     --   }),
  --     },
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --           cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- this way you will only jump inside the snippet region
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },
  -- --   dependencies = {
  -- --     { "hrsh7th/cmp-emoji", lazy = false },
  -- --     { "hrsh7th/cmp-omni", lazy = false },
  -- --     { "onsails/lspkind.nvim", lazy = false },
  -- --     { "kdheepak/cmp-latex-symbols", lazy = false },
  -- --     { "ray-x/cmp-treesitter", lazy = false },
  -- --   },
  -- --
  -- --   ---@param opts cmp.ConfigSchema
  -- --   opts = function(_, opts)
  -- --     -- local has_words_before = function()
  -- --     --   unpack = unpack or table.unpack
  -- --     --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- --     --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  -- --     -- end
  -- --
  -- --     local luasnip = require("luasnip")
  -- --     local cmp = require("cmp")
  -- --     local lspkind = require("lspkind")
  -- --
  -- --     sources = cmp.config.sources({
  -- --       { name = "emoji" },
  -- --       { name = "latex" },
  -- --       { name = "omni" },
  -- --       { name = "tresitter" },
  -- --     })
  -- --
  -- --     -- opts.formatting = {
  -- --     -- format = lspkind.cmp_format({
  -- --     --     with_text = false,
  -- --     --     maxwidth  = 50,
  -- --     --     mode      = "symbol_text",
  -- --     --     menu      = ({
  -- --     --         buffer        = "[Buffer]",
  -- --     --         calc          = "[Calc]",
  -- --     --         latex_symbols = "[Latex]",
  -- --     --         LuaSnip       = "[LuaSnip]",
  -- --     --         nvim_lsp      = "[LSP]",
  -- --     --         nvim_lua      = "[Lua]",
  -- --     --         path          = "[PATH]",
  -- --     --         omni          = "[Omni]",
  -- --     --         snippy        = "[Snippy]",
  -- --     --         treesitter    = "[Tree]",
  -- --     --         ultisnips     = "[US]",
  -- --     --         vsnip         = "[VSnip]",
  -- --     --     }),
  -- --     -- }),
  -- --     -- },
  -- --
  -- --     -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
  -- --     --   ["<Tab>"] = cmp.mapping(function(fallback)
  -- --     --     if cmp.visible() then
  -- --     --       -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  -- --     --       cmp.select_next_item()
  -- --     --       -- cmp.confirm({ select = true })
  -- --     --       -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  -- --     --       -- this way you will only jump inside the snippet region
  -- --     --     elseif luasnip.expand_or_jumpable() then
  -- --     --       luasnip.expand_or_jump()
  -- --     --     -- elseif require("luasnip").expand_or_locally_jumpable() then
  -- --     --     --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
  -- --     --     elseif has_words_before() then
  -- --     --       cmp.complete()
  -- --     --     else
  -- --     --       fallback()
  -- --     --     end
  -- --     --   end, { "i", "s" }),
  -- --     --   ["<S-Tab>"] = cmp.mapping(function(fallback)
  -- --     --     if cmp.visible() then
  -- --     --       cmp.select_prev_item()
  -- --     --     elseif luasnip.jumpable(-1) then
  -- --     --       luasnip.jump(-1)
  -- --     --     else
  -- --     --       fallback()
  -- --     --     end
  -- --     --   end, { "i", "s" }),
  -- --     -- })
  -- --   end,
  -- -- },

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
  -- PLUGIN:  nvim-lspconfig
  -- GitHub:  neovim/nvim-lspconfig
  -- Comment: Configure LSPConfigure for clangd
  --------------------------------------------------------------------
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       -- Ensure mason installs the server
  --       clangd = {
  --         keys = {
  --           { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  --         },
  --         root_dir = function(fname)
  --           return require("lspconfig.util").root_pattern(
  --             "Makefile",
  --             "configure.ac",
  --             "configure.in",
  --             "config.h.in",
  --             "meson.build",
  --             "meson_options.txt",
  --             "build.ninja"
  --           )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
  --             fname
  --           ) or require("lspconfig.util").find_git_ancestor(fname)
  --         end,
  --         capabilities = {
  --           offsetEncoding = { "utf-16" },
  --         },
  --         cmd = clangd_cmd_args,
  --         init_options = {
  --           usePlaceholders = true,
  --           completeUnimported = true,
  --           clangdFileStatus = true,
  --         },
  --       },
  --     },
  --     setup = {
  --       clangd = function(_, opts)
  --         opts.capabilities.offsetEncoding = { "utf-16" }
  --         local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
  --         require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
  --         return false
  --       end,
  --     },
  --   },
  -- },
  --
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
  -- PLUGIN:  Mason
  -- GitHub:  williamboman/mason.nvim
  -- Comment: Manages LSPs
  --          Add any tools you want to have installed below
  --------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Arduino
        "arduino-language-server",

        -- AWK
        -- "awk-language-server",

        -- BASH/Shells
        -- "bash-language-server",
        "shellcheck",
        "shfmt",

        -- c/cpp stuff
        "clangd",
        "clang-format",
        "cpplint",

        -- Docker files
        -- "dockerfile-language-server",

        -- erlang
        -- "erlang-ls",

        -- HTML
        "html-lsp",
        "htmlbeautifier",

        -- Impl
        "impl",

        -- Java
        -- "java-language-server",

        -- json
        -- "json.lsp",

        -- latex
        "latexindent",
        "texlab",
        "ltex-ls",

        -- lua stuff
        "lua-language-server",
        "luacheck",
        "luaformatter",
        "stylua",

        -- Make
        "cmake-language-server",
        "cmakelang",
        "cmakelint",
        -- "make-language-server",

        -- Protobufs
        "buf",
        "buf-language-server",

        -- Python
        "debugpy",
        "flake8",
        "pyflakes",
        "pylama",
        "pylint",
        "pylyzer",
        -- "pyright",
        "python-lsp-server",

        -- Rust
        "rust-analyzer",
        "rustfmt",

        -- Spell
        "codespell",
        "cspell",
        "misspell",

        -- SQL
        "sql-formatter",
        "sqlfluff",
        "sqlfmt",
        "sqlls",

        -- Text
        "vale",

        -- vim
        "vim-language-server",
        "vint",

        -- web dev stuff
        -- "css-lsp",
        -- "html-lsp",
        -- "typescript-language-server",
        "deno",
        -- "prettier",

        -- Yaml
        "yamlfix",
        "yamlfmt",
        "yamllint",
      },
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
  -- PLUGIN:  treesitter
  -- GitHub:  "nvim-treesitter/nvim-treesitter",
  -- Comment: Syntax parsing
  --------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "c",
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
