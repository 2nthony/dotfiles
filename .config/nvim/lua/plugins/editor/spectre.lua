-- navigation
-- https://github.com/windwp/nvim-spectre

return {
  "windwp/nvim-spectre",
  event = "BufRead",
  keys = function()
    return {}
  end,
  opts = {
    mapping = {
      ["send_to_qf"] = {
        map = "sqf",
      },
    },
  },
}
