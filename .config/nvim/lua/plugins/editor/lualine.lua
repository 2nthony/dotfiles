-- https://github.com/nvim-lualine/lualine.nvim

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = require("lazyvim.config").icons

    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    local branch = { "branch", icon = icons.git.Branch }
    local filename = { "filename", path = 1 }
    local diagnostics = {
      "diagnostics",
      symbols = icons.diagnostics,
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
