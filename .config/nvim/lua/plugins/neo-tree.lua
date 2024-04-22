return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
        never_show = {
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
    window = {
      width = 35,
      mappings = {
        ["s"] = "",
        ["S"] = "",
        ["<C-x>"] = "",
        ["<C-s>"] = "open_split",
        ["<C-v>"] = "open_vsplit",
        ["<C-f>"] = "clear_filter",
        ["g?"] = "show_help",
        ["/"] = "", -- default search down
        ["?"] = "", --default search above
      },
    },
    nesting_rules = {
      ["js"] = { "js.map" },
    },
  },
}
