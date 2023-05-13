local float = require("util.opts").float
local icons = require("config.icons")
local icons_ui = icons.get("ui")
local icons_ui_space = icons.get("ui", { "space" })
local icons_misc_space = icons.get("misc", { "space" })
local icons_diagnostics_space = icons.get("diagnostics", { "space" })
local icons_filetype = icons.get("filetype")
local actions = require("telescope.actions")

local tailwind = {
  icon = icons_filetype.tailwind,
  color = "#38bdf8",
  name = "Tailwind",
}

local svg = {
  icon = icons_filetype.svg,
  color = "#FFB13B",
  name = "Svg",
}

local grep_picker = {
  preview = true,
  only_sort_text = true, -- don't include the filename in the search results
  path_display = { "shorten" },
}

return {
  {
    "goolord/alpha-nvim",
    lazy = true,
    opts = function(_, dashboard)
      local logo = require("util.alpha").logo

      dashboard.section.header.val = logo.empty

      dashboard.section.buttons.val = {
        dashboard.button("n", icons_ui_space.NewFile .. " New File", ":ene! <cr>"),
        dashboard.button(
          "f",
          icons_ui_space.GoToFile .. " Find File",
          ":lua require('lazyvim.util').telescope('files')() <cr>"
        ),
        dashboard.button("e", icons_ui_space.FileTree .. " File Explorer", ":Neotree toggle<cr>"),
        dashboard.button("r", icons_ui_space.Files .. " Recent files", ":Telescope oldfiles<cr>"),
        dashboard.button("s", icons_ui_space.History .. " Restore sessions", ":lua require('persistence').load()<cr>"),
        dashboard.button("l", icons_misc_space.Lazy .. " Lazy", ":Lazy<cr>"),
        dashboard.button("m", icons_ui_space.Package .. " Mason", ":Mason<cr>"),
        dashboard.button("c", icons_ui_space.Gear .. " Config", ":e $MYVIMRC <cr>"),
        dashboard.button("q", icons_ui_space.SignOut .. " Quit", ":q<cr>"),
        dashboard.button("x", icons_ui_space.CloseAll .. " Exit (Quit all)", ":qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButton"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      local head_butt_padding = 2
      local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
      local header_padding = math.max(0, math.ceil((vim.fn.winheight(0) - occu_height) * 0.25))
      local foot_butt_padding = 1

      dashboard.opts.layout = {
        { type = "padding", val = header_padding },
        dashboard.section.header,
        { type = "padding", val = head_butt_padding },
        dashboard.section.buttons,
        { type = "padding", val = foot_butt_padding },
        dashboard.section.footer,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_filename = {
        ["tailwind.config.js"] = tailwind,
        ["tailwind.config.cjs"] = tailwind,
        ["tailwind.config.ts"] = tailwind,
      },
      override_by_extension = {
        svg = svg,
      },
    },
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewLog",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
    },
    opts = function()
      local keymap_q_close = { "n", "q", ":DiffviewClose<cr>", { desc = "Diffview Close" } }

      return {
        enhanced_diff_hl = true,
        icons = {
          folder_closed = icons_ui.Folder,
          folder_open = icons_ui.FolderOpened,
        },
        signs = {
          fold_closed = icons_ui.ChevronRight,
          fold_open = icons_ui.ChevronDown,
          done = icons_ui.Check,
        },
        keymaps = {
          view = {
            keymap_q_close,
          },
          file_panel = {
            keymap_q_close,
          },
          file_history_panel = {
            keymap_q_close,
          },
        },
      }
    end,
  },

  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        win_options = {
          winblend = float.winblend,
        },
      },
      select = {
        nui = {
          win_options = {
            winblend = float.winblend,
          },
        },
      },
      builtin = {
        win_options = {
          winblend = float.winblend,
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    cmd = { "Gitsigns" },
    opts = {
      current_line_blame = true,
      preview_config = {
        border = float.border,
        style = float.style,
      },
    },
  },

  {
    "ggandor/leap.nvim",
    opts = {
      highlight_unlabeled_phase_one_targets = true,
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
    end,
  },

  {
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
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    opts = {
      theme = "dropdown",
      defaults = {
        prompt_prefix = icons_ui_space.Telescope,
        selection_caret = icons_ui_space.ChevronRight,
        preview = false,
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
          -- rust
          "**/debug/",
          "target/release/",
          -- yarn
          ".yarn/*",
        },
      },
      pickers = {
        find_files = {
          no_ignore = false,
          hidden = true,
        },
        oldfiles = {
          cwd_only = true,
        },
        live_grep = grep_picker,
        grep_string = grep_picker,
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
        git_status = {
          git_icons = icons.get("git_symbol", { "lower_case" }),
        },
      },
    },
    config = function(_, opts)
      local theme = require("telescope.themes")["get_" .. (opts.theme or "dropdown")]
      if theme then
        opts.defaults = theme(opts.defaults)
      end

      if vim.fn.executable("rg") then
        -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua#LL87C36-L87C36
        opts.defaults.vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        }
      end

      require("telescope").setup(opts)
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = vim.fn.executable("fzf"),
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIX = {
          icon = icons_ui_space.Bug,
        },
        TODO = {
          icon = icons_ui_space.Check,
        },
        HACK = {
          icon = icons_ui_space.Skull,
        },
        WARN = {
          icon = icons_diagnostics_space.Warn,
        },
        PERF = {
          icon = icons_ui_space.Dashboard,
        },
        NOTE = {
          icon = icons_ui_space.Comment,
        },
        TEST = {
          icon = icons_ui_space.Beaker,
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = float.border,
        winblend = float.winblend,
      },
    },
  },
}
