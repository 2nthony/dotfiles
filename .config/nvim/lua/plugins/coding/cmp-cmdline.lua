return {
  "hrsh7th/cmp-cmdline",
  lazy = true,
  event = { "CmdlineEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = {
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    types = {
      {
        type = ":",
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      },
      {
        type = { "/", "?" },
        sources = {
          { name = "buffer" },
        },
      },
    },
  },
  config = function(_, opts)
    local cmp = require("cmp")

    for _, opt in ipairs(opts.types) do
      cmp.setup.cmdline(opt.type, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(opt.sources),
        completion = opts.completion,
      })
    end
  end,
}
