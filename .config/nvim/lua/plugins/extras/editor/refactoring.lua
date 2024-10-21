-- support print object

return {
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  {
    "refactoring.nvim",
    opts = {
      printf_statements = {
        javascript = {
          'console.log(" %s");',
        },
        typescript = {
          'console.log(" %s");',
        },
      },
      print_var_statements = {
        javascript = {
          'console.log(" %s ", %s);',
        },
        typescript = {
          'console.log(" %s ", %s);',
        },
      },
    },
  },
}
