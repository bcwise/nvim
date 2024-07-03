return {
  {
    "bcwise/skel-nvim",
    config = function()
      -- import basic default placeholder callbacks
      local skeld = require("skel-nvim.defaults")

      require("skel-nvim").setup({
        -- dir containing skeleton files (default)
        templates_dir = vim.fn.stdpath("config") .. "/skeleton",

        -- enable/disable plugin, this supercedes disable_for_empty_file (default)
        skel_enabled = true,

        -- enable/disable processing for bufread + empty file case (default)
        apply_skel_for_empty_file = true,

        -- file pattern -> template mappings (default)
        mappings = {
          ["main.cpp"] = "main.cpp.skel",
          ["*.cpp"] = "cpp.skel",
          ["*.h"] = "h.skel",
          ["*.t.cpp"] = "utest.cpp.skel",
          ["main.c"] = "main.c.skel",
          ["*.c"] = "c.skel",
          ["*.go"] = "go.skel",
          ["*.py"] = "py.skel",
          ["*.lua"] = "lua.skel",
          ["*.sh"] = "sh.skel",
          -- patterns can map to multiple templates
          ["LICENSE"] = { "license.mit.skel", "license.gpl.skel" },
        },

        -- substitutions in templates (default)
        -- can be a string or a callback function
        -- these are the set of default placeholders provided by the plugin
        substitutions = {
          ["FILENAME"] = skeld.get_filename,
          ["AUTHOR"] = skeld.get_author,
          ["AUTHOR_EMAIL"] = skeld.get_author_email,
          ["DATE"] = skeld.get_date,
          ["TIMESTAMP"] = skeld.get_timestamp,
          ["CPP_HDR_GUARD"] = skeld.get_cppheaderguard,
          ["CPP_TEST_HDR_GUARD"] = skeld.get_testheaderguard,
          ["CPP_HDR_INCLUDE"] = skeld.get_headerinclude,
          ["CLASS_NAME"] = skeld.get_classname2,
          ["NAMESPACE_OPEN"] = skeld.get_namespaceopen,
          ["NAMESPACE_CLOSE"] = skeld.get_namespaceclose,
        },

        -- Misc global config available to substitution callback functions
        author = "MyName",
        author_email = "MyEmail@email.com",
        namespace = { "MyOrg", "MyApp" },
        -- Supports user varaibles too
        my_user_variable = "my_user_value",

        -- per project overrides (default = {})
        projects = {
          project1 = {
            path = "/home/<user>/dev/proj1", -- absolute path for project1
            namespace = { "MyOrg", "Proj1" }, -- override namespace to use in1
            author = "my project1 name", -- override author only in project1
          },
          project2 = {
            path = "/home/<user>/dev/proj2", -- absolute path for project2
            namespace = { "MyOrg", "Proj2" }, -- override namespace to use in1
            my_user_variable = "I need different value in project2",
          },
        },
      })
    end,
  },
}
