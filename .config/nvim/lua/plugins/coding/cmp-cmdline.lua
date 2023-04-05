return {
  "hrsh7th/cmp-cmdline",
  lazy = true,
  event = { "CmdlineEnter" },
  opts = {
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
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function(_, opts)
    local cmp = require("cmp")

    for _, opt in ipairs(opts) do
      cmp.setup.cmdline(opt.type, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(opt.sources),
        completion = {
          completeopt = "menu,menuone,noselect",
        },
      })
    end
  end,
}
