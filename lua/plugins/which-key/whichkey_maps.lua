local wk = require("which-key")
wk.register({
  e = { "<cmd>Neotree toggle<cr>", "File Browser" },
  c = { "<cmd>Bdelete<cr>", "Close Buffer" },
  h = { "<cmd>nohlsearch<cr><cmd>Noice dismiss<cr>", "No Highlight/Notification" },
  u = {
    name = "Utils",
    t = { "<cmd>TodoTrouble<cr>", "Todo Comments" },
    d = { "<cmd>DevdocsOpen<cr>", "DevDocs" },
    o = { "<cmd>Obsession<cr>", "Save Session" },
    s = { "<cmd>TSJToggle<cr>", "Split/Join Toggle" },
  },
  s = {
    name = "Search",
    w = { "<cmd>Telescope find_files hidden=true<cr>", "Workspace" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles hidden=true<cr>", "Recent Files" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find file" },
    s = {
      "<cmd>Telescope spell_suggest results_title=false layout_strategy=cursor layout_config={width=30,height=9} <cr>",
      "Spell Suggest",
    },
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep Workspace" },
  },
  T = {
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    "Themes",
  },
  l = {
    name = "LSP",
    a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Buffer Diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics" },
    s = { "<cmd>SymbolsOutline<cr>", "Document Symbols" },
    f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  },
  g = {
    name = "Git",
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    g = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
  },
  w = {
    name = "Window",
    f = { "<cmd>WindowsMaximize<cr>", "Focus" },
    ["_"] = { "<cmd>WindowsMaximizeHorizontally<cr>", "Maximize Horizontal" },
    ["|"] = { "<cmd>WindowsMaximizeVertically<cr>", "Maximize Horizontal" },
    o = { "<cmd>only<cr>", "Only" },
    e = { "<cmd>WindowsEqualize<cr>", "Equalize" },
    c = { "<cmd>close<cr>", "Close" },
    v = { "<cmd>vsplit<cr>", "Vertical Split" },
    x = { "<cmd>split<cr>", "Horizontal Split" },
    n = { "<cmd>lua M.New()<cr>", "New File" },
    j = { "<cmd>ZenMode<cr>", "Zen Mode" },
  },
  b = {
    name = "Buffers",
    s = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
    g = { "<cmd>BufferLineCloseLeft<cr>", "Close all to Left" },
    h = { "<cmd>BufferLineCloseRight<cr>", "Close all to Right" },
    u = { "<cmd>Hbac unpin_all<cr>", "Unpin All" },
    c = { "<cmd>Hbac close_unpinned<cr>", "Close Unpinned" },
  },
  t = {
    name = "Telescope",
    p = { "<cmd>Telescope neovim-project<cr>", "Telescope Project Management" },
    -- d = { "<cmd>Telescope neovim-project discover<cr>", "Telescope Project Management Discover" },
    f = { "<cmd>Telescope neovim-project discover<cr>", "Telescope Project Management Discover" },
    h = { "<cmd>Telescope neovim-project history<cr>", "Telescope Project Management History" },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    T = {
      "  <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "Conditional Breakpoint",
    },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Start/Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    S = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  },
}, { prefix = "<leader>", mode = "n", silent = true, noremap = true })
