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
cmd("cnoreabbrev Q  q")
cmd("cnoreabbrev W  w")
cmd("cnoreabbrev We w")
cmd("cnoreabbrev Wq wq")
cmd("cnoreabbrev WQ wq")
cmd("cnoreabbrev X  x")
cmd("cnoreabbrev XA xa")
--TODO:

----------------------------------------
---- Keybindings
---Now is teh theim
----------------------------------------
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }

----------------------------------------
---- Local Options
----------------------------------------
local options = {
  autoread = true,
  backup = true,
  breakindent = true,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menu", "menuone", "noselect" },
  conceallevel = 0,
  cursorcolumn = true,
  cursorlineopt = "both",
  cursorline = true,
  equalalways = true,
  errorbells = false,
  expandtab = true,
  fileencoding = "utf-8",
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:]],
  foldcolumn = "1",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldmethod = "manual",
  foldnestmax = 10,
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  infercase = true,
  linebreak = true,
  mouse = "a",
  nrformats = "alpha",
  number = true,
  numberwidth = 4,
  pumheight = 30,
  relativenumber = false,
  ruler = true,
  scrolloff = 8,
  shiftwidth = 2,
  showmode = false,
  showtabline = 2,
  sidescrolloff = 8,
  signcolumn = "yes:2",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  spell = true,
  splitbelow = true,
  splitkeep = vim.fn.has("nvim-0.10.0") == 1 and "screen" or nil,
  splitright = true,
  swapfile = true,
  tabstop = 2,
  termguicolors = true,
  textwidth = 80,
  timeoutlen = 400,
  timeout = true,
  title = true,
  undofile = true,
  updatetime = 300,
  virtualedit = "block",
  winminwidth = 10,
  winwidth = 10,
  wrap = false,
  wrapscan = false,
  writebackup = false,
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
