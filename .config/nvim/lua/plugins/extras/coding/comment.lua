-- https://github.com/LazyVim/LazyVim/releases/tag/v3.0.0
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#commentnvim
-- https://github.com/ayamir/nvimdots/blob/main/lua/modules/configs/editor/comment.lua

return {
  {
    "numToStr/Comment.nvim",
    event = { "VeryLazy" },
    keys = {
      {
        "gb",
        "<Plug>(comment_toggle_blockwise_visual)",
        desc = "Toggle comment blockwise",
        mode = { "x" },
      },
    },
    opts = {
      ignore = "^$",
      mappings = {
        basic = false,
        extra = false,
      },
    },
    config = function(_, opts)
      opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup(opts)
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        event = { "VeryLazy" },
        init = function()
          vim.g.skip_ts_context_commentstring_module = true
        end,
        opts = {},
      },
    },
  },
}
