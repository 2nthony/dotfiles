-- https://github.com/jose-elias-alvarez/null-ls.nvim

return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    opts = function(_, opts)
      local float = require("util.opts").float
      local nls = require("null-ls")

      return vim.tbl_extend("force", opts, {
        log_level = "error",
        border = float.border,
        sources = vim.list_extend(opts.sources, {
          nls.builtins.formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file_matches(".prettier*")
            end,
          }),
        }),
      })
    end,
  },
}
