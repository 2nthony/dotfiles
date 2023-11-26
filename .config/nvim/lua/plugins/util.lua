local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  { import = "plugins.extras.util.project" },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    pin = true,
    ft = { "markdown" },
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
  },

  {
    "echasnovski/mini.indentscope",
    lazy = true,
    opts = {
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },

  {
    "folke/persistence.nvim",
    opts = {
      options = {
        "buffers",
        "curdir",
        "folds",
        "tabpages",
        "winsize",
        "winpos",
        "help",
        "globals",
      },
      pre_save = function()
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
            for _, skip_features_filetype in ipairs(skip_features_filetypes) do
              if buf_filetype == skip_features_filetype then
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
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = {
      "MCstart",
      "MCvisual",
      "MCclear",
      "MCpattern",
      "MCvisualPattern",
      "MCunderCursor",
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
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "css",
    },
    opts = function(self, opts)
      return vim.tbl_deep_extend("force", opts, {
        filetypes = self.ft,
        user_default_options = {
          RRGGBBAA = true,
          tailwind = true,
        },
      })
    end,
  },

  {
    "2nthony/qclose.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "2nthony/sortjson.nvim",
    cmd = {
      "SortJSONByAlphaNum",
      "SortJSONByAlphaNumReverse",
      "SortJSONByKeyLength",
      "SortJSONByKeyLengthReverse",
    },
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = {
      window = {
        width = 0.8,
        options = {
          number = false,
        },
      },
      plugins = {
        gitsigns = {
          enabled = true, -- true to disable...
        },
      },
    },
  },
}
