return {
  load = {
    ["core.journal"] = {
      config = { journal_folder = "Journal", workspace = "Neorg" },
    },

    ["core.tangle"] = {},

    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          -- Unmaps any Neorg key from the `norg` mode
          keybinds.unmap("norg", "n", "gO")
        end,
      },
    },

    ["core.dirman"] = {
      config = {
        workspaces = {
          Neorg = "~/Documents/Neorg",
          Archive = "~/Documents/Neorg/Archive",
          Area = "~/Documents/Neorg/Area",
          Notes = "~/Documents/Neorg/Notes",
          journal = "~/Documents/Neorg/Journal",
          Resources = "~/Documents/Neorg/Resources",
          Projects = "~/Documents/Neorg/Projects",
          WSL = "~/Documents/Neorg/WSL",
        },
      },
    },
  },
}
