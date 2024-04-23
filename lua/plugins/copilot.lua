return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        cpp = true,
        c = true,
        python = true,
        html = true,
        javascript = true,
        markdown = true,
        help = true,
      },
    },
  },
}
