-- builtin
-- https://github.com/lunarvim/lunarvim/blob/rolling/lua/lvim/core/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")
local float_opts = require("utils.float-opts")

local lcmp = lvim.builtin.cmp

lcmp.mapping["<C-space>"] = {}
lcmp.mapping["<C-p>"] = cmp.mapping.complete()
lcmp.mapping["<C-f>"] = cmp.mapping.scroll_docs( -4)
lcmp.mapping["<C-d>"] = cmp.mapping.scroll_docs(4)

-- if back to normal mode, then unlink snippet action
lcmp.mapping["<esc>"] = cmp.mapping(function(callback)
  if luasnip.in_snippet() then
    luasnip.unlink_current()
  end

  -- NOTE: CAN NOT delete this `callback`
  callback()
end, { "i", "s" })

local win_opts = cmp.config.window.bordered({
  border = float_opts.border,
})
lcmp.window.completion = win_opts
lcmp.window.documentation = win_opts

lcmp.confirm_opts = {
  behavior = cmp.ConfirmBehavior.Replace,
  select = false,
}

-- format
-- for more see plugins/lspkind
lcmp.formatting.duplicates.nvim_lsp = 5
lcmp.formatting.max_width = 25
