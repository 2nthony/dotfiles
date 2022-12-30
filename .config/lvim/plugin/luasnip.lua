-- https://github.com/L3MON4D3/LuaSnip

local ok = pcall(require, "luasnip")
if not ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = {
    "~/Library/Application Support/Code/User/snippets",
  }
})
