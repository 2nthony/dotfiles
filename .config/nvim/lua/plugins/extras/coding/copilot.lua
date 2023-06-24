local M = {}

local copilot = require("lazyvim.plugins.extras.coding.copilot")

for _, spec in ipairs(copilot) do
  if spec[1] == "nvim-cmp" then
    break
  end

  table.insert(M, spec)
end

return {
  M,
  {
    "copilot.lua",
    event = "VeryLazy",
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
}
