-- https://www.lazyvim.org/plugins/extras/util.project
-- https://github.com/coffebar/project.nvim

local action = "Telescope projects"
local cmd = ":" .. action .. "<cr>"

return {
  {
    "telescope.nvim",
    dependencies = {
      "2nthony/project.nvim",
      event = "VeryLazy",
      keys = {
        { "<leader>fp", cmd, desc = "Projects" },
      },
      opts = {
        detection_methods = { "pattern" },
        patterns = {
          "!>home",
          "!=tmp",
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
          "=package.json", -- monorepo
        },
        exclude_dirs = {
          "~/.local/*",
          "~/.cache/*",
          "~/.cargo/*",
          "~/.node_modules/*",
        },
        on_changed = function()
          local has = require("lazyvim.util").has

          if has("persistence.nvim") then
            require("persistence").load()
          end
        end,
      },
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("telescope").load_extension("projects")
      end,
    },
  },
  {
    "dashboard-nvim",
    opts = function(_, dashboard)
      table.insert(dashboard.config.center, 4, {
        action = action,
        desc = " Projects",
        icon = " ",
        key = "p",
      })
    end,
  },
}
