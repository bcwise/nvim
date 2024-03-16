--------------------------------------------------------------------------------
-- Plugin: outline
--------------------------------------------------------------------------------
return {
  "hedyhli/outline",
  keys = {
    -- Add <ctrl>o to open the outline
    { "<leader>o", false },
    { "<leader>o", "<cmd>Outline<cr>", desc = "Outline file" },
  },
}
