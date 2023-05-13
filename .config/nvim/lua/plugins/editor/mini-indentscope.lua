-- https://github.com/echasnovski/mini.indentscope

return {
  "echasnovski/mini.indentscope",
  lazy = true,
  opts = function(_, opts)
    opts.draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    }
    return opts
  end,
}
