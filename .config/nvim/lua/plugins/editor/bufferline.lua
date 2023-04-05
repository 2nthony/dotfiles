return {
  "akinsho/bufferline.nvim",
  event = function()
    return { "BufReadPost" }
  end,
  keys = function()
    return {}
  end,
  opts = function(_, opts)
    local has = require("lazyvim.util").has

    opts.options = vim.tbl_extend("force", opts.options, {
      diagnostics = "nvim_lsp",
      mode = "tabs",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
      show_duplicate_prefix = false,
    })

    if has("vitesse.nvim") then
      local slant = require("vitesse.features.bufferline.slant")
      opts.options.separator_style = slant.separator_style
      opts.highlights = slant.highlights
    end

    return opts
  end,
}
