local lazykeys = require("util.keymap").lazykeys
local skip_features_filetypes = require("util.ft").skip_features_filetypes

return {
  {
    "Exafunction/codeium.vim",
    lazy = true,
    event = { "InsertEnter" },
    keys = {
      {
        "<tab>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        expr = true,
        mode = { "i" },
        silent = true,
        desc = "Codeium Accept",
      },
      {
        "<m-[>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        expr = true,
        mode = { "i" },
        desc = "Codeium Prev Completions",
      },
      {
        "<m-]>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        expr = true,
        mode = { "i" },
        desc = "Codeium Next Completions",
      },
      {
        "<c-]>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        expr = true,
        mode = { "i" },
        desc = "Codeium Dismiss",
      },
      {
        "<m-Bslash>",
        function()
          return vim.fn["codeium#Complete"]()
        end,
        expr = true,
        mode = { "i" },
        desc = "Codeium Trigger Sugestion",
      },
    },
    init = function()
      vim.g.codeium_disable_bindings = 1

      local codeium_filetypes = {}
      for _, ft in ipairs(skip_features_filetypes) do
        codeium_filetypes[ft] = false
      end
      vim.g.codeium_filetypes = codeium_filetypes
    end,
    config = function(self)
      lazykeys(self.keys)

      -- mentioned issue
      -- https://github.com/Exafunction/codeium.vim/issues/80#issuecomment-1485108506
      -- https://github.com/nvim-telescope/telescope.nvim/issues/2027
      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
          end
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, {
        function()
          -- 6
          local remap_status_string = {
            ["   "] = "",
            [" 0 "] = "",
            [" ON"] = "",
            ["OFF"] = "",
            [" * "] = " *",
          }
          local icon = "󰘦"
          local status = vim.fn["codeium#GetStatusString"]()

          return icon .. (remap_status_string[status] or (" " .. status))
        end,
      })
    end,
  },
}
