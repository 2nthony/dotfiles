local status_lspkind_ok, lspkind = pcall(require, "lspkind")
if not status_lspkind_ok then
  return
end
local status_colorbuddy_ok, colorbuddy = pcall(require, "colorbuddy")

lspkind.init({
  -- enables text annotations
  --
  -- default: true
  mode = 'symbol',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
    Copilot = "",
  },
})

if status_colorbuddy_ok then
  local Group = colorbuddy.Group
  local colors = colorbuddy.colors

  Group.new("CmpItemKindCopilot", colors.blue:dark())
end
