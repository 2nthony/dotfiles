-- https://github.com/ayamir/nvimdots/blob/main/lua/modules/configs/editor/bigfile.lua

return {
  "LunarVim/bigfile.nvim",
  lazy = false,
  config = function(_)
    local detect_bigfile = {
      name = "detect_bigfile",
      opts = { defer = true },
      disable = function()
        vim.api.nvim_set_option_value("filetype", "bigfile", { scope = "local" })
      end,
    }

    local cmp = {
      name = "cmp",
      opts = { defer = true },
      disable = function()
        local ok, cmp = pcall(require, "cmp")
        if ok then
          cmp.setup.buffer({ enabled = false })
        end
      end,
    }

    require("bigfile").config({
      filesize = 0.2, -- unit MB
      pattern = { "*" },
      features = {
        detect_bigfile,
        cmp,
        "treesitter",
        "lsp",
        "illuminate",
        "indent_blankline",
        "syntax",
        "filetype",
        "vimopts",
      },
    })
  end,
}
