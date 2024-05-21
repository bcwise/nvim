return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
    default_map = true, -- Default mapping <F1> in normal mode.
    auto_update = true, -- Update header when saving.
    user = "Bart Wise", -- Your user.
    mail = "bart.c.wise@gmail.com", -- Your mail.
    -- add other options.
    ---Git config.
    git = {
      ---Enable Git support.
      enabled = true,
      ---PATH to the Git binary.
      bin = "git",
      ---Use global user.name, otherwise use local user.name.
      user_global = "bcwise",
      ---Use global user.email, otherwise use local user.email.
      email_global = "bart.c.wise@gmail.com",
    },
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
