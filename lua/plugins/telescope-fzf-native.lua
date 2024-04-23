return {
  {
    -- add telescope-fzf-native
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    opts = {
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
