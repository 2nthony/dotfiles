-- https://github.com/onsails/lspkind.nvim

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init({
  -- symbol_map = lvim.icons.kind,
  presets = "codicons"
})

lvim.builtin.cmp.formatting.format = lspkind.cmp_format({
  mode = "symbol",
})
