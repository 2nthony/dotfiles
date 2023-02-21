-- lsp, cmp
-- https://github.com/onsails/lspkind.nvim

return {
  "onsails/lspkind.nvim",
  event = "VeryLazy",
  config = function()
    local lspkind = require("lspkind")
    local lcmp = lvim.builtin.cmp

    local function format_for_tailwind_css(entry, vim_item)
      if vim_item.kind == 'Color' and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
        if r then
          local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
          local group = 'Tw_' .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
          end
          vim_item.kind = ""
          vim_item.kind_hl_group = group
          return vim_item
        end
      end
      vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
      return vim_item
    end

    lcmp.formatting.format = lspkind.cmp_format({
      maxwidth = lcmp.formatting.max_width,
      symbol_map = lvim.icons.kind,
      ellipsis_char = lvim.icons.ui.Ellipsis,
      before = function(entry, vim_item)
        vim_item = format_for_tailwind_css(entry, vim_item)
        return vim_item
      end
    })
  end
}
