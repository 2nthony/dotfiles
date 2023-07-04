return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      table.insert(
        opts.sources,
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file_matches(".prettier*")
          end,
        })
      )
    end,
  },
}
