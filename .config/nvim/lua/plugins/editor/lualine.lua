-- https://github.com/nvim-lualine/lualine.nvim
local icons = require("config.icons")
local icons_git = icons.get("git")
local icons_diagnostics = icons.get("diagnostics", { "lower_case", "space" })

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    local branch = { "branch", icon = icons_git.Branch }
    local filename = { "filename", path = 1 }
    local diagnostics = {
      "diagnostics",
      symbols = icons_diagnostics,
    }
    local filetype = { "filetype" }
    local location = { "location", padding = { left = 0, right = 1 } }

    opts.sections.lualine_a = { "mode" }
    opts.sections.lualine_b = { branch }
    opts.sections.lualine_c = { diagnostics, filename }
    opts.sections.lualine_x = { filetype, location }
    opts.sections.lualine_y = {}
    opts.sections.lualine_z = {}

    return opts
  end,
}
