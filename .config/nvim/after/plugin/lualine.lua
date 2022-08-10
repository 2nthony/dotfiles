local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local symbols = require'symbols'

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = symbols.signs
}

local file_name = {
  'filename',
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 0, -- 0: Just the filename, 1: Relative path, 2: Absolute path
}

local filetype = {
  "filetype",
  colored = true,
  icons_enabled = true,
  icon_only = true,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = symbols.gits.branch,
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", " ", }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "solarized_dark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch  },
    lualine_c = { file_name },
    lualine_x = {
      diagnostics,
      "encoding",
      filetype
    },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { file_name },
    lualine_x = { location },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
