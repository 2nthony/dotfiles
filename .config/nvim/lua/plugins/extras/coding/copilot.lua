local M = {}

local copilot_spec = require("lazyvim.plugins.extras.coding.copilot")
local copilot = require("util.copilot")

for _, spec in ipairs(copilot_spec) do
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
        "<m-right>",
        function()
          if copilot.suggestion_visible() then
            return '<cmd>lua require("copilot.suggestion").accept_word()<cr>'
          end

          return "<m-right>"
        end,
        mode = { "i" },
        expr = true,
        silent = true,
        desc = "Copilot accept word",
      },
      {
        "<c-]>",
        function()
          if copilot.suggestion_visible() then
            require("copilot.suggestion").dismiss()
            return
          end

          return "<c-]>"
        end,
        mode = { "i" },
        expr = true,
        silent = true,
        desc = "Copilot dismiss",
      },
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = false,
        },
      },
      filetypes = {
        vue = true,
      },
      server_opts_overrides = {
        settings = {
          advanced = {
            inlineSuggestCount = 5, -- #completions for getCompletions
          },
        },
      },
    },
  },
}
