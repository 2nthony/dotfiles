-- theme
-- https://github.com/svrana/neosolarized.nvim

local status_neosolarized_ok, neosolarized = pcall(require, "neosolarized")
if not status_neosolarized_ok then
  return
end

if vim.g.colorscheme ~= "neosolarized" then
  return
end

local n = neosolarized.setup({
  comment_italics = true,
})

local colors = n.colors
local Group = n.Group
local groups = n.groups
local styles = n.styles

Group.new('CursorLine', colors.none, colors.base03, styles.none, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.base03, styles.none, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.none)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

vim.cmd('colorscheme neosolarized')
