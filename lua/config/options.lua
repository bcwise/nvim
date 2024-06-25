-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local api = vim.api
local opt = vim.o
local global = vim.g
local window_opt = vim.wo
local cmd = vim.cmd

-- local telescope = require("Telescope")

----------------------------------------
---- Global Options
----------------------------------------
global.mapleader = ","
global.lazygit = true

-- Enable luarocks
-- opt.rocks.hererocks = true

---------------------------------------------------
-- Abbreviations (typo corrections)
---------------------------------------------------
cmd("cnoreabbrev WQ wq")
cmd("cnoreabbrev Wq wq")
cmd("cnoreabbrev We w")
cmd("cnoreabbrev W  w")
cmd("cnoreabbrev Q  q")
cmd("cnoreabbrev X  x")

----------------------------------------
---- Keybindings
----------------------------------------
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }

----------------------------------------
---- Local Options
----------------------------------------
local options = {
  backup = true,
  clipboard = "unnamedplus",
  autoread = true,
  cmdheight = 2,
  completeopt = { "menu", "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitkeep = vim.fn.has("nvim-0.10.0") == 1 and "screen" or nil,
  splitright = true,
  swapfile = true,
  termguicolors = true,
  timeout = true,
  timeoutlen = 400,
  undofile = true,
  updatetime = 300,
  signcolumn = "yes:2",
  writebackup = false,
  expandtab = true,
  softtabstop = 2,
  shiftwidth = 2,
  tabstop = 2,
  nrformats = "alpha",
  cursorline = true,
  cursorcolumn = true,
  cursorlineopt = "both",
  number = true,
  numberwidth = 4,
  relativenumber = false,
  scrolloff = 8,
  sidescrolloff = 8,
  textwidth = 80,
  errorbells = false,
  title = true,
  winwidth = 10,
  winminwidth = 10,
  breakindent = true,
  linebreak = true,
  wrap = false,
  wrapscan = false,
  equalalways = true,
  ruler = true,
  infercase = true,
  virtualedit = "block",
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:]],
  foldlevelstart = 99,
  foldmethod = "manual",
  foldnestmax = 10,
  foldcolumn = "1",
  foldlevel = 99,
  foldenable = true,
  spell = true,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.fn.has("nvim-0.10.0") == 1 then
  vim.opt.diffopt:append("linematch:60")
end

vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

---------------------------------------------------
-- Colors: setup
---------------------------------------------------
vim.schedule(function()
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
  vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

  vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
  vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

  vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

  vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
  vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
  vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
  vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
  vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
end)

--==============================================================================
