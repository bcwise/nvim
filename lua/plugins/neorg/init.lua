return {
  {
    "nvim-neorg/neorg",
    dependencies = {
      "nvim-neorg/lua-utils.nvim",
    },
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    config = function()
      local opts = {
        load = {
          ["core.defaults"] = {},
          ["core.ui"] = {},
          ["core.dirman"] = {},
          ["core.highlights"] = {},
          ["core.journal"] = {},
          ["core.looking-glass"] = {},
          ["core.keybinds"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
              icons = { todo = { done = { icon = "" }, pending = { icon = "" } } },
            },
          },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.itero"] = {},
          ["core.esupports.indent"] = {},
          ["core.pivot"] = {},
          ["core.syntax"] = {},
          ["core.summary"] = {},
          ["core.ui.calendar"] = {},
          ["core.tempus"] = {},
          ["core.text-objects"] = {},
          ["core.integrations.nvim-cmp"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.completion"] = { config = { engine = "nvim-cmp" } },
        },
      }
      require("neorg").setup(vim.tbl_deep_extend("force", opts, require("plugins.neorg.neorg_workspaces")))
    end,
  },
}
