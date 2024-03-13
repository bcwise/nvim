-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- Unmap some navigation mappings that are getting overwritten.
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

--******************************************************************************
--* SEARCH Mappings
--******************************************************************************
-- Center the results on the screen
map("n", "n", "nzz", { noremap = true, silent = true, desc = "Searches forward and centers the result" })
map("n", "N", "Nzz", { noremap = true, silent = true, desc = "Searches backward and centers the result" })
map("n", "*", "*zz", {
  noremap = true,
  silent = true,
  desc = "Does a whole word forward search for the word under the cursor and centers the result",
})
map("n", "#", "#zz", {
  noremap = true,
  silent = true,
  desc = "Does a whole word backward search for the word under the cursor and centers the result",
})
map(
  "n",
  "g*",
  "g*zz",
  { noremap = true, silent = true, desc = "Searches for the word (NOT whole word) forward and centers the result" }
)
map(
  "n",
  "g#",
  "g#zz",
  { noremap = true, silent = true, desc = "Searches for the word (NOT the whole word) backward and centers the result" }
)

-- vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
-- map(
--   "n",
--   "<cr>",
--   "<cmd>let @/=expand('<cword>')<CR>:set hls<CR>",
--   { expr = true, silent = true, desc = "<Enter> selects for searching the current word under the cursor." }
-- )

-- map(
--   "n",
--   "<leader>xx",
--   "<Cmd>let @=expand('<cword>')<CR>",
--   { expr = true, desc = "<Enter> selects for searching the current word under the cursor." }
-- )

-- ("n", "<CR>", ":let @/=expand('<cword>')<CR>:set hls<CR>",
--            "<Enter> selects for searching the current word under the cursor."),
map("n", "<CR>", "<cmd>let @/=expand('<cword>')<cr>:set hls<cr>")

-- " Shortcuts: search/replace
-- " A function is for replacing the current-under-cursor word with
-- " another pattern/word. Simply, it copies the word under cursor and inserts it
-- " into a substitution command call. You only need to type the replacement pattern
-- " and press the Enter key to actually replace the text:
-- map("n", ";", "<cmd>%s/<C-r><C-w>//g<Left><Left><cr>")
--   { expr = true, desc = "Search/replace everywhere for the word under the cursor." }
-- map("n", ";", "<cmd>%s/<C-r><C-w>//g<cr>")
-- )

-- " Cancel : Substitute
-- " Setup command to Cancel the current word with last yanked, cut, etc. word.
-- " Select "S" to replace
-- map({ "n", "x" }, 'S', "ciw<C-r>0<Esc><cr>", "Replace word under cursor.")
map({ "n", "x" }, "S", "ciw<C-r>0<Esc>")

-- Use the <Enter> key to select the whole word under the cursor.
--["<CR>"] = { "viwy   y/\V<C-R>"<CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--    ["<CR>"] = { "viwy/\V<C-R><CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--TODO(fix):--    ["<CR>"] = { "viwy :let @/ = '\V'<CR>", "Select the whole word under the cursor"},

--******************************************************************************
--* PLUGIN: Aerial
--* GitHub: stevearc/aerial.nvim
--* Comments: A code outline window for skimming and quick navigation.
--*           The key mapping is so we can use <leader>o to toggle the outline
--*           viewer open and close.
--********************************************************************kk**********
map({ "n" }, "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Opens/Closes a code outline window." })

--******************************************************************************
--* PLUGIN: Easy Align
--* Comments:
--*   Easily aligns texts into columnms
--******************************************************************************
vim.api.nvim_set_keymap(
  "n",
  "ea",
  "<Plug>(EasyAlign)",
  { desc = "Aligns text using a delimiter.", noremap = false, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "ea",
  "<Plug>(EasyAlign)",
  { desc = "Aligns text using a delimiter.", noremap = false, silent = true }
)
