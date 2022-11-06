-- builtin
-- https://github.com/nvim-lualine/lualine.nvim

local lualine = lvim.builtin.lualine
local components = require("lvim.core.lualine.components")

local file_name = {
  'filename',
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 0, -- 0: Just the filename, 1: Relative path, 2: Absolute path
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
}

local filetype = {
  "filetype",
  colored = true,
  icons_enabled = true,
  icon_only = true,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "  ", }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

lualine.options = {
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  always_divide_middle = true,
}

if vim.g.colorscheme == "neosolarized" then
  lualine.options.theme = "solarized_dark"
end

lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { components.branch },
  lualine_c = { file_name },
  lualine_x = {
    diagnostics,
    components.filetype
  },
  lualine_y = { components.location },
  lualine_z = { progress },
}

lualine.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = { file_name },
  lualine_x = { components.location },
  lualine_y = {},
  lualine_z = {},
}
