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
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    keys = {
      {
        "<tab>",
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            return '<cmd>lua require("copilot.suggestion").accept()<cr>'
          else
            return "<Tab>"
          end
        end,
        mode = { "i" },
        expr = true,
        silent = true,
      },
    },
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
