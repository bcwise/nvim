return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/*",
        "~/dev/*",
        "~/.config/*",
        "~/Documents/church",
        "~/Documents/church/general_conference",
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
