return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        -- Standard Projects (found at home & work)
        "~/.config/nvim",
        -- Home Projects
        "~/Documents/church",
        "~/Documents/church/general_conference",
        "~/bin",
        "~/dev/*",
        "~/dev/gencon",
        "~/projects/*",
        ".bashrc",
        ".zshrc",
        -- Work Projects
        "~/nemesis3/bin",
        "~/nemesis3/work",
        "~/nemesis3/work/dev",
        "~/nemesis3/work/programs",
        "~/nemesis3/work/software",
        "~/nemesis3/.bashrc",
        "~/nemesis3/.zshrc",
        "work/programs",
        "work/programs/CF/*",
        "work/programs/CF/repos/*",
        "work/programs/CF/repos/SCF_system_bit_service/*",
        "work/programs/CLF/repos/*",
        "work/software?",
        "work/dev",
      },
      -- Load the most recent session on startup if not in the project directory
      last_session_on_startup = false,
      -- Dashboard mode prevent session autoload on startup
      dashboard_mode = false,
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,

    keys = { { "<leader>tp", "<cmd>Telescope neovim-project<cr>", desc = "Project Management" } },
    keys = { { "<leader>tf", "<cmd>Telescope neovim-project discovery<cr>", desc = "Project Management find" } },
    keys = { { "<leader>th", "<cmd>Telescope neovim-project history<cr>", desc = "Project Management history" } },
  },
}
