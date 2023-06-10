-- https://github.com/jcdickinson/codeium.nvim
return {
  {
    "jcdickinson/codeium.nvim",
    lazy = true,
    event = { "InsertEnter" },
    init = function()
      require("util.cmp").duplicates.codeium = 0
    end,
    opts = {},
    dependencies = {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        table.insert(opts.sources, 1, { name = "codeium", group_index = 1 })
      end,
    },
  },
}
