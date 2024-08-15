return {
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.g.easy_align_delimiters = {
        [">"] = { pattern = ">>\\|=>\\|>" },
        ["/"] = {
          pattern = "//\\+\\|/\\*\\|\\*/",
          delimiter_align = "l",
          ignore_groups = { "!Comment" }
        },
        ["]"] = {
          pattern = "[\\[\\]]",
          left_margin = 0,
          right_margin = 0,
          stick_to_left = 0
        },
        [")"] = {
          pattern = "[()]",
          left_margin = 0,
          right_margin = 0,
          stick_to_left = 0
        },
        ["d"] = {
          pattern = " (\\S\\+\\s*[;=])\\@=",
          left_margin = 0,
          right_margin = 0
        },
        ["("] = {  -- Add this section to include an opening-parenthesis delimiter
          pattern = "[()]",
          left_margin = 0,
          right_margin = 0,
          stick_to_left = 0
        }
      }
    end
  }
}
