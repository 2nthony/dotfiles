-- ide-like?

vim.opt.cmdheight = 0

return {
  {
    "noice.nvim",
    opts = function(_, opts)
      opts.cmdline.view = nil

      return vim.tbl_deep_extend("force", opts, {
        cmdline = {
          enabled = true,
        },
        presets = {
          bottom_search = false,
          inc_rename = true,
        },
        messages = {
          enabled = true,
        },
      })
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    opts = function(_, opts)
      opts.input_buffer_type = nil
    end,
  },
}
