--------------------------------------------------------------------
-- PLUGIN: ClangD Extensions
-- Github: p00f/clangd_extensions.nvim
-- Comment: Adding clang extensions.
--------------------------------------------------------------------
local clangd_cmd_args = {
  "clangd",
  -- "/home/nemesis3/bwise/opt/llvm-16.0.3/root/bin/clangd",
  "-j=6",
  "--background-index",
  "--clang-tidy",
  "--clang-tidy-checks=*",
  "--completion-style=detailed",
  "--function-arg-placeholders",
  "--fallback-style=llvm",
  "--header-insertion=iwyu",
  -- "--clang-tidy-checks=cppcoreguidelines," ..
  -- "bugprone-argument-comment," ..
  -- "bugprone-assert-side-effect",
  -- "--some-other-option=foo",
  -- "--yet-another-option=bar",
  -- "--fallback-style=/software/clang/.clang-format",
  -- "--style=/software/clang/.clang-format",
  -- "--fallback-style={" "}"
}

return {
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
}
