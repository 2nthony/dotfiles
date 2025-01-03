-- support print object

local printf_statements_js = {
  'console.log(" %s");',
}
local print_var_statements_js = {
  'console.log(" %s ", %s);',
}

return {
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  {
    "refactoring.nvim",
    opts = {
      printf_statements = {
        javascript = printf_statements_js,
        typescript = printf_statements_js,
        javascriptreact = printf_statements_js,
        typescriptreact = printf_statements_js,
      },
      print_var_statements = {
        javascript = print_var_statements_js,
        javascriptreact = print_var_statements_js,
        typescript = print_var_statements_js,
        typescriptreact = print_var_statements_js,
      },
    },
  },
}
