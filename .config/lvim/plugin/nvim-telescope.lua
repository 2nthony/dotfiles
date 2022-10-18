-- builtin
-- https://github.com/nvim-telescope/telescope.nvim

local actions = require('telescope.actions')
local telescope = lvim.builtin.telescope

telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous

-- in order to disable the previewer
telescope.defaults.layout_strategy = "vertical"

telescope.defaults.path_display.shorten = nil

-- override pickers
telescope.pickers.buffers.initial_mode = nil
telescope.pickers.oldfiles = {
  theme = "dropdown",
  previewer = false,
}

telescope.defaults.file_ignore_patterns = {
  "node_modules/",
  ".git/",
  -- rust
  "**/debug/",
  "target/release/",
}
