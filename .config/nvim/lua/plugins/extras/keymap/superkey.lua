-- superkey means a key with a lot of functionality by condition, rely on cmp mapping

local copilot = require("util.copilot")

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          local entry = cmp.get_selected_entry() or {}
          local entry_source_name = vim.tbl_get(entry, "source", "name")

          if not cmp.visible() and copilot.suggestion_visible_nearby() then
            copilot.suggestion_accept()
          elseif luasnip.locally_jumpable(1) then
            if copilot.suggestion_visible_nearby() then
              copilot.suggestion_accept()
              return
            end

            luasnip.jump(1)
          elseif entry and entry_source_name == "luasnip" then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({ select = true })
            end
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

        ["<s-tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<esc>"] = cmp.mapping(function(fallback)
          if luasnip.in_snippet() then
            luasnip.unlink_current()
          end

          fallback()
        end, { "i", "s" }),

        ["<bs>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
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
      })
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

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
