-- https://github.com/onsails/lspkind.nvim

local status_lspkind_ok, lspkind = pcall(require, "lspkind")
if not status_lspkind_ok then
  return
end

lspkind.init({
  -- symbol_map = lvim.icons.kind,
  presets = "codicons"
})

lvim.builtin.cmp.formatting.format = lspkind.cmp_format({
  mode = "symbol",
})
