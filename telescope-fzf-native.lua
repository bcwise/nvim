  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   -- "telescope.nvim",
    -- dependencies = {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    --   -- build = "make",
    --   config = function()
    --     require("telescope").load_extension("fzf")
    --   end,
    -- },
  }
