-- https://www.lazyvim.org/plugins/extras/util.project
-- https://github.com/coffebar/project.nvim

local cmd = ":Telescope projects<cr>"

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
    "alpha-nvim",
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Projects", cmd)
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
}
