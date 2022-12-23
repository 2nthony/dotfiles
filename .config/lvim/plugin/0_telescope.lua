-- builtin
-- https://github.com/nvim-telescope/telescope.nvim

local actions = require('telescope.actions')
local telescope = lvim.builtin.telescope

telescope.defaults.mappings.i["<Tab>"] = actions.move_selection_next
telescope.defaults.mappings.i["<S-Tab>"] = actions.move_selection_previous
telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous

telescope.defaults.prompt_prefix = ""
telescope.defaults.selection_caret = "  "

telescope.defaults.preview = false

telescope.defaults.path_display = nil

telescope.theme = "dropdown"

telescope.pickers.buffers.initial_mode = "insert"

telescope.defaults.file_ignore_patterns = {
  "node_modules/",
  ".git/",
  -- rust
  "**/debug/",
  "target/release/",
}
