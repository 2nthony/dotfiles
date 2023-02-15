-- builtin
-- https://github.com/lunarvim/lunarvim/blob/rolling/lua/lvim/core/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")

local lcmp = lvim.builtin.cmp

lcmp.mapping["<C-space>"] = {}
lcmp.mapping["<C-f>"] = {}
lcmp.mapping["<C-p>"] = cmp.mapping.complete()
lcmp.mapping["<C-u>"] = cmp.mapping.scroll_docs( -4)
lcmp.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)

-- if back to normal mode, then unlink snippet action
lcmp.mapping["<esc>"] = cmp.mapping(function(callback)
  if luasnip.in_snippet() then
    luasnip.unlink_current()
  end

  -- NOTE: CAN NOT delete this `callback`
  callback()
end, { "i", "s" })

lcmp.confirm_opts = {
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
}

lcmp.formatting.duplicates.nvim_lsp = nil
