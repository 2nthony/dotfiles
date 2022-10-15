-- builtin
-- https://github.com/kyazdani42/nvim-tree.lua

local nvim_tree = lvim.builtin.nvimtree

nvim_tree.setup.view.mappings.list = {
  { key = { "<CR>", "o" }, action = "edit" },
  { key = "O", action = "cd" },
  { key = "S", action = "live_filter" },
  { key = "cs", action = "clear_live_filter" },

  -- reset
  { key = "s", action = "" },
  { key = "f", action = "" },
}

nvim_tree.setup.live_filter = {
  prefix = "[Search]: ",
  always_show_folders = false,
}

nvim_tree.setup.git.ignore = true

table.insert(nvim_tree.setup.filters.custom, ".git/")
