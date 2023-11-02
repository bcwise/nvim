-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Unmap some navigation mappings that are getting overwritten.
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")

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

-- " Shortcuts: search/replace
-- " A function is for replacing the current-under-cursor word with
-- " another pattern/word. Simply, it copies the word under cursor and inserts it
-- " into a substitution command call. You only need to type the replacement pattern
-- " and press the Enter key to actually replace the text:
-- vim.keymap.set(
--   "n",
--   ";",
--   "<cmd>%s/<C-r><C-w>//g<Left><Left><cr>",
--   { expr = true, desc = "Search/replace everywhere for the word under the cursor." }
-- )

-- " Shortcuts: Substitute
-- " Setup command to replace current word with last yanked, cut, etc. word.
-- " Select "S" to replace
-- vim.keymap.set("n", "S", "<cmd>ciw<C-r>0<Esc><cr>", "Replace word under cursor.")

-- Use the <Enter> key to select the whole word under the cursor.
--["<CR>"] = { "viwy   y/\V<C-R>"<CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--    ["<CR>"] = { "viwy/\V<C-R><CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--TODO(fix):--    ["<CR>"] = { "viwy :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
