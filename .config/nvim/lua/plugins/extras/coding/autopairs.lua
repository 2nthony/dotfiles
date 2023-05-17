-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/autopairs.lua

return {
  { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = { "InsertEnter" },
    opts = {
      ---@usage  modifies the function or method delimiter by filetypes
      map_char = {
        all = "(",
        tex = "{",
      },
      check_ts = true,
      ts_config = {
        javascript = { "string", "template_string" },
      },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      pcall(function()
        local function on_confirm_done(...)
          require("nvim-autopairs.completion.cmp").on_confirm_done(...)
        end

        require("cmp").event:off("confirm_done", on_confirm_done)
        require("cmp").event:on("confirm_done", on_confirm_done)
      end)
    end,
  },
}
