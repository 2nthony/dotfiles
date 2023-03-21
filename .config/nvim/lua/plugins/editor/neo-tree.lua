-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  cmd = "Neotree",
  keys = function()
    return {}
  end,
  opts = function(_, opts)
    local icons = require("icons")
    local has = require("lazyvim.util").has

    local function open(cmd)
      if has("nvim-window-picker") then
        cmd = cmd .. "_with_window_picker"
      end
      return cmd
    end

    opts.filesystem.follow_current_file = false
    opts.filesystem.filtered_items = {
      hide_dotfiles = false,
      hide_by_name = {
        ".git",
      },
      never_show = {
        ".DS_Store",
      },
    }

    opts.window.width = 35

    opts.window.mappings["s"] = ""
    opts.window.mappings["S"] = ""
    opts.window.mappings["f"] = ""
    opts.window.mappings["o"] = open("open")
    opts.window.mappings["<cr>"] = open("open")
    opts.window.mappings["<C-s>"] = open("split")
    opts.window.mappings["<C-v>"] = open("vsplit")
    opts.window.mappings["<C-f>"] = "filter_on_submit"

    opts.default_component_configs.indent.expander_collapsed = icons.ui.ChevronRight
    opts.default_component_configs.indent.expander_expanded = icons.ui.ChevronDown
    opts.default_component_configs.icon = {
      folder_closed = icons.ui.Folder,
      folder_open = icons.ui.FolderOpen,
      folder_empty = icons.ui.FolderOpenLine,
      default = icons.ui.Text,
    }

    return opts
  end,
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
