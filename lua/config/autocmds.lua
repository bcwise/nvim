-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define the augroup
vim.api.nvim_create_augroup("CursorHighlightGroup", { clear = true })

-- The number column
-- LineNr       = { fg = "#777777",   bg = "#2b506e" },
-- CursorLineNr = { fg = "yellow",    bg = "#2b506e", bold = true },
-- CursorLine   = {                   bg = "#888888" },
-- CursorColumn = {                   bg = "#888888" },
-- SignColumn   = { fg = "LightGray", bg = "#202c40" },

local dark_blue_gray_above = "#4F6D7A"
local dark_blue_gray = "#536878"

-- Define autocmds within the group
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = "CursorHighlightGroup",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "DarkGray", bg = dark_blue_gray_above })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777", bg = "#2b506e" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "magenta" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "yellow", bg = dark_blue_gray })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#888888" })
    vim.api.nvim_set_hl(0, "SignLine", { fg = "LightGray", bg = "#202c40" })
  end,
})

-- You can add more autocmds to the same group as needed

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--     group = 'CursorHighlightGroup',
--   -- pattern = {"*.c", "*.h"},
--   -- command = "echo 'Entering a C or C++ file'",
--   callback = function()
--       vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='yellow' })
--       vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='blue' })
--       -- vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
--       vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='magenta' })
--   end
-- })
