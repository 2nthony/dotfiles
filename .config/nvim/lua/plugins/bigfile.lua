-- https://github.com/ayamir/nvimdots/blob/main/lua/modules/configs/editor/bigfile.lua

return {
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    opts = function()
      local set_filetype_bigfile = {
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

      local mini_indentscope = {
        name = "mini_indentscope",
        opts = { defer = true },
        disable = function()
          vim.b.miniindentscope_disable = true
        end,
      }

      return {
        filesize = 0.5, -- unit MB
        pattern = { "*" },
        features = {
          "treesitter",
          "lsp",
          "illuminate",
          "indent_blankline",
          "syntax",
          "vimopts",
          set_filetype_bigfile,
          cmp,
          mini_indentscope,
        },
      }
    end,
  },
}
