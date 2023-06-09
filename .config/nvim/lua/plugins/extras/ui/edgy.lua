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
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = "Neo-Tree Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        "neo-tree",
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
