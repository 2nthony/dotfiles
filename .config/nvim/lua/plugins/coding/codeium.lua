-- https://github.com/jcdickinson/codeium.nvim

return {
  "jcdickinson/codeium.nvim",
  lazy = true,
  event = { "InsertEnter" },
  opts = {},
  init = function()
    require("util.cmp").duplicates.codeium = 0
  end,
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        table.insert(opts.sources, 1, { name = "codeium", group_index = 1 })

        return opts
      end,
    },
  },
}
