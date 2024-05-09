return {
  -- {
  --   "carlrobertoh/CodeGPT",
  -- },

  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("codegpt.config")
      -- Override the default chat completions url, this is useful to override when testing custom commands
      -- vim.g["codegpt_chat_completions_url"] = "http://127.0.0.1:800/test"

      vim.g["codegpt_commands"] = {
        ["tests"] = {
          -- Language specific instructions for java filetype
          language_instructions = {
            java = "Use the TestNG framework.",
          },
        },
        ["doc"] = {
          -- Language specific instructions for python filetype
          language_instructions = {
            python = "Use the Google style docstrings.",
          },

          -- Overrides the max tokens to be 1024
          max_tokens = 1024,
        },
        ["code_edit"] = {
          -- Overrides the system message template
          system_message_template = "You are {{language}} developer.",

          -- Overrides the user message template
          user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nEdit the above code. {{language_instructions}}",

          -- Display the response in a popup window. The popup window filetype will be the filetype of the current buffer.
          callback_type = "code_popup",
        },
        -- Custom command
        ["modernize"] = {
          user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nModernize the above code. Use current best practices. Only return the code snippet and comments. {{language_instructions}}",
          language_instructions = {
            cpp = "Use modern C++ syntax. Use auto where possible. Do not import std. Use trailing return type. Use the c++11, c++14, c++17, and c++20 standards where applicable.",
          },
        },
      }
    end,
  },
}
