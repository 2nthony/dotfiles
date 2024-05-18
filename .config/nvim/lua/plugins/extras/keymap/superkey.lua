-- superkey means a key with a lot of functionality
-- by condition, rely on cmp mapping

local copilot = require("util.copilot")

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      local keys = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if not cmp.visible() and copilot.suggestion_visible_nearby() then
            copilot.suggestion_accept()
          elseif vim.snippet.active({ direction = 1 }) then
            if copilot.suggestion_visible_nearby() then
              copilot.suggestion_accept()
              return
            end

            vim.snippet.jump(1)
          elseif cmp.visible() then
            pcall(opts.mapping["<CR>"] or opts.mapping["<cr>"] or cmp.mapping.confirm({ select = true }))
          else
            if copilot.suggestion_visible_nearby() then
              copilot.suggestion_accept()
              return
            end

            fallback()
          end
        end, { "i", "s" }),

        ["<esc>"] = cmp.mapping(function(fallback)
          if vim.snippet.active() then
            vim.snippet.stop()
          end

          fallback()
        end, { "i", "s" }),

        ["<bs>"] = cmp.mapping(function(fallback)
          if vim.snippet.active() then
            vim.cmd("startinsert")
          end

          fallback()
        end, { "s" }),

        ["<c-l>"] = cmp.mapping(function(fallback)
          if copilot.suggestion_visible() then
            copilot.suggestion_accept()
            return
          end

          fallback()
        end, { "n", "i" }),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, keys)
    end,
  },

  -- vscode like
  -- for copilot, if cmp visible, then hide copilot suggestions
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")

      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end,
  },
}
