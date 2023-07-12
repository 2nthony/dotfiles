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
      {
        "<m-right>",
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            return '<cmd>lua require("copilot.suggestion").accept_word()<cr>'
          else
            return "<m-right>"
          end
        end,
        mode = { "i" },
        expr = true,
        silent = true,
        desc = "Copilot accept word",
      },
      {
        "<m-l>",
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            return '<cmd>lua require("copilot.suggestion").accept_line()<cr>'
          else
            return "<m-l>"
          end
        end,
        mode = { "i" },
        expr = true,
        silent = true,
        desc = "Copilot accept line",
      },
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          -- accept_word = "<m-right>",
          -- accept_line = "<m-l>",
        },
      },
      filetypes = {
        vue = true,
      },
    },
  },
}
