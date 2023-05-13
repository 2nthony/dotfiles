-- https://github.com/nvim-neo-tree/neo-tree.nvim
local icons = require("config.icons")
local icons_ui = icons.get("ui")

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
      },
    },
    window = {
      width = 35,
      mappings = {
        ["s"] = "",
        ["S"] = "",
        ["<C-x>"] = "",
        -- ["o"] = "open",
        -- ["<cr>"] = "open",
        -- ["<C-s>"] = "open_split",
        -- ["<C-v>"] = "open_vsplit",
        ["o"] = "open_with_window_picker",
        ["<cr>"] = "open_with_window_picker",
        ["<C-s>"] = "split_with_window_picker",
        ["<C-v>"] = "vsplit_with_window_picker",
        ["<C-f>"] = "clear_filter",
        ["g?"] = "show_help",
        ["/"] = "", -- default search down
        ["?"] = "", --default search above
      },
    },
    default_component_configs = {
      indent = {
        expander_collapsed = icons_ui.ChevronRight,
        expander_expanded = icons_ui.ChevronDown,
      },
      icon = {
        folder_closed = icons_ui.Folder,
        folder_open = icons_ui.FolderOpened,
        folder_empty = icons_ui.FolderOpened,
        default = icons_ui.Text,
      },
      git_status = {
        symbols = icons.get("git_symbol", { "lower_case" }),
      },
    },
  },
  dependencies = {
    -- https://github.com/s1n7ax/nvim-window-picker
    {
      "s1n7ax/nvim-window-picker",
      opts = {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      },
    },
  },
}
