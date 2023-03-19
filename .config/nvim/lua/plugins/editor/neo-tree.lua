local icons = require("util.icon")

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  cmd = "Neotree",
  keys = function()
    return {}
  end,
  opts = {
    filesystem = {
      follow_current_file = false,
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
        never_show = {
          ".DS_Store",
        },
      },
    },
    window = {
      width = 35,
      mappings = {
        ["o"] = "open",
        ["<C-s>"] = "open_split",
        ["<C-v>"] = "open_vsplit",
        ["<C-f>"] = "filter_on_submit",
        -- unmap
        ["s"] = "",
        ["S"] = "",
        ["f"] = "",
      },
    },
    default_component_configs = {
      indent = {
        expander_collapsed = icons.ui.ChevronShortRight,
        expander_expanded = icons.ui.ChevronShortDown,
      },
    },
  },
}
