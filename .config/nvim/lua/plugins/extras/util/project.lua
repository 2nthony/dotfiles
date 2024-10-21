-- https://www.lazyvim.org/plugins/extras/util.project

local M = require("lazyvim.plugins.extras.util.project")

local project = {
  "2nthony/project.nvim",
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
}

for _, spec in ipairs(M) do
  if spec[1] == "ahmedkhalf/project.nvim" then
    spec[1] = project[1]
    spec.opts = project.opts
  end
end

return M
