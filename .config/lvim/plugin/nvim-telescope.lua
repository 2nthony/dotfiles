-- builtin
-- https://github.com/nvim-telescope/telescope.nvim

local actions = require('telescope.actions')
local telescope = lvim.builtin.telescope

telescope.defaults.mappings.i["<Tab>"] = actions.move_selection_next
telescope.defaults.mappings.i["<S-Tab>"] = actions.move_selection_previous
telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous

-- in order to disable the previewer
telescope.defaults.layout_strategy = "vertical"

telescope.defaults.path_display = nil

-- override pickers
local picker_options = {
  theme = "dropdown",
  previewer = false,
}
telescope.pickers.buffers.initial_mode = nil
telescope.pickers.find_files = picker_options
telescope.pickers.oldfiles = picker_options
telescope.pickers.buffers = picker_options
telescope.pickers.grep_string = picker_options
telescope.pickers.live_grep = picker_options

telescope.defaults.file_ignore_patterns = {
  "node_modules/",
  ".git/",
  -- rust
  "**/debug/",
  "target/release/",
}
