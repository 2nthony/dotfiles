vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local float = require("util.opts").float
local lazykey = require("util.keymap").lazykey

local TREE_WIDTH = 30

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = function()
      local api = require("nvim-tree.api")

      return {
        disable_netrw = true,
        view = {
          width = TREE_WIDTH,
        },
        mappings = {
          { "s", nil },
          { "P", nil },
          { "<c-x>", nil },
          { "<c-s>", api.node.open.horizontal, desc = "Open: Horizontal Split" },
        },
      }
    end,
    config = function(_, opts)
      local mappings = opts.mappings
      opts.mappings = nil

      local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local float_preview = require("float-preview")
        float_preview.attach_nvimtree(bufnr)

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        if mappings then
          for _, key in ipairs(mappings) do
            key.buffer = bufnr
            lazykey(key)
          end
        end
      end

      require("nvim-tree").setup(vim.tbl_extend("force", opts, {
        on_attach = on_attach,
      }))
    end,
    dependencies = {
      {
        "JMarkin/nvim-tree.lua-float-preview",
        opts = {
          toggled_on = false,
          mapping = {
            -- scroll down float buffer
            down = { "<C-d>" },
            -- scroll up float buffer
            up = { "<C-u>" },
            -- enable/disable float windows
            toggle = { "<C-p>" },
          },
          window = {
            wrap = true,
            trim_height = false,
            open_win_config = function()
              local width = vim.opt.columns:get()
              local height = vim.opt.lines:get() - vim.opt.cmdheight:get()

              -- 1 is the border
              local left = TREE_WIDTH + 1
              local preview_width = math.floor(width - left - 2)

              return {
                style = "minimal",
                relative = "win",
                border = float.border,
                row = height,
                col = left,
                width = preview_width,
                height = height,
              }
            end,
          },
        },
        config = function(_, opts)
          require("float-preview").setup(opts)
        end,
      },
    },
  },
}
