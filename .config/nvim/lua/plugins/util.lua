local float = require("util.opts").float

return {
  { import = "plugins.extras.util.project" },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    pin = true,
    ft = { "markdown", "md" },
  },

  {
    "echasnovski/mini.indentscope",
    lazy = true,
    opts = function(_, opts)
      opts.draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      }
      return opts
    end,
  },

  {
    "folke/persistence.nvim",
    opts = {
      options = {
        -- "buffers",
        "curdir",
        "folds",
        "tabpages",
        "winsize",
        "winpos",
        "help",
        "globals",
      },
      pre_save = function()
        local skip_filetypes = {
          "neo-tree",
          "alpha",
          "NvimTree",
          "gitcommit",
        }

        -- https://github.com/rmagatti/auto-session/issues/176#issuecomment-1278384005
        -- https://github.com/rmagatti/auto-session/blob/1d3dd70a2d48e0f3441128eb4fb0b437a0bf2cc4/lua/auto-session.lua#L196
        local buffers = vim.api.nvim_list_bufs()
        for _, buffer in ipairs(buffers) do
          local should_wipeout = false

          local buf_name = vim.api.nvim_buf_get_name(buffer)
          local buf_filetype = vim.api.nvim_buf_get_option(buffer, "filetype")

          if buf_name == "" then
            should_wipeout = true
          end

          if not should_wipeout then
            for _, skip_filetype in ipairs(skip_filetypes) do
              if buf_filetype == skip_filetype then
                should_wipeout = true
                break
              end
            end
          end

          if should_wipeout then
            vim.api.nvim_command("bwipeout! " .. buffer)
          end
        end
      end,
    },
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = { [[<c-\>]] },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = float.border,
        -- https://github.com/akinsho/toggleterm.nvim/issues/61
        winblend = float.winblend,
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    lazy = true,
    init = function()
      -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
      vim.cmd([[
      let g:VM_default_mappings = 0
      let g:VM_maps = {}
      let g:VM_maps["Find Under"] = ''
      let g:VM_maps["Find Subword Under"] = ''
    ]])
    end,
  },

  { "wakatime/vim-wakatime", event = "BufReadPost" },

  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = true,
    keys = {
      { "j", "<Plug>(accelerated_jk_gj)" },
      { "k", "<Plug>(accelerated_jk_gk)" },
    },
    opts = {
      mode = "time_driven",
      enable_deceleration = false,
      acceleration_motions = {},
      acceleration_limit = 150,
      acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
      -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
      deceleration_table = { { 150, 9999 } },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    ft = {
      "lua",
      "html",
      "vue",
      "js",
      "ts",
      "jsx",
      "tsx",
      "svelte",
      "css",
    },
    opts = {
      user_default_options = {
        RRGGBBAA = true,
        tailwind = true,
      },
    },
  },

  {
    "gbprod/cutlass.nvim",
    lazy = false,
    opts = {
      cut_key = "x",
      exclude = { "ns" },
    },
  },

  {
    "stevearc/overseer.nvim",
    lazy = true,
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearAction",
    },
    opts = {
      form = {
        border = float.border,
        win_opts = {
          winblend = float.winblend,
        },
      },
      confirm = {
        border = float.border,
        win_opts = {
          winblend = float.winblend,
        },
      },
      task_win = {
        border = float.border,
        win_opts = {
          winblend = float.winblend,
        },
      },
    },
  },
}
