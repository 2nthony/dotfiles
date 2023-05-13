return {
  "nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- if back to normal mode, then unlink snippet action
    opts.mapping["<esc>"] = cmp.mapping(function(callback)
      if luasnip.in_snippet() then
        luasnip.unlink_current()
      end

      callback()
    end, { "i", "s" })
  end,
}
