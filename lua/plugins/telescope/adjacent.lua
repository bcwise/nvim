return {
  {
    "MaximilianLloyd/adjacent.nvim",
    dependencies = { "telescope.nvim" },
    lazy = false,
    keys = { { "<leader>sf", "<cmd>Telescope adjacent<cr>", desc = "Find Files" } },
    config = function()
      require("telescope").setup({
        extensions = {
          adjacent = {
            level = 5, -- default
          },
        },
      })
      require("telescope").load_extension("adjacent")
    end,
  },
}
