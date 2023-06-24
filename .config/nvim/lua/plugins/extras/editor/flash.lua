return {
  { import = "lazyvim.plugins.extras.editor.flash" },

  {
    "flash.nvim",
    keys = {
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = true, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash forward",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { forward = false, wrap = false, multi_window = false },
          })
        end,
        desc = "Flash backward",
      },
      {
        "gf",
        function()
          require("flash").jump({
            search = { multi_window = true },
          })
        end,
        desc = "Flash window",
      },
    },
    opts = {
      modes = {
        -- disable flit, I use `f` for search/find
        char = {
          enabled = false,
        },
      },
    },
  },
}
