-- https://github.com/echasnovski/mini.comment

return {
  "echasnovski/mini.comment",
  lazy = true,
  event = function()
    return { "BufReadPost" }
  end,
}
