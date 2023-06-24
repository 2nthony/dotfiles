return {
  { import = "lazyvim.plugins.extras.coding.copilot" },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        vue = true,
      },
    },
  },
  -- disable cmp
  {
    "copilot-cmp",
    pin = true,
    config = function() end,
  },
}
