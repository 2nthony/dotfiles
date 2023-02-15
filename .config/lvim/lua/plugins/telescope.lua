-- builtin
-- https://github.com/nvim-telescope/telescope.nvim

local actions = require('telescope.actions')
local telescope = lvim.builtin.telescope

telescope.defaults.mappings.i["<Tab>"] = actions.move_selection_next
telescope.defaults.mappings.i["<S-Tab>"] = actions.move_selection_previous
telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous

telescope.defaults.preview = false

telescope.defaults.path_display = { "smart" }

telescope.theme = "dropdown"

telescope.pickers.buffers.initial_mode = "insert"
telescope.pickers.oldfiles = {
  cwd_only = true,
}

telescope.defaults.file_ignore_patterns = {
  "node_modules/",
  ".git/",
  -- rust
  "**/debug/",
  "target/release/",
}
