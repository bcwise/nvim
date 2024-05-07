return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")
      local hl = vim.api.nvim_set_hl
      local theme = {}

      theme.setup_highlights = function(c)
        hl(0, "FloatBorder", { fg = c.gb, bg = c.comment })
      end

      fm.setup({

        glow = true,
        -- theme = 'delta',
        -- theme.highlights.normal = hl(0, 'Normal', { fg = c.bg, bg = c.fg }),
        -- theme = 'fluoromachine',
        theme = "retrowave",
        -- theme = 'stylua',
        -- transparent = 'full',
        overrides = {
          ["FloatBorder"] = { bold = true, bg = red },
          -- ['FloatBorder'] = { fg = c.gb, bg = c.comment },
          ["@type"] = { italic = true, bold = false },
          ["@function"] = { italic = false, bold = false },
          ["@comment"] = { italic = true },
          ["@keyword"] = { italic = false },
          ["@constant"] = { italic = false, bold = false },
          ["@variable"] = { italic = true },
          ["@field"] = { italic = true },
          ["@parameter"] = { italic = true },
        },
        colors = function(_, d)
          return {
            bg = "#190920",
            alt_bg = d("#190920", 20),
            cyan = "#49eaff",
            red = "#ff1e34",
            yellow = "#ffe756",
            orange = "#f38e21",
            pink = "#ffadff",
            purple = "#9544f7",
          }
        end,
      })

      vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
