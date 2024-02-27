-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local api = vim.api
local opt = vim.o
local global = vim.g
local window_opt = vim.wo
local cmd = vim.cmd

-- LSP
opt.completeopt = "menu,menuone,noselect"

-- This file is automatically loaded by plugins.core
global.mapleader = ","
window_opt.relativenumber = false
window_opt.number = true
opt.foldenable = false
cmd("set nowrapscan")

-- Cursor Line and Column ------------------------------------------------------
-- Row --
-- opt.cursorline = true
opt.cursorline = true
opt.cursorcolumn = true
opt.cursorlineopt = "both"

-- vim.o.CursorColumn  = { fg="#ffff00",      bg="#505050", gui="#000000" }

api.nvim_set_hl(0, "LineNrAbove", { fg = "blue" })
-- api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
api.nvim_set_hl(0, "LineNrBelow", { fg = "magenta" })
api.nvim_set_hl(0, "CursorLineNr", { fg = "red" })

-- vim.oCursorLine    = { fg=NONE,      bg="#505050", gui=NONE },
-- vim.o.CursorLineNr  = { fg="#ffff00", bg="#2b5070", gui=NONE },

-- vim.o.ruler = true

-- --,number
--
-- Highlight Cursor number row
-- highlight CursorLineNr{gui=bold, guifg=Yellow, guibg=Black}

-- " highlight clear cursorline
-- augroup CLClear
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr gui=bold guifg=Yellow guibg=Black
-- augroup End
--
-- " highlight CursorLineNR cterm=bold
-- augroup CLNRSet
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr cterm=NONE ctermbg=DarkGrey ctermfg=Grey gui=bold guifg=Yellow guibg=Black
-- augroup END
--
-- --Highlight Cursor number row
-- highlight CursorLineNr gui=bold guifg=Yellow guibg=Black
--
-- --highlight clear cursorline
-- augroup CLClear
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr gui=bold guifg=Yellow guibg=Black
-- augroup End
--
-- -- highlight CursorLineNR cterm=bold
-- augroup CLNRSet
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr cterm=NONE ctermbg=DarkGrey ctermfg=Grey gui=bold guifg=Yellow guibg=Black
-- augroup END

---------------------------------------------------
-- Line Number
---------------------------------------------------
-- Make these for all colorschemes so the line number column doesn't change
-- autocmd ColorScheme * highlight LineNr       ctermfg=240 ctermbg=0 guifg=DarkGray guibg=#0C0E54
-- autocmd ColorScheme * highlight LineNr       ctermfg=240 ctermbg=0 guifg=DarkGray guibg=#0A0C45
-- autocmd ColorScheme * highlight LineNr       ctermfg=240 ctermbg=0 guifg=DarkGray guibg=#090A39
-- autocmd ColorScheme * highlight LineNr       ctermfg=240 ctermbg=0 guifg=DarkGray guibg=#29465B
-- autocmd ColorScheme * highlight LineNr       ctermfg=240 ctermbg=0 guifg=#2b506e guibg=#252567
-- autocmd ColorScheme * highlight CursorLineNr cterm=underline ctermfg=11 gui=bold guibg=DarkGray guifg=Yellow

--------------------------------------
-- Cursor Column
----------------------------------
-- set cursorcolumn
-- " highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
-- highlight CursorColumn ctermfg=Black ctermbg=NONE cterm=bold gui=bold"guifg=Red guibg=yellow gui=Bold

--
-- -- Column --
--
-- "----------------------------------
-- " Cursor Line
-- "----------------------------------
--
-- set cursorline
-- set cursorlineopt=line,number
--
-- " Highlight Cursor number row
-- highlight CursorLineNr gui=bold guifg=Yellow guibg=Black
--
-- " highlight clear cursorline
-- augroup CLClear
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr gui=bold guifg=Yellow guibg=Black
-- augroup End
--
-- " highlight CursorLineNR cterm=bold
-- augroup CLNRSet
--     set cursorline
--     "autocmd! ColorScheme * highlight CursorLineNR cterm=bold ctermbg=DarkGrey ctermfg=Yellow
--     autocmd! ColorScheme * highlight CursorLineNr cterm=NONE ctermbg=DarkGrey ctermfg=Grey gui=bold guifg=Yellow guibg=Black
-- augroup END
--
-- "----------------------------------
-- " Cursor Column
-- "----------------------------------
-- set cursorcolumn
-- " highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
-- highlight CursorColumn ctermfg=Black ctermbg=NONE cterm=bold gui=bold"guifg=Red guibg=yellow gui=Bold
--
-- " Highlight the cursor column
-- " guibg: background for the whole column
-- " gui:   for the whole thing
