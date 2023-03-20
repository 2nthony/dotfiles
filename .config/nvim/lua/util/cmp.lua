local icons = require("lazyvim.config").icons
local lspkind = require("lspkind")

local M = {}

-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/after/plugin/cmp.rc.lua#L5
M.format_taiwlindcss_color = function(entry, vim_item)
  if vim_item.kind == "Color" and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
    if r then
      local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
      local group = "Tw_" .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
      end
      vim_item.kind = icons.kinds.Color
      vim_item.kind_hl_group = group
      return vim_item
    end
  end

  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind

  return vim_item
end

-- 1 allow
-- 0 disallow
M.duplicates = {
  default = 0,

  nvim_lsp = 1,
  buffer = 0,
  path = 0,
}

M.formatting = {
  max_width = 50,
}

return M
