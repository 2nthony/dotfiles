return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "cspell",
      },
    },
  },

  {
    "null-ls.nvim",
    opts = function(_, opts)
      local cspell = require("cspell")
      table.insert(opts.sources, cspell.diagnostics)
      table.insert(opts.sources, cspell.code_actions)
    end,
    dependencies = "davidmh/cspell.nvim",
  },
}
