-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--------------------------------------------------------------------------------
-- Color Definition
--------------------------------------------------------------------------------
local colors = {
  baby_pink = "#F4C2C2",
  bg = "#1a1b26",
  bg_dark = "#16161e",
  bg_float = "#16161e",
  bg_highlight = "#292e42",
  bg_popup = "#16161e",
  bg_search = "#3d59a1",
  bg_sidebar = "#16161e",
  bg_statusline = "#16161e",
  bg_visual = "#283457",
  black = "#15161e",
  blue = "#7aa2f7",
  blue0 = "#3d59a1",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  dark_blue_gray_above = "#4F6D7A",
  nord_blue = "#80a8fd",
  navy_blue = "#000c66",
  dark_navy_blue = "#050A46",
  dark_blue = "#050A30",
  dark_blue_gray = "#536878",
  cursor_bg = "#c0caf5",
  cursor_fg = "#1a1b26",
  cursor_column_bg = "#292e42",
  cursor_line_bg = "#292e42",
  cursor_line_nr_fg = "#737aa2",
  git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54",
    ignore = "#545c7e",
  },
  gitSigns = {
    add = "LightGreen",
    change = "Orange",
    delete = "LightRed",
  },
  -- Grays
  light_gray = "#545c7e",

  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  hint = "#1abc9c",
  sun = "#EBCB8B",
  teal = "#1abc9c",
  yellow = "#e0af68",
}
-- -- Define the augroup
vim.api.nvim_create_augroup("CursorHighlightGroup", { clear = true })
-- Define autocmds within the group
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = "CursorHighlightGroup",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "LightRed", bold })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.blue2 })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "LightGreen", bold })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Yellow", bg = colors.cursor_line_bg, bold })

    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.gitSigns.add, bold })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.gitSigns.change, bold })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.gitSigns.delete, bold })
    -- vim.api.nvim_set_hl(0, "GitSignsAddNr", { bg = colors.blue5 })
  end,
})

-- vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh({ bufnr = 0 })]])
