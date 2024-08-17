local actions = require("telescope.actions")
local entry_display = require("telescope.pickers.entry_display")

return {
  { import = "lazyvim.plugins.extras.editor.telescope" },
  {
    "telescope.nvim",
    opts = {
      defaults = {
        wrap_results = true,
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.5 },
          vertical = { mirror = false },
        },
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
          n = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
          },
        },
        file_ignore_patterns = {
          ".git/",
          -- node
          "node_modules/",
          -- rust
          "**/debug/",
          "target/release/",
          -- yarn
          ".yarn/*",
        },
      },
      pickers = {
        oldfiles = {
          cwd_only = true,
        },
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
        commands = {
          entry_maker = function(entry)
            local displayer = entry_display.create({
              separator = " ",
              items = {
                { remaining = true },
                { remaining = true },
              },
            })

            ---@diagnostic disable-next-line: unused-local
            local function make_display(_entry)
              return displayer({ entry.name, { entry.definition:gsub("\n", " "), "Comment" } })
            end

            return {
              value = entry,
              ordinal = entry.name,
              display = make_display,
            }
          end,
        },
      },
    },
  },
}
