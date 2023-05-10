return {
  {
    "LuaSnip",
    keys = function()
      return {}
    end,
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
          pcall(opts.mapping["<CR>"] or opts.mapping["<cr>"])
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
