return {
  { import = "lazyvim.plugins.extras.ui.edgy" },
  {
    "edgy.nvim",
    opts = function(_, opts)
      for key, value in ipairs(opts.left) do
        if value.ft == "Outline" then
          table.remove(opts.left, key)
        end
      end
    end,
  },
  {
    "edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
      keys = {
        q = function(win)
          win.view.edgebar:close()
        end,
        Q = function(win)
          win:close()
        end,
      },
    },
  },
  {
    "neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          q = "",
        },
      },
    },
  },
}
