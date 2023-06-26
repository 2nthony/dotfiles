return {
  {
    "LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "copilot.lua",
    keys = {
      {
        "<tab>",
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            return '<cmd>lua require("copilot.suggestion").accept()<cr>'
          else
            return "<Tab>"
          end
        end,
        mode = { "i" },
        expr = true,
        silent = true,
      },
    },
  },

  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        local entry = cmp.get_selected_entry() or {}
        local entry_source_name = vim.tbl_get(entry, "source", "name")

        if luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        elseif entry and entry_source_name == "luasnip" then
          if luasnip.expandable() then
            luasnip.expand()
          end
        elseif cmp.visible() then
          pcall(opts.mapping["<CR>"] or opts.mapping["<cr>"] or cmp.mapping.confirm({ select = true }))
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
}
