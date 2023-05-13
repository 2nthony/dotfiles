local actions = require("telescope.actions")
local icons = require("config.icons")
local icons_ui = icons.get("ui", { "space" })

local grep_picker = {
  preview = true,
  only_sort_text = true, -- don't include the filename in the search results
  path_display = { "shorten" },
}

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  opts = {
    theme = "dropdown",
    defaults = {
      prompt_prefix = icons_ui.Telescope,
      selection_caret = icons_ui.ChevronRight,
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
}
