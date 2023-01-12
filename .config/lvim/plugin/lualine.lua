-- builtin
-- https://github.com/nvim-lualine/lualine.nvim

local ok = pcall(require, "lualine")
if not ok then
  return
end

local lualine = lvim.builtin.lualine
local components = require("lvim.core.lualine.components")

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
}

local filetype = components.filetype

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "  ", }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local branch = {
  "branch",
  icon = lvim.icons.git.Branch
}

lualine.options = {
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  always_divide_middle = true,
}

if vim.g.colorscheme == "neosolarized" then
  lualine.options.theme = "solarized_dark"
end

if lvim.colorscheme == "vitesse" then
  lualine.options.theme = "vitesse"
end

lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { branch },
  lualine_c = { components.filename },
  lualine_x = { diagnostics, filetype },
  lualine_y = { components.location },
  lualine_z = { progress },
}

lualine.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { components.filename },
  lualine_x = { components.location },
  lualine_y = {},
  lualine_z = {},
}
